From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 21:35:51 +0200
Subject: [Buildroot] [PATCH] linux: linux.mk: _defconfig not required
	for arm64 instead use defconfig
In-Reply-To: <1461082701-8144-1-git-send-email-naresh.kamboju@linaro.org>
 (naresh kamboju's message of "Tue, 19 Apr 2016 17:18:21 +0100")
References: <1461082701-8144-1-git-send-email-naresh.kamboju@linaro.org>
Message-ID: <87a8kdwmp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "naresh" == naresh kamboju <naresh.kamboju@linaro.org> writes:

 > From: Naresh Kamboju <naresh.kamboju@linaro.org>
 > Linux arch/arm64 contains configs/defconfig not the <board>_defconfig

But is that likely to stay like that, even for various vendor trees?

I've recently merged the defconfig for odroidc2, and that one use

BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"

With a vendor kernel based on 3.14:

https://github.com/hardkernel/linux/tree/odroidc2-3.14.y/arch/arm64/configs

Perhaps we should instead interpret BR2_LINUX_KERNEL_DEFCONFIG="" as
defconfig and not _defconfig (and then drop the check around line 423).


 > Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
 > ---
 >  linux/linux.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index 317587f..f7fb244 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -198,7 +198,11 @@ endef
 >  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
 >  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 > +ifeq ($(KERNEL_ARCH),arm64)
 > +LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))
 > +else
 >  LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 > +endif
 >  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 >  LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
 >  endif
 > -- 
 > 2.8.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
