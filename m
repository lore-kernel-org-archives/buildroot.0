From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 11:46:59 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/belr: new package
Message-ID: <20210130103323.C1F708111E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1672c2e672b706041551a5decf461ff6bec966c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Belr is Belledonne Communications' language recognition library, written
in C++11. It parses text inputs formatted according to a language
defined by an ABNF grammar, such as the protocols standardized at IETF.

https://gitlab.linphone.org/BC/public/belr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/belr/Config.in | 19 +++++++++++++++++++
 package/belr/belr.hash |  3 +++
 package/belr/belr.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 96055b3912..c31fcd2ce6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -800,6 +800,7 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/belle-sip/
+F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/duktape/
diff --git a/package/Config.in b/package/Config.in
index 78da6a8142..3deafedb0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1745,6 +1745,7 @@ menu "Other"
 	source "package/avro-c/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
+	source "package/belr/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
diff --git a/package/belr/Config.in b/package/belr/Config.in
new file mode 100644
index 0000000000..f3f742ad28
--- /dev/null
+++ b/package/belr/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BELR
+	bool "belr"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # bctoolbox
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
+	select BR2_PACKAGE_BCTOOLBOX
+	help
+	  Belr is Belledonne Communications' language recognition
+	  library, written in C++11. It parses text inputs formatted
+	  according to a language defined by an ABNF grammar, such as
+	  the protocols standardized at IETF.
+
+	  https://gitlab.linphone.org/BC/public/belr
+
+comment "belr needs a toolchain w/ threads, C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "belr needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belr/belr.hash b/package/belr/belr.hash
new file mode 100644
index 0000000000..42cf506972
--- /dev/null
+++ b/package/belr/belr.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d6575c36c32828edcaf39df2775070b187019b21fe5fe274e7a85caf54284f05  belr-4.3.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belr/belr.mk b/package/belr/belr.mk
new file mode 100644
index 0000000000..8855f94fda
--- /dev/null
+++ b/package/belr/belr.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# belr
+#
+################################################################################
+
+BELR_VERSION = 4.3.1
+BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
+BELR_LICENSE = GPL-3.0+
+BELR_LICENSE_FILES = LICENSE.txt
+BELR_INSTALL_STAGING = YES
+BELR_DEPENDENCIES = bctoolbox
+BELR_CONF_OPTS = \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TESTS=OFF \
+	-DENABLE_TOOLS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
+endif
+
+$(eval $(cmake-package))
