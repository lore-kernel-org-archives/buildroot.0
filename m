Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6AFC10DAA
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA20817B1;
	Wed, 29 Nov 2023 17:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA20817B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7u6hwFhkUXD; Wed, 29 Nov 2023 17:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E398439D;
	Wed, 29 Nov 2023 17:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E398439D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF281BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED2A661528
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2A661528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FsqrNf-ykMX for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:44 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B15D614FA
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B15D614FA
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a00b01955acso1154066b.1
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278802; x=1701883602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HWawlexnHiTp6b9J5WiHhSLNOsnjH3AEIgwU8QXA0kE=;
 b=XhcpMZ0upoqjPW3+bjl7HlccM851I8hESKnPb4z7QYk/Os8C8xS9+aqbBTpwhrd3Pq
 sk6xV9HrAYQ5wQ/ICEy9QPTQq4lhCPMRwLQ3qNxKEaXPBbmiLwBrFsqhV9bCpTBuGe3j
 D19kt/jtnfSYfQDuvNRhlyHwbzTnMwxaz/qF9QNf6WNmEI/Yu5AISbPvv/KgAA7Q0GfF
 afS2QuXaB4VpzazdPt//HENzzBjaFf8+1qAPFC1nL9dHMUmBHRgju8jk7Ff1p7oYojEn
 PL8uTzy9CGrWY48l+hT4qfQVxF9sABQZSIGIP0jxHqvFLMZ4zggU1vpXZpfogC9uQc9o
 mlPQ==
X-Gm-Message-State: AOJu0Yz9Q3QzcxcL1HnFDJVSX98rb7jn633U6F+UIR6yXAFJSwH5bT/u
 5VqmLkPbJ+DO0zNzoKtIEnW42eGUKLalQQma7yNMzw==
X-Google-Smtp-Source: AGHT+IGmlR0/GIsZcU8mCltYkdEymervM/Hkl1c8vCHJQpFWXtuDUrLioJ279FXncCrglZ8swBWa3g==
X-Received: by 2002:a17:906:73ce:b0:a11:4dc3:d0c5 with SMTP id
 n14-20020a17090673ce00b00a114dc3d0c5mr6720024ejl.48.1701278802242; 
 Wed, 29 Nov 2023 09:26:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:09 +0100
Message-ID: <20231129172615.1683565-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278802; x=1701883602;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HWawlexnHiTp6b9J5WiHhSLNOsnjH3AEIgwU8QXA0kE=;
 b=ImMyrBbQfokk+0X7UVpE7EID+ih8zsHjzaAof6IFM7r/vRea5GMpL8wpyFFcO2Yr3g
 al43u6+FmAaxl7Iz4o4kXsFfGolAXYw6h0WJBhM9dP/h5CT+Xl85dD76mVMxwchutCw7
 wiy+gM4qXoAQBACFfGDBvLdw5ZTx4ozhVT158=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ImMyrBbQ
Subject: [Buildroot] [PATCH 05/11] package/python-referencing: add host
 variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host                           | 1 +
 package/python-referencing/Config.in.host        | 6 ++++++
 package/python-referencing/python-referencing.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/python-referencing/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 5f9dbd3c71be..56299184eb40 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -90,6 +90,7 @@ menu "Host utilities"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
+	source "package/python-referencing/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-referencing/Config.in.host b/package/python-referencing/Config.in.host
new file mode 100644
index 000000000000..78fc8294f2a5
--- /dev/null
+++ b/package/python-referencing/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_REFERENCING
+	bool "host python-referencing"
+	help
+	  JSON Referencing + Python.
+
+	  https://github.com/python-jsonschema/referencing
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 4d11c99deb3b..9d8fc5a2f541 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -11,7 +11,14 @@ PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
 PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-attrs \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
