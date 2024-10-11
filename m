Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400AED0EE19
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 17:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECEB460A83;
	Fri, 11 Oct 2024 17:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6ZYpou2wpGb; Fri, 11 Oct 2024 17:39:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC12F60A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC12F60A88;
	Fri, 11 Oct 2024 17:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6821BF37C
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49B0140721
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 17:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Edb8COjOfDii for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 17:39:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A44340712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A44340712
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A44340712
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 17:39:14 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a3b463e9b0so4440815ab.3
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 10:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728668353; x=1729273153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFI5hVfvB+dFWOvIGQnOyErD3B1d9cmfyebJjQindgc=;
 b=LVKN0cERYjAcLgxBg/1RXHoxC7jfEIcXOJBovhivb2JTcoMey6asvUzxNVFrQCjO1L
 0zCr5qty706+Nz9Qt1qOZkskAcOHkEz4QlG4hJfJQtbA9BgxXm6rgdwBs2Jq15hiXsro
 P8F1st06P2HUoWSa2tuYr2hUa965UK3fzFR2Fh1q8zwg0NO5j/F7UcS7SkV42JMXEP+Q
 0MEGpA1cp2Aa7s1WncvjmPgNCN8xG592mxdlv3nW4sLvcZ/b9BCVtrcXPoujgNeoxcQA
 DjkDxm0HmsH4nMkF5vh228Zq0Y8LTvpvOgHibppzv28ANKdmPyrVflboI82ClfZF84De
 DMbw==
X-Gm-Message-State: AOJu0YwoQPAbwqDU9EeOapsOzfx1UnDFejW6hWoxXeMIJCqqA6uXb4O+
 VhLxfLoywqd7f7JIDW8OmlG82jgTuXAWYnYBO2RYLCbsEwGDgdxzClnaSx2N
X-Google-Smtp-Source: AGHT+IHjNSbdBxNBeSBzgdniHAYGh4KbGUtpkdg3gphPEP/9h2BVbHrD23SU2oS0/oHHCfms0QA6qA==
X-Received: by 2002:a05:6e02:1d83:b0:3a3:b45b:a8cc with SMTP id
 e9e14a558f8ab-3a3b5f8060cmr24959225ab.15.1728668353037; 
 Fri, 11 Oct 2024 10:39:13 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbadaeb4b7sm710283173.170.2024.10.11.10.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 10:39:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 11:39:10 -0600
Message-Id: <20241011173910.2761227-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728668353; x=1729273153; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zFI5hVfvB+dFWOvIGQnOyErD3B1d9cmfyebJjQindgc=;
 b=DQlnpqxlyewq3qM0GCq+g4eZmUFx/bI0s4KBzT35XlFqsTPvObqdskQBGnv6FxNwnf
 fA4ZS/mGxOmGU0H6ZuBr+btcqh//w+u/tVdY38yEexPMta9PtpLM1qHazUo7EGfWFiCO
 Mlky7GAYdH/EynNxfNaTTyyua8AC4UBKzda5BaOR9kukWFwCkb9sVAWmkhWm0QADXzRA
 PVx1ar3cf9Li0OQUJn4biTRoNmbq7SmkjpkFg5lfT4946lFLO4uehjPwQ8vz3ynH0/Z/
 o/KYNpUmuRx759qYPksixq+x92pRXr/HNsCG1uYZZfDbQ6io2o1wxYmcIJf97+/qRgGc
 8LLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DQlnpqxl
Subject: [Buildroot] [PATCH 1/1] package/python-bitarray: bump to version
 2.9.3
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
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index d91a28af20..d5141ec728 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
-sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
+md5  476b9153ce4842182a5fed2ee0f83280  bitarray-2.9.3.tar.gz
+sha256  9eff55cf189b0c37ba97156a00d640eb7392db58a8049be6f26ff2712b93fa89  bitarray-2.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index f86320c112..a15de6774c 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 2.9.2
+PYTHON_BITARRAY_VERSION = 2.9.3
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/0d/c7/a85f206e6b2fddb93964efe53685ad8da7d856e6975b005ed6a88f25b010
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
