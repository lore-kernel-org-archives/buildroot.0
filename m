From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Nov 2014 14:30:54 +0100
Subject: [Buildroot] [PATCHv2 3/3] quota: fix static linking
In-Reply-To: <1415539854-25971-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415539854-25971-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415539854-25971-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The aim of this patch is to fix bug #7574, i.e fix the static linking
of the quota package. It does so by introducing a patch to the quota
build system that generalizes the use of $(LIBS), and then changes
quota.mk to use LIBS instead of LDFLAGS to link against intl and tirpc
when needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quota/02-fix-static-linking.patch | 55 +++++++++++++++++++++++++++++++
 package/quota/quota.mk                    |  9 +++--
 2 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 package/quota/02-fix-static-linking.patch

diff --git a/package/quota/02-fix-static-linking.patch b/package/quota/02-fix-static-linking.patch
new file mode 100644
index 0000000..fd73f64
--- /dev/null
+++ b/package/quota/02-fix-static-linking.patch
@@ -0,0 +1,55 @@
+Use $(LIBS) properly
+
+This patch makes sure the quota build system uses $(LIBS) where
+appropriate, so that it can be used to link with additional libraries,
+which is needed when linking statically.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.in
+===================================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -105,30 +105,40 @@
+ 	-$(INSTALL) -m $(DEF_MAN_MODE) *.8 $(ROOTDIR)$(mandir)/man8
+ 
+ quotaon: quotaon.o quotaon_xfs.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ quotacheck: quotacheck.o quotacheck_v1.o quotacheck_v2.o quotaops.o $(LIBOBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^ $(EXT2LIBS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(EXT2LIBS) $(LIBS)
+ 
+ quota: quota.o quotaops.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ quotasync: quotasync.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ quot: quot.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ repquota: repquota.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ warnquota: warnquota.o $(LIBOBJS)
+-	$(CC) $(LDFLAGS) -o $@ $^ $(LDAPLIBS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LDAPLIBS) $(LIBS)
+ 
+ quotastats: quotastats.o common.o pot.o
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ xqmstats: xqmstats.o common.o pot.o
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ edquota: edquota.o quotaops.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ setquota: setquota.o quotaops.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ convertquota: convertquota.o $(LIBOBJS)
++	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+ 
+ rpc.rquotad: rquota_server.o rquota_svc.o svc_socket.o $(LIBOBJS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 0e7a2b0..332f42e 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -12,22 +12,21 @@ QUOTA_LICENSE = GPLv2+
 QUOTA_CONF_OPTS = --disable-strip-binaries
 
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
-QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 QUOTA_DEPENDENCIES += gettext
-QUOTA_LDFLAGS += -lintl
+QUOTA_LIBS += -lintl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 QUOTA_DEPENDENCIES += libtirpc
 QUOTA_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
-QUOTA_LDFLAGS += -ltirpc
+QUOTA_LIBS += -ltirpc
 endif
 
-QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
+QUOTA_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
 QUOTA_CONF_ENV = \
-	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
+	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LIBS="$(QUOTA_LIBS)"
 
 # Package uses autoconf but not automake.
 QUOTA_INSTALL_TARGET_OPTS = \
-- 
2.0.0
