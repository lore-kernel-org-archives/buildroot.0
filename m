Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420D6C54EE9
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EB160F3E;
	Sun,  4 Sep 2022 19:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0EB160F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVUC3BC0X0An; Sun,  4 Sep 2022 19:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C971D60F25;
	Sun,  4 Sep 2022 19:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C971D60F25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD2E1BF574
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 195A34024B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 195A34024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Da2h4oPihWdm for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:02:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A4C401A3
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61A4C401A3
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:02:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id u22so6567047plq.12
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nX8b77bLnNoTq22X+s67whdMbps0frsh4kKzvI3MrDE=;
 b=A1aIMUX/JguK6Y8jtZOuW1jSySvug4fhIUnCwbB/EkOyEhbfhxi7NLGo0yuKOUXJpe
 /9GzoiZFSK25UeNeYk/RPBrikx90JABQCra8LptM3xNiPZYy00LlNwzcBqgLM6WItFXL
 F2w83XPsifyZE8FiHtGrC7VH9Ln4KByx0MZ81AQffhiHJihdFK63wg/C6/e7Ad6JcIO7
 UBhhztv84TyRVk3wnOIe//ARVxq+Z6Oy7Rl5+hxjI7YVR4N9u8o5Qk1paKtCZsMfhLef
 uR1tXnoMwyFJj1AAreyqoPN4NTZZFv3pkxF2DhWIP0QY1tJvrdy+EUL6dzvEM4VOmXxY
 PnQA==
X-Gm-Message-State: ACgBeo3c7KNdBAggFuYtqJK0oRCx06C6/bBOU3OcZq9qksp3Z0ZcmMv1
 NJz3u13kgsToo2X1X4DzUnBv/ABgEH1OQg==
X-Google-Smtp-Source: AA6agR6Tw0g+QmeTsZL4kx1xSnSpmUKZO1EatRWJy+TJBl5uUWSoPGfnhxZZm58KHz3jVxQDSaGU/w==
X-Received: by 2002:a17:90b:4a10:b0:1fb:2e77:a33 with SMTP id
 kk16-20020a17090b4a1000b001fb2e770a33mr15704413pjb.67.1662318143308; 
 Sun, 04 Sep 2022 12:02:23 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 x19-20020aa78f13000000b00537b11ccfafsm5970989pfr.127.2022.09.04.12.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 12:02:22 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 12:02:18 -0700
Message-Id: <20220904190218.198854-2-christian@paral.in>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904190218.198854-1-christian@paral.in>
References: <20220904190218.198854-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/2] package/python-pyyaml: add host package
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

Add the Config.in.host for the host python-pyyaml package.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in.host               | 1 +
 package/python-pyyaml/Config.in.host | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 package/python-pyyaml/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 66b64fd7c6..bc6e470313 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -76,6 +76,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
+	source "package/python-pyyaml/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-pyyaml/Config.in.host b/package/python-pyyaml/Config.in.host
new file mode 100644
index 0000000000..f50697d857
--- /dev/null
+++ b/package/python-pyyaml/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_PYYAML
+	bool "host python-pyyaml"
+	select BR2_PACKAGE_HOST_LIBYAML
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
