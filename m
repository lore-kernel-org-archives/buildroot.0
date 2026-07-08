Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C433CC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99EBD40907;
	Fri, 10 Jul 2026 13:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOwaQY3K95PV; Fri, 10 Jul 2026 13:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9007540912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690974;
	bh=WiKwcxaJCmc5Adqc8jPDuye6S9rnOenGWViVolG/i7A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k+n3sbNtYwIHgmD2kYLGcCMJL6eqc8mnI2OauMATAhELg4CWxQtlR1M4Bp51TGJzG
	 t9JKfgekX4GPvCyEAsjke2oXNcEKWSUf4FClh0M6/jBGiK3ihUm1rHxfalnaCxGP1t
	 3jqLNvGD0u+Y6YpM6/bPOXMiPK67n7x8fJi3TySbelL9AqznBB3vU/CpptqdVmxIlP
	 JNSt5fVQO/YKD8a4TNSAvyKXPy393r4puGhmy4Kn+BGAGi3T8D0QzZZbA3TeUfv2CR
	 udtnYpIbIvd8ofGviEVjqEFGc31dOwJQiuzuQfMVl53CvdR2kng0sNoEThMJeGAnkD
	 rA5sPoP4HPcVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9007540912;
	Fri, 10 Jul 2026 13:42:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 901F52FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E1304076A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zq0v6b2vLBP0 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E45408F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4E45408F0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 065BF88678; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:49:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3ec41904238ff46a45101f884525edb75555fc82
X-Git-Newrev: 33c43cb2279899c32509de6b0c5343a7b96e78e5
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.065BF88678@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libssh2: backport
 upstream patch for CVE-2026-55200
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33c43cb2279899c32509de6b0c5343a7b96e78e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-55200:
    libssh2 through 1.11.1, fixed in commit 97acf3df contains an out-of-
    bounds write vulnerability in ssh2_transport_read() that fails to
    enforce upper bounds on packet_length field. Remote attackers can send
    crafted SSH packets with excessively large packet_length values to
    corrupt heap memory and achieve remote code execution.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-55200
  - https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c5aa9327458fceb21e0278f37765af1d5175e1cf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...itional-boundary-checks-for-packet-length.patch | 36 ++++++++++++++++++++++
 package/libssh2/libssh2.mk                         |  3 ++
 2 files changed, 39 insertions(+)

diff --git a/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
new file mode 100644
index 0000000000..ef54771afc
--- /dev/null
+++ b/package/libssh2/0003-transport-c-Additional-boundary-checks-for-packet-length.patch
@@ -0,0 +1,36 @@
+From 97acf3dfda80c91c3a8c9f2372546301d4a1a7a8 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 12 Jun 2026 15:57:44 -0700
+Subject: [PATCH] transport.c: Additional boundary checks for packet length
+ (#2052)
+
+Add additional bounds checking on packet length to prevent OOB write.
+
+Credit: [TristanInSec](https://github.com/TristanInSec)
+
+CVE: CVE-2026-55200
+Upstream: https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546301d4a1a7a8
+[thomas: backport to 1.11.1, change ntohu32 call]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/transport.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index 869fc5a4fa..7925ad33d1 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -645,8 +645,12 @@ int ssh2_transport_read(LIBSSH2_SESSION *session)
+                 total_num = 4;
+ 
+                 p->packet_length = _libssh2_ntohu32(block);
+-                if(p->packet_length < 1)
++                if(p->packet_length < 1) {
+                     return LIBSSH2_ERROR_DECRYPT;
++                }
++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
++                }
+ 
+                 /* total_num may include size field, however due to existing
+                  * logic it needs to be removed after the entire packet is read
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index c85129a7cd..0ccf5effb3 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -19,6 +19,9 @@ LIBSSH2_IGNORE_CVES += CVE-2026-7598
 # 0002-packet-check-libssh2-get-string-return-in-EXT-INFO-handler.patch
 LIBSSH2_IGNORE_CVES += CVE-2026-55199
 
+# 0003-transport-c-Additional-boundary-checks-for-packet-length.patch
+LIBSSH2_IGNORE_CVES += CVE-2026-55200
+
 ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
 LIBSSH2_DEPENDENCIES += mbedtls
 LIBSSH2_CONF_OPTS += --with-libmbedcrypto-prefix=$(STAGING_DIR)/usr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
