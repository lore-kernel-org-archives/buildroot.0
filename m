From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Oct 2012 21:34:14 -0300
Subject: [Buildroot] [PATCH] libcap: disable progs altogether
Message-ID: <1351470854-15435-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable progs in the Makefile directly instead of building and then
removing them.
This is because they use fork() and can cause build failures on nommu.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap/libcap.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index b922e5a..ac73dcf 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -12,7 +12,9 @@ LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
+# progs use fork()
 define LIBCAP_BUILD_CMDS
+	$(SED) '/-C progs/d' $(@D)/Makefile
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
 endef
@@ -25,7 +27,6 @@ endef
 define LIBCAP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
 		prefix=/usr lib=lib install
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
-- 
1.7.8.6
