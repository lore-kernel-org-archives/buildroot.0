From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 15:12:29 +0100
Subject: [Buildroot] [git commit] libcap: disable programs
Message-ID: <20121219141254.821709A3BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4c914552e4fba8139e74d90a26bbba5048d6492
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable libcap programs since they use fork and fail on !MMU systems.
They're not usually used, if someone wants them they can add an option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
