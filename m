Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C54DC05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 167804155E;
	Mon,  6 Feb 2023 13:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 167804155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxFE0vvtJSPD; Mon,  6 Feb 2023 13:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E330D41568;
	Mon,  6 Feb 2023 13:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E330D41568
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A52D1BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C8040459
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C8040459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWvAUW9Wjqo3 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA4B34021C
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA4B34021C
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:48:43 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id o13so853154ilt.4
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 05:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFk1zquuoh3yL2tLFwbN14151xx0qULveLRKypdjcr0=;
 b=TVTLtQWqcsj5KBLJzbOb6axS9y08qO+q9LbMpYUP0oT9/bndnKXeydlLPGYn0fz2u2
 aTiSG0subbgTg9thJUK/QtCpkc6b+cn+a/Epg3ju5whv45Wi1Fr9xWYnj4rJVWHoMWeK
 2vA3yFoW+xpMMozz/WFu0ytNg6x01s+bET3301YGecUVT6QFptu23MiAGecIP+71WkkF
 hAh42us0AhMBwjkR4w2RuFtlnQ1qpjfT8kUdU5gPisnOZwbbD2R7fFxeti23kcEYX8WB
 JqVuTQOUhbLxJLM9XuHiM8bT9RbvAPHazkkr7UvhKobnZbJqGkq/W7tYr5vlb/1B8pg1
 Sl/A==
X-Gm-Message-State: AO0yUKUFx1y3VJ/xYOtOItXe/ZO/JM5Z0Co5OAahot0gborz42AWeTKh
 0kdapBP3OcVJJMv3bE4P9fGkCSmcCbrFdg==
X-Google-Smtp-Source: AK7set+05AH8IETcKREqEOk1ttREwyvsBxBrU9//DWt6Pq9vmP0TuL7Cim7wFDWMMQ+X/C8NoVEwhQ==
X-Received: by 2002:a05:6e02:1a6d:b0:313:c82c:1a9e with SMTP id
 w13-20020a056e021a6d00b00313c82c1a9emr2584444ilv.1.1675691322801; 
 Mon, 06 Feb 2023 05:48:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q22-20020a02c8d6000000b003be862e0dfasm2395198jao.125.2023.02.06.05.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:48:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 06:48:38 -0700
Message-Id: <20230206134838.3397457-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jFk1zquuoh3yL2tLFwbN14151xx0qULveLRKypdjcr0=;
 b=ZT0PB1JztbmJlrXfQ+aYYHbSKqF9PLehw/69b9kTujPT8xIsknbeSY6DzNlOuu//wW
 +4hMUBrtYZW6tBMXN9j1Y0WmrNEATpaKGQIiY4OfGPfWJXlXZ/oXFaSPDiFTYf2WJCEy
 yFOJScciHyPgsPOd5fCduRFF6u6vNav6lkxrXdXwVxz72n1IYMIiHsVzR8hzmZsTxoEb
 mw999UqeqI5cV1BzJEeaYfWYM7n0qAh9iYJm8WiWAxRQN7Gv/gbNB7j8rRFQnGfI6/J7
 jklKSgp3aJ+0r41J9YvTCECjxZuxnDleWcZurkDBHphmq598NEEd4vjAkODgePSKH8ZI
 Iwdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZT0PB1Jz
Subject: [Buildroot] [PATCH 1/1] package/python-h11: new package
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
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/python-h11/Config.in       |  7 +++++++
 package/python-h11/python-h11.hash |  5 +++++
 package/python-h11/python-h11.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-h11/Config.in
 create mode 100644 package/python-h11/python-h11.hash
 create mode 100644 package/python-h11/python-h11.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97c28fbdd8..5d788ecebf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1381,6 +1381,7 @@ F:	package/python-flatbuffers/
 F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
+F:	package/python-h11/
 F:	package/python-hatchling/
 F:	package/python-hatch-fancy-pypi-readme/
 F:	package/python-hatch-vcs/
diff --git a/package/Config.in b/package/Config.in
index 7817b51fc2..b6211f1102 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1071,6 +1071,7 @@ menu "External python modules"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hiredis/Config.in"
 	source "package/python-hpack/Config.in"
diff --git a/package/python-h11/Config.in b/package/python-h11/Config.in
new file mode 100644
index 0000000000..736620d782
--- /dev/null
+++ b/package/python-h11/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_H11
+	bool "python-h11"
+	help
+	  A pure-Python, bring-your-own-I/O implementation of
+	  HTTP/1.1.
+
+	  https://github.com/python-hyper/h11
diff --git a/package/python-h11/python-h11.hash b/package/python-h11/python-h11.hash
new file mode 100644
index 0000000000..0c65a11d00
--- /dev/null
+++ b/package/python-h11/python-h11.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/h11/json
+md5  84c33fc0aa1f868928114c4d02c43dc2  h11-0.14.0.tar.gz
+sha256  8f19fbbe99e72420ff35c00b27a34cb9937e902a8b810e2c88300c6f0a3b699d  h11-0.14.0.tar.gz
+# Locally computed sha256 checksums
+sha256  37db5bb85926db28a427a25867f10b1232003aea1be69ccb851138adb8e6f361  LICENSE.txt
diff --git a/package/python-h11/python-h11.mk b/package/python-h11/python-h11.mk
new file mode 100644
index 0000000000..d7dca5244b
--- /dev/null
+++ b/package/python-h11/python-h11.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-h11
+#
+################################################################################
+
+PYTHON_H11_VERSION = 0.14.0
+PYTHON_H11_SOURCE = h11-$(PYTHON_H11_VERSION).tar.gz
+PYTHON_H11_SITE = https://files.pythonhosted.org/packages/f5/38/3af3d3633a34a3316095b39c8e8fb4853a28a536e55d347bd8d8e9a14b03
+PYTHON_H11_SETUP_TYPE = setuptools
+PYTHON_H11_LICENSE = MIT
+PYTHON_H11_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
