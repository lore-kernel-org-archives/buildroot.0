From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  9 Jun 2020 00:13:45 +0200
Subject: [Buildroot] [PATCH 3/5] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_10
In-Reply-To: <20200608221347.2639059-1-romain.naour@gmail.com>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
Message-ID: <20200608221347.2639059-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new symbol will be used by architectures introduced with gcc 10 and
by external toolchains based on gcc 10.

[1] https://gcc.gnu.org/gcc-10/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 94bd2150ca..0707c076e2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -308,6 +308,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_10
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 264428d06b..c7444e243b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -39,6 +39,7 @@ config BR2_GCC_VERSION_8_X
 
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	# or1k needs binutils >= 2.32
 	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
 	# powerpc spe support has been deprecated since gcc 8.x.
-- 
2.25.4
