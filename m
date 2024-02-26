Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F6AC54E4A
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 17:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA50A60815;
	Mon, 26 Feb 2024 17:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30_0Y_19bMwL; Mon, 26 Feb 2024 17:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C465160AC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C465160AC5;
	Mon, 26 Feb 2024 17:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5F91BF3E9
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 17:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A23C60AC5
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 17:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzIA9vVb4llf for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 17:32:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A7D260815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A7D260815
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A7D260815
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 17:32:10 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412a4848f0dso8755375e9.1
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 09:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708968728; x=1709573528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mPYTrZn30f+prNNJXmWIaCEiEJWb80EuNovEqLJLdow=;
 b=NnCKBi8GUvbN22vPdvvGpWfRO48RemrRu3KWxosQQUjn6GSK3HpzA5zrJyfwhm1tVH
 g3W3Qal2M7KCicvptNamPFc85oKBma7jfQXMNtAzpr4se0jMeHcbkTb30hmvzRxOs0ql
 vPtd520T32HcOcM8wgBLL6FIVql9/UBU5vxTiOMrPdm7NpCrW/uAnuC1wUQ9oCOH/Caz
 RSOmNV+80Cboj213+Lq8+GgdMhq5jSOTIFCLFRxctsKoE0rwaS+aG/Zdody4Ph0AE1tc
 7gk3nUCReoTMEYvr3H34GXHivio55j8CZCTdMHteYgThaR0BzeMGC/o9U6PgPQORdlFg
 FmrA==
X-Gm-Message-State: AOJu0YwAiksar8PF/OMEtjn9mhtVo0/baBhyLBP8Q7eYtyVMqE5izcaq
 K3udLs+/npdLcoA1eyvaJAYCk7DdgxOu+DNqS1Fk5U0b1z0bod8N9/V/aoZS
X-Google-Smtp-Source: AGHT+IF5cyX5E0EtY0emJF5gRKxEQelwNOuwQIgMqDokF+n8me9swRPkcgCmTAjMlCycAmLnbW18Xg==
X-Received: by 2002:a05:600c:3152:b0:412:9645:c4c7 with SMTP id
 h18-20020a05600c315200b004129645c4c7mr5452900wmo.19.1708968727935; 
 Mon, 26 Feb 2024 09:32:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b004126ca2a1cbsm13043094wms.48.2024.02.26.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:32:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 18:32:02 +0100
Message-ID: <20240226173202.1032744-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708968728; x=1709573528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mPYTrZn30f+prNNJXmWIaCEiEJWb80EuNovEqLJLdow=;
 b=kuHcqwoR+7w9ANYTwAhLxJ40YOqxKRjH5ebR4M/MdvTGUq0SqxtDGiMJOoC1khhE9+
 bAspVuvS4JO5mfacjv8skG4ylVaAmPdXm15nUneNBANxuHh8OHzhZ0l14LU5TlEDM7a+
 nf8f6kCiDTmR9ZxZLj+SkOqyVXD6CRRP9wZ/WpbrBBfE5swOahJRH1J3BLOMCB1E4cnL
 cCgqa1+CBljF1YxI3ocGM24ZsZiico+CvJiAIhyomdN74Lp+srHDYNX23nl4OrC+zRqk
 37pu+fzrgZRalw9CGaUINhozlgQHOq0WvcsA5tLXhgJVFpEd2NXUdg01hbhO4BnRWCRg
 Liow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kuHcqwoR
Subject: [Buildroot] [PATCH 1/1] package/poco: bump to version 1.13.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
expat to version 2.6.0 in commit
9dad5e7d7f7bc03e648621b9be6974e7ae39a467 thanks to
https://github.com/pocoproject/poco/commit/75f7042b70092e79c6b770b18d033a061c84e2c5:

src/ParserEngine.cpp: In member function 'void Poco::XML::ParserEngine::init()':
src/ParserEngine.cpp:510:17: error: 'XML_SetBillionLaughsAttackProtectionMaximumAmplification' was not declared in this scope; did you mean 'setBillionLaughsAttackProtectionMaximumAmplification'?
  510 |                 XML_SetBillionLaughsAttackProtectionMaximumAmplification(_parser, _maximumAmplificationFactor);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/pocoproject/poco/blob/poco-1.13.2-release/CHANGELOG

Fixes: 9dad5e7d7f7bc03e648621b9be6974e7ae39a467
 - http://autobuild.buildroot.org/results/7fad881f85d3b89abdee35388088965f05ead277

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 9a7981171a..0a1e900b3f 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  71ef96c35fced367d6da74da294510ad2c912563f12cd716ab02b6ed10a733ef  poco-1.12.4.tar.gz
+sha256  c01221870aa9bccedf1de39890279699207848fe61a0cfb6aeec7c5942c4627f  poco-1.13.2.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 2d0233a8ce..f8c2a658de 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.12.4
+POCO_VERSION = 1.13.2
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
