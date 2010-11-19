From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 15:46:37 +0100
Subject: [Buildroot] [git commit master 1/1] openssl: security bump to
	version 1.0.0b
Message-ID: <20101119150035.A0AE48D3CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9df0952493bdea3f28765800055c266ccf7db166
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    2 +-
 package/openssl/openssl-r19998.patch |   16 ++++++++++++++++
 package/openssl/openssl.mk           |    2 +-
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 package/openssl/openssl-r19998.patch

diff --git a/CHANGES b/CHANGES
index 0dda539..40402a3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: bash, bind, busybox, libglib2,
 	libcurl, libmad, midori, module-init-tools, mtd-utils,
-	openssh, pciutils, qt, sqlite, sysstat, webkit
+	openssh, openssl, pciutils, qt, sqlite, sysstat, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/openssl/openssl-r19998.patch b/package/openssl/openssl-r19998.patch
new file mode 100644
index 0000000..d986ae5
--- /dev/null
+++ b/package/openssl/openssl-r19998.patch
@@ -0,0 +1,16 @@
+Index: openssl/ssl/t1_lib.c
+RCS File: /v/openssl/cvs/openssl/ssl/t1_lib.c,v
+rcsdiff -q -kk '-r1.64.2.15' '-r1.64.2.16' -u '/v/openssl/cvs/openssl/ssl/t1_lib.c,v' 2>/dev/null
+--- t1_lib.c	2010/11/16 13:26:24	1.64.2.15
++++ t1_lib.c	2010/11/16 22:41:07	1.64.2.16
+@@ -779,8 +779,8 @@
+ 				{
+ 				if(s->session->tlsext_ecpointformatlist)
+ 					{
+-					*al = TLS1_AD_DECODE_ERROR;
+-					return 0;
++					OPENSSL_free(s->session->tlsext_ecpointformatlist);
++					s->session->tlsext_ecpointformatlist = NULL;
+ 					}
+ 				s->session->tlsext_ecpointformatlist_length = 0;
+ 				if ((s->session->tlsext_ecpointformatlist = OPENSSL_malloc(ecpointformatlist_length)) == NULL)
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index de20b81..4d50146 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0a
+OPENSSL_VERSION = 1.0.0b
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.2.2
