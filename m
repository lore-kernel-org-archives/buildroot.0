Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2442CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64CBD41694;
	Wed,  3 Apr 2024 08:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCrkehCXoWrC; Wed,  3 Apr 2024 08:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C482416A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C482416A1;
	Wed,  3 Apr 2024 08:40:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27C001BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C061282023
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7sayCIctkUg for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FE1282027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE1282027
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FE1282027
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4715991c32so783135966b.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133639; x=1712738439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3I2tV4iomtdZOLaINkRBx5xFocVe49aBeT/JsRVios=;
 b=VDxm8qPRuxa60g+Ho5ZpFL/3vgc8/ihbnforBVyxLwA4IK/2ZmVJwIEyAnSt9Lr8yf
 8FDg6E9ZRV1nWpXqsE9OQoyFLk+AqeuLCluWctw3iqnIeVEmQHVr5sWQjQ/Lq/fs1c2a
 R9Vm3joQCA59vj2NlXwDDFB6cyRlDeJSp094Z4QoOABh5EWF5z/OWJY13eB0itcvYiUm
 495sL5+G6o+ODPX+QW1SY+/rHKuKOpYxwIJ4aSVw0hJBmDCiyCkdMjI40slj2RoJyME8
 Cd68/JAKnaISfX4Q/c8Mogns2Oay1HFaYjaX9VS9V5XtfiREnU9Ia4mJ2Irfn4YLzyLQ
 9xMw==
X-Gm-Message-State: AOJu0YyrwjtuA+NjoLpVpgi15nKQIQyOncUaVG1hkOnP40sIBfLqZ7c5
 Qgy66vPe1yx4bmRKRfGQlHvmvXtvP3yz3iwjhgTVlkKXdnAY8wSABooPcJnSsV/WeuShptv6chQ
 =
X-Google-Smtp-Source: AGHT+IEdXwX9lvbpx/TG0Yw4zPunm1P/BzQ6/RoC2QYcWjRh41fY7r8poS7OShTInML2NIELSGPEOA==
X-Received: by 2002:a17:906:f207:b0:a4e:1597:eb39 with SMTP id
 gt7-20020a170906f20700b00a4e1597eb39mr8820897ejb.74.1712133639094; 
 Wed, 03 Apr 2024 01:40:39 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1709062bc900b00a469d3df3c1sm7510691ejg.96.2024.04.03.01.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:38 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:30 +0200
Message-Id: <20240403084033.512286-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403084033.512286-1-francois.perrad@gadz.org>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133639; x=1712738439; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3I2tV4iomtdZOLaINkRBx5xFocVe49aBeT/JsRVios=;
 b=aCJTAfcc0vhcbnvzYNDLAPYHz6JVUrgbuPIEsXbZoXGxDThqQa1y8PyDTge8FSOfGI
 ieO40LY4GjEcw5ohECGTt2Wj1u+/GoGIlvInYJnjs8dOEdypYsFljfklDIqb9jheQp72
 GBeJEw+jdmAtUv6g0PhCOOFPiW9RSAytrIYBqKyjvJew7NvMLGsH6obmC38nXyCqWs04
 idz4Rkjy2lxS6fBBFZEaiKNd4A8KxeivFOpvd9jAYDRIrnKjNj5RFuJAFwlHCJSsNjfG
 IFZIvojCGC7rB9zaWvCRaZbT3gPo0gmgVYF6ymZRqNxffHA3D0/Z611gmGxJblalQ1xS
 UhKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=aCJTAfcc
Subject: [Buildroot] [PATCH 2/5] package/libassuan: bump to version 2.5.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libassuan/libassuan.hash | 4 ++--
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 084a09848..6bb5022d1 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
-sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
+sha1  b6ccd955085dac902a09871f94a3d41a7667d0c8  libassuan-2.5.7.tar.bz2
+sha256  0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76  libassuan-2.5.7.tar.bz2
 # Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index fb95a6fd6..9553c630a 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.6
+LIBASSUAN_VERSION = 2.5.7
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
