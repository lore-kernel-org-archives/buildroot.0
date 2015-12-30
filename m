From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 17:27:59 +0100
Subject: [Buildroot] [git commit] dbus: audit support needs both audit and
	libcap-ng
Message-ID: <20151230162925.516DF82751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af0d7a1fb6fb83ff44a48c4c2556dd991411ff5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As was suggested by the <pkg>_DEPENDENCIES variable, the audit support
in DBus requires both audit and libcap-ng. However, it didn't take
care of the fact that libcap-ng must be enabled in the configuration
to depend on it, causing some build failures with the newly added
check.

DBus configure.ac confirms that both packages are needed to enable
audit support, so we simply fix the condition to only be true when
both BR2_PACKAGE_AUDIT *and* BR2_PACKAGE_LIBCAP_NG are true.

Fixes:

  http://autobuild.buildroot.org/results/239/23953cc66faecb65e9ebf1f6980924f823d736a2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 3cdc42a..33bfb31 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -50,7 +50,7 @@ else
 DBUS_CONF_OPTS += --disable-selinux
 endif
 
-ifeq ($(BR2_PACKAGE_AUDIT),y)
+ifeq ($(BR2_PACKAGE_AUDIT)$(BR2_PACKAGE_LIBCAP_NG),yy)
 DBUS_CONF_OPTS += --enable-libaudit
 DBUS_DEPENDENCIES += audit libcap-ng
 else
