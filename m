Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CFAD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F81E4052D;
	Sat, 26 Oct 2024 22:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZMr-kvOiqZX; Sat, 26 Oct 2024 22:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DB1F40536
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB1F40536;
	Sat, 26 Oct 2024 22:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97BF95C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 786BE40536
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsdQvBuRc63x for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44E964052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E964052D
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44E964052D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:39:00 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a3b7442db5so11604495ab.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729982339; x=1730587139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=68zSCyYvloTkejIdOCXfCjL9/Pw1kLLhKmQTh/wT2ec=;
 b=efbuACL9g5SJug4ExtReosyxXEy5qOPa/l6VLW8ZwfqMpkAG3oKXaW357zh9QRvliq
 0cnTUcNRJpY0MWUmn62JTiid4M2B+bP3G9UWIeCH0HeSdb7uJl1Ize6X1KfEDn/+Uc/R
 kHJUasGntaLf4LwMGIgV5cuTpMWL4+5iNNnLb1lZW73VJquK+hyHbLE4wUEPo2ZfA5ez
 CCdlLARnwkotx+ythZ4xAtcLMIoRzzI6QkUk2Z7XUqqJBf4ErjQS+HcERBgu+DWo6k6h
 +KviKg/QYn/WHFm1QA7Es1QPUgn8xCx0+v62zJfoD1nLHQ9OGg6HbQskiEbVoFES0mnk
 tuhQ==
X-Gm-Message-State: AOJu0Yyurxo7i/V46o6xIYEsoR/zMPsnvIRnxt3JZ4hHO6w7vA5ur2am
 AORFkoJqZg6Mqq38uURmZ/ruYQJ9u0jYlOQ+nP7m27xGPqbL8XLnlBFPjQ==
X-Google-Smtp-Source: AGHT+IFSQ+Spo/2o8aOTm+pthhhvFvdOiV7eITYgcbgMvu5V+f6oys/FHjo7EUvdU8rNH0t5YPEHTw==
X-Received: by 2002:a05:6e02:1949:b0:3a4:e80c:ca3c with SMTP id
 e9e14a558f8ab-3a4ed282fe7mr35167305ab.5.1729982339011; 
 Sat, 26 Oct 2024 15:38:59 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc724b718dsm907516173.0.2024.10.26.15.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:38:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:38:54 -0600
Message-Id: <20241026223854.3789624-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729982339; x=1730587139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=68zSCyYvloTkejIdOCXfCjL9/Pw1kLLhKmQTh/wT2ec=;
 b=FwGFR7tK6oUGaFdzYQdYV2KyjIVQ1c/1Uv3YtRnaTRM4v7OBbQgUpdGOM3/utDYk9T
 2qhDPMpJryGcx02Z49RC0jWkDKlJ4wuhZ4XVAeR9sJaspY7uhwkSl6eNcRblQPjQvAwt
 dtQPwyTKss6wLciONvSNNJjX+0TmCwW1bbErTnKPwG2Vp2NSu3b83izWK2i0SZ5bChaA
 ptprgdeeLzN19cuY9oknG62Y063FV6rcMT9okMa4qSNWYFNN8mGmRCgzftB/uCJYJ54y
 zPZxahvfmV5LuTqWAOBWpgi0S1z/K/gr+ogxGqGMTCfGaIl2SLVu8CMjFHxTFC5yVPeW
 S8UQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FwGFR7tK
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 6.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index f85a293557..0b7c3f6bed 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5  5874bd773d2fe7da3c0817424f383033  psutil-6.0.0.tar.gz
-sha256  8faae4f310b6d969fa26ca0545338b21f73c6b15db7c4a8d934a5482faa818f2  psutil-6.0.0.tar.gz
+md5  2baae02411c42c185e129c3f26030079  psutil-6.1.0.tar.gz
+sha256  353815f59a7f64cdaca1c0307ee13558a0512f6db064e92fe833784f08539c7a  psutil-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b89c063b3786e28e0c0a38f1931db61fed35e69dd2a2966fbecffee0f46c8d10  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index b6dee0ce7f..73f54231b6 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 6.0.0
+PYTHON_PSUTIL_VERSION = 6.1.0
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/18/c7/8c6872f7372eb6a6b2e4708b88419fb46b857f7a2e1892966b851cc79fc9
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/26/10/2a30b13c61e7cf937f4adf90710776b7918ed0a9c434e2c38224732af310
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
