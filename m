From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 23:22:19 +0100
Subject: [Buildroot] [git commit] netsnmp: Add option for using minimal
	internal SSL code
Message-ID: <20150302222720.BB0D9807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=415d42e12f36d8b0ea48fcf415d80eca2a7a5cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add option for enabling a minimal internal copy of OpenSSL usable for USM
security. It will not enable the usage of SNMP over (D)TLS.

[Thomas: use 'else ifeq' to avoid having another nested ifeq ... endif
block.]

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/Config.in  |    7 +++++++
 package/netsnmp/netsnmp.mk |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index 589f720..47a53d7 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -49,4 +49,11 @@ config BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING
 	  support, including the ability to log with DEBUGMSG(),
 	  DEBUGMSGTL() and companion macros.
 
+config BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL
+	bool "Enable minimal internal OpenSSL code"
+	depends on !BR2_PACKAGE_OPENSSL
+	help
+	  Enable a minimal internal copy of OpenSSL usable for USM
+	  security. It will not enable the usage of SNMP over (D)TLS.
+
 endif
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 58b52ef..655552c 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -54,6 +54,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
 	# openssl uses zlib, so we need to explicitly link with it when static
 	NETSNMP_CONF_ENV += LIBS=-lz
 endif
+else ifeq ($(BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL),y)
+	NETSNMP_CONF_OPTS += --with-openssl=internal
 else
 	NETSNMP_CONF_OPTS += --without-openssl
 endif
