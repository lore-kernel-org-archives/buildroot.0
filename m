Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283C9C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE8CD41DDE;
	Thu,  4 May 2023 07:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8CD41DDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1adhY-gUz7Eo; Thu,  4 May 2023 07:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B7441DD8;
	Thu,  4 May 2023 07:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B7441DD8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66FF1BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F0F583F19
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F0F583F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WtxXlbSYIPX for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0F783F16
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0F783F16
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:33:12 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso10507057b3a.0
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185591; x=1685777591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AfJjNOxdbN/oL6U1yBohX85T4GO0gP6/MVMEiOUk1ko=;
 b=DPjaSzJ4cwXgsAd4deDpam6XcDCUYpgnftgPUyTp+zHXv+hScahVZVIw3sr97Gn3yd
 RfdrqQhtK1PJVdGKc/B4hQDPVyd3IXC2mEi38h/pj8NgAofC+SodhBA5co/4pZou2jaE
 8pcAhTxPSQi5QuoGcnvpqa4rkRStwKq5OWrg0Nu0kA/QOA7G9tUZ512VlRi+Ofg3n7VV
 WtT6ZsiAbBWhdrhvQ8J7kwVi8Eul1sr3alHcvPR+BOpNR+WFOHWwUEvCpUBy18Jk4ert
 fDRRoIiRffWuj6bj789oMu5MEt7So4hJDujO5LKX2sL6OntdQoCBMP0dxaBLqC3pYIP4
 ssxw==
X-Gm-Message-State: AC+VfDxRetT8CY4jnWD7tQqHQrcihsH6QL7lxfEKo3CPQWvwaxjYg2lX
 8hRBWRp9dAqLWd8tRNcBVT7BW4Qq/4iYdm/ybIy9cIJCHVY=
X-Google-Smtp-Source: ACHHUZ5Mag4OeIgi1TzMhL5lh0L3aw2WhyhB2BD/pnS3SZ5vvHVPchGLUwCUFeTQYOpZNatA3vKI1w==
X-Received: by 2002:a17:903:22cf:b0:1a9:a032:3844 with SMTP id
 y15-20020a17090322cf00b001a9a0323844mr3058959plg.16.1683185591631; 
 Thu, 04 May 2023 00:33:11 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001a9a3b3f931sm4178993plh.99.2023.05.04.00.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:33:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:33:10 -0700
Message-Id: <20230504073310.3456839-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683185591; x=1685777591;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AfJjNOxdbN/oL6U1yBohX85T4GO0gP6/MVMEiOUk1ko=;
 b=hXk/LI956NwsMH+i3CU/k/BrbOo6NFd+VP4Vdoex+XlOS1fUR7tZsce0pZP4EnML2z
 1v/sIfnGrJ1zyTSHWgAD6Z/I/mr3DL/wDo+m8Y+pPNs5Ao1owpeW92YpTodwg9QeRmEV
 GSHlL/l0kcnhYPqlmE/m1jB2DuyXXYF1fkaiNc/Yp4YxkDj6BP8Nk3enX5waSjko0BV3
 ZL2I2Bu6VoJD2QhZLJkB/ugF5F3g1HVha+lT7W58cAbIT/BEh7qpY3rhWamHQqJfPBq9
 jWQUfLM/ts9Ryi2lunoeHmhD5fE2Eg+/gi84OC1w0qP+JKbPk6k6eVpDVUYaewL9hFkq
 z6zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=hXk/LI95
Subject: [Buildroot] [PATCH v1 1/1] package/moby-buildkit: bump version to
 0.11.6
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

Bugfixes.

https://github.com/moby/buildkit/releases/tag/v0.11.6

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/moby-buildkit/moby-buildkit.hash | 2 +-
 package/moby-buildkit/moby-buildkit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
index ef927636d9..f7922d7e8f 100644
--- a/package/moby-buildkit/moby-buildkit.hash
+++ b/package/moby-buildkit/moby-buildkit.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1746575f37715a8a2f2df5bab77ea081ba8436854e241792702109fc9e3653d  moby-buildkit-0.11.2.tar.gz
+sha256  1efa1c54b299c463c1b039d3df8ba1c68e70fe4de608fd14653fcebf9f27837b  moby-buildkit-0.11.6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
index a25f676710..91560c1ed1 100644
--- a/package/moby-buildkit/moby-buildkit.mk
+++ b/package/moby-buildkit/moby-buildkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBY_BUILDKIT_VERSION = 0.11.2
+MOBY_BUILDKIT_VERSION = 0.11.6
 MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
 MOBY_BUILDKIT_LICENSE = Apache-2.0
 MOBY_BUILDKIT_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
