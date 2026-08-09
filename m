Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0513C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 20:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3F0605E6;
	Sun,  9 Aug 2026 20:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLv0VQmdUowm; Sun,  9 Aug 2026 20:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9BB360615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786306434;
	bh=g3epfRjkpJBeLt1GO1ppDSG15+LvN4jL3bIFgIrksLs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+uor3HP5zNinoyAQhwKb/qpictQZLxckbRjWDFjO6cgUvwnzhJ1ZglBgubmpkCPP
	 KOBWmUeGlwAH/SqppZqBfp9z5Ez3ST6gPVoDSxIHSYeSV7/UJiC4HOuH5vtVUhBxE9
	 h1WJA7osGzMHBHGCjXLUqjA9P6k0JPSXFl9KGOlYIaS11Srm+WHStrZMjfzBcjqCzo
	 D1vHMDawqRD0qnwJqFIJY9UNNDoflBiyccAdZv5zrzezPrmJPgFaMlVizEM8p+0Uut
	 8OR5pBoGSqTJav/qtlfdjQiHpKgh1U3YaeqbEZHLpZ8u/fhIZVwUcyMVxc9vxnSPRn
	 +MkXS0N2NjP6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9BB360615;
	Sun,  9 Aug 2026 20:13:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4420259
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9567080B8B
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jamN6vOlElui for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 20:13:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C642C80B83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C642C80B83
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C642C80B83
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 20:13:51 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-51c928bf172so7655921cf.3
 for <buildroot@buildroot.org>; Sun, 09 Aug 2026 13:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786306430; x=1786911230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F0nrYq+s/pC4jdApbvCLN5YvdpMFsu+eNL5c/jlFNY0=;
 b=lF8RGKEN3oYN7/oFbVxXqfG8D9DZc9hua5y3bXr0iPQ6/wa+9BgeOPtnvNpo0aJEt/
 w31Av/dOlDz3VgqNzyBsqeiYgKLNQQlt7q7MuKGjRO9/C3Sp5iIFf0L3RAYLD6ox0xrk
 W//K5srSgogJRaRyQkmfBkyyERX7gekjl4Xk74O3FDBD0qnk7pckl/Ag9eJWsErhljsQ
 9WZlvpWnN7WYiyH4ZHqGVYgK1AR4F8cfjLrUclThLjCbVIx9OeGqsyExrFOODKHB6+qw
 094bTgY5AyKMIr6uujr4jKakLHwXjkQDGjPZc3gsBqXDI7cQgYUPkF/Dt2VaAbp5NpSL
 AnDQ==
X-Gm-Message-State: AOJu0YwWm33qiCQBWL3TOJYJRkmv8GMaYN2Now+Cl2RlX04sIH3AsyDa
 WgWGyHnOQT88WHihuHpT7JDqELnMmMlHBZOFAoexjfx5oNNhP55HIvweQM3fiQ==
X-Gm-Gg: AR+sD11STgsUGO5IzkHjYbaWZID76lJ/WfnAJ97Q9m5HyKRcWC0KYaTzpJ3HBAGA13R
 iiJFpu/yrC2sFtwmc8fTneFCpRSbaeei3EC0zaSpiGT2F8O+CGSIuNjlfQUBWn3xnGEj+/KoVFo
 Xs5H/lqVWEYBtZZI/OnfLzRrE8LTVEp+WNlSC5U3yAQJeusuan6gGv7vCYk7J6qXQffdNBD/Aiz
 yQGJxRSGarZdhjTaX7a0KhZ9zbRPZBhaaU+/ZHAlCMm3w9Whn9DWaoVGsjQM6CGC8RkVY9+tVAw
 2oS2e4LHNsVQT3NQ/p41wUjxxfwL1EFn6hsFNuYAWA26x6FfSZK0j5fOhSkR6ZVffsyXRxEMOdu
 ETdTbcmz5mV36ubVNkvD9I02eChcXxSDFl2YFi7LMV5Z2j40hxy7n9lyopTeTGBNLLdTLKhJgon
 AjV3cLdE77q8dofCnA0HzjXzYsNE8d/t/lGemM8aXC4pCzUvw46yneRRkS4zrlKwX+fUAXztDWK
 BGyWyCJVBSr4v0=
