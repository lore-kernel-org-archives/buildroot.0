From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Mar 2017 21:49:49 +0100
Subject: [Buildroot] [git commit] firejail: new package
Message-ID: <20170307204953.E61EB82272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0524f90a2fbdd05ed5b633a30979773f9904b156
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Firejail Security Sandbox
https://firejail.wordpress.com/

Lightweight application sandboxing system using seccomp and kernel
namespaces.

Signed-off-by: Chris Frederick <cdf123@cdf123.net>
[Thomas:
 - Fix DEVELOPERS entry: use <> around the e-mail address instead of ()
 - firejail builds fine with musl, so only exclude uclibc, which fails
   to build with EM_ARM undeclared
 - Update to upstream version 0.9.44.8.
 - Remove FIREJAIL_MAKE_OPTS, as suggested by Romain Naour.
 - Pass --enable-busybox-workaround only if Busybox is enabled, as
   suggested by Romain Naour.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/firejail/Config.in     | 19 +++++++++++++++++++
 package/firejail/firejail.hash |  3 +++
 package/firejail/firejail.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ff72ca1..6c74cac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -299,6 +299,9 @@ F:	package/libdvbsi/
 F:	package/libsvg/
 F:	package/libsvg-cairo/
 
+N:	Chris Frederick <chrisf@cdf123.net>
+F:	package/firejail/
+
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/eventlog/
 F:	package/micropython/
diff --git a/package/Config.in b/package/Config.in
index cfe7fc6..9eb6a22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1774,6 +1774,7 @@ menu "System tools"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
+	source "package/firejail/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
 	source "package/htop/Config.in"
diff --git a/package/firejail/Config.in b/package/firejail/Config.in
new file mode 100644
index 0000000..8c5338e
--- /dev/null
+++ b/package/firejail/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_FIREJAIL
+	bool "firejail"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# uClibc: error: ???EM_ARM??? undeclared
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	help
+	  Firejail is a SUID program that reduces the risk of security
+	  breaches by restricting the running environment of untrusted
+	  applications using Linux namespaces and seccomp-bpf. It
+	  allows a process and all its descendants to have their own
+	  private view of the globally shared kernel resources, such
+	  as the network stack, process table, mount table.
+
+	  https://firejail.wordpress.com/
+
+comment "firejail needs a glibc or musl toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/firejail/firejail.hash b/package/firejail/firejail.hash
new file mode 100644
index 0000000..0cb86b4
--- /dev/null
+++ b/package/firejail/firejail.hash
@@ -0,0 +1,3 @@
+# From https://sourceforge.net/projects/firejail/files/firejail/
+md5 7e6dca7202b1d70105b39646755cc620 firejail-0.9.44.8.tar.xz
+sha1 019423df0aee84d474f9fcd1f6a871a2fe8aa9a5 firejail-0.9.44.8.tar.xz
diff --git a/package/firejail/firejail.mk b/package/firejail/firejail.mk
new file mode 100644
index 0000000..c1fab29
--- /dev/null
+++ b/package/firejail/firejail.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# firejail
+#
+################################################################################
+
+FIREJAIL_VERSION = 0.9.44.8
+FIREJAIL_SITE = http://download.sourceforge.net/firejail
+FIREJAIL_SOURCE = firejail-$(FIREJAIL_VERSION).tar.xz
+FIREJAIL_LICENSE = GPLv2+
+FIREJAIL_LICENSE_FILES = COPYING
+
+FIREJAIL_CONF_OPTS = \
+	--enable-bind \
+	--enable-file-transfer \
+	--enable-network \
+	--enable-seccomp \
+	--enable-userns
+
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+FIREJAIL_CONF_OPTS += --enable-busybox-workaround
+endif
+
+define FIREJAIL_PERMISSIONS
+	/usr/bin/firejail f 4755 0 0 - - - - -
+endef
+
+$(eval $(autotools-package))
