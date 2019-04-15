From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 19:51:06 +0200
Subject: [Buildroot] [PATCH 09/12 v2] core: introduce new global
 show-info
In-Reply-To: <20190415173457.GT2539@scaer>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
 <e0509e7ca0439176b7f483afb7436bb85c4fbed3.1555273025.git.yann.morin.1998@free.fr>
 <357abbd3-e69f-1756-2112-587e9e8c850e@mind.be> <20190415173457.GT2539@scaer>
Message-ID: <c45d8e34-997b-0bfd-30be-4c7d9eb675cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 19:34, Yann E. MORIN wrote:
[snip]
>>> +	"$($(1)_NAME)": {
>>> +		"type": "$($(1)_TYPE)",
>>
>>  I may be exaggerating here, but I am getting a bit confused between commas that
>> are intrepreted by make and the JSON commas. Maybe we should consistently use
>> $(comma) for the commas that go into the output, even if it is not needed like here?
> 
> This is a macro definition, not a macro call, so commas are not
> interpreted.

 I know, of course. My point is that it is not immediately apparent. My mind is
jumbling the JSON separators and the macro call separators together. My thought
was: if we use $(comma) everywhere to mark the JSON separators, things might
become more readable.

 In fact, in the part you snipped, one line lower there is a macro-separator:

		"type": "$($(1)_TYPE)",
		$(if $(filter rootfs,$($(1)_TYPE)),

 You see where I'm coming from?

 Now, I can imagine that sprinkling this code with $(comma)s is not going to
help readability one bit. But I thought I'd just float the idea.

> 
>>> +# _show-info-pkg, _show-info-pkg-details, _show-info-fs: private helpers
>>> +# for show-info, above
>>> +define _show-info-pkg
>>> +	$(if $($(1)_IS_VIRTUAL), \
>>> +		"virtual": true$(comma),
>>
>>  Again, I may be exaggerating, but I would find it more aesthetically pleasing
>> to put the
>> 		"virtual": false$(comma)
>> here rather than in the pkg-details.
> 
> Can doo, OK.
> 
> Also, since that would be the else-clause of the if, the folowing commas
> would *not* be interpreted as separators of the if clause. E.g.:
> 
>     all:
>         @: $(info $(if ,ignored,shown, too))
> 
> would print:
> 
>     shown, too
> 
> Yet, it looks hackish to do so...

 No shit.

[snip]
>>> +#  - remove commas before closing ] and }
>>> +#  - minify with $(strip)
>>> +clean-json = $(strip \
>>  Why strip a second time?
> 
> First is to eliminate new lines and duplicate spaces, second is to
> remove duplicate spaces and newlines introduced by the macro itself.
> Try without either, it is not pretty... ;-)

 Of course, the macro itself inserts additional newlines, I forgot about that.


>>> +	$(subst $(comma)},, \
>>                           ^}
> 
> This is the part I lost during a borked rebase. :-(
> 
>>> +		$(subst $(comma)$(space)},$(space)}, \
>>> +			$(subst $(comma)],, \
>>                                           ^]
> 
> Ditto.
> 
>>> +				$(subst $(comma)$(space)],$(space)], \
>>> +					{ $(strip $(1)) } \
>>> +				) \
>>
>>  Even though incorrect, I think this would be more readable and maintainable by
>> not indenting the nested subst's:
>>
>> 	$(subst $(comma)},},
>> 	$(subst $(comma)],],
>> 	$(subst $(comma)$(space)},$(space)},
>> 	$(subst $(comma)$(space)],$(space)],
>> 		$(strip $(1))
>> 	))))
> 
> Ah, I was not sure this would be appropriate to do so. I even thought of
> doing:
> 
>     clean-json = $(strip \
>         $(subst $(comma)},}, $(subst $(comma)$(space)},$(space)},
>         $(subst $(comma)],], $(subst $(comma)$(space)],$(space)], \
>             $(strip $(1)) \
>         )))) \
>     )

 It's up to you, really. Same as for the $(comma) thing: you can decide what
looks best for you and I'll accept it.

 Regards,
 Arnout
