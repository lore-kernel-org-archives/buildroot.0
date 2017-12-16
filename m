From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:32:59 +0100
Subject: [Buildroot] [PATCH v3] pimd: new package
In-Reply-To: <1513030661-3370-1-git-send-email-sergio.prado@e-labworks.com>
References: <1513030661-3370-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171216163259.58bf6b3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Dec 2017 20:17:41 -0200, Sergio Prado wrote:

> +PIMD_VERSION = 2.3.2
> +PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
> +PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_VERSION)
> +
> +PIMD_LICENSE = BSD-3-Clause
> +PIMD_LICENSE_FILES = LICENSE LICENSE.mrouted
> +
> +PIMD_MAKE_OPTS = CROSS=$(TARGET_CROSS) CC=$(TARGET_CC)

This variable was not really needed, since it's used only once, so I've
used CROSS and CC directly in BUILD_CMDS.

> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),y)
> +PIMD_CONF_OPTS = --embedded-libc

I've used += here instead of =, since we're inside a condition. This
typically avoids mistakes in the future.

> +define PIMD_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef

This was incorrectly installing in $(TARGET_DIR)/usr/local, so I've
added prefix=/usr to fix that. I've also dropped the quotes around
"$(TARGET_DIR)" since we don't do it in general in Buildroot.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
