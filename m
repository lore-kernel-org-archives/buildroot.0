Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C14C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49DD74060B;
	Sun, 14 Aug 2022 23:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49DD74060B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoNu60F1U9uB; Sun, 14 Aug 2022 23:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76338405CF;
	Sun, 14 Aug 2022 23:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76338405CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 525AA1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D8BB81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D8BB81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJjVpM20ROi5 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA3081BF5
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBA3081BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:01 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 125so5847747vsd.5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=e/W0Fw4IC8OrReXWpHL4dIZOlRWDUmwpqa+SDHRDCdQ=;
 b=TB+kC01DA8oypzNIliiJkB3/sKZCDnWWIwp7Lh9RrnstGwjLNQsJsqQobf8M9LEBP2
 9G9bz0cX1+f2WKC86PjfY5XKIIn1Q9ZYIm3X2BiRJdkrsfAkxLvuIvBhlDMUZtwNn3XH
 +CCwIu83Q2Jn90Z+5+G/mtpysWs+GBJYU2OyCgpl1AboppbnPtOFagKqtABC6rApgOiJ
 wDw4wMMyPBHDWlGobsMFXevpxIGwj7U/15/iMJMcMZKGmcpRJqAJrO6X2CldyEdJ0zkn
 v03cNpcXagVo0ZP0xT5lceW7vRVPVJ3TJEMZiUFeuXKTK0U5YFhGNnaVd2bRnPK2xouJ
 F54Q==
X-Gm-Message-State: ACgBeo2bHrMHk+GOh/Z+SIrdAqM1hKu+c4crY0t/AGeGQpZnlBWxK3PK
 hIGVjql+Z9eWnbfiwisWSoMgoYyGYYM=
X-Google-Smtp-Source: AA6agR4ihLNJfSYUkx9f/eKGTE+4qjzyeLUzK4nuSENeAGZSho384IZTqFoLaMvW8PHtZKQZ3Nd3Lw==
X-Received: by 2002:a05:6102:2387:b0:34b:9f6d:10da with SMTP id
 v7-20020a056102238700b0034b9f6d10damr5482230vsr.28.1660520400724; 
 Sun, 14 Aug 2022 16:40:00 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:59 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:29 -0300
Message-Id: <20220814233845.2247022-18-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=e/W0Fw4IC8OrReXWpHL4dIZOlRWDUmwpqa+SDHRDCdQ=;
 b=E0tH+ihAOzulEBFM9cbwYlGNPMhBCDyYAkm9tJhtdbcrZyKWjCPsNV2ecyO+kgH7Kz
 MlWZes8/cdQDHng724ccrIUWjuqngKrzOWifsOlRi05XOSd+6SDNNkzMdU2cplIF0QD0
 bP47lGj9ObhVpWkKSQvc1IweU+XhBA1YcMwOqyJU60JEIieaLP/eQh1OHKjtyRmtQfY+
 g+txRkXejrM8FbPT+jzmz5wOIFH42pcegU/cOFz187c3/eKTcimFVf/FaEteM4ViV8Fh
 5lZDWe7F2hFMfHzhNZi+iJN4Lqrsho28Fq2h/gt7xDIGd4W1UFSDKHXlVBTh6BRxfS45
 xjNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E0tH+ihA
Subject: [Buildroot] [PATCH 17/33] package/sconeserver: fix typo on
 BR2_STATIC_LIBS
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added by this commit from 2015:
'db989f89c9 gpsd: requires shared library support'

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/sconeserver/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index eed777ae96..3040dddbbb 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -55,7 +55,7 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
 
 comment "location support needs a toolchain w/ theads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBRARY
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_SCONESERVER_MATHS
 	bool "maths"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
