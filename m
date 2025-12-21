Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E22E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 11:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3681A407B4;
	Sun, 21 Dec 2025 11:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFRe01C0BBh6; Sun, 21 Dec 2025 11:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D60407CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318245;
	bh=6HGhIfgi+0bE7lgOtyV4eVfZwunQ0ur5vaFo2eyQoEU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Z17Q+biIhxcnO7x6HfDzHoX9/ahPYo7A+KQePH1Ou+tg5DRr3HAc107pq46SxfGiX
	 EJzhpHUe4AAQ5zyjB/jnQuRAbOcskWbWX+ErrP7GrSEN/m28yH1kkzUacSxGPnCVLM
	 S1f9QmXPPZax5LsDDBcXBfiunEQco1svJV1OtVOvfsh9cc4Lsb/lXx3hI3NpgJTX42
	 dWNS4fdbrUbK/W2WpuOkKn+72c0M/pxIxGa+o1JASapTJKZW1JvYBzUCf9LEksWmWW
	 FTbchAsDyO/FpIET7r4TsLAdxkgLDnLIaMpweYzbRg9sxIGxTGLO3ThKmcrch0eMzr
	 2kvvlxef+Z3uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D60407CA;
	Sun, 21 Dec 2025 11:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B34A3195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D1A407CA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i76XzjIpYqyc for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 11:57:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B3A87407B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A87407B4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3A87407B4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:412e:ace1:8cb:5573:7181:a54f])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AFB5E5FFB1;
 Sun, 21 Dec 2025 12:57:17 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 21 Dec 2025 12:57:06 +0100
Message-ID: <20251221115708.256386-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766318240;
 bh=LSkYZpM0E3fOLXl8rXDjcXZmqGdco4Kx6OnXPSRqFLs=;
 h=From:To:Cc:Subject:Date:From;
 b=UMY0Tsin1iB1Erg+4WF4xjlyiNNQ0+7P4kzl+Qvn/9GT+Yg/GPZxFJHAQhaMGAn+P
 3HpvCcNZXiYUp53770TopX6Z31pZHvHWzXB5hB0kHRqSq2dsRmJx8ooXqqS6NtjLpp
 CKNmXd4iR+NObnWADIZ9g1nS/wSuJGnMZ7WgAntBpQaGKncKjaXQikDih6POuH1kCC
 aUj3TGqQlhafeP/WPCqf3/HCOp802jkj9FKuEN1yApiUUUroc27uyLhqgMeaU0aOlJ
 x9ANUUcT6FTohviVULvmPZBM+TzhszIbdUV/1bnyKo1avK8UdIoSxLdtIMcKNlHreq
 p6cbAbZvBLcEg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UMY0Tsin
Subject: [Buildroot] [PATCH 1/3] package/tio: Config.in: add missing
 selection of libglib2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit [1] (package/tio: bump to 3.5) added the libglib2 in
the .mk file without selecting it in Config.in.

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d85e9df431af790930e03d860bfa098108888a0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index 953b26a349..ef9a129e73 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TIO
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
