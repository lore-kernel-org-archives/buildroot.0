From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 10:16:28 -0500
Subject: [Buildroot] [PATCH 2/2] package/strongswan: install libcharon vici
 header
In-Reply-To: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537456588-17627-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537456588-17627-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Adds patch to install 'libvici.h' if
   --with-dev-headers is configured.

Strongswan  currently installs development headers if
'--with-dev-headers' is configured, except 'libvici.h'.

Original discussion and commit:
https://wiki.strongswan.org/projects/strongswan/repository/revisions/01c2b62362df88a03c53b748bb4e88631410f326

Upstream:
https://lists.strongswan.org/pipermail/dev/2018-September/001932.html

Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...1-libcharon-vici-install-libvici.h-header.patch | 45 ++++++++++++++++++++++
 package/strongswan/strongswan.mk                   |  3 ++
 2 files changed, 48 insertions(+)
 create mode 100644 package/strongswan/0001-libcharon-vici-install-libvici.h-header.patch

diff --git a/package/strongswan/0001-libcharon-vici-install-libvici.h-header.patch b/package/strongswan/0001-libcharon-vici-install-libvici.h-header.patch
new file mode 100644
index 0000000..b518118
--- /dev/null
+++ b/package/strongswan/0001-libcharon-vici-install-libvici.h-header.patch
@@ -0,0 +1,45 @@
+From bf82805d9ecb232b7fda20899ea898c32a651833 Mon Sep 17 00:00:00 2001
+From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Date: Tue, 18 Sep 2018 12:56:39 -0500
+Subject: [PATCH] libcharon/vici: install libvici.h header
+
+Install "libvici.h" if --with-dev-headers is configured.
+Strongswan currently installs other development headers using
+this method.
+
+The libvici plugin provides a stable low-level C API to
+exchange messages using the VICI protocol. This allows a user
+to write standalone applications based on 'libvici' functions,
+'libvici.h' header file is required to link all functions at
+compile time.
+
+Original discussion and commit:
+https://wiki.strongswan.org/projects/strongswan/repository/revisions/01c2b62362df88a03c53b748bb4e88631410f326
+
+Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ src/libcharon/plugins/vici/Makefile.am | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/libcharon/plugins/vici/Makefile.am b/src/libcharon/plugins/vici/Makefile.am
+index e8bcdba..6b11ff1 100644
+--- a/src/libcharon/plugins/vici/Makefile.am
++++ b/src/libcharon/plugins/vici/Makefile.am
+@@ -42,7 +42,12 @@ libvici_la_SOURCES = \
+ 	vici_message.c vici_message.h \
+ 	vici_builder.c vici_builder.h \
+ 	vici_cert_info.h vici_cert_info.c \
+-	libvici.c libvici.h
++	libvici.c
++
++if USE_DEV_HEADERS
++vici_includedir = ${dev_headers}
++nobase_vici_include_HEADERS = libvici.h
++endif
+ 
+ libvici_la_LIBADD = $(top_builddir)/src/libstrongswan/libstrongswan.la
+ 
+-- 
+1.9.1
+
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index f2e70a3..089099e 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -40,6 +40,9 @@ STRONGSWAN_CONF_OPTS += \
 	--with-imcvdir=/usr/lib/ipsec/imcvs \
 	--with-dev-headers=/usr/include
 
+# 0001-libcharon-vici-install-libvici.h-header.patch
+STRONGSWAN_AUTORECONF = YES
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
-- 
1.9.1
