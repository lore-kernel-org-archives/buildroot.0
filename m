From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 22:33:15 +0200
Subject: [Buildroot] [git commit] package/dbus: fix group and mode for the
 launcher
Message-ID: <20200606203414.2999B82AA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ac245a0cb76f270b28860936245ca1abba0804a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The D-Bus installation process installs dbus-daemon-launch-helper as
follows:

  chown root:$(DBUS_USER) $(DESTDIR)$(libexecdir)/dbus-daemon-launch-helper$(EXEEXT); \
  chmod 4750 $(DESTDIR)$(libexecdir)/dbus-daemon-launch-helper$(EXEEXT); \

And when the installation does not take place as root (like is the
case in the context of Buildroot), it prints:

  echo "Not installing $(DESTDIR)$(libexecdir)/dbus-daemon-launch-helper binary setuid!"; \
  echo "You'll need to manually set permissions to root:$(DBUS_USER) and permissions 4750"; \

So let's adjust the installation logic of dbus-daemon-launch-helper to
match these requirements.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a4043864d1..bb9f17a5e0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,7 +11,7 @@ DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
-	/usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
+	/usr/libexec/dbus-daemon-launch-helper f 4750 0 dbus - - - - -
 endef
 
 define DBUS_USERS
