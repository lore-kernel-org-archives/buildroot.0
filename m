Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1554BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD4E4092B;
	Tue,  6 Feb 2024 23:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fU-dbejoY83c; Tue,  6 Feb 2024 23:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E8140935
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E8140935;
	Tue,  6 Feb 2024 23:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECB391BF3D9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA46280ECE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRSHlWvAf9Fo for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16F1780B5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16F1780B5D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09A85874AF; Tue,  6 Feb 2024 23:09:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 00:09:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4f2cd9a2caeeacde0803b331b3f17c8be98584c
X-Git-Newrev: 3e1b7be3abb5424a906d57fb4e5bcb64db5b4fda
X-Patchwork-Hint: ignore
Message-Id: <20240206230924.09A85874AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stunnel: fix build without psk
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e1b7be3abb5424a906d57fb4e5bcb64db5b4fda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without psk raised since bump to version
5.71 in commit 059259eabbd8d15c1e60c0c3b8631d0c02b93898:

ocsp.c: In function 'ocsp_init':
ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
  112 |         if(!section->psk_keys) {
      |                    ^~

Fixes:
 - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
new file mode 100644
index 0000000000..a8edc1d465
--- /dev/null
+++ b/package/stunnel/0001-src-ocsp.c-fix-build-with-OPENSSL_NO_PSK.patch
@@ -0,0 +1,45 @@
+From 93e5cdd68b13cc3161d9b0094b0f331bdaf07cbc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 17:28:20 +0100
+Subject: [PATCH] src/ocsp.c: fix build with OPENSSL_NO_PSK
+
+Fix the following build failure with OPENSSL_NO_PSK:
+
+ocsp.c: In function 'ocsp_init':
+ocsp.c:112:20: error: 'SERVICE_OPTIONS' {aka 'struct service_options_struct'} has no member named 'psk_keys'
+  112 |         if(!section->psk_keys) {
+      |                    ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1707beea413a8da8713ad2dc59db947329da45d2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/mtrojnar/stunnel/pull/18
+---
+ src/ocsp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/ocsp.c b/src/ocsp.c
+index 5073ded..12792af 100644
+--- a/src/ocsp.c
++++ b/src/ocsp.c
+@@ -109,12 +109,16 @@ int ocsp_init(SERVICE_OPTIONS *section) {
+         s_log(LOG_DEBUG, "OCSP: Client OCSP stapling enabled");
+     } else {
+ #if OPENSSL_VERSION_NUMBER>=0x10002000L
++#ifndef OPENSSL_NO_PSK
+         if(!section->psk_keys) {
++#endif
+             if(SSL_CTX_set_tlsext_status_cb(section->ctx, ocsp_server_cb)==TLSEXT_STATUSTYPE_ocsp)
+                 s_log(LOG_DEBUG, "OCSP: Server OCSP stapling enabled");
++#ifndef OPENSSL_NO_PSK
+         } else {
+             s_log(LOG_NOTICE, "OCSP: Server OCSP stapling is incompatible with PSK");
+         }
++#endif
+ #else /* OpenSSL version 1.0.2 or later */
+         s_log(LOG_NOTICE, "OCSP: Server OCSP stapling not supported");
+ #endif /* OpenSSL version 1.0.2 or later */
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
