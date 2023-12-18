Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58D9C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F5F4096D;
	Mon, 18 Dec 2023 19:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F5F4096D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ytt-GgwuemtE; Mon, 18 Dec 2023 19:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D1B4094B;
	Mon, 18 Dec 2023 19:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D1B4094B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 685971BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EF3040463
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF3040463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rg6RPd9qHVDm for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:54:10 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 324E7400AB
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 324E7400AB
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d337dc9697so29785355ad.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702929249; x=1703534049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CNIQxnEFXDLMKWBNALg6Iqp/mGL/IozaHs68172BwbA=;
 b=iqiaQfSgGATFRHbjL9QM1HaWWXSx7P9FDHWxiq5ojrOk4xurGUtYFC33RGUn4J3oSo
 DkIU30XrOwUW41n3W19duXBvReLFHvrQ0Dv/q+gg1TWpDP5BGBBF1MuCehXSA5j7l9Zi
 kWWJcSiy8jesBaTaLSRaZG1hJwc9dAkZzZPynCbWcXbMCZvCWfYWJoGR3sWzk4uuKNpD
 4SYvDTJ1MBEvnKk3PL7t2EpdRfvJh+1M+0rcfAsHdLH1duLzAD6jMlLQjqS3l6cx0Iu5
 7+klS9FZncNow+zeXmdPjO+KxmG+XJFsqAQV+mZIK/2wZ1lilM3knQY3zJpwlQ2WFstz
 OjMA==
X-Gm-Message-State: AOJu0YwM2w4QwVGs5e5/bLttuT8zhbQy4tstgBHlL8Nm6TrrN0ZX3rOE
 LUqA0IcOFNIOAp1kaOlpstubkrlBPhB+8+gRNlc=
X-Google-Smtp-Source: AGHT+IEVZfB0aDjcoegaoNKBqmf1W1vXrrjOn2P98Vgh6uzFp4gax6HYecd6N1HFSKbMFdF4gS4RTg==
X-Received: by 2002:a17:902:f686:b0:1d3:be14:372a with SMTP id
 l6-20020a170902f68600b001d3be14372amr2417550plg.60.1702929248693; 
 Mon, 18 Dec 2023 11:54:08 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a170902e80200b001acae9734c0sm2037283plg.266.2023.12.18.11.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:54:08 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:54:04 -0700
Message-ID: <20231218195406.553072-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702929249; x=1703534049;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CNIQxnEFXDLMKWBNALg6Iqp/mGL/IozaHs68172BwbA=;
 b=ZnhkrUgKFEB3FbXCtCakS4sufyzcXFej6e8m78u8G0HgBQee5jGhxVPFKR8I4M4EcZ
 Pb5PeSg28x3rFDgfmUjKYhjKKQSxA0jxqdZHepNBSzuNkGSyBNTTAr7Mr6myW2layk5J
 NHky5UEaElbHl2r8j++HLTXu1mRui6yyxD8vo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZnhkrUgK
Subject: [Buildroot] [PATCH v3 1/3] package/itstool: new host-package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Translate XML with PO files using W3C Internationalization Tag Set rules.
This is needed for the zenity package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                   |  1 +
 package/itstool/itstool.hash |  3 +++
 package/itstool/itstool.mk   | 14 ++++++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/itstool/itstool.hash
 create mode 100644 package/itstool/itstool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 311dcd9504..519ad2984e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/itstool/
 F:	package/python-kmod/
 F:	package/python-versioneer/
 F:	support/testing/tests/package/test_firewalld.py
diff --git a/package/itstool/itstool.hash b/package/itstool/itstool.hash
new file mode 100644
index 0000000000..937185ec2b
--- /dev/null
+++ b/package/itstool/itstool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fba78a37dc3535e4686c7f57407b97d03c676e3a57beac5fb2315162b0cc3176  itstool-2.0.7.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL3
diff --git a/package/itstool/itstool.mk b/package/itstool/itstool.mk
new file mode 100644
index 0000000000..d9aa016f50
--- /dev/null
+++ b/package/itstool/itstool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# itstool
+#
+################################################################################
+
+ITSTOOL_VERSION = 2.0.7
+ITSTOOL_SITE = $(call github,itstool,itstool,$(ITSTOOL_VERSION))
+ITSTOOL_LICENSE = GPL-3.0+
+ITSTOOL_LICENSE_FILES = COPYING.GPL3
+HOST_ITSTOOL_AUTORECONF = YES
+HOST_ITSTOOL_DEPENDENCIES = host-python3
+
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
