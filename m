Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E8ACD1292
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB4F81F13;
	Mon,  8 Apr 2024 17:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyuqyyDSPC2X; Mon,  8 Apr 2024 17:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D60281EC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D60281EC2;
	Mon,  8 Apr 2024 17:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFE3A1BF315
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA1BC409EF
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 17:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvukOcwItaaA for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 17:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.71;
 helo=smtpcmd0871.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74E99400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74E99400E4
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74E99400E4
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 17:10:53 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tsWArxqRJBZCLtsWAr2eOy; Mon, 08 Apr 2024 19:10:51 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Apr 2024 19:10:50 +0200
Message-Id: <20240408171050.54781-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGh24HtoAyPRsC4JNY496myGCCu1/Woe5xY4A7oy49W9VeMJl848jToc59UNZEixjFtApsCr/t4FA8qNVNdEwmBabo6XvWegxAV5ZQDL+5zm5BhrNnhZ
 f4FZ2lzBBsXGgchkewnlSlaBpycyaxtCQqU+3x1I5K6sAAXQU/IPZj4FytYequhtKvb8yzu3RBUjA/2BRtVojLxwMGno0lIWkN/gbys2pWUferjAr7o2wPO8
 UxFyXcB47INidcHN2QNs2AI8q+UIEnTbtcFKfwCz9o1P+p52LMzQajIwlCpdPlTAxqSuQ3HMXOzeI0NIFCJqTQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1712596251; bh=xQ6ZkdOz8r2OI6XM2LrAuOX4I2Uel7I/hD86pxa7fIQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=DalxYDEaXnx7HAWHp/qzVXqZ218ea6FTtDWinUM0h2a/myiTX/ggi6My5l5KIAGvQ
 vbDX1UrjL4g/cWC+DQAQNRYVlVgYB469JMRzPt83e7Aybp9LiCOtzDHKxv7Qqr4bw7
 jnzwmMxC8kN7fxBJg3NFxUOh+rL6d63EhqowCfl85W4gs728eLg6Jv2+LcYtr9yK0a
 J/ixTp82l4FgFa8SDPl9iVG8l7zD3TPLvdFRjCIbQiulrTMmmEAXm7uOy9C+HdyHB0
 oiucBIBwji9oN60DFU+0CEZmNY0oAzglvFQqP5huGROpXomLf+SZ37qawwaPAyMiYM
 WWGlEtYmd0nnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DalxYDEa
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to version 2024-04-08
 branch v5.2.6
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build up to Linux version 6.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index b19cb93bf6..56e5609ebd 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9dfb2b12c52fe759e4978cbd7a0fb90f0605ae9146a6d0186f2869bbfb6d13fd  rtl8821au-0cab870ff635ba038705ab29363b0cbbedd5c258.tar.gz
+sha256  fde8ca9735a6c9c4c907fb6f565185a59b04bcfa78feb2309941cc09d49c4ac7  rtl8821au-8ea0ed9da764448c7310a27744ab5814289f35a8.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 6bb77de81f..9a92696437 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 0cab870ff635ba038705ab29363b0cbbedd5c258
+RTL8821AU_VERSION = 8ea0ed9da764448c7310a27744ab5814289f35a8
 RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
