From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 20:21:28 +0100
Subject: [Buildroot] [PATCH] linux.mk: check for y explicitly
In-Reply-To: <189747daec208a7d29d7.1331743009@beantl019720>
References: <189747daec208a7d29d7.1331743009@beantl019720>
Message-ID: <20120314202128.5bf5ded7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 17:36:49 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> LINUX_CONFIGURE_CMDS uses the construct
> $(if $(BR2_x), ...
> which don't work as expected when BR2_x=n.

This is an invalid construct in my opinion. Unset options should look
like:

# BR2_SOMETHING is not set

in the .config file.

There are many other places in Buildroot which assumes that an
unselected option has an empty value:

xenomai/xenomai.mk:ifeq ($(XENOMAI_VERSION),)
xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
xenomai/xenomai.mk:ifeq ($(BR2_HAVE_DEVFILES),)
xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
xenomai/xenomai.mk:ifeq ($(BR2_PACKAGE_XENOMAI_ANALOGY),)

connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_THREADS),--enable-threads,--disable-threads)         \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)               \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)      \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)                  \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_BLUETOOTH),--enable-bluetooth,--disable-bluetooth)   \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_LOOPBACK),--enable-loopback,--disable-loopback)      \
connman/connman.mk:     $(if $(BR2_PACKAGE_CONNMAN_NTPD),--enable-ntpd,--disable-ntpd)

And many, many, many more. Just grep for '(if' in the Buildroot code.
So definitely not my Ack on this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
