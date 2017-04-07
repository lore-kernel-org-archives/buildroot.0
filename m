From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 12:30:46 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170404185928.GA3828@scaer>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be> <20170404185928.GA3828@scaer>
Message-ID: <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-04-17 20:59, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-04-03 12:10 +0200, Arnout Vandecappelle spake thusly:
>> On 02-04-17 15:03, Yann E. MORIN wrote:
[snip]
>>> +$(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
>>> +	$$(info $(1))
>>> +
>>
>>  I don't like this...
>>
>>  IMO we already have way too many of these informational targets messing up
>> pkg-generic.mk. This is bad for two reasons:
>>
>> - it makes the code more complicated, more difficult to understand what's going
>> on int pkg-generic.mk;
>>
>> - it's bad for performance. This adds 2000 rules to the make rules database,
>> which makes the dependency resolution slower (even if this rule is not used).
>> Just this one extra rule doesn't make much of a difference, but it's all these
>> extra rules that we've added over the years combined that make it slower. That
>> said, there is probably some refactoring that could be done to make it less bad,
>> so it's not too big of a factor.
> 
> Timing the run before/after this change does not yield a noticeable
> difference

 As I wrote: "Just this one extra rule doesn't make much of a difference".
However, we have about a dozen rules like this, and added together they *do*
make a noticable difference (I did a much less thorough benchmark; after
removing all these one-shot rules that are not used in a normal build, a 'make
-qp >/dev/null' became about 15% faster).



> , tested with:
> 
>     $ for((i=0;i<50;i++)); do
>         /usr/bin/time make CMD 2>&1 >/dev/null |head -n 1

 What I'm interested in is the overhead of running make. We unfortunately don't
have a good target for that. 'make -q' after finishing a build is a nice
approximation because it doesn't actually run the target-finalize step (as
opposed to just 'make'). I usually use 'make -qp' because that's what's used by
bash-completion and that is one of my big annoyances: accidentally typing
TAB-TAB freezes the shell for almost 10 seconds.

 'make help' isn't a bad approximation either. It doesn't evaluate the .stamp_*
files so it will be a bit faster than the real overhead.


 Now, I repeat: adding this single thing is not a big deal. I just say we have
to be careful about adding things all the time that slow things down. We are
very quickly approaching the speed of bitbake, and that is one of the main
reasons I spit out OE the first time I used it...

>     done
> 
> with CMD = help, before and after the patch, and then with
> CMD = show-build-order (obviously, after the patch), and using the
> 'user' part of the timings:
> 
> 
>                     Help, before    Help, after     Build order
> Mean                2.9612          2.9934          2.9716

 So, 1% slower. That's actually worse than I expected, but consistent with the
15% I measured after removing 15 similar targets.

[snip]
>>  But I wonder why you need this feature anyway. If you just build, you see the
>> build order as well, right?
> 
> Oh yeah, and I pay the price of a three-hour build, jsut to see the
> build order...
> 
>> And if you don't want to see the actual build, you
>> can do 'make -nk'.
> 
> I hope you were kidding? For a config with 227 packages, this yields:
> 
>     $ make -nk 2>&1 |wc -l
>     8459
> 
> And I'm not doing the statistical analysis I did above, but a few runs
> give a runtime of ~5s. So it is a 66% overhead just for this, while the
> new rules add just about 1% overhead (30ms for 3s).
> 
> Plus, it requires non-trivial post-processing... :-(

TERM=dumb make -nk 2>/dev/null | grep 'Configuring"' | cut -d ' ' -f 3-4

 True, it's not trivial. But it's shorter than your patch :-) And indeed it's 4
times slower than 'make build-order'. But that's just 12 seconds for an
allyesconfig. Is that really too much?

 However, it turns out not to work :-( Any rule which contains $(MAKE) is still
going to be executed, and that will inevitably lead to errors, so any package
that depends on a package that errors out will also not be executed.

 So, I can think of no viable alternative, so there is no way to stop this patch :-)


>> OK, it looks a lot nicer with this show-build-order target,
>> but I wouldn't say it's very valuable.
> 
> Well, I've been tracking build-order issues for a while last WE, and
> believe me, I was very happy to be able to see the build order before
> I attempted a build, yes.

 That's my biggest problem with this feature: I have no idea how to use it.
Could you add some explanation somewhere?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
