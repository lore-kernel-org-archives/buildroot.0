Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E41DC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 01:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACF0940493;
	Wed, 11 Jan 2023 01:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACF0940493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GmILCp-l8DA; Wed, 11 Jan 2023 01:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6EEB40476;
	Wed, 11 Jan 2023 01:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6EEB40476
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A4E31BF40E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D51A40476
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 01:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D51A40476
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5-ERxrjSQcy for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 01:21:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 477FD40106
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 477FD40106
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 01:21:09 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id p66so7041594iof.1
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 17:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RK2EU4UQVMTIjRcTHUsHERsFZlj0/j+rYeTIdnz/++k=;
 b=Foni5FmxyibO8xiZD5Jk3IDUpr2jdInDn1pOgAyPxOSOC711nnAzaegRgcCDgpA6oS
 Use5O5Hww1kV7Sxf5xCCLvP4G9nApYVUnZTEq1bQoxQEcJA01fSfFYRNysNCstnwQ0C3
 pEY6cIqqCzLaLUZaPLy/LLSxS/t3ewTi/AL77HTDLiOvFly58+hOl7XSDgma//TO0Eq2
 yGyFxTLbIsmVMOQSxHSer+uqQ8jmJkCqnzElB0e62H7iYrIme8gYBEl+lUpDHTxEpeRO
 thGGDMbKOc10AWpfKK6bZPNuiJJ75G/w/XuBa6B4yGjAEPSyy/AP/aF2USMj0iNqOJck
 MdfQ==
X-Gm-Message-State: AFqh2koOgNELozLjjsrjv6JU4D7UHkoYSou/kfFbHdXn7BrA1XYKmQyr
 0d9IJreZgBkgspL3GlkuHB54MzuZNRknd16g
X-Google-Smtp-Source: AMrXdXuKINHonUAIBZSDXy1UEt84J/uh70+DBMvEDEWjWOIE/P6k9AIkM4KDqwDGZZAMzyJtu+tsUA==
X-Received: by 2002:a05:6602:386:b0:704:56c3:540b with SMTP id
 f6-20020a056602038600b0070456c3540bmr3750898iov.15.1673400068160; 
 Tue, 10 Jan 2023 17:21:08 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 b20-20020a5d8914000000b006d8b7bcaa6esm4628577ion.4.2023.01.10.17.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 17:21:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 18:21:05 -0700
Message-Id: <20230111012105.4075174-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RK2EU4UQVMTIjRcTHUsHERsFZlj0/j+rYeTIdnz/++k=;
 b=jeMqHCbnEBJDSKXV2RhH3TinBkP0IiUyYEFh7VKt4uaghPtMLE0BTtPpkNcFxUYRJq
 kglbr1oWsfOG08ujfligKhxQ9o+dF6/+8qwrINsBkIDvHyKmRoNvhVmfX3MmV7bSevAQ
 s9Vz0IsDUYq7o2jrRkw+YWjW5o8Emg8JF0y4T5mruGFSdd0LUpQopo+9NbOGagwAejWT
 sECi35UWbg+8yGrjLChXdzpbvGETBW8yIViRuuBXZllNT/lCQOQCCazCKInELxor16VC
 BpUncYmUC4RtDvgtByjOQAbWIIO8UKiIQGuSaMsNOtMT+n2S3T1YHfcgmA1+Rvd3OuPW
 5lqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jeMqHCbn
Subject: [Buildroot] [PATCH v2 1/1] package/python-cryptography: bump to
 version 39.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix vendored archive hash
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index a01c8810e3..3f2204eeb1 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  2abbeb6d42e8844de036bf2e0d78a42feeee1d57ebf29a07684490f98bdcab37  cryptography-38.0.4.tar.gz
+sha256  2d00e023261719f85caf360ee061d37ee27654a0344d1376441c8a29ea3bac86  cryptography-39.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 4254fa3557..6868ff4633 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 38.0.4
+PYTHON_CRYPTOGRAPHY_VERSION = 39.0.0
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/e3/3f/41186b1f2fd86a542d399175f6b8e43f82cd4dfa51235a0b030a042b811a
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/12/e3/c46c274cf466b24e5d44df5d5cd31a31ff23e57f074a2bb30931a8c9b01a
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
