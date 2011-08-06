From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Aug 2011 08:58:14 +0200
Subject: [Buildroot] [PATCH v2] add QWT library: Qt Widgets for
 Technical Applications
In-Reply-To: <1312591577-30383-1-git-send-email-ivan.kuten@promwad.com>
References: <4E3C283A.7070406@promwad.com>
 <1312591577-30383-1-git-send-email-ivan.kuten@promwad.com>
Message-ID: <20110806085814.71636ff4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ivan,

Looks a lot better. A few comments remain though (sorry if I didn't
catch them at the first review).

Le Sat, 6 Aug 2011 03:46:17 +0300,
Ivan Kuten <ivan.kuten@promwad.com> a ?crit :

> +menuconfig BR2_PACKAGE_QWT

This should be:

config BR2_PACKAGE_QWT

menuconfig is here to define a submenu, which is not the case for qwt.

> +define QWT_INSTALL_STAGING_CMDS
> +     (export INSTALL_ROOT=$(STAGING_DIR); $(MAKE) -C $(@D) install)
> +endef
> +
> +define QWT_INSTALL_TARGET_CMDS
> +     cp -dpf $(STAGING_DIR)/usr/local/qwt-$(QWT_VERSION)/lib/libqwt.so* $(TARGET_DIR)/usr/lib
> +endef

This installation path of the library
($(STAGING_DIR)/usr/local/qwt-xxxx/lib/) is not a standard path, and
will make a lot of things fail in Buildroot. Can you arrange to install
the library in $(STAGING_DIR)/usr/lib and the headers files in
$(STAGING_DIR)/usr/include (i.e, define a prefix of $(STAGING_DIR)/usr).

Otherwise, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
