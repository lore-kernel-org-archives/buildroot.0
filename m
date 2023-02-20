Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C86BC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 13:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC8D8408F9;
	Mon, 20 Feb 2023 13:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC8D8408F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ngk2AGAv9Tfa; Mon, 20 Feb 2023 13:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF5B7405A9;
	Mon, 20 Feb 2023 13:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5B7405A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C2B11BF3A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4302C405A9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4302C405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSNRMyzaJ3Y3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 13:21:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095D640591
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 095D640591
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 13:21:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n11-20020a05600c3b8b00b003ddca7a2bcbso887739wms.3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MaoVdNVNaLQ21zbFyz9SARHeb9Xr1ejrhayG6XM7EOw=;
 b=fUYLVqWw6pkhXHRlasIBZl1DXF3upI8GsMmEflkm4YLiLOk5HHLdXOPHckSy3HiQtJ
 bT9nti2dkOBDEwQhWaAUi4BO7fS1QY/HPWXc9bk7mNbvi2YYsjuCJ7F/oRg6Yd/pIHcn
 J5Seh9glZyLUKsANLCj6uzizeSxr2HMRlapZTIUx1M4RIAvdFb+w5QaEbO6iFVJ6A9Vm
 9R/B0V4nTXD3uV57yTF9vguw+gVJCP7OkrJDdS29P5otMv9qgAWH/Yv7PFB3LEtSaDc0
 73YhABjaa8AP+gxOKleipTzM9w8dvIxPCapRmg7/9MEdDPzddlvGwSw4VkHcrw8tjFar
 WJqQ==
X-Gm-Message-State: AO0yUKV9pl08ytekmV/93PWReh589lTZuxAoIycE0N7tSFaed3RhcHWk
 uNHIYp2f6avZnV7bBx72Q+G41GugUnM=
X-Google-Smtp-Source: AK7set8EG9onQP/UieIfIQ2B3Afy6zd9gSFpF96s1OcwxY38rhisxR8ilKIEG+s2l44Vrq3DhkLpiw==
X-Received: by 2002:a05:600c:30d2:b0:3dc:16d4:a99f with SMTP id
 h18-20020a05600c30d200b003dc16d4a99fmr7151480wmn.8.1676899275896; 
 Mon, 20 Feb 2023 05:21:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a12-20020a05600c224c00b003dc53217e07sm13820989wmm.16.2023.02.20.05.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 05:21:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 14:21:13 +0100
Message-Id: <20230220132113.1814581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MaoVdNVNaLQ21zbFyz9SARHeb9Xr1ejrhayG6XM7EOw=;
 b=GHqbi8InsTgOryEilM/TFhQrpyqVm11A+1b1wcfT1mrWeSTGO21AXm5vZcEe0g859c
 hcDR+AgnIjhSZGKY4t5vy3PpGgetdY3jqe1pipHG0ew7N45U/+vyc+b+/F4/03NLRrpV
 ZzOHBtifEl6uWJZFi4BbjGgHBNBKP38j9Nv7v0gdAn5Ypc4sA/NnYYg+Ok5fxdpJH2RO
 p2tISXhAVAfXX2l+GzxTVK5qUnY2GI79fpGCB5hKQHuKVuZHZaqdAFl9gwbJEAu1G6Nt
 CroZkCReH7VAbkAhV80Mx9qLy+ZLnMA0NoPffLXocrSU4/Rz84LXOsOCFI7VrRKvxAXo
 fEAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GHqbi8In
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: security bump
 to version 39.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-23931: cryptography is a package designed to expose
cryptographic primitives and recipes to Python developers. In affected
versions `Cipher.update_into` would accept Python objects which
implement the buffer protocol, but provide only immutable buffers. This
would allow immutable objects (such as `bytes`) to be mutated, thus
violating fundamental rules of Python and resulting in corrupted output.
This now correctly raises an exception. This issue has been present
since `update_into` was originally introduced in cryptography 1.8.

https://github.com/pyca/cryptography/security/advisories/GHSA-w7pp-m8wf-vj6r
https://cryptography.io/en/latest/changelog/#v39-0-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 3f2204eeb1..a23944a06f 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2d00e023261719f85caf360ee061d37ee27654a0344d1376441c8a29ea3bac86  cryptography-39.0.0.tar.gz
+sha256  531348679f144d118156be5b17ddac750974cdcd9f44bb0a7cfd7ddcfee79c80  cryptography-39.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 6868ff4633..a130b2d10d 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 39.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/12/e3/c46c274cf466b24e5d44df5d5cd31a31ff23e57f074a2bb30931a8c9b01a
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6a/f5/a729774d087e50fffd1438b3877a91e9281294f985bda0fd15bf99016c78
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
