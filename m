From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 00:23:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/enlightenment: enable systemd
	support
In-Reply-To: <1469226198-26474-1-git-send-email-romain.naour@gmail.com>
References: <1469226198-26474-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1469226198-26474-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Tested with Qemu for x86_64 target with systemd + X11 server
---
 package/enlightenment/enlightenment.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index e8fee3f..2440cec 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -22,8 +22,14 @@ ENLIGHTENMENT_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--disable-pam \
-	--disable-rpath \
-	--disable-systemd
+	--disable-rpath
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+ENLIGHTENMENT_CONF_OPTS += --enable-systemd
+ENLIGHTENMENT_DEPENDENCIES += systemd
+else
+ENLIGHTENMENT_CONF_OPTS += --disable-systemd
+endif
 
 # uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
-- 
2.5.5
