Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D59C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 17:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB81E4064A;
	Wed,  7 Aug 2024 17:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYbg4whEh--U; Wed,  7 Aug 2024 17:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2644063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C2644063C;
	Wed,  7 Aug 2024 17:38:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BECE71BF30E
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B839E8123C
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 17:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIpz0rbIoSMe for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 17:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B467581181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B467581181
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B467581181
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 17:38:27 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-39b3754468eso420505ab.2
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 10:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723052306; x=1723657106;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8KAEoHnXoKSLb5unKoPuX20Czt4ElrcQiXighwGWmbk=;
 b=kBuOuhufedjDT/9kZ4xcWpJVVu3vKjdyIbItlQ6Gbwo2OVP/yYzK5CEM8fDK4rR5sp
 inXlDKJZU89xs6ozm1OT4fthpmKnPHqzX+mQxyOGcn2kRPMRTdWS0mfRriEndb9DuCZS
 IPZOgu/eZfbX1rmyYb1fQC4R4WQROqKub097Z5Pl6a8qoBkL02g4YG5dUjTp3zHK9B60
 JIw8hQM05+bpIrAacOlDV8ZHssqkei5i30RIxYpmTxeQLjdzHu+y++y5f+nTTfYMZi9h
 t7u44JxNnX6Jor0O629vP2Fom5lpV4tOYEOPoRYRNRIq2zytpjKgrs9WSeaiSCMaZesn
 9Jdg==
X-Gm-Message-State: AOJu0YwYzDBWg6CaHUS1gNRAck5yTDwS4+ssMRMPjXla5OwX3wnf4W/s
 4867FzOWTcU9m/785xYYKHwN5Pxo4HrouMjm0OdJKbaL13IYyumz8tNblfcc
X-Google-Smtp-Source: AGHT+IHm6T2Ev9kDtcfqOY26zKw3T8+dYR9xi3NH95ZcX5HOYVTYeSeJc5nRNmZnrEfZ4GUG93JSzw==
X-Received: by 2002:a05:6e02:214b:b0:39b:32f6:5e90 with SMTP id
 e9e14a558f8ab-39b32f65ed5mr180263055ab.15.1723052306348; 
 Wed, 07 Aug 2024 10:38:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39b20af1534sm46305695ab.74.2024.08.07.10.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 10:38:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 11:38:23 -0600
Message-Id: <20240807173823.4146352-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723052306; x=1723657106; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8KAEoHnXoKSLb5unKoPuX20Czt4ElrcQiXighwGWmbk=;
 b=MnL5cs+aIbo3WqkDOTMbvo05pyj8u4T6W9KGvwnQw9Rr1nhxGI0cawaByWvwqsUq+h
 UJOYvoLY6gG0/OQhL8Z1L4Hqd6KXHRyP3CpHzfzFor9qmpoBttlEfBLofUyKZvKaNaxq
 bYGwNkWXSfDXplD5bVxy+hix5ILaBVWwyz1S6uGU+TKPjlQ3FTERr9DuxcWBpwDwsLPv
 +ag1Eaz+JvLE4qFI5P/InM0dV15JofvVr2m2ZHN1LJJtB0rZJUc653QGVZqVlOvgY1xG
 vy+W6RtOMlNOzQ0mF8PP8h4EaKCtW4Ot+cE6X7l6T3PkfNFPRQMWogzDsShIANbcDIU9
 YORw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MnL5cs+a
Subject: [Buildroot] [PATCH 1/1] package/python-tomli-w: new package
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
 package/Config.in                          |  1 +
 package/python-tomli-w/Config.in           |  6 ++++++
 package/python-tomli-w/python-tomli-w.hash |  5 +++++
 package/python-tomli-w/python-tomli-w.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-tomli-w/Config.in
 create mode 100644 package/python-tomli-w/python-tomli-w.hash
 create mode 100644 package/python-tomli-w/python-tomli-w.mk

diff --git a/package/Config.in b/package/Config.in
index 0472ec2daf..f2c63ffb6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1408,6 +1408,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
+	source "package/python-tomli-w/Config.in"
 	source "package/python-tomlkit/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tortoise-orm/Config.in"
diff --git a/package/python-tomli-w/Config.in b/package/python-tomli-w/Config.in
new file mode 100644
index 0000000000..83fe937eba
--- /dev/null
+++ b/package/python-tomli-w/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TOMLI_W
+	bool "python-tomli-w"
+	help
+	  A lil' TOML writer.
+
+	  https://github.com/hukkin/tomli-w
diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
new file mode 100644
index 0000000000..778c22583a
--- /dev/null
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli-w/json
+md5  2c050134d4842b449ec4129c97d51e62  tomli_w-1.0.0.tar.gz
+sha256  f463434305e0336248cac9c2dc8076b707d8a12d019dd349f5c1e382dd1ae1b9  tomli_w-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
new file mode 100644
index 0000000000..d5d7ab9f2c
--- /dev/null
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tomli-w
+#
+################################################################################
+
+PYTHON_TOMLI_W_VERSION = 1.0.0
+PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/49/05/6bf21838623186b91aedbda06248ad18f03487dc56fbc20e4db384abde6c
+PYTHON_TOMLI_W_SETUP_TYPE = flit
+PYTHON_TOMLI_W_LICENSE = MIT
+PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
