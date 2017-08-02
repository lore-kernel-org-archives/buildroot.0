From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 08:40:03 +0200
Subject: [Buildroot] [git commit] package/samba4: add optional dependency to
	dbus
Message-ID: <20170802152747.DED408020F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17f6c26590d22365968e7fd0d246b315b255d204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

samba4 picks up dbus as dependency if it was built before:

Checking for dbus                : yes
Checking for header dbus/dbus.h  : yes
Checking for library dbus-1      : yes

There is no configure option to control dbus support so we just make
sure dbus is built before samba4 to have reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ffa101b..3dbb261 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -44,6 +44,10 @@ else
 SAMBA4_CONF_OPTS += --disable-cups
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+SAMBA4_DEPENDENCIES += dbus
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 SAMBA4_CONF_OPTS += --enable-avahi
 SAMBA4_DEPENDENCIES += avahi
