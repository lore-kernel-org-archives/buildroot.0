From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 21:07:37 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce
 foo-show-info
In-Reply-To: <20190413171720.GM2539@scaer>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
 <2e6876e6-3098-44ee-11b5-f8b900d3b2ee@mind.be> <20190413171720.GM2539@scaer>
Message-ID: <c34bda77-cc2b-652f-f5f6-371e1b61d586@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/04/2019 19:17, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2019-04-13 10:58 +0200, Arnout Vandecappelle spake thusly:
[snip]
>> * The null in the downloads list is really silly, and makes life difficult for
>> the user because it has to be filtered out again (cfr. Thomas's PoC jq script).
>> So it really has to go.
> 
> I'll try to see how it can be done with your sugestion below. Not that I
> find the code nice, though...

 True. But here, I think niceness of the user-visible output trumps niceness of
the implementation.


>> * I think the structure should always be completely the same. So a virtual
>> package should still have version: "", licenses: "", downloads: []. This again
>> makes it easier to process things.
> 
> I really wondered about that one. But to me, it does not make sense that
> a virtual package has a license or a version: it is virtual... Yet, there
> might be a point in having that information however, because, apart from
> being virtual, they actually *can* install things in the target (or host
> or staging).
> 
> But then, what about filesystems? Semantically, it does not make sense
> at all to have a license or a version for them...

 So, the reason I like to have the same structure everywhere is Python, which
gives you KeyError rather than None when a key isn't present in the dict. Thus,
a simple filter like this will give an exception:

[p for p in pkginfo if "GPL" in p["licenses"]]

 But maybe I'm making too big a deal of this, since it can just be written as:

[p for p in pkginfo if "GPL" in p.get("licenses","")]


[snip]
>> * I absolutely hate these per-package rules. I also don't think it would behave
>> correctly: I would expect 'make {foo,bar}-show-info' to output JSON, but it
>> doesn't (as you note for the show-recursive-info). So I think we should just
>> have a top-level show-info, which uses _FINAL_RECURSIVE_DEPENDENCIES to iterate
>> over all packages (note that that variable would have to be added for rootfs as
>> well). If we want to support selecting a subset of packages, we could add
>> something like the VARS of printvars.
> 
> It would certainly simplify things a little bit... But I do like to keep
> the per-package rules consistent each with the others:
>     foo-build
>     foo-install
>     foo-reconfigure
>     foo-legal-info
>     foo-show-info
> 
> So, I'll at least keep foo-show-info, but will ditch the recursive one.

 As I wrote, I don't like foo-show-info since it gives different output than
show-info (a single dict rather than a list of dicts) and it doesn't output
valid JSON when multiple packages are requested simultaneously (which would be a
pretty typical use case I expect). Still, no big deal.


>> * I have a vague feeling that the _SHOW_INFO variable looks ugly, but I can't
>> put my finger on it what makes it ugly (or how it could be better).
> 
> I honestly ca'tn see uglyness in that one.

 My first reaction was "this doesn't look like Buildroot code". But I think
maybe it's just because it's JSON, and it doesn't look at all anymore like our
normal formatting.

> _SHOW_INFO_DETAILS, which is
> conditional, is indeed not nice because of the conditional block...
> 
> But really, I don't see a better solution.
[snip]
>>> +					$$(call DOWNLOAD_URIS,$$(dl),$(2))
>>> +				)
>>> +			)
>>> +			]
>>> +		},
>>> +	)
>>
>>  I think you might be able to get rid of the null like this:
>>
>> 	$$(subst }{,}$$(comma){,
>> 		$$(foreach dl,$$($(2)_ALL_DOWNLOADS),{
>> 			...
>> 		})
>>
>>  Ugly, I know :-)
> 
> And then you fond that the _SHOW_INFO variable is ugly, and you want me
> to add more uglyness to it? Meh! ;-)
> 
> But yes, your subst trick is interesting.

 Might warrant making a function for it, like make-comma-list.

> 
>>> +	null
>>> +	],
>>> +endef
>>> +endif
>>> +
>>> +define $(2)_SHOW_INFO
>>> +	"name": "$(1)",
>>> +	"type": "$(4)",
>>> +	$$($(2)_SHOW_INFO_VIRTUAL)
>>> +	"depends on": [
>>> +		$$(call make-comma-list,$$($(2)_FINAL_ALL_DEPENDENCIES))
>>> +	],
>>> +	"dependency of": [
>>> +		$$(call make-comma-list,$$($(2)_RDEPENDENCIES))
>>> +	]
>>> +endef
>>
>>  Maybe it would be better to make this a function (defined outside of
>> inner-generic-package) rather than a per-package variable.
> 
> Good idea, indeed.

 That's not going to fly with the condition on virtual, though. That one you
can't easily put in a function. And if you anyway have _SHOW_INFO_VIRTUAL, you
can just as well have _SHOW_INFO as well. Remove the special casing of virtual,
I say! :-)


 Regards,
 Arnout


>>> +$(1)-show-info:
>>> +	@:
>>> +	$$(info { $$(strip $$($(2)_SHOW_INFO)) })$$($(2)_ALL_DOWNLOADS),
>>
>>  So here you'd use
>>
>> 	$$(info { $$(strip $$(call show-info,$(1),$(2))) })
> 
> Right.
> 
> Regards,
> Yann E. MORIN.
> 
