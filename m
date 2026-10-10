Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9602DCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 06:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0DB360675;
	Sat, 10 Oct 2026 06:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qnRAlpvZvtH; Sat, 10 Oct 2026 06:39:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0AAA560662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791614377;
	b=FFsrscJMNtF0aDMAP8UfisFE5q6nLx1G4vNmCFCUxaF75Hmoa4hg6eNvjQL6LiEn7Ctn
	 KYHheqkDrmSGJ4Zn2VZrXuI56zrvVg5ooyTnRiUe2go/ag0X9iILekhaTrbbu3YCvocjA
	 24WCYBRX6PNx9axwHb35Q0V9goRszvCxsNUZ5yHq0IdRgaDTx3pwcrmzHrUBZnXRQcUUP
	 uady+C8CfUyvZ/J+tVoi/krXeZqeJi5e3IwQKX1Hoi+r3iqQ4skGcxoiuEC/R4WC4CGWw
	 8SRGhar2KhrMGjkq9KMLgIu1PK2LBBWKlxyhcAHOSrMgxTc3cg5KeJWTcBXEkrfmGww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791614377;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OYqvA+8NjTBMmFWnLWHLs6/xquQQkql171bcrUkf7XM=;
	b=pDi2xH/DTY+EDdkWrX0xQjRLjMDBncvKn+jK75onOHIu4pfT5r1ZI9cki7PGi8zIT4xj
	 vM1+0jqRv3SY5cwzJYp7chCLrHNkTLfJl/zkSj21jWU1gRPV0Bu/A8XqBmIDlavLgEs4O
	 J9G1JAdvQ3zwfNsGrsrlxVG2LohWSsl2OdugyOcGGrVWcdAgoq0dCFv2Ol70JK98uLIUj
	 I/JWZFyFiyQmIXVFZAdUNobnFYM9DkCpNyEiUX3Ne3MBSi91KZ/iqDbivGswA/ePT5/Ge
	 jRhWbVbVVBY5HEYlpdyLyFxE+pBeNFtUFfU8TGBBdy7S0RJpjji8GBsM4bL16bXSTQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791614377;
	bh=OYqvA+8NjTBMmFWnLWHLs6/xquQQkql171bcrUkf7XM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fvne3++uh+LavIrWNr/mWvxXaZEQD/bjbikmSmSf9GkCinZuMh0R10GORO0iFE94C
	 WzISoVhADBFledLEcEadFK7RqCIs9myc+4OXNq3trpJ0t9INSWOUY3DRYHaJxL29b6
	 HPfF9E0myBlelVSc14Trij/fEsadCntXcTBPMYw9h3m0i7hmMOgbyaqlESpKXEb8uE
	 +jd+e9H5v5InpFjQaAAx9rf3cdWDAbanPmJ/6CNiErx5+ilA67GIRssHvEvdJGMjOm
	 6hdtTCFxYhhdrdH46zG0J1sBjJVccnhV7mjlyQHhu/wC/mCTUxRKJ8x7Y5g+TJSGmp
	 yWziwpY8pos7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AAA560662;
	Sat, 10 Oct 2026 06:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F88111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ECC540931
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wv1zCO9Ly1JK for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 06:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8CE24408D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791614374;
 b=TnjAVMiDxWJK+DvXPuFK/d302WUGx3s0duXOfooJRVJZUE2Xxbt6gyFIMDN/IF9hsiyt
 8BZ8516mXlVaLj7AErpbr4HvW/8bi9qlptJWOKy83IXsONqSiduGl5bpEsWgHXP3X1pO0
 Xyw8iLl3Fu5GRnPaYXcJWunaRjYzjfHrDbwhO000qqsV/YBO2QGc2E2D84ksOyGU1SOQJ
 RlxbwftPYXbSt4D838hwNV7/oJSoWd/cBVm6G3PTXBEAZjyP+zKh40cdEQrCeJ7TPYIe4
 DK3/RorZMXuV55yVVOldzmU/GgSdaC0jGMbqS7SeQiYANERKr0XR+Mxg0E+lLIPjJ5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791614374;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sKMIxQMdz4K0nH3ysjNCj/Qd9lmpkpBoHXv+O9BT2d0=;
 b=c431rB3lfjQOJQFgt/exuKuODpodIZJsHyPfRXR916YpA7xV4il0jB0JWCnGZ+5GnGFr
 EC6337vjHtzcukdKsL7HeWCptPGPdAcGEBItaEped1efOQ+UCg67NTu71AVzJSQI53Nj3
 CmBKqUKkBxIKH1YV/rl0A/1N3yh6zq6AfvXlI1F5I6Xg46cNbhs6kY1PtXamGHgx16nmr
 0a3WBrE2aP6nCnHonQIRr7OhyRDYZJAf4yFprnoQ7GrNhBI6IiH10yseGGkA/TyCHfKol
 W4VM4r/vNpSVDe65EOlc77FTAVvXhfg+Yak+J+CNIzXp2skjY6CZipey9oMpLX7YCXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE24408D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 06:39:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EEF48E4AD; Sat, 10 Oct 2026 06:38:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 08:38:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e48f425409acb1bcd68a8de1f4dbf0efb386e644
X-Git-Newrev: 9e5609cf61077193b00b159ef6327f019db89545
X-Patchwork-Hint: ignore
Message-Id: <20261010063816.6EEF48E4AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmsxx: python bindings need
 python-pybind
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e5609cf61077193b00b159ef6327f019db89545
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes configure error

Run-time dependency python3 found: YES 3.14
pybind11-config found: NO
Found CMake: /usr/bin/cmake (4.3.4)
Run-time dependency pybind11 found: NO  (tried pkg-config, config-tool and cmake)
Looking for a fallback subproject for the dependency pybind11
ERROR: Subproject pybind11 is buildable: NO

using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_KMSXX=y
BR2_PACKAGE_KMSXX_PYKMS=y

Fixes: 0710da403def5df6219c2b6a3f4cdfa5930b2a89

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmsxx/kmsxx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index 0678b50540..f52a104701 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -20,6 +20,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KMSXX_PYKMS),y)
 KMSXX_CONF_OPTS += -Dpykms=enabled
+KMSXX_DEPENDENCIES += python3 python-pybind
 else
 KMSXX_CONF_OPTS += -Dpykms=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
