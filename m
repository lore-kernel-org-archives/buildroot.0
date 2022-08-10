Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9826CC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 05:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1745B415E5;
	Wed, 10 Aug 2022 05:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1745B415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vonJZuhNbMmc; Wed, 10 Aug 2022 05:31:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A65415C9;
	Wed, 10 Aug 2022 05:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1A65415C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2841BF4E7
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 646F4415C9
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 646F4415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9tGC8c4rUet for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 05:31:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 360BC415AE
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 360BC415AE
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 05:31:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id n133so16542025oib.0
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 22:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=38t78lDnxPBWrSz2xQsXRCPKdZNAPmWx0S0w8Js2nps=;
 b=SFoNpimEvg2dn4t5qrlEugoTwU+n0VDTZdINaIuir00z6nqTCfUNEvBXm6IU61gBX1
 FkXK67OW8JC5Nz8LAqsU4HPsOAuGomom6mxDbOhou+G3RtYgKbbqJNTavkihUvAxHOH1
 lq0S2JH8ZO3yEbdi93k3ksLYuVBR56GWP5F5/TuR2+mljyj303K7vYixdDktNPH3ODqY
 wReNgnzgwmwwNx8TTLETwilw/mo9TuZfyizxr+b1geYZZoT3a2pElU1n+hH6KZS1P+O6
 ePqFoPREimrO7xbmstBvkQy68/nrIzxTHrBo+ka+f3nxyD5fwvQkH1euKdjffirIjtEM
 o6Qw==
X-Gm-Message-State: ACgBeo3reqITWm4Mbd1DDjdk7MsmWGOGNhv3oy0m/JqFs48opgkwqfII
 h7QUEDV9bJ/AeNTuzQY//hyAgaB5CoE=
X-Google-Smtp-Source: AA6agR6bVKMP08yWoMVWBrmGTWS1KxLwrHiBTo/6n5AGsVLtgPwQOcP3Ny2ZlD2ErATzIIgj+hko7g==
X-Received: by 2002:a05:6808:2009:b0:343:60b:6dec with SMTP id
 q9-20020a056808200900b00343060b6decmr729220oiw.1.1660109467701; 
 Tue, 09 Aug 2022 22:31:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 y24-20020a9d4618000000b00636c81d4109sm527263ote.46.2022.08.09.22.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:31:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 23:31:00 -0600
Message-Id: <20220810053102.2625513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=38t78lDnxPBWrSz2xQsXRCPKdZNAPmWx0S0w8Js2nps=;
 b=XA0atPacmfprpEAFXFoAYO9XAM2G6w4rSTXDwAFaDIOVr5wvC+ZIzOVq0C0h+jIKeW
 DoYry47hpnb4VOBUPRD9hP97N2bwOy5ddUrR0caJD7oXzIMYFWiZV1n5fz6iYVG1ocqa
 pj0BV4R1DCRHOo02tAMtomCGisnPgeADqJtksWk/Bc7zSYXXaSWDbjapRFdks1VmQAI/
 bzjAjbIJx861cV238ENnwAIsDqtNZMa4tgMr/jnG0qZ2izRfpCpy7UEtrtMEqXP9og8x
 mCnuwyWB0KgXqA5jiQtiJqL/aYfOPuusAwQawt8k1O6klxgr/wba2w88HZakccTpwRRZ
 c8ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XA0atPac
Subject: [Buildroot] [PATCH 1/3] package/python-setuptools-rust: bump to
 version 1.5.0
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
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 3215f2b65d..066d5d8a48 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  c51ca03d0a6a91ffc3a036822a2deb54  setuptools-rust-1.4.1.tar.gz
-sha256  18ff850831f58ee21d5783825c99fad632da21e47645e9427fd7dec048029e76  setuptools-rust-1.4.1.tar.gz
+md5  b38674b0b0f8b21063a07d442aa0d759  setuptools-rust-1.5.0.tar.gz
+sha256  0b8aeb814afe0e9d7c31569ec0936d1f5201993530639244fa973e1742005671  setuptools-rust-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 44c736ed11..846ff84356 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.4.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/ed/c6/8effd679eb1cb6d3fd9fc7837cf86c6e4c1ba7a33c3e5e35c741c04016c5
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/20/84/a98f6714ec6aafe3ec2bfa26232af3302453882a1c135f9b518a36275e22
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
