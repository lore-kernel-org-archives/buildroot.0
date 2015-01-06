From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Jan 2015 11:42:29 -0300
Subject: [Buildroot] [PATCH] gzip: fix installation path
Message-ID: <1420555349-22671-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make gzip install binaries to / rather than /usr to fix bug #7766, it's
the FHS mandated target.

This also avoids duplicating binaries with busybox when both are
installed.

Also make gzip install after busybox if both are enabled to make the
proper gzip package override any busybox version since it's usually more
lightweight in functionality and slower.

And add a hash file while at it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gzip/gzip.hash | 2 ++
 package/gzip/gzip.mk   | 4 ++++
 2 files changed, 6 insertions(+)
 create mode 100644 package/gzip/gzip.hash

diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
new file mode 100644
index 0000000..56f052f
--- /dev/null
+++ b/package/gzip/gzip.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	37dfed1a485d53212c43b3fa2a7c7952f09bf5cd86e37121c222341ee1b27847  gzip-1.6.tar.xz
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index e1a7bef..4ae2ae0 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -7,6 +7,10 @@
 GZIP_VERSION = 1.6
 GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
+# Some other tools expect it to be in /bin
+GZIP_CONF_OPTS = --exec-prefix=/
+# Prefer full gzip over potentially lightweight/slower from busybox
+GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
 
-- 
2.0.5
