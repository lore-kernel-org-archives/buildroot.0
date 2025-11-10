Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1632CCFA1A
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 05:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E137608DA;
	Mon, 10 Nov 2025 05:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ci0UMl4OFdRK; Mon, 10 Nov 2025 05:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4AC608D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB4AC608D1;
	Mon, 10 Nov 2025 05:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A55CB1CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97AD7407CB
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96R3TBcgK3a8 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 05:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF230407C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF230407C1
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF230407C1
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 05:24:15 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso2174123b3a.2
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 21:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762752254; x=1763357054;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=akv00Kpi/H3mbxHn+B4oBk+gclCp8/oy+H3tUDgIJ2E=;
 b=iDp6Su4PsC53S1lKt3TQNU+gpQ9jc2JQgJsbSQCSO6bwgpbnIfCTMspwV/hkFYTj50
 bnMUjUj3BBNSDW80pE8XOWVxlfM4OPrvoWFDfP7PeS36W8NDzeXMymJi1EmwnRAsVJ6i
 /SstBgk9/mbwzFg4i0diW/ahCPyGA9+32qy8FCDdAb9AGM7PcxBaUVEEtAAntfBpn5EF
 uts29h2g1581Iq+85WsuVguobyu3jn9WpvpJ0plnW+twFOM+/+77sJkw+35wLJU30baW
 ZWivRda0kY1jrlGo698hZm66DTJTiCqgEFaIAcrtZ37el7d+hSD4Ka+z6Hn8PF9b84nV
 tiVg==
X-Gm-Message-State: AOJu0Yy+pl7fETFvOAytblWZR0HEZWfpr4me+9RQC8FnFVUw5BCRty66
 a7jYhJ4Ryz9lQ81Mmv1kbuL0rqqiH+Ww98PF55LmeSMjXrbKb5uSxt4Q4rSj+fk1
X-Gm-Gg: ASbGncvONAEyx9+ZP587bfaGN24wrlxiq13n5yBtzPcx+gBoQRIZFSM2OlxshCtpwgb
 /qta8kvaFEcm+cClrll2eN0HnF6xPs0CYDj+sByGzDz+mrSHQHOlAmgL6xlA60Z5ISE8xxkoagS
 QJSS59vT9CpDhrZdrkdit+xHBydxGjrzfTDPpCMaP7KodPDvvPDmYt5AgLGSrCJeHpcV29RZ2lB
 G/AUIysPXC6kSl7QdDW/xBcN2L9Tn108e/GJXsfDT4FuQV4IMicEDq5Q1a8hKu2UntUCnleRxlm
 r3XjIfQuHnVCB0DVhwCdCj7RmDD73CKNbMtRjtXNjvtdq4CeKLeSUmXrdpYCJhxLp2Bt0HwTh6l
 OUotBMCclPjf0vnA9JlRsDFbExkv/OXTXEKjWIDmxY0kJwUdYlQtOXv8RkOoi0FSQTwCeEld6vR
 nxVCC4ddFrToGNIGRUac2WYrAG8YjbxMpgmY1PC1SCPwUe718AN+zhNKLAh6Xra0JPr+Bkpg==
X-Google-Smtp-Source: AGHT+IG+UeoAO9E40ewYp5hGGiSPwFC/rjPvIQlPcm07LWvbS2ZDAjVog/PYamqXml/4obkauUisFQ==
X-Received: by 2002:a17:902:e947:b0:267:a5df:9b07 with SMTP id
 d9443c01a7336-297e53e7303mr89695945ad.12.1762752254484; 
 Sun, 09 Nov 2025 21:24:14 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-297fc2227cesm40489215ad.95.2025.11.09.21.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 21:24:13 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  9 Nov 2025 21:24:07 -0800
Message-Id: <20251110052407.172087-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762752254; x=1763357054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=akv00Kpi/H3mbxHn+B4oBk+gclCp8/oy+H3tUDgIJ2E=;
 b=RvVgZ1aTnJWSg2u1/qPgNUoJa0Wc2vbfRPKCMSwoHoZEhDHcCw/LvOTgy+nvnuVaZZ
 Epg0Rhj34eoXdLTUI2cVILBZnur6RRT5WidN0eZyLGUK1qXCbxkylWeTBecCGw1BnwBg
 PTazYT/B04Z9ERSybrHzSuOvhF4iNOGGkgLK6hWEXLoaPCDkoH6DSUXzSdNfcy0Ngayv
 QTHWUQ/eic9Dsrk0F4JyU3KypKAZ4vu2L+spDLlO9SWTIHpYGYUotWUZyLXRJuMxc3Jp
 b5oy0xvQ8V8mIzOaHOYhp+rPTe+Qrro366g35HCIpjRoNRGys/tCVyvFMHjlTSw4wtff
 w2mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RvVgZ1aT
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.41
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

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.40...v6.41

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 44e73f8b50..9084f9109e 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  576d40d14241945926876ec1b1dd164bc59a03076b325fc1dfa07094edae4b1b  ustreamer-6.40.tar.gz
+sha256  592fab2eb10ccb768e19b4e6631e1279d415f23d268a4b45b9d440378beaa570  ustreamer-6.41.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 18f354d3dd..ef5ac09eeb 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.40
+USTREAMER_VERSION = 6.41
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
