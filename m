Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953CDC5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 08:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB6280EF8;
	Sun, 25 Aug 2024 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zadoPei23Sc; Sun, 25 Aug 2024 08:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37A3C80F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37A3C80F0B;
	Sun, 25 Aug 2024 08:12:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 852861BF40E
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 08:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80A0740118
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKWKIzswZnHp for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 08:12:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D7E740021
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D7E740021
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D7E740021
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 08:12:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c25a.dip0.t-ipconnect.de [79.214.194.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 033F1A4C23C7;
 Sun, 25 Aug 2024 10:12:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37052)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1si8M1-000000007C7-14vr;
 Sun, 25 Aug 2024 08:12:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 10:12:05 +0200
Message-Id: <20240825081205.562228-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724573526;
 bh=7UiOhHb0nFrGecLNVKqYAPjunZCThbUFX/UA2a0VFss=;
 h=From:To:Cc:Subject:Date:From;
 b=dnr9fRmjjZrjSusMUsCuGTzpCODZWmZ5sP6XVtcYEPHfefa174Ux8XT+kwnK2jAtD
 63k/gPY+IFZP1wbEwtYlkU5YEDhiXFzfaDo5mf6j/3XzmcnjQz8y1zXGj41TyVslLe
 0nhb06mYHHFnnTvW0po4YDh07GPEFxD4NflLhCaNMY/A1+3hG2H33q0fALplJ0R/kA
 JlYiXyCzA1iBW9jWN4B/iK39injcYfWEpOB3t0TcG+qxeMI3dpwQTQI6Q/V54a4xnm
 IwB12/ZkFjeOGtFo12zfZ2MHiunR87OTWdmpv2I8w4yaxg+jRkx457QMS3fzJDk1us
 5w+aq3eJvmIdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=dnr9fRmj
Subject: [Buildroot] [PATCH 1/1] package/sofia-sip: fix static build with
 openssl >= 3.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.org/results/de08bd5c68f5fcdaa5c0374a4f5051c4751ebb88/
and many others.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-fix-static-build-with-openssl-3.2.0.patch | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch

