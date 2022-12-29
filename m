Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDF3C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 215E360D50;
	Thu, 29 Dec 2022 09:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 215E360D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOGqLJcdIXYa; Thu, 29 Dec 2022 09:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF6560D4E;
	Thu, 29 Dec 2022 09:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF6560D4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2781BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0445440865
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0445440865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOvRAh3zgTte for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:25:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86351404F9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86351404F9
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:25:50 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t15so8062466wro.9
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l99QDZDQBo7St1K3MiQZjWnpPIcIe6KCW6fwP1NvqWk=;
 b=FS9Ua6CqckCb4pr3F4WKFDyVjQb9WOZON9xJtLtWTJBNPFnLMABjkHsqQ7plMr3BgZ
 +emavryTYYmpTOWH0cSNphhQXbPpG6GCTNEW+f4u3BJCBZl4zFzJO85p6fSfvGd48rCB
 iQ5YXMOZcyEWNvIZJj6N6/DQ+UbELfK8efQvge+/nzDNq0jb7u5mk4yMbpl52hTvNh0A
 w0dq1NQs9Wd4cbopII1OBOicKc8TESViNx+d7KmTKGUhxAxid0D8nsYUWg4CfxL6cY5H
 aKeZGWwE4vca6mxce7z8d4D0CbfOSjXQRIGv1gKWWPf9ayLrJmxSTAYV7RPcvZGH+hxK
 K+Yw==
X-Gm-Message-State: AFqh2kpN23aJ4ANS+QbrYEfH6XP9nKZTWOUgOQVBjBVQWTjSWXXFt3P5
 p+y4EqutzgQFWcqSbRlbAKeDON6cIb8=
X-Google-Smtp-Source: AMrXdXvAn8MsS18NDbhR+rFXC67hRYKk4mC8Zdxdzv8e0qSRm/bCR2MFl1VuxW8+1jZ4oMCCN0/5bQ==
X-Received: by 2002:a5d:54ce:0:b0:26a:cede:b651 with SMTP id
 x14-20020a5d54ce000000b0026acedeb651mr17337586wrv.36.1672305948288; 
 Thu, 29 Dec 2022 01:25:48 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm22479148wmp.26.2022.12.29.01.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:25:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:25:40 +0100
Message-Id: <20221229092541.236778-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
References: <20221229092541.236778-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l99QDZDQBo7St1K3MiQZjWnpPIcIe6KCW6fwP1NvqWk=;
 b=PKi2Rijq+MwXVjyKpDsvRO6InsTBQkE6pjBPKd9dWi9WdSvn+v9WudxfGt7tuYaO41
 GiiiVYi99bLAKprirxsqZJP23dc8EcqWuWJ5GSZIQyaSIrZGVCE+TBqxG9NQcYyL07mt
 zcxAsjUuI5QyIlrWGsQU6AAy9cG1TY4wapaz5gQQGPa7EIjAzJnxW0q1xfcDz9eKkCeg
 yXgwYYQtmhpEHjDk9XzVP4h1Q4TbPOR7jhCeuhvWywPU8JukuOdN81xB0HxdbVyZ7ZNJ
 Pc/zdZ9nR49tGQimTrtZ3yk2GRx+Ut+ntLNh2dX9I1lL+bTLfbpyyshSBy4u2v3+/yqk
 TEtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PKi2Rijq
Subject: [Buildroot] [PATCH 2/3] package/rsync: add lz4 support
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
index 7a32c4f8b1..9c7824f575 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -19,7 +19,6 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no \
 	--disable-roll-simd \
 	--disable-openssl \
-	--disable-lz4 \
 	--disable-md5-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
@@ -28,6 +27,13 @@ else
 RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+RSYNC_DEPENDENCIES += lz4
+RSYNC_CONF_OPTS += --enable-lz4
+else
+RSYNC_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_XXHASH),y)
 RSYNC_DEPENDENCIES += xxhash
 RSYNC_CONF_OPTS += --enable-xxhash
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
