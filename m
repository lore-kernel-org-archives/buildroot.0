From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:50 -0300
Subject: [Buildroot] [PATCH 63/93] libselinux: use $(HOST_CONFIGURE_OPTS)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-64-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libselinux/libselinux.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index bc0d0e3..36abf49 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -64,18 +64,18 @@ HOST_LIBSELINUX_MAKE_OPTS = \
 define HOST_LIBSELINUX_BUILD_CMDS
 	# DESTDIR is needed during the compile to compute library and
 	# header paths.
-	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
 		SHLIBDIR=$(HOST_DIR)/usr/lib all
 	# Generate python interface wrapper
-	$(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) swigify pywrap
 endef
 
 define HOST_LIBSELINUX_INSTALL_CMDS
-	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) \
 		SHLIBDIR=$(HOST_DIR)/usr/lib SBINDIR=$(HOST_DIR)/usr/sbin install
 	(cd $(HOST_DIR)/usr/lib; $(HOSTLN) -sf libselinux.so.1 libselinux.so)
 	# Install python interface wrapper
-	$(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_LIBSELINUX_MAKE_OPTS) DESTDIR=$(HOST_DIR) install-pywrap
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
