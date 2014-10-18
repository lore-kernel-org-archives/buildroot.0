From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 18:56:01 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init
 scripts
In-Reply-To: <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141018185601.1a8e732c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:47:02 +0200, Maxime Hadjinlian wrote:

> +ifeq ($(BR2_INIT_SYSTEMD),y)
> +	$(Q)if test -n "$($(PKG)_INIT_SYSTEMD_FILES)" ; then \
> +		mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants ; \
> +		for s in $($(PKG)_INIT_SYSTEMD_FILES); do \
> +			f=$$(basename $${s}); \
> +			$(INSTALL) -D -m 644 $${s} $(TARGET_DIR)/lib/systemd/system/$${f} ; \
> +			ln -fs /lib/systemd/system/$${f} \
> +				$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$${f} ; \
> +		done ; \
> +	fi
> +	$($(PKG)_INSTALL_INIT_SYSTEMD)
> +endif
> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
> +	$(Q)if test -n "$($(PKG)_INIT_SYSV_FILES)" ; then \
> +		for s in $($(PKG)_INIT_SYSV_FILES); do \
> +			   f=$$(basename $${s}) ; \
> +			   $(INSTALL) -D -m 0755 $${s} $(TARGET_DIR)/etc/init.d/$${f} ; \
> +		done ; \
> +	fi
> +	$($(PKG)_INSTALL_INIT_SYSV)
> +endif

Why is an explicit variable necessary ? Why not simply install all the
S* and K* files from the package directory for sysvinit/busybox and all
the .service (or some extension) of the package directory for systemd ?
I think we discussed this at the meeting, no?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
