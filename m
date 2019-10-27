From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 22:14:41 +0100
Subject: [Buildroot] [git commit] package/python: add option to build on the
 host
Message-ID: <20191027210813.7F3978A698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8f3057da37a5c6f30935e127ae6a15437f2508f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some python scripts may be ran in the custom scripts a user can define
in the config. Allow the user to enable host-python explicitly.

If any of those require ssl, they will fail with no possible fix.
Add an option to enable openssl as well. This is made optional because
openssl significantly increases the build time.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in.host        |  1 +
 package/python/Config.in.host | 16 ++++++++++++++++
 package/python/python.mk      |  7 ++++++-
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 3253f9f361..914491e210 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -52,6 +52,7 @@ menu "Host utilities"
 	source "package/pkgconf/Config.in.host"
 	source "package/pru-software-support/Config.in.host"
 	source "package/pwgen/Config.in.host"
+	source "package/python/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-six/Config.in.host"
diff --git a/package/python/Config.in.host b/package/python/Config.in.host
new file mode 100644
index 0000000000..724e5e223a
--- /dev/null
+++ b/package/python/Config.in.host
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_HOST_PYTHON
+	bool "host python"
+	help
+	  The python language interpreter. Host package.
+
+	  http://www.python.org/
+
+if BR2_PACKAGE_HOST_PYTHON
+
+config BR2_PACKAGE_HOST_PYTHON_SSL
+	bool "ssl"
+	select BR2_PACKAGE_HOST_OPENSSL
+	help
+	  _ssl module for host Python.
+
+endif
diff --git a/package/python/python.mk b/package/python/python.mk
index 4b82cdcce3..8c2b195c91 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -32,7 +32,6 @@ HOST_PYTHON_CONF_OPTS += \
 	--disable-bsddb \
 	--disable-test-modules \
 	--disable-bz2 \
-	--disable-ssl \
 	--disable-ossaudiodev \
 	--disable-pyo-build
 
@@ -58,6 +57,12 @@ PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
+HOST_PYTHON_DEPENDENCIES += host-openssl
+else
+HOST_PYTHON_CONF_OPTS += --disable-ssl
+endif
+
 PYTHON_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
