Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0A6C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C44941655;
	Tue, 13 Dec 2022 01:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C44941655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QK34lcbW3t1K; Tue, 13 Dec 2022 01:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70C2B416C0;
	Tue, 13 Dec 2022 01:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70C2B416C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2D191BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C647408EB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C647408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS6CStgPDZgE for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 076FA405FA
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 076FA405FA
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s16so4358479iln.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQ5jlVrxOxFT7DGhDuS8ObzF/XlRMT46hNqyTJvXMqg=;
 b=ucXrN+FPC+X/cXFLhjvDK5lGv33Lv9Bt0lk+dmAK3K6B/hQ54VOKzOfI+3qXj8hPb8
 p7h4WoZI95bLFGf8seh5UK6ANssAtNuzy7cpejDyQJ7CbQ24S2fBwn+iQOy01WETAQV1
 tD5QB9yD10ImjM+KT0KDdpX9WhMcmtMe1oizdy57gJyAqwesrPCsGvfe/yo2Xoc1w5OM
 lXzf8uZNQGObyg/2iK6ZIGl+YW+/a4sEe14zBypmRGsQkSdQovNTPtDYq4xa9NuuXk8O
 qL209NW+7ZnKcyO6YQByFV/HCpWTp0lx+QTMvJNjlN4x8fddWmyLhdnrzELRWI3DPsPB
 9Qkw==
X-Gm-Message-State: ANoB5pnJCjyHndWsYRSoCh6eHriECA5DhFgmCT76Mb1/POQXETnkTWaM
 2CuCsI66K5t36uoMoJnxm7N9zRvUYBAecQ==
X-Google-Smtp-Source: AA0mqf5EHxomXJJ6fDScEc9aguzv8d/hX0Iq5zw1Zsew54U+GXsQk8ZXRXUeySqpWds70d5kpaj3rQ==
X-Received: by 2002:a92:d205:0:b0:303:11da:8d5 with SMTP id
 y5-20020a92d205000000b0030311da08d5mr9387133ily.6.1670896219321; 
 Mon, 12 Dec 2022 17:50:19 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:50:00 -0700
Message-Id: <20221213015001.4175808-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ5jlVrxOxFT7DGhDuS8ObzF/XlRMT46hNqyTJvXMqg=;
 b=GrWcyfptu47GvnH81CLwrFkJbuUYfjJkwKyTC7PwlJb5g4OlnPbON0OZyRrDXg1N5/
 6lwpq5qVI+58hxxsTEf5iE03+qlhEgirtSV+LYbaEoAhncrpeq8fOO41X5ZjTNAfkKwM
 yCyPPt2mIOzeT7DLhP1InRrw5uh3gXnc9fHeTZHjOPA1Jn/y7aqm3Z31hBGLzUtwJ/YY
 /Acv2w64fuRJ2pBM/4eA7hZOoFjcAUG+Ee/3aoFvldSIUwbZbeOKxvkdGwTvI7tfgnmT
 Hvsl62/rAIFPD9Rhu3ng/OF/JvEyZpA93JyAE6ohgFQizDHYCMwWFOom62+ZWW0s4Y2j
 e2HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GrWcyfpt
Subject: [Buildroot] [PATCH 6/7] package/python-trio-websocket: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                          |  1 +
 package/Config.in                                   |  1 +
 package/python-trio-websocket/Config.in             |  9 +++++++++
 .../python-trio-websocket.hash                      |  3 +++
 .../python-trio-websocket/python-trio-websocket.mk  | 13 +++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/python-trio-websocket/Config.in
 create mode 100644 package/python-trio-websocket/python-trio-websocket.hash
 create mode 100644 package/python-trio-websocket/python-trio-websocket.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 89d2a9a2c3..a995f1d73f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1398,6 +1398,7 @@ F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-trio/
+F:	package/python-trio-websocket/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
diff --git a/package/Config.in b/package/Config.in
index cd22bc9935..5c9179a80c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1303,6 +1303,7 @@ menu "External python modules"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
+	source "package/python-trio-websocket/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio-websocket/Config.in b/package/python-trio-websocket/Config.in
new file mode 100644
index 0000000000..7d35fd0296
--- /dev/null
+++ b/package/python-trio-websocket/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET
+	bool "python-trio-websocket"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_TRIO # runtime
+	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
+	help
+	  WebSocket library for Trio.
+
+	  https://github.com/HyperionGray/trio-websocket
diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
new file mode 100644
index 0000000000..3e6e832d90
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/trio-websocket/json
+md5  37b141910bdafa3c9b6731aa16646acc  trio-websocket-0.9.2.tar.gz
+sha256  a3d34de8fac26023eee701ed1e7bf4da9a8326b61a62934ec9e53b64970fd8fe  trio-websocket-0.9.2.tar.gz
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
new file mode 100644
index 0000000000..4522b87c9c
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-trio-websocket
+#
+################################################################################
+
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.9.2
+PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/75/91/44a0a016025794ba9fef530a6fbe59987153e2cbea7e11fe2f3d8c618740
+PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
+PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
