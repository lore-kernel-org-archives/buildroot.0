From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 May 2014 21:33:46 +0200
Subject: [Buildroot] [PATCH 1 of 7 v2] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <CAAXf6LUCdmyg7JAm-W+n+gtHgACCZ5dYRW95CQQB-R3MA9264A@mail.gmail.com>
References: <patchbomb.1399905848@argentina>
 <a0eab18241e211343bfa.1399905849@argentina> <5371E50C.7010606@mind.be>
 <CAAXf6LUCdmyg7JAm-W+n+gtHgACCZ5dYRW95CQQB-R3MA9264A@mail.gmail.com>
Message-ID: <5372739A.30206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/05/14 12:59, Thomas De Schampheleire wrote:
> Hi Arnout,
> 
> On Tue, May 13, 2014 at 11:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Hi Thomas,
>>
>>  Thanks for taking upon you this gruelling task :-)
> 
> Thanks for the review!
> 
>>
>> On 12/05/14 16:44, Thomas De Schampheleire wrote:
> [..]
>>>
>>> Note: in addition to using 'make printvars' to verify this patch, a 'make
>>> randpackageconfig' was performed successfully.
>>
>>  Perhaps you should do a 'make manual' as well.
> 
> Will do (I did it already, but did not diffed the output with the orig
> version, it just 'looked' ok).

 If a PDF is created then I think it'll be OK.

[snip]
>>> +ifeq ($$(origin $(2)_AUTORECONF_OPT),undefined)
>>> + $(2)_AUTORECONF_OPT := $$($(3)_AUTORECONF_OPT)
>>> +endif
>>> +
>>>  $(2)_CONF_ENV                        ?=
>>>  $(2)_CONF_OPT                        ?=
>>>  $(2)_MAKE_ENV                        ?=
>>>  $(2)_MAKE_OPT                        ?=
>>> -$(2)_AUTORECONF_OPT          ?= $($(3)_AUTORECONF_OPT)
>>
>>  Wouldn't it be clearer to keep this as a ?= but put it inside an
>> ifeq ($(4),host) ? I haven't tested whether that works, however.
> 
> It's probably clearer (if it works, to test).
> But then all of the 'use-target-var-if-host-var-is-not-provided' could
> be reworked using this same mechanism, and make the entire inner
> target more clear, right?

 Indeed. However, for those you don't need to change the condition tree in order
to make this $$ change, and you still need both the ifdef $(3) and the ifdef
$(2) parts. So I'm not altogether sure if adding an ifeq($(4),host) is really an
improvement.

> 
> [..]
> 
>>>
>>> -autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
>>> -host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>>> +autotools-package = $(call inner-autotools-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
>>> +host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)
>>
>>  The reason not to double-$ $(pkgname) is not that it doesn't work (at least it
>> works for me with printvars), but that it increases the make parsing time with a
>> factor four (because $(pkgname) gets evaluated very often).
> 
> I don't agree, in my test it does _not_ work correctly with $$(pkgname).

 Strange, I do remember that I tested _something_ and it worked, it was just way
slower.

 Oh, hang on, the first $(pkgname) must not be double-$$-ed because it is used
on the left-hand side of the assignments; the other ones are on the right-hand
side or in conditions or in rules, so there a $$ is possible. In order to be
able to use $$ for the first argument as well, you have to also $$ all the
references to $$(1), $$(2) etc. in inner-generic-package.

> If I make that change in pkg-generic, and try to build busybox, I get
> as build log output:
> 
> tdescham at argentina ~/repo/contrib/buildroot-misc $ make busybox-dirclean busybox
> rm -Rf /home/tdescham/repo/contrib/buildroot-misc/output/build/busybox-1.22.1
>>>>   Extracting
>>>>   Patching
>>>>   Configuring
>>>>   Building
>>>>   Installing to target
> 
> (so without the correct pkgname) and no actual steps are performed.
> 
>>
>>  IMHO, mixing $ and $$ doesn't make things clearer. Therefore, I would leave
>> everything single-$ here and add a comment
>>
>> # Using $$ for $(pkgname) is bad for performance because it is evaluated so
>> # often. Therefore, we use single $ for the arguments here.
>>
>> (and same for all other outer functions).
> 
> So according to me this comment is not correct.

 Yeah, just drop the comment I guess. If we can't give a satisfactory and
correct explanation, it's better not to explain.

> I do agree that the mixing is not more clear than using single $ in
> the outer functions, but it is less consistent with the general rules.
> I have no strong opinion on what to do here.

 I do: since replacing some $ by $$ isn't improving anything, we shouldn't
change it.


[snip]
>>>  # kernel case, the bootloaders case, and the normal packages case.
>>>  ifeq ($(1),linux)
>>>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
>>> -else ifneq ($(filter boot/%,$(pkgdir)),)
>>> +else ifneq ($$(filter boot/%,$(pkgdir)),)
>>
>>  $$(pkgdir) works fine here. Also, it gets evaluated only once anyway, so
>> there's no speedup from using a single $.
>>
> 
> What to do here given the fact that speedup is not the only issue?

 I'd use $$ here as well, so things are consistent. That way, we use $$
everywhere within the inner- macros, except for $(1), $(2), etc.  That's a clear
and simple rule that we can easily use when reviewing future patches.

[snip]

>>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>>> --- a/package/pkg-utils.mk
>>> +++ b/package/pkg-utils.mk
>>> @@ -19,13 +19,13 @@
>>>  define caseconvert-helper
>>>  $(1) = $$(strip \
>>>       $$(eval __tmp := $$(1))\
>>> -     $(foreach c, $(2),\
>>> -             $$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
>>> +     $$(foreach c, $(2),\
>>> +             $$(eval __tmp := $$(subst $$(word 1,$$(subst :, ,$$(c))),$$(word 2,$$(subst :, ,$$(c))),$$(__tmp))))\
>>>       $$(__tmp))
>>>  endef
>>>
>>> -$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
>>> -$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
>>> +$(eval $(call caseconvert-helper,UPPERCASE,$$(join $$(addsuffix :,$$([FROM])),$$([TO]))))
>>> +$(eval $(call caseconvert-helper,LOWERCASE,$$(join $$(addsuffix :,$$([TO])),$$([FROM]))))
>>
>>  Actually, here the single $-es are intentional. It is chosen in order to
>> maximize the speed-up, that's why you see this counter-intuitive mix of $ and
>> $$. Maybe you can extend the comment above a little to explain that a little
>> better. Or I can do that as well if you prefer.
> 
> If you could write a suitable comment explaining it, that would be
> great, as I don't know the ins and outs of this helper.

 I'll do that as a separate patch. Since you won't be touching this file
anymore, it will not conflict.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
