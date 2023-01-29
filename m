Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66976C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 03:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE59940186;
	Sun, 29 Jan 2023 03:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE59940186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QtXP26CQxibY; Sun, 29 Jan 2023 03:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1352240123;
	Sun, 29 Jan 2023 03:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1352240123
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9F91BF255
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9CE981836
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 03:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9CE981836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8UQONcjjThV for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1C2E818E8
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1C2E818E8
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 03:52:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id l7so969304ioa.7
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 19:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S6YeiO7lu7FjOQJWXptde1PI3dl6YqUh3d8FpVR2ae0=;
 b=CZBIpJE8GiF+LNFjZuFCVJXexksdqPTOFe1klyjWeL8KQmlkr9qXfaFJYTdYGoY/dY
 wbpE/RXbsM7xSLYbFmAPGTQoCNQnaKy2U9fct6EyCblpVDOoWAa6tnEVwliOlgIQcfqE
 QwUjus8/Gm9wtnVsuxOhvp5/Y1JmnUncm4IdNuV7kC9jK1D4AL08pfUXZMXqbk1WMy5k
 2QnzMZg4nIjjsTwIvnCzP3emD3aFUgeXDtgjfm7lQVW8gyM65YGfKdEUL/EAZtXnvhYp
 +sgD6ZR9EMIA3BzWgOohnAafV+rkyNKhtDOlzQzVK6gE/Z78UeZUCGFyvYg6zQmuejyn
 KDCA==
X-Gm-Message-State: AO0yUKUjlandjq5EIve3WNO0E63j/f88Cj+ov5baO/M3xJGdMgkNa9+O
 W9BG1CdVlB7IdC3zoLAY/tQnL2mfpwbLMw==
X-Google-Smtp-Source: AK7set8h89f4qlzaeOKbfSeMqkKz4sa8jzaewoQiVHn+gS62kFsgWvQvLjPihdA7OCLRxGKFG1dwLA==
X-Received: by 2002:a05:6602:2c0c:b0:715:999a:ca31 with SMTP id
 w12-20020a0566022c0c00b00715999aca31mr5230449iov.17.1674964358729; 
 Sat, 28 Jan 2023 19:52:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05660214d500b006f6623df63asm2874352iow.14.2023.01.28.19.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 19:52:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 20:52:29 -0700
Message-Id: <20230129035232.2480871-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S6YeiO7lu7FjOQJWXptde1PI3dl6YqUh3d8FpVR2ae0=;
 b=Em7gJoTvjzTlHxBV+PtkHrJqgoApLRshJxRABdq5mgXIlUlgYamDBniebICtsI8vgA
 fgecezIcBPtN0Z63FfBikfeZ3MJhyoJ6dSkOLufiugmybLkisZUz1oyOwodU2ZLHQw5K
 5momau9WDilJ6dmltjZu7conm3BXQkdzGRe+bOTEwAGQwOyrDPPe6G8YVc9SE3IC8uGO
 D4XOQGBzzh3iGWsNx8KXvxBXIuuRHUDYZ1P42/8swn3XzqK6DY8/S/iZfLh0UxHQ8E//
 RwXcSxGRocdt/DAs6RadrzZc5RBiaT7uejawwq3gyh/j/DRU6KNmZLHn4RwjIafLTMMD
 tbfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Em7gJoTv
Subject: [Buildroot] [PATCH v2 4/7] package/python-trio: new package
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
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-trio/Config.in        | 12 ++++++++++++
 package/python-trio/python-trio.hash |  7 +++++++
 package/python-trio/python-trio.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/python-trio/Config.in
 create mode 100644 package/python-trio/python-trio.hash
 create mode 100644 package/python-trio/python-trio.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b686dbd87a..9fdc66f60b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1402,6 +1402,7 @@ F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
+F:	package/python-trio/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
diff --git a/package/Config.in b/package/Config.in
index 195398b844..aa6bb7bce3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1306,6 +1306,7 @@ menu "External python modules"
 	source "package/python-tqdm/Config.in"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
+	source "package/python-trio/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio/Config.in b/package/python-trio/Config.in
new file mode 100644
index 0000000000..0aa53c90ca
--- /dev/null
+++ b/package/python-trio/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_TRIO
+	bool "python-trio"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_OUTCOME # runtime
+	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
+	help
+	  A friendly Python library for async concurrency and I/O.
+
+	  https://github.com/python-trio/trio
diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
new file mode 100644
index 0000000000..487194662e
--- /dev/null
+++ b/package/python-trio/python-trio.hash
@@ -0,0 +1,7 @@
+# md5, sha256 from https://pypi.org/pypi/trio/json
+md5  f7dbfa6a8722065f09da188641d8ed93  trio-0.22.0.tar.gz
+sha256  ce68f1c5400a47b137c5a4de72c7c901bd4e7a24fbdebfe9b41de8c6c04eaacf  trio-0.22.0.tar.gz
+# Locally computed sha256 checksums
+sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
+sha256  faa301d72dcc023b432bd77dc08a773ca3449e5c27440b9d66eb46fb8500b430  LICENSE.MIT
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
new file mode 100644
index 0000000000..80da203c15
--- /dev/null
+++ b/package/python-trio/python-trio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-trio
+#
+################################################################################
+
+PYTHON_TRIO_VERSION = 0.22.0
+PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/0b/b8/1b81d2149c3e2c25900d40b8e6c8d3ca502a3cc844b90c962b0854aaf3f3
+PYTHON_TRIO_SETUP_TYPE = setuptools
+PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
+PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
