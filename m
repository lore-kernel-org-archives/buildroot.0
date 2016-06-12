From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 18:38:00 +0200
Subject: [Buildroot] [PATCH v2 2/2] efibootmgr: new package
In-Reply-To: <1461201836-6558-2-git-send-email-nunes.erico@gmail.com>
References: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
 <1461201836-6558-2-git-send-email-nunes.erico@gmail.com>
Message-ID: <20160612183800.098f672f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 22:23:56 -0300, Erico Nunes wrote:
> A Linux user-space application to modify the Intel Extensible Firmware
> Interface (EFI) Boot Manager. This application can create and destroy
> boot entries, change the boot order, change the next running boot
> option, and more.
> 
> The only issue found was that it was trying to include headers from the
> host, so $(STAGING_DIR) has been prepended to the include path so that
> the package finds the right headers.
> 
> efibootmgr depends on the libraries provided by efivar.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

I've applied your patch, after making a few changes. See below for some
comments.

> +config BR2_PACKAGE_EFIBOOTMGR
> +	bool "efibootmgr"
> +	depends on BR2_PACKAGE_EFIVAR

We normally use a "select" for such dependencies, so I've changed this
to a select (and of course propagated the dependencies of efivar and
added a comment).

> diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
> new file mode 100644
> index 0000000..9156499
> --- /dev/null
> +++ b/package/efibootmgr/efibootmgr.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# efibootmgr
> +#
> +################################################################################
> +
> +EFIBOOTMGR_VERSION = efibootmgr-0.12
> +EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
> +EFIBOOTMGR_LICENSE = GPLv2

The license is really GPLv2+, at least according to efibootmgr.c.

> +define EFIBOOTMGR_BUILD_CMDS
> +	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile

I've moved this tweak to a post-patch hook.

In fact, it would have been better to have a patch, submitted upstream,
that uses the -I= syntax. = gets automatically replaced by the sysroot
of the compiler. However, upstream has significantly changed the
makefiles since the 0.12 release, so it didn't make much sense.

BTW, have you seen that after the 0.12 release, they have made some
fixes to efibootmgr to make it work properly with efivar 0.24 (which we
have) ? See
https://github.com/rhinstaller/efibootmgr/commit/d44b6bba411587c77ed25775bc1f9d962550604c.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
