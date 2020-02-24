From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Feb 2020 19:26:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/rtrlib: new package
In-Reply-To: <20200224172652.30932-1-vadim4j@gmail.com>
References: <20200224172652.30932-1-vadim4j@gmail.com>
Message-ID: <20200224172652.30932-3-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The RTRlib implements the client-side of the RPKI-RTR protocol (RFC
6810), (RFC 8210) and BGP Prefix Origin Validation (RFC 6811). This also
enables the maintenance of router keys. Router keys are required to
deploy BGPSEC.

It is required by frr package.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/rtrlib/Config.in   | 13 +++++++++++++
 package/rtrlib/rtrlib.hash |  2 ++
 package/rtrlib/rtrlib.mk   | 20 ++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/rtrlib/Config.in
 create mode 100644 package/rtrlib/rtrlib.hash
 create mode 100644 package/rtrlib/rtrlib.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7d3d1ca11a..e07236937b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2479,6 +2479,7 @@ N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/gettext-tiny/
 F:	package/tinyssh/
+F:	package/rtrlib/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
diff --git a/package/Config.in b/package/Config.in
index dfa3f34b9d..60bf9aac10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1724,6 +1724,7 @@ menu "Networking"
 	source "package/rabbitmq-c/Config.in"
 	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
+	source "package/rtrlib/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
diff --git a/package/rtrlib/Config.in b/package/rtrlib/Config.in
new file mode 100644
index 0000000000..440eeb5d63
--- /dev/null
+++ b/package/rtrlib/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RTRLIB
+	bool "rtrlib"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	help
+	  An open-source C implementation of the RPKI/Router Protocol client.
+
+	  http://rtrlib.realmv6.org
+
+comment "rtrlib requires toolchain w/ threads, SSP"
+	  depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		  !BR2_TOOLCHAIN_HAS_SSP
+
diff --git a/package/rtrlib/rtrlib.hash b/package/rtrlib/rtrlib.hash
new file mode 100644
index 0000000000..3fb590bceb
--- /dev/null
+++ b/package/rtrlib/rtrlib.hash
@@ -0,0 +1,2 @@
+sha256 f6e825cedadac970f681e3714dad396fd62cb811b98a94d8e8e02e0c5abe765a  LICENSE
+sha256 79fbfaa624dd4b53b304cd7c755ee31219b53558a5ee21eb81ca796356190af6  rtrlib-0.7.0.tar.gz
diff --git a/package/rtrlib/rtrlib.mk b/package/rtrlib/rtrlib.mk
new file mode 100644
index 0000000000..4385484bf1
--- /dev/null
+++ b/package/rtrlib/rtrlib.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rtrlib
+#
+################################################################################
+
+RTRLIB_VERSION = 0.7.0
+RTRLIB_SITE = $(call github,rtrlib,rtrlib,v$(RTRLIB_VERSION))
+RTRLIB_LICENSE = MIT
+RTRLIB_LICENSE_FILES = LICENSE
+RTRLIB_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+RTRLIB_CONF_OPTS += -DRTRLIB_TRANSPORT_SSH=Yes
+RTRLIB_DEPENDENCIES += libssh
+else
+RTRLIB_CONF_OPTS += -DRTRLIB_TRANSPORT_SSH=No
+endif
+
+$(eval $(cmake-package))
-- 
2.17.1
