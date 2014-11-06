From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Nov 2014 19:12:15 +0100
Subject: [Buildroot] [PATCH 7/7] ifupdown: new package
In-Reply-To: <1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141106191215.117286eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  6 Nov 2014 10:36:53 -0300, Gustavo Zacarias wrote:

> +IFUPDOWN_VERSION = 0.7.49
> +IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
> +IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20140923T221921Z/pool/main/i/ifupdown
> +IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
> +IFUPDOWN_LICENSE = GPLv2+
> +IFUPDOWN_LICENSE_FILES = COPYING
> +
> +define IFUPDOWN_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
> +		CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \

What about:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -D'IFUPDOWN_VERSION=\"$(IFUPDOWN_VERSION)\"'" \
		-C $(@D)

> +define IFUPDOWN_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/ifup $(TARGET_DIR)/sbin/ifup

-D missing

> +	$(INSTALL) -m 0755 -D $(@D)/settle-dad.sh \
> +		$(TARGET_DIR)/lib/ifupdown/settle-dad.sh

Ditto.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
