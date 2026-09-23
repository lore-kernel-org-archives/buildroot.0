Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF65C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3EB81226;
	Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCsUqB_yUVw9; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 87B7B81233
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276211;
	b=n8pRoLkP75OyyyqqeIV/glohOvdegpfmZhX14hGO4yUI5QUNG8cE5lKGisCG4vu7bjCW
	 5c/vcGJEgsLPFF45cLCzbuGIGqoj8LRNdpxmRIJ0cWtUDt3xIry7H3XweeiWa3leiJRFC
	 Qez7lcjGjhz/gkWBt+Weg53Fi+4KgIgt0ZapAhFQA7PuyRLh3QfEkstN3lMBDPSHk3b3L
	 Pty4HuzRDXoLzh3XvBr+CXQ6M1gqqVM8YLpSN+ZYKGo23qhfDRotlbC/5SH6tYdW24hag
	 rjKtqXPWqzG9tjKuZ0QH34QhA2DVSjKPsGnEjuvE9cuktWGMJR3Fue70WDNla4iPdhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/CnzUehKJeo5bQpTkd2hibZjVwxM1P0jkRmWBU7RC3Y=;
	b=b48x0LGCvzjlXmLTpuUJEztvBTZoxmvecjAkzjBtZLTrUedowr10aTru72ZrQWvqXMGq
	 kiWfeMt8r/1GSC7pjhEedctPadGjZ9gwofC+zgIKgkeYhHju3kVQGT0Bfmwh+PpGkb03U
	 2Tidvt75AKpVJ/H2okUQsUYFuwj5a4j0nAc/t/HAmr9KXwhUJXMGtp9jHapm4iuo4wU50
	 2w66FA/gfTDKFwTIm0JAEAnHKv0z8inQdiBr/erzoFn9Wf/j/rcVQTUQpcmaGM2YRBDke
	 7iNQLE2NCY0Em+7WTdMBBQLmxduJhbic0Mj3ET7rGwwkv33wH4MP3uEgpYAW5APoEiA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276211;
	bh=/CnzUehKJeo5bQpTkd2hibZjVwxM1P0jkRmWBU7RC3Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YYxwAKanr2YONRGyDQHfkuonaPZj8JlOYgcu/KX++uYTOJ5coWeyfQb3IqXJM7vnq
	 LtXo6+WYWtyoAqs1sAGR2xL/i5U+Pn/5WVBEeaZkJsnh6WhmL9LehU8sBBdkUIPv/v
	 5wDFEwhjDzpwGSgY+9btfM1GMAqLbRw7MB+xyLdCgGKLy/JqohfgueI9QOzP6QBFLC
	 Z0++ahire1tzuwG7sNmKAIx4vmjimqanOfQNE9JaS1XqixgZ/pBbAlgMcJ7/AMvufp
	 dusEtBzREpz22dGLhncQTj8bIPXMXy7pBndXv2k0IOsWmkbQrSdN8xgZ5naBu0V9kE
	 M9A2K5XTuy4Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B7B81233;
	Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F58F332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E4040AB3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeffwOJspeFY for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0CE9540AAF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=VIbwaxye2YlIuVqM5b13aAMdv5DUhUe8Pik3cSQeYx8vozTOco7KJ2prRs+mrs3dIwGt
 8R0x+QSqxPf4jLU178UmKqzoarW94UvYpUgv/EimViSgt2qB7CQKVasOXLdNc+LgMMhrr
 p9kzSHXGrhrCbbDWr4iprHvoWcmxaLy1xRbf/eNESaU1fk28M5HNFeDR8kxgz4yKvep4o
 PnH7ZFvKENQJ25rxFzIVutb7Qh/astycyEq2PDGht8k937TbChCR1KlIJ4TyWqDtMJu9k
 ZxdtenGsokXxnC2K26/zzGmDx+q7dYIBg1xOQl7sAxBx2FiKXIQok7gLAes9WHZM0uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=51bWKeVw1EN1pGGvjnMpWLOunIfKFsLwbXboevcCB8s=;
 b=BXZuTppIXAFXAPOB1KVaXlnAndI9JJR5dKPCN6wRmUqic8SsNMQ2BIOCs6hf6nUoFeTF
 7dHYpMoIr+afwN6IQrepHDVLznP/E2J0ztssPD6SHnthPBsWo4Ko/hvSuH/xOwZV2r3NP
 56sceKAePq9NSK7iiNos230nnzH8NucckgAiRztDuNZm/VGptIVMkp55qqSaeE+foRTvJ
 jn2aMhTatZ6sdqxVAWt7Q5GV47rewqRDSZNVc7G4TfA98gXTx1415rQQqcLkN5UUsrnW/
 dQzUsZaEQiXaJMnFUBLshXbuq70yJdyQKSKmbLkrIOIXajJxjNnwgKVxvF0P7gsZw9w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CE9540AAF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9855D98387; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:45:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bea9b76f1cbab6d7f0601b1f4dc552c503aee597
X-Git-Newrev: 94a3b0cba06a603cb8eabfea101bd2caef102ff2
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.9855D98387@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: security
 bump version to 1.23.4
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0649076702466352946=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0649076702466352946==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94a3b0cba06a603cb8eabfea101bd2caef102ff2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.23.4

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 053c724d6efad1412f2a6c4b460b0f0c36517085)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6001e84ce9..78f59f6b67 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
-sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
+sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 1614dafc74..3428646016 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.3
+LIBHEIF_VERSION = 1.23.4
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============0649076702466352946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0649076702466352946==--
