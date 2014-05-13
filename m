From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 13 May 2014 12:59:44 +0200
Subject: [Buildroot] [PATCH 1 of 7 v2] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <5371E50C.7010606@mind.be>
References: <patchbomb.1399905848@argentina>
 <a0eab18241e211343bfa.1399905849@argentina>
 <5371E50C.7010606@mind.be>
Message-ID: <CAAXf6LUCdmyg7JAm-W+n+gtHgACCZ5dYRW95CQQB-R3MA9264A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, May 13, 2014 at 11:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Thomas,
>
>  Thanks for taking upon you this gruelling task :-)

Thanks for the review!

>
> On 12/05/14 16:44, Thomas De Schampheleire wrote:
[..]
>>
>> Note: in addition to using 'make printvars' to verify this patch, a 'make
>> randpackageconfig' was performed successfully.
>
>  Perhaps you should do a 'make manual' as well.

Will do (I did it already, but did not diffed the output with the orig
version, it just 'looked' ok).

>
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -54,16 +54,16 @@ define GENDOC_INNER
>
>  I would add a brief comment in the beginning of GENDOC_INNER:
>
> # Since this function will be called from within an $(eval ...)
> # all variable references except the arguments must be $$-quoted.
>

Ok (same for similar comments below)

[..]

>>
>> +ifeq ($$(origin $(2)_AUTORECONF_OPT),undefined)
>> + $(2)_AUTORECONF_OPT := $$($(3)_AUTORECONF_OPT)
>> +endif
>> +
>>  $(2)_CONF_ENV                        ?=
>>  $(2)_CONF_OPT                        ?=
>>  $(2)_MAKE_ENV                        ?=
>>  $(2)_MAKE_OPT                        ?=
>> -$(2)_AUTORECONF_OPT          ?= $($(3)_AUTORECONF_OPT)
>
>  Wouldn't it be clearer to keep this as a ?= but put it inside an
> ifeq ($(4),host) ? I haven't tested whether that works, however.

It's probably clearer (if it works, to test).
But then all of the 'use-target-var-if-host-var-is-not-provided' could
be reworked using this same mechanism, and make the entire inner
target more clear, right?

[..]

>>
>> -autotools-package = $(call inner-autotools-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
>> -host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>> +autotools-package = $(call inner-autotools-package,$(pkgname),$$(call UPPERCASE,$(pkgname)),$$(call UPPERCASE,$(pkgname)),target)
>> +host-autotools-package = $(call inner-autotools-package,host-$(pkgname),$$(call UPPERCASE,host-$(pkgname)),$$(call UPPERCASE,$(pkgname)),host)
>
>  The reason not to double-$ $(pkgname) is not that it doesn't work (at least it
> works for me with printvars), but that it increases the make parsing time with a
> factor four (because $(pkgname) gets evaluated very often).

I don't agree, in my test it does _not_ work correctly with $$(pkgname).
If I make that change in pkg-generic, and try to build busybox, I get
as build log output:

tdescham at argentina ~/repo/contrib/buildroot-misc $ make busybox-dirclean busybox
rm -Rf /home/tdescham/repo/contrib/buildroot-misc/output/build/busybox-1.22.1
>>>   Extracting
>>>   Patching
>>>   Configuring
>>>   Building
>>>   Installing to target

(so without the correct pkgname) and no actual steps are performed.

>
>  IMHO, mixing $ and $$ doesn't make things clearer. Therefore, I would leave
> everything single-$ here and add a comment
>
> # Using $$ for $(pkgname) is bad for performance because it is evaluated so
> # often. Therefore, we use single $ for the arguments here.
>
> (and same for all other outer functions).

So according to me this comment is not correct.
I do agree that the mixing is not more clear than using single $ in
the outer functions, but it is less consistent with the general rules.
I have no strong opinion on what to do here.

[..]

>>
>> @@ -102,11 +104,11 @@ endif
>>  ifndef $(2)_BUILD_CMDS
>>  ifeq ($(4),target)
>>  define $(2)_BUILD_CMDS
>> -     $(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
>> +     $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_MAKE_OPT) -C $$($$(PKG)_BUILDDIR)
>
>  Unrelated to this patch, does anyone know why we use $(PKG) here instead of $(2) ?

In pkg-generic.mk, the targets are _outside_ the
inner-generic-targets. Therefore $(2) is not available. For this
reason, PKG is set to $(2) in the context of these rules.
In the other package infrastructures, this principle is not used: the
targets are inside the inner target, so both PKG and $(2) could be
used.
My assumption is that this is due to copy/paste.

[..]

>>  # kernel case, the bootloaders case, and the normal packages case.
>>  ifeq ($(1),linux)
>>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
>> -else ifneq ($(filter boot/%,$(pkgdir)),)
>> +else ifneq ($$(filter boot/%,$(pkgdir)),)
>
>  $$(pkgdir) works fine here. Also, it gets evaluated only once anyway, so
> there's no speedup from using a single $.
>

What to do here given the fact that speedup is not the only issue?

[..]

>>  # legal-info: produce legally relevant info.
>>  $(1)-legal-info:
>
>  Have you also tested a 'make legal-info'? This whole thing is rather fragile so
> we may easily miss something by just reviewing. Also, printvars doesn't show the
> contents of this rule (because it's not a variable). 'make -qp' does, however,
> so that would also be a good check (it may reorder things, though, so it may not
> be easy to diff).

I ran it, and output seemed ok, but I should actually diff the output
with a known-good one to be 100% sure.
I will do that.

[..]

>>  else
>>  # Double dollar signs are really needed here, to catch host packages
>>  # without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
>>  # have multiple license files.
>
>  I think you can remove this comment now :-)

OK.

[..]

>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -19,13 +19,13 @@
>>  define caseconvert-helper
>>  $(1) = $$(strip \
>>       $$(eval __tmp := $$(1))\
>> -     $(foreach c, $(2),\
>> -             $$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
>> +     $$(foreach c, $(2),\
>> +             $$(eval __tmp := $$(subst $$(word 1,$$(subst :, ,$$(c))),$$(word 2,$$(subst :, ,$$(c))),$$(__tmp))))\
>>       $$(__tmp))
>>  endef
>>
>> -$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
>> -$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
>> +$(eval $(call caseconvert-helper,UPPERCASE,$$(join $$(addsuffix :,$$([FROM])),$$([TO]))))
>> +$(eval $(call caseconvert-helper,LOWERCASE,$$(join $$(addsuffix :,$$([TO])),$$([FROM]))))
>
>  Actually, here the single $-es are intentional. It is chosen in order to
> maximize the speed-up, that's why you see this counter-intuitive mix of $ and
> $$. Maybe you can extend the comment above a little to explain that a little
> better. Or I can do that as well if you prefer.

If you could write a suitable comment explaining it, that would be
great, as I don't know the ins and outs of this helper.



Best regards,
 Thomas
