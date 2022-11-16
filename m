Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7387417A8;
	Wed, 16 Nov 2022 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7387417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynZzG8PlcdWQ; Wed, 16 Nov 2022 22:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A444176C;
	Wed, 16 Nov 2022 22:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0A444176C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8E911BF473
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A459040150
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 22:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A459040150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_fY12XtnC-T for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 22:07:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8656C4011A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8656C4011A
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 22:07:39 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bs21so32386294wrb.4
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 14:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AyN1fCdbFrAjm1rIs3xd1jOlkFyQ/ZphebbTjHtXdh8=;
 b=l4Nscrxbf+uRBGO6aHiIivZjNi9Hz0uAnJ623FvNinhoObbTJ5sNMyf6y+002imfQU
 o/nNCGqWq2nz7R06vr7QNP+Uj4ZvbsUP/ZQ54XMtMVL9JfadAUATnLdIB5UOnxBrirgw
 ezaNxcuUZR3M4MPKHyjrDXyimy8DYuv58uqNGwKc4o+Rub+VjBV3G3bSa6ilBs4GaXpv
 28WM3ICEFywKFpycbEr5fV/SxSmj4VKO+mxk8me+nrL9b9wNSh+sFrywlaLDRby4fYXJ
 IAzuWVyQlabeUn+nYM5aBb8nq0em1npsfmG3Gocuj7/L+lelq3ce95Dx2azNDO5AdYm8
 0vGA==
X-Gm-Message-State: ANoB5pk4HYDTGpIokA7fF7QyL31sf4UcG6BYIqPPQe7qgQ86KH203Pem
 88Sy8tIr5796/DUPkEdG/8kCuueH1mM=
X-Google-Smtp-Source: AA0mqf5UA70wy7B7hJwgAmT4QIB4k5ptNpGkXl+BRz5ATR3b9nz0VX1BAYoJ8cau/TmHZV74G8oChg==
X-Received: by 2002:a5d:420e:0:b0:236:7034:cd48 with SMTP id
 n14-20020a5d420e000000b002367034cd48mr14661710wrq.418.1668636457169; 
 Wed, 16 Nov 2022 14:07:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b0022cdb687bf9sm20123135wrb.0.2022.11.16.14.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 14:07:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 23:07:34 +0100
Message-Id: <20221116220734.7229-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AyN1fCdbFrAjm1rIs3xd1jOlkFyQ/ZphebbTjHtXdh8=;
 b=jWLTT4MzmIMEDMDFQUc/FowjUdLYXBhgXlSKIpVnEiiokwYYXnhFzoBmYNkYrt2/wS
 ctbcdzCLhI31BJ6gLekJ3/GAj/nx6Q8Zd7WGvlk0P2j3fSzyAezJfxNSvux3rAj+5WnT
 8OihxTRwGthZt4L0asMHPS6zbp4hpmJm3rcYkB7Mm8vudCH/6Dv9mdcA6OxP442YLkhw
 ZIpCxgJtdj8p1CV4HRzz9/MBQynGKFSczX6qjgiguUdj5DSURpOGJ1S6ZlGf3cj34Dit
 kNGI+j6CQzwJhM0af+bzah7GKr/mVz4qH0L8dH81cy+n6ev1Sr0EpUw/PyO7xo3EqJxo
 TDFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jWLTT4Mz
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.9.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backported #8403: Fixed multiple client side input validation issues
(CVE-2022-39316, CVE-2022-39317, CVE-2022-39318, CVE-2022-39319,
CVE-2022-39320, CVE-2022-41877, CVE-2022-39347)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 94d0746d40..f6adc05312 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.8.1.tar.gz.sha256
-sha256  ea8903b29914134202a972c06052432678c89cb5eebcc8f5a41553030c97376b  freerdp-2.8.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.9.0.tar.gz.sha256
+sha256  fcf71cf5b09c5c2636341ba212f34b8fb728246ea28e08caf6cef8b4a96184b7  freerdp-2.9.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index ae844c589e..fb0e6920cf 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.8.1
+FREERDP_VERSION = 2.9.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
