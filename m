Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588E0C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 21:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C84460ABB;
	Wed, 18 Jun 2025 21:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPiCqvKw0unp; Wed, 18 Jun 2025 21:24:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF7F60B44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7F60B44;
	Wed, 18 Jun 2025 21:24:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D4816B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5B0440B76
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUMKGvWRF3uL for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 21:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2E2F40BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E2F40BA0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2E2F40BA0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 21:24:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so925115e9.0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750281841; x=1750886641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MV0+O0jWi2Tf17730QldLfS/w/qEhfr69AZqz7zsey0=;
 b=aQdUscDPrnnecrvdj0R8FSgGqLp9ecJ9Mqc+JuYNsQqIgEkEBI+uT6dd2xeqDHCHYV
 hPARuAJY1pjL1KIXAdSu1jhRl3q3ddR85uneVwjY61oB5xJjKuJKtS03KsafcTDtaWWr
 jl+sAcRhWHszgp/EJfTeitzeKRQxFZE+e3WJpEzLbwCYs28TsBCop+4VVCPlPy1nikU3
 KvIrQ+eMakyrD2qnzTh2b7NhYgrFGJFfwRcQcWXrJ4wF002UBBvSeX4agRI6dZWUAg6s
 Le4mPua5UJ3eJdkMFnWtlbkaezHnlTRemiV+qUHI6ttPyYdtUTT4HlkaV6T8DnsGa/xo
 QYOA==
X-Gm-Message-State: AOJu0Ywwh8dupT/1Zi3IH7HRKw1ESNs6VXhydQDcN+gOBJhOBwtXtq+S
 d55068JhmwfFTMEHpKF8577MJJl66ps9Qb8PNV8ywrisq6Bnw5v9PmqrgeBkU/FY7elOUi1AnEE
 zdEwF
X-Gm-Gg: ASbGncsjIGk49BKdCP8mmYZky175c0vn4LVI+G0zK8h7mxDeNRD2M/PDYKeyRk1wEDK
 0UBdUZAlQvCXNFswzsDLXm0PemizT7fc780LcCU/X8SeFPAXolSue1/bu4aLi4QHEe/tMkin43A
 JKRwbL0wcpX9UmxfySRDTvpFgj2sBzngtYS/Y/YX6ShlLLufjOWAvgmU1mESBq9FmoHBOPwM43u
 FVJpu7YAhgu7YjXqHPFazPC0ofd+5lhB85g2QDkr0ZFap2uaLxRVN1UrWTACm97m6BQtUcT9HoJ
 p6+TuWK0RvPE5g25TGQkeC1OYe0lVgKT0UEgf0LOX6Eh19Rij2XI74ctwe021p+Js2QAjMHthPt
 bTuVeS/jopgBylbh84eByZPSVo88kSvQMuq+KrA7hWie6i9/QDdhjJNMIWf5H
X-Google-Smtp-Source: AGHT+IGSvc/eLoPHH71muPTLnDmnxjmVSZ5bR3CB8PyoVVQ9LghlqY2qSsHozFmy29kvRdE3oQEbUw==
X-Received: by 2002:a05:600c:37c5:b0:453:9b7:c214 with SMTP id
 5b1f17b1804b1-4533cab805emr178228255e9.29.1750281840596; 
 Wed, 18 Jun 2025 14:24:00 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e98b50csm7998535e9.22.2025.06.18.14.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 14:24:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 18 Jun 2025 23:23:57 +0200
Message-ID: <20250618212357.189395-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750281841; x=1750886641; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MV0+O0jWi2Tf17730QldLfS/w/qEhfr69AZqz7zsey0=;
 b=aJF7rs9QRy7Fe0UVmPOaMXqN6C2o2587IKD/0qtwvBmdza9WQyYa1x5xC6xgQ32sr2
 amQGd90U2MU18asGsDvT8Q5bDavtzu1RCqwr7lS8XGgCLrfKExcsw27h50scH9gTyHmr
 0ouUjgtoad3tYv0yQRHHW+vCrIhsHl9mLNfT0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=aJF7rs9Q
Subject: [Buildroot] [PATCH] package/squashfs: update URL to source archive
 after Github changes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The squashfs 4.6.1 archive hash has been changed suddenly two weeks
ago by Github without any intended changes from the squashfs maintainer
[1].

The orginal squashfs 4.6.1 archive has been manually uploaded again.

Update the URL to download the archive that match the expected hash.

Since we don't use the github download helper anymore, the squashfs
archive name is changed from squashfs-4.6.1.tar.gz to
squashfs-tools-4.6.1.tar.gz.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10355448207
(and many more...)

See:
[1] https://github.com/plougher/squashfs-tools/issues/313

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/squashfs/squashfs.hash | 2 +-
 package/squashfs/squashfs.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index bc45b4ab5e..c921d638bb 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-4.6.1.tar.gz
+sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index b9fbf54b01..f2cb0ab25e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 SQUASHFS_VERSION = 4.6.1
-SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
+SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
+SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
 SQUASHFS_CPE_ID_VALID = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
