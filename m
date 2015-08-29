From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 22:59:14 +0200
Subject: [Buildroot] [git commit] ibrdtn-tools: new package
Message-ID: <20150901083109.079B77F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b22622fecfc35737a7dd3933a7116f7c06cbf8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - include package/ibrdtn-tools/Config.in from package/Config.in
  - fix the Config.in option name: we don't use - in option names, it
    should be replaced by _. Also do the same change in the .mk file.
  - from Config.in, don't select BR2_PACKAGE_IBRDTND (it's not a
    dependency of ibrdtn-tools), but instead select
    BR2_PACKAGE_IBRCOMMON and BR2_PACKAGE_IBRDTN.
  - in the Config.in file, fix the comment dependency logic (we want
    the comment to be shown when either thread support *or* C++
    support is missing)
  - add hash file.
  - do not install to staging, since the package does not install any
    library
  - remove IBRDTN_TOOLS_SOURCE variable, since it's equal to the
    default value
  - add ibrcommon, ibrdtn and host-pkgconf as mandatory dependencies,
    and handle libdaemon and libarchive as optional dependencies.
  - remove custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS:
    automake is used, so there's no need for any hack.]

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/ibrdtn-tools/Config.in         |   15 +++++++++++++++
 package/ibrdtn-tools/ibrdtn-tools.hash |    2 ++
 package/ibrdtn-tools/ibrdtn-tools.mk   |   27 +++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7412ba6..ed0eb98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1240,6 +1240,7 @@ endif
 	source "package/hostapd/Config.in"
 	source "package/hplip/Config.in"
 	source "package/httping/Config.in"
+	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/ifplugd/Config.in"
diff --git a/package/ibrdtn-tools/Config.in b/package/ibrdtn-tools/Config.in
new file mode 100644
index 0000000..91419d6
--- /dev/null
+++ b/package/ibrdtn-tools/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_IBRDTN_TOOLS
+	bool "ibrdtn-tools"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IBRCOMMON
+	select BR2_PACKAGE_IBRDTN
+	help
+	  IBR-DTN is a small dtn application that supports:
+	  Bundle Protocol RFC 5050
+	  Bundle Security Protocol RFC 6257
+
+	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
+
+comment "ibrdtn-tools needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ibrdtn-tools/ibrdtn-tools.hash b/package/ibrdtn-tools/ibrdtn-tools.hash
new file mode 100644
index 0000000..fb77207
--- /dev/null
+++ b/package/ibrdtn-tools/ibrdtn-tools.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	eab066cf15f9c322d769c6c9c58adfb474cba7d446fd12e8de5ff6344376795b	ibrdtn-tools-1.0.1.tar.gz
diff --git a/package/ibrdtn-tools/ibrdtn-tools.mk b/package/ibrdtn-tools/ibrdtn-tools.mk
new file mode 100644
index 0000000..c9a585d
--- /dev/null
+++ b/package/ibrdtn-tools/ibrdtn-tools.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# ibrdtn-tools
+#
+################################################################################
+
+IBRDTN_TOOLS_VERSION = 1.0.1
+IBRDTN_TOOLS_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN_TOOLS_LICENSE = Apache-2.0
+IBRDTN_TOOLS_LICENSE_FILES = COPYING
+IBRDTN_TOOLS_DEPENDENCIES = ibrcommon ibrdtn host-pkgconf
+
+ifeq ($(BR2_PACKAGE_LIBDAEMON),y)
+IBRDTN_TOOLS_CONF_OPTS += --with-libdaemon
+IBRDTN_TOOLS_DEPENDENCIES += libdaemon
+else
+IBRDTN_TOOLS_CONF_OPTS += --without-libdaemon
+endif
+
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+IBRDTN_TOOLS_CONF_OPTS += --with-libarchive
+IBRDTN_TOOLS_DEPENDENCIES += libarchive
+else
+IBRDTN_TOOLS_CONF_OPTS += --without-libarchive
+endif
+
+$(eval $(autotools-package))
