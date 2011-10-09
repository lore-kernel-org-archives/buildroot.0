From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Oct 2011 19:44:25 +0200
Subject: [Buildroot] [PATCH 2/9] toolchain-external: allow specifying extra
	external libraries
In-Reply-To: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6673ce364183d3d09a8b11e949f4a3e97098c0df.1318182187.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>

Custom toolchains may provide extra libraries that need to be copied to the
target. This patch adds a configuration option for this.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-external/Config.in   |    8 ++++++++
 toolchain/toolchain-external/ext-tool.mk |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ff7e8db..b6fa9bd 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -322,6 +322,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
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
index b9d932f..bac39cf 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -51,6 +51,7 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 LIB_EXTERNAL_LIBS=ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so libnsl.so libresolv.so librt.so libutil.so
+LIB_EXTERNAL_LIBS+=$(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
-- 
1.7.4.1
