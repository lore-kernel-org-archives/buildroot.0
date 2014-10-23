From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Oct 2014 21:58:28 +0200
Subject: [Buildroot] [git commit] intltool: fix build issues
Message-ID: <20141023200650.BFB63B5824@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2081534cd427a24389b7b09848a189271d1b408f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes various build failures caused by the host-perl
series.

Currently, the variables PERL and PERL5LIB are available only during
the configure step of host-intltool, but they are also needed when
running host-intltool, in all packages that depend on
host-intltool. Without them, host-intltool cannot work as it doesn't
find the libxml-parser-perl module installed in
$(HOST_DIR)/usr/lib/perl.

This commit therefore makes the PERL and PERL5LIB variables global, so
that all packages can access them.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in          |   17 +++++++++++++++--
 package/intltool/intltool.mk |    3 ---
 package/pkg-perl.mk          |    2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 02ddaa7..490a960 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -232,6 +232,17 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/
 HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
+# host-intltool should be executed with the system perl, so we save
+# the path to the system perl, before a host-perl built by Buildroot
+# might get installed into $(HOST_DIR)/usr/bin and therefore appears
+# in our PATH. This system perl will be used as INTLTOOL_PERL.
+export PERL=$(shell which perl)
+
+# host-intltool needs libxml-parser-perl, which Buildroot installs in
+# $(HOST_DIR)/usr/lib/perl, so we must make sure that the system perl
+# finds this perl module by exporting the proper value for PERL5LIB.
+export PERL5LIB=$(HOST_DIR)/usr/lib/perl
+
 TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
@@ -267,7 +278,8 @@ TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		STAGING_DIR="$(STAGING_DIR)"
+		STAGING_DIR="$(STAGING_DIR)" \
+		INTLTOOL_PERL=$(PERL)
 
 TARGET_MAKE_ENV = PATH=$(BR_PATH)
 
@@ -292,7 +304,8 @@ HOST_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
+		INTLTOOL_PERL=$(PERL)
 
 HOST_MAKE_ENV = PATH=$(BR_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index a7afe0d..549cb3b 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -10,9 +10,6 @@ INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPTS = \
-	PERL=`which perl` \
-	PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index f41a2f9..6577588 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,7 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME = $(ARCH)-linux
-PERL_RUN = $(HOST_DIR)/usr/bin/perl
+PERL_RUN = PERL5LIB= $(HOST_DIR)/usr/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
