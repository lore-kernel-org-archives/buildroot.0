Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10188E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF5341321;
	Sat, 11 Jan 2025 15:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxsohVz3SpdU; Sat, 11 Jan 2025 15:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E61B41328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E61B41328;
	Sat, 11 Jan 2025 15:12:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 453B9940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 259C683CE6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r68mOfROXjEu for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C9D183CDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C9D183CDB
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C9D183CDB
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:12:20 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844e06e5d11so83464339f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736608339; x=1737213139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZh4TEXxVhZC9t4OrOfVTh600/9wJPiEH8TBrm+Lf2M=;
 b=b0ltCCwN96mCwv8DsPfuFfO5KmbyxZC+/iBHqC3QvUe8fseaj9Cb7WIMKuZKBE3Kip
 RoRYmgvU107wW2+3DSMPphI3rl4y7V+nbCzvSiH47KatrcbpIqctORhvd1KvpJ0H3CH8
 l4QTQHrj1Kt8hkPz3DqTLlQuGqOPG2JMjNdJVtUvNRLUkJDhp0gYoznhUYcm2xHs8eAG
 2DxdKCqUFzI7HWSmVS1cmTxljM2CerCl0mdDKqo27kEpzVHfmKtIFp6x4SXeUuyuBdIx
 n7PER8m7AXqoRElvCj3D5l5NYJ2mbenAhM1ECbYYA3IVhgbWQU66t1poIa9I4ObQHR13
 Cn0g==
X-Gm-Message-State: AOJu0Yy5U8FscchM63tRtSNb+dsCMMCpNv3T2fAExtNI+3FQdlGo0h1k
 TyBky0AKuKKH7trr4v7F6FtaDOHr3V3SuHdci00LXIMK9ZeE7A9sZg1F486JkpU=
X-Gm-Gg: ASbGncsT+vLXI6I496vnLIMfO4OcfIAMQ/tUozc/lwav6euLsTUuPl+bQdTIik3lFmi
 BKyCcdzFWQGTLnZATGlrX+fNPq1nXYMLNa77l4mU+kpmgH6wjMky8urNQ9cBarUdOKLV7HIheGM
 2mOmkUubgJiubFzYadeOyrJFF81ueYPDSSDoa6X6KUNPMgIDZReWbSdTEMzA/NsLf5z7oa6G7gM
 2F5x6arF/cjcWcEjLUEnw2fVmH/cUlOjcivQ14/6MYiCknAYGzc/dSTbReBiVhN3b4eCuDIkgrc
 e3ehpbjJmjMTDIF0ylRsy5MgArJBlsA=
X-Google-Smtp-Source: AGHT+IGjUE3kpwVdNfGnlhjwk5iC/03ODIosgoSCJ6q8xJuDVakljHNDylZAmF2uRl9c6TGxCWApEg==
X-Received: by 2002:a05:6602:4c06:b0:83a:639b:bc44 with SMTP id
 ca18e2360f4ac-84ce003ad98mr1418033939f.3.1736608339010; 
 Sat, 11 Jan 2025 07:12:19 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fa3ee3sm156392139f.39.2025.01.11.07.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:12:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:12:16 -0700
Message-Id: <20250111151216.2829390-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736608339; x=1737213139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lZh4TEXxVhZC9t4OrOfVTh600/9wJPiEH8TBrm+Lf2M=;
 b=Pkjw6mf7L3AzUOGvSFiO7oyJfczsSubbAYQNbaxGRuKdqdRMRszrdRcZRobNQvx8Xk
 3Z1krM/NaSaCND/Q3j1DHim0zhfS83Py7I/PhpizUEB5zTkykss0aqFSeTHWYDON51xg
 WLlb3Eku9IRUco7IM5a8tnrvu6W8Wh7Z4Ib2+++BYhOc28RyxoG/KHc/Fon8JxKAHNi7
 J4N1zzQeXAzdFESeZ9hedBmmm0fL9Z8646RLL4CTeosWJNSYri6KLVFqny27U8tvYBRk
 AwKO0z9KMA6h10Uf0/0glNCcZEB2/XQh9G+7O+Vn/39le7YGHXw7jeuyuArRKQx9/+ye
 mfLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pkjw6mf7
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-dynamic-versioning:
 bump to version 1.6.0
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
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-poetry-dynamic-versioning.hash                     | 4 ++--
 .../python-poetry-dynamic-versioning.mk                       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
index abe063096d..7e0675cabb 100644
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-dynamic-versioning/json
-md5  91032d27f9da010d8a9b7e76bfd09d24  poetry_dynamic_versioning-1.4.1.tar.gz
-sha256  21584d21ca405aa7d83d23d38372e3c11da664a8742995bdd517577e8676d0e1  poetry_dynamic_versioning-1.4.1.tar.gz
+md5  d3d35766974dc0e040d73f7dcc15cc5f  poetry_dynamic_versioning-1.6.0.tar.gz
+sha256  568b728eeb7b2c4a3b818565bbaffc2128bde68ad037152d464b92975f45ce70  poetry_dynamic_versioning-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
index e159e80324..6ff596bca2 100644
--- a/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
+++ b/package/python-poetry-dynamic-versioning/python-poetry-dynamic-versioning.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.4.1
+PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION = 1.6.0
 PYTHON_POETRY_DYNAMIC_VERSIONING_SOURCE = poetry_dynamic_versioning-$(PYTHON_POETRY_DYNAMIC_VERSIONING_VERSION).tar.gz
-PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/dd/70/1138211a6e5051d28596922ed39acf20b42819db5ae1f93e465b9a903c28
+PYTHON_POETRY_DYNAMIC_VERSIONING_SITE = https://files.pythonhosted.org/packages/d3/f9/97b14cae52513ee028f1e81aad8a44e3a8f5a5d47570b48219431e131989
 PYTHON_POETRY_DYNAMIC_VERSIONING_SETUP_TYPE = poetry
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE = MIT
 PYTHON_POETRY_DYNAMIC_VERSIONING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
