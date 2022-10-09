Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81286C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 107CD82BE7;
	Sun,  9 Oct 2022 22:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 107CD82BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFS9FQPH3JGY; Sun,  9 Oct 2022 22:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 373A782BC4;
	Sun,  9 Oct 2022 22:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 373A782BC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD6751BF47E
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 22:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97490414CD
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 22:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97490414CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62hpCxheNV0q for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 22:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68CEA4136B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68CEA4136B
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 22:06:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n12so14538536wrp.10
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 15:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Ar0c9TDKVYuGTdWUFvuHSW1hB4RnKXnnNJWLwlZR3Q=;
 b=cuJbi67S2nTb2qWsLVXMjRezVStJRFd4AZW6vCSQSjSm43m7fpl/6MgAgt19BGp1g+
 /4BuN52Bd6TTukubakqsByqGAPm3PUiOTBv4JqEQF5pYM21vll0jtAuIS/kRiBR79/u7
 Ejrx4FCyxSiBkH8t/nBMkgv/46cdkVaT8WuLsrqosavqALFubv4a7LvUzc5SMgs5DHSW
 aBHFO8qwiFfN8jfhgXCTHTXpX6ir5tOeQ3MpYpoJo2AGjwyyE3eDtiyAQtqiRZwsoaJA
 WUVZgv/zRzlirUXBz2xEM3qLVRSdvhjp32sgjGhjuwEVVju8NjF/8FNuerY0dXY33IQH
 OT7g==
X-Gm-Message-State: ACrzQf2IY2cp/516eeeRdHW/qNAdhLWtIi+L4mMPSUfrNhHtSCbes7V1
 nmGkO37zkxSGc9Jc4x6JX9l8bakaq0Y=
X-Google-Smtp-Source: AMsMyM5L1F98Ze1C4jaieauXX3GJXSEvnUKT1zY+PMfbU8Ub7WHcQkvCBo3UBGP+4IqBnCp1YDBqGA==
X-Received: by 2002:a5d:6d0b:0:b0:22a:ca5b:a37e with SMTP id
 e11-20020a5d6d0b000000b0022aca5ba37emr9542049wrq.383.1665353201234; 
 Sun, 09 Oct 2022 15:06:41 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003a342933727sm14866921wmb.3.2022.10.09.15.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 15:06:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Oct 2022 00:06:38 +0200
Message-Id: <20221009220638.319188-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Ar0c9TDKVYuGTdWUFvuHSW1hB4RnKXnnNJWLwlZR3Q=;
 b=h5vC57D54Nm7x3jIBmtvbPtJcSNchfC1YVBVy0tJ0vB5zqI2dD8bm1Ybw525AMJX/j
 DFprmJC/J7U2Ne40UlDS+EQGkeu66jfGUEJLO8YLVody9Bi1RJHWVVp3T9wgrg72VbQW
 Eb0m0HZPT1sZpR6++izeYTi/8fM1SsJunqKOrNagqL3zL4GVt3agAvTubg3Cn0IMvg8a
 x6xIHc7hlvz0cbuW8NPnA5PXTl2gy3vINHlTUqjVaUqF3jJC10v77Kb2u0bi4xPVDyvw
 dJt0z2o/pTHoU6W8hEnK2wYPQBAJtRb+lJ+5+64CqCwr2CnfjXcVpiQiNKsFWop0sSnb
 6KoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h5vC57D5
Subject: [Buildroot] [PATCH 1/1] package/isl: bump to version 0.25
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

https://groups.google.com/g/isl-announce/c/GkHKH-nVWw8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/isl/isl.hash | 2 +-
 package/isl/isl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
index 001fc9d115..46d8e920f3 100644
--- a/package/isl/isl.hash
+++ b/package/isl/isl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  043105cc544f416b48736fff8caf077fb0663a717d06b1113f16e391ac99ebad  isl-0.24.tar.xz
+sha256  be7b210647ccadf90a2f0b000fca11a4d40546374a850db67adb32fad4b230d9  isl-0.25.tar.xz
 sha256  3a2c398103f6bca0f50a9a9465deca9230b370b0212af5fdf31ed88a36215c30  LICENSE
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 51e608b304..ce9aaecebc 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ISL_VERSION = 0.24
+ISL_VERSION = 0.25
 ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = https://libisl.sourceforge.io
 ISL_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
