Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82D6C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 09:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25EC6401BE;
	Wed, 20 Dec 2023 09:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EC6401BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvTxN1emx7I4; Wed, 20 Dec 2023 09:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4BF40185;
	Wed, 20 Dec 2023 09:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D4BF40185
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80E071BF5A5
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 09:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6494640525
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 09:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6494640525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeAEaaoFyyxC for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 09:27:45 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13C634012F
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 09:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C634012F
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d7e67d31caso1919445b3a.1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 01:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703064464; x=1703669264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DfT47+h84Z0OQN4ZySWOsY/i8LTBq0CVW/SJi99LI2c=;
 b=KsBZg1zk4XX2RVevyU57jzDB+3Iw7cEhmrikNokevZXWxXAr7talm71J7GZA3JJ7u1
 mbs1hoP7uTNBDhCHG4KUc1rTZYHYf5fWAUYjPYJPVoueYxSew3YwUlvkKRfpbbaGIlvK
 wu99pUK0J0LL6C9qqc/dew+ImrMpxk+KfrwmQTOXCfILxvY+7BRM+AfIHq82ffExZwRy
 FKpwKx0x5Wl5dH9Nl7ZFmgFmfBb8QM/MKZpn1twMlTTGCi4QdZHs7sO7D4os9XzKZ6c7
 AhvuatF8496zmQiKvDmz9EaQ8OS7guqZIAr1XHZ7e8NAbJ7807dPy8vjsDZN1k87FI0i
 +dpQ==
X-Gm-Message-State: AOJu0Yx6rETYV3CvBsV2ATkViugIXoZIhHZzKuaMKqTzcQydJ11ATsgq
 WEhszHb94oMB4g8+fx82rDnl4V7fZlEkjA4tBfXXnA==
X-Google-Smtp-Source: AGHT+IHysvMtFSF6O669Xv2bhx7ZhUBeQQCoeOyvX2l7H1UnvT79wP5XSYeGDLyK757fMtpNAOGpzA==
X-Received: by 2002:a05:6a20:7a81:b0:187:b14f:a2a with SMTP id
 u1-20020a056a207a8100b00187b14f0a2amr9388562pzh.20.1703064464158; 
 Wed, 20 Dec 2023 01:27:44 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 g24-20020a1709029f9800b001b86dd825e7sm736109plq.108.2023.12.20.01.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 01:27:43 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 01:27:41 -0800
Message-ID: <20231220092741.37794-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1703064464; x=1703669264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DfT47+h84Z0OQN4ZySWOsY/i8LTBq0CVW/SJi99LI2c=;
 b=1qQNCW1A+JFjrIRLkeBZt2dN4gbD0IGgFIiwd8uz3iYPR+WTzENNENR6JuYOvrGUnD
 0xxZFv0xo9QV/vp6IwLuHamEHI9DVvmPocrfVp5m/A4a5Ooz/8PC/Vb0SeNKpQAvKzn4
 HOdZe59Naqn922d5yLD6vq5Ol/AdkNiYvlIomh0RdOiNsQWmhVJJLXDSdLi1jPKBg9If
 t6riKBLy7ArIMIwYEJnIqs/vIlbYMliEmtN1kQ/AjkqZ118NGNqLjuwDHfIz7L5B+Sc0
 PNbmLOuA5RnOoorfz8vLl8xfr07CkqdJ5h7KMKd5Zzdka3nDjWPFnps+bkEj9JEMaXM7
 Sp2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=1qQNCW1A
Subject: [Buildroot] [PATCH v1 1/1] package/openssh: security bump to
 version 9.6p1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OpenSSH 9.6 was released on 2023-12-18.

This release contains fixes for a newly-discovered weakness in the
SSH transport protocol (the "Terrapin" attack), a logic error relating
to constrained PKCS#11 keys in ssh-agent(1) and countermeasures for
programs that invoke ssh(1) with user or hostnames containing invalid
characters.

https://www.openssh.com/txt/release-9.6

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/openssh/openssh.hash | 2 +-
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 4060b95e9b..618b13133d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
 # From https://www.openssh.com/txt/release-9.4p1
-sha256  3608fd9088db2163ceb3e600c85ab79d0de3d221e59192ea1923e23263866a85  openssh-9.4p1.tar.gz
+sha256  910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c  openssh-9.6p1.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 358ef42b6e..ec9e6613b0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 9.4
+OPENSSH_VERSION_MAJOR = 9.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
