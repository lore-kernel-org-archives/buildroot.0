Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6909C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8357D608E4;
	Wed, 19 Feb 2025 22:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Rw22HVuJZ3I; Wed, 19 Feb 2025 22:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE2961081
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE2961081;
	Wed, 19 Feb 2025 22:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1F98E0C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC42940D8D
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKze01KQCiUs for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 734B740D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734B740D9C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 734B740D9C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:10:37 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f2f748128so128563f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740003035; x=1740607835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bH2BOlldFEsEz7qJPYFjbOB2v1XUChyKkSfORCZMigQ=;
 b=pp9OxHaHwfW0UCM0sxrWiL8fJpikgBGaUKihI4d2tgxMgfJygwJ10puwabecW/Zvai
 K3A9SxNpsjO+Xwq6qrBxKSeV+hpO/hSdCiuFJFVRIl250ZegFS/5nq77bk+y9ZZyCcdf
 LjrTkWUqfgnuakPKrFjXc8UdcNT+WGfPazwyCMX5sqy8WXcyyP29oXMS8qs7gY5jcZOL
 KrhENZ0lof0xf9sD1cpQC/xqQlQuB6tGD05LjzAQNgGa7ZAHHmirRR+YWfW8x9zNJKL1
 jmCVSO/l4pOEtAcKgttR0QlYoXX0u+os60CZ5sbGxTXJE8VygcRYgg79tfMkqb0hj05S
 V/bg==
X-Gm-Message-State: AOJu0Yx02ZXPdR4qPmEvQ0j+pdTp3mjzVztKjmbl+M/WoNv8R4uZyLeU
 FvHOMROdhDxOmRLxP7CKC9HBYyamDG6O51qlQusgZuH2zjGUWJrrRutwHQ==
X-Gm-Gg: ASbGncu2i4YmZWiMSGLpMZIAnN+sa6SL9exdsf4HR50zqY7nflU9RLJ9WXeBFhFkJil
 i4kuBjGDXCdpQNNu5JjwgRs3mRIjRN+MPMAAyYQY91oC+65qrhtaztJs7UPALC0G1Cmg7jOqirj
 2Q+Aj1Pw6Au74IoLpR1LLf9821/zuz5XXgTgZJcEp/GkpkOytCtEKafbGK1x6x/kRoMKGLtwil2
 TCNAVFGrinR930C1iy97IHyUIFOzuxPAtZMRYvttF2IWImK5NTXNeJ5Nfv91t/5fVDgou/2Pmy7
 iFhgx3dplVJsnabbcBVjP0l1VQ==
X-Google-Smtp-Source: AGHT+IHkoWmhzNzy6IHsJx2VflnV+xgfIRm4Os+SslSqUvDn20w1z7CbyyaW6xrRdvJF7xth2EaKqQ==
X-Received: by 2002:a5d:584a:0:b0:38f:24f9:8bac with SMTP id
 ffacd0b85a97d-38f33f46b95mr15395639f8f.23.1740003035439; 
 Wed, 19 Feb 2025 14:10:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8443sm224799365e9.35.2025.02.19.14.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 14:10:35 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Scott Fan <fancp2007@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 19 Feb 2025 23:10:33 +0100
Message-ID: <174b93ddde3f154a0056d0edc5ca2230da0072a7.1740003029.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740003029.git.yann.morin.1998@free.fr>
References: <cover.1740003029.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740003035; x=1740607835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bH2BOlldFEsEz7qJPYFjbOB2v1XUChyKkSfORCZMigQ=;
 b=MxLRCbROWB6P4hYNdQ2nKVUGVK7ODE4gacNnd52MSVZQoVw8OhzHWyxh2Aa3Du+hUu
 RxvqBCRfnrOvWVYouiIKCVzDwa7fYZeldm7Aoy74PMN7LEOdQqlLqWckaAKvsFYffkT/
 T+l4U9Cw02Z9niBdGJ9EV2+Kslrw8kRxw8TL9iwDROeN+PQYdSQhWMRK9kaiXscnMo7O
 st8TEigong1xPeQCL+KJy0Aj3Pdwx2RNwwCM0gdquYoAwhS17TSJVBdtwbPkUqRpLnTw
 YbXBUvHoQrhddbBWkofq6TPqy9yzuCSBZIp1EbnbLPh5ULarZRhEWwz9I6x7Z5EvTVHJ
 WuJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MxLRCbRO
Subject: [Buildroot] [PATCH 4/4] Revert "package/sqlite: bump version to
 3.49.0"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sqlite 3.49.0 has changed its buildsystem, causing a lot of breakage
along the lines.

Although a few fixes have already been applied (and reverted in the
previous commits), there are remaining pain-points that are not trivial
to fix in a timely manner :

  - the buildsystem forces an rpath to /usr/lib, and it is not obvious
    how to prevent that (excepyt with patching),

  - there is an optional dependency to zlib that is not accounted for,
    neither in the target nor in the host variants; this causes issues
    when the build host has libz-devel (or similar) already installed,
    in whicxh case sqlite detets it and links with it; as it is missing
    an rpath to $(HOST_DIR)/lib, this causesw a build failure when
    another package pulls in zlib. See:
    https://autobuild.buildroot.org/results/1a81cb7c88a41a03767a1a201ee0628468f60766/build-end.log
    https://lore.kernel.org/buildroot/20250219195112.GA2631528@pevik/T/#mb7c7ac63902ed55623a5adf5d1db4a3f60db9fef

Fixing the second issue would seem easy enough, but zlib could depend on
ccache (when that is enabled), and ccqche depends on sqlite, so that
would be a circular dependency. And there is no option in sqlite's
configure script to forcefully disable use of zlib...

A revert is the quickest solution to unbreak for the time being, as the
next release is nearing due date. Another bump can be attempted later,
that addresses all the remaining issues.

This reverts commit db85638cea3414ca0293cbbb2352e5b0b63a2579.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ddec2637b8..5b933fba8f 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d8bfa0b55e36951f6e5a9fb8c99f3b58990ab785c57b4f84f37d163a0672759  sqlite-autoconf-3490000.tar.gz
+sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a23f6e1d66..c8f12a427a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.49.0
-SQLITE_TAR_VERSION = 3490000
+SQLITE_VERSION = 3.48.0
+SQLITE_TAR_VERSION = 3480000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
