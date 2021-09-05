Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5177C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:34:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B13C60F8F
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 17:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B13C60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB64780F26;
	Sun,  5 Sep 2021 17:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxU1We7UCuWH; Sun,  5 Sep 2021 17:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E40580F09;
	Sun,  5 Sep 2021 17:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9BCC1BF425
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91FF64044B
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 17:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mNZE4z_lOfq2 for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 17:34:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A047F40422
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 17:34:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q26so5292976wrc.7
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DYtM5fWSPZ1aa4b3xL8dMsQVGRpmfnsdAjxhR5cXBcA=;
 b=k+dzkTfGwi1YdbJ4LGgDBSQ2nts74AJ2Tna9sCi2Vt5BgNa654OlXlfoDY0QBLpQe8
 WYNv7nGwZHPu5spcyUOG4hbtzhMn/t4rqIKVKSdHVrcd38ehgAj50mHHSvm5GBgxKk8J
 I8BrEcSDMkb8twnCdAvuEj77nDGQFmote011x46pqFWQEHtOqRMIEM13L1joYn13xQka
 oGGqJUZ8GC/nyBRy63kt07F2ek9jQpXmMWludC/023qOoIaJzlGJLGfVPPDRjV5UsUcd
 PhW30CLmjxSbsk/cXm1Mj8UPz2AVUoIB7zpJ2Y4YoVpCLIEBHYGw/+Q6r3DGO8tnA9zB
 pdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DYtM5fWSPZ1aa4b3xL8dMsQVGRpmfnsdAjxhR5cXBcA=;
 b=CkLdmZ9J4BxR/JXgeU0k98t9ErWgquCNEnXjv0OkGGtzvD2Ms3j/gyi8MgzHPQ00uR
 WAuelhne1pYKtRfC5g+IwoodUWUoGPPIM8AwR6UI2PjBGax81AC2zVNJKvTEozceuJvM
 z0yFQTK0MrA5xPDHb6pFBH7yvNNGYTA7akwFeIgQSFx2aXaKed+X87Q/Pfvyj1PzEmZF
 MlFvLew2JkRh0pO3bjKBtDv9VO6jRJRukqtzTshc2OQf64y4aoSAUvSsq1C3zwFF7hXi
 oex0oVLhnzbwRaQJ09+g//l0jaxmRfkFNAwFLDLWpEVmAN3CocCcCuh04nx7tj71nfaT
 o3eg==
X-Gm-Message-State: AOAM531S9tuI9OjrqLlhdg2IIXILViMlFSUYYxruIyOkiFGO5TbUruko
 CQt2O+qTdnQJtHkVlVFQ8SG80Gm9i0M=
X-Google-Smtp-Source: ABdhPJyZ//G935SerqVs6n0yLJFs+vm5No6UZFTc995AXkwthRNkgC7MlS86xqIfp3Dj2kJ9loWGRw==
X-Received: by 2002:adf:8b03:: with SMTP id n3mr9021596wra.439.1630863292810; 
 Sun, 05 Sep 2021 10:34:52 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:e8df:59ab:c58f:7e9])
 by smtp.gmail.com with ESMTPSA id r25sm4325606wrc.26.2021.09.05.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 10:34:52 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 19:34:46 +0200
Message-Id: <20210905173446.44137-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Leon de Rooij <leon@exquisip.nl>, Kevin Tomary <kevin.tomary@hotmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Version 1.46.3 had a regression, which meant the file that would store
the filesystem image had to pre-exist, or mkfs.ext2 would fail to
generate the filesystem:

    mkfs.ext4: No such file or directory while trying to determine
    filesystem size

The regression was fixed upstream, and is now part of the 1.46.4
release, so bump to that release.

Fixes: #14196

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reported-by: Kevin Tomary <kevin.tomary@hotmail.com>
Reported-by: Leon de Rooij <leon@exquisip.nl>

---
For the stable branch 2021.08.x, I'll send a different patch, that just
backports the upstream fix.
---
 package/e2fsprogs/e2fsprogs.hash | 2 +-
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 3661801199..63c7c9929f 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.46.3/sha256sums.asc
-sha256  86d1580facdd49f2e0e6b027e26b1e6c48af538762dc40aeed2a87153c1f11b7  e2fsprogs-1.46.3.tar.xz
+sha256  b11042533c1b1dcf17512f0da48e05b0c573dada1dd8b762864d10f4dc399713  e2fsprogs-1.46.4.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 5528ecbc34..ca891066a2 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.46.3
+E2FSPROGS_VERSION = 1.46.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
