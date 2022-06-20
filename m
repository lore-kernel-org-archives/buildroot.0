Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFC6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BD4418CD;
	Mon, 20 Jun 2022 19:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BD4418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdvXsxQH04eh; Mon, 20 Jun 2022 19:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B524418C9;
	Mon, 20 Jun 2022 19:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B524418C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7450F1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F34182F6F
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F34182F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5mSHpdaPXuH for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:14:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427E682F3D
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 427E682F3D
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:14:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z11so10261731edp.9
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7yhp1QVoCbY7q+i3fsWQZTDwdZx7t1uIYifVa/r5hs=;
 b=NGY9B6yp5S7aFfG0wIG52J+RYarrluoHgukQ1n47jtShKcxzNFtbUq2ZomTbKR4LKM
 gmrDGPJTyzTyGpvr7P9kNk5pbfmpBg5fdx6z+GZXWR+4sbm9yiheYUSX9lBqLgICdq54
 W/mp5auHSP5ao+AVKRcb1ovPo1NtXske0I0KX8Z1VOP2xQOyAvN7f5834iVdEIyjLByD
 1KC62km7Yua+GjDlfSP2zHaCOwOBAaOrVM7sVnf4MIGS5FtMWb2OO+EInH/Sf02GDNYU
 Sc8l3dDp3tcYL9kW9AKF6LlFMULZ/MI2+lcV0tUBaV/wclyTzsnv5iv5UJNKpjhlxrcX
 mEdA==
X-Gm-Message-State: AJIora9dATYgpZmRmeP7gGyMUCa4dwWB6zdugjAz+HL3c0xpbp0ttwkT
 PsWfz/S/PnOQLk4jfPSn0r9qofo2k0gyX1Yu
X-Google-Smtp-Source: AGRyM1vWmXZcWwFIDRgbvfVqzwd9U56/x3F7/KBwDi97wU4PWqgidpxgyaa8haoy5f92L+cUMcWCsA==
X-Received: by 2002:a05:6402:299a:b0:435:c75:64e6 with SMTP id
 eq26-20020a056402299a00b004350c7564e6mr30968098edb.134.1655752472553; 
 Mon, 20 Jun 2022 12:14:32 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:5e48:90c:7bda:e6d5])
 by smtp.gmail.com with ESMTPSA id
 dk12-20020a0564021d8c00b0043567edac3csm7466410edb.61.2022.06.20.12.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 12:14:28 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 21:14:03 +0200
Message-Id: <20220620191403.22187-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7yhp1QVoCbY7q+i3fsWQZTDwdZx7t1uIYifVa/r5hs=;
 b=jb1Y8qkAqGU8ykQRJAG2p5GpKBXq9tEFTZaeFN4mUQrKtyLVdE0BU+Wor3N2jt4St9
 IVe2hLAdDaNjWzQccQXuiJmUwzrkkdyw2dSclak2n2P452MkSpcz4CMDNB3pkwQMiP9M
 xyF2n9rGn5QRBv6DPec2KqUdbu6j4uOcAkPLI4CBjtoVryyK/09F7R989/HcLYHkEuGG
 qC1izDnyYy2ShLbHUNaBW7KdWO4AmNWQH32ysd1RLJWpsXLHAyeDfUe3Q9x1ysp8Acc7
 5KdhpVokF3rbF80axQNQlaUNGmTILhIPpLBRvIeOonrFBmxptnSIwE/wkv31cv4HktLa
 15eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jb1Y8qkA
Subject: [Buildroot] [PATCH v2 1/1] package/slirp: bump to version 4.7.0
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Thomas Huth <huth@tuxfamily.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.7.0/CHANGELOG.md

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 326b2ad246..3f7abdee5a 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
+sha256  358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82  libslirp-v4.7.0.tar.bz2
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 43d2c520e9..10d367587d 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.6.1
-SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
-SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
+SLIRP_VERSION = 4.7.0
+SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
+SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_CPE_ID_VENDOR = libslirp_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
