From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:53:45 +0200
Subject: [Buildroot] [git commit] package/avahi: Set the path to D-Bus
 system.d directory
Message-ID: <20180326205554.AC65E80FAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccf773659a25a16d83f5e1e08f7cdcb61ce9c83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since D-Bus 1.9.18, the recommended location for the system and
session busses configuration files is /usr/share instead of /etc. From
the D-Bus NEWS file:

D-Bus 1.9.18 (2015-07-21)
==

The ???Pirate Elite??? release.

Configuration changes:

??? The basic setup for the well-known system and session buses is now done
   in read-only files in ${datadir}, moving a step closer to systems
   that can operate with an empty /etc directory. In increasing order
   of precedence:

   ?? ${datadir}/dbus-1/s*.conf now perform the basic setup such as setting
     the default message policies.
   ?? ${sysconfdir}/dbus-1/s*.conf are now optional. By default
     dbus still installs a trivial version of each, for documentation
     purposes; putting configuration directives in these files is
     deprecated.
   ?? ${datadir}/dbus-1/s*.d/ are now available for third-party software
     to install "drop-in" configuration snippets (any packages
     using those directories should explicitly depend on at least this
     version of dbus).
   ?? ${sysconfdir}/dbus-1/s*.d/ are also still available for sysadmins
     or third-party software to install "drop-in" configuration snippets
   ?? ${sysconfdir}/dbus-1/s*-local.conf are still available for sysadmins'
     overrides

   ${datadir} is normally /usr/share, ${sysconfdir} is normally /etc,
   and "s*" refers to either system or session as appropriate.

Therefore, this commit adjusts the Avahi package to install the D-Bus
related files to /usr/share/dbus-1/system.d.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index c8f1af9a9d..ef621620f0 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 AVAHI_DEPENDENCIES += dbus
+AVAHI_CONF_OPTS += --with-dbus-sys=/usr/share/dbus-1/system.d
 else
 AVAHI_CONF_OPTS += --disable-dbus
 endif
