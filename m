From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:13:26 +0200
Subject: [Buildroot] [git commit] package/libiio: add support for Python 3.x
	bindings
Message-ID: <20171007210623.50DA281100@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c4b027f9da4f4432fc79b8eefe61c5c33b9ae8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python3 support was added to libiio in version 0.10.
This commit adds the option to compile libiio bindings if python3 was
selected instead of python.

Signed-off-by: B??la Becker <bela.becker@pcbdesign.hu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/Config.in | 2 +-
 package/libiio/libiio.mk | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 75f6f3a..baa1631 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -96,7 +96,7 @@ config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
 
 config BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON
 	bool "Install Python bindings"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Install the Python bindings.
 
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index d066ae0..0b13064 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -60,7 +60,11 @@ LIBIIO_DEPENDENCIES += avahi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBIIO_DEPENDENCIES += python
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBIIO_DEPENDENCIES += python3
+endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=OFF
