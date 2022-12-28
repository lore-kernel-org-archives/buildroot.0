Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB68FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 411F7403A8;
	Wed, 28 Dec 2022 22:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411F7403A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVFZa5Eq9ngs; Wed, 28 Dec 2022 22:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1FF40360;
	Wed, 28 Dec 2022 22:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1FF40360
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 843881BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EEBB402F4
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EEBB402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEZyC-_Flw1E for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:15:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9849540220
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9849540220
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:15:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so10721291wml.0
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6gMvuscPXn7adSn/HK7tXoijSqJV5b8YgLcdqgawTXY=;
 b=LVybk7L9yN6tiBC2shTwQOsdb4dm+FlgZvLJ6Wpts4uEenHdpyEsEFHBWW0PPK5O0k
 KOTJdRwIDeiTne2xA363RYwN0MHccvyJUQS5ePees8C8NJiwnWOLDTyg7yMOWwNENyZT
 hQHwhM2Uqcu8uvQLGKlSMRdcUT0DxVw7yijEbpeFcEZGMODL5CP6fp3jvE5oOZlMstv7
 //uTzA06k0VFIyBn5Nt/4vL6TDQ3zkoxuxvDclvcSQYlhQzOmbNxWymDv5tUROkw6/Up
 SiBUzjLVkHsujLIVAbhkoWnQgoGHoVBFmsNYTQEAZMP0FkD6QmRlNGde3HrLDkPAF22t
 Kpow==
X-Gm-Message-State: AFqh2kpOTJO5OyTMpfJsi/P5tTDOBhA+yeCGcsSFVHEa9mnYWv5PWJrb
 zUmdoffA7Phobcg4AuCcxG1UePtoBrI=
X-Google-Smtp-Source: AMrXdXtUE1MHLzM5n9Qly32+R7xQTvbDwQWwiH+i16Gp7METeWX+NEeCQiiS8St6K50WH6oHhGLSYw==
X-Received: by 2002:a05:600c:2247:b0:3d3:4b1a:6ff9 with SMTP id
 a7-20020a05600c224700b003d34b1a6ff9mr18726044wmm.26.1672265731475; 
 Wed, 28 Dec 2022 14:15:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b003c6c5a5a651sm21957143wmb.28.2022.12.28.14.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:15:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:15:22 +0100
Message-Id: <20221228221522.280696-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221228221522.280696-1-fontaine.fabrice@gmail.com>
References: <20221228221522.280696-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6gMvuscPXn7adSn/HK7tXoijSqJV5b8YgLcdqgawTXY=;
 b=MFA159SxvEVFBfTevZ6EfqUVk920eN15UUyImFTNzfNfPn+2h1ap5fGRylyokQUESz
 VS7DV3mXYFSfS6JH1KdKxHUPKdOS9PpPnCX4UttT+HxsiUhuTIuSrOo+qzMtr+76X5Oh
 +MCSrHKtBVk388pq4uyycP3rGrmPPr3CqzZdHbPEI4fW7LkyLVwgu3srbWF9ZzB7dk7O
 ncl6aFf56QhzfPdwQ9Jf8da/TUsEfwTSMw+lw0Ap1kGQx/5cLxkl8rLmJoQOssXyEvIg
 aLp2xKH+SBSAb0NaalFh0XPofVgdUOUQQHZdCHrm+aHfRZKF45rWty3GqcNoKk5sP/dZ
 UpNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MFA159Sx
Subject: [Buildroot] [PATCH 2/2] package/rsync: add xxhash support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 8c7ad462ac..3cdd820fc0 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -19,7 +19,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no \
 	--disable-roll-simd \
 	--disable-openssl \
-	--disable-xxhash \
 	--disable-zstd \
 	--disable-lz4 \
 	--disable-md5-asm
@@ -30,4 +29,11 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+RSYNC_DEPENDENCIES += xxhash
+RSYNC_CONF_OPTS += --enable-xxhash
+else
+RSYNC_CONF_OPTS += --disable-xxhash
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
