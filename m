Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E01CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C9660F0F
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57C9660F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AD5D403D1;
	Mon, 11 Oct 2021 21:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5i4F7jk92k4; Mon, 11 Oct 2021 21:23:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0245B403D3;
	Mon, 11 Oct 2021 21:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F03BC1BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF8A2608F2
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGh2_6EhxB_F for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:21:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B756608EB
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:21:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id o83so18917890oif.4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQ7WohD2LKnP825c78LKSlI5ZeG+CjHaKk6qSV7DmbI=;
 b=HyUwOnbYN6MIg2urV3mPgne6RcvELgbNlJrqMKhn3bpHzo3NAPiRxh04s5jdKyUXcR
 keLjokvGyf7EL6L7HzEWXBKQE8JRl10zIDTqyagRI7maOBA8i0HdtUP8CdnnVJHfkWzI
 NzR8hoEm4wXZaZ190u1tgPWAtcqYfiU/g8LYOFnQO2fXYebcMOo2keQ28TdcWS9FmrKk
 B9bir6zenefjJYcQltAHHYX5dfKDj5+rytqyAbtRhdLZjMmZKFupzR/Q+SqmKGczGYpH
 fkVYyv9ExmQ5k/qk/Kwl9byVY/lPD57if9lyBejtUeY0gv2OqZ/k+uZ3Wr0nSYE7iSqZ
 iwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQ7WohD2LKnP825c78LKSlI5ZeG+CjHaKk6qSV7DmbI=;
 b=l2oyxDElSWEz4/Uz7pPNyobXE37IaYeIgxuAzKY0NjFtMOO2MjGiQQApASw7nPG5jA
 7beRetvt0B/oCufvhGwfRBqTIHwb9dor8TDA8U+T195WqwgHoSmrMfcIhEcBIg6oK10Q
 4yCL/64EaxC5owIYPicyiC/TdzJtCB2ryT3+H58BbyWigSRLRqPHZGQN1rQf22CRZHm/
 lALLryxl0kvrKHPShAa1cYDQuMWAcOX5E91tG0D89nr5Ra8YBUK4lehyJPO5X38IuGEB
 /Ix994A+aX7Xg4oPCweSyOm9wk3GjL+hTkuogRDilrogiiZ2C8fwQy7pFV5ZaNXAWiuB
 LW4A==
X-Gm-Message-State: AOAM5319rKfaZQzPjXnGkI0Qk/B0KZ07RE/Vl4Gt2stJ+qRlUCbnmdMn
 JMj6bj7k7gVxOc6SeeoomLeTn3s9wO1+Hf4G
X-Google-Smtp-Source: ABdhPJyNGOISGbHyb8EVuWQq8H789ALYqjq3v6Jg+oO+z8icEGZbF80qTn0YUaN0D0fUkRBejfY4+Q==
X-Received: by 2002:a54:4005:: with SMTP id x5mr955331oie.103.1633987308952;
 Mon, 11 Oct 2021 14:21:48 -0700 (PDT)
Received: from localhost ([189.174.209.191])
 by smtp.gmail.com with UTF8SMTPSA id p14sm1722819oov.0.2021.10.11.14.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:21:48 -0700 (PDT)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:21:24 +0100
Message-Id: <20211011212125.402086-2-glex.spb@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211011212125.402086-1-glex.spb@gmail.com>
References: <20211011210241.396390-1-glex.spb@gmail.com>
 <20211011212125.402086-1-glex.spb@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/2] package: add stormlib
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

StormLib is a library for working with Blizzard SMPQ archives.

StormLib is a runtime and/or build-time dependency of several
source ports / reimplementations of Blizzard games, such as DevilutionX.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/Config.in              |  1 +
 package/stormlib/Config.in     |  8 ++++++++
 package/stormlib/stormlib.hash |  3 +++
 package/stormlib/stormlib.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/stormlib/Config.in
 create mode 100644 package/stormlib/stormlib.hash
 create mode 100644 package/stormlib/stormlib.mk

diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..2b561e6eaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1360,6 +1360,7 @@ menu "Compression and decompression"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
+	source "package/stormlib/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/stormlib/Config.in b/package/stormlib/Config.in
new file mode 100644
index 0000000000..b2e4df3c62
--- /dev/null
+++ b/package/stormlib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_STORMLIB
+	bool "stormlib"
+	select BR2_PACKAGE_BZIP2
+	select BR2_PACKAGE_ZLIB
+	help
+	  StormLib is a library that reads and writes Blizzard MPQ archives.
+
+	  https://github.com/ladislav-zezula/StormLib
diff --git a/package/stormlib/stormlib.hash b/package/stormlib/stormlib.hash
new file mode 100644
index 0000000000..dc5370b03d
--- /dev/null
+++ b/package/stormlib/stormlib.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  53b8befda3855a922e57a27f78c36feba7e9a32804da4b6592a3670c4e9cec98  stormlib-5ab093b7a57b8779dff06a08fac19d46c40b3329.tar.gz
+sha256  50b128e6750ed9d887e7a5748a6021238bb2f3bf34a5dd2768c410d932069e35  LICENSE
diff --git a/package/stormlib/stormlib.mk b/package/stormlib/stormlib.mk
new file mode 100644
index 0000000000..f2f7522002
--- /dev/null
+++ b/package/stormlib/stormlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# stormlib
+#
+################################################################################
+
+STORMLIB_VERSION = 5ab093b7a57b8779dff06a08fac19d46c40b3329
+STORMLIB_SITE = $(call github,ladislav-zezula,StormLib,$(STORMLIB_VERSION))
+STORMLIB_LICENSE = MIT
+STORMLIB_LICENSE_FILES = LICENSE
+STORMLIB_DEPENDENCIES = zlib bzip2
+HOST_STORMLIB_DEPENDENCIES = host-zlib host-bzip2
+STORMLIB_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
