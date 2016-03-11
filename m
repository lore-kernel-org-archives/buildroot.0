From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:19:58 +0100
Subject: [Buildroot] [PATCH 5/6] linux/perf: build in a sub-directory
In-Reply-To: <cover.1457720152.git.yann.morin.1998@free.fr>
References: <cover.1457720152.git.yann.morin.1998@free.fr>
Message-ID: <922afb0aa34f1beba4fd80408db74a8b8c57aada.1457720152.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only build perf for the target.

However, analysing some of the results gathered by perf (aka trace) may
require running perf (aka trace) on the host, so we'll have to build
perf for the host too.

To avoid mixing target and host binaries, we need to build them in
separate directories.

This commit only moves the target build, in preparation of the host
build to come later.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-tool-perf.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 8143474..f584955 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -120,15 +120,16 @@ define PERF_BUILD_CMDS
 			fi \
 		fi \
 	fi
+	$(Q)mkdir -p $(@D)/tools/perf/br-target
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(@D)/tools/perf O=$(@D)/tools/perf/
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-target
 endef
 
 # After installation, we remove the Perl and Python scripts from the
 # target.
 define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
-		-C $(@D)/tools/perf O=$(@D)/tools/perf/ install
+		-C $(@D)/tools/perf O=$(@D)/tools/perf/br-target install
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
 	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
 endef
-- 
1.9.1
