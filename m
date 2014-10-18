From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 19:02:05 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init
 scripts
In-Reply-To: <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141018190205.47c7867e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:47:02 +0200, Maxime Hadjinlian wrote:

> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
> +	$(Q)if test -n "$($(PKG)_INIT_SYSV_FILES)" ; then \
> +		for s in $($(PKG)_INIT_SYSV_FILES); do \
> +			   f=$$(basename $${s}) ; \
> +			   $(INSTALL) -D -m 0755 $${s} $(TARGET_DIR)/etc/init.d/$${f} ; \
> +		done ; \
> +	fi
> +	$($(PKG)_INSTALL_INIT_SYSV)
> +endif

Another comment: you're forcefully installing the init script here,
while many of our packages (but not all!) test if the script is already
installed before installing it. The use case for this is to allow a
custom version of the script to be part of the filesystem skeleton, and
therefore to not see it being overridden by a package.

I personally don't care very much about this use case, as I believe
people should rather use rootfs overlays, and also because it is anyway
not full-proof: while we can prevent the Buildroot package logic from
overwriting files in the root filesystem, we cannot prevent the build
system of each package from overwriting files.

But it's something that needs to be discussed and decided. Peter ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
