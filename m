Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5843EC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D318A607BC;
	Mon,  9 Jan 2023 03:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D318A607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAu7q9RgS1WD; Mon,  9 Jan 2023 03:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0F760A70;
	Mon,  9 Jan 2023 03:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B0F760A70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D602F1BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEF25815CD
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF25815CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iP6gIOax2a6i for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:26:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F50081585
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F50081585
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:26:34 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id i83so3957399ioa.11
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yGykQiPF5MsVW+zdfJMuFhZ/fB6PfaN3HyskGp631Y=;
 b=2E5lusPGE6MCkeNippLpwC+xQ6gQ6NMom+SO+1Y4YWTKDRE1b/sgWjZ/CnxhI80tQ0
 wnGrKokPTy0djxsQCSA+tROy2bGtliYY237T1BMZwmis2ktLG7JKH6Tix4G3C0tk51Pc
 hrp0vUgJ5aheEZ8/0lDFnoQ/gSk+0fTbbT3rE2XzWd23oxZcemVxpaf1dz1T8VPKh+WI
 f2lITCJGWlVxROHTP77lEukQFOfcUsnS7ZGrWVA6omGG4jBffbelZG1zBqGOaB+j28D/
 LV7kNnYQ5J20WxltAUCbHnj6YQsEDvPYhDNufOeQl71I435u9/0otnue1u9i6MvUx1/W
 LocQ==
X-Gm-Message-State: AFqh2kqrMoa3e1dGpKBnU8mNlYc82veOdYvZ5bbJtmafE2hyeUhTezTb
 09LwjPxRhpf2ROYHeP99O9UEsG+yK6IqEg==
X-Google-Smtp-Source: AMrXdXsUPzUrT++L9PGJs3gOL8phnC6i3IxAlm1L70VAyIoGvESPSTUmBLxMuwVhdpRDrQJO1pF/xg==
X-Received: by 2002:a6b:ce15:0:b0:6e3:db2:6a7b with SMTP id
 p21-20020a6bce15000000b006e30db26a7bmr36353097iob.6.1673234793285; 
 Sun, 08 Jan 2023 19:26:33 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 f16-20020a05660215d000b006dfbd35e995sm2794054iow.21.2023.01.08.19.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:26:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:26:31 -0700
Message-Id: <20230109032631.2086263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yGykQiPF5MsVW+zdfJMuFhZ/fB6PfaN3HyskGp631Y=;
 b=aNLvU3hfx76BU6w04TvFcrcBMVtqtSqH7zIhuGVPWL6Tafe8csgzMIdGwWNZwsak9+
 dsteCjNfV31XDXpta9MXWM0ieVkHGPsbidw5ObZHL4vMe9/fQhyVpqpWWYpUExdTDhV1
 FPl2Rk/JM+AvbjhegDE13GFsMUB8viTC3pREa6ADQ+ce8IPz5wYdslbnRGt5Hpq7bR26
 Go94iAkPJo3SBCeN/Zx1KFEvmO0csVEGtsXsS8nFXmTkvlGYt7nFDHiYsS3sguUL0prs
 H2S8U6w7vJdPbjOanUrF/1Y+8tUKy79l38lrKUffCACcJA8qh5B8LTz6sg71jSpK4Zoo
 UcUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aNLvU3hf
Subject: [Buildroot] [PATCH 1/1] package/python-crontab: bump to version
 2.7.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index b3aa96fc1b..d9519096df 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  2982bdce2d9b7789f32da649a9507c4b  python-crontab-2.6.0.tar.gz
-sha256  1e35ed7a3cdc3100545b43e196d34754e6551e7f95e4caebbe0e1c0ca41c2f1b  python-crontab-2.6.0.tar.gz
+md5  0a71aa83eed18752c2850632d84cfd89  python-crontab-2.7.1.tar.gz
+sha256  b21af4647c7bbb848fef2f020616c6b0289dcb9f94b4f991a55310ff9bec5749  python-crontab-2.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 9b29e11ccd..1c2802ef61 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 2.6.0
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/06/b0/c270a1b5c83d9e0f83ab654d3153c39d80f61ba49fefde50fd23ab351381
+PYTHON_CRONTAB_VERSION = 2.7.1
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/6a/b6/94d861e868698b8e3f288f7e4684e30535b0d9a6b38316ee0a3d4d31e6ae
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
