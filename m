From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:32:47 +0100
Subject: [Buildroot] [git commit] package/benejson: build using host-python3
Message-ID: <20191029232731.21D3E8D7B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cca9156949a5b623028b62e993e15ccb765489d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...print-as-a-function-for-Py3-compatibility.patch | 31 ++++++++++++++++++++++
 package/benejson/benejson.mk                       |  4 +--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch b/package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch
new file mode 100644
index 0000000000..287d7bf034
--- /dev/null
+++ b/package/benejson/0002-Use-print-as-a-function-for-Py3-compatibility.patch
@@ -0,0 +1,31 @@
+Use print as a function in SConstruct build file for Py3 compatibility.
+This allow to run SCons on Python 3
+
+[Upstream status: https://github.com/codehero/benejson/pull/12]
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+---
+ benejson/SConscript | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/benejson/SConscript b/benejson/SConscript
+index b7c5d10..80b4875 100644
+--- a/benejson/SConscript
++++ b/benejson/SConscript
+@@ -9,11 +9,11 @@ lib_env = lib_env.Clone()
+ conf = Configure(lib_env)
+ 
+ if not conf.CheckFunc("stpcpy"):
+-	print "Did not find stpcpy(), using bnj local version"
++	print("Did not find stpcpy(), using bnj local version")
+ 	conf.env.Append(CPPDEFINES = ["-Dstpcpy=bnj_local_stpcpy"])
+ 
+ if not conf.CheckFunc("stpncpy"):
+-	print "Did not find stpncpy(), using bnj local version"
++	print("Did not find stpncpy(), using bnj local version")
+ 	conf.env.Append(CPPDEFINES = ["-Dstpncpy=bnj_local_stpncpy"])
+ lib_env = conf.Finish()
+ 
+-- 
+2.21.0
+
diff --git a/package/benejson/benejson.mk b/package/benejson/benejson.mk
index 0faf5f1cc4..5bb57d028d 100644
--- a/package/benejson/benejson.mk
+++ b/package/benejson/benejson.mk
@@ -9,7 +9,7 @@ BENEJSON_SITE = $(call github,codehero,benejson,$(BENEJSON_VERSION))
 BENEJSON_LICENSE = MIT
 BENEJSON_LICENSE_FILES = LICENSE
 BENEJSON_INSTALL_STAGING = YES
-BENEJSON_DEPENDENCIES = host-python host-scons
+BENEJSON_DEPENDENCIES = host-python3 host-scons
 
 # wchar support needs to be manually disabled
 ifeq ($(BR2_USE_WCHAR),)
@@ -41,7 +41,7 @@ endif # Shared enabled
 define BENEJSON_BUILD_CMDS
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
-		$(HOST_DIR)/bin/python2 $(SCONS) $(BENEJSON_SCONS_TARGETS))
+		$(HOST_DIR)/bin/python3 $(SCONS) $(BENEJSON_SCONS_TARGETS))
 endef
 
 define BENEJSON_INSTALL_STAGING_CMDS
