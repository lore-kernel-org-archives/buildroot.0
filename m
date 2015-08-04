From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:15:37 +0200
Subject: [Buildroot] [git commit] dawgdic: new package
Message-ID: <20150804091653.EB6B58198B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c123b581268c6b55c03d7bc283adc027908a293c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dawgdic package provides object files and utilities for building
and accessing directed acyclical word graph (DAWG) dictionaries.

This version of the patch uses the updated GitHub dawgdic repo instead
of the Google Code repo used in the previous version of this patch.

[Thomas:
  - use the github macro for <pkg>_SITE
  - remove <pkg>_SITE_METHOD, useless once you use the github macro
    for <pkg>_SITE
  - fix the license, it is BSD-3c and not GPLv3
  - remove commented <pkg>_SITE in the .mk file
  - add missing dependency on C++.]

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/dawgdic/Config.in  |   17 +++++++++++++++++
 package/dawgdic/dawgdic.mk |   14 ++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 43c58ca..47d14d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1045,6 +1045,7 @@ menu "Other"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
 	source "package/cppcms/Config.in"
+	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
new file mode 100644
index 0000000..ce0b466
--- /dev/null
+++ b/package/dawgdic/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DAWGDIC
+	bool "dawgdic"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  dawgdic provides a library for building and accessing
+	  dictionaries implemented with directed acyclic word graphs
+	  (DAWG). A dawg is constructed by minimizing a trie as a
+	  deterministic finite automaton (DFA), and thus the dawg has
+	  an advantage in memory usage. In addition, dawgdic uses a
+	  double-array as a base data structure, so its retrieval
+	  speed is as fast as that of Darts, a library for building
+	  and accessing double-array tries.
+
+	  https://github.com/stil/dawgdic
+
+comment "dawgdic needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/dawgdic/dawgdic.mk b/package/dawgdic/dawgdic.mk
new file mode 100644
index 0000000..2f0a53b
--- /dev/null
+++ b/package/dawgdic/dawgdic.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# dawgdic
+#
+################################################################################
+
+DAWGDIC_VERSION = 16ac537ba9883ff01b63b6d1fdc3072150c68fee
+DAWGDIC_SITE = $(call github,stil,dawgdic,$(DAWGDIC_VERSION))
+DAWGDIC_LICENSE = BSD-3c
+DAWGDIC_LICENSE_FILES = COPYING
+DAWGDIC_AUTORECONF = YES
+DAWGDIC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
