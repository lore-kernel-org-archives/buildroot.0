Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A6EC43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678A860B6C;
	Sun, 28 Jun 2026 17:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgospPE_5avK; Sun, 28 Jun 2026 17:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F2260B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782667710;
	bh=rYo9fPz2rU1FuDeZ/+r7jOYIVgYtPH2319RJxkQiw+8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVwtWgI6nMbOqAVXI3iJZZ/zVyeJ4D6O3HfZLmEtGwnGpJy2u5HjYFw0j3ANdrgSk
	 UHWJOssYxlEfCC2VWmt3yqZlH2BLAx8+4vk8L6sRJ+r5Cb4nreeL5oVsO4B9n7lQHf
	 /OVcGdVWtL+4Y4Mzrw1qr/+Vwim5rHYiy0IjuXSbzxTDVZFX1ASmXAzRsWd3ysZNei
	 /fnmYnWHhWgGLOFuUbsxofxCgZF1rAU93yw++UzQEU5RX84i1dUVRSVVwmMRprdnTE
	 yqenQy+/gPFkApmah0AzA+t+zEWDkWSj68x3COEQZWiLBE961W2PXvn3T8p310cbNT
	 WzL6ymwQtWTSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F2260B60;
	Sun, 28 Jun 2026 17:28:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9D0264
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02083608AE
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dq9vxqj8Ye09 for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 17:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A46C260B64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A46C260B64
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A46C260B64
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 17:28:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00c8.dip0.t-ipconnect.de [91.58.0.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52575A4C2FC5;
 Sun, 28 Jun 2026 19:28:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55726)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wdtIq-000000004wu-3Ave;
 Sun, 28 Jun 2026 17:28:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Jun 2026 19:28:21 +0200
Message-ID: <20260628172821.2992122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782667703;
 bh=i8NX6iUfKvoGLw0Z+q2yIes4eTYU9HYJulpzHndtENo=;
 h=From:To:Cc:Subject:Date:From;
 b=BTzfrZriJjyukUULLlDyeYWNPWnPn/anrqGxd0ypkhRxBd8Prf76bafm6fWqRndT2
 xafLKjL3HcTFtm/SyKNnfDug/pMD/Qn3LJuZugMXGfrFDW75hWI36xmnAcOp3LC9hA
 0y3S0efUd7l57Ji8cOWrVJTuKHif3lMOlGW+i/Fu6HpOj9ddagB4/arX76jR1lXhu0
 QpmVWRI9uaE4JyzzqXY8icr1jCvKSWt+kZUBr8w/BoCp5wutDAulo1RDbxEeIpplFa
 d6PyFxbTkgmvNNYUQBJr63nmcyf4kDml7OGhlp8pFormPh2U88sbERCrGbu3ucW4QE
 Hzxes29unlj1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BTzfrZri
Subject: [Buildroot] [PATCH 1/1] package/gerbera: prefer libnpupnp over
 libupnp
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

Gerbera can bind to the wrong IP if an interface has multiple IP
addresses, for details see upstream issue:
https://github.com/gerbera/gerbera/issues/909

This occurs only when Gerbera uses libupnp, with libnpupnp the IP
configured in config.xml is used:
https://github.com/gerbera/gerbera/issues/909#issuecomment-4826775871

To reflect this improved functionality we switch the default package
selected by Gerbera from libupnp to libnpupnp. Gerbera depends on
gcc >= 8 so we do not need any dependency handling for the gcc >= 4.9
dependecy of libnpupnp.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cf0e6ff8f6bf5216c22a88bb2a65ed0da3222f2e

 package/gerbera/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gerbera/Config.in b/package/gerbera/Config.in
index 3078d2017f..5e602379df 100644
--- a/package/gerbera/Config.in
+++ b/package/gerbera/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GERBERA
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBUPNP if !BR2_PACKAGE_LIBNPUPNP
+	select BR2_PACKAGE_LIBNPUPNP if !BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_PUGIXML
 	select BR2_PACKAGE_PUGIXML_XPATH_SUPPORT
 	select BR2_PACKAGE_SPDLOG
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
