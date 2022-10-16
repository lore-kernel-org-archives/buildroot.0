Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A463C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 21:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2BB409DB;
	Sun, 16 Oct 2022 21:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2BB409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 021yykLYDgBC; Sun, 16 Oct 2022 21:27:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38674409D5;
	Sun, 16 Oct 2022 21:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38674409D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45D7A1BF25F
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203C060EF2
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 21:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 203C060EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoejPKny7GUb for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 21:27:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E734B60E4C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E734B60E4C
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 21:27:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a3so15758382wrt.0
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 14:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KmeKJXuLuU/D+If6TicakHdMvsn4ZCSiZ1XTpZ6OtYo=;
 b=y+bvfbM9N2X72Xp+eWpVL94o3bC7P2BKKMVtHFJ0tTJQUIJYzN9KqXudnNPmeSNskv
 61rZC1PAhD2j4fWiQM/dulEteE8KYuLmPovsNIvZtmM/1ux4r4UJ35yhmCTvYi2jNZ1Q
 LdNG1nl6CDfhDGk2X9vuylsdfOkRbSZ2ql60TMS+eYQTBTNdMJMnAUL7cuj0LDapGxeS
 8Rp9Ee6SIva9Evh8X17cOhPe0tulmTdsMfmTT4ltpN0aWjgOxE+9n0iE8CtnTA2bl7Ix
 W9pJnHlsfDZsfzgT6JnVUspmedSMBRCBoD/tgUkyzlxCfx8rE8fSDsw74Gs/3Ve15HMf
 JzZQ==
X-Gm-Message-State: ACrzQf3DNnr9hwurli4Hs8yC3hIjJ+HQwnsTCHmjbbMOxzhNUVwI5aBE
 DdNiMNd/Zr7sqovTVSfhxADOqjL3mHo=
X-Google-Smtp-Source: AMsMyM6VhFjZIgnMt+0kbx9DnQsHqkfmzn5GZica3peLF7lv8FReNtEqmzG/I0EaE8dwLqfBpuOy+Q==
X-Received: by 2002:a05:6000:154e:b0:230:45ad:fb87 with SMTP id
 14-20020a056000154e00b0023045adfb87mr4698273wry.270.1665955633805; 
 Sun, 16 Oct 2022 14:27:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003c6f3e5ba42sm3222407wmo.46.2022.10.16.14.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 14:27:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 23:27:07 +0200
Message-Id: <20221016212707.315323-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KmeKJXuLuU/D+If6TicakHdMvsn4ZCSiZ1XTpZ6OtYo=;
 b=S9YdTVdKG8cEgmMCKPVqnxPlJklsDIpYkI0sTkQj4wXc0ZfS+/T8UW+olQfUOtF45h
 LIsBumB0qQLYC2nUiUYWYAep8i/VSaIZjbO7V3cDzssoX1zIsPleK76q+Ut9cZ4UHepO
 0Lc+pgUSmbjErMjhLy8ubffXWccSUk3mZJh6tBJS9U0ewFN/ajhdt29cV0AseAotRSXD
 vW86T2Jg6XB8vsZwD3+0J4zh/CVtKn6h8jL1SOKhJoXeqx4MmIq/eAHK9qLAu2A9oXh7
 ++cHx+70YS6V2CNbJM9/3JZ2J9zMGztH1+CeiI/wYfa1RtnnvZLl0dATp5jjZ3TdvSQe
 qibQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S9YdTVdK
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version 3.4.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index 589128c189..b31c66bbe7 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c1b9096f37eddaced055dfc90a9ed06ceb9e8ceb608ed46c51ed5a2c901ddc81  ksmbd-tools-3.4.5.tar.gz
+sha256  09ab343e9bf10ddfdd3216f400b19740a391645bf3645fa6f136b8da36306559  ksmbd-tools-3.4.6.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index e7f2bf91bc..c4f9c503e6 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.5
+KSMBD_TOOLS_VERSION = 3.4.6
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
