Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF3C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 213DB4054F;
	Sun, 13 Sep 2026 16:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZ17ABZWKEFY; Sun, 13 Sep 2026 16:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0123040541
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789316564;
	b=jYSDhWuqNxA65pdYnhg6SWZ6pMecT8PpxGzi/JRtPfzqrOLvou/qV9+XHGad8So6sQ5c
	 udbunNN/+wT8ZfqF2lsvtIaphD1v1pA6rOioeHNkc7TuywuFoj+oKCmRquN2N7vc+NQQn
	 zR+axoKAfiawLGm7R5e0Mx/8SSlWWcpycccq8cw82Jwk/Lex3wuFksyokB+UwhYl5LnWZ
	 9zFWG09T8Wit9ArCulia+Fr4oMM5WShfybEw8p6dl4DBSXsKMdbkK3XwOs+5FZ/xMULt4
	 o/ESnXeX9jy/zi1EHxIzWBBM+lLErxpyOEPQ9qLEFgIGphVZAVtqXucX+YfCwb5xZlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789316564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=2VZdrpLDBF426MwFAM92IzHEYrbXalnpfISOM6IdN/E=;
	b=igDa6x6X9e/QFJhhAGN1yUQyo3LHYxO0UQfHljjbZu8XC7JrRuhLr/3Gw6yPYtAJ4ppz
	 YsRPbntIjStIQbrLa5Ui3+G6tvktQ5cmF5O5mYprj/y1SH11H1JhmCL4MpFCogqz0Qtr7
	 7JGrlu11zTOzFJ6AVlUO6JSmHp3ks9hctWD+0Zf5s0NzgHIh54jeJgZA1A86poWzLNgUU
	 Mq75vJOvsNCVIthinXA/zDlAYQhs9Xk3K5MyClZ7NEXISwv3utT0TjfcNk+xLIY/xYjwB
	 Qev0sl05Dvn/q/45dkdr3CQh9yVpjlNk6Xq+dAn/telVhX0HYJ/gzwHuPPGEbzbVTFQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789316564;
	bh=2VZdrpLDBF426MwFAM92IzHEYrbXalnpfISOM6IdN/E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nKeaeCwamSU8HMS8MGZNqdTBa08beT+uqEATaMKtp5o5mzvE8LF6LweZnpGDtwhdx
	 PeEqRgy56AM8nMYTBtfKBCzTYhOwpBSVWW7oeuOe8kq0FkyqGqOnjlhTBAqKL/V3qZ
	 3NBRpv/FDNI7POPCq1/wPACFACnNnArkg+71RGT0LwAe41s141z7NCYRnkAkfNgOdF
	 zWtB+fS7BAdrkzK12ffwwdOQhp/x+MhL/Zt6loXdSjasYERAUWT7/fNa9uy3D5+MNo
	 TFTaAT5hKczf0kWtOKKJeHazGqw5CxY6gGmoGmoK7xRxjXIMZcWbG0C7RnY4Dja0gQ
	 r375zk1s7qVww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0123040541;
	Sun, 13 Sep 2026 16:22:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A83E0259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9983980C79
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:22:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPoQTNG_BvM7 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:22:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 51B7180C71
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789316561;
 b=bD8OtNtASvX19tdYqmF1Ps32MdDDHm8jovwKyCCDANPb0StMA6dT69wh/Tf7LEg5+05u
 gKG9IDbJx6lVjTUlqYs0nZe0tIdvzKagZr4eU0Rf8CaWdjHThEsbiiDZkwLnuxav0bt1M
 xxas2HvCPFWTsDAYegsyXi1pswwbaW1K6DwtIPmHC5IJSRtKYGl0pGujHgn1CMX58aRUu
 Xc71ih90XNbEYzwwHRf8hIJrxQsgcan5AvEaw8L3n3DZayf2N+Bov9bqnAhhcoaVeu5ww
 ke3zjJyxHS+RlWXMcop/HteAYuzBN4dsgANRhKUlRyPJvE7b3/ztfwDD8zxSTJ8UTLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789316561;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=kkatG13/+mnFtuJ5JiUlPiIII7pjOFY2VKaS04S9jHg=;
 b=dquCGk3mvgdxjFJsWSRmcj2iVy0D5F+EhlaCbwokG3J3Y+HjYuotRjjUPiMzuZmX3CZ9
 RqPzH4AFlzmrq4++ODw8ZE+faIt10a5LGpHUNLjG38uFuhZbmjCmvyYgyYT6jqHcn+4Zr
 Hiy8nQ9g4amK63iWZ7Ac8PrpAV9PrDaDAQixq1M70qadL+FRoGjqw8swETshOtt/msLFe
 I3ImIE0sVZmAH405opO3Uh2kOfHHYkg9I4IkFkjO8O7Bk4QBRGeGmfRIE7R0mFP3SuqTC
 v6LQGZndTR4ifzWImsEXdJTj77eoGJdqBfVGrdw60oByyxaT+oxRmahr+2fQ4zxRDVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gC4OgP84; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51B7180C71
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:22:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 95B181A051C
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:22:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6222160435;
 Sun, 13 Sep 2026 16:22:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 693F511C78D5A; 
 Sun, 13 Sep 2026 18:22:37 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sun, 13 Sep 2026 18:22:35 +0200
Message-ID: <20260913162236.1673931-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/ivi-homescreen: add missing BR2_USE_MMU
 dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
  has a depends on BR2_USE_MMU, but does not propagate it

- BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
  libsecret, which has a depends on BR2_USE_MMU, but does not propagate
  it

In practice there is no problem since ivi-homescreen depends on glibc,
and glibc doesn't support any noMMU architecture. But just by walking
the chain of option dependencies, this is not something that is
theoretically guaranteed (making automated verification of
dependencies difficult).

The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
ambiguity.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ivi-homescreen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index a4f5f6835f..d7cc4ce04e 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -187,6 +187,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_TEXT_INPUT_PLUGIN
 comment "plugins with external dependencies"
 config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 	bool "Audio Players"
+	depends on BR2_USE_MMU # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
@@ -201,6 +202,7 @@ config BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS
 
 config BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN
 	bool "Flutter Secure Storage"
+	depends on BR2_USE_MMU # libsecret
 	select BR2_PACKAGE_LIBSECRET
 	help
 	  Store data in secure storage
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
