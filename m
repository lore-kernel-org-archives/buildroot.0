Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C58E9DE6B
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 08:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDDF540FE4;
	Thu,  9 Apr 2026 08:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fvHGAL9aDMym; Thu,  9 Apr 2026 08:43:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA2FA41052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775724214;
	bh=0op5XjVhzeTxRidpxkyLFkeLLTup6x4aeRe+eujR34s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cx4EUqyxSH4RDpjmPxdPkFpw8WzKGf+GDp5my30UAZZpEWGyW7vpTVUODzOvJzfDm
	 XH4ZQyfZrI/VeBYmUNTfEPdIGO1NLWxDbqwsM8YNHtYw1I9C/lyIs1L3eBsorPzPxv
	 UD+Q6jGuV3PLPRjoKHxubNhg6qpiioWienViU5b85gUuhXmDbd8xxSs+5ISh9n++tZ
	 NVyzo9Nyi2XVXOIZccMqMo5XVglZeG1BztPe7AdRpz2TFkXKYjNmk4VCx5bCfxIOol
	 937GUcRuxtBwJ2Ec4F/pztshErkGDHVcRHZs9U0gr5qEmSPH55oSKX9/GDBtE9ub/x
	 BfyudQ7JvV9tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA2FA41052;
	Thu,  9 Apr 2026 08:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 513F01F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36ADD41052
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kut9XsHur5zB for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 08:43:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1591540FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1591540FE4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1591540FE4
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 08:43:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9EA66A4C088D;
 Thu,  9 Apr 2026 10:43:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAkyg-000000004SH-1GmU;
 Thu, 09 Apr 2026 08:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Mario Lang <mlang@blind.guru>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Thu,  9 Apr 2026 10:42:47 +0200
Message-ID: <20260409084305.3960494-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409084305.3960494-1-bernd@kuhls.net>
References: <20260409084305.3960494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775724186;
 bh=5Vxo1Z4RjTUCTmvHYNOAtxsgCpQWO2BUWqrxsRUtrwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JYu+zhW2BpA8sxKlA4TRIspMtTNdQK7SXFfjiwLPY0mXqXm5OlGWn5xUMUsL2tiVi
 OOECMsNU4jCtis/Ep17kiRz4AEsyU8uS39IxB/5i1Tbft4OWbfPXjPpiOTMTPr7RkH
 ZPxVdrSFdavOSLu51wexlUkmmo9lGZu3KOT9ru6InsfNcz/blLw/DC45lmR/aTXJtA
 VD+PPEarBM9NkJ6vS5cnsLLUfzsg5McPBJU0d4VsJvQZYatK8y1dTeh+bsVCzUvKAd
 HNNAn3SzNVjYzAKAmW+wQ37fwqjMTnkdOSFFc+Qwt+2UlnyC1ReHUZvJImbj5khwPv
 8ghjw123OEkjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JYu+zhW2
Subject: [Buildroot] [PATCH 03/20] package/c-icap: bump version to 0.5.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

0.5.11: https://sourceforge.net/p/c-icap/mailman/message/38634903/
0.5.12: https://sourceforge.net/p/c-icap/mailman/message/58723532/
0.5.13: https://github.com/c-icap/c-icap-server/compare/C_ICAP_0.5.12...C_ICAP_0.5.13
        (no announcement found)
0.5.14: https://sourceforge.net/p/c-icap/mailman/message/59202148/

Rebased patch 0001 due to upstream commit
https://github.com/c-icap/c-icap-server/commit/1559d1662a9c0cd8280073202f187f0d5c080f87

Rebased patch 0003 due to upstream commit
https://github.com/c-icap/c-icap-server/commit/b650bfdd4ac5aa32fd1b2de8cc0a47e2dc08c6d7

Removed patch 0004 which is included in this release:
https://github.com/c-icap/c-icap-server/commit/16cdaa505db2108d9a7c42baa3779f5831e62916

Renamed patches 0005 & 0006.

Disabled zstd support added upstream with commit
https://github.com/c-icap/c-icap-server/commit/1559d1662a9c0cd8280073202f187f0d5c080f87
due to build errors when enabled:

