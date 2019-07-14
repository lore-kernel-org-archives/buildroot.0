From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jul 2019 10:41:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libiscsi: bump to version 1.19.0
Message-ID: <20190714084124.19199-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patches (already in version)
- Use new configure options to disable examples, test-tool and tests
- Drop cunit optional dependency now that test-tool is always disabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-This-is-unsafe-when-cross-compiling.patch | 67 -------------------
 ...ng-message-that-includes-target-name.patch | 29 --------
 package/libiscsi/0003-avoid-fallthrough.patch | 24 -------
 package/libiscsi/libiscsi.hash                |  2 +-
 package/libiscsi/libiscsi.mk                  |  9 +--
 5 files changed, 4 insertions(+), 127 deletions(-)
 delete mode 100644 package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch
 delete mode 100644 package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
 delete mode 100644 package/libiscsi/0003-avoid-fallthrough.patch

diff --git a/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch b/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch
deleted file mode 100644
index dc047ef49c..0000000000
--- a/package/libiscsi/0001-Do-not-use-I-usr-include.-This-is-unsafe-when-cross-compiling.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f27bdf64f0c375352ca42928071a9178a5a04c46 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Sun, 16 Oct 2016 10:53:13 +0100
-Subject: [PATCH] Do not use -I/usr/include. This is unsafe when cross-compiling.
-
-Upstream status: PR sent (https://github.com/sahlberg/libiscsi/pull/219)
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- examples/Makefile.am | 2 +-
- lib/Makefile.am      | 2 +-
- tests/Makefile.am    | 2 +-
- utils/Makefile.am    | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index 0de0b1f..42ad818 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CPPFLAGS=-I. -I${srcdir}/../include "-D_U_=__attribute__((unused))" \
- 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
--AM_CFLAGS=$(WARN_CFLAGS) -I/usr/include
-+AM_CFLAGS=$(WARN_CFLAGS)
- LDADD = ../lib/libiscsi.la
- 
- noinst_PROGRAMS = iscsiclient iscsi-dd
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index d612fb7..47ffc33 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -29,7 +29,7 @@ libiscsi_la_CPPFLAGS = -I${srcdir}/../include -I$(srcdir)/include \
- 	"-D_U_=__attribute__((unused))" \
- 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
- 
--AM_CFLAGS=$(WARN_CFLAGS) -I/usr/include
-+AM_CFLAGS=$(WARN_CFLAGS)
- 
- dist_noinst_DATA = libiscsi.syms libiscsi.def
- 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 9d699fc..b4cbf21 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CPPFLAGS = -I../include "-D_U_=__attribute__((unused))" \
- 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
--AM_CFLAGS = $(WARN_CFLAGS) -I/usr/include
-+AM_CFLAGS = $(WARN_CFLAGS)
- LDADD = ../lib/libiscsi.la
- 
- noinst_PROGRAMS = prog_reconnect prog_reconnect_timeout prog_noop_reply \
-diff --git a/utils/Makefile.am b/utils/Makefile.am
-index 657ca9d..bde1c81 100644
---- a/utils/Makefile.am
-+++ b/utils/Makefile.am
-@@ -1,6 +1,6 @@
- AM_CPPFLAGS = -I${srcdir}/../include "-D_U_=__attribute__((unused))" \
- 	"-D_R_(A,B)=__attribute__((format(printf,A,B)))"
--AM_CFLAGS = $(WARN_CFLAGS) -I/usr/include
-+AM_CFLAGS = $(WARN_CFLAGS)
- LDADD = ../lib/libiscsi.la
- 
- bin_PROGRAMS = iscsi-inq iscsi-ls iscsi-perf iscsi-readcapacity16 \
--- 
-2.10.0
-
diff --git a/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch b/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
deleted file mode 100644
index 1334a8352c..0000000000
--- a/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From bffafc1c3003c2ee05d28eaa345e5854bc36014d Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Mon, 1 Oct 2018 14:16:14 +0200
-Subject: [PATCH] avoid truncation when logging message that includes target
- name
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/sahlberg/libiscsi/commit/bffafc1c3003c2ee05d28eaa345e5854bc36014d]
----
- lib/logging.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/logging.c b/lib/logging.c
-index be518fc5..61c74407 100644
---- a/lib/logging.c
-+++ b/lib/logging.c
-@@ -73,9 +73,9 @@ iscsi_log_message(struct iscsi_context *iscsi, int level, const char *format, ..
- 	}
- 
- 	if (iscsi->target_name[0]) {
--		static char message2[1024];
-+		static char message2[1282];
- 
--		snprintf(message2, 1024, "%s [%s]", message, iscsi->target_name);
-+		snprintf(message2, 1282, "%s [%s]", message, iscsi->target_name);
- 		iscsi->log_fn(level, message2);
- 	}
- 	else
diff --git a/package/libiscsi/0003-avoid-fallthrough.patch b/package/libiscsi/0003-avoid-fallthrough.patch
deleted file mode 100644
index 94f653a99c..0000000000
--- a/package/libiscsi/0003-avoid-fallthrough.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 679d0abe7c142df178a907397551c4d9695cc667 Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Mon, 1 Oct 2018 14:14:24 +0200
-Subject: [PATCH] avoid fallthrough
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/sahlberg/libiscsi/commit/679d0abe7c142df178a907397551c4d9695cc667]
----
- lib/scsi-lowlevel.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/scsi-lowlevel.c b/lib/scsi-lowlevel.c
-index 5ddd709c..747ce0c4 100644
---- a/lib/scsi-lowlevel.c
-+++ b/lib/scsi-lowlevel.c
-@@ -1086,6 +1086,7 @@ scsi_maintenancein_datain_getfullsize(struct scsi_task *task)
- 				(task_get_uint8(task, 1) & 0x80) ? 12 : 0 +
- 				task_get_uint16(task, 2);
- 		}
-+		return -1;
- 	default:
- 		return -1;
- 	}
diff --git a/package/libiscsi/libiscsi.hash b/package/libiscsi/libiscsi.hash
index 0688f2dd2f..b70bb423dc 100644
--- a/package/libiscsi/libiscsi.hash
+++ b/package/libiscsi/libiscsi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 464d104e12533dc11f0dd7662cbc2f01c132f94aa4f5bd519e3413ef485830e8  libiscsi-1.18.0.tar.gz
+sha256 c7848ac722c8361d5064654bc6e926c2be61ef11dd3875020a63931836d806df  libiscsi-1.19.0.tar.gz
 sha256 88e3eccc48722b2a0eaff456dda94b8e8e123848d01f631969bec8e3c6c6eb85  COPYING
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENCE-GPL-2.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 2b26a1427c..f0b003b347 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -4,18 +4,15 @@
 #
 ################################################################################
 
-LIBISCSI_VERSION = 1.18.0
+LIBISCSI_VERSION = 1.19.0
 LIBISCSI_SITE = $(call github,sahlberg,libiscsi,$(LIBISCSI_VERSION))
 LIBISCSI_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_CUNIT),y)
-LIBISCSI_DEPENDENCIES += cunit
-endif
-
-LIBISCSI_CONF_OPTS = --disable-werror --disable-manpages
+LIBISCSI_CONF_OPTS = --disable-examples --disable-werror --disable-manpages \
+	--disable-test-tool --disable-tests
 
 # We need to create the m4 directory to make autoreconf work properly.
 define LIBISCSI_CREATE_M4_DIR
-- 
2.20.1
