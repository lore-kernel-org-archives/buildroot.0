From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:31:06 +0200
Subject: [Buildroot] [git commit] reaver: new package
Message-ID: <20180412193650.A7F0388513@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55826eae7e2dc6c9536d2baf27bd5e7936bbcf66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reaver is a tool to audit networks against brute WPS pins attacks.

We use the github.com/t6x fork at the moment because other
versions/repos of this project won't cross-compile, and this fork is
the only one regularly updated and maintained.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/reaver/Config.in   |  9 +++++++++
 package/reaver/reaver.hash |  3 +++
 package/reaver/reaver.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 00cbaeff37..f52cb884db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -794,6 +794,7 @@ F:	package/sdl2/
 
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
+F:	package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
diff --git a/package/Config.in b/package/Config.in
index e48d0b4c64..2da86057fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1823,6 +1823,7 @@ endif
 	source "package/quagga/Config.in"
 	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
+	source "package/reaver/Config.in"
 	source "package/rp-pppoe/Config.in"
 	source "package/rpcbind/Config.in"
 	source "package/rsh-redone/Config.in"
diff --git a/package/reaver/Config.in b/package/reaver/Config.in
new file mode 100644
index 0000000000..0fd8ab7c6e
--- /dev/null
+++ b/package/reaver/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_REAVER
+	bool "reaver"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Reaver is a tool to audit networks against brute WPS pins
+	  attacks. It is complementary to "Aircrack-ng".
+
+	  https://code.google.com/archive/p/reaver-wps/wikis/README.wiki
+	  https://github.com/t6x/reaver-wps-fork-t6x
diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
new file mode 100644
index 0000000000..6d2baccdce
--- /dev/null
+++ b/package/reaver/reaver.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 350a89b068f8b461e6459b739d4f5f301db01f115d75f4d698a1f2830149c412 reaver-9bae55bd30b6d46b42da3a09dc23c8b0f9341996.tar.gz
+sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
new file mode 100644
index 0000000000..90d1727bad
--- /dev/null
+++ b/package/reaver/reaver.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# reaver
+#
+################################################################################
+
+# Older repos for this project will not cross-compile easily
+#??while this one works right away
+REAVER_VERSION = 9bae55bd30b6d46b42da3a09dc23c8b0f9341996
+REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
+REAVER_LICENSE = GPL-2.0+
+REAVER_LICENSE_FILES = docs/LICENSE
+
+REAVER_SUBDIR = src
+REAVER_DEPENDENCIES = libpcap
+
+$(eval $(autotools-package))
