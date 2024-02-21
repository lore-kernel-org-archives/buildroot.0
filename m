Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C67DC5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7C8E81253;
	Wed, 21 Feb 2024 18:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNrVirxq9TdG; Wed, 21 Feb 2024 18:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE6C9820CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE6C9820CB;
	Wed, 21 Feb 2024 18:23:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9EF31BF3EB
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6EFF6069D
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USZbMJF199JD for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDE3D60681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDE3D60681
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDE3D60681
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:23:08 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7bade847536so365889739f.0
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 10:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708539787; x=1709144587;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBCPGlFl1d2/KcVzWjOU0Jy7yqwUCEyEjbZODNYN4MU=;
 b=hgfRcQ/Mw681JaZHwRfxn+HQsy1mHCLrvJL4K09t/U2KILkgWYQTqeVH3mmRatcCXm
 t7H96ph/N75mPTLdRUl9BKu1v2wKMpxySnAg0ckM1LrowdZ4ekWbnUvX0cS1AIxZWRzG
 HRLSwbLDmfOdns6nkiIqkFp52JpW7kv1k1n0M1zp1/RO0WjxzlhtneuOe5yLtg5QFXrM
 cNFzvC4jptLBzkORWrqywZVUBagIXtwBe8SBeDPWBHeO6MVqIyysCtru8jlG9BeCrlO3
 4dQ2Efi4kr0FmCZ2bPVa6DyR3Fiu54ey6eE+lZYHHvnBjYc7033V4GjKTyDyXcD8uObI
 VugA==
X-Gm-Message-State: AOJu0Yz8lFwr1tRFsba4pjuKfD1HoWgM0vIBwsKT9UueIYZ5q+/Ib0GO
 00rvpfbGjWVsk6NrqGFnpvAIUqagwcW2o+eHbiEdHCZYT5xson6h8rJPrtZkwUk=
X-Google-Smtp-Source: AGHT+IHq4quzA3NeCwan5eDyCaBTHbgMIsLBLL40GImRssbRadQN4ckcaAHWQVmgh6m+ucfSxs77aQ==
X-Received: by 2002:a6b:6e0d:0:b0:7c7:6472:4af3 with SMTP id
 d13-20020a6b6e0d000000b007c764724af3mr5641595ioh.3.1708539786562; 
 Wed, 21 Feb 2024 10:23:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 v4-20020a023844000000b0047410e4e5b8sm2542960jae.177.2024.02.21.10.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 10:23:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 11:23:04 -0700
Message-Id: <20240221182304.647302-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708539787; x=1709144587; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBCPGlFl1d2/KcVzWjOU0Jy7yqwUCEyEjbZODNYN4MU=;
 b=AczOoogvJGCWDG5WkIB9ysA1yOoHNXleoGRvX0OVIMUlpN9mZqOQ/fNYZeuJDYTiwh
 gH33y1SM1kqjsXWl/nOJS+d5dIuEpSamDXpYgm0mF0TdZctnSTmu+JvfdQZP9bYwH3l6
 KIBIu5jHz3TZGE+0gzYXKJThiuOol3BbuUzzf1iPjH0UTVmAuTaWJN80+0w+nFjIfMvi
 ws94JX93nutzdv8Nla4s0JT14p5aSVVr/sFKmn79bFaF4gZ91RhoNE89i9BiipDA8EY7
 fOX1MWifzTnJGDFVwKblkzL0SbWeXKR92016Bpq0qatsV3rBQRqF4EB1xgQIuQOvF0NX
 Tgyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AczOoogv
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2023.12.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index c19a82304f..19ef3a2724 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ce24032300e2b6a6faa3d22e49f981fd90f04ac6f5d7e802166824b0cd5ca669  swupdate-2023.12.tar.gz
+sha256  89ec8926d66627255fe689ed96ad8d30f5c539315956dacf9890e308095dee3b  swupdate-2023.12.1.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index ca8c140886..3b78c160f8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2023.12
+SWUPDATE_VERSION = 2023.12.1
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
