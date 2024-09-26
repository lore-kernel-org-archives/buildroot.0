Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878B3CDE032
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 19:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28164608AC;
	Thu, 26 Sep 2024 19:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYNZfZpB1Pgx; Thu, 26 Sep 2024 19:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23D11611DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23D11611DD;
	Thu, 26 Sep 2024 19:09:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A007E1BF85D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 19:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA6F845F3
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 19:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALlN3OmtrbL8 for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 19:09:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A327845F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A327845F1
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A327845F1
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 19:09:16 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso86088039f.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 12:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727377755; x=1727982555;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H11JdFhwJP266QjQmhwhBU9fev7r5NPdVVgTFGxTAu0=;
 b=sOcB4ewt/6DOuotYIhlDmUPJ00+EcTOQrNCL1Rf7rK67/zUAJBMj/aelKfzFPETK7m
 IQljJzLT8zvO02qM7zjd6lAZ8N4Mfyj7k/ewc+gWmbpSQPu4x/rxZ/evrKpp300NC7vB
 5o+3vQ+iDco3kMsQ9yQkZoDHiON2l6qEU5/1aEbniE5+3L5W8aIPAnVFE4UGIyRURQve
 jdx3G52fzLexvjL8Fy7ncXCk83sCkj3WjWVBWbefgy/TDv1y6X4/zRXp1jEBaWWXs32D
 /0abxreXHIo+EUm5UiD38hrOsELcX0V/1T6/lEvb/DuQU7O8V1pIv5HyI66fBMIUnmPv
 Ozjg==
X-Gm-Message-State: AOJu0YzPnr+L2ZuGsFYKKAf4pZkFn27oeUSKoWEzOxW+mkCUlDtBWAN3
 Kfvtu/cVuoeTbka9FLmmOqApmm2IKk/WGYey7x6dh9q8MKUlHI85/sF10w==
X-Google-Smtp-Source: AGHT+IGyRT4Fkw6SocggphWi1asjrJvv/G8VvoSC8LBrw3vqE7SmKltgiTKzkhEdsStQ+vJDzO/6mg==
X-Received: by 2002:a05:6602:6003:b0:82c:f2f5:388d with SMTP id
 ca18e2360f4ac-834931d597fmr84251539f.7.1727377755195; 
 Thu, 26 Sep 2024 12:09:15 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-834936e11b2sm7397939f.22.2024.09.26.12.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 12:09:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 13:09:13 -0600
Message-Id: <20240926190913.199381-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727377755; x=1727982555; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H11JdFhwJP266QjQmhwhBU9fev7r5NPdVVgTFGxTAu0=;
 b=E5bwUsk3JKaSV18k19x75aOXYjtd3aecH5lAfJtNufS2pPnt7PoteSXGMnWMwj24yv
 lGs9sNcEsqsxTZrT0F+cbNsTiR4DXWdECHcVTYQnEFak+OhEaDeE1xMY4KVR4z5eta2u
 7dIIHxaVt3+AyzoBvWT0z88HnFqoWq8xurhLyx6f5JTroV97ltKCXw2r9CFnaeg6R5gT
 NlFeM/FKkHHhVhp49//8PZNE16PQw8rNuZXs9HItGuTEB4HPf/R5BBPLElWwBAbI0BA7
 jS466WULKKsUK/DOx7HZj5KstZpBTDlsL43Pen9XCCC7seftnZ3mhGEQoBsH0CI+ZKC8
 UzEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E5bwUsk3
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.48
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
index eb8655fd06..ee8237c7b0 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  68c7156bafee001d10e9931ce52805a9  prompt_toolkit-3.0.47.tar.gz
-sha256  1e1b29cb58080b1e69f207c893a1a7bf16d127a5c30c9d17a25a5d77792e5360  prompt_toolkit-3.0.47.tar.gz
+md5  2448470c36f2f250c9decefcc337b9f7  prompt_toolkit-3.0.48.tar.gz
+sha256  d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90  prompt_toolkit-3.0.48.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index a4a07d04dd..a03f76dcad 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.47
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.48
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/47/6d/0279b119dafc74c1220420028d490c4399b790fc1256998666e3a341879f
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/2d/4f/feb5e137aff82f7c7f3248267b97451da3644f6cdc218edfe549fb354127
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
