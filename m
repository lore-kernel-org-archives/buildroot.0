From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 20 Oct 2018 20:12:26 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: add fortran support
 option for custom external toolchains
Message-ID: <20181020181226.17318-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a custom external toolchain is used, we can't enable the fortran
support. Add a new option for that.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
v2: add libquadmath dependency when necessary (Samuel)
---
 .../toolchain-external-custom/Config.in.options   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 4639232bfb..6a9c4e5114 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -405,6 +405,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CXX
 	  support. If you don't know, leave the default value,
 	  Buildroot will tell you if it's correct or not.
 
+config BR2_TOOLCHAIN_EXTERNAL_FORTRAN
+	bool "Toolchain has Fortran support?"
+	# on architecture building libquadmath, wchar is required
+	depends on !BR2_TOOLCHAIN_HAS_LIBQUADMATH || \
+		(BR2_TOOLCHAIN_HAS_LIBQUADMATH && BR2_USE_WCHAR)
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Select this option if your external toolchain has Fortran
+	  support. If you don't know, leave the default value,
+	  Buildroot will tell you if it's correct or not.
+
+comment "Fortran support needs a toolchain w/ wchar"
+	depends on BR2_TOOLCHAIN_HAS_LIBQUADMATH
+	depends on !BR2_USE_WCHAR # libquadmath
+
 config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	string "Extra toolchain libraries to be copied to target"
 	help
-- 
2.17.2
