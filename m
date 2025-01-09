Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EC6E77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1483606E0;
	Thu,  9 Jan 2025 20:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XA9FfDX3eGuo; Thu,  9 Jan 2025 20:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D43607AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D43607AB;
	Thu,  9 Jan 2025 20:11:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3563B940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 219E04048F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 70wRRq4a0ub9 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5793403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5793403B7
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5793403B7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:01 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a813899384so3859825ab.1
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453460; x=1737058260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5ikfgaOBVfp8+j+O4w0UFumET/J5T0QQ6A8TUyqlTc=;
 b=uofBWuw6hCnjsLU7zmfUWK0W1MTcvBR0m33DeDRBvjVh59LvATImwv5wnyYotyeNAh
 hRYNdbPUNeZIkqqN/gQYztVH99jQ0pM5/Yja9/+0Bl2w2Hed8Tn9/zS4E+Z8J7mmtvdx
 TImfy4zrZGeP9Ehx1yHDywXKRP/qGkSNa3nglE4XNkMMYprzMj772idQ1PIQIfcyHSe4
 qNzcYPWCANAFuG7eVoFKjhezdpfPhoOOJ7O2aJupAjsEgK4CHkhWvrlf/QZLIVUGfJuO
 ehguG2YSVoGDmM5IjgIuxy5dII2plzLO+mNKVwBmqZoGkWQVgdxZacG52KxXFzliV1M1
 K74Q==
X-Gm-Message-State: AOJu0YxuJxd8VNFHR4Bn7xvDXKI+EKA5GJDok965pn7ovdXYJioLRiES
 8TqGAUzhJNZxtEfNYRC0kOib8Eez1560feyG3gW/w6dK7XwDEqHR3RXP+UroXag=
X-Gm-Gg: ASbGncu8dEiCQM/ogqKFz24ywXvqaVjINlNPgd8Lz1KC1L2QB2I5Dq3yHPI5aFHk3n1
 V3CqGRd4Zso1N4KSFZx+vYOXohiGdR+8OQsXgjU4dw3Aw6sxgvOU5AASGpBj5fxijQ1lDYmiSED
 bUYCqx49wqDWiScJz8hf3AiXQb4uiHdkrXzWwEobFoNS9wZc0AYiNaYcbSwqxv67F4cLzJTfEzG
 yyBgn+f3Zd3ErDCRLxg0BG4FK5wJ9yGNxtPXcs2wrBT2f0tq2YEucyE9wmCdIDSeSgLXjsEJEx6
 vIdmTj6T0S0UZLCRpKT3wpduT+zt6+w=
X-Google-Smtp-Source: AGHT+IGhaxpB/zTttnY+a44ZUNbHUYCCc2PH4HTOFDvu85ZK+tp2iuF8eDPXqaJPOGI/I9MTGIBNOQ==
X-Received: by 2002:a05:6e02:1908:b0:3a7:635e:d365 with SMTP id
 e9e14a558f8ab-3ce3a93ed88mr58837645ab.6.1736453460455; 
 Thu, 09 Jan 2025 12:11:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm479399173.102.2025.01.09.12.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:10:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:10:51 -0700
Message-Id: <20250109201054.2382903-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109201054.2382903-1-james.hilliard1@gmail.com>
References: <20250109201054.2382903-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453460; x=1737058260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5ikfgaOBVfp8+j+O4w0UFumET/J5T0QQ6A8TUyqlTc=;
 b=YwlyuPOhRVZhML4vnuCVIzLMZvzxClOYVfZIgDZ6KhOYz44skd0Y2jx0lCADgRl48s
 7h4VwIjO57zlh1iqbu/PV1/UrSp/CwkHaAh36qlyqu8iMyFH4SLqXbR9tEVwI7mnLwx7
 Lcl6o7e8Evali8rRuA7HAP/N3dSuUq8j8OXPm1B4/PBvd0Nsc8R5fUsIUvGwhr+GBFyQ
 OamFILvCnMQtW3Uj/+h8Dnlc2ajSngHEgANyKzF0wSPFd3ttgEF8WyzIFZIecLsg9t8v
 F4vI6Tu5EkNAWiP3Th44BIONFK3aWEg0f6NeNsOogM/2XgWhEblZWPFV/ZqhhcFbnbu+
 7qKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YwlyuPOh
Subject: [Buildroot] [PATCH 2/5] package/python-types-setuptools: new host
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-types-setuptools.hash                   |  5 +++++
 .../python-types-setuptools.mk                     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-types-setuptools/python-types-setuptools.hash
 create mode 100644 package/python-types-setuptools/python-types-setuptools.mk

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
new file mode 100644
index 0000000000..de273aa77e
--- /dev/null
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/types-setuptools/json
+md5  8df05b03cbdda63e797f38543483138e  types_setuptools-75.6.0.20241223.tar.gz
+sha256  d9478a985057ed48a994c707f548e55aababa85fe1c9b212f43ab5a1fffd3211  types_setuptools-75.6.0.20241223.tar.gz
+# Locally computed sha256 checksums
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
new file mode 100644
index 0000000000..4c7df27139
--- /dev/null
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-types-setuptools
+#
+################################################################################
+
+PYTHON_TYPES_SETUPTOOLS_VERSION = 75.6.0.20241223
+PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/53/48/a89068ef20e3bbb559457faf0fd3c18df6df5df73b4b48ebf466974e1f54
+PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
+PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
+PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
