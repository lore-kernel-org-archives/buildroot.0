From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Wed,  4 Sep 2013 21:02:10 +0200
Subject: [Buildroot] [PATCHv2] perf: Add host-bison, host-flex dependencies
Message-ID: <1378321330-16521-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/perf/perf.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 7787c78..120353f 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -8,7 +8,7 @@
 PERF_SOURCE =
 PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
-PERF_DEPENDENCIES = linux
+PERF_DEPENDENCIES = linux host-flex host-bison
 
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
@@ -40,14 +40,14 @@ define PERF_BUILD_CMDS
 			exit 1 ; \
 		fi \
 	fi
-	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
-- 
1.7.9.5
