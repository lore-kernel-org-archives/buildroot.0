Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D48C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 09:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA52981404;
	Sun,  4 Dec 2022 09:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA52981404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZijsMa7Fn3o; Sun,  4 Dec 2022 09:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F02813F3;
	Sun,  4 Dec 2022 09:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F02813F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312621BF284
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 09:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B82A40121
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 09:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B82A40121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VTqFjKO6i9h for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 09:48:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BD8D400CB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BD8D400CB
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 09:48:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id m19so6662704wms.5
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 01:48:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JkVQlnBOXp3ylHmIbM73RelpfhE75iH84SXt7SK6U10=;
 b=NC0AXw3fhj0yGUJXMFRKTribx8Jff/df8zO+AYozGDe1yDhZmcs1UTDkCzkLTr7s2g
 VHwQoiX95ATn6WhtZ1xDK1dp7wM/jtV1uiq0CUWlfBA60KuLMHGMZH/7PZjO/8IMOHze
 tVhBR4tHJenCW4m1dt/dLX1huanaicLyNflwOYZqU1GHUwWHxpDrIGDy00WnirKMKueV
 vn+TtbwkZE2aGibX78k+Ur+0IHYPK1PCYg8/+bzzHYJWIP89tjknpqMnfJb57h7HVU17
 WYf1TWBWhVX7I3C0llGkx8jpKaQAt8+cwZuyW+0czkjk1c71xFt1uA+R5O5tr0n75Vn1
 aRQA==
X-Gm-Message-State: ANoB5pmsJwfl7Gwly/P23pI18Kesxs8IRC742WJGVoIidn2j4nH0gbcs
 3BP3eJRVwSDL2vK6pBpXfwff6lRJuTk=
X-Google-Smtp-Source: AA0mqf4D2LbCvTem7S9teH0tHJWRJhFYBJ+LA2GEFuy/K9HZav1BE6hfa80LFKgoyEZn+uPt2WGuMA==
X-Received: by 2002:a05:600c:4fc4:b0:3c6:c109:2d9 with SMTP id
 o4-20020a05600c4fc400b003c6c10902d9mr47539779wmq.149.1670147322228; 
 Sun, 04 Dec 2022 01:48:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b00236488f62d6sm11701856wrp.79.2022.12.04.01.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 01:48:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Dec 2022 10:48:29 +0100
Message-Id: <20221204094829.148341-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JkVQlnBOXp3ylHmIbM73RelpfhE75iH84SXt7SK6U10=;
 b=Q7OaTX+9wP17lQOCFwIMiBuX/40gRRTV7nzZcOKb8GrnLRdjYSMQO1qCSRIJUC+DQL
 5lnj406VP/EDLQbYqrU8C2Edm/bgX3nGPkGSBX5OVnTwAgRZpUrEZiQua03U9nFgGD/k
 ZctupAir9xdvTBXXn8aa98d9dpsdLmFvxj8k6GYh6RhL8Nc0zLBe1Ksp0uuvJ7E1XafI
 Dhio5dcpLkKOambds1hpwlM8/dn1v9CL+Rx40WeSKPWj6deicz1G/E7QE+GkzLg+IV2E
 hfnwAarkXWu74qf628TwMrV5EE2M9Uqlzk7LqP8e8DIDr5hew+aj4F8RpuGS5y8/sxBF
 8erA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q7OaTX+9
Subject: [Buildroot] [PATCH 1/1] package/python-scipy: fix sh4 build
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following sh4 build failure raised since the addition of the
package in commit e10431db29e08c3ae56c145165bf110bd17f2a6c:

INFO: sh4aeb-linux-gcc: scipy/special/_test_round.c
scipy/special/_test_round.c: In function '__pyx_pf_5scipy_7special_11_test_round_have_fenv':
scipy/special/_test_round.c:2353:30: error: 'FE_UPWARD' undeclared (first use in this function)
 2353 |     __pyx_t_1 = ((fesetround(FE_UPWARD) != 0) != 0);
      |                              ^~~~~~~~~

Retrieve debian patch as upstream doesn't want to fix this SH4 specific
issue: https://github.com/scipy/scipy/issues/15584

Fixes:
 - http://autobuild.buildroot.org/results/b82d8ed02ba5d094a0d4054e0de28e95c9d3554d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-scipy/0001-build_sh4_FE.patch | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/python-scipy/0001-build_sh4_FE.patch

diff --git a/package/python-scipy/0001-build_sh4_FE.patch b/package/python-scipy/0001-build_sh4_FE.patch
new file mode 100644
index 0000000000..17031b89f1
--- /dev/null
+++ b/package/python-scipy/0001-build_sh4_FE.patch
@@ -0,0 +1,27 @@
+build sh4 FE
+
+ensures FE_UPWARD and FE_DOWNWARD are defined for sh4 architecture.
+
+Closes: #1007769.
+
+[Retrieved from:
+https://salsa.debian.org/python-team/packages/scipy/-/blob/master/debian/patches/build_sh4_FE.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+Index: scipy/scipy/special/_round.h
+===================================================================
+--- scipy.orig/scipy/special/_round.h	2021-08-17 17:46:09.254650951 +0200
++++ scipy/scipy/special/_round.h	2022-06-14 08:40:23.531748220 +0200
+@@ -69,5 +69,12 @@
+ 
+ #endif
+ 
++/* SH4 is not C99 compliant, see https://github.com/scipy/scipy/issues/15584 */
++#ifndef FE_UPWARD
++#define FE_UPWARD -1
++#endif
++#ifndef FE_DOWNWARD
++#define FE_DOWNWARD -1
++#endif
+ 
+ #endif /* _round.h */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
