Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B81BC636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C980361141;
	Fri, 10 Feb 2023 22:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C980361141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id axHLdrKC6eYQ; Fri, 10 Feb 2023 22:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03646117E;
	Fri, 10 Feb 2023 22:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03646117E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 622D61BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B0341B4D
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B0341B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSmueYy42cf0 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C157641B4A
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C157641B4A
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a2so6539382wrd.6
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYPTErFgJ2PuhAJacfrfapUT0yN6tltB1FRtvAhSHQg=;
 b=eww5Bq1D8deInoW+3g9e41MF0tPRKCUbQjpRDK5FbZltUdmtD2HtXSXYSh53+fERQV
 OgdF6AmL58/RX82ODI48kJLG9BNj84WNP5W5WWY9LNo/nyloqx0twNHU7hz4XpiPDqan
 rrU0S2W6xaGwyJBXgP68j/CvhVL0VtLFaRuEe/MyzOwBAf/rtFxZFh+WvlSQQRqdEV2F
 5Zfvn395tiFco03y6cUE7UGpEHAo0PTpif96qHsK2VXSSdwXNYFFQ1YDEopBPG5EV+h3
 IhlLJszpYePewjeIo9wGwpknyqiDkdDm65pWhygudDXSwJ8mglVTZMc3TDrXOTrjsADT
 6hVw==
X-Gm-Message-State: AO0yUKWgfLoASuRkwIQnIa7CrX2l+0mrnXo7zUPhrak7l7ea0quE98qv
 W9QKFO00Z+q04VNsGt0KyXMa3Ip+JRdNlZBs
X-Google-Smtp-Source: AK7set+v9BB4zCdOw+vXANEX1PIyfsWQhEH2L0r752aoz9YgSu6OWcf0Iz9oESpW/Eg2UQVFr7J2Cg==
X-Received: by 2002:a5d:5002:0:b0:2c5:4e3c:d390 with SMTP id
 e2-20020a5d5002000000b002c54e3cd390mr192620wrt.62.1676069249005; 
 Fri, 10 Feb 2023 14:47:29 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:28 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:12 +0100
Message-Id: <20230210224717.3293906-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYPTErFgJ2PuhAJacfrfapUT0yN6tltB1FRtvAhSHQg=;
 b=qDm1CEvMWuP2a90PBeLH3T7gO5rbyuxOGwGETyTULAIw6wSm1HJ8vUyuB0e82nBfpY
 vkabG9g4r0FzU1S/z+fV5ipSuYrrSRA/0uxsyc8IyjXUg/LuiOEADP03ecgaSOh0lvo+
 hr9Qj/buzc3HfjOFTqTBQS26S9Q0przlPHOAMU8W4KfVmbK03jYs03Yw/u6NkFrrqf9h
 RIQ1MFBQlFk9leaDpGBdw9kuahSW8lfNRTaXoarcNMT8a7hLyHArAUDSIDMYJ4Kw5Pg4
 ngNC55Qbb8RGm662yeZVnua4FIdmwVYk6L0w1jeNZRODNYTgjAOdFnFU11X3s7200WWD
 PaZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qDm1CEvM
Subject: [Buildroot] [PATCH v3 05/10] package/compiler-rt: move to
 llvm-project subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: move compiler-rt entry in package/Config.in
---
 DEVELOPERS                                              | 2 +-
 package/Config.in                                       | 2 +-
 package/{ => llvm-project}/compiler-rt/Config.in        | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.hash | 0
 package/{ => llvm-project}/compiler-rt/compiler-rt.mk   | 6 ++----
 5 files changed, 4 insertions(+), 6 deletions(-)
 rename package/{ => llvm-project}/compiler-rt/Config.in (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (85%)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5494c7f95..188a6b9427 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1995,7 +1995,6 @@ F:	package/bridge-utils/
 F:	package/checkpolicy/
 F:	package/checksec/
 F:	package/cgroupfs-mount/
-F:	package/compiler-rt/
 F:	package/crda/
 F:	package/cunit/
 F:	package/dacapo/
@@ -2033,6 +2032,7 @@ F:	package/libssh2/
 F:	package/libtalloc/
 F:	package/libqmi/
 F:	package/lighttpd/
+F:	package/llvm-project/compiler-rt/
 F:	package/logrotate/
 F:	package/makedevs/
 F:	package/memtester/
diff --git a/package/Config.in b/package/Config.in
index 1065196c63..61d85d60cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,7 +2007,6 @@ menu "Other"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
 	source "package/cmocka/Config.in"
-	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
@@ -2107,6 +2106,7 @@ comment "linux-pam plugins"
 endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
+	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/compiler-rt/Config.in b/package/llvm-project/compiler-rt/Config.in
similarity index 100%
rename from package/compiler-rt/Config.in
rename to package/llvm-project/compiler-rt/Config.in
diff --git a/package/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
similarity index 100%
rename from package/compiler-rt/compiler-rt.hash
rename to package/llvm-project/compiler-rt/compiler-rt.hash
diff --git a/package/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
similarity index 85%
rename from package/compiler-rt/compiler-rt.mk
rename to package/llvm-project/compiler-rt/compiler-rt.mk
index c8ea86e899..84add60801 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-# Compiler-RT should be bumped together with LLVM and Clang as the run-time is
-# tied to the version of those tools
-COMPILER_RT_VERSION = 11.1.0
+COMPILER_RT_VERSION = $(LLVM_PROJECT_VERSION)
 COMPILER_RT_SOURCE = compiler-rt-$(COMPILER_RT_VERSION).src.tar.xz
-COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(COMPILER_RT_VERSION)
+COMPILER_RT_SITE = $(LLVM_PROJECT_SITE)
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_DEPENDENCIES = host-clang llvm
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