encode.c: In function 'ci_compress_to_membuf':
encode.c:75:16: error: implicit declaration of function
 'ci_zstd_compress_to_membuf'; did you mean 'ci_decompress_to_membuf'?
 [-Wimplicit-function-declaration]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ixes-to-compile-and-run-under-cygwin.patch |  8 +++--
 ...thod-release_authentication_header-m.patch | 18 ++---------
 ...ion-prototypes-to-fix-GCC-15.x-buil.patch} |  0
 ...ith-GCC15-signal-handlers-require-an.patch | 31 -------------------
 ...ing-in-various-printf-to-avoid-warn.patch} |  0
 package/c-icap/c-icap.hash                    |  6 ++--
 package/c-icap/c-icap.mk                      |  3 +-
 7 files changed, 13 insertions(+), 53 deletions(-)
 rename package/c-icap/{0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch => 0004-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch} (100%)
 delete mode 100644 package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
 rename package/c-icap/{0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch => 0005-Fix-integer-printing-in-various-printf-to-avoid-warn.patch} (100%)

diff --git a/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch b/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch
index 6f886c9b72..1174825c0e 100644
--- a/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch
+++ b/package/c-icap/0001-Required-fixes-to-compile-and-run-under-cygwin.patch
@@ -7,6 +7,8 @@ Subject: [PATCH] Required fixes to compile and run under cygwin
 https://github.com/c-icap/c-icap-server/commit/1631a6c1f50e152b8a45d8279c96086e5636795b,
 which has the side effect of fixing the build with the musl C library]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for 0.5.14]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Makefile.am                 |  2 +-
  configure.ac                | 10 +++++++---
@@ -26,13 +28,13 @@ index 4c34033..ab80f4f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -53,7 +53,7 @@ c_icap_SOURCES = aserver.c request.c cfg_param.c \
- libicapapi_la_CFLAGS= $(INVISIBILITY_CFLAG) -I$(srcdir)/include/ -Iinclude/ @ZLIB_ADD_FLAG@ @OPENSSL_ADD_FLAG@ @BZLIB_ADD_FLAG@ @BROTLI_ADD_FLAG@ @PCRE_ADD_FLAG@ -DCI_BUILD_LIB
+ libicapapi_la_CFLAGS= $(INVISIBILITY_CFLAG) -I$(srcdir)/include/ -Iinclude/ @ZLIB_ADD_FLAG@ @OPENSSL_ADD_FLAG@ @BZLIB_ADD_FLAG@ @BROTLI_ADD_FLAG@ @ZSTD_ADD_FLAG@ @PCRE_ADD_FLAG@ -DCI_BUILD_LIB
  
- libicapapi_la_LIBADD = @ZLIB_ADD_LDADD@ @BZLIB_ADD_LDADD@ @BROTLI_ADD_LDADD@ @PCRE_ADD_LDADD@ @DL_ADD_FLAG@ @THREADS_LDADD@ @OPENSSL_ADD_LDADD@
+ libicapapi_la_LIBADD = @ZLIB_ADD_LDADD@ @BZLIB_ADD_LDADD@ @BROTLI_ADD_LDADD@ @ZSTD_ADD_LDADD@ @PCRE_ADD_LDADD@ @DL_ADD_FLAG@ @THREADS_LDADD@ @OPENSSL_ADD_LDADD@
 -libicapapi_la_LDFLAGS= -shared -version-info @CICAPLIB_VERSION@ @THREADS_LDFLAGS@
 +libicapapi_la_LDFLAGS= -shared -version-info @CICAPLIB_VERSION@ @LIBS_LDFLAGS@ @THREADS_LDFLAGS@
  
- export EXT_PROGRAMS_MKLIB = @ZLIB_LNDIR_LDADD@ @BZLIB_LNDIR_LDADD@ @BROTLI_LNDIR_LDADD@ @PCRE_LNDIR_LDADD@ @OPENSSL_LNDIR_LDADD@
+ export EXT_PROGRAMS_MKLIB = @ZLIB_LNDIR_LDADD@ @BZLIB_LNDIR_LDADD@ @BROTLI_LNDIR_LDADD@ @ZSTD_LNDIR_LDADD@ @PCRE_LNDIR_LDADD@ @OPENSSL_LNDIR_LDADD@
  
 diff --git a/configure.ac b/configure.ac
 index 405571b..8059cb7 100644