diff --git a/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch b/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch
new file mode 100644
index 0000000000..03b17bcbbc
--- /dev/null
+++ b/package/sofia-sip/0002-fix-static-build-with-openssl-3.2.0.patch
@@ -0,0 +1,109 @@
+From 145f80df25d23492ed3aa01b3750d7c002964332 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 5 Jan 2024 23:15:00 +0100
+Subject: [PATCH] fix static build with openssl >= 3.2.0
+
+Rename tls_free into sofia_sip_tls_free as openssl also defines tls_free
+since version 3.2.0 and
+https://github.com/openssl/openssl/commit/1853d20a008a85d327f4faa9e07be40a85549f8e
+resulting in the following static build failure:
+
+/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibcspe/8.4.0/../../../../powerpc-buildroot-linux-uclibcspe/bin/ld: /home/autobuild/autobuild/instance-12/output-1/host/bin/../powerpc-buildroot-linux-uclibcspe/sysroot/usr/lib/libssl.a(libssl-lib-tls_common.o): in function `tls_free':
+tls_common.c:(.text+0x808): multiple definition of `tls_free'; ../libsofia-sip-ua/.libs/libsofia-sip-ua.a(tport_tls.o):tport_tls.c:(.text+0x1128): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ee862bdafd44c8c56f77e2702ee0a7462634fa0b
+
+Upstream: https://github.com/freeswitch/sofia-sip/pull/240
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libsofia-sip-ua/tport/tport_tls.c      | 10 +++++-----
+ libsofia-sip-ua/tport/tport_tls.h      |  2 +-
+ libsofia-sip-ua/tport/tport_type_tls.c |  4 ++--
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/libsofia-sip-ua/tport/tport_tls.c b/libsofia-sip-ua/tport/tport_tls.c
+index a17186de..0739c93f 100644
+--- a/libsofia-sip-ua/tport/tport_tls.c
++++ b/libsofia-sip-ua/tport/tport_tls.c
+@@ -460,7 +460,7 @@ int tls_init_context(tls_t *tls, tls_issues_t const *ti)
+   return 0;
+ }
+ 
+-void tls_free(tls_t *tls)
++void sofia_sip_tls_free(tls_t *tls)
+ {
+   int ret;
+   if (!tls)
+@@ -473,7 +473,7 @@ void tls_free(tls_t *tls)
+         /* The return value -1 means that the connection wasn't actually established */
+         /* so it should be safe to not call shutdown again. We need to clear the eror */
+         /* queue for other connections though. */
+-        tls_log_errors(3, "tls_free", 0);
++        tls_log_errors(3, "sofia_sip_tls_free", 0);
+         ret = 1;
+       }
+     } while (ret != 1);
+@@ -514,7 +514,7 @@ tls_t *tls_init_master(tls_issues_t *ti)
+ 
+   if (tls_init_context(tls, ti) < 0) {
+     int err = errno;
+-    tls_free(tls);
++    sofia_sip_tls_free(tls);
+     errno = err;
+     return NULL;
+   }
+@@ -544,7 +544,7 @@ tls_t *tls_init_master(tls_issues_t *ti)
+ 
+     if (tls->bio_con == NULL) {
+       tls_log_errors(1, "tls_init_master", 0);
+-      tls_free(tls);
++      sofia_sip_tls_free(tls);
+       errno = EIO;
+       return NULL;
+     }
+@@ -581,7 +581,7 @@ tls_t *tls_init_secondary(tls_t *master, int sock, int accept)
+ 
+   if (tls->con == NULL) {
+     tls_log_errors(1, "tls_init_secondary", 0);
+-    tls_free(tls);
++    sofia_sip_tls_free(tls);
+     errno = EIO;
+     return NULL;
+   }
+diff --git a/libsofia-sip-ua/tport/tport_tls.h b/libsofia-sip-ua/tport/tport_tls.h
+index e8d04a14..3a5fde22 100644
+--- a/libsofia-sip-ua/tport/tport_tls.h
++++ b/libsofia-sip-ua/tport/tport_tls.h
+@@ -81,7 +81,7 @@ typedef struct tport_tls_primary_s {
+ 
+ tls_t *tls_init_master(tls_issues_t *tls_issues);
+ tls_t *tls_init_secondary(tls_t *tls_master, int sock, int accept);
+-void tls_free(tls_t *tls);
++void sofia_sip_tls_free(tls_t *tls);
+ int tls_get_socket(tls_t *tls);
+ void tls_log_errors(unsigned level, char const *s, unsigned long e);
+ ssize_t tls_read(tls_t *tls);
+diff --git a/libsofia-sip-ua/tport/tport_type_tls.c b/libsofia-sip-ua/tport/tport_type_tls.c
+index e030e706..fa72eed8 100644
+--- a/libsofia-sip-ua/tport/tport_type_tls.c
++++ b/libsofia-sip-ua/tport/tport_type_tls.c
+@@ -276,7 +276,7 @@ static int tport_tls_init_master(tport_primary_t *pri,
+ static void tport_tls_deinit_primary(tport_primary_t *pri)
+ {
+   tport_tls_primary_t *tlspri = (tport_tls_primary_t *)pri;
+-  tls_free(tlspri->tlspri_master), tlspri->tlspri_master = NULL;
++  sofia_sip_tls_free(tlspri->tlspri_master), tlspri->tlspri_master = NULL;
+ }
+ 
+ static int tport_tls_init_secondary(tport_t *self, int socket, int accepted,
+@@ -303,7 +303,7 @@ static void tport_tls_deinit_secondary(tport_t *self)
+ 
+   /* XXX - PPe: does the tls_shutdown zap everything but socket? */
+   if (tlstp->tlstp_context != NULL)
+-    tls_free(tlstp->tlstp_context);
++    sofia_sip_tls_free(tlstp->tlstp_context);
+   tlstp->tlstp_context = NULL;
+ 
+   su_free(self->tp_home, tlstp->tlstp_buffer);
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
