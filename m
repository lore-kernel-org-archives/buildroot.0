Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB01C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 16:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD0D83BCB;
	Thu, 14 Dec 2023 16:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBD0D83BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8NZN2Y54swiB; Thu, 14 Dec 2023 16:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11DD83D32;
	Thu, 14 Dec 2023 16:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11DD83D32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7BB1BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0372541E1E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0372541E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqwYVxPwOSKW for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 16:54:53 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F39B941D5F
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 16:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F39B941D5F
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7b71b10391aso307967039f.3
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 08:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702572891; x=1703177691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwsqZd8HvQs2H3Ca9KvKG7qSf2s4Z17ZNH2KVR72Bso=;
 b=RztHutHbkUCDGigfa9WwqjNqxtIfRwbp7+QA+Lr5zyn3EJU+qapYakkg6E4S1Pf3F8
 CtnDf+z76NUPisGwYmxFrWXpOAp50pXkzC3M+66+WSrnFFGIXfyHehhftbvmUg3efP1k
 OZqus0zMe1EN9upKJ9m6qDyOLnMingULnBkztHJ8LFxrl4KJ72Q679cvCjPAfZDQ3x09
 n2PE92r/7EAX98msnqCcXlIGMAG8HlHDux4YaYNr+4aeQlH1Z5j0sw9S1Dae9yZ+mAia
 jKfxTdw0ypLTLUzG32UDh2d0h72jZMBYwo9aNGSqphhtj2QaRr46Pkm69hSYchBiT7/n
 9pfQ==
X-Gm-Message-State: AOJu0Yx00CMYWMffXeo032BLh+h1OW/2wJxHY1m0KF2EP1lM9Syrj3g5
 m0mHSCGrimHaG2kEzRHUD+Ms8iqhuhWc7w==
X-Google-Smtp-Source: AGHT+IE6MKiX1+rcNRdPXcAJK9WJb7WqvZN6QccVnwNAyS4iLAK5xPmVIYOnihl9+OLt/0CAMqIFHg==
X-Received: by 2002:a5e:880e:0:b0:7b3:6b43:37ea with SMTP id
 l14-20020a5e880e000000b007b36b4337eamr7956991ioj.7.1702572891286; 
 Thu, 14 Dec 2023 08:54:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 u16-20020a6b4910000000b007b7372af699sm2912178iob.9.2023.12.14.08.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:54:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 09:54:19 -0700
Message-Id: <20231214165420.181703-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702572891; x=1703177691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwsqZd8HvQs2H3Ca9KvKG7qSf2s4Z17ZNH2KVR72Bso=;
 b=O+yV83mNDYYHQG5YmcTOVLeW2ss0qw+GcKNhIpdMTpsfVxFtqgqfvwclBTrPvpKtEW
 6O04o0g1xzW4SEDrn6oeElZMsiRx6kPT7a20sk0K+w1nTKZUOZPHMSX+MIFp2ugG5497
 yvwH19u19K2I4oXJqHoApYde5cMvQsY7n5hcHDi6G5YEVnEC7QeaoikGquNUusOwq7zw
 brvhXnxLo/+UL2rFgQ+a1hil2ABYk5wvEIqn5W/6CFB5lPJdH6zCU9My5/G2mjy+rkml
 EjoA3T7j9/3T6geV93vnULEXB5Qdr2Z5wW7PENwpt4mR8SPTpv+7ywPmElUiOB49krrj
 pajA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O+yV83mN
Subject: [Buildroot] [PATCH v3 7/8] package/python-httpcore: new package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                            |  1 +
 package/python-httpcore/Config.in            |  8 ++++++++
 package/python-httpcore/python-httpcore.hash |  5 +++++
 package/python-httpcore/python-httpcore.mk   | 17 +++++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-httpcore/Config.in
 create mode 100644 package/python-httpcore/python-httpcore.hash
 create mode 100644 package/python-httpcore/python-httpcore.mk

diff --git a/package/Config.in b/package/Config.in
index a0134fa724..b304ae8514 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ menu "External python modules"
 	source "package/python-hkdf/Config.in"
 	source "package/python-hpack/Config.in"
 	source "package/python-html5lib/Config.in"
+	source "package/python-httpcore/Config.in"
 	source "package/python-httplib2/Config.in"
 	source "package/python-huepy/Config.in"
 	source "package/python-humanize/Config.in"
diff --git a/package/python-httpcore/Config.in b/package/python-httpcore/Config.in
new file mode 100644
index 0000000000..d8c9083da8
--- /dev/null
+++ b/package/python-httpcore/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_HTTPCORE
+	bool "python-httpcore"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  A minimal low-level HTTP client.
+
+	  https://www.encode.io/httpcore/
diff --git a/package/python-httpcore/python-httpcore.hash b/package/python-httpcore/python-httpcore.hash
new file mode 100644
index 0000000000..1623573b65
--- /dev/null
+++ b/package/python-httpcore/python-httpcore.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/httpcore/json
+md5  155fbd7794ce7351b607d408cb8182bf  httpcore-1.0.2.tar.gz
+sha256  9fc092e4799b26174648e54b74ed5f683132a464e95643b226e00c2ed2fa6535  httpcore-1.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  fdcb59154c74cbaba16a11242f7740bea9f23d6feb5547917d8c5f94a80392a5  LICENSE.md
diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
new file mode 100644
index 0000000000..f1b3b810d7
--- /dev/null
+++ b/package/python-httpcore/python-httpcore.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-httpcore
+#
+################################################################################
+
+PYTHON_HTTPCORE_VERSION = 1.0.2
+PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
+PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/18/56/78a38490b834fa0942cbe6d39bd8a7fd76316e8940319305a98d2b320366
+PYTHON_HTTPCORE_SETUP_TYPE = pep517
+PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
+PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
+PYTHON_HTTPCORE_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
