From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 22 Dec 2017 10:44:57 +0100
Subject: [Buildroot] [PATCH] linux-tools: add usbip (USB/IP userspace
 tools)
In-Reply-To: <20171214215930.GA3389@scaer>
References: <1512566955-4712-1-git-send-email-julien.boibessot@free.fr>
 <20171214095614.5e99e0a0@windsurf.png.is.keysight.com>
 <20171214215930.GA3389@scaer>
Message-ID: <7727bdc1-a70c-28f9-8d58-39209af25c53@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann, Thomas, Peter,

thanks for review !

On 14/12/2017 22:59, Yann E. MORIN wrote:
> Julien, All,
>
> On 2017-12-14 09:56 +0100, Thomas Petazzoni spake thusly:
>> +Yann in Cc, as I'd really like to have his feedback on this patch.
> Ah, yep, I'd have expected to be in Cc: for the patch. ;-)

Yeap sorry, next version, I promise.

>
>> Title should be just:
>>
>> 	"linux-tools: add support for usbip"
>>
>> On Wed,  6 Dec 2017 14:29:15 +0100, julien.boibessot at free.fr wrote:
>>> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>>>
>>> I did this work before knowing the existence of previous attempts:
>> Please don't use first person sentences in commit logs.
> Usually, use 'we' instead, like;
>
>     We use the git version becasue blabla...
>     Autoreconf does not work, so we trick it into believing it
>     has been autoreconf by blabla...
>
> However, if you have a "personal" message (like what you write), you can
> keep speaking with 'I' but put it below the --- line (which marks the
> end of the commit message, and that git-am will ignore when the patch is
> applied). See for example:
>     https://patchwork.ozlabs.org/patch/843728/
>
>>> * 12/2012: http://lists.busybox.net/pipermail/buildroot/2012-December/064070.html
>>> * 12/2016: http://buildroot-busybox.2317881.n4.nabble.com/PATCH-usbip-add-a-new-package-td152317.html
> I find it interesting that your referenced the prior art on this, and it
> is defeintely something that I'd like to see below the ---.
>
> [--SNIP--]
>>> 47 builds, 19 skipped, 0 build failed, 0 legal-info failed
>> Does it makes sense to include the test-pkg details in the commit log?
>> This is a real open question. We don't do it today, but I might see
>> some value in having it. What do others think ?
> If everything is workih as expected, then no, except maybe a note like
> "the defconfig below builds with test-pkg with no error".
>
>>> diff --git a/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional b/linux/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional
>> I'm wondering if those two patches should be in linux/ or in
>> package/linux-tools/. Not sure.
> If they go into linux-tools, they won;t be applied because linux-tools
> does not have a source. Rather, they piggyback onto hte kernel
> sources and build directly in $(LINUX_DIR).
>
> Yes, that's is ugly and a special case I'm investigating for OOT. And
> maybe something you'll also want to keep an eye on for TLPB as well...
>
>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>> index bd5589b..8877a7b 100644
>>> --- a/linux/linux.mk
>>> +++ b/linux/linux.mk
>>> @@ -221,6 +221,24 @@ define LINUX_TRY_PATCH_TIMECONST
>>>  endef
>>>  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
>>>  
>>> +# Fixes tools/usbip build with recent gcc when -Werror is used
>>> +# Try a dry-run patch to see if this applies, if it does go ahead
>>> +define LINUX_TRY_PATCH_USBIP_GCC
>>> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional >/dev/null ; then \
>>> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0002-tools-usbip-fixes-potential-minor-buffer-overflow-de.patch.conditional ; \
>>> +	fi
>>> +endef
>>> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_GCC
>>> +
>>> +# Fixes tools/usbip build with musl toolchains
>>> +# Try a dry-run patch to see if this applies, if it does go ahead
>>> +define LINUX_TRY_PATCH_USBIP_MUSL
>>> +	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional >/dev/null ; then \
>>> +		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0003-tools-usbip-fixes-build-with-musl-libc-toolchain.patch.conditional ; \
>>> +	fi
>>> +endef
>>> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_USBIP_MUSL
>> Should we have this logic in linux/linux.mk, or in
>> package/linux-tools/linux-tool-usbip.mk.in, possibly via some
>> additional extension of the linux-tools infrastructure to register some
>> patches to be applied ?
> One would argue that those are the source of the kernel tree, so the
> tweaks belong to linux.mk.
>
> OTOH, we are fixing usbip, which is built by the linux-tools package.

For your information, my patches have been accepted by Greg KH for next
Linux version.

>
>> Again, not sure, I'm just thinking out loud.
> I'm not covinced either way, but to be pragmatic, I'd keep those in
> linux.mk.
>
>> Since this "let's try to apply a patch, but it fails don't error out"
>> logic is now duplicated three times, perhaps it calls for a
>> TRY_APPLY_PATCHES function, or something like that ?
> Yep. Julien, would you volunteer? ;-)

I will have a look at it between turkey and foie gras ;-)

>
>>> +	  This (usbip) is the set of userspace tools used to handle connection
>>> +	  and management.
>>> +
>>> +	  You can optionally add hwdata package to your BR config to have
>>> +	  better runtime experience.
>> BR -> Buildroot
>> config -> configuration
>>
>> "better runtime experience" is somewhat fuzzy. Can we have a better
>> description ?
> If the exprience is "so much better", why don't we forcibly select it?
> Is it only because hwdata is big?

yes, hwdata is big. "better experience" means you see vendors/devices
real names and not USB VID/PID. Moreover hwdata install PCI and USB
infos and PCI is not needed in that case.

>
> [--SNIP--]
>>> +	cd $(LINUX_DIR)/tools/usb/usbip && rm -rf config.cache && \
>>> +		$(TARGET_CONFIGURE_OPTS) \
>>> +		$(TARGET_CONFIGURE_ARGS) \
>>> +		$(USBIP_CONF_ENV) \
>>> +		CONFIG_SITE=/dev/null \
>>> +		./configure \
>>> +			--target=$(GNU_TARGET_NAME) \
>>> +			--host=$(GNU_TARGET_NAME) \
>>> +			--build=$(GNU_HOST_NAME) \
>>> +			--prefix=/usr \
>>> +			--exec-prefix=/usr \
>>> +			--sysconfdir=/etc \
>>> +			--localstatedir=/var \
>>> +			--program-prefix="" \
>>> +			$(QUIET) $(USBIP_CONF_OPTS)
>> Shouldn't we add a configure step for linux-tools ?
> Yes. That does not need to be a separate patch, but that'd be better if
> it were.

Understood.

Thanks and regards, and merry Christmas ;-)

Julien
