Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B0BC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9F9822C0;
	Wed, 29 Nov 2023 17:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9F9822C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XmJnQCrjfpD1; Wed, 29 Nov 2023 17:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927B1822CE;
	Wed, 29 Nov 2023 17:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 927B1822CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C671C1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EE6D41B27
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE6D41B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwYns1Pmpet2 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:46 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EDA44193E
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EDA44193E
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a00a9d677fcso3062966b.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278804; x=1701883604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nI/BEu019BM18nMLF0zIVPhMK/Y+yo/p7gYH5Je3T1Y=;
 b=QTJsCwiMIN3Ge6m+fpMtciEbJiBwi8KAUu4Kh+dKeg2CPfllkOAyrVGtB1l/VNdQam
 UM15DuK204aoAM3CS49aLe9nRy75tyHjMge3P+q7Q4BrkWxaglNc+RtJZ65BfY+MXcU9
 X2FIZjjHm/xSxSEsVOQ3XBbVmV2yO8M73WJ1iOpvRiF3kF/MbpDsy+SXni4tGn4Uz3sa
 qnTwue522Sy3vLpMWePX1DcIyYp+AQZxFRizKg9eumUAHC/n17MzwqW3pvAyrZl7WRsd
 XyOHqZv8iGbffKhBx7F1DdWPf5Hq+bYX2nRwuFNj5xMNzBvhJGKjn5M3+Y+yro7zbHBj
 ehjg==
X-Gm-Message-State: AOJu0YwSv4QirP/FrSTokMHqxut2kt/593eGJ2PLEmEranPHE2brUFfZ
 YqvFu9zzfFLWrdLOufI1tb7QZJ9DShvVbQoyCO0PLA==
X-Google-Smtp-Source: AGHT+IF0cHjhYhrRUjzQ07cN6dYTKBxvbk+vxmvj4iUxlFsH/yYAZevco7yz5K5CqICdH2OKbukUrA==
X-Received: by 2002:a17:907:1687:b0:a12:9aa8:c560 with SMTP id
 cx7-20020a170907168700b00a129aa8c560mr4094044ejd.59.1701278804546; 
 Wed, 29 Nov 2023 09:26:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:11 +0100
Message-ID: <20231129172615.1683565-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278804; x=1701883604;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nI/BEu019BM18nMLF0zIVPhMK/Y+yo/p7gYH5Je3T1Y=;
 b=aXo65n8Ln2WJ8qrpN3exvWC/L/BZgPbmt9V04EpKphbMrQipp5PqeuLj9NHsAVvkbM
 yaHAJybieWrUqUgpdDX1pm5N+VavgM0W97gC53G4lydVisBcFC7LM2Nb+XXsYlFY6SEb
 x//PKDt0XiEcVuL1Mal2HizOgAh7aOWL3bgjo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aXo65n8L
Subject: [Buildroot] [PATCH 07/11] package/python-jsonschema-specifications:
 add host variant
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
 package/Config.in.host                                     | 1 +
 package/python-jsonschema-specifications/Config.in.host    | 7 +++++++
 .../python-jsonschema-specifications.mk                    | 5 +++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/python-jsonschema-specifications/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 1b2af6cbf0f2..27237639ada1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -87,6 +87,7 @@ menu "Host utilities"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
 	source "package/python-jsonschema/Config.in.host"
+	source "package/python-jsonschema-specifications/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
diff --git a/package/python-jsonschema-specifications/Config.in.host b/package/python-jsonschema-specifications/Config.in.host
new file mode 100644
index 000000000000..903b4c4d98a2
--- /dev/null
+++ b/package/python-jsonschema-specifications/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS
+	bool "host python-jsonschema-specifications"
+	help
+	  The JSON Schema meta-schemas and vocabularies, exposed as a
+	  Registry.
+
+	  https://github.com/python-jsonschema/jsonschema-specifications
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 7a19eee4236f..a20045f316b2 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,9 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
