Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5859C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08B961184
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 00:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E08B961184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD29403F6;
	Fri,  6 Aug 2021 00:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6zqfJIGNou8; Fri,  6 Aug 2021 00:32:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94890405B8;
	Fri,  6 Aug 2021 00:32:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9501BF2C9
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C662403F7
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 00:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDzH2yGuvtXJ for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 00:32:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F70A403F6
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 00:32:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id nh14so13089929pjb.2
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 17:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BrLZp24Q59Rm3yvQsyK+/3XMrHd+v9IeO0YeMBdLAA=;
 b=hPBvpLlLPGronZijzxZvFNcNmLDmAkWFlxUG2/CtkBFT6iNvT3p+Xy16jSEjRmkZ22
 QiMgjLCiV5QUChgqTsDr6nzHKRl1qbwKgdQcXf//3WR1AP64Q/8jgDzpOdaKfMbAJQiV
 JVsBnBx6Rlwy95CHP7AF+A5Xf8z0Es1vDauGrnbt1KGtu70dDUKgc3hXGXl7a4atjo3T
 qZd+bhoaoMqvyljtLc9oo0R8Vt6HfcoHA7/kHxSXENV6LSJMhOoEq/ljgVgUzztO+D1D
 j8cc/31nbFIgiEgI9A2M39digbAMvyCeSC9GZK/Kq7iumL/nfpydDUfEE2bViCAzU0s4
 dYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/BrLZp24Q59Rm3yvQsyK+/3XMrHd+v9IeO0YeMBdLAA=;
 b=ANS5UPFMhqhFeWFdpwc4+YGCoL/t6y8OwtnYm+R7gEvswzZcKNAt+gXz0krZBzY2mX
 TDeeEQ9STCOnpYdbs4ytELp5In7iIc0HBwMH8kse8/6CIkQUZ5yVcrOaHh84gdIGNUrx
 oavAdem8BNbZjMeWcO2mr8+Cyb8ueAxef4iXiocuSz48ua+njSfwo6O5TC27ZI68I4VQ
 /Hcj8RZi+rIWu2mWfftKE3YlA8d1uvANb8ViTTOSOoUSdD2UZ/mdTZ0QZuzKMLlWPg6/
 p/OWqbknyHxijA4b5NGuNIqwEUfjICNmwbQ1tunKNLGnIScQfdijI9pKRlsnFdXuUb8E
 iLjA==
X-Gm-Message-State: AOAM531qq/wzPJqctN893KP0iqCclaY3e3Cjxsc3X8V9Ql7XAaq66Rcs
 J1Kb4p7bxwypKEO/O9kol8t1OtC9gbc=
X-Google-Smtp-Source: ABdhPJzUvau9G7H+IOu+iugM/RGK1jlyYxPwOJCb4cBbQZADlprxlbhxGPInwi2OinP6ubB+NnmOxg==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id
 g15-20020a056a0023cfb02902d5302edc77mr2063209pfc.63.1628209920865; 
 Thu, 05 Aug 2021 17:32:00 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id m16sm10921535pjz.30.2021.08.05.17.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 17:31:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 10:01:44 +0930
Message-Id: <20210806003144.455964-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/glibc: Use 2.33 for RISC-V 32-bit
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

RISC-V 32-bit was special cased to use glibc master as support was not
in a released version.

Recently 2.33 was released, so RV32 can now use the same glibc version
as other platforms.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
I was adding some glibc patches and was confused by the version
situation. I think this was overlooked when bumping the version to 2.33.

I built qemu_riscv32_virt_defconfig and boot tested this in qemu:

# /lib/ld-linux-riscv32-ilp32d.so.1 --version
ld.so (Buildroot) release release version 2.33.

 .../glibc.hash                                             | 7 -------
 package/glibc/glibc.mk                                     | 6 ------
 2 files changed, 13 deletions(-)
 delete mode 100644 package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash

diff --git a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash b/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
deleted file mode 100644
index 558591522e3a..000000000000
--- a/package/glibc/2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99/glibc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated (fetched from Github)
-sha256 c3828224d69a42f5b6982cbec8ae01cf494fe975ce9023e36ff2c10a2fb93e42 glibc-2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99.tar.gz
-
-# Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1c8c40987812..1eff2455881d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -11,13 +11,7 @@ else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-ifeq ($(BR2_RISCV_32),y)
-# RISC-V 32-bit (RV32) requires glibc 2.33 or newer
-# Until 2.33 is released, just use master
-GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
-else
 GLIBC_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
-endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
