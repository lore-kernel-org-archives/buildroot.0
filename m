From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Feb 2020 18:47:13 +0100
Subject: [Buildroot] [PATCH/next 5/6] package/belr: new package
In-Reply-To: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
Message-ID: <20200227174714.3727844-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Belr is Belledonne Communications' language recognition library, written
in C++11. It parses text inputs formatted according to a language
defined by an ABNF grammar, such as the protocols standardized at IETF.

https://gitlab.linphone.org/BC/public/belr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/belr/Config.in | 19 +++++++++++++++++++
 package/belr/belr.hash |  3 +++
 package/belr/belr.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/belr/Config.in
 create mode 100644 package/belr/belr.hash
 create mode 100644 package/belr/belr.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b610c79ce3..a9c7b005cc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -825,6 +825,7 @@ F:	package/openzwave/
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
 F:	package/belle-sip/
+F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index 6f4d844ad0..d879078fc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1750,6 +1750,7 @@ menu "Other"
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
-- 
2.25.0
