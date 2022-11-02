Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF63BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0179441730;
	Wed,  2 Nov 2022 23:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0179441730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0mE95czXece; Wed,  2 Nov 2022 23:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3B8B416D7;
	Wed,  2 Nov 2022 23:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3B8B416D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18F2E1BF46A
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F186940194
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F186940194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0N5SxgGPHLK for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1593240112
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1593240112
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:48:29 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id 7so257385ilg.11
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 16:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0JcA+wyEu1eA4In2u/7ibtjZKM5/ISPWSJdnMvUq1Q=;
 b=0+qUOh54Gw1TDO85CWvDvuoInKE9fw2gZIzeN+bZa3wrQis3T5K5saiopPBK3VLUMa
 CT8JK2zkrkVzqqiI2BkwwcS2ss3wfRg+K0F0I9cj23VIG3CRz8qTyFzL9j3Qn7iviToT
 Lcr7C/d166UKhhektSGZZPhrRIUmNKq2iQ7gJ00RmIctRaP0yYkjdfhE8b9HwrR5SBON
 6LItBoJXe5bUZRhuZ01Ueto4tbfN+TvoxAdgakEOclUpqHLAS+Yy792WAZTy4hi+zmlg
 KE368A1YXxG4hZJF5t0SwtIYvLwRZzpLp37qXZY3N7dg9IdaLh6acq9hBFRhbJlWjgM5
 gD5w==
X-Gm-Message-State: ACrzQf15P3bhZDAyUdJVlInYtpirlRV7QM72BDmqNWvWSlN/7F0UW/ug
 1plqKZ4dewSlzh8cP3dMkAaCpOkJ0Si9RA==
X-Google-Smtp-Source: AMsMyM43rZ24KZn/LFrnPVLIw7BPLqdKR2fokhaFtVStnqAuQRq3N+7e/L+N4kObfRehIoUrf3KPhw==
X-Received: by 2002:a92:c886:0:b0:300:cb13:7cce with SMTP id
 w6-20020a92c886000000b00300cb137ccemr4229799ilo.41.1667432908820; 
 Wed, 02 Nov 2022 16:48:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r2-20020a92d442000000b0030009bd4f03sm5003152ilm.73.2022.11.02.16.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:48:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 17:48:26 -0600
Message-Id: <20221102234826.3954130-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n0JcA+wyEu1eA4In2u/7ibtjZKM5/ISPWSJdnMvUq1Q=;
 b=STa+R+viMNT1ILQXdARXCsetyrOp5xi+6425vbTriNRDFTuOX1jEI5ax9s0oacrKew
 hiv131iwgIUYUxLTs2pJAjCov7Py09LoQ1K+X4GuYwHpLAGSzS7K+29StLqqjUTs57w5
 ysvUDC/M96TNlAfP8Zc7NBe2PuICUqrsxTn/xF5nRPD7Kme5/MbcK7LTSIJ4gCXMfA4q
 +ELfR8mpo7WXCoJW24TzV/f1QXmadfFMbKvg1lq3O8hWeL+p15xG8aDNTYJPBlqXG/ek
 v9XCt8dm48vE9N9XqiO0NuJOfJOfLsYBfVVFpBt3z4gHhN4jNx5aKdRswVS7YDW75/bO
 rJpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=STa+R+vi
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-functools: bump to
 version 3.5.2
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

License hash changed due to line wrapping:
https://github.com/jaraco/jaraco.functools/commit/7558cfe2eb2f1ffe3676905e9871466cbc9da24f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jaraco-functools/python-jaraco-functools.hash    | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index 95380aff98..a7cbb3daf1 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  c245ade3e753bc556415f1fec102f232  jaraco.functools-2.0.tar.gz
-sha256  35ba944f52b1a7beee8843a5aa6752d1d5b79893eeb7770ea98be6b637bf9345  jaraco.functools-2.0.tar.gz
+md5  f25708d7f38b9264459046fcc0afc8c1  jaraco.functools-3.5.2.tar.gz
+sha256  45b05c158f3ad28731075556ffd4749bd254ec67f91e1eb367dcfebff1151db4  jaraco.functools-3.5.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a55e2ffe9b44998e621d51d8c094bed09acc4b5236ee73d7df395a33ba3c18fd  LICENSE
+sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index f062063b0b..8f64c4687e 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 2.0
+PYTHON_JARACO_FUNCTOOLS_VERSION = 3.5.2
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco.functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/a9/1e/44f6a5cffef147a3ffd37a748b8f4c2ded9b07ca20a15f17cd9874158f24
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/b4/ea/9abca360081de9157668fcc52765989158aaf29b4826f26fcb17852d08e6
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
