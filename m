Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C78C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 09:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9854405B1;
	Thu, 14 Dec 2023 09:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9854405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU3QjxoMmVBw; Thu, 14 Dec 2023 09:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 753E6436EE;
	Thu, 14 Dec 2023 09:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753E6436EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B40461BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A06761AF3
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 09:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A06761AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIvIswnZbJaw for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 09:15:08 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EC7461AD0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 09:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC7461AD0
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35da93ba227so30448425ab.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 01:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702545307; x=1703150107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wiJt/NhRTpI7ee708ryglBflGNCkRNQtHtNnyAOQbcs=;
 b=eStpSO8z7wsqRPvLR69cZ/nQrpjE0zRHdrhAsbDT5I8tlr9ONeLomtgQJh1CkQnOo1
 OlxhHLCOvHUg+T5l7MvNmyvZ4fnqyQ5MEugaF87z6tqAZugg2K8QrD8i0a/vHwURdCG6
 v2NqWJGExoBXIxh6n27S6CJBvhZUZIrYuzkOOgEP1Qt7I6oGgHjjt/ziQh9TACm8cMOd
 0fmJqFaD296UzcVr3tFgEPbZji+4X5gHm8rx8ZfFUmcP9kFzA0hmul9CoR6zTvEU4bTA
 d/3lLkl4dWsUPsbnL1H24Lqt2jdxRm+E6d+6KW5icPlBfX3iLHT9udcqy1piSSHb/XET
 9+2g==
X-Gm-Message-State: AOJu0Yzl+lgly3xl40hAtnhBpPzgnqeFXUkGzdhZArs20zJiy17lhaYn
 6moCrulnD022NMk3/lu4jFAEFUlvQJK3EA==
X-Google-Smtp-Source: AGHT+IHgmN/d43288wHuCqQiX9Mk+NRa4Otq8+3bPiuT9z9qpIb5JxO7xNByIs8rfqqpZOlhAye0Ow==
X-Received: by 2002:a05:6e02:1c46:b0:35d:6034:8652 with SMTP id
 d6-20020a056e021c4600b0035d60348652mr9278392ilg.15.1702545307153; 
 Thu, 14 Dec 2023 01:15:07 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 db10-20020a056e023d0a00b0035af0c79e23sm103446ilb.40.2023.12.14.01.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 01:15:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 02:15:02 -0700
Message-Id: <20231214091504.101102-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214091504.101102-1-james.hilliard1@gmail.com>
References: <20231214091504.101102-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702545307; x=1703150107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiJt/NhRTpI7ee708ryglBflGNCkRNQtHtNnyAOQbcs=;
 b=cim6yOqactYWZD5fKXzDNMMPdhaWBjsyX1t79W0g0JmwOqoKyF85/JJ126jPljslWd
 G9M+Hcn/bBfksF1GmfgnD5hNA66AjN79A5OEDyqz1N/qbsBEPgNWuB0lRI0JqpbI2QmG
 XxOQESgR6d/sutBbTisWAU1eBxtzTr2M8vsO0Y+/wahQfa4sv9Btw2SsyWnzGFpVYsTk
 GBtGa1Jgkjn0p5I4GuP2rKU/Ply7ZR2nGUtTdh3eMmFbCXIPbhhgchHfEpAIsT0YZfJ4
 jdMeMl6o+zm20ZrHAjgiOH9yHvO2UV7AQ+SNusRCJ+7UBjKWoKkwJKMtCzCj7L9r4dG5
 6Lsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cim6yOqa
Subject: [Buildroot] [PATCH 2/4] package/python-aiosqlite: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                              |  1 +
 package/python-aiosqlite/Config.in             |  6 ++++++
 package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
 package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-aiosqlite/Config.in
 create mode 100644 package/python-aiosqlite/python-aiosqlite.hash
 create mode 100644 package/python-aiosqlite/python-aiosqlite.mk

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..d24db2550e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -971,6 +971,7 @@ menu "External python modules"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
+	source "package/python-aiosqlite/Config.in"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
new file mode 100644
index 0000000000..950c879a49
--- /dev/null
+++ b/package/python-aiosqlite/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_AIOSQLITE
+	bool "python-aiosqlite"
+	help
+	  asyncio bridge to the standard sqlite3 module.
+
+	  https://aiosqlite.omnilib.dev/
diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
new file mode 100644
index 0000000000..e06061346c
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
+md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
+sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
new file mode 100644
index 0000000000..e513d53c02
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiosqlite
+#
+################################################################################
+
+PYTHON_AIOSQLITE_VERSION = 0.19.0
+PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
+PYTHON_AIOSQLITE_SETUP_TYPE = flit
+PYTHON_AIOSQLITE_LICENSE = MIT
+PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
