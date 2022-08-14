Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC783C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E118404A9;
	Sun, 14 Aug 2022 23:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E118404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w77zJllKG9oo; Sun, 14 Aug 2022 23:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A04402F5;
	Sun, 14 Aug 2022 23:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A04402F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6079F1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B72D81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B72D81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDqYNfeuhNWD for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8697381BF5
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8697381BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:18 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q15so5876353vsr.0
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rnAvnRfKdQYRiXRASxzVeQQl/f2AcfVm9hQVNE4m4OE=;
 b=bnlpo9vMsE+AYBwcT97y3cNG57uXUQAb8cM5NhbmF95HT43qjkfnEkyad32glDzJyV
 r265zhegGVF82cWhVlOZ20xnSGfGDObOH/pPdGRc9Ek8Ytgs3zPIBgugKnwlX8a+XgeU
 iFHCJDT2Xuv1g63CP7Dt8DgjeT/WR6McSlhWswsMvGfBttjeQ5S9hiToQT1G63+zuu1p
 9/y6J12lkSg5hOzdn3QDBcHjyEOHH26mm3psrNM2BBuhO5nvL5uanGCN+EIaIrcbuR1H
 yD9pnRJ+2mdNXKKqhNB7JavpdqgeHdVeRgMz6OcZ2TJxDNLcWz/g5EyC85cQBeAUMQDy
 QPkg==
X-Gm-Message-State: ACgBeo3RikpPj8AIi+6Ua/Isi1Ae7G9ozYeBXio/GdTI0EEtqIJNF/mL
 ECqHn1q8wyzTIeUld0wYmW+CZb8RoyU=
X-Google-Smtp-Source: AA6agR76AJ1yDBEypnSzAp01avzHnYfumNjYe/Qy0bwqNbNhEPCV8v855chf1flTwIfOxjVrJEjWmQ==
X-Received: by 2002:a67:d781:0:b0:386:bd65:ea08 with SMTP id
 q1-20020a67d781000000b00386bd65ea08mr5385567vsj.69.1660520418170; 
 Sun, 14 Aug 2022 16:40:18 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:17 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:36 -0300
Message-Id: <20220814233845.2247022-25-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rnAvnRfKdQYRiXRASxzVeQQl/f2AcfVm9hQVNE4m4OE=;
 b=Psz5haDX1QQbItnlt/758n3Ts9wfw+/9ouT484D6bwtd+hCVppmRsg6C2x5k+LaVD5
 X4XbTcRdJSyXebSX7pe47YyP1S/vjfvk3oohgtBjGfCJzX0H/d69N0ydoqGIaSzY7Ir0
 1RxxrhmtSwaFxF8+BuelPg82au7aRTLAdIPcOpkEfPWDnK7DqrDG/PnkmmvYqz88isBP
 bY+hKAb0GHtaZ09wgxXrzoAc8mSsnakn8soEO6PY0I15U1IMnVNkCiVaPbiGeCRQUGgy
 TVjooCssFVx4kuzByOUQ5FlIlIza8YyEy0anukTVSfvYqEtfYuxQU85FpZPwD4jL5aWw
 NVcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Psz5haDX
Subject: [Buildroot] [PATCH 24/33] package/zeek: drop bogus PYTHON3_HASHLIB
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package python3-hashlib does not exist in the tree.
So drop the reference to it added by commit:
'ea36681572 package/zeek: new package'

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/zeek/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index 123fedb339..f2a769621f 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_CURSES
-	select BR2_PACKAGE_PYTHON3_HASHLIB
 	select BR2_PACKAGE_PYTHON3_SQLITE
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
