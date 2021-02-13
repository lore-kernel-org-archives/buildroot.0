From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Feb 2021 12:39:28 +0100
Subject: [Buildroot] [PATCH] package/janet: new package
Message-ID: <20210213113928.3441398-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/janet/Config.in  | 10 ++++++++++
 package/janet/janet.hash |  5 +++++
 package/janet/janet.mk   | 22 ++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/janet/Config.in
 create mode 100644 package/janet/janet.hash
 create mode 100644 package/janet/janet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 361ee2f35..3c7fd222e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -920,6 +920,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/janet/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 5304ab141..8fb173540 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ endif
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
+	source "package/janet/Config.in"
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
diff --git a/package/janet/Config.in b/package/janet/Config.in
new file mode 100644
index 000000000..0e25ce34e
--- /dev/null
+++ b/package/janet/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_JANET
+	bool "janet"
+	help
+	  Janet is a functional and imperative programming language.
+	  The entire language (core library, interpreter, compiler,
+	  assembler, PEG) is less than 1MB. You can also add Janet
+	  scripting to an application by embedding a single C file
+	  and two headers.
+
+	  https://janet-lang.org/
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
new file mode 100644
index 000000000..4a1167f8e
--- /dev/null
+++ b/package/janet/janet.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  e2cf16b330e47c858a675ac79b5a0af83727ff041efcb133a80f36bedfae57c4  janet-1.15.0.tar.gz
+
+# Locally calculated
+sha256  1114e280d850605ae71b656dfc88115ab06081e8157720a2497f50edf50b110e  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
new file mode 100644
index 000000000..7243d60c0
--- /dev/null
+++ b/package/janet/janet.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# janet
+#
+################################################################################
+
+JANET_VERSION = 1.15.0
+JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
+JANET_LICENSE = MIT
+JANET_LICENSE_FILES = LICENSE
+
+JANET_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+JANET_CONF_OPTS += -Ddynamic_modules=false
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+JANET_CONF_OPTS += -Dsingle_threaded=true
+endif
+
+$(eval $(meson-package))
-- 
2.27.0
