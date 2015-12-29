From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2015 00:10:38 +0100
Subject: [Buildroot] [PATCH 1/3] package/c-libraries: need linux-headers
In-Reply-To: <cover.1451430505.git.yann.morin.1998@free.fr>
References: <cover.1451430505.git.yann.morin.1998@free.fr>
Message-ID: <4f9bb8b34299566e342cf9514f9bcdedc427b579.1451430505.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we check that a target package in the _DEPENDENCIES of another
package has to be enabled in config, all target packages must have a
kconfig symbol.

Add a Kconfig symbol for linux-headers, and select it from the packages
that depends on it (C libraries).

Also remove the now-misleading comments "for legal-info" from the C
libraries.

Fixes:
    http://autobuild.buildroot.org/results/2a9/2a9e5d27b34357819b44f573a834da1ba5079030/
    ... and numerous similar failures ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Note: all target packages must have a kconfig symbol. Let's take care
of the most problematic one for now; other patches will come later...

Conflicts:
	package/musl/Config.in
---
 package/glibc/Config.in                 | 4 ++--
 package/linux-headers/Config.in         | 2 ++
 package/musl/Config.in                  | 2 +-
 package/uclibc/Config.in                | 2 +-
 toolchain/toolchain-buildroot/Config.in | 1 +
 5 files changed, 7 insertions(+), 4 deletions(-)
 create mode 100644 package/linux-headers/Config.in

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 72fd3df..aeb236c 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,9 +1,9 @@
 if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 
-# For legal-info
 config BR2_PACKAGE_EGLIBC
 	bool
 	default y
+	select BR2_PACKAGE_LINUX_HEADERS
 
 choice
 	prompt "eglibc version"
@@ -25,10 +25,10 @@ endif
 
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
-# For legal-info
 config BR2_PACKAGE_GLIBC
 	bool
 	default y
+	select BR2_PACKAGE_LINUX_HEADERS
 
 choice
 	prompt "glibc version"
diff --git a/package/linux-headers/Config.in b/package/linux-headers/Config.in
new file mode 100644
index 0000000..0ea9516
--- /dev/null
+++ b/package/linux-headers/Config.in
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_LINUX_HEADERS
+	bool
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 0aa3537..4f6cc51 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,5 +1,5 @@
-# For legal-info
 config BR2_PACKAGE_MUSL
 	bool
 	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
+	select BR2_PACKAGE_LINUX_HEADERS
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index bd95041..9ebec70 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,9 +1,9 @@
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
-# For legal-info
 config BR2_PACKAGE_UCLIBC
 	bool
 	default y
+	select BR2_PACKAGE_LINUX_HEADERS
 
 comment "uClibc Options"
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cee2578..cbeb030 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -110,6 +110,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+source "package/linux-headers/Config.in"
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
-- 
1.9.1
