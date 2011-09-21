From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:33 +0200
Subject: [Buildroot] [PATCH 3 of 5] toolchain-external: allow specifying
 extra external libraries
In-Reply-To: <patchbomb.1316588130@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
Message-ID: <a447762bdfba5cd6da7c.1316588133@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Custom toolchains may provide extra libraries that need to be copied to the
target. This patch adds a configuration option for this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---

 toolchain/toolchain-external/Config.in   |  8 ++++++++
 toolchain/toolchain-external/ext-tool.mk |  1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -333,6 +333,14 @@
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
+	string "Extra toolchain libraries to be copied to target"
+	help
+	  If your external toolchain provides extra libraries that
+	  need to be copied to the target filesystem, enter them
+	  here, separated by spaces. They will be copied to the
+	  target's /lib directory.
+
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 endif # BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -51,6 +51,7 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+LIB_EXTERNAL_LIBS+=$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS)
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