X-Received: by 2002:a05:622a:1482:b0:51a:8696:cb38 with SMTP id
 d75a77b69052e-52ce5f616femr407029211cf.7.1786306430366; 
 Sun, 09 Aug 2026 13:13:50 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52d163d9107sm56681461cf.13.2026.08.09.13.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 13:13:49 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun,  9 Aug 2026 16:14:03 -0400
Message-ID: <20260809201403.3855903-2-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809201403.3855903-1-alseycmiller@gmail.com>
References: <20260809201403.3855903-1-alseycmiller@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786306430; x=1786911230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F0nrYq+s/pC4jdApbvCLN5YvdpMFsu+eNL5c/jlFNY0=;
 b=Btwi0aL1+3cFbrORD66URRrDesRVomvd5qylUDWsewOS8wqA7n8Nw/LRWt+W2X+okv
 Cm1SfG7Y/fjAy+JKHqIA5achihvyaA2JK620ZNFeWjp+KPtMjROdcu++8Mh6s7sq591v
 ivcgBRsNJY1K1v07GJFNegSl7uwCYqPcRMTSLzepQQfdsnZOg5TPD3p6Lbu1MEJXhLJh
 sl9UPZ0lqgEenAQGRUKQ4cZ0E+Zs/28s9wiyjiXJ/uBr6WQfQTAjk+Pa7GX5ydKTr9S4
 kbCRmOg6qnz3cXm01Ei07mgKIMSR3EBuSpCHNPSYhp4OedxZwq2EFojUlyGzFhCi0Eka
 wLPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Btwi0aL1
Subject: [Buildroot] [PATCH v2 2/2] package/wine: select libxkbcommon and
 libxml2 for the Wayland driver
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

wine.mk passes --with-wayland whenever BR2_PACKAGE_WAYLAND is enabled,
but nothing guarantees the rest of what wine's Wayland test needs is in
the configuration. That test is:

  WINE_NOTICE_WITH(wayland, [test -z "$WAYLAND_CLIENT_LIBS" \
    -o -z "$WAYLAND_SCANNER" -o -z "$XKBCOMMON_LIBS" \
    -o -z "$XKBREGISTRY_LIBS" -o "$ac_cv_header_linux_input_h" = "no"], ...)

and because --with-wayland is passed explicitly, WINE_NOTICE_WITH turns
into AC_MSG_ERROR rather than a notice.

So wine needs libxkbcommon, and it needs the libxkbregistry part of it,
which is only built when libxml2 is available. Select both when Wayland
support is enabled, and add libxkbcommon to the build dependencies.

Note that libxml2 is not a direct dependency of wine, it only has to be
in the configuration so that libxkbcommon builds libxkbregistry; the
build ordering is handled by libxkbcommon's own dependency on libxml2.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---

Notes:
    New patch in v2, following Thomas Petazzoni's review of v1.

 package/wine/Config.in | 5 +++++
 package/wine/wine.mk   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index db3b1570ef..7a01ef6f7c 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -17,6 +17,11 @@ config BR2_PACKAGE_WINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_ALSA_LIB_SEQ if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI if BR2_PACKAGE_ALSA_LIB
+	# The Wayland driver needs libxkbcommon, including its
+	# libxkbregistry part, which is only built when libxml2 is
+	# available.
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXML2 if BR2_PACKAGE_WAYLAND
 	help
 	  Wine is a compatibility layer capable of running Windows
 	  applications on Linux. Instead of simulating internal
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 4f0e229e9a..eca13d77cb 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -189,7 +189,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 WINE_CONF_OPTS += --with-wayland
-WINE_DEPENDENCIES += wayland
+WINE_DEPENDENCIES += wayland libxkbcommon
 else
 WINE_CONF_OPTS += --without-wayland
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
