Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFDFCD98C7
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 19:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE2DA8125E;
	Wed, 10 Jun 2026 19:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZF7Bo8sBknN; Wed, 10 Jun 2026 19:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C13781199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781119780;
	bh=u0x7LjjcUeubbobQzngCJKSjoDlDgps0kONL3J/GPEQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=B1pZhBvf+fE4b16SNQg8X7RDI7MT8szB/J03HwGdqWXQKYZgCOAanTTYdk4BjatSl
	 x3vjH6lpuvVpb6KiVmlGqAd7CcI8piyz2EnJ90Eae45pFieURYqOkhBzflzR8T2lcm
	 NyI63sXSRO7qnAhxnFYn737/gSpeRwES/tGHOnKq/GWccIL8XmX4iKS+XB6JjED1lp
	 isfnI4Xfj1cHCFbr3IHUKDApleOQmNzyw8IjSmxA5cvC0e8inwiXJRKgNgLJw04iHR
	 vvAVf9IgK16gnZZkP1H4dbit3WAqOcFLq+pRR27MP3giXDcC7rl+fOcd+LceR8qxH4
	 yIbPw8eeEPgeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C13781199;
	Wed, 10 Jun 2026 19:29:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE65325E
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABA5481199
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7Ad9dVN84bd for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 19:29:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2c; helo=mail-oo1-xc2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA4B98117A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA4B98117A
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA4B98117A
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 19:29:37 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-69e49452f35so1934314eaf.1
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 12:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781119777; x=1781724577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JcXLXGM6qV6P61evEUZK+yKW4cbLeLXdNKhtNZsAwA=;
 b=pHpOERziqdd8Z/JVL//cCkZ0fzPxX1Cd3gv8da49JPLxjHpw6vnbK8sUYUBFJbyN3W
 quPaPafhkUZCRo7WsKpEMXg0wtAd/tI9ggmHdcKLUA238Aiuq8aFX3DiaODAlsqZFMWK
 HO0BlLzwXbr2SHbbEce/R/Y7LSGftVtkKnMHlbdQU+MIC2m3lQlzjAhUveMliEyhYB0e
 bZGC5FhiRvoXQryjso3mg1qxYkbWgcPlCP8VVvtKJCHfgAEk7VaJRpLq6cSwsN4ywCtP
 19y9lwwROBYSLC0ra0vpDhrFji16ogFNrTguZRst/gqdezrt35HU1dAgdsl/TaTlKMrM
 Mbzg==
X-Gm-Message-State: AOJu0YxoPIbAlBTDh3wJFXApIKG9bz8lwpwz1sUj0WoFTDxFTsyHS/4r
 2p4ipGxKgqFEiMeSpvHWwUBI4TuZEUJiz56Sv3Uitp2s2ad6CwAbHLOuzjij+EQ8
X-Gm-Gg: Acq92OFmB6S/QoDKudQGN8wpJ24oGHUJZCtbPC0F6YOp4ZamZxx+Mo5v9SHBwN+qe2Y
 23WqBlJZlAUssp+n6RR0pvLYoQxtXaoPNUIO+4jPkxiwf5Ymz90JQ5DuEPR2d3WqlRjIiunTVLP
 zTaqOKkFsf3zvfbDq1tKzEExM0bmvtEwe5vEizTAz9L5keFHlusrORHPZZFgoWT5wbdEuSkRMiu
 Uuvgq5+Wa3xDybHixZvK/fNt012mnLx2awA1nsQuww2Md3M0u60YNORfOO0wlLn/H29JPsvvBLW
 ILapYDSjBZDV0Knwyx3afjZXGsENJjOo4L+6POn+qI20yRpQKlymWkLrZYL6bqmDGKOm0LJbUVZ
 AIRt6TN9ann5nj+qu/SOVTbz+ng0m9vIaoArwP/rn9sZjdkqHMUeb2t1EHK7z6mjFj0XeavBcfx
 099qAdshXuoblvE4HCak8bJNBtxYeOqnMGnQ8i5mHjv4k8Hiqni6smMaUSzMfkVkXDtjEPhtsI2
 S3EVYqkGyOytRYzPLs4wBOhFtbT4TOTRoCcrqsx2Hm9iSsytyvUHq8iKkA0YxkGd50QLprqbf6l
 DfonJRT2XmpY+YXhlhXFg+VXLqCa1eGSxgDq
X-Received: by 2002:a05:6820:168d:b0:69e:8929:13cd with SMTP id
 006d021491bc7-69e892917femr11227802eaf.54.1781119776529; 
 Wed, 10 Jun 2026 12:29:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-16-141.hlrn.qwest.net.
 [174.29.16.141]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e4623cc02sm13572674eaf.4.2026.06.10.12.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 12:29:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jun 2026 13:29:32 -0600
Message-ID: <20260610192933.1116376-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781119777; x=1781724577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2JcXLXGM6qV6P61evEUZK+yKW4cbLeLXdNKhtNZsAwA=;
 b=fCcGFqT6Xp5bIh/UXGLK0NE8Yh08KHmGkDTPl4h0ctppMn/XNWXLrMLfq6h4zUM430
 TWnILWAL+aPxBYgNJWSk+8N+Bl6wD7euIFUUScVOIpse1PQ4I8Qp32YobGdPqy6K1BMl
 Kyvs4oYtEM/jazqVCpCayoJPYXS+Qxro0euHVwQXKZa6fSjSqRezAxEdC009ImtXk7oX
 dmiBOQgmI0wj6AEORxBYV066J+IUrLqAYpS2+AaHVbYru119WtfF9ZnZFFwco147SqSR
 os6EEdN/AA5hSxLb48Kwg8O/H4nS1RSqOYNMds6Fge4nJvfIBDI3pVhGZxtlPMuhQKw4
 ILhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fCcGFqT6
Subject: [Buildroot] [PATCH v2 1/2] package/python-uv-build: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to version 0.11.20
---
 package/python-uv-build/python-uv-build.hash |  5 +++++
 package/python-uv-build/python-uv-build.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-uv-build/python-uv-build.hash
 create mode 100644 package/python-uv-build/python-uv-build.mk

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
new file mode 100644
index 0000000000..b313423ff5
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  75eccb7a450a78848efe73900df9abcd598196e9d9f3d4d11d2ac57e606ac44a  python-uv-build-0.11.20-cargo5.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
new file mode 100644
index 0000000000..0566b4a3c0
--- /dev/null
+++ b/package/python-uv-build/python-uv-build.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-uv-build
+#
+################################################################################
+
+PYTHON_UV_BUILD_VERSION = 0.11.20
+PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
+PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/ab/4a/61c2db7c24c879155ea06a78930f2c71a9a6241154fe46de27af3219a73e
+PYTHON_UV_BUILD_SETUP_TYPE = maturin
+PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
+PYTHON_UV_BUILD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
