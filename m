Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFC8C88E56
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4244B406AE;
	Sat, 12 Sep 2026 21:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRZ1j4r9rJ4u; Sat, 12 Sep 2026 21:02:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4C8234068E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789246923;
	b=XMdxbaMvmlFGV0w1WWjd8YblCCLaXuTtwS16GfIBAD20J+s6/6W4CvHcrv1uUAVEw7KH
	 YFTLdL47PvyP76c3gRzwRpgWxXOQr2VaDRR7Qd7t9iYh33YWgTEzNsh7Mg7/wv5NQMXrH
	 QYiV8i79IQXF6IHTVWCbXFabntMKhH355Qr7cZAE3FlG6EsKOTKY1sCE1wbnZVy3GJ8Up
	 99BOgJAIvLJSy8YFNcm96zSYS1xuzePAXW6QdMBb/sqiaw7HE5M32QfeHJ63DQ1pn1uif
	 BmaTrlM8fm91+44wCGqfpv7yQURlxr5NceUOqx1CwnIu2F11gbwUO7W6lrs1XEYJ0uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789246923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=WD6oA5sDE08m/cXW7MR9mjysm5wUP/F2YiUpwBea6ZA=;
	b=rldypcr4u8l5EUGwNFOKjBDVcOTpri2Pe5Zjje98iQ6FW/wC4RsNjQZUEfqQqttm96As
	 8yd2yDgybdcR2xIZhsTH+1EybOIOhtCEp7ahJ3R0kwdF4C3hx6RnmdoYBugFr1YAr+MXs
	 klnhvEQKIQ7yN8ogw+FjAnvhOTU7fWEyjY0XHfhgdFcVRFB3a9p1TekSlRCfGo8ZygI4f
	 w2qZdpPUpJWEpFnIUEJ+6lkA/en4YUzZ+zXdZLI3Va4C8QJoJcFEkkJgRhfqsnWkAlGlF
	 JcYTZFuRNMcSQrI2YfgJtc02MdDIWkMUXEq3qJyJS8ov4FLzXtAo12IwwXf3prI8j7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789246923;
	bh=WD6oA5sDE08m/cXW7MR9mjysm5wUP/F2YiUpwBea6ZA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=deFGiJu13K+QysX9hJD+VTWmGHVkbQzIc2DRuBDX39SeCbPfzlwgVDDGweeaAvbWA
	 f4s6nsMNNBNgybqJ0eNtBZKI1rCEcPvs4EFy8vKApngzZoJklD/2EFNem/UVV0ZKtj
	 gGvLWQc/Vb5+/8szIrTyjB2LlxPL4GDGVxgYv98GkYq8Smi4gBrBG1rHuT0IcqzN4E
	 KtmaTiSkTWEoUwb5OQNeIsRJUMs/hMUUjK09EYlEm6Y1n0ihfaO06dSm6KyAy0hJnN
	 KuarBpPAJriXxqwagJ9Wz82GfTn5Xy/9+r2YXedNK2s+DLKruPejV5Bk0+yzoz0By7
	 bQQiX5lq2lyDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8234068E;
	Sat, 12 Sep 2026 21:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52C4C2D0
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38EE380E57
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6qW3TEEgMKH for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:02:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53B2780E52
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789246920;
 b=hVodDhbcU70bUzFj0IEpUfWKk7U1AFl+mLYjhgYXIPYPCYzgnbJ3VNVX69+fMZqaNChh
 UXPAPHDEDVqefr4oxFBAb5Lt7iIkl13FYt3tgBcwl1AcfMSv08kFOLzblnyCn44n4a8zc
 tTptrrlbJsYm2/hEWtg8mr47Ouqp0rReONnBU8L74ZGfaf+vfaNNUKzTtLU6IXrBi5qAy
 B0Jd9VsrJ89TOrBefLWPJRm5wKFidcILLvvLXtDsn246NlvZ0g3aakX91UhCxKFulPsWG
 AZ8IR+EcqlGwJNxd0EZ3XGxMO2ZFwmKHKYHUdG0psUhRaH0PMMLrCbw+f0iixEY6ySQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789246920;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=HJx+x1sH2D9JSgW2Q/EHaktFOLmfwV3fU8YaR6Aq6cg=;
 b=ILu0W9Jks6g58JaKzr5CrHbVHj79RtRNe5+CK8QQPsSVZsTIPuAZrSHdoRMAH+Rjk8hC
 oQtyM0aNf8lQNuNT7pKg1OFr8ebyr3uHIHEnO08O76fAMpiAz3eKFBG/f0HSXE+lzx4Ao
 s7+luXpSqAmpNIHRyvdv9uOMF2EqY4+j3QPQD6IBaQPcfDrofPD9c149nujC9qPO+iInw
 XV5gNflecglA5p4gqcgupqEJVZlOh4F8vCIn6fU7BABOssPWqdq1YcgWRGGnPJGH24n5V
 /9fPdG0OvIRH8jjGxCku6x8aLcUHc7xzkd17N84U7Cu9RYTsUXCaMQjpGAZxEiTGSZw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=FjkVuOfu; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53B2780E52
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:01:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 690204E402E0;
 Sat, 12 Sep 2026 21:01:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E04860580;
 Sat, 12 Sep 2026 21:01:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E845711C7AFA9; 
 Sat, 12 Sep 2026 23:01:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Date: Sat, 12 Sep 2026 23:01:47 +0200
Message-ID: <20260912210147.1550484-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/udisks: add missing BR2_USE_MMU
 dependency
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

Commit 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump
to version 2.92") mistakenly removed the BR2_USE_MMU dependency of
udisks when dropping "select BR2_PACKAGE_LVM2". Indeed, BR2_USE_MMU is
a dependency of many other packages selected by udisks.

Interestingly, the Config.in comments in the same file still had the
"depends on BR2_USE_MMU" dependencies.

Fixes: 66ddec89e8867435e696dcd4e50473f62f3bc8d4 ("package/udisks: bump to version 2.92")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/udisks/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 23eec1d79e..8e772cccd6 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
 	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
+	depends on BR2_USE_MMU # dbus, dbus-glib, libblockdev, polkit, util-linux libmount
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
