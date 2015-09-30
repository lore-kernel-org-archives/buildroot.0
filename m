From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 12:45:54 +0200
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150930124554.4a7abec2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 28 Sep 2015 18:10:32 +0200, Luca Ceresoli wrote:

>  # Retrieve the archive
>  $(BUILD_DIR)/%/.stamp_downloaded:
> +	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" || \
> +		(echo "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash" && false))

You could use $(error ...) instead:

> +	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" || \
> +		$(error "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash"))

I am wondering if there are indeed no places left where a final / could
sneak in. For example, when you specify a custom tarball location for
packages like U-Boot, the Linux kernel and so on.

For Linux and U-Boot, it is taken care of:

UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))

LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))

But for example, for the external toolchain site:

TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))

I believe this means that the TOOLCHAIN_EXTERNAL_SITE variable will
contain a final /. But that's indeed the only case I could find from a
quick inspection.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
