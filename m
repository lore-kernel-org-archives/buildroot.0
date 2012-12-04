From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Dec 2012 10:21:45 -0800
Subject: [Buildroot] [git commit] package: add jamvm jvm
Message-ID: <20121204190928.548AC99716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae10e33a504770b0141dd7582c6ca26fc43b4642
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/jamvm/Config.in |    9 +++++++++
 package/jamvm/jamvm.mk  |   11 +++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66e8352..f95e29d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -268,6 +268,7 @@ endmenu
 menu "Interpreter languages and scripting"
 source "package/erlang/Config.in"
 source "package/haserl/Config.in"
+source "package/jamvm/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
new file mode 100644
index 0000000..852c6e8
--- /dev/null
+++ b/package/jamvm/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_JAMVM
+	bool "jamvm"
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_CLASSPATH
+	help
+	  JamVM is a new Java Virtual Machine which conforms to the
+	  JVM specification version 2 (blue book).
+
+	  http://jamvm.sf.net
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
new file mode 100644
index 0000000..f0765d7
--- /dev/null
+++ b/package/jamvm/jamvm.mk
@@ -0,0 +1,11 @@
+JAMVM_VERSION = 1.5.4
+JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
+JAMVM_DEPENDENCIES = zlib classpath
+# int inlining seems to crash jamvm, don't build shared version of internal lib
+JAMVM_CONF_OPT = \
+	--with-classpath-install-dir=/usr \
+	--disable-int-inlining \
+	--disable-shared \
+	--without-pic
+
+$(eval $(autotools-package))
