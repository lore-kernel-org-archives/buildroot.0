Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D22C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40608144F;
	Sun, 27 Nov 2022 13:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40608144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTSK2WeXRotW; Sun, 27 Nov 2022 13:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1557E81419;
	Sun, 27 Nov 2022 13:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1557E81419
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE8251BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA5AE81AC1
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5AE81AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xq9nPi7MpgHG for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F41A81AAB
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F41A81AAB
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:04 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id v82so9037730oib.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuTtuQDZkYQSTRkD9VcL6aJwMXipj85xN8sWamDOY6g=;
 b=f5gU9eELEoIsuen1RU5Vw/gl1U0KcQBwlHMQAMr4C69+ABlK9ewoG8b+bw4FCp62Os
 NhRsiSSxvtNqHDcD5oG8NxOzxDlLSDe8GB/f/E/YnXnbEncXYXEbS6PhXW+acHBo+Wuf
 mK3Jea72SekNMV9WiI4NxAHPxhvxi6NI3ztioyd/6Rmhu0N+W9+Byd1WaEhGnP5oyYS/
 ZchTojylWJ4odDycqoaqBPqvkONTQxT8dQV31++9YZ3ffGB9nL1rJGq4foIRKJ54y909
 BkUa7cqzsnM5f+rIIcDYkOvJ9D63z7nEEg2CLqmZV3QqBSck5eVIduMe3qKNdQNQRXLi
 EfoA==
X-Gm-Message-State: ANoB5pnplyIPhMI0rPXwvaf3vdVRcaBpu+RPyyCh81aykt4iBVOwTK+U
 q3Z01JgjoSsk/nblP+9/Bt/nkvmJJQo=
X-Google-Smtp-Source: AA0mqf6IJJYvF0I67/BBA/Na4NyfXxOkX8tpZdWbI/nC12hqexMISj2T/BeMvjSny29X9d/UJ8s8fg==
X-Received: by 2002:aca:3d07:0:b0:35b:4cbf:b9e9 with SMTP id
 k7-20020aca3d07000000b0035b4cbfb9e9mr12385426oia.127.1669554483879; 
 Sun, 27 Nov 2022 05:08:03 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:02 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:17 -0300
Message-Id: <20221127130739.1862398-4-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuTtuQDZkYQSTRkD9VcL6aJwMXipj85xN8sWamDOY6g=;
 b=TYOGwYo8w+dnDluw5acpEloDp/n/nTwJJCcVAqsAx12ePYn24SjYjvuSyiuNhCBFWf
 oiqjdVy5PgRhKwW2Y0Vtxpnx1XR06ZyTkvuhAATHQAFNK1HGr9xNbLTLFD9bKGUBgnCA
 qd/4OghLQBaDj7B0GbkdTfdIKUc8Q7S3MvhZZnvsc6dmmQk4QWk8tsKIXVs//ujFJhiX
 4isb47NKJv2mGCK4lFYvqxKDB+mOkFttvLB4ankQ4OKhWPsL3oSRvdLoIlFOMQTVFFK0
 SMvI8AB62Uf2LK/jnHnXwdK/shhBmqWsIQVX+hI73gzExFwaJ8NR0+jmKFMQHS9siRu8
 hkUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TYOGwYo8
Subject: [Buildroot] [next 03/25] Config.in.legacy: fix typo on
 BR2_PACKAGE_MEDIAART_BACKEND_QT
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently using this minimal .config:
 BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF=y
triggers:
     *** Legacy options removed in 2018.05 ***
 [ ] libmediaart none backend option renamed (NEW)
 [*] libmediaart gdk-pixbuf backend option renamed
 [*] libmediaart qt backend option renamed

Commit "8553b39887 libmediaart: rename options to have proper prefix",
part of the 2018.05 release had a copy&paste error.

As stated in the beginning of the file:
 The oldest symbols will be removed again after about two years.
But while we carry these legacy symbols, let's fix the typo.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE: Maybe it is time to drop old legacy symbols again?
If so, some patches in this series can be dropped.
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4eff5b55d6..9ce1004b0c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -2594,7 +2594,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 	  BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF has been renamed to
 	  BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
-config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
+config BR2_PACKAGE_MEDIAART_BACKEND_QT
 	bool "libmediaart qt backend option renamed"
 	select BR2_LEGACY
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
