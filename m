From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 20:09:34 +0100
Subject: [Buildroot] [git commit] util-linux: Add an option to compile
	'nsenter' binary.
Message-ID: <20141226191005.363B980425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21d6e4ea459b0b3a436c7936a94a917f085919e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nsenter is a tool to enter the namespace of another process.

[Thomas: add dependency to 3.0 kernel headers, since the setns()
system call was added in Linux 3.0.]

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     |    9 +++++++++
 package/util-linux/util-linux.mk |    1 +
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5dfd050..a8dfa1c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -118,6 +118,15 @@ config BR2_PACKAGE_UTIL_LINUX_MESG
 	help
 	  Control write access to your terminal
 
+config BR2_PACKAGE_UTIL_LINUX_NSENTER
+	bool "nsenter"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	help
+	  Enter the namespaces of another process.
+
+comment "nsenter needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "mount/umount"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index e06fa9a..a530596 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -74,6 +74,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
