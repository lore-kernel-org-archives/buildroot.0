Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB4AC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4258C4091E;
	Sun, 14 Aug 2022 23:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4258C4091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0Kqr2gVupJI; Sun, 14 Aug 2022 23:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197DD408BA;
	Sun, 14 Aug 2022 23:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197DD408BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 248A21BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27D6408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27D6408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvAk0aGBGn9S for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1B640298
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB1B640298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:24 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id b4so2333800uaw.11
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HEX9op6B773ptwlYKBz6+v1Ahsw1ijqn747Up+8BZv4=;
 b=1E0v3aZt7YQZvVpN8E/nKVJzoH/FfPTS2vtCBTuOVT/+PFdoaWgqZFZZIWuG7q78Qz
 Yr9rq88NooQMmGjCjxMswpQkX5ZjweHxJufpyGVVoSw+wNryuR1/k9R2J6/I3dAyBVUN
 L52nn31JfcXAEHV9C7yX7mgl2o3VfVrQRSa+VGI+6UMdZON/52byTbIiaXq0IRwLixV3
 JjoSVRoUXd9OrF0yEG+xbzDqylUPcoQyTZxwYHppbt+JDMTdaDGE1ilIOR/3K9aOkO5A
 E2WCEp48CK/JgqEvW3uX0CyZQMiA4OCOXzS+zcf1QIYw2+WxhEBOqzrCsH8WKcc1gIIj
 kyzA==
X-Gm-Message-State: ACgBeo2WqwNPmCEjrDjJp/8c6S+eO9yF/MsXHRxipQg9B1m/ttkkEBR1
 +HXzM24bjVYCVo7FpfiFH8AIxmD2oCQ=
X-Google-Smtp-Source: AA6agR6bBLWbNwlpc5UBRdozKgwlGPN4LRc8xKmK9hV34qaV5g5MdSBflm675i1IS5EWPdPLjVdlOw==
X-Received: by 2002:ab0:448:0:b0:38c:b073:9c49 with SMTP id
 66-20020ab00448000000b0038cb0739c49mr5198596uav.119.1660520364579; 
 Sun, 14 Aug 2022 16:39:24 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:23 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:15 -0300
Message-Id: <20220814233845.2247022-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HEX9op6B773ptwlYKBz6+v1Ahsw1ijqn747Up+8BZv4=;
 b=F6sWA4HUTggoCUjqrMmhUvm+GaGO0sMrfW+IeKDLfgr7rJNLHbUt/sHBr8z4OSTlos
 9mfvvNpe8fhRpFSrLRPQ2PDPZfI18Gfh2oVfyrp0Xkr3PH4Jc5BV2fIwmpICQcnMF5p6
 hF6rJcmTOoSmOfEHxeErYkBulhBGSIz9eAKyJOYYjaWZr+9SRyQ5hDiSUSaJogX1utqr
 9h0kOBC+ZWBrXDw2zvt1UZBxZjeTEx9EoMLFY8XpFtgjdmV0N8YDQqLu6PdlivUsZapQ
 d8AxmNCdCBlQIwT/DyLFtfGz8ILXQNPg6AN4Yx/lXFF5cfali1bIuOjcvuu3cDegPbhs
 qcxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F6sWA4HU
Subject: [Buildroot] [PATCH 03/33] package/gcnano-binaries: fix typo on help
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
 package/gcnano-binaries/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
index ade19e2121..89f909f2c3 100644
--- a/package/gcnano-binaries/Config.in
+++ b/package/gcnano-binaries/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_GCNANO_BINARIES
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	help
-	  Driver and libaries for stm vivante gcnano gpu.
+	  Driver and libraries for stm vivante gcnano gpu.
 	  https://github.com/STMicroelectronics/gcnano-binaries/
 
 if BR2_PACKAGE_GCNANO_BINARIES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
