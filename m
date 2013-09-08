From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:40:43 +0200
Subject: [Buildroot] [PATCH 09/10] dbus: add support for SELinux
In-Reply-To: <1378429464-12546-10-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-10-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908184043.6cef2092@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:23 -0500, Ryan Barnett wrote:

> +# SELinux support relies on audit support so enable both 
> +# of them if libselinux has been selected.
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +DBUS_CONF_OPT += --enable-selinux --enable-libaudit
> +DBUS_DEPENDENCIES += libselinux audit

This doesn't look good: it's not because libselinux is enabled in the
configuration that audit is also enabled.

So your options are:

 * Only enable SELinux support in DBus when both libselinux and audit
   are enabled:

ifeq ($(BR2_PACKAGE_LIBSELINUX)$(BR2_PACKAGE_AUDIT),y)
DBUS_CONF_OPT += --enable-selinux --enable-libaudit
DBUS_DEPENDENCIES += libselinux audit
else
...

   This is the easiest, but it kind of "diverges" from the other
   packages, where enabling the 'libselinux' package was sufficient to
   get SELinux support.

 * Ensure audit is selected when libselinux is available. This could be
   done by adding the following line to dbus/Config.in:

select BR2_PACKAGE_AUDIT if BR2_PACKAGE_LIBSELINUX

   if you add this, then you can keep your dbus.mk change as it is,
   since having BR2_PACKAGE_LIBSELINUX enabled guarantees us that
   BR2_PACKAGE_AUDIT is also enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
