From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Dec 2012 11:43:04 -0300
Subject: [Buildroot] [PATCH] libcap: disable programs
Message-ID: <1355150584-31592-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libcap programs since they use fork and fail on !MMU systems.
They're not usually used, if someone wants them they can add an option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcap/libcap.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index b922e5a..94a0cbb 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -25,9 +25,15 @@ endef
 define LIBCAP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
 		prefix=/usr lib=lib install
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,capsh getpcaps)
 endef
 
+# progs use fork()
+define LIBCAP_DISABLE_PROGS
+	$(SED) '/-C progs/d' $(@D)/Makefile
+endef
+
+LIBCAP_POST_PATCH_HOOKS += LIBCAP_DISABLE_PROGS
+
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
 endef
-- 
1.7.8.6
