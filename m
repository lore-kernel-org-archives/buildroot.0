Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1935D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 20:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D93F4094F;
	Thu, 31 Oct 2024 20:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ArABoGuTmyb; Thu, 31 Oct 2024 20:01:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D5B4092E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D5B4092E;
	Thu, 31 Oct 2024 20:01:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 218A05E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DE384092E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQwdYGxZd0We for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 20:00:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6B4D4092C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B4D4092C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6B4D4092C
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 20:00:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02c6.dip0.t-ipconnect.de [91.58.2.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E952A4C0EEA;
 Thu, 31 Oct 2024 21:00:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34224)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t6bLf-000000000uY-3Ta2;
 Thu, 31 Oct 2024 20:00:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 21:00:51 +0100
Message-Id: <20241031200051.1097467-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730404852;
 bh=pRTbauZaReN/SV866+mn81e8TlgWOpEzwxGg17T5X0o=;
 h=From:To:Cc:Subject:Date:From;
 b=oY/YrCeouVDh7wFZkcxi32leEaAx1jop0zMq4oHi8V4KagwhOLHavd5ukkqcJpW1h
 4n8QZx0fb9VCCgqF82DggscPr2f9y9vr/IAUa7nHOgFe1stccDirj2mzjAKMzg+PX5
 LYxd0UjOyHZlzNcV4ut1WlMdmXjTHc6M4eusveJ0pMmL9S7lEaxJxUGIqjmb5/e/Il
 TCiTombbYOZIIKr5rKrQoNTrRNZwmewxI/MpvpS4+NCr96f2ZFiwUJzXghpL9IaXJQ
 02xKuqM3hkfR/u4K5+iHLzxUkKSF8P9+i99uvHG3LlI4vFMMccVnfyDPAdoIeRtqG4
 hN//vScfBbvvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=oY/YrCeo
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: requires RC4
 support in openssl
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/988/98819c1e202ddd77a390c9063ad31ee0601fefbe/

The build error, afaics, first appeared in
http://autobuild.buildroot.net/results/a08/a087c27dbc92c643f607ca9c66977156778ff1a0//
after the bump to version 43.0.1 with buildroot commit
37c397c8b691495b21623b7d0a4d1e5ee7f0f61e which added chacha support when
building with libopenssl.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cryptography/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
index d12f040656..51b408823f 100644
--- a/package/python-cryptography/Config.in
+++ b/package/python-cryptography/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  cryptography is a package designed to expose cryptographic
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
