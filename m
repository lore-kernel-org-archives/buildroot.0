From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Nov 2014 14:03:28 +0100
Subject: [Buildroot] [PATCH v2 01/15] package/pkg-autotools.mk:
 Factorize hooks.
In-Reply-To: <20141110221323.GF22119@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-2-git-send-email-johan.oudinet@gmail.com>
 <20141110221323.GF22119@free.fr>
Message-ID: <54620920.5050203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Johan,

 I'm mostly going to negate Yann's comments :-)

 I also have a few additional remarks, but they're not for this patch and
probably not even for you.


On 10/11/14 23:13, Yann E. MORIN wrote:
> Johan, All,
> 
> On 2014-11-07 14:28 +0100, Johan Oudinet spake thusly:
>> Define common macros only once (instead of as many times as
>> there are inner-autotools-package calls).
>> Factorize LIBTOOL_PATCH_HOOK and AUTORECONF_HOOK to avoid duplicated
>> code.
> 
> Sorry it takes so long to review this series. Touching the infra is not
> for the faint of heart, and reviews are really complex and time-consuming.

 _This_ is true...


> 
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
>> ---
>>  package/pkg-autotools.mk | 119 ++++++++++++++++++++++-------------------------
>>  1 file changed, 56 insertions(+), 63 deletions(-)
>>
>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>> index 09f9412..65af6f0 100644
>> --- a/package/pkg-autotools.mk
>> +++ b/package/pkg-autotools.mk
>> @@ -46,6 +46,57 @@ endef
>>  #	$(call AUTOCONF_AC_CHECK_FILE_VAL,/dev/random)=yes
>>  AUTOCONF_AC_CHECK_FILE_VAL = ac_cv_file_$(subst -,_,$(subst /,_,$(subst .,_,$(1))))
>>  
>> +# Recipe that patches libtool so it works properly with
>> +# cross-compilation.
>> +define PATCH_LIBTOOL
>> +	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
>> +		for i in `find $($(PKG)_SRCDIR) -name ltmain.sh`; do \
>> +			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
>> +			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
>> +			if test $${ltmain_version} = 1.5; then \
>> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
>> +			elif test $${ltmain_version} = 2.2; then\
>> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
>> +			elif test $${ltmain_version} = 2.4; then\
>> +				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
>> +			fi \
>> +		done \
>> +	fi
>> +endef
>> +
>> +#
>> +# Hook to update config.sub and config.guess if needed
>> +#
>> +define UPDATE_CONFIG_HOOK
>> +	@$(call MESSAGE,"Updating config.sub and config.guess")
>> +	$(call CONFIG_UPDATE,$(@D))
>> +endef
>> +
>> +#
>> +# Hook to patch libtool to make it work properly for cross-compilation
>> +#
>> +define LIBTOOL_PATCH_HOOK
>> +	@$(call MESSAGE,"Patching libtool")

 This message could be hoisted into PATCH_LIBTOOL itself (or rather,
PATCH_LIBTOOL could be moved down here). It makes total sense to display the
'Patching libtool' message even when autoreconf is done (and actually, currently
it is displayed, just not at the right time).

>> +	$(call PATCH_LIBTOOL)
>> +endef
> 
> Hmm... This patch does nore than extract the definitions out of
> inner-autotools-package; it also reworks the way they are called.
> 
> I'd rather we get this split in at least two patches:
>   - one that does the move proper
>   - one that reworks the calls

 That is true.

> 
> It will be easier to review.
> 
> [--SNIP--]
>> @@ -265,6 +253,11 @@ $(2)_DEPENDENCIES += host-gettext
>>  endif
>>  $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK

 For a separate patch, it would be nice to turn this into

$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
ifneq ($$($(2)_LIBTOOL_PATCH),NO)
$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
endif

and remove the libtool stuff from AUTORECONF_HOOK.

 With that done, the shell condition can be removed from the libtool hook as well.

>>  $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
>> +else
>> +# default values are not evaluated yet, so don't rely on this defaulting to YES
>> +ifneq ($$($(2)_LIBTOOL_PATCH),NO)
>> +$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
>> +endif
>>  endif
> 
> I think you got the order wrong here: we want the libtool patch to be
> applied _before_ we autoreconf.

 No, we don't. We want it to be done after the autoreconf, because autoreconf
generates the libtool scripts.

 In the original, there was a shell condition that evaluates that AUTORECONF is
not YES in the LIBTOOL_PATCH_HOOK. So you would get the message that libtool is
patched before the autoreconf, but the actual patching only happens after the
reconf.



 Regards,
 Arnout

> 
> So, this last if-block should be the very first thing to do right after:
>     ifeq ($$($(2)_AUTORECONF),YES)
> 
> I'll do some more in-depth review later, presumably after you split the
> patch. If you don;t have time for that, I can see to get it done
> tomorrow.
> 
> Again, sorry for the delay, reviewing infra changes is really tricky...
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
