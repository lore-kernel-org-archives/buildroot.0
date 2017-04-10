From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 11:28:57 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170407192458.GA3420@scaer>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be> <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be> <20170407192458.GA3420@scaer>
Message-ID: <4fef5a6f-15d2-73f6-c759-2887255c987d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-04-17 21:24, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-04-07 12:30 +0200, Arnout Vandecappelle spake thusly:
>> On 04-04-17 20:59, Yann E. MORIN wrote:
>>>> - it's bad for performance. This adds 2000 rules to the make rules database,
>>>> which makes the dependency resolution slower (even if this rule is not used).
>>>> Just this one extra rule doesn't make much of a difference, but it's all these
>>>> extra rules that we've added over the years combined that make it slower. That
>>>> said, there is probably some refactoring that could be done to make it less bad,
>>>> so it's not too big of a factor.
>>>
>>> Timing the run before/after this change does not yield a noticeable
>>> difference
>>
>>  As I wrote: "Just this one extra rule doesn't make much of a difference".
>> However, we have about a dozen rules like this, and added together they *do*
>> make a noticable difference (I did a much less thorough benchmark; after
>> removing all these one-shot rules that are not used in a normal build, a 'make
>> -qp >/dev/null' became about 15% faster).
> 
> OK, adding features makes the stuff slower; that I do understand.
> 
> However, what I argue is that the overhead added by that one extra rule
> is negligible, relatively to the existing startup time.

 Indeed, which is why I gave the patch my Reviewed-by.

 My point is: we should be conservative about adding new per-package rules like
this. A single addition has negligible effect, but added together they do have
an impact and they're turning us into bitbake.
[snip]
>>  Now, I repeat: adding this single thing is not a big deal. I just say we have
>> to be careful about adding things all the time that slow things down. We are
>> very quickly approaching the speed of bitbake, and that is one of the main
>> reasons I spit out OE the first time I used it...
> 
> Eh... The startup tiem is annoying, but it is not awfull. Yet. Howeber,
> in my (arguably limited) experience of OE, the build time was much
> longer overall for a similar setup. So we still win AFAICS...
> 
> The only thing that would be a killer feature is TLPB (as long as it
> yields a correct build, of course).

 In my experience, there are two big reasons why an OE build is much slower:

1. A typical configuration is much bigger (more packages selected).

2. They do per-package staging in order to enable TLPB.

 We still win on point 1, but since we're going towards PPS (and host and target
too), we're going to loose our advantage on point 2. Well, not entirely, because
IIUC they have a pretty inefficient way of building the PPS so we might do better.


> 
>>>> And if you don't want to see the actual build, you
>>>> can do 'make -nk'.
> [--SNIP--]
>>> Plus, it requires non-trivial post-processing... :-(
>> TERM=dumb make -nk 2>/dev/null | grep 'Configuring"' | cut -d ' ' -f 3-4
>>
>>  True, it's not trivial. But it's shorter than your patch :-) And indeed it's 4
>> times slower than 'make build-order'. But that's just 12 seconds for an
>> allyesconfig. Is that really too much?
>>
>>  However, it turns out not to work :-( Any rule which contains $(MAKE) is still
>> going to be executed, and that will inevitably lead to errors, so any package
>> that depends on a package that errors out will also not be executed.
>>
>>  So, I can think of no viable alternative, so there is no way to stop this patch :-)
> 
> What about the following (just proof-of-concept):
[pasted correct version]
> diff --git a/Makefile b/Makefile
> index 919d589..a1540fc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -759,6 +759,14 @@ show-targets:
> 
>  show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
> 
> +define show-build-order-deps
> +	$(foreach p,$($(call UPPERCASE,$(1))_FINAL_ALL_DEPENDENCIES),\
> +		$(call show-build-order-deps-deps,$(p))) $(1)
> +endef
> +
> +show-build-order-2:
> +	@./toto $(foreach p,$(PACKAGES),$(call show-build-order-deps-deps,$(p)))
> +
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(GRAPHS_DIR)
>  	$(foreach o,name build duration,./support/scripts/graph-build-time \
> diff --git a/toto b/toto
> new file mode 100755
> index 0000000..6962083
> --- /dev/null
> +++ b/toto
> @@ -0,0 +1,30 @@
> +#!/bin/bash
> +
> +# input on stdin: list of packages, each rpreceded by its
> +# direct dependencies; so, packages may be listed more than
> +# once, but at least the build order is gurranteed for the
> +# first occurence of each package.
> +
> +# We first output each item of the list on its own line.
> +# Then we number those lines.
> +# We sort by package name as first key, and on line number
> +# as second key.
> +# For each package, we keep only the first occurence, which
> +# is the one with the lowest line number.
> +# We re-sort on the line number.
> +# And eventually, we remove the line number and only keep
> +# the package name.
> +
> +# The output is thus the build order.
> +
> +printf "%s\n" "${@}"
> +|cat -n \
> +|sort -k 2,2 -k 1,1n \
> +|while read n p; do
> +    if [ "${p}" != "${prev}" ]; then
> +        printf "%d %s\n" "${n}" "${p}"
> +        prev="${p}"
> +    fi
> +done \
> +|sort -n \
> +|sed -r -e 's/^[[:digit:]]+ //'

 OK, my first and main reason to reject the patch was that it made the code more
complicated. That bit is even worse (by an order of magnitude) in this proposal.

> 
> This has the advantage that it adds a single rule, and the price of
> expansion is paid only when the rule is actually called.
> 
> Plus, the runtime is not worse than my initial solution.
> 
>>>> OK, it looks a lot nicer with this show-build-order target,
>>>> but I wouldn't say it's very valuable.
>>>
>>> Well, I've been tracking build-order issues for a while last WE, and
>>> believe me, I was very happy to be able to see the build order before
>>> I attempted a build, yes.
>>
>>  That's my biggest problem with this feature: I have no idea how to use it.
>> Could you add some explanation somewhere?
> 
> I hope the explanations from Thomas are enough? ;-)

 Yep, as I replied to him: please add that to the commit message while applying.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
