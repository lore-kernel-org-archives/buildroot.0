Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB90C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3483821B9;
	Sun,  5 Nov 2023 03:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3483821B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkXWOibHZmqS; Sun,  5 Nov 2023 03:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E13D821BC;
	Sun,  5 Nov 2023 03:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E13D821BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 271D11BF39F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D6041977
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D6041977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjoH3O-E6gS3 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:04:41 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E3E41969
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E3E41969
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so126460039f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699153479; x=1699758279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8wo1GbIv6Qyd+Rp+o+1sungbQwAoAuMeb5uuW5895E=;
 b=xQpT2mOuWmZSVZU4aBa9m9OnrV+Ge8PrnQCui036s33lnUpSZ2ckOsBPa5lCc2Tb6G
 9Rm3aeLC7r9yHumMw0rDOjnV+b1wcKo21QxwO8avZeiqjZ8qyS9W8E25nAR/+IK3b3fX
 D6KE+ughXOKsk7eWI7XZCOQDhqw9uwbkXKTMvawlJaTxRV0h9MCk7Ivbxk+IX3K496gJ
 OlPeUWVCZSy1E5opvQ57LwlvZBo2lm6lMrqR/aP67cobFdhkCAwpGioNBgeMyhTkn+TQ
 PyY8r4D6KTw57Z47G15dGphHRLOd3ezxGVYKZn9PMbY45OXAP7HxPu5VzfnGClQmHwmf
 jn2A==
X-Gm-Message-State: AOJu0YxByEOjg/2EdAtzrrlpaytlxlvcd7hPZbMHps0eDpx/2+lpu2S7
 gPLLSdE8UhFYnDDKMD9qyQtX6QsxOxg=
X-Google-Smtp-Source: AGHT+IH5HNAMlVf/iN9DyqWqHnSViIg2pm4GbsEFx96ZcWUwp6btbHI1QesAZ6Kmgh7GAYQibQl5Bw==
X-Received: by 2002:a05:6602:1506:b0:7a9:629f:3c5a with SMTP id
 g6-20020a056602150600b007a9629f3c5amr36371328iow.14.1699153479465; 
 Sat, 04 Nov 2023 20:04:39 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 bm4-20020a05663842c400b0046402753bb1sm488484jab.55.2023.11.04.20.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:04:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:04:37 -0600
Message-Id: <20231105030437.2772974-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699153479; x=1699758279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E8wo1GbIv6Qyd+Rp+o+1sungbQwAoAuMeb5uuW5895E=;
 b=HosKMJPMhFQ/pptsE+h4QVhrVIcAIbKFEtV22tB/f+8p23VMc1jzsyyt9xNYVKysIQ
 y9aWIWqehiKwijIVAUnvPhwF+VzZOZRXNTnLhDyO1mMQOmpgbg9P/0SfVcCLt8zaFur/
 CcGcphWuC9b0LVBxBp5sBQbInbrBDqCElQATibuEwUmInGn2hurzj+CuV3mbtPcBW5bP
 Ii0kxPs2IFsRqVENhUdwtL11S9TIr5Z8wew3y/do9QC8VIUqZGwW46FsETOwhsWWBKff
 oOynjkUR9nEOFynM6ixb7zamXHTur55+ly2mKbdacIOgOMvHtXZqAOWutcd7pXvOwu96
 q80w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HosKMJPM
Subject: [Buildroot] [PATCH 1/1] package/python-click: bump to version 8.1.7
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 9b2f8ed833..0fc04d638a 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  d19686712c4a599bc8bf1f6f3ea7947d  click-8.1.4.tar.gz
-sha256  b97d0c74955da062a7d4ef92fadb583806a585b2ea81958a81bd72726cbb8e37  click-8.1.4.tar.gz
+md5  7c3b52c56fd30699f453a7dc7b42cecb  click-8.1.7.tar.gz
+sha256  ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de  click-8.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index a6f2c3773c..0e29ff034e 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.4
+PYTHON_CLICK_VERSION = 8.1.7
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/77/88/b0cc5fe95c31c301e9823ea9b028f669c0dcfa205ff71111037a5ed4892c
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
