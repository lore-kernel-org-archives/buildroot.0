Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D301C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 10:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA5E64013C;
	Sun, 25 Aug 2024 10:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmdGJcMVy1ku; Sun, 25 Aug 2024 10:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51CFE4044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51CFE4044D;
	Sun, 25 Aug 2024 10:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 256EE1BF317
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 10:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 133DB4044D
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 10:04:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImP5MTifnThG for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 10:04:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFCB14013C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFCB14013C
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 10:04:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52FF486142; Sun, 25 Aug 2024 10:04:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 12:04:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dae8cddeecf16c791f3c138542ec51c4e627d75
X-Git-Newrev: 71f54e07804437df8cc389e618e7374e5c3e40d2
X-Patchwork-Hint: ignore
Message-Id: <20240825100420.52FF486142@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: fix static build with
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=71f54e07804437df8cc389e618e7374e5c3e40d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/de08bd5c68f5fcdaa5c0374a4f5051c4751ebb88/
and many others.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-static-build-with-openssl-3.2.0.patch | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
