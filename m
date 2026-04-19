Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5E9EA7192
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 08:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BB660FC6;
	Sun, 19 Apr 2026 08:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uyg60dFhFpgB; Sun, 19 Apr 2026 08:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D9760FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776588993;
	bh=yu8ZZDNbzonJ2R/AMMgkmHSKT+n8qpC95INzOd6zneM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YMxVGobe+uh2UDnSh0tb/bIEHf1/3MeNfCvenBGni+dyx0ygY54a+0Orrz+DyJFKv
	 23Mk1hCTqYDgLhPzg5ts8kbU3JfvlL6sCVEoDa8cpDSlAjivsfRKGXeT70eEk/lhhY
	 2kTM7Rd42cCbxH+BtyrsyTwK+ugw5bVnJjxZ2I9LyFrGW+4Ox/4hTGuBv7YJO7cK4b
	 aycfSzp3OueGHB4SHOCFX/I6EBErxOzx8G8vWggvtsNgiM7SETMoPuJlzkcn0Vr40h
	 C6lLqu/JFKXIWN+QjhuQUqya7i1c4qFCMtw/c5ZGJrj/7jMSYA7FPuhC5kREAYR7M0
	 WDgm2txAWmCag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D9760FA7;
	Sun, 19 Apr 2026 08:56:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA5F24D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 08:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3754044C
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 08:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmVrksZwP-Lz for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 08:56:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B35994029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B35994029B
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B35994029B
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 08:56:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ENx2wvbK6xFXLENx2w68NH; Sun, 19 Apr 2026 10:56:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 19 Apr 2026 10:56:23 +0200
Message-ID: <20260419085623.1200423-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNHAyLg1sHbWTHH9Tmr+Lv7W7uoBmJoSYk/UCICiPVbshbK8J+j/pwtDT0kna63DkpjaEW1YuVGtihEawyQsAWw+Pj6QaE/gWJDujW4v6AsHB9uERsvU
 ZQjBS32ZcaOUMmRDwZol/Sfd24wdzkE8icxrJhzvaD7yjRXG8nouJCr0xp48a+mdwwf7a3yzNYFwc85rF5WIS4Gm+MMV07fQSl63RgXs9fi46SJ/a22WfopN
 9stscTDR9R7vTNz7DhDCpITU9taMSU6rErTX7bifonmwmG94NEhsu9/MexrmYUZyJuNqieQmfJ0mZnHTcD3M8g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1776588984; bh=VSTFz33fQii+47MAFtW4hg/Acnze00FcAjVWJs+Ow5U=;
 h=From:To:Subject:Date:MIME-Version;
 b=YpaArTGnM8FS0qdKsP1Ks0+hlkmPPdudsoIr5vtt8zqlTsOiOCGE+euuK0H8lH+65
 lsH3X9tp3PtjMSBXnSztl3Sc6RX/h+1w3hm8LF+ypdDf9soK7uW3WnnG8mt7hbdiwx
 oHhzlDBUr8u2lUKEMp9rokISakTQjgSQPcsJR3sqOBK4rgw0I+TfRSRYt2K9+9Pd2q
 P/CaKBmeWox7lQbz5fzTJvWJjPMLR6L07+z+70ySCPMdMs0qROPUL5St5xelklst9H
 7uf8hDqfdy4FLmN4fvZ/N5m1M5Nj1EfvROn0cq/TYEh19GK82f3s8PYv4mYRSTaRzf
 3QgegV5NkMQGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YpaArTGn
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.123
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

For release note, see:
https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_123.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index d0d278c7f6..31c1315783 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_122_1_RTM/src/SHA256SUMS
-sha256  de5a655da82a67e502b802ae0b53f3eb02ea53f509c3fc0ab54a892e04493bbf  nss-3.122.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_123_RTM/src/SHA256SUMS
+sha256  2145113398a269779a7390515a1638800836b130248e33f93243268c026d4e49  nss-3.123.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b40cab03c9..a47856b03e 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.122.1
+LIBNSS_VERSION = 3.123
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
