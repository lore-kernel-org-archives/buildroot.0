Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392CFC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9C460E7D;
	Sun,  1 Jan 2023 23:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9C460E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCObsSu0VNiQ; Sun,  1 Jan 2023 23:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F4A760C16;
	Sun,  1 Jan 2023 23:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F4A760C16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84C121BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FAD7405B7
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FAD7405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAKQ8n_beP7W for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F8C7404C0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F8C7404C0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:47 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id h185so1308254oif.5
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovm0UbfsyMXhAcnkusx+7+xl51BWSvGboxiKyIuKLSo=;
 b=2tDZTXJ4i9TRk3rkepe5oHHdBGFh/qNII2/200MCcuVLPQKG8n/y8lbeGg+e/kNuCt
 If1BezktWECamWa20j50LnioGhL90nSoVTigk668MutS/C0hdTQr8zoZku5f1ZLoZY3b
 nhn1gMC4zXq3BA8/idwPQ4x7US05NF8fCAziMynbBZ8TWtx7SEPWsymHYrI52uHLCWAf
 usoMlx4soONyOwdVt2xscsyWBXbasSDe3w6mQfvXVUxg8xT4kgcKXnrRQo3nbeeyb3mZ
 np8IqOSz7NRfYZ5FCnrSMbqN8YYMLsTuAIKSd3qFMowmJ0NdrstVhZ/GXFTJOCN1QXpl
 hGmw==
X-Gm-Message-State: AFqh2kqDH/Zb+bZOkHvOdY3Jz2L+ytvpxZ9/vyXtU9xDRqWN+V7KYkzF
 TMwd7AGUaDKx4EdGXTB+WkUke6/sgi8=
X-Google-Smtp-Source: AMrXdXtDCZy3CG7tTY1DWKg00yHXNIpKqGkIuBBnj1FOTeKw9UhH6X3utDZPjNjf2ZpS7hsVHzXZ9g==
X-Received: by 2002:a05:6808:2389:b0:35e:6868:5257 with SMTP id
 bp9-20020a056808238900b0035e68685257mr25468281oib.23.1672616386625; 
 Sun, 01 Jan 2023 15:39:46 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:45 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:41 -0300
Message-Id: <20230101233653.487175-18-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovm0UbfsyMXhAcnkusx+7+xl51BWSvGboxiKyIuKLSo=;
 b=F906ceepShFhwoE1+Rl/cCAiW+g993r2b2/70AVKHlroG2qtUiEuf8e0vt93Fdv/Ui
 E8DtSuNQqGPcthLFw8zc/QvPic5w3bZasGqCS/tWa5X/59p+Hx58L1yfIZTrCMt6sR/o
 aA9etnFFtJRVsy5ZU93SEZR6qM8yE2suJ9Aj5c6SBgq9zF6mQDrE3s7mluBn7FfUe4eN
 beKoL7BNYD7yw82zsHh963JDFfzj2l+xBfpu8k6YbVm+YoX+umVxo/Svaaxzzi/2bISj
 s7Sv5NbuurNtCBnO7KZQkHD0MzrQNnsq3dq6F/ZpD8Zxe6E6lklYD2A6VsclaA45SDOO
 5tgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F906ceep
Subject: [Buildroot] [PATCH 17/29] package/gobject-introspection: drop bugus
 GOBJECT_INTROSPECTION_AUTORECONF
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

Commit "7687a396e8 package/gobject-introspection: new package" added the
package using the meson infra for both target and host variants.

Meson infra does not support <pkg>_AUTORECONF.

So drop the bogus symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/gobject-introspection/gobject-introspection.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 70f4addeab..12e5b81b1b 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -9,7 +9,6 @@ GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
 GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
-GOBJECT_INTROSPECTION_AUTORECONF = YES
 GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
 GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scannerlexer.l
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
