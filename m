Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5768CEE33F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976FD812F9;
	Wed,  9 Oct 2024 18:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjSORrRzZ-c7; Wed,  9 Oct 2024 18:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9FC81301
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9FC81301;
	Wed,  9 Oct 2024 18:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56B6A1BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0302F81309
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRU_8wAdZoLx for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04CF58130F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04CF58130F
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04CF58130F
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:31:45 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so3949539f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728498705; x=1729103505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jfTIVjonBQcIlNohc2RTNpg6Kx383k5j0aq+9tnJCNE=;
 b=aPXrPAV2PWfDnqe0uqmZZGDvzemNRNdr/sDFpCoXkGT/t98mk2lMrDQLGXgBZlxh5D
 ltrR68EVkIk3ubQDyC7Zkl4bWF3Gf7stv2s16ULGBdBdBH5mp8i1asymFP6+avEBxfds
 JAnVpG7JvLtfr/WU7NROCC9I4hfHhh3GX1TK64w8Dt4GLBLtYDqQoyp+ivBmGnq/emwi
 Chc7B4HFdGbUdHSfeV7UmU93Gza8j53EP5Qs2XHq8B0ylLQQA18QntmGu6klbY5BmG0g
 Q36k+Bn3ZWxSfpYcUPUMufEeTdsndv/tCFeN2S1e1vP6LDOtWVkPOBbdfnlozmnrsH6t
 SLVQ==
X-Gm-Message-State: AOJu0YwI+781N1wQ/h3tQC4/jlKKMoS6pbCaKap6eibRbhOERhNm1Cqx
 tDp8YlAyLrykxADmVFEtsl5wZuhEbbkGLxqi7QVH8Tke0fAfuBha+/Y3ufer
X-Google-Smtp-Source: AGHT+IFbJ/cKBehafM2fQJjtlMVsemXof1W7V82AFW6isRdlep5I0faf5irEySLaBALD3FwIWAIDGg==
X-Received: by 2002:a05:6602:2dc6:b0:82c:f517:dc9e with SMTP id
 ca18e2360f4ac-8353d4b7702mr512252939f.8.1728498704675; 
 Wed, 09 Oct 2024 11:31:44 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503a919d5sm233238639f.14.2024.10.09.11.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:31:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:31:42 -0600
Message-Id: <20241009183142.3884122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728498705; x=1729103505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jfTIVjonBQcIlNohc2RTNpg6Kx383k5j0aq+9tnJCNE=;
 b=Xxp5pf1Cj0jC5qMXOuKLYur6LxN84eBBRucj8G5Q+PiSUNwYdXom8Wfdmt9DkMYNwY
 kn/yCRYo0mdxVYPCMR0bS4Igm4LC8dZBfGk4KpXoGcqNltM7bzGfWcTpYGmerWefUxlk
 GHfU2IF3iJWF6fJR96FG5Jz7PpYdVS+TXApVLnLOMeaf5/7/PeZOUrUuFSB10qcXc5ui
 K1mwXUmBsptCO4jJNgrmhstNHLCIJl9EY1S3UEcPFx+bv0EqY1epaNBDdOx90ZKsR7Cb
 nJJQn8epvt9uYNHl7nytG+Uy9kEsZzvNEPvD89M8jHVzxmF5cTPE5ZK2lZm9hJK6l5Zx
 0dOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xxp5pf1C
Subject: [Buildroot] [PATCH 1/1] package/python-webargs: bump to version
 8.6.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to flit build backend.

License hash changed due to year removal:
https://github.com/marshmallow-code/webargs/commit/0917b88a60385cb12a9fa543ca5b7f6a0d6bb336

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-webargs/python-webargs.hash | 6 +++---
 package/python-webargs/python-webargs.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
index 10bb3651f0..3416a441dd 100644
--- a/package/python-webargs/python-webargs.hash
+++ b/package/python-webargs/python-webargs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webargs/json
-md5  9fff29294a5db748eca791da2b93e370  webargs-8.2.0.tar.gz
-sha256  99d68940c452e07726485a15fef43f12f8ae6c0c5b391bcba76065d4527fb85d  webargs-8.2.0.tar.gz
+md5  bb65a1f2964f24f77650b8a14ddfbdb1  webargs-8.6.0.tar.gz
+sha256  b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a  webargs-8.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5973e5dcc20b65e4eb4b4acdf273bb78a18522914ab626f496f1b070f7e6294d  LICENSE
+sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index ce270842c1..9edca07a15 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEBARGS_VERSION = 8.2.0
+PYTHON_WEBARGS_VERSION = 8.6.0
 PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
-PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/4b/7d/fece8e6547b3edde8953b1c84a63da02e1a88efcb9d7d485e4d1b25d9c47
-PYTHON_WEBARGS_SETUP_TYPE = setuptools
+PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/8c/51/e9ee5d8315864adf65e92f858f826514538e30db542d4782dd94c2418464
+PYTHON_WEBARGS_SETUP_TYPE = flit
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
 PYTHON_WEBARGS_CPE_ID_VENDOR = webargs_project
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
