Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362ABC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF6B0404A9;
	Sun, 14 Aug 2022 23:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF6B0404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrQ1VTmj-GVY; Sun, 14 Aug 2022 23:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDCF940364;
	Sun, 14 Aug 2022 23:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDCF940364
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4D9FF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2865E81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2865E81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dw-wJ2wzHYhA for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CDDB81BF5
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CDDB81BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:58 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v128so5829652vsb.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gr9Ar1S+YYzMkW/bau6Y21HRhhg8dg65GWWHNsyX2KI=;
 b=v5wX7bTkk+sSANgfbC0GGE0d44f8OLaLGAw+DNxmIS/7QCnpiIQZlZy4QEvpTcgYLh
 POrrzInJ8wFW8ren78Aw9BVYQTpUeheV5Nj9Xuxn6pKQkPtGAKSghhsoZrCvyRRUXexq
 bDQv0xtChtacPc05dG+fHDebOHXs7NGBVWDYIwLi4yoYflv0N2EfWHR3iIJSA3d0d+GV
 OHmnrS9WCQKIX6jr4BR8215IE73rGNqiNWTUZKAHW/j9XHFDEhu+jMCRR9GnNeMEG0m1
 D98xL07i5CWTTUfkmBB1QbBDwxiU06Xy6eY7w08ArO9VEpYUsvIgILs/gp4mL2d8N7U2
 Q4Kw==
X-Gm-Message-State: ACgBeo1B/9XyWyBkPG1q3KheCTugFAqYUZKDzmJ9dmWGh0CuBHhNZwJJ
 3mllEbtda1KElDynTF7p0BKa9pxlA/M=
X-Google-Smtp-Source: AA6agR7/oNe1qCm3HbDosIUpK4jj0xds9vXXmbFb7ipZJ4zNU/pjcKDy9kyiAeY/7VSpnAUu2gWmlg==
X-Received: by 2002:a67:b042:0:b0:388:c9d5:8af with SMTP id
 q2-20020a67b042000000b00388c9d508afmr4729868vsh.40.1660520398175; 
 Sun, 14 Aug 2022 16:39:58 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:57 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:28 -0300
Message-Id: <20220814233845.2247022-17-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gr9Ar1S+YYzMkW/bau6Y21HRhhg8dg65GWWHNsyX2KI=;
 b=QSBu3IqOuU7KwE1p/mAFZUTufn/hVeixCnzYrZRFn4zfd0ItVbb97gr0/3try+RN2q
 fJ+ir5NXlbxCTsjoMcb6HaVrq/uGcOduOBR2tF79OA8IyBY5Gmy0X3vtCR2T3oSWrjzw
 aYeUT4cthTnvZMwdDsqgDI4Xlkxc+moHFJNjkLsZGYv7EkYUJmeCKyJVRL5XupfsLlSJ
 cxcli7ugNzuMvsqoavXQC0ApWhC3lNW1oBBhzjees4E2BajzFwoMOC68SsVITjlwJZw4
 l5cac+VfiUGBsn+ujM2bEQbsMzJyvRfTe8PcExSR83cZk4e39jkJSZLe8hZQSACfsen/
 IumA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QSBu3IqO
Subject: [Buildroot] [PATCH 16/33] package/kodi: fix typo on
 BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Typo was added in 2021 by commit
148e695e37 package/kodi: bump version to 19.0-Matrix

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4c6e01745c..90710683db 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -250,7 +250,7 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
 		BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_LIBVDPAU
 	help
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
