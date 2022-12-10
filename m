Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B705EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471B7817B0;
	Sat, 10 Dec 2022 18:35:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 471B7817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8BrHwHugwzp; Sat, 10 Dec 2022 18:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7751681768;
	Sat, 10 Dec 2022 18:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7751681768
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99E9A1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C637414E6
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:35:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C637414E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SDiAfaeiuRN for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:35:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC0E40982
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC0E40982
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:35:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z144so3769124iof.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8EY2sgPggLHsmVn7J7z7BjQcRttpTNVCzCag+8fldo=;
 b=5+61XbJ1sBzcD+K59NOHA5HYh0MVp+cChy4zZGpleE6KuQ2ZO38GCjcS+JCqWkH5CI
 tjuormElDRXKFrCfxjYyvG5uhsYt+G3NkYlNvwQxaZwnD/l/giQXnd/sjjPX56QzQYbc
 uJYZd8bXQBi2jeeBBefx/b3gHNj3EXEiDyJiw0SqYHAv5dCJE0Ek0it0/SxWdz8iLTKO
 ZWrvQ9ofze/b6ZYQEc7vbBat+hqMevop5noFrMBSRZarWWYvPc9gnb9hYNTtBP+KQhUC
 pHNbR3oW2cTk8UjDFdgYEXBE82QwDX8gF/s6JVooKnDGkfDxuDDxgkxO6vugZ/CIJ0kB
 95Fw==
X-Gm-Message-State: ANoB5pkbiYSixL61ZcOpNcH5033Z4vq6riOBiVKDz08zXKrmiBe1cwW3
 wrGs8QTRO6QKL9sJj5UINT9wRQ47esOlJw==
X-Google-Smtp-Source: AA0mqf5Oy/l2AfhiUjoGMSkkS4r0YqvhbzyZ2iGMywGydgwc+o2lhgFFjl0I4FysDitps0QsyREMYQ==
X-Received: by 2002:a5e:8913:0:b0:6e2:d6ea:db59 with SMTP id
 k19-20020a5e8913000000b006e2d6eadb59mr5631370ioj.18.1670697316125; 
 Sat, 10 Dec 2022 10:35:16 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c18-20020a056e020cd200b003030d8b3cb7sm1487733ilj.42.2022.12.10.10.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:35:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:35:10 -0700
Message-Id: <20221210183510.2917988-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B8EY2sgPggLHsmVn7J7z7BjQcRttpTNVCzCag+8fldo=;
 b=P+WlYrv25aaY6SswnjTRHVZu3ESvoYp5j8nJAUok7wCDlfgmlyTQUpqV/sFm4v+4GU
 ksaATuMVU/bedbKCDZtkIcY9RtcNZd8zrLUlAWIpC17EgELb01saIBjqABvZBjENX/VC
 krvQzsBkdisSkP0Mme/4geVmap4i8o1xUtBT7Z6AagNUkKIbgYNC5nKAQ11qso169sf0
 bJwrdb4u4DotB6k12Cr/CA64uXzwhUE/ckIPo/pOIBpX/BD5zSGGDTIIitqbeHmb59rd
 5Zdjh8LVfdpX+sicEyY69A3OoYqPTsGeDM1J3y4QCkaO8Ny7iBrCyTzwaNOEp1AIEf2w
 NxcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P+WlYrv2
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.2.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 4bacafafde..a010e8d8f6 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  4fa0a489a247c59b36fe3e0de5514fed  Mako-1.2.3.tar.gz
-sha256  7fde96466fcfeedb0eed94f187f20b23d85e4cb41444be0e542e2c8c65c396cd  Mako-1.2.3.tar.gz
+md5  651f365616611fcd4f2702a9002e2195  Mako-1.2.4.tar.gz
+sha256  d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34  Mako-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  760f22b3e9ea4a50eb99201bd8dd118869f28108cfb64ccce6d1b305cf9ae9fa  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index a663b7dbda..313fbfcab2 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.2.3
+PYTHON_MAKO_VERSION = 1.2.4
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/b9/38/c25f0874ea71802fc6f1e9f0f88a7e9666818121b28991bbc1d8eddbcdb1
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/05/5f/2ba6e026d33a0e6ddc1dddf9958677f76f5f80c236bd65309d280b166d3e
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
