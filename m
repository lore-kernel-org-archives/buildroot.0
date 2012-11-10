From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 22:42:44 +0100
Subject: [Buildroot] [PATCH 07/11] quota: allow usage of getrpcbynumber()
	instead of getrpcbynumber_r()
In-Reply-To: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da4725dab4e7f68385bcdb698ea5e494bd5032de.1352583641.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtirpc does not implement the reentrant function getrpcbynumber_r(),
so allow quota to use the non-reentrant version getrpcbynumber(). This
should not be a problem as quota tools are not multi-threaded.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quota/quota-tools-getrpcbynumber.patch |   42 ++++++++++++++++++++++++
 package/quota/quota.mk                         |    4 +++
 2 files changed, 46 insertions(+)
 create mode 100644 package/quota/quota-tools-getrpcbynumber.patch

diff --git a/package/quota/quota-tools-getrpcbynumber.patch b/package/quota/quota-tools-getrpcbynumber.patch
new file mode 100644
index 0000000..3fed853
--- /dev/null
+++ b/package/quota/quota-tools-getrpcbynumber.patch
@@ -0,0 +1,42 @@
+allow usage of getrpcbynumber() instead of getrpcbynumber_r()
+
+libtirpc does not implement the reentrant function getrpcbynumber_r(),
+so allow quota to use the non-reentrant version getrpcbynumber(). This
+should not be a problem as quota tools are not multi-threaded.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.in
+===================================================================
+--- a/configure.in
++++ b/configure.in
+@@ -182,6 +182,12 @@
+ AC_C_CONST
+ AC_C_INLINE
+ 
++AC_CHECK_FUNCS([getrpcbynumber getrpcbynumber_r])
++
++if test "$ac_cv_func_getrpcbynumber_r" != "yes" -a "$ac_cv_func_getrpcbynumber" != "yes"; then
++   AC_MSG_ERROR([Neither getrpcbynumber_r nor getrpcbynumber are available])
++fi
++
+ AC_ARG_ENABLE(altformat,
+ 	[  --enable-altformat=[yes/no]     Enable alternative format used by edquota [default=yes].],
+ 	,
+Index: b/svc_socket.c
+===================================================================
+--- a/svc_socket.c
++++ b/svc_socket.c
+@@ -55,7 +55,12 @@
+ 	addr.sin_family = AF_INET;
+ 
+ 	if (!port) {
++#if HAVE_GETRPCBYNUMBER_R
+ 		ret = getrpcbynumber_r(number, &rpcbuf, rpcdata, sizeof(rpcdata), &rpcp);
++#else
++		rpcp = getrpcbynumber(number);
++		ret = 0;
++#endif
+ 		if (ret == 0 && rpcp != NULL) {
+ 			/* First try name */
+ 			ret = getservbyname_r(rpcp->r_name, proto, &servbuf, servdata,
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 7019059..899dfdd 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -8,6 +8,8 @@ QUOTA_VERSION = 4.00
 QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
 QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 
+QUOTA_AUTORECONF = YES
+
 QUOTA_CFLAGS = $(TARGET_CFLAGS)
 QUOTA_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -23,6 +25,8 @@ QUOTA_LDFLAGS += -ltirpc
 endif
 
 QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
+QUOTA_CONF_ENV = \
+	CFLAGS="$(QUOTA_CFLAGS) -D_GNU_SOURCE" LDFLAGS="$(QUOTA_LDFLAGS)"
 
 # Package uses autoconf but not automake.
 QUOTA_INSTALL_TARGET_OPT = \
-- 
1.7.9.5
