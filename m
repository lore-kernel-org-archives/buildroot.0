From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Sep 2020 16:37:50 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/gen-bootlin-toolchains: add
 missing glibc toolchain dependencies
Message-ID: <20200927143752.1498115-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc toolchains must be disabled for static only configuration.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index ac1a19b3c0..bfc7237d48 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -233,14 +233,19 @@ class Toolchain:
         f.write("config %s\n" % self.option_name)
         f.write("\tbool \"%s %s %s %s\"\n" %
                 (self.arch, self.libc, self.variant, self.version))
-        for c in arches[self.arch]['conditions']:
-            f.write("\tdepends on %s\n" % c)
+        depends = []
         selects = []
+
+        for c in arches[self.arch]['conditions']:
+            depends.append(c)
+
         for frag in self.fragment:
             # libc type
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC"):
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_UCLIBC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC"):
+                # glibc doesn't support static only configuration
+                depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
                 # all glibc toolchains have RPC support
                 selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
@@ -303,6 +308,9 @@ class Toolchain:
             if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_OPENMP"):
                 selects.append("BR2_TOOLCHAIN_HAS_OPENMP")
 
+        for depend in depends:
+            f.write("\tdepends on %s\n" % depend)
+
         for select in selects:
             f.write("\tselect %s\n" % select)
 
-- 
2.25.4
