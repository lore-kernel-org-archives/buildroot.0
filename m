From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2019 17:50:31 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce
 dependency on tpm2-abrmd
In-Reply-To: <20190117155827.GD2556@scaer>
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-6-peter@korsgaard.com> <20190115204308.GB2556@scaer>
 <875zuog74i.fsf@dell.be.48ers.dk> <20190117155827.GD2556@scaer>
Message-ID: <b169a705-b11b-cd83-4b74-f593f1d2e2fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/01/2019 16:58, Yann E. MORIN wrote:
> But with imply, if you do something like:
> 
>     make distclean
>     make menuconfig
>         --> enable tpm2-tools
> 
> Then tpm2-abrmd is enabled.
> 
> But if you now go with:
> 
>     make distclean
>     make defconfig
>     make menuconfig
>         --> enable tpm2-tools
> 
> Then tpm2-abrmd is not enabled, because it was already disabled in the
> .config.

 This, for me, is the crux of the matter. I agree with Yann that this is
confusing. Especially because 'make some-defconfig; make menuconfig' is the
usual workflow. So the value of this imply is almost nothing in practice.

 So let me take this occasion to review the cases of imply that we already have
(obviously they're not yet written with the imply keyword).

BR2_ARC_ATOMIC_EXT
BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
BR2_PACKAGE_LUA_32BITS
BR2_PACKAGE_OPUS_FIXED_POINT
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
BR2_TOOLCHAIN_EXTERNAL_INET_RPC

 These are not confusing IMO because they only become visible after selecting
some other option that is not enabled by default.


BR2_PACKAGE_IFUPDOWN_SCRIPTS

 This one is somewhat less confusing because in the 'make defconfig; make
menuconfig' scenario, the option will already be enabled. However, if you later
on switch to a custom skeleton, the ifupdown-scripts will stay enabled. Still,
that is very similar to the situation for packages that got select'ed: once you
remove the option that caused that package to be enabled, it will stay enabled
even after you disable the option that triggered it.


 In conclusion, we currently already have some confusion caused by 'make
defconfig; make menuconfig' situations, but currently they only go in one
direction: something that was enabled will stay enabled even if you don't need
it any more. Using 'imply' in the way proposed by Peter would introduce a
different kind of confusion: options that don't get enabled though they should be.

 I would say, the design of defaults in Kconfig is simply wrong. To make it work
well, there should be tracking of whether a value was set automatically or by
the user. But let's not go there :-)

 So, that doesn't mean that imply should be banned entirely. It could still be
useful in some cases, like the ifupdown scripts.

 For the situations like the one in this patch, I would say that we could relax
a little the 'avoid extra per-package configuration options'. In fact, extra
configuration options in Config.in don't cost that much. They don't really make
the menus larger because they're only visible when the package is selected. And
the .mk handling is the same as for an automatic optional dependency. That said,
in this specific case of tpm2-tools, I have the feeling that an additional
option is not appropriate. Since the two packages are right next to each other,
that is almost the same as having the suboption. So I would go for the help text
instead.


 Regards,
 Arnout
