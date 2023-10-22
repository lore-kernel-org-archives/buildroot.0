Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C56CCDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 21:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18CCD60B57;
	Sun, 22 Oct 2023 21:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18CCD60B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2JYDmCRhPLj; Sun, 22 Oct 2023 21:24:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E15D60B50;
	Sun, 22 Oct 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E15D60B50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA81E1BF276
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0385417E4
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 21:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0385417E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QaFbDL5xjY5T for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 21:24:00 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFB88417E3
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 21:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB88417E3
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso54871f8f.2
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 14:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698009837; x=1698614637;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DjHoXWdUFTCQJ+UrTJ2pkt7ZtIJFhYDO8xW0HTWs9j4=;
 b=EPRWCVU9HXFaR8js2V2UFEbFyhrN++TQ2UVmjMZZMXVz8swXqmWClrkwd1RT+R+TfG
 3GvVpv3+tgFu64JmO1XuM9LGko+O6lcPkyyMaFykbjXz2Aob4BQUIhNvlH4ubNYyMMB0
 8HLmBqVPc3qTJ/d7n3EXj7RLKwzRi5ulzQif3t+Sx0iDDnBN7lHekFM005mVe+UsluZe
 b1A6mPyYgACvVT8kcmBPy27eakTObG8oN6sKFSyiHEt0PgMzbOBeego/qkFtLb8Fs09l
 DxN2EDvaczvAek3NayhRF7MftHHfCIkdn2XBxtFv9yHfAweA/TMgv1Y3ThZIo8Rn39EO
 G7bg==
X-Gm-Message-State: AOJu0YwgQBDD0e56abUKEGlgvM9xZtX2eB/HwfLwR4UiGSL4HjG8iBE8
 ixeDQtoIltYAKqC8mr2CMGYA0k5j6d0=
X-Google-Smtp-Source: AGHT+IH8tlEnht5Nni6xOiGJ4x9xNAsXR64vsOLgN6v8MVXPo2qZG36vve1r1VJnran6IwA540IQUA==
X-Received: by 2002:a5d:4686:0:b0:32d:b991:1a71 with SMTP id
 u6-20020a5d4686000000b0032db9911a71mr4703632wrq.0.1698009837405; 
 Sun, 22 Oct 2023 14:23:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k12-20020adff5cc000000b00326f5d0ce0asm6348591wrp.21.2023.10.22.14.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 14:23:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 23:23:55 +0200
Message-ID: <20231022212355.92599-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698009837; x=1698614637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DjHoXWdUFTCQJ+UrTJ2pkt7ZtIJFhYDO8xW0HTWs9j4=;
 b=gBcgxMRWTw30tET5HDyKZxH0zE7Q87xyj6In8wFu9JGd/v9WLxNTNFZdjsTcIOr1H+
 Hi1/pBA67axpqDvuvHWcd3aDVxTtIG1bSgKLGmLvLAuOb1AOO4+hjtvW87z0BPjdGVDS
 TQ59rjJ4X6eBIWfST+zjddjwRKUNmjF82DXCp+UOIhUCNsEni8KmuzzgxwovdkD93M+B
 D808MtRqVZeNEQ1x6n3S4IEFgKtUyw8N759F9FTPH6bIfP+X7TNfKqMMumIk78hhC97f
 kzo7iRCB6wh1KuyOebSHPLhO8KM/LzQc5I0fQbK3zXoEtrNdNUj2HE7GMF5Lf09xK2yM
 aSAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gBcgxMRW
Subject: [Buildroot] [PATCH 1/1] package/libtommath: add
 LIBTOMMATH_CPE_ID_VENDOR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:libtom:libtommath is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/F0D99614-AA27-4713-ADD2-103647C8838B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtommath/libtommath.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
index 25d4e836bb..7b5305faf6 100644
--- a/package/libtommath/libtommath.mk
+++ b/package/libtommath/libtommath.mk
@@ -9,6 +9,7 @@ LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBT
 LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
 LIBTOMMATH_LICENSE = Unlicense
 LIBTOMMATH_LICENSE_FILES = LICENSE
+LIBTOMMATH_CPE_ID_VENDOR = libtom
 LIBTOMMATH_INSTALL_STAGING = YES
 LIBTOMMATH_INSTALL_TARGET = NO  # only static library
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
