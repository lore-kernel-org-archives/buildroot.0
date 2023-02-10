Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D6C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE3E461170;
	Fri, 10 Feb 2023 22:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3E461170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIukBbCU0vRI; Fri, 10 Feb 2023 22:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C5461219;
	Fri, 10 Feb 2023 22:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C5461219
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF631BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D99F641B4A
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99F641B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRewmOpxFhIo for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968C141B4C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 968C141B4C
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y1so6552977wru.2
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XR8+FCiHyjsEpP/qxg7FZB13nrLwWq73I0x1+rfH0oA=;
 b=zvwHMuDjsXrDfagVeht53YuqoIzwVuY2GrCZoOSWYxGVDOXmAoIgZtwEafPDuINdhg
 62yc6bZY5eO7T13sv9yoQiLrQ1c4Y7w9+m92lzMs1OkOkT5TrJ5KA4qxQC9oxduWmAR+
 tS55kka2/T6QqwhVKKo2w6+0JRSnRL4XGRny50T6x3eiu7mkWMKl+LPElG5m2yRC4kH7
 oplrbarNFF6OZUKLGA++1UMzWbFpy8XDAq9CYaMjEmeBERcR3DPmtiv44KpU09h85T5f
 0/Z7APNbn5K8q1CygDz6z7Lc/DSWJJlkuKJL2eHFDr1oOqvJQgBFm4qxseqtXMUjEK14
 twJw==
X-Gm-Message-State: AO0yUKUx56cC6xlYo2j241BZ/RxafXeexZMCWZMT+Y2QY0YVhxqHd1OG
 SXU2vlqaZzl3Z8faEL7+nliyzykpnGgAjmUY
X-Google-Smtp-Source: AK7set/TYeNLZJ6e5IzHHBiwlNNMRSWQ3GtoLYKQGheJlftuCSIaW2urpk4liNbBHl9JS6i6h/sx3w==
X-Received: by 2002:a05:6000:1a47:b0:2c3:e43f:cd6d with SMTP id
 t7-20020a0560001a4700b002c3e43fcd6dmr13918377wry.66.1676069249738; 
 Fri, 10 Feb 2023 14:47:29 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:29 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:13 +0100
Message-Id: <20230210224717.3293906-7-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XR8+FCiHyjsEpP/qxg7FZB13nrLwWq73I0x1+rfH0oA=;
 b=PcxYllwGVFV8m4rwyWwcHYdhY0N6gsGdxdmdUFHpwU2z2iIXbUqmoFV0slBVmYh/5b
 2nSrIQEA3OjQtq/Isxq57ZfRLTXosb7fySqdkjE3sPjQ1hx4plJ0hN+HwrUuWUpHKvMy
 yCqPwoa8yFXzVrANll2OOKMyqzgH2sEL5anVI46ndWU70Oabm8Y5jV9VVb8VOvuVY6UW
 dsXG/fL1WMNwZSevX1mHzecasv/EICvP4p22Vv2dNmpyqjZuXGDLaHsEEyfD3lgSxqpA
 N/ipqkf2rtuWhnqmHXz0gmAphjvdRF3lRZROSD6lWp4zEYmAH59Dpi7PscVcYOGRPiHV
 6JUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=PcxYllwG
Subject: [Buildroot] [PATCH v3 06/10] package/libclc: move to llvm-project
 subfolder
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
v3: move libclc before llvm 15.0.3 version bump commit
    move libclc entry in package/Config.in
---
 DEVELOPERS                                                    | 4 ++--
 package/Config.in                                             | 2 +-
 .../libclc/0001-support-out-of-tree-build.patch               | 0
 package/{ => llvm-project}/libclc/Config.in                   | 0
 package/{ => llvm-project}/libclc/libclc.hash                 | 0
 package/{ => llvm-project}/libclc/libclc.mk                   | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (100%)
 rename package/{ => llvm-project}/libclc/libclc.mk (93%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 188a6b9427..203103e108 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2574,12 +2574,12 @@ F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/libbpf/
-F:	package/libclc/
 F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2989,8 +2989,8 @@ F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clinfo/
-F:	package/libclc/
 F:	package/llvm-project/clang/
+F:	package/llvm-project/libclc/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 61d85d60cb..d268a27975 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2045,7 +2045,6 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
-	source "package/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
 	source "package/libcrossguid/Config.in"
@@ -2107,6 +2106,7 @@ endif
 	source "package/liquid-dsp/Config.in"
 	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/compiler-rt/Config.in"
+	source "package/llvm-project/libclc/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/libclc/0001-support-out-of-tree-build.patch b/package/llvm-project/libclc/0001-support-out-of-tree-build.patch
similarity index 100%
rename from package/libclc/0001-support-out-of-tree-build.patch
rename to package/llvm-project/libclc/0001-support-out-of-tree-build.patch
diff --git a/package/libclc/Config.in b/package/llvm-project/libclc/Config.in
similarity index 100%
rename from package/libclc/Config.in
rename to package/llvm-project/libclc/Config.in
diff --git a/package/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
similarity index 100%
rename from package/libclc/libclc.hash
rename to package/llvm-project/libclc/libclc.hash
diff --git a/package/libclc/libclc.mk b/package/llvm-project/libclc/libclc.mk
similarity index 93%
rename from package/libclc/libclc.mk
rename to package/llvm-project/libclc/libclc.mk
index 5d246cf4f8..406adfdb53 100644
--- a/package/libclc/libclc.mk
+++ b/package/llvm-project/libclc/libclc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCLC_VERSION = 13.0.1
-LIBCLC_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LIBCLC_VERSION)
+LIBCLC_SITE = $(LLVM_PROJECT_SITE)
 LIBCLC_SOURCE = libclc-$(LIBCLC_VERSION).src.tar.xz
 LIBCLC_LICENSE = Apache-2.0 with exceptions or MIT
 LIBCLC_LICENSE_FILES = LICENSE.TXT
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
