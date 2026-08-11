Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBAFC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C370740434;
	Tue, 11 Aug 2026 19:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UT--Yk5ESlV; Tue, 11 Aug 2026 19:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75CD1403C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475098;
	bh=l0f6Mw8p8dplzaByBYkONaR6Av3ZjfVNr7byYInrslc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sXBSW2ot89XKN5vk6JcVU6BY767WBB/s/XqE6fq4Myd1wkG7ZDiffSSVtfkjPvlEQ
	 u1Dd08GRkQk7SyD+Yf2Ty8rIfkyhfjvQUPR2U483wqaZ2DdUS4vjP65/Pu2wd8NHGH
	 W9rjNa54NdXRSqkYZLiBULkTnE5mF8BKYYrO2VufWzojX3HFfSdOBc/iDe/aetPnc5
	 MoZji3O9Z5CibeTyDODfiz8fNXEDk3sYmjbeSgtbWE3+KuISfKXc+oIG8PjyZEHCN2
	 2BrUBVYtCuDUmqpOQzlPndM73boq+fXzE63CPmN0/AY33URrqSxqYc/t3aMME3jYzh
	 vAcjZQvy7gg/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CD1403C8;
	Tue, 11 Aug 2026 19:04:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF9828A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B7440368
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 18:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGkOXu2HHB6C for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 18:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C691A4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C691A4035D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C691A4035D
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 18:58:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0529.dip0.t-ipconnect.de [91.58.5.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 27317A4C4883;
 Tue, 11 Aug 2026 20:19:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wtr4P-000000000qy-2QOi;
 Tue, 11 Aug 2026 18:19:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
Date: Tue, 11 Aug 2026 20:19:23 +0200
Message-ID: <20260811181925.3513940-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786472366;
 bh=3boMBIrJBQgU+2E3YRQ3H6DsGfSOhfGPl5shTuEOEjg=;
 h=From:To:Cc:Subject:Date:From;
 b=fuewJLYyKX0YmvKUAiNfdSTsYaWkcpet0W1sVAZ8pBxIrSheV3uNpuQl6NgJXX56V
 /fjGar1MKdN/6//0i2lNKpVcm9z6ge9r/LrgSoV9QXOMYwCVrpqAQT28MrH0Cwr4e1
 oYypm7uPS3wBch4Mxv3POqbRbQR5UCSGLTD+amQQhUDXdUgUFl9O9FpEA6ZreFD9Oz
 jgA4cJvcbVHPqSoaLk8FKtrJc7aDk+UpLguHzo7BmGrhSznO2UZSrJQEwWiwEWk4Yn
 T1IGNZp33ujV9uV6mIMHTmqqNnVcysSx2A883xYGxgqKpZxddGhuG/7P0DW6wribhs
 OVnN0piCJpQpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fuewJLYy
Subject: [Buildroot] [PATCH 1/3] package/sofia-sip: bump version to 1.13.18
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

https://github.com/freeswitch/sofia-sip/compare/v1.13.17...v1.13.18

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/4ab1f97382d4894033fb4fb8a254cf1c5212b714

with the exception of bootlin-aarch64-glibc-old during the build
of freeswitch, unrelated to this package.

 ...mpatible-pointer-type-in-sip_basic-c.patch |  27 -----
 ...-fix-static-build-with-openssl-3.2.0.patch | 109 ------------------
 package/sofia-sip/sofia-sip.hash              |   2 +-
 package/sofia-sip/sofia-sip.mk                |   2 +-
 4 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
 delete mode 100644 package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch

diff --git a/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch b/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
deleted file mode 100644
index 7f890fd27b..0000000000
--- a/package/sofia-sip/0001-Fix-incompatible-pointer-type-in-sip_basic-c.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 46b02f0655af0a9594e805f09a8ee99278f84777 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tomi=20L=C3=A4hteenm=C3=A4ki?= <lihis@lihis.net>
-Date: Mon, 19 Feb 2024 09:06:20 +0200
-Subject: [PATCH] Fix incompatible pointer type in sip_basic.c
-
-Closes #248
-
-Upstream: https://github.com/freeswitch/sofia-sip/pull/249
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- libsofia-sip-ua/sip/sip_basic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libsofia-sip-ua/sip/sip_basic.c b/libsofia-sip-ua/sip/sip_basic.c
-index 3444fb25..82e824e3 100644
---- a/libsofia-sip-ua/sip/sip_basic.c
-+++ b/libsofia-sip-ua/sip/sip_basic.c
-@@ -2901,7 +2901,7 @@ issize_t sip_identity_d(su_home_t *home, sip_header_t *h, char *s, isize_t slen)
-       ext = strchr(ppt, ';');
- 
-       if (ext) {
--          msg_param_t *params = su_alloc(home, sizeof(msg_param_t));
-+          msg_param_t const *params = su_alloc(home, sizeof(msg_param_t));
-           if (msg_params_d(home, &ext, &params) >= 0) {
-               id->id_info_params = params;
-           }
diff --git a/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch b/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch
deleted file mode 100644
index 03b17bcbbc..0000000000
--- a/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 145f80df25d23492ed3aa01b3750d7c002964332 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 5 Jan 2024 23:15:00 +0100
-Subject: [PATCH] fix static build with openssl >= 3.2.0
-
-Rename tls_free into sofia_sip_tls_free as openssl also defines tls_free
-since version 3.2.0 and
-https://github.com/openssl/openssl/commit/1853d20a008a85d327f4faa9e07be40a85549f8e
-resulting in the following static build failure:
-
-/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: /home/autobuild/autobuild/instance-12/output-1/host/bin/../powerpc-buildroot-linux-uclibcspe/sysroot/usr/lib/libssl.a(libssl-lib-tls_common.o): in function `tls_free':
-tls_common.c:(.text+0x808): multiple definition of `tls_free'; ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_tls.o):tport_tls.c:(.text+0x1128): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/ee862bdafd44c8c56f77e2702ee0a7462634fa0b
-
-Upstream: https://github.com/freeswitch/sofia-sip/pull/240
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libsofia-sip-ua/tport/tport_tls.c      | 10 +++++-----
- libsofia-sip-ua/tport/tport_tls.h      |  2 +-
- libsofia-sip-ua/tport/tport_type_tls.c |  4 ++--
- 3 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/libsofia-sip-ua/tport/tport_tls.c b/libsofia-sip-ua/tport/tport_tls.c
-index a17186de..0739c93f 100644
---- a/libsofia-sip-ua/tport/tport_tls.c
-+++ b/libsofia-sip-ua/tport/tport_tls.c
-@@ -460,7 +460,7 @@ int tls_init_context(tls_t *tls, tls_issues_t const *ti)
-   return 0;
- }
- 
--void tls_free(tls_t *tls)
-+void sofia_sip_tls_free(tls_t *tls)
- {
-   int ret;
-   if (!tls)
-@@ -473,7 +473,7 @@ void tls_free(tls_t *tls)
-         /* The return value -1 means that the connection wasn't actually established */
-         /* so it should be safe to not call shutdown again. We need to clear the eror */
-         /* queue for other connections though. */
--        tls_log_errors(3, "tls_free", 0);
-+        tls_log_errors(3, "sofia_sip_tls_free", 0);
-         ret = 1;
-       }
-     } while (ret != 1);
-@@ -514,7 +514,7 @@ tls_t *tls_init_master(tls_issues_t *ti)
- 
-   if (tls_init_context(tls, ti) < 0) {
-     int err = errno;
--    tls_free(tls);
-+    sofia_sip_tls_free(tls);
-     errno = err;
-     return NULL;
-   }
-@@ -544,7 +544,7 @@ tls_t *tls_init_master(tls_issues_t *ti)
- 
-     if (tls->bio_con == NULL) {
-       tls_log_errors(1, "tls_init_master", 0);
--      tls_free(tls);
-+      sofia_sip_tls_free(tls);
-       errno = EIO;
-       return NULL;
-     }
-@@ -581,7 +581,7 @@ tls_t *tls_init_secondary(tls_t *master, int sock, int accept)
- 
-   if (tls->con == NULL) {
-     tls_log_errors(1, "tls_init_secondary", 0);
--    tls_free(tls);
-+    sofia_sip_tls_free(tls);
-     errno = EIO;
-     return NULL;
-   }
-diff --git a/libsofia-sip-ua/tport/tport_tls.h b/libsofia-sip-ua/tport/tport_tls.h
-index e8d04a14..3a5fde22 100644
---- a/libsofia-sip-ua/tport/tport_tls.h
-+++ b/libsofia-sip-ua/tport/tport_tls.h
-@@ -81,7 +81,7 @@ typedef struct tport_tls_primary_s {
- 
- tls_t *tls_init_master(tls_issues_t *tls_issues);
- tls_t *tls_init_secondary(tls_t *tls_master, int sock, int accept);
--void tls_free(tls_t *tls);
-+void sofia_sip_tls_free(tls_t *tls);
- int tls_get_socket(tls_t *tls);
- void tls_log_errors(unsigned level, char const *s, unsigned long e);
- ssize_t tls_read(tls_t *tls);
-diff --git a/libsofia-sip-ua/tport/tport_type_tls.c b/libsofia-sip-ua/tport/tport_type_tls.c
-index e030e706..fa72eed8 100644
---- a/libsofia-sip-ua/tport/tport_type_tls.c
-+++ b/libsofia-sip-ua/tport/tport_type_tls.c
-@@ -276,7 +276,7 @@ static int tport_tls_init_master(tport_primary_t *pri,
- static void tport_tls_deinit_primary(tport_primary_t *pri)
- {
-   tport_tls_primary_t *tlspri = (tport_tls_primary_t *)pri;
--  tls_free(tlspri->tlspri_master), tlspri->tlspri_master = NULL;
-+  sofia_sip_tls_free(tlspri->tlspri_master), tlspri->tlspri_master = NULL;
- }
- 
- static int tport_tls_init_secondary(tport_t *self, int socket, int accepted,
-@@ -303,7 +303,7 @@ static void tport_tls_deinit_secondary(tport_t *self)
- 
-   /* XXX - PPe: does the tls_shutdown zap everything but socket? */
-   if (tlstp->tlstp_context != NULL)
--    tls_free(tlstp->tlstp_context);
-+    sofia_sip_tls_free(tlstp->tlstp_context);
-   tlstp->tlstp_context = NULL;
- 
-   su_free(self->tp_home, tlstp->tlstp_buffer);
diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index f4ce8d832d..623b010190 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  daca3d961b6aa2974ad5d3be69ed011726c3e4d511b2a0d4cb6d878821a2de7a  sofia-sip-1.13.17.tar.gz
+sha256  d2ad4e64753a7c9843b766b8de8081d9c1d7acfaeb53c12b3aed7fdb9235766c  sofia-sip-1.13.18.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index a64716483f..1d47b43fe8 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.17
+SOFIA_SIP_VERSION = 1.13.18
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
