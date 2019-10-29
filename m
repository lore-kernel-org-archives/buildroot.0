From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:41:52 +0100
Subject: [Buildroot] [git commit] package/dbus-python: drop dbus-glib
 dependency
Message-ID: <20191029233709.7FCE18DB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3db8622f311f46cea9dcc2f9dbed48ca543b2e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dbus-glib is not required since version 1.2.8 and
https://github.com/freedesktop/dbus-python/commit/28098f2c7c23bdef9247c5dfbb8437ca3f03dac4

Parts of dbus-glib have been copied into dbus-python instead. It can
only use the bundled copy, not the system dbus-glib.

So drop it and add dbus-gmain/COPYING to license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus-python/Config.in        | 2 +-
 package/dbus-python/dbus-python.hash | 1 +
 package/dbus-python/dbus-python.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 332726348d..4bfb59ed91 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DBUS_PYTHON
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
 	# pyexpat: runtime dependency only
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
diff --git a/package/dbus-python/dbus-python.hash b/package/dbus-python/dbus-python.hash
index d5448249b4..58b0a75908 100644
--- a/package/dbus-python/dbus-python.hash
+++ b/package/dbus-python/dbus-python.hash
@@ -3,3 +3,4 @@ sha256	cdd4de2c4f5e58f287b12013ed7b41dee81d503c8d0d2397c5bd2fb01badf260	dbus-pyt
 
 # Locally calculated
 sha256	1e4562245383fdb5203b1769789e5b28bba21af4923aea7e8b2614f7f93623c0	COPYING
+sha256	064523e3ab64d6f03904132b2cc4a1bd8500586edb4cd050c2ff2b96aed4c33b	dbus-gmain/COPYING
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 33f2358876..cf4882d8ee 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -7,10 +7,10 @@
 DBUS_PYTHON_VERSION = 1.2.12
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python
 DBUS_PYTHON_INSTALL_STAGING = YES
-DBUS_PYTHON_LICENSE = MIT
-DBUS_PYTHON_LICENSE_FILES = COPYING
-DBUS_PYTHON_DEPENDENCIES = dbus-glib
-HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus-glib
+DBUS_PYTHON_LICENSE = MIT (dbus-python), AFL-2.1 or GPL-2.0+ (dbus-gmain)
+DBUS_PYTHON_LICENSE_FILES = COPYING dbus-gmain/COPYING
+DBUS_PYTHON_DEPENDENCIES = dbus libglib2
+HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus host-libglib2
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
