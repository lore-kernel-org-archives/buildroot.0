Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F070C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE7680584;
	Thu, 14 Dec 2023 19:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAE7680584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvoSJyp8OdC9; Thu, 14 Dec 2023 19:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF51680C1D;
	Thu, 14 Dec 2023 19:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF51680C1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5D21BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD72A83BF4
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD72A83BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urXKCvTqVbDz for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:46 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDE2F83BC5
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDE2F83BC5
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35f54ebbe01so14970985ab.0
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581885; x=1703186685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33Y3LTVQw2Y3X6uVADnAH46hY068uX0CCXzU2Kiz2cQ=;
 b=GIm+D0xx4banrnP5r3cpiLVZnZGxOBaxSD7bPVTEV7kobzZTd82qtGXneAS5m+ZaSB
 QoWl/cNEDDUzuaJsf1aU9MiUhgFIGQf6emekY4UHfsG2aMBtoOcdYPaeff0AVlJ0I364
 d5mNxFWsMi1TIF8J9PZ+xJ49MY6w7RDN1Z5QfrHo44IKOUXC7W6U+jpekUWGn3ArC1rx
 dtupPLeidqmy2DAxRsSF10H2eM1kFQrWbO2CpoSBeGTpvPystR7T5+pwtukv99YwjOcr
 GnPFCrqL3cTpzMVW6zdIrsO3tco9x02WGHXkYoM2WD4svnmTvZwNS2BbtrlAhYhfdDh9
 Y2dg==
X-Gm-Message-State: AOJu0YxWngDDQECRfjyuepKbejZ1IWcF+iFUlaY+fL7jhmLzP0LAwyhR
 RbzOtMnFyXNjZerLy+Xw21hToYLQJkibMw==
X-Google-Smtp-Source: AGHT+IHF0q2fbFZa89E7suB9pxBBjv/VA/u+UWgcmGc5wtF0ydaNgoW6igObI/c8y1AWDinRNyOXMg==
X-Received: by 2002:a92:ca89:0:b0:35f:772b:b89d with SMTP id
 t9-20020a92ca89000000b0035f772bb89dmr2645049ilo.62.1702581885390; 
 Thu, 14 Dec 2023 11:24:45 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:36 -0700
Message-Id: <20231214192439.259156-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581885; x=1703186685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33Y3LTVQw2Y3X6uVADnAH46hY068uX0CCXzU2Kiz2cQ=;
 b=Hl5RCgZFcI29OYkLcz7/FFqenLPMnWwwTUPWnHU2FcfwRYhJVTxJr5yBCZ7GoS+aG5
 5HvsAc2caVIH/j1dSOqzLwUatbgUl3WfEGnwlebq2uJJAHHWJ9LtIYvIP0xrJjjIMSQG
 NPXpSYPNZzvnbs+zoAkkOKG/jDvZctRzqaoQVCGCru8E1jBeOhPeVVGtj5OH0GrfdbKV
 zWkSdtPah4NAbsWyIi/qsFTM2NE/+MIqp6KNga6upz38RQZsL5ZXfJqj1OF1+y07l5L0
 JlnStaP/Pkle8ACVoH0tVSK7jZ/6R0Oj/OJfm5G4Gc9d4P/Ui7z1lP/XwNjKYdi3sa8X
 3Clw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hl5RCgZF
Subject: [Buildroot] [PATCH 4/7] package/python-google-auth: new package
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
 package/Config.in                                  |  1 +
 package/python-google-auth/Config.in               |  9 +++++++++
 package/python-google-auth/python-google-auth.hash |  5 +++++
 package/python-google-auth/python-google-auth.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/python-google-auth/Config.in
 create mode 100644 package/python-google-auth/python-google-auth.hash
 create mode 100644 package/python-google-auth/python-google-auth.mk

diff --git a/package/Config.in b/package/Config.in
index 21f711c456..8bc18e9b5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1093,6 +1093,7 @@ menu "External python modules"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-google-auth/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
diff --git a/package/python-google-auth/Config.in b/package/python-google-auth/Config.in
new file mode 100644
index 0000000000..eb5be9cda5
--- /dev/null
+++ b/package/python-google-auth/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_GOOGLE_AUTH
+	bool "python-google-auth"
+	select BR2_PACKAGE_PYTHON_CACHETOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_RSA # runtime
+	help
+	  Google Authentication Library.
+
+	  https://github.com/googleapis/google-auth-library-python
diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
new file mode 100644
index 0000000000..2f965edc91
--- /dev/null
+++ b/package/python-google-auth/python-google-auth.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/google-auth/json
+md5  40413bc699c6e02d7732e7e09e8cec0c  google-auth-2.25.2.tar.gz
+sha256  42f707937feb4f5e5a39e6c4f343a17300a459aaf03141457ba505812841cc40  google-auth-2.25.2.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
new file mode 100644
index 0000000000..8638a2ca46
--- /dev/null
+++ b/package/python-google-auth/python-google-auth.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-google-auth
+#
+################################################################################
+
+PYTHON_GOOGLE_AUTH_VERSION = 2.25.2
+PYTHON_GOOGLE_AUTH_SOURCE = google-auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/05/77/84608894384e02f3b0b2621b09ecb0b85e57ba368f13eecbbc43cd1b8719
+PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
+PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
+PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
