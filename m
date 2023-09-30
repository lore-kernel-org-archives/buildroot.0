Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77F5E748A1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907AD4208E;
	Sat, 30 Sep 2023 19:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 907AD4208E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrYlAu4fExje; Sat, 30 Sep 2023 19:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64AA842179;
	Sat, 30 Sep 2023 19:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AA842179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7331BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 150334021C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150334021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ke-diZSwNDZ for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:28:12 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24C3F4013B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C3F4013B
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-690d8fb3b7eso13798196b3a.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 12:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696102091; x=1696706891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voOCzxZksolVO6V19GC2R/bukwtH1IT66HzUYRH/8rE=;
 b=qYIesjNwQBk+fk8L/WA/+fcnEeg/FI29nPBfNbbIpy5gu0YWiJ2QxXunEAY2qQc63M
 SSGfjgmM9xSTcn94Ya3orPzvgtYXIO+XvgSbLWUnOn5PK4UnrHCIhMBFGYX0UUMHc03N
 jF2zIlnUvYn//iNFl7wz69tJ2g7Ni/H8iHSGv5Li+vud4MBmfaYszTy32J1l2csO2dNk
 Gbd007xiHhxfx2H+/vvGrFbIxv7mWD4J7TRfkeD5HukUas1w1XqpNaKIfooSebvUFJ67
 WGa60tHaLvyCgHJ5+DuwpeHgnq981GzSpfE0d5tlJjiR7KGT0AMVQZOmBpPxhcozHunv
 dEKQ==
X-Gm-Message-State: AOJu0YziUVSu6HOayST/kkFsjJ4PnKM9BZVueKzURBp8hUf03jkO9C9B
 A8UJlubnA5v9OqBJe4E4gMn6fbDZ8QM=
X-Google-Smtp-Source: AGHT+IHNMFib6hrwNSgKTTomqgSVmOUkkMkQdQWn+H9SL2yH2gUdww1nhz1P6SOxrf0mMss1CJfsDA==
X-Received: by 2002:a05:6a00:198d:b0:68f:a661:d037 with SMTP id
 d13-20020a056a00198d00b0068fa661d037mr8641128pfl.3.1696102091489; 
 Sat, 30 Sep 2023 12:28:11 -0700 (PDT)
Received: from localhost ([2400:4051:e000:9e00:ff94:191c:6a3d:8b35])
 by smtp.gmail.com with ESMTPSA id
 j3-20020aa783c3000000b006933c582ed8sm6198838pfn.20.2023.09.30.12.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 12:28:11 -0700 (PDT)
From: Takumi Takahashi <takumiiinn@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 04:28:07 +0900
Message-ID: <20230930192807.863843-1-takumiiinn@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696102091; x=1696706891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=voOCzxZksolVO6V19GC2R/bukwtH1IT66HzUYRH/8rE=;
 b=CZFEoqtfIi9ak3gB3Jw7fDSuU9xeLmWKYtF0wS+al2gwwR48ugIhBwo/cUk3rWER4d
 ZafTFdoqi3QJbbaQVWK/+V9wf4vhvI6R1dSLtVFltKwieDR9q/hLcJIUsmGcLCbwmJCD
 I6pKMbclXvJjDqcnmTQzuZhOXCkBJUMi3mC1HaoazzZtv9LLMJsdR5X2CoO4RDj4MFZ8
 vBrWzLL2ms6aKEwsR9sHhJhaJPwh+7t3qazHUUQTWe3OyHw9nglf8i/kJS0uEwkujIq7
 b9J2QegwNp5hJVLoewRuXBzULUjLRt9FvlQ3XmGUpDnoMq+pbh+6MQ4mjh6xkb0uokhR
 F6Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CZFEoqtf
Subject: [Buildroot] [PATCH] package/iso-codes: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takumi Takahashi <takumiiinn@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ISO language, territory, currency, script codes and their translations.

https://salsa.debian.org/iso-codes-team/iso-codes
---
 package/Config.in                |  1 +
 package/iso-codes/Config.in      |  7 +++++++
 package/iso-codes/iso-codes.hash |  3 +++
 package/iso-codes/iso-codes.mk   | 17 +++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/iso-codes/Config.in
 create mode 100644 package/iso-codes/iso-codes.hash
 create mode 100644 package/iso-codes/iso-codes.mk

diff --git a/package/Config.in b/package/Config.in
index 58a7cfb914..d4a7a451fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2262,6 +2262,7 @@ menu "Miscellaneous"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
+	source "package/iso-codes/Config.in"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
 	source "package/netdata/Config.in"
diff --git a/package/iso-codes/Config.in b/package/iso-codes/Config.in
new file mode 100644
index 0000000000..ebc7cbdbbb
--- /dev/null
+++ b/package/iso-codes/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ISO_CODES
+	bool "iso-codes"
+	help
+	  ISO language, territory, currency, script codes
+	  and their translations.
+
+	  https://salsa.debian.org/iso-codes-team/iso-codes
diff --git a/package/iso-codes/iso-codes.hash b/package/iso-codes/iso-codes.hash
new file mode 100644
index 0000000000..476189c805
--- /dev/null
+++ b/package/iso-codes/iso-codes.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b83b54b9d7dd6eb877380b3ec46f370b05daf2cbfa131c612f03598d654c0ef8  iso-codes-v4.15.0.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/iso-codes/iso-codes.mk b/package/iso-codes/iso-codes.mk
new file mode 100644
index 0000000000..ecd1ce8612
--- /dev/null
+++ b/package/iso-codes/iso-codes.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# iso-codes
+#
+################################################################################
+
+ISO_CODES_VERSION = 4.15.0
+ISO_CODES_SOURCE = iso-codes-v$(ISO_CODES_VERSION).tar.gz
+ISO_CODES_SITE = https://salsa.debian.org/iso-codes-team/iso-codes/-/archive/v$(ISO_CODES_VERSION)
+ISO_CODES_LICENSE = LGPL-2.1
+ISO_CODES_LICENSE_FILES = COPYING
+ISO_CODES_DEPENDENCIES = host-pkgconf
+ISO_CODES_INSTALL_STAGING = YES
+
+ISO_CODES_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
