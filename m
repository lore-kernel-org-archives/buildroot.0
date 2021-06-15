From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Jun 2021 13:25:18 +0200
Subject: [Buildroot] [git commit] package/daq3: new package
Message-ID: <20210615105448.284128D483@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e75a990ae35580800f24f3ddc4573c6bc38fa05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add daq3 package to be able to add the snort3 package.

daq3 is not compatatible with snort as daq_load_modules has been removed

daq3 package has been created from the daq package, here is a summary of
the changes:
- Drop patch (not needed anymore)
- Enable parallel build as there is no more tokdefs.h
- Drop libdnet dependency
- Drop host-bison and host-flex dependencies
- Drop libpcap workarounds
- ipq module dropped since version 3.0.0-alpha1 and
  https://github.com/snort3/libdaq/commit/80c62799a936118c80894bf91f396c8aa8ba45a6
- Add LICENSE file (same content than COPYING)
- Update hash of COPYING (project name and GPLv2 text updated with
  https://github.com/snort3/libdaq/commit/46e8722da230082a5728175270ea3c04432d1af0)
- Add a dependency on gcc 4.9 for {t,u}h_{d,s}port that are protected on
  glibc by _FAVOR_BSD (and so !defined _GNU_SOURCE) until version 2.19:
  https://sourceware.org/git/?p=glibc.git;a=commit;h=7011c2622fe3e10a29dbe74f06aaebd07710127d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/daq3/Config.in | 14 ++++++++++++++
 package/daq3/daq3.hash |  6 ++++++
 package/daq3/daq3.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c7072d845..327ffb9447 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -845,6 +845,7 @@ F:	package/belle-sip/
 F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
+F:	package/daq3/
 F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
diff --git a/package/Config.in b/package/Config.in
index 388f8c1f05..89d8dd10d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1732,6 +1732,7 @@ menu "Networking"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
 	source "package/daq/Config.in"
+	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/daq3/Config.in b/package/daq3/Config.in
new file mode 100644
index 0000000000..ad7d55db5b
--- /dev/null
+++ b/package/daq3/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DAQ3
+	bool "daq3"
+	depends on !BR2_PACKAGE_DAQ
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  DAQ is a Data Acquisition library for packet I/O from the
+	  Snort project.
+
+	  https://www.snort.org
+
+comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on !BR2_PACKAGE_DAQ
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
new file mode 100644
index 0000000000..33ad2e388b
--- /dev/null
+++ b/package/daq3/daq3.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  920344f5c98ac68b401d1bc92ebaed78b0d15779b0480c213db279d0a60acc32  daq3-3.0.3.tar.gz
+
+# Hash for license files:
+sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
+sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  LICENSE
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
new file mode 100644
index 0000000000..a0493031d8
--- /dev/null
+++ b/package/daq3/daq3.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# daq3
+#
+################################################################################
+
+DAQ3_VERSION = 3.0.3
+DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
+DAQ3_LICENSE = GPL-2.0
+DAQ3_LICENSE_FILES = COPYING LICENSE
+DAQ3_INSTALL_STAGING = YES
+DAQ3_DEPENDENCIES = host-pkgconf
+# From git
+DAQ3_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
+DAQ3_DEPENDENCIES += libnetfilter_queue
+DAQ3_CONF_OPTS += --enable-nfq-module
+else
+DAQ3_CONF_OPTS += --disable-nfq-module
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+DAQ3_DEPENDENCIES += libpcap
+DAQ3_CONF_OPTS += --enable-pcap-module
+else
+DAQ3_CONF_OPTS += --disable-pcap-module
+endif
+
+$(eval $(autotools-package))
