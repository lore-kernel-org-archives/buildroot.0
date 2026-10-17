Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13504CCF2C7
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 883224092B;
	Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FA2qDK3btx94; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CEE994095C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792242775;
	b=BBqODeaGzExRAy2Fxk2DQCVeOcG8Lw7Pk795pueZGuluQ6ArpoFxvG4nO5N9SOTenzht
	 KqWzquCjT61t00p+7TeEgrnPMVONL3WK6/tMth4GekTMjEZ3ydgdVrVuOnwJOywsqyfKB
	 dfD/t5hcHhh1bnoNHh0uDaksHyw4c4gxkCtPJzddVbwALCxrLfBGDX76DAGyojFhv8UKU
	 NBwxbnPch2yTklpJamCl+ttvgBk3JusOTxzZkZmdpS3DKSOUipXkXHmAIjKOBOYOZWJUL
	 bqKjf/TL+3sKxHNkwVuNFHJ/v5ioAnHf8G15Gg4Ti338igG3HhNxv/xr1FBn1+NpM3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792242775;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XjHWBb9gid3mmuAGGA2IxpSfOI+o8GLr8xFb/mmNy+w=;
	b=TCWiFYrlt/2FiCP9b3UYSFMy4yJ7CmKrteJcQnTbicqsmVuFTrrLQE6ADchL/Nttshld
	 HFO8VRPfOVfBR67e3LSLFPHpjicbR6vVeL2emgM1xE1fni6Y74lrSF5lU0jk8sH6IzFJI
	 gxw89nSs7l7qXCxvLeZwLruYyMMXhc7C75y8O752aFr5aXXbPV/V0Eaz6y5IEqp1wAPmP
	 4N423Fuia5RtIqw21VEYDfvzX/5R6DN7eSZEe8hyzLKfn1w4N0DXcr+TXQkc1KVJnbaxU
	 u8DttYzoR+UOIUB8LwyjUklXvahdkTJx+LkBvWYac222KigRFIC6BQAi+lgaV9G1LWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792242775;
	bh=XjHWBb9gid3mmuAGGA2IxpSfOI+o8GLr8xFb/mmNy+w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EqjVJGaaRJKZ6f/h1BvOkAEfQdLdSmsPeLJP5H45HFVJ/yjUg6oYmeDo/M8k5pB4I
	 dXDaDW/d5bC+Y9QeZQ6sfedDEBxFLNt9hAoDAgUlQIVO2oDOtTiyfgGid79WU5Od67
	 sT4aKCFbqknnKxpMYomwjXhJzSBYNeBdmD5X17k5EnuAukQ7/y6ikewgBf0OS1C4N2
	 wt6538nZ7NYDdvBSuxBeihLk9RjovqNAEdo2LNnLK9O5frIovFbjhcY4ko0YLfJFln
	 cNgfd+neiPnh0+KCj+SKR18G35rq2muxVm3xEKHTiQfxpoThGwRCa3JWHL20SaN9tf
	 niu5L06/gJ2WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE994095C;
	Sat, 17 Oct 2026 13:12:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB8611DE
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1B2681090
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFJJQzUA1tNw for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 13:12:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7760380D18
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792242773;
 b=a4u3iQr88rT166WLgqPa489H8ZI5+eZaotRLjfzinV8K4CKhHBV6YdT6LtN5EZwQJKba
 nxaOjFaz1W3srkuEk8SU5FghBcoCVnq7QLQ8uA4vl9SUfggzlEQ7o315LkOUci470pBue
 KzKn1ZeRLbZOktsq0v/uifDf18tdSVajACde24l25EU0UzXcRNZXwJLGPnPWSFn17yxTe
 RaWs5f/QWpOLWGs1u4H+6HJg3/onTo98qNaZKZZtuN1v/6Guzff6IP+y4kt2kwRgDR0XA
 1hO14SMxWLiZoQLaJApbZwD6UMmYCNeDxurG5P8s+9IrjMBj7Cyt+wq2C4ON9HAk9YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792242773;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=nX2jafEGPGU6rX1C7abn204FjWNqaiFYrY1P9s+ZrPQ=;
 b=lDhyBM3VUncjR8Ya1o27mqNwG/HYOvskaUkZJJzHt132s+obwY/pP0lRACS5WH4n52VN
 1jAyfAKXP2i2cc4vyg0LykgiCqq0jHenjmk1ljXlQo4zuVaL8kvcGIp+E7NlKlml6kPVY
 MnpqWDLy1ATpgS1ukRRDRrYhlCQRss4LroHz0qgcKJvXMcfZEY2eV5GG9vRKH+ZyPBqoV
 x2PrxhQKAY5IxRnx/8Zlw2V6QrvVlPJl+hRgrpjbBc2gkhzPwnlANZfAwhAUmDdK2RCOT
 jbKYQxQzW4MRZkHZ0IgqZ9EnYMC2vqUFzrFiE9vJD2PS5zjPAU2SVcK+l8GpsfqES1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=Sr0sasAO; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Sr0sasAO
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7760380D18
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Sr0sasAOJzBdr1zeU3B0K7PscZGudbSKYUtwwG9/e1LwMUhLHVwU8tF1alcYVBW39Plio6X6ue0vmBhhxpYSy0SR6c0BnKMRJgyRENtqO58Rd/m/w/N3RGpPx2lQzYaNiQijd+yeYB2cfYi3dWPhYj0yK5QWEv6Yts2KLvlZ7DCaVh5RktFOgzelBqwMQ9vuZMZQkvGihMjPayObp0o+03Z9obV6kzXtfTaR7BnN1N3iZTbOoquhPsn/F5TbEGvR4ysZuqPvj7R03oQXRAlTMj9FtarV3e4+s9xO4ZbEgpXvijHecAP/MredBjnCABMMexkYDmhomXOk72WVc2KIFg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=nX2jafEGPGU6rX1C7abn204FjWNqaiFYrY1P9s+ZrPQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1992286096; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 17 Oct 2026 13:12:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xI4DQ-00000006azy-2JAE;
 Sat, 17 Oct 2026 15:12:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 15:12:39 +0200
Message-ID: <20261017131247.1572149-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/4] configs/lafrite_defconfig: switch to
 Bootlin glibc toolchain
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

As recommended since:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/lafrite_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
index 5f70706fa0..2454d2b7ff 100644
--- a/configs/lafrite_defconfig
+++ b/configs/lafrite_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
