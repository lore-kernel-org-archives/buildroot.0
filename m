Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843B4ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F67160AD2;
	Tue, 13 Sep 2022 19:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F67160AD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubbuwY-UGapN; Tue, 13 Sep 2022 19:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6909D60672;
	Tue, 13 Sep 2022 19:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6909D60672
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA571BF588
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 19:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0585C40122
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 19:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0585C40122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEcSMHaeb5MB for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 19:14:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3B34400EF
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3B34400EF
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 19:14:33 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q9so3091306pgq.8
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vLv04DvikQw3bs6hBqs+Yr9pqJ32y7C/qVkcviqChLE=;
 b=Tet4Lq7BXu4iRy2Mfyvq9DjdUPiOJiO3pKHcZ9CFCROVzGCifnodq7SGG07AhWroYT
 bhBFnzTcOXmAbzGz0zwRZHhaUw39G2CetWB35Fx3FYyf42UUUrrFf3+2tXeiC5yeJAto
 e5QnQ6V/Not07FKBX3zZC48XbeR1xWfI0RYgzh5KYIpDNvt8X4MOuyvqeqeuKytm0fXM
 5i+H0UsAZYA1Chnt3XkddGmub5WNarh9PlhrrLZLu/Yu0zLyTdhEHgSItq1So09Mgyvo
 0fpkph9KgiPhYKW3jxN09ZLtgR0ymTmLW4whV3um0J13e3EutgplJqas/wjzBUATW6zX
 SOmQ==
X-Gm-Message-State: ACgBeo0h2cqgSaCfEDtomhas0soSqHMdaeKkDZWgXIUWjwIpz6bWtuR8
 ZcBYccwUUJqAqluomczytCDCpbLs6sgsCA==
X-Google-Smtp-Source: AA6agR4u9CSLsYaSsuIpSlHmzf/jNIvtrY9DtgWi65yXA3i6Ogqd1DZMuJw4pgmY+nTCUBs7J2oclg==
X-Received: by 2002:a63:d511:0:b0:438:91d5:5a43 with SMTP id
 c17-20020a63d511000000b0043891d55a43mr17858115pgg.587.1663096472719; 
 Tue, 13 Sep 2022 12:14:32 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090a1f4f00b001fdc88d206fsm7556931pjy.9.2022.09.13.12.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 12:14:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 12:14:29 -0700
Message-Id: <20220913191429.154837-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/python-pyyaml: add host package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Jetson AGX Orin python script to flash requires host python-pyyaml.

Add a Config.in.host option for the host python-pyyaml package.

BR2_PACKAGE_HOST_PYTHON_PYYAML

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - dropped patch to add host option for HOST_LIBYAML
 - dropped select statement for HOST_LIBYAML
 - added note to commit message about why this is needed

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host               | 1 +
 package/python-pyyaml/Config.in.host | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 package/python-pyyaml/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 99edeafece..7e93ea906a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -75,6 +75,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-pyyaml/Config.in.host b/package/python-pyyaml/Config.in.host
new file mode 100644
index 0000000000..1e8382ef5e
--- /dev/null
+++ b/package/python-pyyaml/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_PYYAML
+	bool "host python-pyyaml"
+	help
+	  The host PyYAML package contains binding to the libyaml API.
+
+	  http://pyyaml.org/
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
