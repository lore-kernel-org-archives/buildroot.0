Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B567C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 02:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5BB42F52;
	Wed,  1 Nov 2023 02:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F5BB42F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZplCoNTEfDt; Wed,  1 Nov 2023 02:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE4DD42F6D;
	Wed,  1 Nov 2023 02:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE4DD42F6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC40F1BF277
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8578442F6D
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8578442F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9QLhCcFpwbx for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 02:19:22 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF70C42F82
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 02:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF70C42F82
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc5fa0e4d5so19155995ad.0
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 19:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698805153; x=1699409953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0KoTAiOXlhYUwkZYvCP6JSsLffkPcjIBwkFsl/5Ens=;
 b=hIR+M+eFguKWWY74GJtKfXEMw0Xg8ewTp3v7q4Rc3dBlNjIjdsKJuSSElj9CuexBJv
 U5eOQPG+h9viOZRmhK6AU5y0WnmdBm/KDOx02Z9Vxu1C4vTMBTeb0wN/B0RLULa8Erol
 1MqMwKz26FOZFBpFdvV3qNgWcv/6VT6uIATRn65qIWY6uyQEB94FTNkY+jbyDsebDZKZ
 boahIurh9sjxM+SYttuaYDVyaKtU9jPIp2sG7e4RVHp0emvbLmgDFyJoQvBLW+5y4Md1
 Wux3V2Uiaeimt1ie645Ddz3dJp+/Pu/AlqGWlWDN8w7HBe2HV17LSnD8RcSXSUgNJmKy
 Ak4Q==
X-Gm-Message-State: AOJu0YwhdHI0lYi0z6TfdmXciNl7QZYFIolUaqNUqeQNoftrIRKGdC3w
 ky4ZAYow5EnA4F8taEzf2nHTmP1cFJ8=
X-Google-Smtp-Source: AGHT+IFYx5kI26y1S6/WL2Uh0xU05tkKDXZOoBw1GmvUF6ZNKoPRXYScyGOZOMFiPX3LDmy3zpXjfA==
X-Received: by 2002:a17:902:cec9:b0:1cc:6b55:fd3 with SMTP id
 d9-20020a170902cec900b001cc6b550fd3mr3723824plg.42.1698805153503; 
 Tue, 31 Oct 2023 19:19:13 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 je19-20020a170903265300b001bf846dd2d0sm223135plb.13.2023.10.31.19.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 19:19:13 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 10:19:07 +0800
Message-Id: <20231101021908.16917-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698805153; x=1699409953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F0KoTAiOXlhYUwkZYvCP6JSsLffkPcjIBwkFsl/5Ens=;
 b=ECWdMDxQ5gqV6qxBvZx/nLpC9gTR6sNrqP3u/3SX0vGQgN3uS6A6PexzQEJVFEp1am
 tEnCtZIJOMLXSpS0dJqJ41kT3ek3Qn9YJH4H8W634YSznjNqyZ20OajB4k68EACaltF7
 gQ9ZqkQmXDN0tq6YdoEh+hqPImxExYj6zXCvjdnm2BViIgAm9N705L2gaUWUr3drLnQ5
 /CIEtw/UX7S2eyoMBxDFefPNV/LXhFuKvmpkUArVo0l/OD22LrAyfqUcADAsUMstcIa7
 oWpYJAS3e3dfLI37z8UOeiK6ctOmOAbdMVWj67iqWuFZ93+rHh38ixeKlxnwiuwEIrhP
 NOrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ECWdMDxQ
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.2.2
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
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changlog:
https://github.com/htop-dev/htop/blob/3.2.2/ChangeLog

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index d43da13441..12dc864de1 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,5 +1,5 @@
-# From https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz.sha256
-sha256  5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb  htop-3.2.1.tar.xz
+# From https://github.com/htop-dev/htop/releases/download/3.2.2/htop-3.2.2.tar.xz.sha256
+sha256  bac9e9ab7198256b8802d2e3b327a54804dc2a19b77a5f103645b11c12473dc8  htop-3.2.2.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index df2ec25908..aafda5d48f 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.2.1
+HTOP_VERSION = 3.2.2
 HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
 HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
 HTOP_DEPENDENCIES = ncurses
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
