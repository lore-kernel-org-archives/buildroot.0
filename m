Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE54C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:44:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3E361350
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 20:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E3E361350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFD2D40117;
	Mon,  8 Nov 2021 20:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qB1CJaQ6Mhmb; Mon,  8 Nov 2021 20:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1340D400C4;
	Mon,  8 Nov 2021 20:44:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12D7D1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA8AE60839
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 20:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nmXMk-Mf_ZWp for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 20:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DC9960608
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 20:44:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d3so29111719wrh.8
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 12:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9FKCqTH13f8mH0lc+vJMhz83colp0wUOI1UyF1OXA4=;
 b=Ko5tz4VKa4xEq5lcXS+/1F0ebmAKeeM6W0DW3gTfIbqiNCjmL2jHTCGO96QM3SFc1y
 CMQ7+NtanGfTWoN4T2hv+qNBRiixZzU0hOP2yGZnsiekgj1QweLLD2IMs4TMY7LmMx7g
 tutcjHzXm0Yw8OnyLm+9BYEDPopv9LinZk1pHRyLe8jnm8U/4peQtHCGgixs9ci3PH2R
 YXGgGIDawkfTBxozUH0ff/Dn0jKwRL7wEH/JU40dgB8uUMcJBTk2mV+K7zLtgbjkYWUA
 lXsMx2t5zQAvbdVaAAG9Mq44xckD9pnZ8rRmBgjGhARFM27WVGY6ZOhDKOzq35MJ/GjU
 spew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9FKCqTH13f8mH0lc+vJMhz83colp0wUOI1UyF1OXA4=;
 b=qbi3F/IAffOvLhaSoa7RB48C9VjkTkFWrZdw7LQg9NwNob1TAcKs9Z/xeJ/j5REzsL
 2PNDrOopyVGrtG9a/HTezRdl+v3t0bTBI2loiA7y7fNhy2QglsZzla6azgJ6R/Spt3rY
 lw/ASU6RuMoRWjW0CfizU4TOOwH3XepjfN7eMEL62VHkf5J8nthYsF/73NkD7YPCYrsL
 aeFn0XGEJab7Ts7Canm7znLRsPh3t9y42MAVHn1SVAH8bvO63lg7Qhk+DGenWTKLX2ZT
 FUPmUFH3gIEXn1f0Qzo1bikxcHVnfjkLU+X1wGNsIOrvR2wTQch5n2GNYhhjm4Zsxc53
 CD5Q==
X-Gm-Message-State: AOAM5313NQ9a8LmVQVpPMAg+xwlUlhDcF04vEv78dVGSeJ44k6css8C2
 6BDjX/Mn6d7f0L2xXmlOChzfGM/T5QM=
X-Google-Smtp-Source: ABdhPJxBewFlV1q3Qub2sP5KQ1D6N2v3gSWe4+kL3++Ry9cxjTvt8dLNwjmniouYqlbfYmtLQcfCPQ==
X-Received: by 2002:a5d:550f:: with SMTP id b15mr2376614wrv.212.1636404248148; 
 Mon, 08 Nov 2021 12:44:08 -0800 (PST)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id c1sm17624272wrt.14.2021.11.08.12.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 12:44:07 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 21:44:01 +0100
Message-Id: <20211108204401.19935-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to 1.4
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ima-evm-utils/ima-evm-utils.hash | 4 ++--
 package/ima-evm-utils/ima-evm-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.hash b/package/ima-evm-utils/ima-evm-utils.hash
index 2cdba227ad..2267a59b79 100644
--- a/package/ima-evm-utils/ima-evm-utils.hash
+++ b/package/ima-evm-utils/ima-evm-utils.hash
@@ -1,4 +1,4 @@
 # sha1 from sourceforge, sha256 locally computed
-sha1  034d163533ae5f9c06001b375ec7e5a1b09a3853  ima-evm-utils-1.3.2.tar.gz
-sha256 c2b206e7f9fbe62a938b7ae59e31906fefae4d5351fe01db739bd8346b75d4a7  ima-evm-utils-1.3.2.tar.gz
+sha1  f23d8a406759a469b0223b0bfb302ada4407a1d1  ima-evm-utils-1.4.tar.gz
+sha256 fcf85b31d6292051b3679e5f17ffa7f89b6898957aad0f59aa4e9878884b27d1  ima-evm-utils-1.4.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index cc53e02dd6..7ee34d5e1a 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMA_EVM_UTILS_VERSION = 1.3.2
+IMA_EVM_UTILS_VERSION = 1.4
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
