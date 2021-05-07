From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Thu,  6 May 2021 17:43:44 -0700
Subject: [Buildroot] [PATCH v2 3/3] lmbench: emulate --prefix to avoid
 scattering binaries all over
In-Reply-To: <20210507004344.3166099-1-vgupta@synopsys.com>
References: <20210507004344.3166099-1-vgupta@synopsys.com>
Message-ID: <20210507004344.3166099-4-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
 - scripts copied to <target>/lmbench/scripts
 - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/lmbench/lmbench.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f820..ed075d20dafe 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -36,7 +36,14 @@ define LMBENCH_BUILD_CMDS
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
+	mkdir -p $(TARGET_DIR)/lmbench/tmp
+	mkdir -p $(TARGET_DIR)/lmbench/scripts
+	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/lmbench/tmp -C $(@D)/src install
+	mkdir -p $(TARGET_DIR)/lmbench/bin/$(ARCH)
+	mv $(TARGET_DIR)/lmbench/tmp/bin/* $(TARGET_DIR)/lmbench/bin/$(ARCH)
+	rm -rf $(TARGET_DIR)/lmbench/tmp/
+	cp -rfd $(@D)/scripts/ $(TARGET_DIR)/lmbench/.
+	echo "echo ${ARCH}" >  $(TARGET_DIR)/lmbench/scripts/os
 endef
 
 $(eval $(generic-package))
-- 
2.25.1
