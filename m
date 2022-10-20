Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4852BC433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 14:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBFB4419D3;
	Thu, 20 Oct 2022 14:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBFB4419D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOy0cBSXXqu7; Thu, 20 Oct 2022 14:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F2741A17;
	Thu, 20 Oct 2022 14:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F2741A17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29CE81BF312
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05AFA4105D
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05AFA4105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEhQLjdXTdM5 for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 14:14:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0724E40323
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0724E40323
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 14:14:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id x18so26588960ljm.1
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03qhEvp4VeXzDzF5r+xng7wsZP8nK1Yr4n0iicax4oU=;
 b=CTi6e1uBofeMoSar30hKAOzDNznbUCmqbjKndcRTSfypaMT6JsFdInZVlS+957epon
 QcNX+cDbNREd9wfWXOAGJHdNd7JCTrlul1GfdIwqv/GSZ21AfQ3SOXkXbryJ5EHLxzFy
 dCKPbF2P5k3Pb8NsB31mcwaiD/HAjAmWAGe46F7RfuqqOiLL+cXOVKwkbJOYItO6vzJ3
 rPnEWVW/MdOGJW0gL2RJAYb6aYXhfblJMkoIkQQFlqiUB41Rx1Y+Ey1EuAWmNANBAZD1
 ihpkCwSRR9e0vfQyUGxvirPpxia4NXqZ9PXc/jrEhMS5gZuQl4yTt1+Z0Brkrsa0fffL
 9dcA==
X-Gm-Message-State: ACrzQf1ZwUjIk0xXKApzuuTPA6PBm0MehTpGvV9k0nGNeoxtpOsBDVXl
 B2oxU5kI+V/8L9eQDTfaqd0kEWiEmttivg==
X-Google-Smtp-Source: AMsMyM4mc5Xn1lu0TvgUu1A9QsJyQu1yaSeztNApG6Vph5E/WH66X8Vc3IZN80YZybBAswoGXtoBcg==
X-Received: by 2002:a2e:9e8d:0:b0:26d:ffa1:2653 with SMTP id
 f13-20020a2e9e8d000000b0026dffa12653mr4722774ljk.439.1666275279762; 
 Thu, 20 Oct 2022 07:14:39 -0700 (PDT)
Received: from wkz-x13.addiva.ad (a120.broadband3.quicknet.se. [46.17.184.120])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac25e63000000b0048b969ac5cdsm2739975lfr.5.2022.10.20.07.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:14:38 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 16:14:11 +0200
Message-Id: <20221020141412.346992-4-tobias@waldekranz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020141412.346992-1-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03qhEvp4VeXzDzF5r+xng7wsZP8nK1Yr4n0iicax4oU=;
 b=YoMZlqRP53Cct/52EH1mjK6lEvi/p3RgT9jbSoWkKZXg3NmeXeM5qr0YV9jYg2T5zP
 Phqo+o8/4vsm1f26+KET4+WICgo6WM8zFnJ3HEQin/XOyG4rfeZ4q7yoaiE183vjrgGI
 TrP4L1x9zZL10wVXbe0qVF3zFe7ikIaDTd9L/DkIbtOG/tHxnnCwObI36NNhK2MTuMso
 9AlepbxOZKld20pAP9ONrGf8PDx9eJtqwFsljj47lUOtXL0vbUI4nqdM6rMvLEL7N9Zd
 LuD06KoZOyjDg3PJEL5pDjoNDdBr8NIjE4UA5LZgv20odZECc1/LnWItPilx0k77pOQk
 M/yQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YoMZlqRP
Subject: [Buildroot] [PATCH 3/4] package/libbpf: extract dependencies to
 separate kconfig symbol
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes it obvious that the comment is just the negation of the
dependency requirements. It also makes it easier for other packages to
depend on libbpf.

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 package/libbpf/Config.in | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 1465366c9e..7e816c193d 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -1,11 +1,16 @@
-config BR2_PACKAGE_LIBBPF
-	bool "libbpf"
+config BR2_PACKAGE_LIBBPF_SUPPORTED
+	bool
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	default y
+
+config BR2_PACKAGE_LIBBPF
+	bool "libbpf"
+	depends on BR2_PACKAGE_LIBBPF_SUPPORTED
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ZLIB
 	help
@@ -17,8 +22,4 @@ config BR2_PACKAGE_LIBBPF
 	  https://github.com/libbpf/libbpf
 
 comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
-		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+	depends on !BR2_PACKAGE_LIBBPF_SUPPORTED
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
