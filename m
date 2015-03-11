From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 11 Mar 2015 21:28:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/softether: Fix iconv-related
	compile error
Message-ID: <1426105728-7827-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libiconv can also be enabled, and compiled before softether, with
BR2_ENABLE_LOCALE disabled, this patch improves libiconv detection.

Fixes
http://autobuild.buildroot.net/results/f47/f473882cd35445cbe5b3b15635d555340183951a/
http://autobuild.buildroot.net/results/72e/72eab3a6f162e3c5eac380f88b54d4f314d52445/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/softether/softether.mk |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 8f8734d..22ed23d 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -14,14 +14,14 @@ SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-softether openssl readline
 SOFTETHER_AUTORECONF = YES
 
-ifeq ($(BR2_ENABLE_LOCALE),)
+ifneq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),)
 SOFTETHER_DEPENDENCIES += libiconv
-SOFTETHER_CONF_ENV = LIBS+=" -liconv"
+SOFTETHER_LIBS += -liconv
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
 # openssl needs zlib
-SOFTETHER_CONF_ENV += LIBS+=" -lz"
+SOFTETHER_LIBS += -lz
 endif
 
 SOFTETHER_CONF_OPTS = \
@@ -31,7 +31,9 @@ SOFTETHER_CONF_OPTS = \
 # softether uses clock_gettime but forgets to link against -lrt
 # breaking the build against older libc's that don't provide this
 # symbol in libc
-SOFTETHER_CONF_ENV += LIBS+=" -lrt"
+SOFTETHER_LIBS += -lrt
+
+SOFTETHER_CONF_ENV += LIBS="$(SOFTETHER_LIBS)"
 HOST_SOFTETHER_CONF_ENV += LIBS+=" -lrt"
 
 # host-libiconv does not exist, therefore we need this extra line
-- 
1.7.10.4
