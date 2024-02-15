Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC9EC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E0641D87;
	Thu, 15 Feb 2024 17:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5zyDanSdUsG; Thu, 15 Feb 2024 17:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 811B041E70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 811B041E70;
	Thu, 15 Feb 2024 17:19:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F271A1BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEFC860FFA
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uX1ng0jShqW for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 907406069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907406069B
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 907406069B
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:19:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563b7b48b9aso871775a12.2
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 09:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708017545; x=1708622345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q7aOPMNRlj2q2yn5N9UNVunisQl+edP6iQitp+kcCNg=;
 b=JT3pX5odisBY6w/7kAvyAuv1SU7tBOtQeksgvbnJqH84fYbYLUUdpPtkBCfer6bvXi
 2pPhSv9sZLovOAfKu1V8lnn6BXZD9WZGp0yUrZhGcN++4uk01lDFo3bN9bXc6hBkAt74
 mVVyOJGWg8MBsOIUkpr/eM8ppsyAgJISmyn6ggkp8suFv8H5TDpo75XEvyMUSHVycVJE
 o2vbby96X6H1zLsdbHQaF+7RRplmOtoPLDy7NxhkmSd64Mi8UiJKR6c3qCegeBBkeVuF
 1PDLAtg+KXpcOR6QwNdj5kkjQHTFmEMXypAdkIccfcNxijWcihimW8LGHNFyOSihWmBQ
 jEFw==
X-Gm-Message-State: AOJu0Yx+1OC08FeJDesTAYXN/7IGeeM/5PV1+5qm52+Lr4ACL6gzRoe6
 hUrkyb17PKOXRwrgJ6ijqcIKshI2lUNhw/f49KmaT3c2JombFnp44/DCwzNkTis=
X-Google-Smtp-Source: AGHT+IF9Aey65BOihAR88pEE0LXWzsz6JihyrmwINKyRA4TzbEGUJRqAQb7Fy3HnMobCk9KXzcB26g==
X-Received: by 2002:a17:906:2c50:b0:a3c:f0bb:eec7 with SMTP id
 f16-20020a1709062c5000b00a3cf0bbeec7mr1830698ejh.6.1708017544923; 
 Thu, 15 Feb 2024 09:19:04 -0800 (PST)
Received: from saeedkazemi-ThinkPad.abbrnd.local
 (2001-1c00-0b13-1d00-10fc-1feb-1a69-befd.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b13:1d00:10fc:1feb:1a69:befd])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a170906298c00b00a3d6395156esm741516eje.168.2024.02.15.09.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 09:19:03 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 18:18:52 +0100
Message-Id: <20240215171852.226396-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708017545; x=1708622345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q7aOPMNRlj2q2yn5N9UNVunisQl+edP6iQitp+kcCNg=;
 b=KCT1djLheTWC8JaTyFu5udlaNlSitnj319Chr6QtxQpeAjE4qfv94a7bWOp07hBBig
 d3pitZQxFq2eoxvsKVSYn7zUyOoN7NXIjJ2asb1X26+pneNG72mSFMxhsrM5gpoy+N+5
 lwKKr21mA4TRGFg1qN1imMIk6ooVP+6dghWECguYF/3QCyB1SDe9fijhReaBeANhGh12
 GI8paGZZpMp1/4Lb43FMC9mcAVztkx+GSv6kHP1tYLnnBzoarlElHlodzSNdqDSfbAZS
 grOS444HGfXEk0kGVS9iLYV83eBGIhSXDJ5fLbHqz01mQP5BA87wYKQmKjnlqNLwrMZD
 T9TA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KCT1djLh
Subject: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.3
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
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.3

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 64f46759d7..48c2fa8ffe 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11e6127a615744b52d52d66ebcdf9e5366f62746e8123b3eec00e35a057db988  eza-0.16.0.tar.gz
+sha256  995a77848e75737a267b64613acaa6096ba8943f048676d5722c3ff238fb29f9  eza-0.18.3.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index b11c1a1e7f..7ec3f127b4 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.16.0
+EZA_VERSION = 0.18.3
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
