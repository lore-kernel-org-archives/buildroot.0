Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA8C77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B339841731;
	Mon, 24 Apr 2023 20:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B339841731
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mo9U22NpIoqm; Mon, 24 Apr 2023 20:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3F84174A;
	Mon, 24 Apr 2023 20:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3F84174A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CB01BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7B64116B
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7B64116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaWig8weaYSM for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB7841787
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFB7841787
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:26 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-51b33c72686so3744986a12.1
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367926; x=1684959926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amwC7ThPMf+c2gfxunXE5rDbvjDH2nBygBc+yHndyq4=;
 b=NwbNIyeb4vDmMGEZYseGJt7lo941d5gaqKqi092SH3H4Q1EZS5W/3yTeGdHqPDnVL/
 kvRrRpBKk5HIdvdC5EuTCdu9abo7ZxYvDjrQNFhUtFi6ckIHTF3SkVwOKCdzpZIf/7Tj
 DK6zUmvqrUsi8rdeUDf0vP+WAbnOYMmVKQEv+lVrfTORE9B485DOBtU0gAl1p9iSXoEo
 W5sj2QVElf23T4Av8TK/ZRF/VYL5MbBkI0R9O9m6fO1FH5kDNn191/GU9N/U07qLD/fN
 sj25kWbuTd+RdVyp7eRyHvg3+bEYAGRpIfhy+a2M0AG3PlB2oHPJL6ib4GSAzPsfcbpC
 ubZg==
X-Gm-Message-State: AAQBX9ftf7dz3wfhz8rDXL7Z4qkdvbbxJutgcqRa6YclBF/+TdUfxU1P
 0gM6nPVoG0+L8r+ulrcqtFWhcKasKAXg5w==
X-Google-Smtp-Source: AKy350YrLzrnLit3Z35f1zDH9fWxfpPNlI1MlnpMQKFjJAArC7mmRI2/wIeR9Njhoq1gm3gBeL3Qpg==
X-Received: by 2002:a17:90a:b290:b0:23b:bf03:397e with SMTP id
 c16-20020a17090ab29000b0023bbf03397emr16482805pjr.24.1682367925937; 
 Mon, 24 Apr 2023 13:25:25 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:25 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:09 -0700
Message-Id: <20230424202514.1546092-9-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367926; x=1684959926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amwC7ThPMf+c2gfxunXE5rDbvjDH2nBygBc+yHndyq4=;
 b=lSvcTlMIhkAszaAApehQXyoAxEQzUS1PpV35UkmOHqMcX4hQtDKjB3f87L5L2O0joV
 Tf0lY5nur/GMV6nHNn2hL/yCC+8V9JZVRAScRcYG2cNGMNgnUQWHO/nVfuo+M65Cyknb
 Lm4r9kIMdOvcsSzSWiO+yA/Z80+atv8TKBWReO0ostSBYhzpGtBe5CXD3zLokeYqDvDm
 UyZxlPT2PpRTWMYthsdb91fP9GcOCSVzWnaVLeJD07/diEbfAq5Gichwp/Phu4oNX+l5
 1fZ5IN9GXNB4U8aF6fxIilN7YSF+QkQPnlvZBdv/RroZbGCzSa/RMniEXusiUFYonWni
 VHKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lSvcTlMI
Subject: [Buildroot] [PATCH 08/13] package/restorecond: bump to version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/restorecond/restorecond.hash | 4 ++--
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index b38c6dcf14..215c9192f4 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  218c3d8873f31764e3c82d53ac713c0c9faaa07caf42ed7184e93ca2b27d8f27  restorecond-3.3.tar.gz
+sha256  f00d8caddb6aba2793c65e69154d04671b52f3d37e081b0e96c1b443fe23c2fe  restorecond-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index 7d6ed86f08..cd40905230 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.3
+RESTORECOND_VERSION = 3.5
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
-RESTORECOND_LICENSE_FILES = COPYING
+RESTORECOND_LICENSE_FILES = LICENSE
 
 RESTORECOND_DEPENDENCIES = libglib2 libsepol libselinux dbus-glib
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
