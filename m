From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 00:19:25 -0700
Subject: [Buildroot] [PATCH v2] package/perf: fix build failures with high
	'make -j' values
Message-ID: <1426749565-3888-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'perf' Makefile is flaky on some kernel versions. It will still parallelize
the build even with 'make -j1' because it explicitly invokes a sub-make with
the correct flags. But the top-level make is not smart enough to handle large
'-j' values.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---

v2:
  - Use $(MAKE1) instead of appending '-j1' to PERF_MAKE_FLAGS.

 package/perf/perf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 1fcc258..bbdcc5a 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -53,14 +53,14 @@ define PERF_BUILD_CMDS
 			fi \
 		fi \
 	fi
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D) install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 endef
-- 
2.3.3
