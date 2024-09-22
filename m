Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610ADCF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDA5E40124;
	Sun, 22 Sep 2024 03:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGZiveXlujNI; Sun, 22 Sep 2024 03:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 916124036A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 916124036A;
	Sun, 22 Sep 2024 03:11:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDEAA1BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD4C480D2D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o04lqmdm-scd for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:11:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2BB980D2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BB980D2B
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2BB980D2B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:11:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cdada0f21so132056539f.3
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726974707; x=1727579507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4izsUeoybhHMPv5KTqaqnNqaAITntjCq93fl/5bu0HQ=;
 b=pmxaLoNanDokxmSvRndMPtD1yqOduZWAI/L0Pc0k7fAAYIws2Ad1EtoIk7MRkGGMgY
 5T5Jjr2yp/oSHtWON/cXU5Z6in2/9hiWLPHoxy6057Oj2KNqe7Pja9GTPwG2M+Kw4cM/
 Q+aKyMhspjzThL+4tlRBVUSnX8U3fP/CqXvE2r/V4+3lYxJ9Cz6DUUsXzRBaTmKMdDfl
 G2SfRicfxNAON339STtarlNBy4lsnhCkDP9DQTJ+tCRAPlaYyzzB/HmF6AGP/7rj8r1U
 l/JqPx9BuzsMEpTNH/prGo3O2ES9Ny+bATvG6VHssALJtxSIQgu0KxxQFCQHk2qZl3Go
 KSbw==
X-Gm-Message-State: AOJu0YwHhbIbK8F1NS5Hny2itSVXNP5XDTJb7g7/73Zv+YJrnVem3Tyo
 SPTNfP7pgiStAKrQroFXc91bCPCFEQSk6RLkAQXzp2vZDOom8lACMHCkUw==
X-Google-Smtp-Source: AGHT+IGGL2icd1SIxegrLcVzv6CLE/9gUsmC6TiASsZCmyOlmLeBd0RFVfFQo+5CjFjuKP2Lm0gzqw==
X-Received: by 2002:a05:6602:6304:b0:82a:a46c:4153 with SMTP id
 ca18e2360f4ac-83209d7b452mr621230739f.11.1726974707413; 
 Sat, 21 Sep 2024 20:11:47 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b92a5sm477125439f.31.2024.09.21.20.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:11:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:11:45 -0600
Message-Id: <20240922031145.760608-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726974707; x=1727579507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4izsUeoybhHMPv5KTqaqnNqaAITntjCq93fl/5bu0HQ=;
 b=EuEBShKkWzxzlLY9/Fd9m/F84Y7cWVKirspcuwG87QcQURo5PeJ5CETJ98D2JdYC9h
 j/vNxjamo5oVrLLNxCWYArl0XOjfVvDQuU1G1S0Gj+Z982Bf9j7ejujWjluywcRL89C1
 DVkPItoV8Fhxo6JfJ/BrOrfxrR7e9HI1CMJyVBPZLn7Jn2DVKG0mPTG675OKK+vIBJM8
 WJk5wZFtIdcTKfGxiGG/rF4c44FujQW7MQZIbiLZ4vA3JgeZljvM9IoADKNc0S9PYT65
 wRzjnIpjDjH/20V7noRmzGwDt40gfk8quZ+TrPJBR1Ph4nOiwyaVfOmRf99OmgIxkelq
 qPqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EuEBShKk
Subject: [Buildroot] [PATCH 1/1] package/python-sympy: bump to version 1.13.3
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
 package/python-sympy/python-sympy.hash | 4 ++--
 package/python-sympy/python-sympy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sympy/python-sympy.hash b/package/python-sympy/python-sympy.hash
index 947edfd4e0..09cb0bfd71 100644
--- a/package/python-sympy/python-sympy.hash
+++ b/package/python-sympy/python-sympy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/sympy/json
-md5  3e0033109352d7303ea97b9216e16645  sympy-1.12.tar.gz
-sha256  ebf595c8dac3e0fdc4152c51878b498396ec7f30e7a914d6071e674d49420fb8  sympy-1.12.tar.gz
+md5  0902c1a6a7399c8a5ed1bbe95d559c10  sympy-1.13.3.tar.gz
+sha256  b27fd2c6530e0ab39e275fc9b683895367e51d5da91baa8d3d64db2565fec4d9  sympy-1.13.3.tar.gz
 # Locally computed sha256 checksums
 sha256  07a5e9819f727b4986ad2829c7a29a6320d42575f720eb24d71b7fef573a0286  LICENSE
 sha256  596639d3681fdb67bb2f05a9fcd2503d88bc549471a89b2e500cd9759ae2a3fa  data/TeXmacs/LICENSE
diff --git a/package/python-sympy/python-sympy.mk b/package/python-sympy/python-sympy.mk
index 0f160649ad..246da3b219 100644
--- a/package/python-sympy/python-sympy.mk
+++ b/package/python-sympy/python-sympy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SYMPY_VERSION = 1.12
+PYTHON_SYMPY_VERSION = 1.13.3
 PYTHON_SYMPY_SOURCE = sympy-$(PYTHON_SYMPY_VERSION).tar.gz
-PYTHON_SYMPY_SITE = https://github.com/sympy/sympy/releases/download/sympy-$(PYTHON_SYMPY_VERSION)
+PYTHON_SYMPY_SITE = https://files.pythonhosted.org/packages/11/8a/5a7fd6284fa8caac23a26c9ddf9c30485a48169344b4bd3b0f02fef1890f
 PYTHON_SYMPY_SETUP_TYPE = setuptools
 PYTHON_SYMPY_LICENSE = BSD-3-Clause
 PYTHON_SYMPY_LICENSE_FILES = LICENSE data/TeXmacs/LICENSE sympy/parsing/latex/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
