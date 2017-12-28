From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 22:55:42 +0100
Subject: [Buildroot] [git commit] libostree: make sure libavahi-client is
 built
Message-ID: <20171228215608.6B38B83487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe63bab24b8e8d0dcc7a2bf894a3a848fc5b4df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avahi support also needs libavahi-client, which is built by avahi if avahi-daemon
and dbus is selected.

Fixes:
http://autobuild.buildroot.net/results/1edfb60add17945eabc557e1dbfb08a0ba466df9/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Thomas: drop dependency on dbus, since libostree only needs avahi.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libostree/libostree.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 612c284..26f173c 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -27,7 +27,11 @@ else
 LIBOSTREE_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
+# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
+# option yet, use the avahi-daemon and dbus config symbols to check for
+# libavahi-client.
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 LIBOSTREE_CONF_OPTS += --with-avahi
 LIBOSTREE_DEPENDENCIES += avahi
 else
