From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:47:19 +0100
Subject: [Buildroot] [git commit] package/slirp: add libglib2 mandatory
 dependency
Message-ID: <20201111104035.861B983906@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a62fac1f659ccf00030e59e2a0720a9f346edf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

slirp depends on libglib2, don't update xen as it already depends on it

Fixes:
 - http://autobuild.buildroot.org/results/0b9cff1bc650876a6fff6102b2cb31dcdf4c5e8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/Config.in | 8 ++++++++
 package/slirp/slirp.mk  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/slirp/Config.in b/package/slirp/Config.in
index 8f57c4fa6a..38fd5277af 100644
--- a/package/slirp/Config.in
+++ b/package/slirp/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_SLIRP
 	bool "slirp"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libslirp is a user-mode networking library used by virtual
 	  machines, containers or various tools.
@@ -18,3 +22,7 @@ config BR2_PACKAGE_SLIRP
 	      around May 2009 which archived it in 2012
 	    - So we switched to
 	      https://gitlab.freedesktop.org/slirp/libslirp
+
+comment "slirp needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index d046e0cf75..ed6d8855e5 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -12,5 +12,6 @@ SLIRP_SITE = https://elmarco.fedorapeople.org
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_INSTALL_STAGING = YES
+SLIRP_DEPENDENCIES = libglib2
 
 $(eval $(meson-package))
