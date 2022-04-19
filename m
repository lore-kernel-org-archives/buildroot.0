Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 09:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F20612CB;
	Tue, 19 Apr 2022 09:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yYQ4yvLa5Fs; Tue, 19 Apr 2022 09:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61948612D0;
	Tue, 19 Apr 2022 09:05:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 695A71BF299
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65ED883FFC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 09:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UC452FPwWrP for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 09:05:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68FA083FFB
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 09:05:43 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w4so21483592wrg.12
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6ksc3dKzyg3zun3ZJ95Pzwexgub2CJES0evRm56rc4=;
 b=I7nnEiRvnxUvkti1yZAXshj2z4q039l2yFPsNRlXZ0r7iLE/lrxQSdmfc1xO2crr6H
 SYiBb3e3DC/8kiBN7gHmWUfmPSj5t9cRb9GF7OOwW0Vf1CtQRuRhNvZuvswq2kCa4sPS
 xisIkdkMVVd2zkKumSWJ7QoP8co0viRvimJLVLA6/V28SuvOw8z2fFMVNyWt/Ynh/ou1
 E0bKbNf7wHTFgVE2WMQajmHKuS46/NheEzSDMpk2nvGTyzHT+XyV6M3FeH0Gx9OIymd4
 ZMBYkxkRe8RUOsamm0f8bmvYdAm/zzmxRaGxnKfJxz8iGTcnduigQWfkbBrKwTZCLB9r
 Jcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6ksc3dKzyg3zun3ZJ95Pzwexgub2CJES0evRm56rc4=;
 b=yeesLkx8r+rr6XiQirwRjG6SgsWi0HKXkYhQie0YqOV0idZgN8Px94/76XevZwctP4
 tvNyvN0arvvlzZEBBHuravx0+MP47yMhLCf7YzJn76zv5Oha42gxXonpZusdSupOw5o8
 TsAjzbeeEPkvSk2j2jmlfMOpsIWhn96qFfV8a6/sEy2cE6IQlUqAbScWgwwB1nGshb64
 4XhK1XoVPtV9OSkp8O9GoYp6AqmEYYOOhrZ7h/dRXbKYo6Ke3O2BDhSiS6sQTYY32W5t
 M3FT7/OlmZyv3CcrsqZlHXKwLubOX5n5ht1NWCp2oqiSEqNrFGFc9vQmVkm3DCNJWX8f
 Hz/w==
X-Gm-Message-State: AOAM531MwMyZDOi1fUJ6KeWD5I8e7w8UrWkmMLqodG8Vi8u1iklb/Pkj
 ofiHGjE8Fdiq1NBMRLCwkMrLwdYo3Ak=
X-Google-Smtp-Source: ABdhPJzN0Cl/ZZOR5kd+hoJmSPLBsKmnyBXm8m/Zr9E6v/YpFaJncNXSdS/geeenXphqN3zr85wlRw==
X-Received: by 2002:a5d:5889:0:b0:20a:9707:39c with SMTP id
 n9-20020a5d5889000000b0020a9707039cmr5634541wrf.54.1650359141180; 
 Tue, 19 Apr 2022 02:05:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b0038ffb253bb3sm15839143wmb.36.2022.04.19.02.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:05:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 11:03:45 +0200
Message-Id: <20220419090346.2029839-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/expat: disable examples,
 tests and xmlwf
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable examples and tests (enabled by default) through
--without-{examples,tests} which are available since version 2.2.7 and
https://github.com/libexpat/libexpat/commit/1fdfd8a1b490f8ac9e7e11896298e41cc210d87d

Also disable xmlwf (a binary that determines if an XML document is
well-formed) through --without-xmlwf which is available since version
2.2.4 and
https://github.com/libexpat/libexpat/commit/9d950527a07783c104aada685384edf3f8f23f8a

This will fix the following build failure on riscv64:

ERROR: reloc type R_RISCV_SET6 unsupported in this context

Fixes:
 - http://autobuild.buildroot.org/results/99890c9c7ebe3266dd533c81352a3cbcf4d3d738

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index b29b0e1d26..92a3bfda8e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -15,8 +15,9 @@ EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
-EXPAT_CONF_OPTS = --without-docbook
-HOST_EXPAT_CONF_OPTS = --without-docbook
+EXPAT_CONF_OPTS = \
+	--without-docbook --without-examples --without-tests --without-xmlwf
+HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
