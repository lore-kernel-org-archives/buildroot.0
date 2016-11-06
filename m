From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Nov 2016 14:15:23 +0100
Subject: [Buildroot] [PATCH] package/ser2net: disable threads for toolchains
	without threads support
Message-ID: <1478438123-869-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ser2net configure script provide an option to disable threads support,
use it.

Fixes:
http://autobuild.buildroot.net/results/6bc/6bc0f99917c2069a1614f4cfcaa98af1b21762e4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/ser2net/ser2net.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 01aee95..b0a7f5b 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -9,6 +9,12 @@ SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+SER2NET_CONF_OPTS += --with-pthreads=yes
+else
+SER2NET_CONF_OPTS += --with-pthreads=no
+endif
+
 define SER2NET_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ser2net/S50ser2net \
 		$(TARGET_DIR)/etc/init.d/S50ser2net
-- 
2.5.5
