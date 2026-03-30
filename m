Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E24E1061B0E
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 15:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC48860BBE;
	Mon, 30 Mar 2026 15:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn8tWfr58ZW5; Mon, 30 Mar 2026 15:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FAD60BC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774884046;
	bh=9+muFFjYAz5txhas8t7sK31Cu67TqtN2kzQU/OE17WY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GCJoWf5giLGoUteTls42/jtFXfhiQnmG2FzxfIrivFRunDl056lzGSkuwddJZ9/Ws
	 CJ/lN3pLC2zH9BPBBY5VzX7fFBvwBohvCZ9f4cqFNJuFZ1bx6oi1BRWK1InZbOfNrg
	 C6mfJg0o+7oFhD4DyHPhIjUuA4tzqnIHx8lXQR7vZGW64q/UCQEDjUgQNdTQd/IeS/
	 IpoDFztPMyh6gqaoVJS59L2psjpODEK1X73KYeFlvdOSkoFEU3HIl57re+ZivH6Vrh
	 As4o2LgsKIRZJnQfj6SBAKTph06ssb3UC6GJR8+Xnbt1yJFVK4Ra8w3R0mRcpOcFuA
	 91fFa/z3I9aNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12FAD60BC4;
	Mon, 30 Mar 2026 15:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93A421D3
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85C9280F14
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BGKeU6pCfDo for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 15:20:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EFD580F04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EFD580F04
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EFD580F04
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 15:20:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7EPtwaGcUxFXL7EPtw2fuT; Mon, 30 Mar 2026 17:20:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 30 Mar 2026 17:20:36 +0200
Message-ID: <20260330152036.4180595-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGw8aliqowCQeCqdEfvN1MIj6NK2s2txXmN0WVn7iZ+bghlP979wPgiHzPDpFlBr5a1kGZDh9HMU8ej5wthl9+AEut941LwMjOhUjEyHzBKU2k6us+fX
 Md5Et/sH11zIJHzfRTQzhTzaLCjJXkgLrp83Z3j5OnnA7P696Bunq7O5dCPUfjAEAcioHgZZ94txXUcnUcZ24QpDGsaDHHdO6/FjWE4gk+DkuOqV+j+cIeeM
 hfZMCo7VXmBn706VPfQNG1do4zAIVhPXQWZCV2bIVVcPSw5m7/vYaQTn0UZ+RhDeYIhzbH7/PhaFwpNy+ZICtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774884037; bh=CUA41uzpnqsILs4nysONhWhP8q++/iU7BHotW1QQUxk=;
 h=From:To:Subject:Date:MIME-Version;
 b=aUoEUONE1ZQmAUUMS8Jt3GF51wfNAPAh6D5mvARuVW4cXxBK5vGlLxEqER8XKhXUh
 OdmvL7hQtPpAUY0YEjrBL4C37pT0szCgUF/ZXseIIRf4DJZlJ4sQgkZm1ootsDq03a
 i+xue/8gJkK4YSTA7s7dUc34Gtl244r+20BKAUrmMgRt4OezuHx+i4m2x9haGQFgYA
 SIRWW/BzGPIRjWTGHWy6gJtsMV+N5lHdLCEAnc6vs/Mj0zzJp8ie4G4W/KnVvUg2li
 agGqsXWbm88S6U3h2iplh13akR+/NrdrAkznqyKuiu+62GRbMgqcR1BE+GMiXEbCXe
 jBoyQNXs8JdRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aUoEUONE
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on big endian
 architectures
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

Add local patch pending upstream to fix build failure due to missing gcm
stubs.

Fixes:
https://autobuild.buildroot.org/results/9899df5d31b32c414f9a924aedb389217bcb9793
https://autobuild.buildroot.org/results/370b9ab04c2eb8bea81d6216a8ff18fe17a6b5ba

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...build-failure-due-to-missing-gcm-stu.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
new file mode 100644
index 0000000000..22307a96b6
--- /dev/null
+++ b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
@@ -0,0 +1,30 @@
+From 1e78c2416a65a3b00ed4f0d87dacc033ee65718c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 30 Mar 2026 17:06:14 +0200
+Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
+ on big endian
+
+Let's guard gcm stubs also if arch is Big Endian.
+
+Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/gcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/freebl/gcm.c b/lib/freebl/gcm.c
+index 994072aca4..c2fa685291 100644
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -35,7 +35,7 @@ SECStatus gcm_HashMult_sftw(gcmHashContext *ghash, const unsigned char *buf,
+                             unsigned int count);
+ 
+ /* Stub definitions if we aren't linking a platform-specific ghash */
+-#if !defined(HAVE_PLATFORM_GHASH)
++#if !defined(HAVE_PLATFORM_GHASH) || !defined(IS_LITTLE_ENDIAN)
+ PRBool
+ platform_ghash_support()
+ {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
