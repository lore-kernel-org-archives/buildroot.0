From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:36:31 +0100
Subject: [Buildroot] [git commit] package/perf: fix build failures with high
	'make -j' values
Message-ID: <20150319123703.C76B48189E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08e786536ba2b81d13e5b8319767c9b34f817f9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'perf' Makefile is flaky on some kernel versions. It will still parallelize
the build even with 'make -j1' because it explicitly invokes a sub-make with
the correct flags. But the top-level make is not smart enough to handle large
'-j' values.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
