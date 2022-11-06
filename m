Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4C4C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 12:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC7181C44;
	Sun,  6 Nov 2022 12:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC7181C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evSgzNMFULHu; Sun,  6 Nov 2022 12:58:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 763ED81C21;
	Sun,  6 Nov 2022 12:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763ED81C21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7DF1BF5A4
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 12:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37EA481C20
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 12:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37EA481C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSegeszWebcQ for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 12:58:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18D9381C04
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18D9381C04
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 12:58:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk15so12660200wrb.13
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 04:58:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jggdKfSIpeKgtmw7fBZpRUWKFYHjoXyWI/POxqdwZWk=;
 b=igumMTMbuqChNBbzbwiu3FKc0M4re9WeEL1J7NDvRPY554i44wFF5TOob25gRbbO0v
 8HiGNbmJhUcJivxMyKO7AUIqtvbquRP1v+PFVZOhnT7swGA4o9d5J4+F7RaMWwt2mRQD
 hMNchwWplAGFFuzinz45f2qLhd09ZfDFKfjmEQGUsX7+vqPVeM1dxxnbb/od7lLNig9c
 GfyRWUx5wpYrD0Nq4W2vW03bu92U6gOpocVvgoDbLjtwTFq1BwwXO6hKzkIuEjZGTMT4
 q8ffjyznBMQwkO3W3LdbQkvIP3Gr1OKdypoXZwOMGfrCfzoFSe6GdIJeeCTLP86qdtMP
 SSqw==
X-Gm-Message-State: ACrzQf2b5InvMrHlD8aXa7PKLVf+TLPI48A9yIHx0wENEl412INbligh
 3nZcUZZDN6YQy2KEGOZvymKYVnUPAR4=
X-Google-Smtp-Source: AMsMyM5HehWzxJO7pt07DG4965Nro5A10YiSksbnlhER0iBu//DUpZOU+yBjDRtHMya2m0vP4X/lPA==
X-Received: by 2002:adf:aacb:0:b0:238:2bc5:9e6 with SMTP id
 i11-20020adfaacb000000b002382bc509e6mr13116559wrc.335.1667739518686; 
 Sun, 06 Nov 2022 04:58:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b0023647841c5bsm4594123wrr.60.2022.11.06.04.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 04:58:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 13:58:30 +0100
Message-Id: <20221106125830.664168-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jggdKfSIpeKgtmw7fBZpRUWKFYHjoXyWI/POxqdwZWk=;
 b=Rglx9TWsYMRF8LTmEUGtQnR3BiN9XbH6FI7RcYTj9KiTwbdgXQGqfU/bbtVhPzYYSB
 N2KGJjos0XPZmdAmlJI3SJNQ26tpn0nHTOn43p62+O4kZNtGZ3tiQeqsfX1u08Y9lbdu
 iKZn9nCTx4lKjjClu3oHA/bresIwI+ttnhkgR0l77sxEbyWonRnb43WRT6FKVk3Pp7ZL
 GJg22Q9K1FYUJBsUCTsRZDdKnAXpRD9x0D1M7P9UL7cvAznFdA8hSw8cxMJu5Atv5S5B
 4mYeDFNsbg61q/7fD3g7JNiQb84paN8+6PTF1ohMpCNijDK4jr7PpcK510nD4Ln+jQCe
 RPQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rglx9TWs
Subject: [Buildroot] [PATCH 1/1] package/zlib-ng: fix build without neon
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

Fix the following build failure without NEON probably raised since bump
to version 1.9.9-b1 in commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14
and
https://github.com/zlib-ng/zlib-ng/commit/ec02ecf104e1d3f1836a908a359f20aa93494df5:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/zlib-ng-2.0.6/arch/arm/adler32_neon.c:11:
/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   31 | #error "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/8260762632cde9eb5bc2154084680b5bec034aa6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zlib-ng/zlib-ng.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 938acd4181..aa65d8437d 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -18,9 +18,15 @@ ZLIB_NG_CONF_OPTS += \
 	-DZLIB_COMPAT=1 \
 	-DZLIB_ENABLE_TESTS=OFF
 
-# Enable NEON and ACLE on ARM
+# Enable ACLE on ARM
 ifeq ($(BR2_arm),y)
-ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
+ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
+ZLIB_NG_CONF_OPTS += -DWITH_NEON=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
 ifeq ($(BR2_powerpc_power8),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
