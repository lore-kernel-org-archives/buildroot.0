Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDEBC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E93D2415BC;
	Thu, 27 Jun 2024 21:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ssec6T5nyoBJ; Thu, 27 Jun 2024 21:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8671415EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8671415EF;
	Thu, 27 Jun 2024 21:57:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 352881BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21B63400BB
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPrIABR5Ynpd for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03E5F400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03E5F400B9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03E5F400B9
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:57:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb6a.dip0.t-ipconnect.de [84.161.187.106])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17B3DA4C0298
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 23:57:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54576)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sMx73-000000008Pl-3mo9
 for buildroot@buildroot.org; Thu, 27 Jun 2024 21:57:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 23:57:05 +0200
Message-Id: <20240627215705.3053721-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719525426;
 bh=OeuJ4sB2X2yygPJf8pVKBdocdAiV+Cm8LUvCMgWg/74=;
 h=From:To:Subject:Date:From;
 b=wFPxgO/+mGxGPqwERWWsp1LV6xHh4m7CksYPp/xfizkOeddb9lV1rPZTHRSLN8tB+
 nRGtxqIXg/gYkY2eervtF464XWYRZxAJIIXov2WezY/growxvYn3kwKfbcH0uLvlqU
 QWTrVGdo0mh3ON4rrMAR5rN6wyiqnC3nQZuVmLkb87HYXFjZnESdIuSEU/40vCtpYq
 j4kzS/rH9Gch/HsS67ULlux+fXGjSod18sxDhjWg7OkNWbhZ6yUjTKX7wVvPKujqxZ
 nSbi3FwIp8xYtYVvic9eI96zzhSC5KM5L0KUwQeyEQJwlqo5rFDTrl2YJFpejTkkTE
 V1iGQ4hdL2gAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=wFPxgO/+
Subject: [Buildroot] [PATCH 1/1] package/dovecot: needs engine support when
 build with libopenssl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 623d3bbe43e9193aa8e3395367d01af59071b859 disables
engine support when BR2_PACKAGE_LIBOPENSSL_ENGINES is not set.

Fixes:
http://autobuild.buildroot.net/results/7484edfa0b8c45bafb8da051ca839bf174c8f93f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dovecot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 034dcc175f..517040fad6 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOVECOT
 	bool "dovecot"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
