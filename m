From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 22:25:16 +0200
Subject: [Buildroot] [git commit] package/resiprocate: new package
Message-ID: <20200720202108.9D71C87B6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3883964a3468a226fffe01f69a361621a3819a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

reSIProcate is a framework that aims to fully implement the SIP
protocol in first class C++. It is intended for use in other
applications, such as the repro SIP proxy.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/resiprocate/Config.in        | 48 ++++++++++++++++++++++++++++++++++++
 package/resiprocate/resiprocate.hash |  4 +++
 package/resiprocate/resiprocate.mk   | 47 +++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bed3e7439..043e8ce3f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2245,6 +2245,7 @@ F:	package/miraclecast/
 F:	package/python-pysnmp/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
+F:	package/resiprocate/
 F:	package/websocketpp/
 
 N:	Ryan Coe <bluemrp9@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 22531d4fb5..7ab1112644 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1768,6 +1768,7 @@ menu "Networking"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
+	source "package/resiprocate/Config.in"
 	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
new file mode 100644
index 0000000000..ed57e09c1b
--- /dev/null
+++ b/package/resiprocate/Config.in
@@ -0,0 +1,48 @@
+comment "resiprocate needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_RESIPROCATE
+	bool "resiprocate"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_C_ARES
+	help
+	  reSIProcate is a framework that aims to fully implement the
+	  SIP protocol in first class C++. It is intended for use in
+	  other applications, such as the repro SIP proxy.
+
+	  By default this package provides the core libraries: librutil
+	  (utilities), libresip (SIP stack/RFC compliant message
+	  parsing) and libdum (SIP Dialog Usage Manager, a state
+	  machine for SIP dialogs).
+
+	  https://www.resiprocate.org/
+
+if BR2_PACKAGE_RESIPROCATE
+
+config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
+	bool "DTLS support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enable DTLS support (requires OpenSSL)
+
+config BR2_PACKAGE_RESIPROCATE_REND
+	bool "resiprocate-rend"
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
+	help
+	  Rend is tool that is was created specifically to load test
+	  gtSIP based presence servers.
+
+config BR2_PACKAGE_RESIPROCATE_APPS
+	bool "resiprocate-apps"
+	select BR2_PACKAGE_PCRE
+	help
+	  Build apps clicktocall and sipdial
+
+endif # BR2_PACKAGE_RESIPROCATE
diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
new file mode 100644
index 0000000000..03336c64a2
--- /dev/null
+++ b/package/resiprocate/resiprocate.hash
@@ -0,0 +1,4 @@
+# http://list.resiprocate.org/pipermail/resiprocate-announce/2020-May/000000.html
+sha256  046826503d3c8682ae0e42101b28f903c5f988235f1ff4a98dbfb9066d0d3d49  resiprocate-1.12.0.tar.gz
+# Locally Computed
+sha256  16b0fd1938a10fcd145904cc2dad74500fef9d27fc15b44cf8e8f92011f94d35  COPYING
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
new file mode 100644
index 0000000000..e4915eec59
--- /dev/null
+++ b/package/resiprocate/resiprocate.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# resiprocate
+#
+################################################################################
+
+RESIPROCATE_VERSION = 1.12.0
+RESIPROCATE_SITE =  https://www.resiprocate.org/files/pub/reSIProcate/releases
+# For complete details see https://www.resiprocate.org/License
+RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
+RESIPROCATE_LICENSE_FILES = COPYING
+RESIPROCATE_INSTALL_STAGING = YES
+
+# Utilize c-ares from buildroot instead built in ARES library
+# NOTE: resiprocate doesn't support --without-<feature> syntax as it will try
+#       to build with package if specified
+RESIPROCATE_DEPENDENCIES = c-ares
+RESIPROCATE_CONF_OPTS = -with-c-ares \
+	--with-sysroot="$(STAGING_DIR)"
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RESIPROCATE_DEPENDENCIES += openssl host-pkgconf
+RESIPROCATE_CONF_OPTS += --with-ssl
+# Configure.ac does not include '-lz' when statically linking against openssl
+RESIPROCATE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
+endif
+
+ifeq ($(BR2_PACKAGE_POPT),y)
+RESIPROCATE_CONF_OPTS += --with-popt
+RESIPROCATE_DEPENDENCIES += popt
+endif
+
+ifeq ($(BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT),y)
+RESIPROCATE_CONF_OPTS += --with-dtls
+endif
+
+ifeq ($(BR2_PACKAGE_RESIPROCATE_REND),y)
+RESIPROCATE_CONF_OPTS += --with-rend
+RESIPROCATE_DEPENDENCIES += boost
+endif
+
+ifeq ($(BR2_PACKAGE_RESIPROCATE_APPS),y)
+RESIPROCATE_CONF_OPTS += --with-apps
+RESIPROCATE_DEPENDENCIES += pcre
+endif
+
+$(eval $(autotools-package))
