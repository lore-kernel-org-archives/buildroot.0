From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:46:38 +0100
Subject: [Buildroot] [git commit branch/next] privoxy: new package
Message-ID: <20160220145751.CE3F380E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8a263fe361ab37ec6765b9ff6478c3b15e3d139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |  1 +
 package/privoxy/Config.in    | 12 ++++++++++++
 package/privoxy/privoxy.hash |  3 +++
 package/privoxy/privoxy.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 023a190..8aa6bb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1446,6 +1446,7 @@ endif
 	source "package/portmap/Config.in"
 	source "package/pppd/Config.in"
 	source "package/pptp-linux/Config.in"
+	source "package/privoxy/Config.in"
 	source "package/proftpd/Config.in"
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
diff --git a/package/privoxy/Config.in b/package/privoxy/Config.in
new file mode 100644
index 0000000..8d8d01a
--- /dev/null
+++ b/package/privoxy/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PRIVOXY
+	bool "privoxy"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
+	help
+	  A non-caching web proxy with advanced filtering capabilities
+	  for enhancing privacy, modifying web page data and HTTP
+	  headers, controlling access, and removing ads and other
+	  obnoxious Internet junk.
+
+	  http://www.privoxy.org/
diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
new file mode 100644
index 0000000..aea8f2d
--- /dev/null
+++ b/package/privoxy/privoxy.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.24%20%28stable%29/
+md5	44a47d1a5000db8cccd61ace0e25e7f7	privoxy-3.0.24-stable-src.tar.gz
+sha1	343c547a9e795ff029a78310963e0c04448975ee	privoxy-3.0.24-stable-src.tar.gz
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
new file mode 100644
index 0000000..4b5a1a6
--- /dev/null
+++ b/package/privoxy/privoxy.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# privoxy
+#
+################################################################################
+
+PRIVOXY_VERSION = 3.0.24
+PRIVOXY_SITE = http://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
+PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
+# configure not shipped
+PRIVOXY_AUTORECONF = YES
+PRIVOXY_DEPENDENCIES = pcre zlib
+PRIVOXY_LICENSE = GPLv2+
+PRIVOXY_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
