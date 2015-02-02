From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 22:49:55 +0100
Subject: [Buildroot] [git commit] odhcp6c: new package
Message-ID: <20150202221044.834D080555@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4656f570fcbbaf257d18833f8d9b481f6b7fcd64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Clouter <alex+buildroot@digriz.org.uk>
[ThomasDS: needs ipv6; rewrap package/odhcp6c/Config.in]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile-tested on x86/glibc, armel/glibc, armel/uclibc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/odhcp6c/Config.in  |   11 +++++++++++
 package/odhcp6c/odhcp6c.mk |   12 ++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bcd1481..0f5836b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1135,6 +1135,7 @@ endif
 	source "package/noip/Config.in"
 	source "package/ntp/Config.in"
 	source "package/nuttcp/Config.in"
+	source "package/odhcp6c/Config.in"
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
 	source "package/openntpd/Config.in"
diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
new file mode 100644
index 0000000..92de0e5
--- /dev/null
+++ b/package/odhcp6c/Config.in
@@ -0,0 +1,11 @@
+comment "odhcp6c needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_ODHCP6C
+	bool "odhcp6c"
+	depends on BR2_INET_IPV6
+	help
+	  odhcp6c is a minimal DHCPv6 and RA-client for use in embedded Linux
+	  systems, especially routers.
+
+	  https://github.com/sbyx/odhcp6c
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
new file mode 100644
index 0000000..db963e0
--- /dev/null
+++ b/package/odhcp6c/odhcp6c.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# odhcp6c
+#
+################################################################################
+
+ODHCP6C_VERSION = c42e34111e19bd435dc4b5bb3ba81224ea214314
+ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
+ODHCP6C_LICENSE = GPLv2
+ODHCP6C_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
