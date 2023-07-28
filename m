Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914E0C001E0
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3630942178;
	Fri, 28 Jul 2023 19:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3630942178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLKpgh8Av6IP; Fri, 28 Jul 2023 19:34:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D91420A1;
	Fri, 28 Jul 2023 19:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D91420A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291D61BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F1E584503
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F1E584503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zea3AqFBUENY for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:34:21 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 684FB84502
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684FB84502
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-78bb7b89cabso106047339f.1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 12:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690572860; x=1691177660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KEFeJJ88nRgQqDaC6Uf566Vc37Ld7x7iqczjSmKOyYA=;
 b=R7MZDgrtBHnBaLwqpWE4zDDGBBloDGqbvaPLKsrCKz1l85SxLOU31cucpSYm5PHBVt
 YnGqplOARJ8dqCpy8ECKxQqUlk8aSdwxbAv8D8tuG8xlUARSXS2SHIU/ovGXi4ubl+8u
 7zfr8oN0r4y4AOvwO0ZjothjWEgjgCnW7111ClvRkdeR7beckIQ7qOH/kWf/fr48ge69
 UldIKKCucZUtBXag5tlrN1oKGx5ONoqEXi7+Dza8zChbp91DhKUHaxRKKOV7WYGyDV20
 91209WXhNuuIBvqm+i6TpsiPuB4Uc8r1x0aLJJGD7a7OiIQkEgfKXU8wyASAu4Xq/+/L
 EX/A==
X-Gm-Message-State: ABy/qLbLdhJ4dAKrda6NbSAZGJeJFiql4Rk6aozbjGpO+FAaOsp41av6
 fJdwHHKOhNsYjM00QjXgFJy51wybBaw=
X-Google-Smtp-Source: APBJJlFQiMu1fEkYFWUDWwo088kuRP/iwvjro590gCzwLOIE04lo/gOXGxBBGbOpaDfUgRgu41FNvw==
X-Received: by 2002:a5d:8042:0:b0:786:f352:e3d4 with SMTP id
 b2-20020a5d8042000000b00786f352e3d4mr614500ior.7.1690572859855; 
 Fri, 28 Jul 2023 12:34:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 n4-20020a6b5904000000b00777b94e8efasm1307526iob.18.2023.07.28.12.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 12:34:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 13:34:17 -0600
Message-Id: <20230728193417.97338-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690572860; x=1691177660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KEFeJJ88nRgQqDaC6Uf566Vc37Ld7x7iqczjSmKOyYA=;
 b=c/uBoMRSH7Cf/g6owbOCE8aEbUoSMufmowdIBMdiql93mEv3Zo97olg+Ar/WomFAme
 vvLdBkseLh9ONR/oYE8lwSP4zpCwOTG8XtDs5HAa7DdTU/g1w6gRvKmGicZuU0Kq7/X3
 +JxwP7tffggEkDfq+SjZISnwqlNF+I0t02ygo8WbttLuXF0RT/6C50R0XK/9GO9njJcY
 9IZKa45/InOzho2J1FDNxDtaMiC2MAXlQ5yyr/1wTReiahUcuK3UUr9eZkE5gk2j1BgU
 AStDOL9/gzEuxyJ+Y/qzpLofUqSGyz+3waCoqxYfxMsU+G5KsxqXyMY6yYijjOA0z8od
 lz+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=c/uBoMRS
Subject: [Buildroot] [PATCH 1/1] package/weston: don't select seatd daemon
 if we have logind
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If we are using systemd-logind we shouldn't need the seatd daemon.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8aabe86652..1a7c27a715 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
-	select BR2_PACKAGE_SEATD_DAEMON
+	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
