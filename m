Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A5BF5A8A2
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 00:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EC2605AE;
	Tue, 21 Apr 2026 00:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id heyTq4x5Nf2b; Tue, 21 Apr 2026 00:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1658161123
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776730192;
	bh=QU42FV/hUKBiz/QKa4UrDWu3KDfKfluJHqIJxkFB2yw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WxBACAZgzK+I1EpSxw1gpjVO75d+I9f5czTXSsD0ugzKphROzkuLxxkqMbNPEdHZC
	 nEeGMRebxRtbfvT/kqqY00Rz4+olfz8AhO1E5jj+2z+Vg0VfBzZMpIBdS6WDmNpn35
	 AhrHEcl2GEo/88GAnnwGIGl7typU1Hx/li+Z8Q1YTWpYLr80519VEAonNTMrIs3x1H
	 ndfs7kqcP45Tqmgqk/VWb+9DSksgrbqLy75imsyi8T+q7eNIKep4HwQ1BlGfmyAvOk
	 hths6QsgWdsoWfEF48FP4OgANW/UQ7/SxwMnZUSN9z8R0Wtpo6j+DQZzoKhP5MQBR5
	 sW/EjPtrly0dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1658161123;
	Tue, 21 Apr 2026 00:09:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5352C257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 00:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 415934116E
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 00:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo7L1F_axMCK for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 00:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DC134116C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC134116C
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC134116C
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 00:09:48 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-82ce2e2880cso2456509b3a.0
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776730187; x=1777334987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBHW+maarkqoiE2YpJA8OTL147uAt0BuZPY5qpPYWAM=;
 b=UfaEWm2zkK72kCjTy7X6BLB0VDbybIwdfkx7cG7uf7FY8j5iMmUwTl26PeFbaPpMVc
 nU/TDbnwTmBOgHTBsU7U77Z4G/Wv+vDnPeKhE4KmNGlxxpAdd9S2HybIjKZm4uD9cftO
 xGPdESPeXhcq6ZsDyKHC+UNJo036ToVgkxhs8DyGoIDpvh8HVISfygZipBKOVlUXBKlj
 axtgCL1Fh4oruu7Di0wYSSVO/7Rd0SlTOKyCFsXU2SpylsyqBlgiXD/To+gCqCahQLuL
 doo76zE1oh82yI2uRpKjWlvv1IOXHbYKNeNCxMzePkAJpd/6aJImy/Ck2yWKwJo8bZjn
 l8pQ==
X-Gm-Message-State: AOJu0Yx3aim0ye7BumeUKfabQLNLxktSgZw77HxMS+3EdO8u2U0veO0K
 38bjOSmlsOxV1/i2Ak/WC9d38dxc0JRJcPqxw3zLt+IXMAMNMrX3zpGfi5RjAjKcmRsYElQMdQV
 0l71auxY=
X-Gm-Gg: AeBDietcf4omZzf1eNoQDYSp1z96UKKBcdCZt4nvMqIs6qO1bcccdjKd6XDMDobB1Vy
 TidWk6YvwQ+hH9L/h8/YQ8TXf/C/TC1LEc8jjy2jPSqU/fRDrYycNoQJNR0NTfDuUvUIiFVfBBq
 zKmODUE5MKXW3I9UCgt8/WKNK2k6TZykkQaHw1Rk7u11s+JM+q7cbxzgROFW3e2AnGMpe96WnV6
 CvKWy5swxNSCq63wyPdVX/xF7gACrk9G55s+wpAKnZzBzl/lMpcveN/hWR6Wiowkx7uqiUuaKFm
 984EadqrHPjrlXZ3BVJ2OLFgjUSs6Mjnj/euCJH7kvb+kN8s2bVtPGcuCBiumsnWDN4ijKHxeXC
 ix4ZAVn06dqVU8NbqJvqf9yBfjDZHhaX6CwY6EGycEa5TicoOY1kBPOqGKc2pH5argNBQ6EhAEk
 pbry+MJf14ZfdLPYukj0DAqoAgM+RpJdngqUWq1+majhEhhbtqJA9aujbBzdvUhNJidPlpsFerC
 7qGTE/UHg==
