From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:41 +0200
Subject: [Buildroot] [RFC 4/9] package/llvm: RFC: install llvm-config in
	staging
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/llvm/llvm.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 3d0a052..45ce4b4 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -24,6 +24,22 @@ LLVM_DEPENDENCIES = host-llvm zlib
 # Use native llvm-tblgen from host-llvm.
 LLVM_CONF_OPTS += -DLLVM_TABLEGEN=$(HOST_DIR)/usr/bin/llvm-tblgen
 
+# Copy llvm-config (host variant) to STAGING_DIR since llvm-config
+# provided by llvm target variant can't run on the host.
+# Also llvm-config (host variant) return include and lib directories
+# for the host if it's installed in host/usr/bin:
+# output/host/usr/bin/llvm-config --includedir
+# output/host/usr/include
+# When istalled in STAGING_DIR llvm-config return include and lib
+# directories from STAGING_DIR.
+# output/staging/usr/bin/llvm-config --includedir
+# output/staging/usr/include
+define LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+	$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/bin/llvm-config \
+		$(STAGING_DIR)/usr/bin/llvm-config
+endef
+LLVM_POST_INSTALL_STAGING_HOOKS = LLVM_COPY_LLVM_CONFIG_TO_STAGING_DIR
+
 # Use "Unix Makefiles" generator for generating make-compatible parallel makefiles.
 # Ninja is not supported yet by Buildroot
 HOST_LLVM_CONF_OPTS += -G "Unix Makefiles"
-- 
2.9.4
