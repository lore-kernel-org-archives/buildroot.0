From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:52:40 +0200
Subject: [Buildroot] [git commit] libselinux: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161029135923.7243F7FEB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccc376bc4f1f41e3d8f623fb8d2ddaa4538771c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libselinux/libselinux.mk | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 29ed0ef..165ac4c 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -67,18 +67,22 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 define HOST_LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
+		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
 		SHLIBDIR=$(HOST_DIR)/usr/lib all
 	# Generate python interface wrapper
-	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) \
+		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
 endef
 
 define HOST_LIBSELINUX_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
 		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
 	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
-	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
 endef
 
 $(eval $(generic-package))
