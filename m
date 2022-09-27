Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A316C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 03:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC58082A28;
	Tue, 27 Sep 2022 03:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC58082A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_hTzCZD9v2D; Tue, 27 Sep 2022 03:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF538295A;
	Tue, 27 Sep 2022 03:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF538295A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02E371BF29D
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 03:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C03834181F
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 03:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C03834181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHa-P9qOsC6p for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 03:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48C95417DC
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48C95417DC
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 03:17:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p202so6797720iod.6
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 20:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eoy3BGTgaAvzoFrIQUXd+qDsjbIlRblIkNS9z1Tc5Rs=;
 b=r5xaZMs9dmYoU8Zo7detamgMpBHWVhpIeiyXENt5hkQQt31w6Rm6Z+pqdrZdRpOfVY
 C9wsFvHS1YXzdWYWfkyxOj0lklhC1xRUh9ybLtKSbgGaTxxBuJMQAet/ZC3qpS4KwKsU
 QX+OwLL+EEnIsCl7qWKc9+oHhHdljxTq9Wo3Btv0TQTRsKSMnIKmHrT6IgGVdJN5UZSP
 4KU/4tT3tvEV5AGUOUjN+rO/PGKpRfiwEAPKk3riyM1sCvO5tYEGvNDZlYEFaF78d2Da
 TdGdCiKiLi4dCgLl108FEX00/5Nsx1LFXE2fG7yNHRUiIzEed5XMJI7Zcm9M6uG47w3N
 vUAQ==
X-Gm-Message-State: ACrzQf0C3HbZonRlJwhKlAKqenxc045pSxMNEqdBjgabowPpk+ahuPrj
 jJX8fke2ssx4y4uH8H5VrUJixNP9p7oQxQ==
X-Google-Smtp-Source: AMsMyM6v0m3RcU4ngRPoe3J1r8j8hMr82ocCSfgr0JuhggqYJ1uceU0Vd3MWhvQE2qZcoW51fv72vg==
X-Received: by 2002:a05:6638:191a:b0:35a:a22c:4bcc with SMTP id
 p26-20020a056638191a00b0035aa22c4bccmr12081122jal.212.1664248624884; 
 Mon, 26 Sep 2022 20:17:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x4-20020a92b004000000b002f4d91546fbsm221164ilh.6.2022.09.26.20.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 20:17:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 21:17:02 -0600
Message-Id: <20220927031702.2918414-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eoy3BGTgaAvzoFrIQUXd+qDsjbIlRblIkNS9z1Tc5Rs=;
 b=GMjlepKFmVABnIpso9fEnNToKDCI34FvWJDzI18jSfsu6HeXqwFwh0Y7yN6PaDD+9t
 EqqqSu0sPnryCyKTKyLK/MVXnBxbR1jhHCLyknm0a8a4Pu+UExlpEIwq+lvt4f7L3RvR
 41fThlAcy5OHxlfjNOcWKCiyfUuQuFEEWGZTyUSr+9CrIUbWQnJnZgOnPKTuklmofzxS
 H2n4FvIMuIuOpn2T63XsL1e4f9YrcmcMJfTd0ep299jPkKGpZUCBOSzpBZDMk+Oq7+80
 1+DboY7HKJF3k5gS94A23zk0vgwl1N0k8f34yMhWylTyfGGGC0QaPjTr8C4hESIBy6b3
 AqmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GMjlepKF
Subject: [Buildroot] [PATCH 1/1] package/glibc: fix build with BR2_OPTIMIZE_S
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch from glibc patchwork to fix bug #29576.

Details:
https://sourceware.org/bugzilla/show_bug.cgi?id=29576

Fixes:
 - http://autobuild.buildroot.net/results/5b4/5b442f95587ddc65a995bbd9e310c88a66c55b1f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0002-x86-Fix-Os-build-BZ-29576.patch      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch

diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
new file mode 100644
index 0000000000..b0f02c8478
--- /dev/null
+++ b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
@@ -0,0 +1,47 @@
+From 89c31b2f2ecdf9e87fb937d3019471359a03d11c Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Wed, 21 Sep 2022 10:51:08 -0300
+Subject: [PATCH] x86: Fix -Os build (BZ #29576)
+
+The compiler might transform __stpcpy calls (which are routed to
+__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
+multiarch implementation does not build any working symbol due
+ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
+
+Checked on x86_64-linux-gnu.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://patchwork.sourceware.org/project/glibc/patch/20220921135108.3324737-7-adhemerval.zanella@linaro.org/]
+---
+ sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+ create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
+
+diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+new file mode 100644
+index 0000000000..19439c553d
+--- /dev/null
++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
+@@ -0,0 +1,18 @@
++/* Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "../strcpy.S"
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