X-Received: by 2002:a05:6a00:3498:b0:82f:4566:bbdf with SMTP id
 d2e1a72fcca58-82f8c862662mr16260127b3a.14.1776730187339; 
 Mon, 20 Apr 2026 17:09:47 -0700 (PDT)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f94204ac8sm10787762b3a.0.2026.04.20.17.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 17:09:46 -0700 (PDT)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 09:39:39 +0930
Message-ID: <20260421000939.640249-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20251104.gappssmtp.com; s=20251104; t=1776730187; x=1777334987;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zBHW+maarkqoiE2YpJA8OTL147uAt0BuZPY5qpPYWAM=;
 b=UdYpwkxe745iMmmNBi26D38y3t24IAriV1InuiP3IHbw/B/orBLImzUM6x9lpyXlcb
 bVNc6mx4Affvh79q7IGCFtivY/2X/BYyBv/vECy4y4YeIEHtR0PDYC/+WYLh7Ik2qwCz
 dOFb/UJYaCK/CKrggDnDw0MLNvoU2aIiBvRDk4hhU6bh7XFStLc441AY2FheX2gbaHZb
 8I9IPqhvmc/B+TVavBMwRe2e6kQa4RzdD+qdu/hkkQiQqKXdihTeB4Pkn9J6WKRvtHNP
 e2bo6W+cL+UbikI41dIDa4VhrAdS8/6vPmTTMQwsGdfTNI4g4HRL+83qJvv/Bo33iCR/
 ZnQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20251104.gappssmtp.com
 header.i=@maxmine-com-au.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=UdYpwkxe
Subject: [Buildroot] [PATCH 1/1] package/python-flask-caching: bump version
 to 2.4.0
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
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 package/python-flask-caching/python-flask-caching.hash | 4 ++--
 package/python-flask-caching/python-flask-caching.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-caching/python-flask-caching.hash b/package/python-flask-caching/python-flask-caching.hash
index ee3f669934..cc799fa47c 100644
--- a/package/python-flask-caching/python-flask-caching.hash
+++ b/package/python-flask-caching/python-flask-caching.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-caching/json
-md5  026d06167ba7353ac65c861950ad5696  flask_caching-2.3.1.tar.gz
-sha256  65d7fd1b4eebf810f844de7de6258254b3248296ee429bdcb3f741bcbf7b98c9  flask_caching-2.3.1.tar.gz
+md5  5e628f2a989e60fa99b154515d1e2499  flask_caching-2.4.0.tar.gz
+sha256  a7f14e43617cd0612a57bec2f80516d6d2ec888bfc50a807b1e4e41ca345a3b5  flask_caching-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1f3c445faa26eb32d90291228510e2d8594bd1fe15463f5d70c87d44f38872fd  LICENSE
 sha256  7729328f7b1ce664dbf630f077581cdfe97379b58b49e9a4f20c63912a5e5c09  docs/license.rst
diff --git a/package/python-flask-caching/python-flask-caching.mk b/package/python-flask-caching/python-flask-caching.mk
index db305d3dde..0b32c87055 100644
--- a/package/python-flask-caching/python-flask-caching.mk
+++ b/package/python-flask-caching/python-flask-caching.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_CACHING_VERSION = 2.3.1
+PYTHON_FLASK_CACHING_VERSION = 2.4.0
 PYTHON_FLASK_CACHING_SOURCE = flask_caching-$(PYTHON_FLASK_CACHING_VERSION).tar.gz
-PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/e2/80/74846c8af58ed60972d64f23a6cd0c3ac0175677d7555dff9f51bf82c294
+PYTHON_FLASK_CACHING_SITE = https://files.pythonhosted.org/packages/42/53/5c46b6a80adc13ed9179879a93cfc2c1f190c64c48ba732b4f5819df520e
 PYTHON_FLASK_CACHING_SETUP_TYPE = setuptools
 PYTHON_FLASK_CACHING_LICENSE = BSD-3-Clause
 PYTHON_FLASK_CACHING_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
