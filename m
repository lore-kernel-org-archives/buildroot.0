From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 23:43:51 +0200
Subject: [Buildroot] [git commit] e2tools: new package
Message-ID: <20140420214751.92A5A9C90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42ec5e049af5c77f18e1facd52927b2f74ee3b9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E2tools is a simple set of GPL'ed utilities to read, write, and
manipulate files in an ext2/ext3 filesystem.  These utilities access a
filesystem directly using the ext2fs library.

[Thomas: add toolchain dependencies as needed, use full Git hash, use
github helper, add support for host version.]

Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/Config.in.host         |    1 +
 package/e2tools/Config.in      |   17 +++++++++++++++++
 package/e2tools/Config.in.host |   10 ++++++++++
 package/e2tools/e2tools.mk     |   19 +++++++++++++++++++
 5 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b9b77ba..1361e9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -135,6 +135,7 @@ source "package/cramfs/Config.in"
 source "package/curlftpfs/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/e2tools/Config.in"
 source "package/ecryptfs-utils/Config.in"
 source "package/exfat/Config.in"
 source "package/exfat-utils/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index ac6091f..c6997e9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,6 +3,7 @@ menu "Host utilities"
 source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
+source "package/e2tools/Config.in.host"
 source "package/genext2fs/Config.in.host"
 source "package/genimage/Config.in.host"
 source "package/genpart/Config.in.host"
diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
new file mode 100644
index 0000000..13e2118
--- /dev/null
+++ b/package/e2tools/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_E2TOOLS
+	bool "e2tools"
+	select BR2_PACKAGE_E2FSPROGS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE # e2fsprogs
+	depends on BR2_USE_WCHAR # e2fsprogs
+	depends on BR2_USE_MMU # e2fsprogs
+	help
+	  E2tools is a simple set of GPL'ed utilities to read, write,
+	  and manipulate files in an ext2/ext3 filesystem.  These
+	  utilities access a filesystem directly using the ext2fs
+	  library.
+
+	  https://github.com/ndim/e2tools
+
+comment "e2tools needs a toolchain w/ threads, largefile and wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/e2tools/Config.in.host b/package/e2tools/Config.in.host
new file mode 100644
index 0000000..772262a
--- /dev/null
+++ b/package/e2tools/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_E2TOOLS
+	bool "host-e2tools"
+	select BR2_PACKAGE_HOST_E2FSPROGS
+	help
+	  E2tools is a simple set of GPL'ed utilities to read, write,
+	  and manipulate files in an ext2/ext3 filesystem.  These
+	  utilities access a filesystem directly using the ext2fs
+	  library.
+
+	  https://github.com/ndim/e2tools
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
new file mode 100644
index 0000000..97afcc0
--- /dev/null
+++ b/package/e2tools/e2tools.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# e2tools
+#
+################################################################################
+
+E2TOOLS_VERSION = 3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6
+E2TOOLS_SITE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION))
+
+# Source coming from github, no configure included.
+E2TOOLS_AUTORECONF = YES
+E2TOOLS_LICENSE = GPLv2
+E2TOOLS_LICENSE_FILES = COPYING
+E2TOOLS_DEPENDENCIES = e2fsprogs
+E2TOOLS_CONF_ENV = LIBS="-lpthread"
+HOST_E2TOOLS_CONF_ENV = LIBS="-lpthread"
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
