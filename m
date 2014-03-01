From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 00:13:13 +0100
Subject: [Buildroot] [git commit] ljlinenoise: new package
Message-ID: <20140301231341.6E5A799371@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=34d406a0aad73e3880b248a8fd5c2f0ef64b5b27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: indicate that ljsyscall is a run-time dependency only.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/ljlinenoise/Config.in      |   17 +++++++++++++++++
 package/ljlinenoise/ljlinenoise.mk |   13 +++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f390268..a519b97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ source "package/cosmo/Config.in"
 source "package/coxpcall/Config.in"
 source "package/dado/Config.in"
 source "package/lbase64/Config.in"
+source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lpeg/Config.in"
 source "package/lpty/Config.in"
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
new file mode 100644
index 0000000..17be1be
--- /dev/null
+++ b/package/ljlinenoise/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LJLINENOISE
+	bool "ljlinenoise"
+	# run-time dependency only
+	select BR2_PACKAGE_LJSYSCALL
+	# ljsyscall is specifically for LuaJIT, not Lua.
+	depends on BR2_PACKAGE_LUAJIT
+	# ljsyscall is only available for some target architectures
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	help
+	  ljlinenoise is a pure LuaJIT port of linenoise,
+	  a small alternative to readline and libedit.
+
+	  http://fperrad.github.io/ljlinenoise/
+
+comment "ljlinenoise needs LuaJIT"
+	depends on !BR2_PACKAGE_LUAJIT
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
new file mode 100644
index 0000000..69f6130
--- /dev/null
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# ljlinenoise
+#
+################################################################################
+
+LJLINENOISE_VERSION_UPSTREAM = 0.1.1
+LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
+LJLINENOISE_SUBDIR  = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
+LJLINENOISE_LICENSE = MIT
+LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
