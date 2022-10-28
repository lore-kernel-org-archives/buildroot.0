Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED4AECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 22:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47F07402D4;
	Fri, 28 Oct 2022 22:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F07402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTa-qGv83k4X; Fri, 28 Oct 2022 22:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C2274032B;
	Fri, 28 Oct 2022 22:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2274032B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 969A11BF228
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 22:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7163781839
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 22:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7163781839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DbHYzfuZf7Ru for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 22:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A2481842
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65A2481842
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 22:38:48 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id c65so2448569iof.1
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 15:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iSzD3Gd48rZpxoerAAbj+WPGaKGDVenTf0yFtb1wOYQ=;
 b=MxfSIi/b7Dwc0lc+DzHv2J6ekGVPaK/gdDcyy2c+kBNHNVA1eLk+FQjl6iuIZOi06x
 KcmXQLs10eXDBuInHTIwMUc2CklkMUhs80tusNAzKM3o+1rdwwMFvu4GluXuz7iCshXk
 sxjcCQ60V9DIvqPLgoftKPiQQu/5TEOXAEAfSr5VaDknLJ5x58yNiz60zPJ1rvJ+7Ty0
 vU6pIF5hTwDAHTJRXChuW2EzcwGN1WMOj2O0SmnpwfKVpwEa0uOx07wY3tCHW8gBYbyo
 E+tSko/VkeaTGvqqPp25oC/ysbWqB9IM1Ng6Kc1LCD7CL2QABulzGDh8XrPAZwPFugTg
 XAlg==
X-Gm-Message-State: ACrzQf2XZD/5uKMKV4b1HkPHlVf5LHlFIfOuwp0ZP3zA4Bg54OYx+3gD
 ctEmIjAFK98PqXO0ZJKX306RKF9eIlgGXA==
X-Google-Smtp-Source: AMsMyM5LhIyH25leNxUHOVYWLqPkmRc5IeCe91jdY2gdAaVl/NLP1yLgyFb6I11Ot64wGrbLxTRJlg==
X-Received: by 2002:a05:6638:35a2:b0:364:451:9969 with SMTP id
 v34-20020a05663835a200b0036404519969mr928031jal.245.1666996727175; 
 Fri, 28 Oct 2022 15:38:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g26-20020a05663810fa00b003717c1df569sm2142827jae.165.2022.10.28.15.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 15:38:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 16:38:44 -0600
Message-Id: <20221028223844.1180418-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iSzD3Gd48rZpxoerAAbj+WPGaKGDVenTf0yFtb1wOYQ=;
 b=AQytIu/cJdJzVGVh+eb+qwRWbZ6y8EdjlaFFS6b4HbfOOc62W+DiuVwScUTmBiWiUd
 AIzkQPyT+2hLgoidVt/D3B51rNcHHRmZmcHnnfGe18bTsQsD62PWne2dp+lIqr8Gf0bh
 kycg64P6m9ZwL5D7MDNWhd2e4+HVtaPoMM+jInV/y/bOA5PPpdGvFYxH6LTy1YaRqmb8
 nVCBscEITstrcYsqW9Qav2EWLsyTuI2DX887zbr7YAl6LpoQfM3rdWqmU2vq0BOIpnq/
 1CwKU7WGhVoxocrPHq7lIDNIwS8YHRMSqC1KIOwj5VOwcEMHQJadT5J4wiEkHD4VrdnS
 qMIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AQytIu/c
Subject: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On some architectures when building with -O0 the __register_frame
symbol fails to get optimized out which can cause linking failures
when building glibc.

To fix this set -O1 for GCC target libs when building with glibc
and BR2_OPTIMIZE_0 on the problematic target architectures.

Fixes:
 - http://autobuild.buildroot.net/results/89b/89b6c6924240b7cf82035a844f3573673e91b364
 - http://autobuild.buildroot.net/results/46f/46f4ec99d2b23d354a4bb5e92123d64f0da6ed27
 - http://autobuild.buildroot.net/results/839/839f929f700cf181ebdf34389c7806a96f55813e
 - http://autobuild.buildroot.net/results/0e2/0e202bf53a683930f3cad6edef2a4dea629eaecb
 - http://autobuild.buildroot.net/results/8a8/8a8c917f597fdcca744e696e19e9300b64004335
 - http://autobuild.buildroot.net/results/c05/c058b27ed2834dfa633b63ec6c3639ab1e8bf412
 - http://autobuild.buildroot.net/results/8ba/8ba8882a861cf7df359c23969c09b2be0725b2e5

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gcc/gcc.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ec6f3b550a..a339f77970 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -103,6 +103,15 @@ GCC_COMMON_TARGET_CFLAGS += -matomic
 GCC_COMMON_TARGET_CXXFLAGS += -matomic
 endif
 
+# Enable GCC target libs optimizations to optimize out __register_frame
+# when needed for some architectures when building with glibc.
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_OPTIMIZE_0),yy)
+ifeq ($(BR2_microblazebe)$(BR2_microblazeel)$(BR2_mips)$(BR2_mipsel)$(BR2_nios2)$(BR2_or1k)$(BR2_sh),y)
+GCC_COMMON_TARGET_CFLAGS += -O1
+GCC_COMMON_TARGET_CXXFLAGS += -O1
+endif
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
