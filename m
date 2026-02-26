Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4585EFD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E80B74047E;
	Thu, 26 Feb 2026 20:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJLSTIPvqGmb; Thu, 26 Feb 2026 20:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F18A40483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138223;
	bh=v3FEBmy5eZq/BVtQmDu186ywRcMve7kyWSXJSo+5r7c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A9iTpumYkIFdkcmCJLD0pnJxuOZsr/mIidqOx1jstpAUu0nhHxcvsaIBLD125Rrl+
	 ecpbTJHgLjX7k53pjgZlAMVKWMr6jZYSSTPytc1Rhre5OON+KgQhvbmhBycqdQe1AS
	 cAGv68tHGsxvWbWSqpTYJwUJSN8oCG2Orzbgjgx3VCryg5y2mZxxnW/KUgK2+q9eSB
	 XCODw3ss4h43f2I8iHwhMvGNORgSd/O4pJ3QQfaKpMkzLfN4/BI8a4uw72amIx1/FO
	 +jXFCuiwSLW3xGF312YYrOHeCHWWNYg9z6q7fVd4b3VheKp7YAG1hOSIuKA74s8Fgo
	 AyHQaI8ieRS1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F18A40483;
	Thu, 26 Feb 2026 20:37:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 00AC223D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B5780986
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAzep9NYDKdm for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02B3C80984
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B3C80984
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B3C80984
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:37:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D964A4C270B
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 21:36:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42092)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vvi6V-0000000082C-0FFz
 for buildroot@buildroot.org; Thu, 26 Feb 2026 20:36:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:36:58 +0100
Message-ID: <20260226203658.3538998-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772138219;
 bh=HAwHF2AQKEV/vx0/4jjgVXWVR2BPHJhh8HAElc8W1m4=;
 h=From:To:Subject:Date:From;
 b=mpVljo89jOMmnO25Y2DO4yJVNUhMcGFKEOzJLed8OtucvTXgfWVN2jH0POWTjyHRw
 kEQqQbM2/p/d1Ms6lIVgh3fB/7UsD170vBRDjn5a56D30FLpuxSGKBDz84SvYPKKNZ
 mw8X732klIyrXSYH8h9t6nOCoFbE3aZe92JfD80dC0LEhQk99Y4nhfHkxEoJBb8Xvt
 jFaIne7K/Gxtk4G5MsNAWKdhKavtpWeCVUCYAv/5PKww2G873obgV1xD1mtjicRYhu
 VFPpbqVE1Qfm9TnrrglD90Po/oYQgaarjvRmUpcWp7Cvn2MwxwS9GC36rS6nyUsxRn
 yiLG5GDU70dDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mpVljo89
Subject: [Buildroot] [PATCH/next 1/1] package/transmission: bump version to
 4.1.1
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

https://github.com/transmission/transmission/releases/tag/4.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index b6dcaf9ae5..d554f8034e 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  dcd28c1c9e6126229c4c17dbc9e95c9fd4aed7e76f4a1f2a74604c8cddec49d6  transmission-4.1.0.tar.xz
+sha256  e743283ee03a42c4d0b08fed2bd52b554aa6c9f65b4d4d45b795c32d98762a79  transmission-4.1.1.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index e4b6d8d189..b7e204dfce 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.0
+TRANSMISSION_VERSION = 4.1.1
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
