Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D988C021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D482144C65;
	Wed, 19 Feb 2025 08:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2VYzkf7F8WI; Wed, 19 Feb 2025 08:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4B1940CB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4B1940CB4;
	Wed, 19 Feb 2025 08:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1765968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB5D606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCbFzF5OY111 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D17DD60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17DD60071
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D17DD60071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso39967395e9.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955051; x=1740559851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e9GofFeXMH/ibPtARTU/OmI4aE0wdI/1Dgm+9HXpf0M=;
 b=RYFuGrTEvSmqmONR1YKXt6y3vFZDDC/6y7UiJtqfKxpv0At6MkakYrDEpjzj2uH3ii
 yr2Lg4/UszP2/WY0HP6ujA3tTfAW/7fpVFqQfm5NVigICFiFKgfFq73zZpGfWnoqqNaJ
 V3Z5bUT+ec2dMnEdxMvX7ciXn17+R2uFkZTg8iWBVEcy9qD8HrDOZJOi6EiCIUnYsrnq
 ATJyVElLtMA64cjG44lZwzrTVuODpAwpOKyB7wSs+JfwU+1FT8NOZL5+cvA4eDRC7SQ5
 tMswLv87+ozMGRgZ3H300zrbKlUQawzqa9omnnMxot+y96Sd2eZgQjJPYClpim6WJ2Dm
 o5lg==
X-Gm-Message-State: AOJu0Yzugd3tBLzeYS4E9MO77Ylt4ZCBJEOswYCgF4njlPyNRIBrV/uG
 YsFAHsPal+/4EoPXvAIsIn6KDVXcu7D3NUflFLR4NKmXoFF0QOMy//ZinA==
X-Gm-Gg: ASbGncu6tXHND8Uv1YjvLd5ShoAy1xX/kBs0f46/HwB/kYZwtEmBnLVP8+XKT/TUGSP
 JZLYhXsp+d4Q/ta6LLgxE5FvIXGTTOHOfnp8yja50oPX5hU9k9bi0olCSZkUBV4GepIcxHXUStP
 4d4I/5R1LRZ0GqbDJK4k5u548MrNNiWqfrP5qsFuFzOefYtnQAQqlVULBjhNxvs5ZDc3foZqCZi
 5KZ48oUf5FRUxVbs4cBF2mp+0z3z0BgTTIrhjAps76JxcXNnpemgoglKleBi0IvhB05IFwU0VOe
 c+FSPD367tzpFwPdII3wMZFUEA==
X-Google-Smtp-Source: AGHT+IG+SA8ob8QRLdPrNtvkw6vSfKJQbp05amW101INXIADSqEci0NHFbjj4sFlgqQxFnnWzshn0g==
X-Received: by 2002:a05:6000:1faf:b0:38f:3392:9fd8 with SMTP id
 ffacd0b85a97d-38f5878dea4mr2194880f8f.18.1739955050895; 
 Wed, 19 Feb 2025 00:50:50 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:50 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Kamel Bouhara <kamel.bouhara@gmail.com>
Date: Wed, 19 Feb 2025 09:50:27 +0100
Message-ID: <b90163370434a374a82d41101f73f50e7c180503.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955051; x=1740559851; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e9GofFeXMH/ibPtARTU/OmI4aE0wdI/1Dgm+9HXpf0M=;
 b=N/mwi+gnynf/W6kMBp1acBEe79D9wSluy1p7kh/5REhrH/WuISLEAFn8erYEpIjy75
 2JyH50oIdRkhT3/RsTxcs0AEGADPLFBXrcSBX1kYpIHmzPAafS2C4JY8KSOl3fHYSu6m
 BiiUzJijUQRQ+Vp4k5EbBhxaY/cZB0dLy4mjTiRSA2YcUTDHXJt7rI3cky/Zb0xWMxDh
 VD4PqcChA29M2OHXWkb5IATcgdIllGWs2LwRKCCO2ZObvsQUBGDJCP/A9UN7ZNypo2I0
 T8rViWw448P9PTZ1QzYQ8Wl/VGtXrYAjbGXVMTiE08MFt3l7OgsF1kYheTXy3HeHuFer
 mzdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N/mwi+gn
Subject: [Buildroot] [PATCH 12/27] package/libodb-boost: afirm host-boost
 dependency for host variant
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

... and propagate to host-odb.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
---
 package/libodb-boost/Config.in.host | 3 +++
 package/odb/Config.in.host          | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 package/libodb-boost/Config.in.host

diff --git a/package/libodb-boost/Config.in.host b/package/libodb-boost/Config.in.host
new file mode 100644
index 0000000000..fdf2b1c25f
--- /dev/null
+++ b/package/libodb-boost/Config.in.host
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_HOST_LIBODB_BOOST
+	bool
+	select BR2_PACKAGE_HOST_BOOST
diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
index e80a141be6..4fb91df6e2 100644
--- a/package/odb/Config.in.host
+++ b/package/odb/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_ODB
 	bool "host-odb"
 	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
+	select BR2_PACKAGE_HOST_LIBODB_BOOST
 	help
 	  This is a compiler that takes a specially crafted c++ header
 	  file and auto-generates a schema that works with libodb and
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
