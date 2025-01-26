Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67301C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 14:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A29880D14;
	Sun, 26 Jan 2025 14:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLIO39hydqX5; Sun, 26 Jan 2025 14:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B5680EE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B5680EE7;
	Sun, 26 Jan 2025 14:25:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D864F941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65E6606B9
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGDUkquBwVGv for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 14:25:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E45E560643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45E560643
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E45E560643
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:25:15 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so9322035ab.0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 06:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737901515; x=1738506315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cb/nuzx6FNkNJ1NGSMTgKJYCPt/tKx0hU2XtcHYU4lU=;
 b=pSnumHZ2VBdnGpLU4axnnIuymNmsRuR8eHvE0ztz0073GLdOJKrVSdL4oH+xyq8VmI
 w0jxEZdYmmNAQHSLwFN/vxlfe64nQ365EBIUKToTjvoRPHY0VEYGU2hcnT3nOkaKHv9X
 De12zkz+gwB6n+KeA6X0Ik6+XR6gGE4+l8gnnJEN6knGOHJjVQxloo3i8WROYTEQ4cvc
 yETF3cMIfgfGPF4HC/DCBKpzfFwilhrXKYtkODDLiF8OeqWDZZsBfoqZ1o4LAV6CrbW9
 hD6mV7XT1LUdv4ZjvGp7PsDkzOVE+3bANn5rFTOMLGZaTgVIrnlO5KUO29e6NmYinWtx
 Z7/g==
X-Gm-Message-State: AOJu0YzhUG1I7cZEs0b1NnJecnG+oB8fJGf5lnu5kZh7FgwfF/NcgzR2
 f0uAQ74QKgHEUjLW4qXBq0RfwMYA/aU8PxI7yJA45s/aQ5iY2ibDRuc8RA+S
X-Gm-Gg: ASbGnctZCzN4/ub1mYDs/FAorotSW3sDKjyM51IF6RZ0LcGXSBTUy/npHw/j12QmrOS
 30sayqYO3OUYfFv2e8zK5utEtWoCSINQFamSXBbjH7IBqGTg5kyFOlOX5LWJAPvwRNnP7jRu3gV
 j0Kyqvqb2KHjTN2lBwkVXFZcxdSbPhhQSM5yKVHKbh7/50x32adSYM8P44oDano6kcqii2fbcRp
 rJ+BttxoIDAAPamQi9wcWQBC3VvbiTurctHYTZ/cQvB2dSGc+Pj0/30VAw74P9kscgdf0+hcT89
 skWfgiHEBQ48X3bPZ2hRO1Rf7kaqmxdub4if/A80RFGXLbxT28Vuwo0=
X-Google-Smtp-Source: AGHT+IEauurSvx/TE3dlycOawXNQaVYrKDq1gMDlX465ZP9C45IZU0/7BLE43p4/93nhy4YLrtxOnw==
X-Received: by 2002:a05:6e02:1c23:b0:3cf:6c4f:3960 with SMTP id
 e9e14a558f8ab-3cf744906f8mr272167095ab.19.1737901514592; 
 Sun, 26 Jan 2025 06:25:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db85c5asm1982654173.114.2025.01.26.06.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:25:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 07:25:09 -0700
Message-Id: <20250126142509.242930-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737901515; x=1738506315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cb/nuzx6FNkNJ1NGSMTgKJYCPt/tKx0hU2XtcHYU4lU=;
 b=hm8N37bv4NF0j0nimKbIrcvFJGERTwNLareP8NqMcPI7zOVFVNMiCguOofEsXPKWfW
 G+1o7JCPDMjfWSDIKrP0mNtF0c6k8lEN88DHxE3phLuk4RnuNiPMA1caA/iXdhH2TVrU
 i42VwGRsvXPQvdHt8Ho3jGxiKa/rXujuFemqWnj8Ox3ZhkLjUM3tQDMfFIN0FkAb7/b6
 fFfySL0JjTpBKzTP+Tptdd6TBMfVKxxQOvTGqc05UCsKA602wfNSUA9eCZ7rBr6WAnIS
 NnhB8YhblkdDpdesjCrJBNxT9/sKAIFBNNpjk6TIzhTIfqoe4EMRP3NZzHlRRA3mT7f0
 VjCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hm8N37bv
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: bump to version
 2.5.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index 6419e3da7c..2f7162e850 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  9896bd95d1eb564300d7fd176e17d0a1  markdown2-2.5.2.tar.gz
-sha256  3ac02226a901c4b2f6fc21dbd17c26d118d2c25bcbb28cee093a1f8b5c46f3f1  markdown2-2.5.2.tar.gz
+md5  38582a01de352b173b0cf86c9864ad2e  markdown2-2.5.3.tar.gz
+sha256  4d502953a4633408b0ab3ec503c5d6984d1b14307e32b325ec7d16ea57524895  markdown2-2.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index 60c01dbdef..fded790801 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.5.2
+PYTHON_MARKDOWN2_VERSION = 2.5.3
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/a0/61/d3c0c21280ba1fc348822a4410847cf78f99bba8625755a5062a44d2e228
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/44/52/d7dcc6284d59edb8301b8400435fbb4926a9b0f13a12b5cbaf3a4a54bb7b
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
