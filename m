From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 10:21:06 +0200
Subject: [Buildroot] dbus missing /var/lib/dbus directory
In-Reply-To: <1337225037.1496.51.camel@kepler.gfxmuse.org>
References: <1337225037.1496.51.camel@kepler.gfxmuse.org>
Message-ID: <20120517102106.221ad0e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 May 2012 21:23:57 -0600,
"Michael J. Hammel" <buildroot@graphics-muse.org> a ?crit :

> I enabled NetworkManager, which got me dbus, but then disabled
> NetworkManager, but dbus remained (that part is okay).

That's the normal kconfig behavior. The NetworkManager package
"selects" the D-Bus package, so when you enable the NetworkManager
package, it automatically enables D-Bus. But when you disable
NetworkManager, it doesn't automatically disable D-Bus.

> I noticed today that the init script for dbus tries to run dbus-uuidgen but fails with a
> message about not being able to open /etc/machine-id.  I dug around and
> then strace'd dbus-uuidgen and found that if /var/lib/dbus is present
> this message goes away.
> 
> Should the init script also try to create /var/lib/dbus with "mkdir -p"?
> Of is that something the specific rootfs needs to address on its own?

Well, it should rather be done at build time, when the D-Bus package is
built. And, reading the code, it actually is created:

define DBUS_INSTALL_TARGET_FIXUP
        rm -rf $(TARGET_DIR)/var/lib/dbus
        ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
        $(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
endef

DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP

It doesn't exist in your filesystem?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
