Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC2AC433FE
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 23:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD91141863;
	Wed,  5 Oct 2022 23:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD91141863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gMw0wWyWjPZ; Wed,  5 Oct 2022 23:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A14E5402D7;
	Wed,  5 Oct 2022 23:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A14E5402D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBF9E1BF2CD
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 23:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2CA160FCB
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 23:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2CA160FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IybsNy1Y_7aH for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 23:23:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD210607C9
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD210607C9
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 23:23:00 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id e205so108766iof.1
 for <buildroot@buildroot.org>; Wed, 05 Oct 2022 16:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GH4X1fv7Gu1n5v7952fMuF2Xx88p51yagKreKmRN0gs=;
 b=Jbhk1ElbgXuI9lH5Mlmov0HE2fu3kLlRMrO8MfyKw+IKknZZVbcCOAIYHAzBJuxaQf
 vMs5AGXU3xe5kpUFvQ+XQFhJWIWeOvTXAQ6bHThiOrMVTwKeDXrz8zymxK4bCJmjr+K1
 QbLvr6t4Rkzm+OyZD9e0fKFw8EVneG337+6Vr0SZBnE4Lo9X9T2SRMJ/ToiqJctXV4ck
 5v74DWy8vWhVwF0x0eoTCbJ5kr1KPZtUGMCNYGXFcA3thuoWKxt/ZuA5J1ADYjPzfGkd
 CbR/BpIbbmMdl1gl7Eqgli4yTrhU1lS5taznnqvmy0q/wo5kd5+b0wn3ssO55iBBjVYw
 PJnw==
X-Gm-Message-State: ACrzQf3XQFeno0VYoBcwkZKwgGGwb3M7YDy8NlwZ1DKXNGFbbYEeDT8/
 WldQnJSPm3SPTZQSoLkvmtXAZGplkwRiig==
X-Google-Smtp-Source: AMsMyM6WMCpIMUhUqRz7vdbXqEACUta1DjEXCMGmOed/gupZsHzxjUJ+GB8WRNtuWigrSTfHMvoglA==
X-Received: by 2002:a05:6602:1548:b0:6a1:a87f:8128 with SMTP id
 h8-20020a056602154800b006a1a87f8128mr1038590iow.141.1665012179496; 
 Wed, 05 Oct 2022 16:22:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z13-20020a92bf0d000000b002eaddcf4c75sm6268551ilh.47.2022.10.05.16.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 16:22:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 17:22:57 -0600
Message-Id: <20221005232257.2625525-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GH4X1fv7Gu1n5v7952fMuF2Xx88p51yagKreKmRN0gs=;
 b=Eag+aRbca0VFSVbxOXTHg5cuK5MjCc6a9fCnJ2WnxP1T4PW0P6vmN6PyTZXrYzjD8D
 mzBFW71P5DXN33QvV2/VROPzqmdQHLmHSeNhnkGpoadZC9mKmSNKgSO0qZ9TpN3KzshI
 d22SdU7S6m36SYDkc/b+D9UlL0lL63oaKyruFw8jIvftLuRJYhk9zeA4rpK5YZ57UZG2
 S9AORu7+jz60rZ2VA2vZARbeNh8WWOCL36g1yZxaYi/li+aJv01C3M7ZEvPnr6mTIqmB
 Rt9Ah69+HNnNRkE7kdj/bBrPUEBVyW6rRaCg1dgCAHq3gINMpQQ9NFQEcfkUwpikpLCz
 jxaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eag+aRbc
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.63.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index df6a92d1f2..60d9ae9436 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.63.2/meson-0.63.2.tar.gz.asc
-sha256  16222f17ef76be0542c91c07994f9676ae879f46fc21c0c786a21ef2cb518bbf  meson-0.63.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.63.3/meson-0.63.3.tar.gz.asc
+sha256  519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056  meson-0.63.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index f9b3f95bb7..3ca483c289 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.63.2
+MESON_VERSION = 0.63.3
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
