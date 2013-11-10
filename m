From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Nov 2013 22:06:16 +0100
Subject: [Buildroot] [PATCH 1 of 3] infra: remove trailing slash from
	pkgparentdir function
In-Reply-To: <527C2F22.1050308@mind.be>
References: <patchbomb.1383841610@argentina>
 <cc1dc749ee6ca65ff90c.1383841611@argentina> <527C2F22.1050308@mind.be>
Message-ID: <0f040cce-5035-4cc3-b90d-43e6d32685a8@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote:
>On 07/11/13 17:26, Thomas De Schampheleire wrote:
>> For a package located in package/foo/foo.mk, the pkgparentdir function
>> returns "package/". For a package located in boot/barebox/barebox.mk, it
>> returns "boot/". For linux/linux.mk, it returns the empty string.
>>
>> There is actually no reason for the trailing slash in this function.
>> In the package 'Patching' message, it causes a double slash:
>>>>> host-lzop 1.03 Patching package//lzop
>> due to:
>> @$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>> (FOO_DIR_PREFIX is populated from pkgparentdir)
>>
>> While the printing of 'package//lzop' in the message above is not useful,
>> and will be removed in a subsequent following patch, this patch removes
>> the unnecessary trailing slash in pkgparentdir anyhow
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>   package/pkg-generic.mk |  2 +-
>>   package/pkg-utils.mk   |  2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -473,7 +473,7 @@ endif
>>   # kernel case, the bootloaders case, and the normal packages case.
>>   ifeq ($(1),linux)
>>   $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
>> -else ifeq ($(4),boot/)
>> +else ifeq ($(4),boot)
>>   $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
>>   else
>>   $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -52,7 +52,7 @@ endef
>>   # package, for which the package directory is an empty string.
>>   pkgdir       = $(dir $(lastword $(MAKEFILE_LIST)))
>>   pkgname      = $(lastword $(subst /, ,$(call pkgdir)))
>> -pkgparentdir = $(patsubst %$(call pkgname)/,%,$(call pkgdir))
>> +pkgparentdir = $(patsubst %/,%,$(patsubst %$(call pkgname)/,%,$(call pkgdir)))
>
>  I wonder if pkgparentdir is even needed anymore. For most cases, we 
>actually need $(pkgdir). Only for the check against boot/* the parent 
>directory is needed, but that one can be replaced with
>
>else ifneq ($(filter boot/%,$(4)),)
>
>(assuming $(4) is $(pkgdir) instead of $(pkgparentdir)).

I'm on it...

Best regards,
Thomas
