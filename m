Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8DCC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7267060E96;
	Sun,  1 Jan 2023 23:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7267060E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_Sm4bV_e3wU; Sun,  1 Jan 2023 23:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B843B60E81;
	Sun,  1 Jan 2023 23:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B843B60E81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BE061BF867
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 752D5410BE
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 752D5410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYfXBCTaXx9r for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A4F40935
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51A4F40935
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:50 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-14fb7fdb977so25092665fac.12
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhazh3jDmZ/yir6wIKFCIw7rvTwvoKufTbDpelEu5nw=;
 b=s65uGScJC7XuMZB0w4KS7irTqWNIEGgdZsNKbNAm6rLlooTglxO2+fSbBKiKN+LJ8r
 +c+yKjYjIjakTAiomMXqfRPoGpT54cHCMAH+MsIgkztHHIR7uAPEMoRk5WxP1ISFj54w
 UesufZ67VVI0CCnJRdMrzDJRqcARUl0hbWnKgSejgfvkG3UR5guUGfQQRaPrSZRkQo26
 Of/3M/G1GciXzQJOhvaQtkxhdZvB2ov+1IVjWJ/wbEQiDafZdcC+psn0tSqMzCJq2uno
 HzpOGqQ4XVeTSgC22IvrpELXGQ1o73oyQYHnaKpOMeJvy6CrMg1U2MNss6lsj5ZI1HaO
 9mSw==
X-Gm-Message-State: AFqh2kqcG3Lg02KK/E6YErlucPTvyMQ2DpLmjG7iFvMN29hydMB0fsKo
 fde6ThgJf/WHtaPTt+KA3pBR1exegX4=
X-Google-Smtp-Source: AMrXdXscuIow4rnTUM/8xAkoHuYgtrwaoDxstDlm/7Nh/2oRsLAUMABdwmHZdmDWp7bvwvX/8uNnhA==
X-Received: by 2002:a05:6870:2e06:b0:150:b759:d78f with SMTP id
 oi6-20020a0568702e0600b00150b759d78fmr736987oab.39.1672616389407; 
 Sun, 01 Jan 2023 15:39:49 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:48 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:42 -0300
Message-Id: <20230101233653.487175-19-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhazh3jDmZ/yir6wIKFCIw7rvTwvoKufTbDpelEu5nw=;
 b=XLQ9LT08ArEzVRt4Jgcq7PKL2e1qynDgYcHKLvT5/Htb9Gs77r/jkCFm9ZFUJ/5NnG
 kLgIlhQPJRxFpV+wMDlYKVNJObMKHPmdL3b3M9MjRLtjCHX8cSU+58NfECNMS+f5x+4W
 lYLuQn+vy7IGnV4tZjvyiyUoo3jeHcyOgUTGJX6io9x6Fd91ip9U+OkonWCQANd8XZDH
 eG3CZqIcPf4gjL9Cdp0ytQFc0n5N6iS49SveZnPyRYi07NXs5YTxoakbKi0XGQTbxs5W
 ZX9lrZKxOJU4tAHgfU73APVtNT3IogAuhODzui1MEMrVM8+eqIcjyiYqiaOWPTSWQ2OR
 UUZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XLQ9LT08
Subject: [Buildroot] [PATCH 18/29] package/libtalloc: drop bogus
 LIBTALLOC_{C, LD}FLAGS
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "f0d37e275a package/libtalloc: new package" added these symbols
but they are not used in the package and also not recognized by the waf
package infra.

So drop the ignored symbols.

Cc: David GOUARIN <dgouarin@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
build test:
44 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/731863771

test-pkg config:
BR2_PACKAGE_LIBTIRPC=y
BR2_PACKAGE_LIBTALLOC=y
---
 package/libtalloc/libtalloc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index 75d3da263b..ca15180d22 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -31,8 +31,6 @@ LIBTALLOC_CONF_OPTS += --cross-compile \
 		--with-libiconv=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-LIBTALLOC_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
-LIBTALLOC_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 LIBTALLOC_DEPENDENCIES += libtirpc host-pkgconf
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
