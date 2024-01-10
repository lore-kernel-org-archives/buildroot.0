Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB1DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A02BC417A6;
	Wed, 10 Jan 2024 04:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A02BC417A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdalC1UWEsH6; Wed, 10 Jan 2024 04:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE90841749;
	Wed, 10 Jan 2024 04:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE90841749
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD3EB1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6B0041749
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B0041749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42dEkC7LvveY for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:39:25 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD82A41702
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD82A41702
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7beda2e6794so49995239f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704861563; x=1705466363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2y11Y59VucWaM6B1E34h49vHbmdt3aVGdf7YHGbgmR0=;
 b=b5E1jGgpYKlOMuR+NEvz8bTGU2PKpcrXv59JjOzWFYM/3L7cXsoopJAAgC9gJ0f5N6
 Z8sasPVTyNMNtgbRkgLz4hAT3BD1QOgGevEDTlcm0rI8eLRPkJBq07zIN0DNHY4D7C9t
 /290UF5X4WI+wjWRDsPUTfwUA7fViw9ctz5LCCX08Iidi6qVvFFLnQvbFQL4vJSLp2+1
 9haQ8C7OazPBVYyLelfFMQ44Pl+siBqfer1eWLg+Q+aJ2YzA4hcWzaAWFb1bfjs5iTBz
 cCsRjtwDuAgpMxmzT7c2U1t/hkoyNA0ZwNONttFmfQr36BxMRRMcMlD78biG2j631a5t
 aDGg==
X-Gm-Message-State: AOJu0YzqS5UDkknhUPHRUpqziMwZBl+BeEv9jxhEeiZjLb988b8LyWB4
 jlYxNHv68E5z5LOW8t73hdmEYWMqEDrVSA==
X-Google-Smtp-Source: AGHT+IGsCAQLYxj6sewtMiqE75PtkWWhgAJe7cmaTsad/puyeyLLudYIBwjRENDx/7v1o8ZrFxYkOg==
X-Received: by 2002:a6b:5b07:0:b0:7bb:ec92:3d96 with SMTP id
 v7-20020a6b5b07000000b007bbec923d96mr137595ioh.18.1704861563372; 
 Tue, 09 Jan 2024 20:39:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 dn9-20020a056638090900b0046b4976c3ccsm1061312jab.138.2024.01.09.20.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:39:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:39:21 -0700
Message-Id: <20240110043921.1077310-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704861563; x=1705466363; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2y11Y59VucWaM6B1E34h49vHbmdt3aVGdf7YHGbgmR0=;
 b=UBgqXzVXYblQmAcKJUh16h6ZaONHrDTAM/ss14cy01jUtfYlxgIay4dh9879rSCMes
 yVfmD0fMYJeDe7db6WMwwymWt497kTjPKo1R+rlhvsrHKzr0ZTsQ6aCPjnof7DGMtDW6
 tEoORwhAubq/1Kr33ZPKG0fex+ZGfP7TJPgI8VB8Oiyu63U+GFi2iGuhNVYSXGr7AHuB
 QEEjOfpLqfrLbT1ICU+6qz+tdwKo86iRIZBxkLxmm2TcVH5N0mIaa4m76QpsxyRyaqOa
 jP67Rwqa6ury1uVvLYuhFMq7FnVtAVbjub/AS/nybdNh1b7JDgBGOLQo3in7GKXVd/7D
 NpsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UBgqXzVX
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.43
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 54130f3ae0..1821d4d65c 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  252a5d200e41d46b65a3076d2bc0a4bd  prompt_toolkit-3.0.41.tar.gz
-sha256  941367d97fc815548822aa26c2a269fdc4eb21e9ec05fc5d447cf09bad5d75f0  prompt_toolkit-3.0.41.tar.gz
+md5  f33c0f4ae8d11addababf6d90c98f8bc  prompt_toolkit-3.0.43.tar.gz
+sha256  3527b7af26106cbc65a040bcc84839a3566ec1b051bb0bfe953631e704b0ff7d  prompt_toolkit-3.0.43.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index db40f6c7eb..31c0d9783f 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.41
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.43
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/d9/7b/7d88d94427e1e179e0a62818e68335cf969af5ca38033c0ca02237ab6ee7
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/cc/c6/25b6a3d5cd295304de1e32c9edbcf319a52e965b339629d37d42bb7126ca
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
