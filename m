Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE6EF586D
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 10:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5316D4068C;
	Sun, 15 Feb 2026 10:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aK4naBs8xaZh; Sun, 15 Feb 2026 10:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 856AE408F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771152850;
	bh=O91rUAOc0Nb2qVScnK9xBs/a27ZsUlJHLP7GpKSY9gs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kmY6OPilgS5Wqtc6rh1cwcnDrDppCTGi7vgzv/smdez96rWeplWT7GiXiuiDWxGS7
	 NebteYG6J14cebGGmaJVoFA2f3GqzTUIxYryZTXHjMeJ9eY67JgXomOVJ83z8TS/Wl
	 WOdl0iN+aXmB2OHt4+L6bn8ikh6X42nLHagPaBGzxand+gcpfJPRJvyLL/rKPKqeU0
	 3PDlbWyGzunYpCnkAAG2HRjTJEqUkLNXuagdxbcjdDLyyb5PQ3agqPKw5LW/1jyi5O
	 3Nr9p5y0yh7qLNfP6rL3Co2+G4O7g2wONphdceAazcUMXX49Mw73OhOGN30X9Y9aYO
	 +5B7XGe2YuKcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856AE408F4;
	Sun, 15 Feb 2026 10:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56AF5375
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C6581E87
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFVe4nttC4N8 for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 10:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E296781E80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E296781E80
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E296781E80
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 975877156; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 10:54:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vrZlL-00000008lhD-0dkq;
 Sun, 15 Feb 2026 11:54:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 11:53:54 +0100
Message-ID: <20260215105358.2089856-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215105358.2089856-1-peter@korsgaard.com>
References: <20260215105358.2089856-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=N3LT+e1pq0mmoxwwvHawPM8O29B7zh1uOjKOLGcLiKO/ZeokJ8bheF38UDe89pwNEeaRrYLnBK25PZVXSNdiS0C77U0rBzdDi8NGNlGT2R/y8YmY4RNmyz7EdlyYBP9thzsjr6mxjoqwjz/MhInObq+WGthc5filKjdBGP+amzDNUnNJvNPaRN7QajRJwfHmHnEF0ewAW+5ldBHzEh8josvc4bS2BBA2KNJ4QXkimit6Cquhwc4stDqV6k7RpTDvKmepfZLOAVrEw038nMvifxB6tNEFfqWsMoLDhlfAQ+wnElyDJRS1uLGjX6OuTk4Vov4NTwRYPJtDDQQB+eFl1g==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZYELAbzMgBu412PN+cW6gjfbAMweTorgibrNHYIYN34=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=N3LT+e1p
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/3] sheevaplug_defconfig: specify Linux license
 file
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

The used Linux kernel (4.14.336) does not contain the default license files
as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
Linux syscall note exception"), so specify the correct license file to fix:

make legal-info
..
cp: cannot stat '/path/to/output/build/linux-headers-4.14.336/LICENSES/preferred/GPL-2.0': No such file or directory

And add the sha256sum to the .hash file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/sheevaplug/patches/linux/linux.hash | 1 +
 configs/sheevaplug_defconfig              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/sheevaplug/patches/linux/linux.hash b/board/sheevaplug/patches/linux/linux.hash
index b207306a2b..aa432012b0 100644
--- a/board/sheevaplug/patches/linux/linux.hash
+++ b/board/sheevaplug/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 855efedafa..a6a324213c 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -7,6 +7,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.336"
+BR2_LINUX_KERNEL_LICENSE_FILES="COPYING"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
