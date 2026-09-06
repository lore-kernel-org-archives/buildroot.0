Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11569C79FA0
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66F76062B;
	Sun,  6 Sep 2026 19:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOtZ3DNH1StS; Sun,  6 Sep 2026 19:44:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A689E605EA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723852;
	b=S1cwVxPCm8cv8NxucCabJAf4HPSW+8aI6bBTfKThaXUkv4TmBznDhLlFohjs22b29Hvm
	 IOSD2kCW69Y5MT8X/d0svHWDjdbKaiK1I33dlJDIxClAwtKnMe3MhB8g6Z5H1L16DJn+M
	 KGEAFgx0k0oEqQx1sfkngjSM3tXI8w6TwTY9DDynMG2Rw+8F16t7WO+Mopvs2HZoieDi5
	 LvHGvT3wISHehyq3+xw2IdFWRjzUg0yrmRTFuErN8SYcLXEKxvP3abm2l9U5AGM1nJvob
	 uBHwRmQYvmdB36RzspqUhK9Ogz5xe4oKuMzUpwizQTDoR/SGXrx+Sy81R7tjwUfFPjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vn1HgU1VJRU7dLDEnpRKu4tDxZMXOtnnIqI/yMiJa/Q=;
	b=KMkZgEQO6C/1fCyI9delBF7iXQYAUACnjjOOmnOBQpMrPApONfmcI+QNuY/obeOXADmi
	 fU2bXQgwm/mOfbmwxgi+kuNqTIe2PB6oNku8KxFu5stnNaQTWh8G/vSYdorwn1xWONBdA
	 1XjTVGWAepZxLlxcxsQSP8RbXxnjynequO428I46sSvTpLS8oTczEifDr0VIKUjMAEMVf
	 6nEcx0u4WgkKcdkswBIDOG2z8VxbIjE2E7CdRSh+p7VvO9K3T1OumqS44CYF4txMtg5di
	 hP/GN6xqq+tS1s0x5Ys8lSHNhi91/c5hruk7IWzSeomjg6UIHDxE26ceLHPvY3sfyVQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723852;
	bh=Vn1HgU1VJRU7dLDEnpRKu4tDxZMXOtnnIqI/yMiJa/Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JaVPSwxN5xAM5F3wNm7hXu5KbSGymB3p5z4SPHPCIBRREsKZZm+wAcwYTtNyCrgk3
	 Q4krVt/ge+uIzJOCKXOttSxpqVPSSDizeFBYXk6Aa4+hhq7MxbWEPaO2R2RS5/cSWF
	 OmPeu1RSK0W6bgxFp+MgFIH+hzkHMjwWuNblXopWCeJZ1xyrPw69w5CpzXKjMg/33n
	 2rl1QTh9y8CvSWwwNAYyYmIS0jtCT/A/8rsrjoHQcSlf3DiQRnSjSuzt2DRRTsoThX
	 r3Rfqmh2xy7oIpjx3DOu6pQ0BKeuzhPfvZNGMXzXH4/AdrWKGsOUM1y6z2oXySw1iW
	 uewEEZaUre1lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A689E605EA;
	Sun,  6 Sep 2026 19:44:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9308B970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 908CB4008E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pKXXOTMkGT8 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:44:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9CCF840079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723849;
 b=K6GpaGHz6TDiqA9CoR3ih+/G/ToAPCT6DsNivKD59ZNXcD4rWXTwjCCvZbfdMQ9DuMmw
 8tpiB8I5Jm+JP/PxO7w39sYrspGuUIbww4Q0PZCiVHX555OepKLmj8baM0lFGOTR0Pwvy
 RriYd+SttdEStbNlTNxS+7/cSkocv+eAba8PSbpXbgnrGMMFDYK2teUpsu4e48yWJyswc
 8f4CCJdKZzKnnDKnkImmbJx0AXSpd34ND+WKJtElgSKWoXRL/1kt6wjcwGdtn4WCCD2bq
 fCpI1L5QOplxoZJbdJxMcNsODl6VTiKmslkFIPB94DAq8+QoNVLivwU0ABfgfCDstdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723849;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F07M7UbMqoZctfrXZPGHScNu0MAAQ2TlkguRDAEss5g=;
 b=Y2ArcIl/FZrLyYxby+s2qL4VFZaGZ8EN3VlUx8mSpVXAadgSAd1ynBzFi/M1SKawpxmd
 YD3apQDUcq9P6MEN0i1r7klnOFssiqAna0FVmpc5xiBp8v9TXbtqYWY7JJGNKUom/fZGo
 8NA81WKMWVeZLTsUly+PJE6Q5yfK9q+AYL7604m+K61LZPdhAqqWnLeqJxm4OaDMFQuHP
 jVv71vGobKIMdTd72CwJR+3pTmHQ3bx7Wj4DkGobYrimUGZUt7T/TSl29kf8vSjOOFZFl
 zetP0zf1MIZEJu7vfRcC+NVZFAms7JsuwRlYqNGAQqlau8/FJuBxbpwDtj6TGoXlwwQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CCF840079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:44:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AD419546B; Sun,  6 Sep 2026 19:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 21:42:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1fbea37a6e1f81f7117e4b1a238fdc581132d83
X-Git-Newrev: 5a2e1177f9349af33a32b00a90501cb76a17d394
X-Patchwork-Hint: ignore
Message-Id: <20260906194308.0AD419546B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mutt: bump version to 2.4.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a2e1177f9349af33a32b00a90501cb76a17d394
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

http://www.mutt.org/news.html
http://www.mutt.org/relnotes/2.4/
https://gitlab.com/muttmua/mutt/raw/stable/UPDATING

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 40965d21fd..44ad90fbc9 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b4f7a442e41c057774ba7c36fa41aba2edd2e7a12a86031e6ebb113bab2c79e  mutt-2.3.2.tar.gz
+sha256  5624321f0b1cc1eff6cab9ef08f25954ff64c51b33d4bf3b99484cf1edd8cfff  mutt-2.4.1.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 1be1f8b682..8097c6780b 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.3.2
+MUTT_VERSION = 2.4.1
 MUTT_SITE = http://ftp.mutt.org/pub/mutt
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
