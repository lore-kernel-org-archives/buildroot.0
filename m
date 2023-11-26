Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1BCC4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 01:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB7AD400EF;
	Sun, 26 Nov 2023 01:19:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7AD400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiR7hmaTMc3o; Sun, 26 Nov 2023 01:19:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93EF7400F6;
	Sun, 26 Nov 2023 01:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93EF7400F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 344A61BF281
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13E8560A70
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 01:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E8560A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hpbi_s4lNmZQ for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 01:19:37 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A20A606BF
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 01:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A20A606BF
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7b35d846f36so104125039f.0
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 17:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700961576; x=1701566376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=BpYz08rymNbIrzug8oE0Bm1/mkA0BI6Tg1ALL+e4Y5kg941xmZ8Te/WX+ksNpF38RZ
 gRPoMCDt/mseAwT9ionmOBR8caalOrxeDu2vmtLYe9q/2ZWr9yl89wha5iboweUUyR+s
 8Goc5sYgA7yGgIw3ZZ/gd0CmpUrWv3TWrvRcEB0LUoSjwZOlFeJUs77SSyRKfiE2BuVV
 1u2tflYVGO2skl6gwHMxMJTLYiHBgnrv9fxPf/upNjazYBp1lBfWjuU3CS7u7X1PInvk
 e2OFYKQ2sz1tIQ0Fm1h3hOfsK56BxlAhLZPjOTMbbzSltCRvQOsgMIk05QlIceg714Y3
 YFbg==
X-Gm-Message-State: AOJu0Yw7v/A/kYjGXdSuV7Avhin6Q9Bcj/yVBBMgo03Uh5kXNaYXVOMW
 1YRf8AJbyvuSI54mSRo2+L2FFwAX5RI=
X-Google-Smtp-Source: AGHT+IHkmA3nh41dbvhOlLGxjETkDQGPaWaoa+l053B9YY6bQuDFCp1kiX98L1uRqisQ8BOPy2/zzg==
X-Received: by 2002:a05:6602:2bf2:b0:7b3:9687:ecf9 with SMTP id
 d18-20020a0566022bf200b007b39687ecf9mr1724349ioy.12.1700961576047; 
 Sat, 25 Nov 2023 17:19:36 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056638358600b0046674d6318fsm1585075jal.17.2023.11.25.17.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 17:19:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 18:19:28 -0700
Message-Id: <20231126011932.1380631-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700961576; x=1701566376; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=UhrJy4j73XqFzLKwrghatncoQ6Gy6kkohQ3azXMGRovDS3SJv39Myfr/EYUP0GBZTi
 bEmVUxpEVw+HilIhvcdIUlbeQcG21/XLeWRb5ffCYowg+2MZYm9Mw22RIzoo8dK3Floh
 S27RVh3iuC4kiIKwRQ5/DQ7XyQ9ndVug1jZGhL3NT+M/i/3uq6pzOdNldt9o7WuYgD4/
 KOP6CIjcGi5w9ELQYcS/c7+0csZOcFux+iuDT9VF7sT17oorpbSqoqK2PQBz6AxGyNHd
 Yc8hszRYNQzteyUIKj9igWw87joMN2bgykJGhvS/USMc7hZP3KmGHFdkp7sGxxK/8/iX
 A0hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UhrJy4j7
Subject: [Buildroot] [PATCH v5 1/5] package/python-poetry-core: new host
 package
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
Cc: Gustavo Heinz <gustavo@gsthnz.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
