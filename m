From: Valentine Barshak <gvaxon@gmail.com>
Date: Mon, 08 Oct 2012 00:22:13 +0400
Subject: [Buildroot] [PATCH] linux: Fix initramfs compression
In-Reply-To: <50716829.7010004@mind.be>
References: <1349551332-25169-1-git-send-email-gvaxon@gmail.com>
 <50716829.7010004@mind.be>
Message-ID: <5071E475.5070908@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/2012 03:31 PM, Arnout Vandecappelle wrote:
> On 06/10/12 21:22, Valentine Barshak wrote:
>> -        $(call
>> KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config)
>> -        $(call
>> KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_GZIP,$(@D)/.config))
>> +        for c in GZIP BZIP2 LZMA XZ LZO; do \
>> +            if grep -qm1 "CONFIG_RD_$$c=y" $(@D)/.config; then \
>> +                $(call
>> KCONFIG_DISABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_NONE,$(@D)/.config); \
>> +                $(call
>> KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_$$c,$(@D)/.config); \
>> +                break; \
>> +            fi; \
>> +        done)
>
>   I think this is a bit too complex for something that won't really be
> used by
> most people.  Why not just remove the COMPRESSION lines from linux.mk?
> Then
> we fall back on the default if the user hasn't configured it
> explicitly.  Gives
> the user the possibility to choose something else than the default,
> without adding
> complexity to buildroot.

The problem here is that we can't set initramfs compression mode unless 
the initramfs source (CONFIG_INITRAMFS_SOURCE) is set. We can only set 
RAM disk compression modes that should be supported by the kernel 
(CONFIR_RD_...).

The source is set by buildroot. So the user has no capability to 
configure compression explicitly, unless he (she) sets a fake initramfs 
source file, which will be overridden by buildroot. IMHO, this is a bit 
hackish way to set anything other than default, which is COMPRESSION_NONE.

Yes, that is what most people want. I just didn't want to drop other 
options in case somebody wants a compressed initramfs image.
This could be needed for systems with low memory, for example.

>
>   Regards,
>   Arnout

Thanks,
Val.
