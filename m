Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C9C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 12:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C015241D29;
	Fri, 27 Jan 2023 12:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C015241D29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlABkUC_iOvm; Fri, 27 Jan 2023 12:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D72A041CD2;
	Fri, 27 Jan 2023 12:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72A041CD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2ACBA1BF263
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A0F82BC4
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 12:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04A0F82BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CIn17qoXDeW for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 12:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19EA882B8C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19EA882B8C
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 12:26:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r2so4808427wrv.7
 for <buildroot@busybox.net>; Fri, 27 Jan 2023 04:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FraZeKsUPLlVFnILKGFNv+e4v1g0/l6xNHfwIrNhnHM=;
 b=SXDv35+KoepuZM0VIV+Wws6pg7IHau/+5FkhZE4O3EKlhLE/ZhGjrxrDbgzxJ+0SAQ
 Wx+GJq7c66v+pdlHBqeVfyhgglUZOYzvC1xZVtY7KjC+pyHw98Pqq1szsCwLjKPE6mRv
 AshF4AoFhgCMYiQGEPL+O9z83Kr844Xpga20p4VhPcGL9DPo9rBq2ki2xxkW7/dgAWO2
 9u8P47SE3biHw7A8V0IsC3C2yKIBjdTIlnFXQtX1dViKxiXESZJsfHahRsk8cTE6BMez
 uJuWICBPUlLjW+78AgcA3nPfV8Qvup9vri6zUl5dWK3y42/vu7HXw2HhPyMoJEjvmMrP
 C2xQ==
X-Gm-Message-State: AFqh2kq1NDecT8bw5m+D+1CYSlpNpegierv7UzelvNvVkBKKLjtQJezo
 bfcm0kRZnqJK/GDqDAYqcaqMylWSr3g=
X-Google-Smtp-Source: AMrXdXurbqxHGPkGSKJajDW/s1uQi4qaLU5y37tck2egLQYzG2xwZShKbRa8C27uCFzwWaB9X7R9ZQ==
X-Received: by 2002:a5d:6f03:0:b0:29a:c631:e761 with SMTP id
 ay3-20020a5d6f03000000b0029ac631e761mr37764400wrb.43.1674822359048; 
 Fri, 27 Jan 2023 04:25:59 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b002bdd155ca4dsm3862870wrs.48.2023.01.27.04.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 04:25:58 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 27 Jan 2023 13:25:52 +0100
Message-Id: <20230127122552.236033-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FraZeKsUPLlVFnILKGFNv+e4v1g0/l6xNHfwIrNhnHM=;
 b=NliiiZT+PQoyCY2AsFz0pQXh1QwoEEw1eeiY9VZVvrCR/vWC4/81vL7DAqdjalGT4O
 9at63+I08k0+CEtdM+HYWfTB8WQRAL/lnqSL+z1h+2QWHmUXY+eLuqp6Z05leckLyOGT
 CAP7uf3sxHso7O97JkoB5woK776YpMVAqQfybXWE+4djBe+z4JIQ0sYvSnr/h5Fnzzc6
 8A6tHJomEl4iD7Kif+16afmM8WLz0ZGk2GLL7i7Y/IKgkzfkLE+4z6U2RtatQJ71u8Ae
 zZERWynN45bBdLGnDxBaoral5wb99FdbddQEzStpWPqsxuaeuEXc5kfjHDm/R53DEOkp
 3wcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NliiiZT+
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.26.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENCE:
-Copyright (c) 2021 Calvin Rose and contributors
+Copyright (c) 2023 Calvin Rose and contributors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 4 ++--
 package/janet/janet.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 5cd3db1c2..47e0de4a0 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5bf9b680adbc5511835aec3787117df37032eef796e1664edbbcfd540b6acaf3  janet-1.25.0.tar.gz
+sha256  c95dab93e8e4ebcab5c293d5ee448fb43ab8bd2f6391fd66a6ca92fe1ec72c03  janet-1.26.0.tar.gz
 
 # Locally calculated
-sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
+sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 284e6c264..db1eb2a5c 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.25.0
+JANET_VERSION = 1.26.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
