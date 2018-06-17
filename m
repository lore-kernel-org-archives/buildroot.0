From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 21:00:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: add libatomic linkage when
 available
Message-ID: <20180617190007.3369-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b79/b7915df77ae58448830e8e515c0fd642f3348611/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Bug occurs also with tor-0.3.3.7 which was used to test this fix.

 package/tor/tor.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 39006e7caf..eba2130669 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -26,6 +26,11 @@ TOR_CONF_OPTS += \
 	--enable-static-zlib
 endif
 
+# Uses __atomic_fetch_add_4 and __atomic_fetch_sub_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+TOR_CONF_OPTS += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 TOR_DEPENDENCIES += libcap
 endif
-- 
2.17.1
