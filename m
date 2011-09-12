From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 12 Sep 2011 10:11:01 +0200
Subject: [Buildroot] [PATCH 2/2] samba: fix linking of smbd with avahi
	support
In-Reply-To: <1315815061-9225-1-git-send-email-s.neumann@raumfeld.com>
References: <8739g2g667.fsf@macbook.be.48ers.dk>
 <1315815061-9225-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1315815061-9225-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Expliticly link with -lpthread if smbd is compiled with
avahi support. Otherwise the binary will fail to run.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/samba-fix-smbd-libs-avahi.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/samba/samba-fix-smbd-libs-avahi.patch

diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba-fix-smbd-libs-avahi.patch
new file mode 100644
index 0000000..d6423de
--- /dev/null
+++ b/package/samba/samba-fix-smbd-libs-avahi.patch
@@ -0,0 +1,15 @@
+Expliticly link with -lpthread if smbd is compiled with
+avahi support. Otherwise the binary will fail to run.
+
+Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
+--- samba-3.5.6-orig/source3/Makefile.in	2010-10-07 18:41:16.000000000 +0200
++++ samba-3.5.6/source3/Makefile.in	2010-10-27 14:52:40.000000000 +0200
+@@ -1552,7 +1552,7 @@
+ 		$(KRB5LIBS) $(DYNEXP) $(PRINT_LIBS) $(AUTH_LIBS) \
+ 		$(ACL_LIBS) $(PASSDB_LIBS) $(LIBS) $(DNSSD_LIBS) $(AVAHI_LIBS) \
+ 		$(POPT_LIBS) @SMBD_LIBS@ $(LIBTALLOC_LIBS) $(LIBTDB_LIBS) \
+-		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS)
++		$(LIBWBCLIENT_LIBS) $(ZLIB_LIBS) $(PTHREAD_LDFLAGS)
+ 
+ bin/nmbd at EXEEXT@: $(BINARY_PREREQS) $(NMBD_OBJ) @BUILD_POPT@ $(LIBTALLOC) $(LIBTDB) $(LIBWBCLIENT)
+ 	@echo Linking $@
-- 
1.7.4.1
