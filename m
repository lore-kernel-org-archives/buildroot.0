From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:26 +0200
Subject: [Buildroot] [PATCH 03/14] handle MMU configuration
In-Reply-To: <8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  some arches do not have an MMU at all, some do but it may be
  desirable not to use it.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 toolchain/Config.in.2     |   12 ++++++++++++
 toolchain/gcc/Makefile.in |    5 +++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 2a9ce24..d8f7ca0 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -85,6 +85,18 @@ config BR2_SOFT_FLOAT
 
 	  Most people will answer N.
 
+config BR2_HAVE_NOMMU
+	def_bool n
+	# assume that we have an MMU per default.
+
+config BR2_USE_MMU
+	bool "Use MMU"
+	default y
+	depends on !BR2_HAVE_NOMMU
+	help
+	  If your target has an MMU and you want to use it
+	  then say Y here.
+
 config BR2_USE_SSP
 	bool "Enable stack protection support"
 	help
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index e052b83..3c6ddd1 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -49,6 +49,11 @@ SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
 ARCH_FPU_SUFFIX:=
 endif
+ifeq ($(BR2_USE_MMU),y)
+ARCH_MMU_SUFFIX:=
+else
+ARCH_MMU_SUFFIX:=_nommu
+endif
 
 # some additional defaults
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-- 
1.6.3.3
