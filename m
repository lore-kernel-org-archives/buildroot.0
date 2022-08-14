Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD09C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4CD60E27;
	Sun, 14 Aug 2022 23:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A4CD60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7ng9pOa_lQj; Sun, 14 Aug 2022 23:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9355060C1A;
	Sun, 14 Aug 2022 23:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9355060C1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA7CE1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2F5881BF5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2F5881BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M13RpJVX7I0Z for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D9E81BD6
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D9E81BD6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:22 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id s129so5831650vsb.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WsslCU1V3PopWPyhjk5BQhTh/rdnTwvCNEDSMVd9sTs=;
 b=VKUXESh+h8lMtZscSQhOJ4dP/05/RqeDEEnCfhEYck7CG6ak0FJmpQyEvuRggo4LJA
 NFacc6JnlbIEjBmKwF/XstUh1ZRfGU91Gp0rhYNpxDj84ipqrhQK4vB3KgEB95IPJRY2
 BrRuVIQKXCxenzJ4j1GLgmr29b13n9NWwldx0kGGvT9otOvjQYUWBvLBQSAOXDJ49x9+
 1/9PUtcXWX74qgZR99eoR0RUtjqpX0RMoiYoi54cmAm0lEOLF40E0TEvdqbE/gK9nHY3
 B40T7aVPEvctkkNf+xnbeMw8Nir+Gbg9p1JG/9FIL0vpk15yWumOCdEhqd4VJZr+z6Xg
 fjDQ==
X-Gm-Message-State: ACgBeo3LEiu7fKYYb+5uyh36hUgTUmIXVoLCE1fagYwSYyrG8E4qvF3N
 lXo1/gefeobaQ82lh5hku9DjjdK3HGQ=
X-Google-Smtp-Source: AA6agR5gX4mqaq91WYrOKFBJsYj3W7vReOM7bjX++DPUOIqQdnPAH7vivU0d3Rn47DXv9wlY0Cg6xw==
X-Received: by 2002:a67:e05b:0:b0:380:a2ff:a948 with SMTP id
 n27-20020a67e05b000000b00380a2ffa948mr4912228vsl.7.1660520361779; 
 Sun, 14 Aug 2022 16:39:21 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:20 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:14 -0300
Message-Id: <20220814233845.2247022-3-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WsslCU1V3PopWPyhjk5BQhTh/rdnTwvCNEDSMVd9sTs=;
 b=kZRUCISOPL4hSCoggvd+xXbXWnbMmviFOazALqoIVMJrRdF72Sfn2b2e3bWBNn2vN4
 e9lVgz5q8IXvYTssNQouSEF9+WIfY5xkUExU0z7eAC8nHCslhWD/UtYr3OUkQKSdB4uL
 X6WQO6FCaxcroSmttbhCUqFyw7KJlgu1j1IAO3bEsz3EazSeU9b2jWw9KJ+kMCZYfG8p
 xuPoHgKvXfnbkFecWEkclvKGDxNJKU/I++GvNZuPP/cbXMp65j9MO89Exl5VbKBcH9HC
 AhWCp6Q9zs7KF57B82l0iTuHgamL19FzhlbfFoNwiYJGgr7J9JR5AoD6SWLarUI2Xtwq
 LqOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kZRUCISO
Subject: [Buildroot] [PATCH 02/33] package/ti-gfx: fix typo on help
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libaries -> libraries

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/ti-gfx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 76aabcb8c4..40f46335a3 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_TI_GFX_DEMOS
 config BR2_PACKAGE_TI_GFX_EGLIMAGE
 	bool "install eglimage version of libraries"
 	help
-	  Installs OpenGL libaries which support the eglimage api.
+	  Installs OpenGL libraries which support the eglimage api.
 
 choice
 	prompt "Target"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
