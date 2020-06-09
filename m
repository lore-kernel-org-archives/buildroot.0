From: Ralph Siemsen <ralphs@netwinder.org>
Date: Tue,  9 Jun 2020 19:12:57 -0400
Subject: [Buildroot] [PATCH] package/systemtap: new package
Message-ID: <20200609231257.275131-1-ralphs@netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SystemTap provides a simple command line interface and scripting
language for writing instrumentation for a live running kernel plus
user-space applications.

This is a minimal implementation; not all supported features of
systemtap are enabled.
---
Note that I am not a systemtap expert, in fact, I only got involved
helping someone else get this to build under buildroot. Hence YMMV.
Yann requested that I post this patch to the list, so here we are.

 package/Config.in              |  1 +
 package/systemtap/Config.in    | 10 ++++++++++
 package/systemtap/systemtap.mk | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/systemtap/Config.in
 create mode 100644 package/systemtap/systemtap.mk

diff --git a/package/Config.in b/package/Config.in
index c328d9f153..90b1b1b730 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -135,6 +135,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/stress-ng/Config.in"
 	source "package/sysdig/Config.in"
 	source "package/sysprof/Config.in"
+	source "package/systemtap/Config.in"
 	source "package/tcf-agent/Config.in"
 	source "package/tinymembench/Config.in"
 	source "package/trace-cmd/Config.in"
diff --git a/package/systemtap/Config.in b/package/systemtap/Config.in
new file mode 100644
index 0000000000..9194b86caf
--- /dev/null
+++ b/package/systemtap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SYSTEMTAP
+	bool "systemtap"
+	select BR2_PACKAGE_ELFUTILS # -ldw
+	select BR2_PACKAGE_PYTHON3
+	help
+	  SystemTap provides a simple command line interface and scripting
+	  language for writing instrumentation for a live running kernel
+	  plus user-space applications.
+
+	  https://sourceware.org/systemtap/
diff --git a/package/systemtap/systemtap.mk b/package/systemtap/systemtap.mk
new file mode 100644
index 0000000000..d9228f25ca
--- /dev/null
+++ b/package/systemtap/systemtap.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# systemtap
+#
+################################################################################
+
+SYSTEMTAP_VERSION= release-4.2
+SYSTEMTAP_SITE = https://sourceware.org/git/systemtap.git
+SYSTEMTAP_SITE_METHOD = git
+SYSTEMTAP_DEPENDENCIES = elfutils python3
+
+# Systemtap includes cpython support. To cross-compile this
+# seems to require setting _PYTHON_SYSCONFIGDATA_NAME. The
+# following was adapted from package/pkg-python.mk
+
+SYSTEMTAP_MAKE_ENV = \
+        PATH=$(BR_PATH) \
+        $(TARGET_CONFIGURE_OPTS) \
+        LDSHARED="$(TARGET_CROSS)gcc -shared" \
+        PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
+        PYTHONNOUSERSITE=1 \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
+        _python_sysroot=$(STAGING_DIR) \
+        _python_prefix=/usr \
+        _python_exec_prefix=/usr
+
+# Note that systemtap has additional optional dependencies,
+# such as libvirt and xml for vir support, java support, and
+# avahi and nss for compile server support. These are not
+# currently handled by this build script.
+
+$(eval $(autotools-package))
-- 
2.17.1
