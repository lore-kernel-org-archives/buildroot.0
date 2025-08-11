Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2565A412AC;
	Mon, 11 Aug 2025 16:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blYr5XkFTBJO; Mon, 11 Aug 2025 16:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCFAC415FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCFAC415FE;
	Mon, 11 Aug 2025 16:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3136154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B04AB83F15
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2BDZ_bq8KVz for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 16:55:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0D6383F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0D6383F0E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0D6383F0E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 16:55:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af92aa183bbso50613366b.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 09:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931347; x=1755536147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yK6+xiVvK5k8P1kJU8Vamc3Xa2AdxIB8ftUAITuQfQ0=;
 b=FPDUGDIObcOXdw8zMTc/3+VnqsI9oNdwiKJoZ4o4qoaO0tKMuvb48xZMVHSwwjnYrc
 UDUFXACnMDOAI8LmFV/GtNLARgiLQHGapJT6IL+j3dArxxP9yxrstejEhMzL8dvkT86e
 YqSpP5uSTqlFre/MCQtnuqjLDeuRL/R3MRjNtb///rcKDntrIwKZNraNoYCb+hYQOK+a
 0w7ihQtO3OVLlpJjfF0mEpZPWDImwTCjDLs6d1J2i8CxP7WNF1kx5WKXQR4+othCkfXz
 lDPze9rfNH+uSO6pXbyE/Lx1u10aspY77t4ZULgDkr38adeufnHstjpjtleAeSH3KtDB
 ujZQ==
X-Gm-Message-State: AOJu0YzQx5jh4yfmQdgM78hN0dyMz4NliW3Qr7FzRgjXzrE2FDD6P7Tf
 DbAhpuT/oJmzdEiLAoj4yutAjwzSPC4lHH0gRjpBQynRNQ/kJQH4gVNjmrWpZA==
X-Gm-Gg: ASbGnctkv6KC9Buw1v3gWkuQ9QfZfQmScwLDuCTEJ2KX5id0ldt5k7dQ4+JccWfmKpf
 H1hdMHdSenrMCoNKat+Q7dDr097DzimBqLadWml8AdqCmxQhx1if6wELPGAZAivKzHlhX2ZkuuL
 vQ129xnWuYZ2kC0dwAMcFsavNhQ+viRs8ogvcmcTJZYGrlZIIuPkgVslosYyFchVn5gJkODR9UM
 DESshVeGsx1nRmWBxmkR+NWs7AkrdvwPYwewHmGlq1XD1ppxEnfUH+oapY/mMQIilRp1wmns2Tm
 +sGBHQyrNHtVbV3lHMHRdLWCYfR66XsvCfqNuLo4Nrj1LkkRGROTn67asRXvbS+O+QGFDRlSX/U
 D9i343yCP9VX2txkI6DLUfBk4K8iyJA==
X-Google-Smtp-Source: AGHT+IEukr9zVIP0OLsHRScpdrU7ypTjRIKikxBRecotidV6T9zlGzDiUOaN48njwSKvogYR5dJT+A==
X-Received: by 2002:a17:907:a4a:b0:af9:a9ea:f42f with SMTP id
 a640c23a62f3a-afa1e11a5b9mr5428666b.9.1754931347296; 
 Mon, 11 Aug 2025 09:55:47 -0700 (PDT)
Received: from skbuf.lan ([2a02:2f04:d005:3b00:15ff:6865:527:c8f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766e2sm2044629166b.27.2025.08.11.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 09:55:46 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>,
 Romain Naour <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Arnout Vandecappelle <arnout@mind.be>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 11 Aug 2025 19:55:21 +0300
Message-ID: <20250811165531.1533913-2-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811165531.1533913-1-olteanv@gmail.com>
References: <20250811165531.1533913-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754931347; x=1755536147; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yK6+xiVvK5k8P1kJU8Vamc3Xa2AdxIB8ftUAITuQfQ0=;
 b=ZwuzlMdFSnwwUZYRMdEDioeD2IAI5vDBjRa9x/89UA+wDPofbjoYf4eXa9iFwotjC7
 9nvsy0uWCzjwNyE2a7SeGtuOsPdldNKTdU69w+tVT/ttogO8akq6lXj3kHgufoaJ/NOv
 3xgb8w2lFJL1DY6/rYuHkeSolZg0XC61hf896OgX9qNThJKRK2FeaAtQzLLkUozbpMb5
 1MbR7FUZpT2w2zBaMvmrGNDTUZuhbBqsDAB/lCQabIsgmu/+D29hZsR2frJV6rx1BA0n
 oLme2qH3rawTWslkt0l+Br6ZX7H6mt8vl3QaxtF1mHccwXcIKwito5drIb1LLVsSpSD2
 ryBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZwuzlMdF
Subject: [Buildroot] [PATCH v3 01/11] package/qoriq-rcw: bump to version
 lf-6.12.20-2.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit we were previously on, 45e6925, was the head of the master
branch and now became tag lf-6.12.20-2.0.0, which we can use as is.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 35e39efd1faf..1bdd38446da2 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f99ef0620dc49c6a0b9d03958cdb8a3e559907351fccd4814fd37b80d1324e97  qoriq-rcw-lf-6.12.3-1.0.0-2-g45e6925.tar.gz
+sha256  cf1caf7f45989025f8564c5edd9c98650082ebb2d091239292d3db8d75522164  qoriq-rcw-lf-6.12.20-2.0.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 512c4ce491ab..35602e41e43e 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.12.3-1.0.0-2-g45e6925
+QORIQ_RCW_VERSION = lf-6.12.20-2.0.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
