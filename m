Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCBCEF5870
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 10:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9D160788;
	Sun, 15 Feb 2026 10:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjP1hX62i-az; Sun, 15 Feb 2026 10:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B9E7608B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771152849;
	bh=f1R9sdklI/w0lYXUoLt/zMzMFk/nZtgGR2JMDs2q5iY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iUkrFxf6BqZmgbVj0xeypHjyjgz6y0L974jkuJZiCG7CHskNxOFUag83ySVAC6y+1
	 /vcP7uZSF4hRqWcoQyrvcWIGxvcHc1du3izOGuYEoW0Fed9di7YMbd/H0YYfeLPS35
	 8dZXtKixqaWgm1F+s2iBDTaVEpZuM8+nYI/wSeiN+855X9MeEaS4K+nM0iXv/WjdJD
	 QSKSn/YsmH8aF0F7TR77gs4s5Eu8rL9vZaIUOHD44+LOl/hIvF9gO0zZanIU3n68/F
	 5QizRV1BkersrfMg64qZSP6a86qdftIkedggZdh9EDuxssX/rOvCq1kMTigrKnxvpA
	 tt1rr2rNd6TAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B9E7608B9;
	Sun, 15 Feb 2026 10:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56327270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438134020A
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HORrRmUcRg7a for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 10:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D2DB40131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2DB40131
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D2DB40131
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:07 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1210029044; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 10:54:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vrZlM-00000008lhK-00E6;
 Sun, 15 Feb 2026 11:54:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 11:53:55 +0100
Message-ID: <20260215105358.2089856-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215105358.2089856-1-peter@korsgaard.com>
References: <20260215105358.2089856-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UmAcgb7+fzeu9x27PdIJfrk5euJB7p/awOU/JRuTUwRxe1NZ3pAwGxrsSnh5CG5Mu7+zDe/I9by3gZ1kNsLcMEDRTn9LE2EhqsDMV/TEjHrYFYjTOdTxViY/s1aoEV+AE/jQhcU2pKhCgA3zmfj/gg2erWwkQGBni4U5TxvuyyWxDE87QBD7Re3tOX47bH3iMHaCT1Bu4gvgBfj61QidrMF7T/r2V++5F7cicztEqQxN8tXbGhH3xKyxGdI9eHK5rdsw62fPnP4Ft6HpWLLACMWI0W1zriRyG4gP3aKRyQr/OydLunjYvUiYCCNH+G0TFNSXVCQi8zoMhMqnzoLgJw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=lbNBeA5fJh84DwTaOLcFhUQ/JfqD0rZ9DSgPpJyy+U0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UmAcgb7+
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 3/3] openblocks_a6_defconfig: specify Linux
 license file
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
 board/openblocks/a6/patches/linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/openblocks/a6/patches/linux/linux.hash b/board/openblocks/a6/patches/linux/linux.hash
index b207306a2b..aa432012b0 100644
--- a/board/openblocks/a6/patches/linux/linux.hash
+++ b/board/openblocks/a6/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  0820fdb7971c6974338081c11fbf2dc869870501e7bdcac4d0ed58ba1f57b61c  linux-4.14.336.tar.xz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
