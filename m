Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A2EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 08:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01EA860E08;
	Sun,  3 Dec 2023 08:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EA860E08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUu028wLvCmY; Sun,  3 Dec 2023 08:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AFD2606EB;
	Sun,  3 Dec 2023 08:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AFD2606EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD641BF391
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 012F281D5A
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 08:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 012F281D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrDP8JqL-gXh for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 08:43:02 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3C9F81D46
 for <buildroot@busybox.net>; Sun,  3 Dec 2023 08:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C9F81D46
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54c9116d05fso912823a12.3
 for <buildroot@busybox.net>; Sun, 03 Dec 2023 00:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701592980; x=1702197780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VXI3KLiYfYG4BoBXvEeARinhu54elM/oGI+iUta181U=;
 b=IpTRdm/XogeX/lNYou6Cpf5xP/L1pc0MxI8LOhzzmVDTB8GExTYrPMEsogkwImV1CE
 j0VQZZVNBQPvhJmAJoAofPqFlpnybZQg9dw7eMGmKWd52l88UTp7tG3n5B2roih7nKwp
 auFyMYcKEtKqHMSSY4g6NIoEs/fonI3cuNkg2RdIxMXI+RMVTxxsje5D/o7RT4BImdwr
 d34I6r/L+wvL9Gjip4/2PtPqP7zyp627LayFf9HDj8gVi/qeNKK145dkOdF+aXSqwOD8
 Eu2mPcxLKYYfwOF11UwqFx156SxDorOASMIFAze6me/qENxYboE5HeIEEw12wW7T7YAy
 ZI6A==
X-Gm-Message-State: AOJu0Yz8TGw/ORQ2lydjjlOgIglQPKpOc3PH6E1QhZ052CAuQpB+9r9l
 An9L4+ZhDdF89VX77z7OjuYpe5GfIfE=
X-Google-Smtp-Source: AGHT+IGqzM4WUlMuIIYnXKU8yvgTGUz6PTVl37wZgDArC6Vpk6qjYP1zVSAHaLW6nJa19TC1o9GHZA==
X-Received: by 2002:a50:c10a:0:b0:54c:4fec:fa with SMTP id
 l10-20020a50c10a000000b0054c4fec00famr1022318edf.137.1701592979555; 
 Sun, 03 Dec 2023 00:42:59 -0800 (PST)
Received: from vm.. ([77.131.35.51]) by smtp.gmail.com with ESMTPSA id
 q9-20020a056402040900b0054c0264a7fasm3426380edv.64.2023.12.03.00.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 00:42:59 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  3 Dec 2023 09:42:51 +0100
Message-Id: <20231203084251.1328575-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701592980; x=1702197780; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VXI3KLiYfYG4BoBXvEeARinhu54elM/oGI+iUta181U=;
 b=LEbDEUy/n80SyEaPnaXgm97C1UOpTMmQUKAqEHhCEMt67j5VJ0aR/QoCpk9HyV+B9P
 /TMc7VihCfaGLme1pukboQkWiUFLyck+DGoSEGhX4HNIWvjn3CUUHHn4yTtHIgZ72UAh
 1k+zs9pm4tFB2f2q6B58+pGdkH/LMPlMniM+EP2KUoVTeSYOYidg4dVt3ETDquoZf4Wu
 QEfS960we2SMsU9PniR5AoOPRH/j/upJI4Nky4b7P21ppo88CRmrFZWwXRWHAGCSTPej
 oPi45uRTqVyZKBzRBC4C9jIsUWOW82H20chiNTlSXS02kQx47N3/UZkXzhvaBUf1cn6/
 /3pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LEbDEUy/
Subject: [Buildroot] [PATCH] package/perl: security bump to version 5.36.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2023-47038 - Write past buffer end via illegal user-defined Unicode property

note: 5.36.2 was a broken release
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 667b09221..983b921e2 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.2.tar.xz.{md5,sha1,sha256}.txt
-md5  698ae4946b28e38a729916f04cc389a3  perl-5.36.2.tar.xz
-sha1  9bd6e3f7c333e2e5f14c8650333fc29da3df2d90  perl-5.36.2.tar.xz
-sha256  19445f09ea9f6ada33297010d5b76ac46be565568d1a4377a6bc736cd795a128  perl-5.36.2.tar.xz
+# Hashes from: https://www.cpan.org/src/5.0/perl-5.36.3.tar.xz.{md5,sha1,sha256}.txt
+md5  17946060e6279cf32d08edc92c40efc3  perl-5.36.3.tar.xz
+sha1  9949e79c92171b39f4fb2b19ffd4ea293b8dd589  perl-5.36.3.tar.xz
+sha256  45a228daef66d02fdccc820e71f87e40d8e3df1fc4431f8d4580ec08033866bd  perl-5.36.3.tar.xz
 
-# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.1/perl-cross-1.5.1.hash
-sha256  35d859b49bab274021d8a61511fd39a70a58cb727223de5b54342898155cf5e0  perl-cross-1.5.1.tar.gz
+# Hash from: https://github.com/arsv/perl-cross/releases/download/1.5.2/perl-cross-1.5.2.hash
+sha256  584dc54c48dca25e032b676a15bef377c1fed9de318b4fc140292a5dbf326e90  perl-cross-1.5.2.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 735adea01..71aef9997 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 36
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = https://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
@@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
 PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.5.1
+PERL_CROSS_VERSION = 1.5.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
