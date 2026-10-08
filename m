Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057B4CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AF16090B;
	Sat, 10 Oct 2026 09:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4g8m-kr_14f; Sat, 10 Oct 2026 09:27:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6991C60EBF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624465;
	b=mpMQkfVQF01b89i5W2wEbxCwBK4UprAj5upB7cfc5F2OTSdFRWv+SiMFca5a9eP/KYe9
	 3Gaz8BOfGMGJ9E39jdE+2eZ4lqC3s1X4y0FOCqyHG9jqaT9Q/ziWV86IjW8sbzc68xLJt
	 ci0J38Ch+KUXzIm/AfRco/660/9OvYW/gpgkJI+IA4PBJiALChWvJF81x/NAaOcAq05Zs
	 l7DDQQcEPMa3CVM9mAYezsJp6DlnOIoK2ZPoyUA2JD7u6UDFn94DIGisNNp8yqW/Ike+o
	 1ZkiuDg2svzZ7f9mqq/Dgzhfs8B23D+gTvPZ9WO+dtJtUwH4+GYPgkNJQSGWv1SoAiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624465;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=c2e0DvIiv8ZRH50+daOkeJysloiFCkoqLslmAVmpKic=;
	b=swVHdSwBObogXwk3bQfYkYUg1JsvYYH4y5835UFGieNV0l+zLv8M/vU79JDXHw1dq862
	 69F4I2+EO7uyWa3IWFtYpJ/ni37ethI+wsycriIHVlQEpb3tN0Eyx0kXNmhTsk+jpN+Ui
	 0vCyAB3/07o7tj/MHtdltVy35iFVFeT5aBSLrLBT3NZP9RgSc/gDNoPeyAPsutzuEiz6x
	 637U92rdzzRFK9agBub7857uCdnOSCP6j4lcgJggWin4ChUGItwBlTlaGC1TE2wJlReUF
	 yhqtXf3Fj2oAcGyRHLSFo/rozN1oi3EKCb/aTxdx4QOw33x2LKjw9G/xTxA92JHSZlw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624465;
	bh=c2e0DvIiv8ZRH50+daOkeJysloiFCkoqLslmAVmpKic=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TyWvPIWvDjtOpDT910vAgjcgaB67l4YEPLOZBmRl3IQHbdsXH9xCor3/GU/GTPX+m
	 moHTEPxLUHqQ512rU9Je/6wGZs14vahvc7Be0+6PxYnEgrUdKoXILhO75zncvpnnKU
	 JrtFZTwLTUISl9sJmUpt851Ftbs30F5rz/+uGOuDzs30NCZYiVofSl2+Pn+t3oMaqn
	 A8DS/FAVpHPGQD/Eicl9ejxRdIBXxvWCNsBgmNMfZCwyOpQxhrZt338ClwooyU6HRq
	 6uRnbmeUFZ7maKhiAMRG1juIBfOlnSDiw8br72Sw2rmeA48RidKGhrVE1XVOa3h6+v
	 FX9+zqrihDhLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6991C60EBF;
	Sat, 10 Oct 2026 09:27:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDC0A9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C456481213
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tsSHa1GlFlj6 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DDE7F81123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=RfC4Nk/zZRWJjh+AswRT2RREdkgIrkfkqnxCodR1E7gRCFIVQjvDCRe+F7VKyPbyb7VZ
 xAbXERAOy4cDrHx7iyiKETmj2EeaZN9sf6q/YZ/MTKg/18uTMXpwnfM1bd1DM4g54MvdO
 OsMg1Bi9LZKXgSJGI6VuCDDFlDAZr/F3Mzb2xQ7Mi+Z8cQRfI6j1FMPmkoI2VamXBtF/L
 xqFEsMg1gzukyGaQKzJDkcgLXPzqfSlo9dw3D9EI0mI4p7wT8FImfbzMjG0NNazMP5nlq
 eiJ3YsICF93XYlI1fx+mzlnkF+B6/eDQxda7iMDlql0BxXURnFs9PFcdBEdp37jCHVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3jfzNuDy5e7hvKdtUPAlqHMCawMJrvwNsXZImYlUE/4=;
 b=k2rIVWFnI5lAPLUbKbYmBiKpglnyq0MlbeREScTl78CPIiHbmP8D84xdXNjNg27hmG4o
 +ArXG5GhBUw9ezWPJ/ep4WEeMVprt/rIz+ciqc+BUPO/aBB/wYK8OW4iJ6IOA1qW2b59Y
 u/i1SUeYZ0ar69m98eRNGOf8JwhZqxLNiTJ/mE5ReWYtFDoJQKv6qlPNCepj4p1dHAXZf
 wAwdVX+K6G96JRtcCzoEclgbjO68URgz3ZYiG8csVoQng3d+EJ0CaDeah+CZLEBhMiPWP
 cielYvC3CFA6XiUuM5T9GdA+gVw57MdBdC4j38t5NJQDvfr+2zoLHYnrtjM+whDRTcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE7F81123
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C78E18F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:04:31 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d42116810e6142fd7c245660cb807c2a05cbca62
X-Git-Newrev: 4ea2bdb452b914ce5b3c77975a925b0a42b057ef
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.C78E18F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ca-certificates:
 Replace c_rehash with openssl rehash
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7785328605490350211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7785328605490350211==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ea2bdb452b914ce5b3c77975a925b0a42b057ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Note that c_rehash was already described as obsolete in the release
notes for OpenSSL 3.0.2 and 3.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Martin Bark <martin@barkynet.com>
[Fiona: add note about how long c_rehash has been considered obsolete]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 97e7c6d82fadd52e88ea9db8f19f714a627cd942)
[raphael: resolve conflicts and drop the fix to
HOST_CA_CERTIFICATES_INSTALL_CMDS, not yet present]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 1f3f192d4a..edc99dfbfe 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -35,7 +35,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \

--===============7785328605490350211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7785328605490350211==--