diff --git a/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch b/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
index 940a67b70d..abfdace618 100644
--- a/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
+++ b/package/c-icap/0003-Fix-http_auth_method-release_authentication_header-m.patch
@@ -11,10 +11,11 @@ Reported with PR#72 at github:
 
 Upstream: 48a221b0197727b26f90c00544fa19c67d0f5d47
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Bernd: rebased for 0.5.14]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  http_auth.c      | 2 +-
- include/module.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/http_auth.c b/http_auth.c
 index 1883b55..b831bb1 100644
@@ -29,19 +30,6 @@ index 1883b55..b831bb1 100644
      int len, res;
  
      if (ALLOW_REMOTE_PROXY_USERS && !use_method) {
-diff --git a/include/module.h b/include/module.h
-index 286ef72..0e57586 100644
---- a/include/module.h
-+++ b/include/module.h
-@@ -96,7 +96,7 @@ typedef struct http_auth_method {
-     void *(*create_auth_data)(const char *authorization_header,const char **username);
-     void (*release_auth_data)(void *data);
-     char *(*authentication_header)();
--    void (*release_authentication_header)();
-+    void (*release_authentication_header)(char *);
-     struct ci_conf_entry *conf_table;
- } http_auth_method_t;
- 
 -- 
 2.51.0
 
diff --git a/package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch b/package/c-icap/0004-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch
similarity index 100%
rename from package/c-icap/0005-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch
rename to package/c-icap/0004-Fix-module-operation-prototypes-to-fix-GCC-15.x-buil.patch
diff --git a/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch b/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
deleted file mode 100644
index 97359ab4d6..0000000000
--- a/package/c-icap/0004-Fix-to-compile-with-GCC15-signal-handlers-require-an.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8d21c9c18e3b03e28ef2831f3ecd287c4cc44694 Mon Sep 17 00:00:00 2001
-From: Christos Tsantilas <christos@chtsanti.net>
-Date: Fri, 21 Feb 2025 13:41:37 +0200
-Subject: [PATCH] Fix to compile with GCC15: signal handlers require an int
- argument
-
-Reported with PR#72 at github:
-     https://github.com/c-icap/c-icap-server/pull/72
-
-Upstream: 0b3408ad0e9f5ccadcd4d77dffa651f9211e4cd2
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- mpmt_server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mpmt_server.c b/mpmt_server.c
-index aab9db5..01bab65 100644
---- a/mpmt_server.c
-+++ b/mpmt_server.c
-@@ -140,7 +140,7 @@ static void sigchld_handler_main(int sig)
-     /*Do nothing the signal will be ignored..... */
- }
- 
--static void sighup_handler_main()
-+static void sighup_handler_main(int sig)
- {
-     c_icap_reconfigure = 1;
- }
--- 
-2.51.0
-
diff --git a/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch b/package/c-icap/0005-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
similarity index 100%
rename from package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
rename to package/c-icap/0005-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 9a596cf375..64af987017 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,6 +1,6 @@
 # Retrieved from https://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/
-md5  c8329684588a906d10a687e84ba4a478  c_icap-0.5.10.tar.gz
-sha1  2901aa19c8c4b09b700164290942290c34132076  c_icap-0.5.10.tar.gz
+md5  f678d20ae30cad41b08437b441752e31  c_icap-0.5.14.tar.gz
+sha1  db5e72065a3219410adfdbc5378b40b01e21ec36  c_icap-0.5.14.tar.gz
 # Locally calculated
-sha256  541d503354907f06d1d72fa90fffd031002f0f4346150fb7b2203ad5825ae49d  c_icap-0.5.10.tar.gz
+sha256  28c30c97b1892a1a8938db6cdad806a73016c57ae181e232d33f347d5d700ec5  c_icap-0.5.14.tar.gz
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index 4ece4c4b26..7e1b73cd2e 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.5.10
+C_ICAP_VERSION = 0.5.14
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
@@ -14,6 +14,7 @@ C_ICAP_INSTALL_STAGING = YES
 C_ICAP_CONFIG_SCRIPTS = c-icap-config c-icap-libicapapi-config
 C_ICAP_CONF_OPTS = \
 	--without-perl \
+	--without-zstd \
 	--enable-large-files \
 	--enable-ipv6
 # Pre-seed cache variables for tests done with AC_TRY_RUN that are not
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
