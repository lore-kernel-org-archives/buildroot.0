From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 27 Aug 2014 07:52:31 -0500
Subject: [Buildroot] [PATCH v6] bcache-tools: Adding package.
In-Reply-To: <53FD707E.30505@tribudubois.net>
References: <1407514262-18602-1-git-send-email-jcd@tribudubois.net>
 <53E502F0.5060306@tribudubois.net> <53FD707E.30505@tribudubois.net>
Message-ID: <CANQCQpYsO15QJMUahtuZzGoQKCjknK+tGKsrF+ndk_-hDOQHqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

JC,

Currently most of the activity has been working through bug fixes in
the Buildroot 2014.08 release candidate (targeted release date is the
end of the month).  I'm guessing you'll get more feedback early next
month when the "next" branch and any pending patches are worked
through.

On Wed, Aug 27, 2014 at 12:45 AM, Jean-Christophe DUBOIS
<jcd@tribudubois.net> wrote:
> Hi,
>
> It has been few weeks now and I did not receive any more comments.
>
> Is there some more work you are expecting from me or is there any other
> reason this could not be accepted/committed?
>
> Thanks.
>
> JC
>
> Le 08/08/2014 07:03 PM, Jean-Christophe DUBOIS a ?crit :
>>
>> I did not add the Makefile patch for the man8 directory as I agree with
>> Thomas that the bcache-tools package should be modified upstream to allow
>> install without this dir.
>>
>> Meanwhile, we can add the man8 dir which is removed by BR afterward.
>>
>> JC
>>
>> Le 08/08/2014 06:11 PM, Jean-Christophe DUBOIS a ?crit :
>>>
>>> This is the bcache tools, required to setup the linux bcache
>>> feature of the Linux kernel.
>>>
>>> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
>>> ---
>>> Changes v1 to v2
>>>   * Remove 'support' word from comment statement in Config.in.
>>>   * Use github helper to get the project site instead of hardcoded URL.
>>> Changes v2 to v3
>>>   * Added bcache-tools description in Config help.
>>>   * Added bcache-tools URL in Config help.
>>>   * Added BR2_LARGEFILE BR2_USE_WCHAR and BR2_USE_MMU dependencies in
>>> Config.
>>>   * Added BR2_PACKAGE_UTIL_LINUX selection in Config.
>>>   * Added new requirements in Config comment.
>>>   * Use POST_EXTRACT_HOOKS to modify Makefile.
>>>   * Pass $(TARGET_CONFIGURE_OPTS) in env variables to $(MAKE).
>>>   * Create man8 dir as part of PRE_INSTALL_TARGET_HOOKS.
>>> Changes v3 to v4
>>>   * Move from .zip file to .tar.gz as download file in .mk file.
>>>   * Use complete git tag as version in .mk file.
>>>   * Remove explicit extract rule from .mk file (use implicite rule).
>>> Changes v4 to v5
>>>   * Remove explicit package name in .mk (rely on default behavior).
>>> Changes v5 to v6
>>>   * Switch spaces to tabs in Config.in
>>>   * Don't patch Makefile for pkg-config in .mk file.
>>> ---
>>>   package/Config.in                    |  1 +
>>>   package/bcache-tools/Config.in       | 22 ++++++++++++++++++++++
>>>   package/bcache-tools/bcache-tools.mk | 31
>>> +++++++++++++++++++++++++++++++
>>>   3 files changed, 54 insertions(+)
>>>   create mode 100644 package/bcache-tools/Config.in
>>>   create mode 100644 package/bcache-tools/bcache-tools.mk
>>>
>>> diff --git a/package/Config.in b/package/Config.in
>>> index 4520ba6..dc2f418 100644
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -280,6 +280,7 @@ endmenu
>>>       source "package/a10disp/Config.in"
>>>       source "package/acpid/Config.in"
>>>       source "package/avrdude/Config.in"
>>> +    source "package/bcache-tools/Config.in"
>>>       source "package/cdrkit/Config.in"
>>>       source "package/cryptsetup/Config.in"
>>>       source "package/cwiid/Config.in"
>>> diff --git a/package/bcache-tools/Config.in
>>> b/package/bcache-tools/Config.in
>>> new file mode 100644
>>> index 0000000..a3f7897
>>> --- /dev/null
>>> +++ b/package/bcache-tools/Config.in
>>> @@ -0,0 +1,22 @@
>>> +config BR2_PACKAGE_BCACHE_TOOLS
>>> +    bool "bcache tools"
>>> +    depends on BR2_PACKAGE_HAS_UDEV
>>> +    depends on BR2_LARGEFILE # util-linux
>>> +    depends on BR2_USE_WCHAR # util-linux
>>> +    depends on BR2_USE_MMU # util-linux (libblkid)
>>> +    select BR2_PACKAGE_UTIL_LINUX
>>> +    select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>>> +    select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>>> +    help
>>> +      Bcache is a Linux kernel block layer cache. It allows one or
>>> +      more fast disk drives such as flash-based solid state drives
>>> (SSDs)
>>> +      to act as a cache for one or more slower hard disk drives.
>>> +
>>> +      http://bcache.evilpiepirate.org/
>>> +
>>> +      This is the user space bcache tools, required to setup the linux
>>> +      bcache feature of the Linux kernel.
>>> +
>>> +comment "bcache-tools needs udev /dev management and a toolchain w/
>>> largefile, wchar"
>>> +    depends on BR2_USE_MMU
>>> +    depends on !BR2_PACKAGE_HAS_UDEV || !BR2_LARGEFILE || !BR2_USE_WCHAR
>>> diff --git a/package/bcache-tools/bcache-tools.mk
>>> b/package/bcache-tools/bcache-tools.mk
>>> new file mode 100644
>>> index 0000000..880bf5e
>>> --- /dev/null
>>> +++ b/package/bcache-tools/bcache-tools.mk
>>> @@ -0,0 +1,31 @@
>>>
>>> +################################################################################
>>> +#
>>> +# bcache-tools
>>> +#
>>>
>>> +################################################################################
>>> +
>>> +BCACHE_TOOLS_VERSION = v1.0.7
>>> +BCACHE_TOOLS_SITE = $(call
>>> github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
>>> +BCACHE_TOOLS_LICENSE = GPLv2
>>> +BCACHE_TOOLS_LICENSE_FILES = COPYING
>>> +BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev
>>> +
>>> +# We pass $(TARGET_CONFIGURE_OPTS) as environment variable to allow
>>> +# the bcache-tools Makefile to alter CFLAGS
>>> +define BCACHE_TOOLS_BUILD_CMDS
>>> +    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>>> +endef
>>> +
>>> +# The bcache-tools Makefile expects the man8 directory to exist.
>>> +define BCACHE_TOOLS_INSTALL_MAN8
>>> +    $(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
>>> +endef
>>> +
>>> +BCACHE_TOOLS_PRE_INSTALL_TARGET_HOOKS += BCACHE_TOOLS_INSTALL_MAN8
>>> +
>>> +define BCACHE_TOOLS_INSTALL_TARGET_CMDS
>>> +    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
>>> +        DESTDIR=$(TARGET_DIR) install
>>> +endef
>>> +
>>> +$(eval $(generic-package))
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
