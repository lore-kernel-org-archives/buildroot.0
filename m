Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA90C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 20:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBF4C41D6E;
	Sat, 28 Oct 2023 20:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF4C41D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Z7E1GjQFeFy; Sat, 28 Oct 2023 20:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1807409B1;
	Sat, 28 Oct 2023 20:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1807409B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 726A71BF865
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B8C417F8
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 20:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B8C417F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBQAfjAVlkT1 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 20:00:33 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05F75417C5
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 20:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05F75417C5
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839652b97so23222775e9.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 13:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698523231; x=1699128031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XaiC0pCSUEN0s+DsfiZcRZ8XSPbUSRhAdnx66K1AFEo=;
 b=oXVaMLgWdb/3jarZHn7vm180/+Ko1i6gd+wlWbZ6B6dyDTbOShez+iekDYEwuhMHyL
 tVcRVKHpVpNSWe23AiE1sLQ5l2TcyRHzsh48ugZznAiUMc8H52K0JZgsqLoKC6H5v7q6
 /bizMuK+SB1qsg9i4uapsCTE7awHOD/c1YXz2j7zqLJIeULuEusXDBactffeBbr7NVeo
 Pfa8xqT8vr34cvOy+4p+gbukLO0hB+sUx244T2afQLOOauGZgzx/abe6oK+YLaOdYM5L
 XPZ8+LlnVxlLrZgy1/88TVCHEEIg9fWyLUM7EFm79vLfLta0yO8Z1/zfBsduD2OPQX3M
 Yijw==
X-Gm-Message-State: AOJu0YxsKYCzOFDuG3bxj2z66C5mpmuzQMl0txjvptkEcC9TQm1d+2Cg
 hzkPDISO3szyW5JlCkYeOdSsygZK/pE=
X-Google-Smtp-Source: AGHT+IF8MlV5M80a0Q7kOQBlOvM/zbA3rNozagnltSIReTZfSXwU3zb9htMz9fMrBoASbkDKvCPJWQ==
X-Received: by 2002:a05:600c:4692:b0:409:2c35:7b3e with SMTP id
 p18-20020a05600c469200b004092c357b3emr4287787wmo.8.1698523230465; 
 Sat, 28 Oct 2023 13:00:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b004060f0a0fdbsm8397318wms.41.2023.10.28.13.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 13:00:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:00:24 +0200
Message-ID: <20231028200024.1054270-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698523231; x=1699128031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XaiC0pCSUEN0s+DsfiZcRZ8XSPbUSRhAdnx66K1AFEo=;
 b=cofP9wLyTtf+MPE35svBgTKcZWkpO0xOrkGeIVwhcxPxxH0mUoL3jDmK/nVIbPkJV5
 d6rFqnLXnpCSTq3wRqrrpt2f0kdgRRlrXdXP7F4Ejeb5SZDDzQH8rlfVvHf6uHHER85/
 C/xv7/4cIXrUK4DERoj8hCSSRUzCAP/YWqQ1xz5E8jDFN7E/xkp4m/TLYQZe3/0xyo8/
 rCc1BsstnC6VHcUMMfPp+rD/4gqKclbbIQsBtKMZzz+UStDTYOBKPMF/jzE76DEDnz4K
 OhmSOMMsIFuQkAHHI3brlSBwxHwgzeauPhO+pU11ArCZBza483Ofol/PoJ68Nk9wFz46
 FjRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cofP9wLy
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: security bump to
 version 2.0.7
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-43804 and CVE-2023-45803

https://github.com/urllib3/urllib3/security/advisories/GHSA-v845-jxx5-vc9f
https://github.com/urllib3/urllib3/security/advisories/GHSA-g4mx-q9vg-27p4
https://github.com/urllib3/urllib3/blob/2.0.7/CHANGES.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 2da7abdf29..209cfe277e 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  5d541b944febe50221e24c31cd6e887d  urllib3-2.0.4.tar.gz
-sha256  8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11  urllib3-2.0.4.tar.gz
+md5  5a264ef3ae827e5842bbc80536a343dd  urllib3-2.0.7.tar.gz
+sha256  c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84  urllib3-2.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7ff58d9a4a..ba041082db 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.0.4
+PYTHON_URLLIB3_VERSION = 2.0.7
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/31/ab/46bec149bbd71a4467a3063ac22f4486ecd2ceb70ae8c70d5d8e4c2a7946
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/af/47/b215df9f71b4fdba1025fc05a77db2ad243fa0926755a52c5e71659f4e3c
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
