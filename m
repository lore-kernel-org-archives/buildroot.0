Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AA3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B88E60724
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B88E60724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E515681846;
	Tue, 26 Oct 2021 16:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRrF-8HhJCMz; Tue, 26 Oct 2021 16:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F74E81836;
	Tue, 26 Oct 2021 16:32:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09F511BF4D5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90EC40520
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1DMqSL0Z_-Cx for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A7354051E
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:32:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v17so19028061wrv.9
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8ANd+sZrf4R22CI5tRyIq6gxgzyhHz5MVZpRKWLYsc=;
 b=XfVE8nIj8Wyq7YMYR6ZS+U4BvWD4Z8aF/0lo7Y3M1SNeFYEs9MPKKwmDtmfoUdpT34
 6hbq9Sz8Rn1RgOU1eWF8Sa1VUqjwdl+pZL3I2PkvAMoVSQPqB2VvGRRbcyVjAyGOc7Hd
 l7sp7KfzcYGFai7XCLnH6rkQlRSH9UCN/hYQA4vcf/ZqJuMu5kND6OwdEru4FKr/dFeo
 bJOFrcCbkl2cipvvs41IJAOdx54f/UaY7YZEiISrHmNZUDMb+JdA/HCTthbPwi78h2hT
 KbHRSypZWgPZk/m6Oj2goSqFcL47CS31EZzbc+I7MiuBetqJaSFZ5r6oJqw98NDWLD4d
 KBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8ANd+sZrf4R22CI5tRyIq6gxgzyhHz5MVZpRKWLYsc=;
 b=QiEOHOGZRG5FVJy8QOwzOQXMyHCTBfiNI9OmwZdXos0hVIoe/tNHvA9XO1dFQ+iyz5
 KC2EfEqkdemyMglahwtMylW0txnVPBW30DApTBO+2CRSDmgkLJk1wgF9a+LTfFWFV246
 9cH7/Wc2nUiabfwF+VUlXO1V9OogN9e+KDdFfT8F/cq4IM9Oerp3utPMh3Jmg1v/WSkH
 cP/GmHzTwYeNg3QJol/2GDVBX8+YU2dq9DcnZeX7F8DT5vjlDVPHpyCxUcWOgrQo/gO3
 Cfr6nzpqQ3HT7KrGbooGw+7H7uTdFS5d6r9nemNjyl4e4vpzD0XBWnHXid+dxf6IQWq4
 gicg==
X-Gm-Message-State: AOAM5325eqAb+XT55L5d2wBVvkaCeJTwQlh62mRC4VRF3G0Rarak9513
 sjFpAmvaImimsxdeEgn8gC5yswPosXQ=
X-Google-Smtp-Source: ABdhPJw4RHq2jbzmT3CDGOw6dT/kQbe1MXj99UVLnNb/6TPJg3qj3KEFStkOOpBoks/LuNGu7GXPyg==
X-Received: by 2002:adf:9b8e:: with SMTP id d14mr33279066wrc.288.1635265938020; 
 Tue, 26 Oct 2021 09:32:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o26sm1027404wmc.17.2021.10.26.09.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:32:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:30:26 +0200
Message-Id: <20211026163027.3852789-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/vim: use LICENSE file
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

Use LICENSE file which is available since version 8.2.0105 and
https://github.com/vim/vim/commit/c838626fea42ed5924ee6084d87d1b37b2d7b0ff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 1 +
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ce04e5cf5d..8dad275f49 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256  12cce47b81e12779b7d58faf879633be1b668f54a5417a5a24adac50413b3b3c  vim-8.2.3432.tar.gz
+sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index f1ed3c342d..a94dab4bd7 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -22,7 +22,7 @@ VIM_CONF_ENV = \
 # GUI/X11 headers leak from the host so forcibly disable them
 VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
-VIM_LICENSE_FILES = README.txt
+VIM_LICENSE_FILES = LICENSE README.txt
 VIM_CPE_ID_VENDOR = vim
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
