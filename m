Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F2C61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9CE40836;
	Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuoLyeKM83KH; Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355028;
	bh=UEKWiCpaOlY2XwJi1EPTJL+lGP9IC2chC5LVkztclvY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OtwBztliQKuL2U8G5AgBOSN91Yg65LgMam4RiMVH6r8Vz2jid10BYBTRAn7nLB9l9
	 h+7CS4nyqys44Tu3uF0dGOfPPoKXa2CpZRnu6v8UDywaP8Vx7SmkNcOPoBRYZFQnxV
	 8eFAR5FNtqB+M96+QQXSrbL6p3EtjQB+PjTHw0L/c5PO9bsu+9okqG2/6qjGnY1Cox
	 mWWEaDGIBHrago0q/NUvCLdNlWuVh8AQsNOjsG5QsZO4qScnJqG51lo+lsBSwMhT2e
	 2YQ66G2txurQGXmGEzpnzDrgO9WFXzVtrJNeqxe/zMugNqeA6PZeL2GMqsYxQZqYSA
	 usoj1Q5eT53Qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C348405E8;
	Wed,  2 Sep 2026 13:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C133230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E0F88075A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96pF-C1Rtob8 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AE5B80F63
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so726082f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355021; x=1788959821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3sG+AFoBhhNikSWoxvTgziYV89u1FcJxeBlsY5hVN8Y=;
 b=Peqz6zaFVzIm48DOFV8yzTCL5OvzWFo8BHYXB7W3BJ++pRrXkbG75kNuxnvhGF89Pd
 XMYyKhNaxVrWlWuW1eJu0MPAwU4Hz8RV758gqamqf9VQi+UevML1nQXYVCWD/DKKoAJc
 C6hanolcjO+ntVtvCL6Wz/oJWmDIYHl/fTj8C42yOf9tbZFEOYh+vj+oEJqvgT5b4Dp0
 U7Nnv3g5nsaPWMvczDpwMy5P06tqh3Y9fMK5d92Ho5nUByd1A6SH0vZy5BDOxCGQQP76
 2frSyX/S02qlq1om5OwGzq5WYRi+KdiPmDOAuv6XfvFEp816VOHcd4XhXy7ZbJtZ1cHe
 kQIA==
X-Gm-Message-State: AFuF++lWvZLjqC2EN1Z43y0zIBuLDj41oDvKo8/RsvsnsCv9eaNwWeQA
 lq6fkYP+MXKfPGzNGaMcMr9txL6CNeSCyCsiW1e09dAEZQ1cpOHP6Z2SumDueEDSrHoSS2DKN9D
 1qSCckno=
X-Gm-Gg: AYBFou3L6pqn3V4gc6y2sFBhd0Z3jndqjviuvMtNUahHzP/9wlCNk45XaQZOtqihzSQ
 gBKEY45YZm9M7o1AwlXtIac/TXC+pRkhwhKufYpKdWLyxg/f8EAvEZE5i9EJawLaaVkuURSM/MV
 pHAfkC1kKW2SpfVwcX2b5lAY0pozFcYY80XB722x0KLqeiMWfYXO5YxMKmsvpYEmEluotrXExXI
 +MUQoHQVs6W/y/AnmUGh7wP9NzxE2Yx6zdzOtg9/dUWSkUJil1lcN9SNno+pup8IAsijoebGW/Z
 PExMHUFCAaKeCHLOxxJg8NpVSkpQvTV8DgVUdyjALF205+Wzxih7+YqP2upMPKGCDyovRmj0yq8
 Cqi9VJ9Coqn8stZ7wJjkxUxUTzs7xKxBgpNI15clvLMzm4QpD6onmrmhfLXJmHkSdgxy+aZ/tyP
 EIXnvEm01TgzsBUjIaTgaO1XPa+SUICNbgiSY3FXYiG2UTi7SUjHXu/bDGU9B+mlfrN9zXKqAr8
 xCDyVP8xF6N6us=
X-Received: by 2002:a05:6000:4819:b0:484:41fb:5341 with SMTP id
 ffacd0b85a97d-484914b901cmr9025497f8f.25.1788355020781; 
 Wed, 02 Sep 2026 06:17:00 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:26 +0200
Message-ID: <20260902131640.379588-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 01/15] package/clamav: bump to
 v1.4.3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As indicated on ClamAV End of Life policy webpage [1], the 1.0 series is the
previous LTS (and therefore unmaintained). The ClamAV 1.4 series is the current
LTS version, maintained for 3 years.

However, there is a breaking build-system change in ClamAV 1.4.4 [2]:
    "The minimum Rust version for ClamAV 1.4.4 is now 1.87.0."

Unfortunately, Buildroot LTS 2025.02.x is still on Rust v1.82, and therefore
building ClamAV>=1.4.4 fails because of missing features for Rust. Therefore,
update to the latest upstream LTS version that can be built with Buildroot LTS.

Release notes:
https://blog.clamav.net/2024/08/clamav-140-feature-release-and-clamav.html
https://blog.clamav.net/2024/09/clamav-141-132-107-and-010312-security.html
https://blog.clamav.net/2025/01/clamav-142-and-108-security-patch.html
https://blog.clamav.net/2025/06/clamav-143-and-109-security-patch.html

Note: release notes of clamav version 1.4.1, 1.4.2 and 1.4.3 are
marked upstream as security maintenance releases. This Buildroot
commit is not marked as security fix because those security patches
were already applied in clamav 1.0.7, 1.0.8, and 1.0.9, and we are
precisely update from 1.0.9.

[1] https://docs.clamav.net/faq/faq-eol.html
[2] https://github.com/Cisco-Talos/clamav/releases/tag/clamav-1.4.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/clamav/clamav.hash | 5 +++--
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 5989682671..833c5fbf8b 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,6 @@
-# Locally calculated
-sha256  5d3a20633bd589f612a71905a4fb50c1ee857cfbe6c72644368cac0030a1eeb4  clamav-1.0.9.tar.gz
+# Locally calculated after verifying signature from
+# https://www.clamav.net/downloads/production/clamav-1.4.3.tar.gz.sig
+sha256  d874cabf3d4765b35b518ef535658a1e6ec74802006a1d613f9f124aa1343210  clamav-1.4.3.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 0a88cc1b9f..93ddfaae5b 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.0.9
+CLAMAV_VERSION = 1.4.3
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
