Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD0C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 19:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A284016B;
	Tue, 11 Apr 2023 19:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A284016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVg1bM66Jj2A; Tue, 11 Apr 2023 19:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD4740112;
	Tue, 11 Apr 2023 19:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DD4740112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87A391BF3D0
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BDE340879
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BDE340879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VI9oxLKzFz6N for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 19:06:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36B4A40877
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36B4A40877
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 19:06:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so8586122wrv.8
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681240000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kae0qBzrGB/fcTEHn+US0Ahb7WCnPXHAOL5MatLH5c=;
 b=sp04/08kXWIoWK9LkU5vF7jWhapwZ8BHwv7/N9RLnpHPFWawdcM7U/BGF83rYBAocQ
 5vKOyVUkFIpaupH/42FVXuPPVFfHaOePPWZuB7sXYQGEUdLaDY58+632fGGbu7+BOEcH
 bUjVkSxi0BK3mJ+7iUJKGx8S1f52+VgivNVSQfTqXvbjTVqcofbERlfhvK1/6yvQG8+X
 OxJ/ajAEqXKgXiAvHUzrPhffO//uBFls0ZgKLzvUxW7AMBR+LwNBuYfmtPmLSpA6sXWE
 Rv8Vh2bVScE8Q3XqRrMD2Lb9WkXkRX+b2qIJNskC5+U5LUV3f4eCWZl5Jlv3rMRYwPlT
 ukhw==
X-Gm-Message-State: AAQBX9eIvsL6/jqjhe6NPLM38CTaAbjPOvA7I/rVJs7OLck+Di2RiVOX
 hp6ntQ38srXdbeM5KzmLJm2mIhbdAVk=
X-Google-Smtp-Source: AKy350YLt/qlSdvKu93sFiGtI65y4mcpmkTPgqKUAAwXjjisxAOGodOQrJSiM+uFQN7XQN8e9hputg==
X-Received: by 2002:a05:6000:110e:b0:2cf:ec6c:f253 with SMTP id
 z14-20020a056000110e00b002cfec6cf253mr2636200wrw.20.1681240000137; 
 Tue, 11 Apr 2023 12:06:40 -0700 (PDT)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 m15-20020adfe0cf000000b002c7163660a9sm15106725wri.105.2023.04.11.12.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 12:06:38 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 21:06:37 +0200
Message-Id: <20230411190637.1545607-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681240000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=5kae0qBzrGB/fcTEHn+US0Ahb7WCnPXHAOL5MatLH5c=;
 b=o1Pfzb5DH+t3gr49xVW14s0wZU/XvnX61R2RjUzSW1OE3ImlFinwUsaeXUmzCf1YeG
 EUvGbCWNLw7aReWmdAgtGGBjWBAGWhKQj6LzwxZpkmSjFn/nHbQN8ehEGOU3KIqt/BiR
 RHGfm1uQ6Asg8Guzcc7thz3BfYCCB2+j/AWT4ysyoOZPFYQPzvNrmYKFJleLwF/RzEAm
 6/+Yr4/XKOIexgg98oAa1l1LjKs0LgwLYzCMPqaoimQoOW7Ucs+pVJgq4yyP5UkDnhHg
 0w781IYvNMVgP1JuR+7gADqevIZq7NfKzM2CPdiCh+EFwkmyVtU1Aqk2vPOYNsAQ0dyL
 9Duw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o1Pfzb5D
Subject: [Buildroot] [PATCH] board/qemu: fix post-image
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
Cc: James Knight <james.d.knight@live.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Last-minute changes to d9b244d8a3c8 (board/qemu: define start qemu
script outside of post-image script) were not tested before being
pushed, so they introduced a bug.

As Arnout put it:
    [...] multiple expressions need a -e to interpret them as
    expressions (now they're interpreted as file names).

Fixes: d9b244d8a3c83b39f67444f36b21a88cbaf4547b

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Knight <james.d.knight@live.com>
---
 board/qemu/post-image.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index ccd0fb78c9..763287ca39 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -41,10 +41,10 @@ case ${DEFCONFIG_NAME} in
     ;;
 esac
 
-sed "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
-    "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
-    "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
-    "s|@HOST_DIR@|${HOST_DIR}|g" \
+sed -e "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
+    -e "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \
+    -e "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
+    -e "s|@HOST_DIR@|${HOST_DIR}|g" \
     <"${QEMU_BOARD_DIR}/start-qemu.sh.in" \
     >"${START_QEMU_SCRIPT}"
 chmod +x "${START_QEMU_SCRIPT}"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
