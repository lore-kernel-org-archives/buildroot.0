Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B57ECA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 15:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA0B40DB5;
	Fri,  2 Oct 2026 15:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXvPNzeFKkQa; Fri,  2 Oct 2026 15:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9D83740D99
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790953978;
	b=R0mxjUR91pnTZR9AsaJBfpfgUVy2PZAu0iaCijOQBOIkicwi10ETOg9/8YxKozevoFv4
	 eWk088m3EIO18ucpHo5h+9qgK9Wxq76pNQyHDEa0vY5k+dXmwoU/4SIjsZjD4/Pte5Ub8
	 L6uVgtvPjBgiWFBs6x0dInOq5gBVDUlK3r9XgartVmj3ZfLRlbJyNLarRN0DOs5Kg+Mw3
	 peIc+e7ofxkpK8wFFJ8ucxX2ppTKtfGJnAn7CewAJ9Vbqc/Hn/7PuuFPoEbWFIQfFcVNv
	 tqeywQd51/7woxzYNd4QWAajvJTq5Y6afIhm8nYOet0o/8DaSDFxTd3hHqZ5VsMHqOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790953978;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7QCHmiHjL9ElQPWfWN0KmZB6C5EiElynHsVWSggxF04=;
	b=VvrKZTrp5hVXxqJWOUhenj4P/uc+Px3eOZIkjMJvAGjv0uB40Jybm5oh4LRvVKChwRiW
	 C1jx0JWjViFIMLRghcX28WUfFIHga91pEjev6nMIURVByvlLG9ccp7rt0iwk8r5T3dnFt
	 Gxnncuk65RSxlXRgzy5eCNZYAov12beb3CyTx5WbLIZrxTGu5giK8OaMaYz5byIgoEAtY
	 PtkCwNKMPj/Ss6H5kvX7riQlFtuY6hCTIBeXgOm/hLYKNzvRuFIKmSPdl3bQCgGjKM6Gi
	 UHF11Cv4KI8a6N4IRusOWAvNwDoMllcqQ02POus8hIUZmK35qB3LFrX2uUHEkD+kSWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790953978;
	bh=7QCHmiHjL9ElQPWfWN0KmZB6C5EiElynHsVWSggxF04=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SAO0Lj8hEUWR2fUmTozZMTcl0cqJ3qYLvpbJ90XgYLMgyvCeF7RVGn+bBPBPznVoR
	 wPncIjc8lYjAsZfUYk0+2gpznlDdVfmbxuCdF5O0+SxXqJABRkSaXTX5eI77Rs4FV3
	 G0OjgOVuujZlENWQSUVdFoKms1SmqOXitIuvsPEB+mcWTATiysigaBtd/2LVkoj3rW
	 U5u5YSwdKSNYwWCtO5IwElYKfYuk5SkUKJfh2Hz+YVBcKomL99XT4czU6v5DjXgTnn
	 etLTzJn+FpX6YkVns7tZn+0oEXo9G5f2M9ZSPF5c++95P9P6QtmVq7d31RBo3oogod
	 LTmJuYL8scGXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D83740D99;
	Fri,  2 Oct 2026 15:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E72374C2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D86DE40A27
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Thlj0xxxP55R for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 15:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BB10D40D77
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790953975;
 b=ahVdi5Ke/zYUkVmAIJC2Nmfyzptl5XPM0LQ9MNgRdvLDksXISOnJCqsX04vRy+tA20BL
 2WiMW7noMVakMwkOZbJPuG/eo+g721vjmIZHszX/u3aZxgjHG7/SGa4ZcrEV1dwkcPda5
 KWo5BIriQ6RtVM9TyRYgzLoP6EYA0vNYBbWoefrq1awovYTkIMlStQf70LNxZD9vBMi41
 q2rXBIDD7dlgGJy6jHojgnio6SqOsyfQ5ycL/4ZF1fwv/EE81TpCfpB+9TLxJBT66pT4v
 ZDfowpAFy9smNjbrLGop0bWwn4OKmE60lCfwQ8j7YEhuyjf4VJiJOs2pyumoxpOIK8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790953975;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=trHuTJsYDbRtMWH20oPnasyjxnK+JAg/+MSwsDcmheA=;
 b=g8wh2cbC9BXYAs7NbjVUG/oTesdQ4NvEkGvuxkRal02Q3qw8GLzjnQewtIUmxm0Hg+yx
 /teJZ+Rl+Lb4nO/ITvTfscwe4p9lYct4BSphyteG0pbuxu/mtV+R6M74BF+YFZPzDzspR
 xt54rbOBHVGy2CmHV6TV1bBfWtfgdq76Rm5Yer+TPYYlE2RLM9pyFxioU077qYMiKPNRA
 ePuL0Rksi5vtVXQGDmyBhs7CoGrlbS48WQBmfMrav3SSrzeRnA9yV+hAhA1fyz+QMWY37
 d2kYDRNFr7C0AfpamMLolFwk3c8guvYKOVUn7hKhsKi8HYVwzuJochGakHgwnkvf+lA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=VJeUZYTP; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB10D40D77
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 15:12:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1waq513xiD-00fJER; Fri, 02
 Oct 2026 17:12:47 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri,  2 Oct 2026 17:12:26 +0200
Message-ID: <20261002151226.867507-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002151226.867507-1-fiona.klute@gmx.de>
References: <20261002151226.867507-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GCa8knHzm7LwrRrbPg4u2xrB5KvL8sXCP3aAV04GFjSLN/ploHb
 58CjhOaOWTB3fqYB+dfo2X5vED/1otYVdJNsVe7+4v7cDkcQnB9O7DzoqUGJ/qHNdbIAi3a
 rorX9QzFKX42W5Ra61yKoqB+As90j2MkPZbShvcN2Z29HAsjgbQfmAa/ya8/h4GvZZOzqBb
 HqGakwEylm7L/E9sobgzg==
UI-OutboundReport: notjunk:1;M01:P0:UoLpW+EEf5M=;jv1+vCP37QEnL8rYgC7tZcECAD6
 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
 ZiDe
Subject: [Buildroot] [PATCH 3/3] package/lvm2: depend on libudev if enabled
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

If a sufficiently new libudev (>= 176, so actually pretty old) is
found, the udev rules installed by lvm2 request the built-in blkid
implementation of udev, instead of calling "blkid -o udev", which
Busybox's blkid does not provide. A practical result of this is that
systemd never considers device-mapper block devices as ready (seen
with dm-crypt and dm-verity) when Busybox blkid is used. So depend on
libudev if it is part of the build.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/lvm2/lvm2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 21fd5134c1..2656d81716 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -39,6 +39,9 @@ LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LVM2_CONF_OPTS += --enable-udev_rules
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LVM2_DEPENDENCIES += libudev
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
