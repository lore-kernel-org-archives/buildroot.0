Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22B8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 00:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9195041724;
	Thu,  3 Nov 2022 00:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9195041724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XX1MZBla3e-V; Thu,  3 Nov 2022 00:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13C341682;
	Thu,  3 Nov 2022 00:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13C341682
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 980641BF95F
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F42241682
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 00:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F42241682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IVAJdL_yIBt for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 00:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F074159F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45F074159F
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 00:34:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h206so165696iof.10
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 17:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2+qkYG6kBldA3R2KTcNiSaIkrqoMmFv6f+BU815T2I=;
 b=n8QAdKc8AjZqh8gDSGCHKyPWYNK1btSaTcyC1t6K2lDmewHeu/n5u4vXCK+UlqaAIZ
 K+Xb8OMaVZjENHusvY38Rb7v2dZQlbdJLUJcqYVAcbERtHf6FS87N3DpkwjGlVuS+50t
 cI3dUdPWbCwP4PBWbNCJ6aBCr3g5esUTvs1lXQ7BwkJjcVASSKZMeKb51+m2K3XLfhaD
 sx2HoYOqN2wr5lOq4c3MXmU/VKKuNRws0P4ne7EqSycXBFDUu+UPusvOuKQ62PtYQ5YA
 VFL0wFg0SL0VzqUv7Ai67Xs+pHqJy7Pp6ijB3Qo9/0JgboL00aRnmUelkMSdF+4m2exv
 J7aw==
X-Gm-Message-State: ACrzQf2XWma9MuMvyUsQpRz65JUPTWZsJPQWPopb38RbyULaApcHNf+n
 Zl4eDUYinZrV7He9jH2ir52du0AGoS1QHw==
X-Google-Smtp-Source: AMsMyM6n6D3o/Wp9VfLYPyyzar1lerPit3TeSImncErwzqGPXfUYHt1KrXN0BWfifaASNwWBw8ZF3Q==
X-Received: by 2002:a02:95ce:0:b0:375:7eda:8c58 with SMTP id
 b72-20020a0295ce000000b003757eda8c58mr4328507jai.292.1667435642086; 
 Wed, 02 Nov 2022 17:34:02 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a27-20020a027a1b000000b0037502ffac71sm5427473jac.18.2022.11.02.17.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 17:34:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 18:34:00 -0600
Message-Id: <20221103003400.3164180-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m2+qkYG6kBldA3R2KTcNiSaIkrqoMmFv6f+BU815T2I=;
 b=M58xHFD/h0ZBKwvxIzRrQvhcgr1qFC4nuNACNLRN1vAUs+/0jcOMh+gqXNc88hsCQR
 gP4IZm6YhYieD/hgEaojFGKTjTxszL0ltQttmEmxmanhF2naWs5DsjVtpP/dFGG0POOX
 8xCcJtcX2QWznNUyAzFliXRlVC8C7j/St+UtA/mkW3gvtXE6rm2zXpNNTVkASzv3JZiD
 lPKnKL3YrATk/ODqPvKZKEAodLfC4vjAhrIDXhl/wuQ12SjkVCySQxoEmW9fh4bsitNa
 6WA3l399+BigEoh8ITphvRMdR/O/wC4fDQPN2PHQbAGRwhI6N65o7b/Qq46WR5NSIUO7
 5q4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M58xHFD/
Subject: [Buildroot] [PATCH 1/1] package/python-memory-profiler: bump to
 version 0.60.0
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
 package/python-memory-profiler/python-memory-profiler.hash | 4 ++--
 package/python-memory-profiler/python-memory-profiler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
index 9ee515b529..9e3aca517b 100644
--- a/package/python-memory-profiler/python-memory-profiler.hash
+++ b/package/python-memory-profiler/python-memory-profiler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/memory-profiler/json
-md5  b1d1783064a1198fb21bc877e535ec1b  memory_profiler-0.58.0.tar.gz
-sha256  01385ac0fec944fcf7969814ec4406c6d8a9c66c079d09276723c5a7680f44e5  memory_profiler-0.58.0.tar.gz
+md5  c4d29b47885c32581f5bcefb44d2ca8e  memory_profiler-0.60.0.tar.gz
+sha256  6a12869511d6cebcb29b71ba26985675a58e16e06b3c523b49f67c5497a33d1c  memory_profiler-0.60.0.tar.gz
 # Locally computed sha256 checksums
 sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
index 053b0e2d62..5e43662e07 100644
--- a/package/python-memory-profiler/python-memory-profiler.mk
+++ b/package/python-memory-profiler/python-memory-profiler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMORY_PROFILER_VERSION = 0.58.0
+PYTHON_MEMORY_PROFILER_VERSION = 0.60.0
 PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
-PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/8f/fd/d92b3295657f8837e0177e7b48b32d6651436f0293af42b76d134c3bb489
+PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/06/dd/7308a8ef1902db9d81c5bc226befe346a87ed8787caff00b8d91ed9f3b86
 PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
 PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
 PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
