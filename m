From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Thu, 12 Apr 2018 11:16:59 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: new package
Message-ID: <1523524619-25036-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reaver is a tool to audit networks against brute WPS pins attacks.

It is a generic autotools package, easy to build. Tests passed for the 7 default
toolchains. 

It is mandantory to use the github.com/t6x fork that I set in reaver.mk
at the moment because other versions/repos of this project won't cross-compile.
Their makefiles are pretty outdated. It is the only updated and regularly maintained
repo that I found for this project at the moment.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 DEVELOPERS                 |  3 ++-
 package/Config.in          |  1 +
 package/reaver/Config.in   | 10 ++++++++++
 package/reaver/reaver.hash |  3 +++
 package/reaver/reaver.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/reaver/Config.in
 create mode 100644 package/reaver/reaver.hash
 create mode 100644 package/reaver/reaver.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 00cbaef..390d7f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -792,8 +792,9 @@ F:	package/c-icap/
 F:	package/c-icap-modules/
 F:	package/sdl2/
 
-N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
+N:	Guillaume W. Bres <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
+F: package/reaver/
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
diff --git a/package/Config.in b/package/Config.in
index e48d0b4..2da8605 100644
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
index 0000000..fed433b
--- /dev/null
+++ b/package/reaver/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_REAVER
+	bool "reaver"
+	select BR2_PACKAGE_LIBPCAP
+
+	help
+	  Reaver is a tool to audit networks against
+	  brute WPS pins attacks. It is complementary
+	  to "Aircrack-ng".
+
+	  https://code.google.com/archive/p/reaver-wps/wikis/README.wiki
diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
new file mode 100644
index 0000000..6d2bacc
--- /dev/null
+++ b/package/reaver/reaver.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256 350a89b068f8b461e6459b739d4f5f301db01f115d75f4d698a1f2830149c412 reaver-9bae55bd30b6d46b42da3a09dc23c8b0f9341996.tar.gz
+sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
new file mode 100644
index 0000000..77dc3ab
--- /dev/null
+++ b/package/reaver/reaver.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# reaver
+#
+################################################################################
+
+REAVER_VERSION = 9bae55bd30b6d46b42da3a09dc23c8b0f9341996
+REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
+REAVER_LICENSE = GPL-2.0+
+REAVER_LICENSE_FILES = docs/LICENSE
+
+REAVER_SUBDIR = src
+REAVER_DEPENDENCIES = libpcap
+
+$(eval $(autotools-package))
-- 
2.7.4
