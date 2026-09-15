Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1DAC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3EA780E2D;
	Tue, 15 Sep 2026 17:27:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXVcZrMPywDu; Tue, 15 Sep 2026 17:27:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B372980E35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493249;
	b=TkPzSMouDyEpKIUbxBSUZjfYCxoMLAs24unjPo/z8u7i+bO9oUYpDQyYPLgg/LLzJxg/
	 qO8JpdsSbbQJNRCjU3IbbCCR++RCHTG8T8vPp1gg8zGpQCocojFQbslildi0ge/5pn9uN
	 BT9Wal31uGMjmFowTOzKrGqS4zRFrcXJb2U7x55jo/7iE+GoZzi9cZbG9/UHsPHUfY6Yb
	 r2RDX3XlC4FSRZBB85xCNew6VrY3iisJ69MoR56jM7PphJqYOO5izYA9jBke9SieGLzRp
	 mzh8UsU0HylBMbpsnAFHNIW5kP1WxgPckf4TP+bzuJKxOh2Q4z+MoWv8g9Za/u9MCEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TKllF1FOxgbAqoGb2piXl6g+v71YRyAdQEJGR90lfOo=;
	b=UPrvAXW7Qt2/fJm0Kd+gc573CHwD/ZjQlGwqxDvl9qiv5QKrThk6PV2ov82Nsm8g99V1
	 a9CyQRabzgupQTHloWUX12wSiHL+qBLTdSdMEfganiJ0128Y/z1c1Mb5ZMIKO+5m4inbf
	 SZ9J0tQ70xUuWQtuTyxC3MJvpWboSenu8YuhEG7UP698H0kJaGmWUq/o4AbHKoMMm3hN5
	 ZqbaFekFMFfHAiKItYwEvpztTWjPiVG0Ktb7QV1ETFfUevQ8t1NyAm1zB11vmqx3wb2eo
	 MGZWj51NG1isIXt5iZPpP0gTE3UiYu5Mu7gmdiOhy1YJB2nKabducxM0qlvseWwa2+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493249;
	bh=TKllF1FOxgbAqoGb2piXl6g+v71YRyAdQEJGR90lfOo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K57d3d09MvTNuW0tj69I09cDN5gzhupHWGzMeF/l1ZUDl93RQ6yVpCSVrCVr1hEjD
	 gUkTvyjIVCjb9UBHnKJ2t7/orJDiRFKlGQdVQUkJe6ysq8bXrLQLqHe9Kf0WV7lfA2
	 Wv2D00/HHDXjGDLuLG5+g9uZVLk19mMgR33FRspxR4OK4wd7u8v1aXO+f6ToJ2UWIP
	 chXueTh/qqloSNvvdq/TrUt/aIGGF3ZhIFcJgzCS2uNbSxeqXcqDu0u0eit8ethdiE
	 ir6MVH2LswWXgADENgSV4+E7awZvfSaxb5wsYCUaB7uC90ubjB1bicH/i/OR48h8iw
	 XnhvMFcMqDD1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B372980E35;
	Tue, 15 Sep 2026 17:27:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C408BDCF
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63656075E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPYt3U8oD6Os for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0B78A6074D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493246;
 b=aItrQYKS7MLdob5DEkmxLX8rWSQm4hJj3GJVyHFgzzeoT6EdQw3hch81bqq3+otbkK2h
 QO1Rkfj6UUuYrwFjdfH2km5ywIG+ndtVNSY5foNUcsTxmPOuxYjLWQrahhWaAGBDmr4yN
 gX4ivS2ugs7ueMi1bnBQQcQ7Sq2c1Puz5WGFdsMyQdTSQgU44c355g3S2bdTDRfcTQYhI
 u6yQvEagYOeddFv8qb5nrx01OUN0+rHeIiwju3tSpJzti5xPBOaYrkIHMsHvk7zab9dnF
 V4L3d9C9ked9wOZ9Ws1uLcArkJhFmF3n/aylTWhICotkpAYjLwWWDkiz9xAi6p4klDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493246;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0VXkEH1a9xtpStRH0tPg4AXI/YAsrIV3sNWX7z21K0w=;
 b=kGjLqfnvWyW0hV+73DOfMh+Zbdz7hW8QCd9EolQgw5P2g2Dd9MZP4cnEfKPtw/JmC/jv
 COVCTsxlsLKtDQ0j+ZGn0Fz4AFCO4rGmP87j8/zikEWiojjS31DdLmXFNY8KdRJ9+cYCv
 ftYwqWauYr0fTFHByAoZYcQ8OXsmqt1VhOM8aEBdJ74bCGBz1uFIjw5AZ2exFTfy2dyh6
 kzwaK1oUVCeA5obl7Dkn8M4racORitvgSiACuZHeywdKOkPGX8VDbdRzod4YRHxFmfOXg
 46pVLHq84ui8b5q6J4bAHtF1GLEplk+xDKq1baWs7pn5dDt4WZ2dUuRNNMnOEz+qy/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B78A6074D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:27:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14FD995DA5; Tue, 15 Sep 2026 17:26:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:25:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b716763e9618c287d325bd3b42afb61a1a50769
X-Git-Newrev: b56072c12692172edbae9ca62c395c6e94d21c0f
X-Patchwork-Hint: ignore
Message-Id: <20260915172620.14FD995DA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b56072c12692172edbae9ca62c395c6e94d21c0f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
which was not propagated to strongswan's botan option. This commit
fixes this issue.

Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs gcc >= 11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 10efcc1616..6847ca4f62 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 10"
+comment "botan backend needs a toolchain w/ C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
