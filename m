Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E7DCD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21DE1400B8;
	Thu, 28 Mar 2024 21:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNQhLwUJ71u6; Thu, 28 Mar 2024 21:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 369CD417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 369CD417EE;
	Thu, 28 Mar 2024 21:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B14A81BF47A
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5D2417EE
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rw08Uzpqz8Dl for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 708DB400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 708DB400B8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 708DB400B8
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:54:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4151d2322caso9444405e9.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711662854; x=1712267654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PeYtt5NBhM/9FIqgary4KCY0C+IcvTf9Ndid2/Binbg=;
 b=Nr/EVYcp+yHXQ8+Xc8c50s7pLSdZieVguWOQ1zMBhAuHoycNd8zBPEm2ReNTiauszr
 w0qxLKb8b4EdHy4rJxTPjHVpoEgz4S83yb+a8bf6skyj7xgANOe49SSPHgNAJNGuU7VG
 ZU8jgjQrCn0rvpyhi1fhDA6p8T7+71X0dFBns3p6u//SKT6hygU1JryxOaMyoltvG8QP
 BbM32D2Tpn8RfqCItftAe0XPNut8fBoxJdYbjJ+8UXa7fPrlWXJ54kqVlzAU5qIZIcVT
 P9CwagFjO4aF2soYQt8fFwfCRQThnuKGoEl18C0ZLZ7Dt/7VzCQ1XQvRVw+uxWlpHcDG
 PEmw==
X-Gm-Message-State: AOJu0YzhfDkyRduhtgdybLlbnZ9et027GATIHYM3tog+8jkGTlru7frZ
 zVglaBKznzIC1tDCPRWFTME9CnGpl+8jx60RsW0fygjskj/NlQTMMYf6Q4a1
X-Google-Smtp-Source: AGHT+IEcbT2sICYwT7edbrEeduo3G2MHzYCiJkM+0GfYsNZ+L+Wt+oRoOyt8gp24LgGWrbQ/lK4WhA==
X-Received: by 2002:a05:600c:4587:b0:413:2c11:f795 with SMTP id
 r7-20020a05600c458700b004132c11f795mr434889wmo.39.1711662854003; 
 Thu, 28 Mar 2024 14:54:14 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 jg5-20020a05600ca00500b00414850d567fsm6675598wmb.1.2024.03.28.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 14:54:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:54:09 +0100
Message-ID: <20240328215409.65813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711662854; x=1712267654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PeYtt5NBhM/9FIqgary4KCY0C+IcvTf9Ndid2/Binbg=;
 b=JW+BdRyP7h+4nqQkV3ywTHP3CJXfyU1pwRlUaW0di11yAzD2zUyuqlq62y3vy9pr2Z
 gGMfXE7WNlGd8WxIYtY0prg5wgQ9THXLvhvCafYr70XNxcBM8vcrAPsweh+Q948x8Gr3
 e3f0tRnrvq2bNZLX9GFEdknSFncNWqCpASNvmXAOron7Ek6ZdT9lGSFkGH3hPRW4Rtrm
 Yg2RZ+lO9fudtcTW7qR+/03qC+f9ShTPhTX5fF53xsEqRW4bDVwHIcxvpSkklslCY7lz
 NGmU/tFHrqwQ610CDwKbDLR3WR+3ie1p9SNVzm5DFVsmb1lxAmmiVQkvC0ifRiymi4pH
 G6TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JW+BdRyP
Subject: [Buildroot] [PATCH 1/1] package/libidn: bump to version 1.42
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

https://git.savannah.gnu.org/cgit/libidn.git/tree/NEWS?h=v1.42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libidn/libidn.hash | 2 +-
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 837424d93e..65201fdfb5 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  884d706364b81abdd17bee9686d8ff2ae7431c5a14651047c68adf8b31fd8945  libidn-1.41.tar.gz
+sha256  d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723  libidn-1.42.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index e1a357de1b..c7b8b4941c 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.41
+LIBIDN_VERSION = 1.42
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
