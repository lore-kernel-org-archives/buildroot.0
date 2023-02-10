Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB023C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7169D61206;
	Fri, 10 Feb 2023 22:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7169D61206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tqriAjRjg_hx; Fri, 10 Feb 2023 22:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A296461141;
	Fri, 10 Feb 2023 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A296461141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 378731BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD8061136
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD8061136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4w-y85LytCU for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAAB6101A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAAAB6101A
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id ba1so6537926wrb.5
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjbhXwJBJk+5etqLzYjbnu0JnZ80yKyhuWb9e08vuTA=;
 b=ahvaUGcSzXrC0rWsV+hCZQqMIopXbytO+WbbB5YuZxlM1BmW5VTTWkxHJX0afYouzb
 OWcuPWYxusmCbN3u57TEa8DeNV/KDczAx25AZ4GcYyvdSuO0k1J9aYek54+jgrWlskiS
 HZEWNe/lKNcWEaczzNvOINO8aDu1aw0uxyqmNx/uOBRlm4Z+9wnP3yvDDprzkzHK+Wzk
 bI7EDAJiMWsF73DBRxJqY9dy19R94kzdCgL/KVLa/o6l3ZSx6N8Pbff2X2hllF114gP/
 TGvsC0LXFtsEGPcGww7/eZOxRKskCdlWIWXjmOCw/sj6dBjg4GrZIvKuzWUnhgpqWc7J
 wK9Q==
X-Gm-Message-State: AO0yUKVSd5XziFhlIEcnyamH9WLJs/Xm71EwotXTPuQvWb3VeB4Fn0kv
 mZXpTkf/PPPssfyDSdK5a7we+sDmEcSHaslp
X-Google-Smtp-Source: AK7set9jLjniCO5RgKWs5TBIlRumoelEalKNAWyvifvqjILMFugJ9kQ/Gktddnh0dVLDtAMnBZz5bg==
X-Received: by 2002:a5d:6e8a:0:b0:2bf:e39d:c8a7 with SMTP id
 k10-20020a5d6e8a000000b002bfe39dc8a7mr18132256wrz.44.1676069248141; 
 Fri, 10 Feb 2023 14:47:28 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:27 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:11 +0100
Message-Id: <20230210224717.3293906-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjbhXwJBJk+5etqLzYjbnu0JnZ80yKyhuWb9e08vuTA=;
 b=R5X9xXM4x5aYC4wOKWJzAu4ttuA2N9RQLj9fuoghcQ4h5bI7V9ayNZX3I/NyioRAYS
 lorCi1sLanpeacnoF+rF4zGQRpPKaPfLxPTqGwlwRbm+RTz7DkrwD9ig8KUQPRNrKJoT
 uTq41dj3K1qSbwHFaOYAOaYmRIXNB7uug6kJ2K4fE+wpjof21T6XAZIn8g18ohMA0Wck
 iJjmCeVDezpq2RxLYnABXEZ7O8so43LMJhMxrzIwNv5G/U79MjXxVZvkRZscTaegXVDY
 l+MFyD0HlC1UZ0CGbq9QX8ErYVkBGzaUdYVjqz+5IR14oVZ4ihGPudVlTo3XFbBQcW/P
 jatA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=R5X9xXM4
Subject: [Buildroot] [PATCH v3 04/10] package/clang: move to llvm-project
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
Cc: Lang Daniel <d.lang@abatec.at>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Lang Daniel <d.lang@abatec.at>

To make version bumping easier, move llvm to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v3: move "package/llvm-project/clang/Config.in" entry in package/Config.in
---
 DEVELOPERS                                                 | 6 +++---
 package/Config.in                                          | 2 +-
 ...-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 0
 package/{ => llvm-project}/clang/Config.in                 | 0
 package/{ => llvm-project}/clang/clang.hash                | 0
 package/{ => llvm-project}/clang/clang.mk                  | 7 +++----
 6 files changed, 7 insertions(+), 8 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (100%)
 rename package/{ => llvm-project}/clang/clang.mk (96%)

diff --git a/DEVELOPERS b/DEVELOPERS
index bbb7e2c2fe..b5494c7f95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1614,10 +1614,10 @@ F:	support/testing/tests/package/test_python_aexpect.py
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
-F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
@@ -2561,7 +2561,6 @@ F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
 F:	package/bullet/
-F:	package/clang/
 F:	package/clinfo/
 F:	package/efl/
 F:	package/enet/
@@ -2580,6 +2579,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
@@ -2988,9 +2988,9 @@ F:	package/gettext-tiny/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
-F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
+F:	package/llvm-project/clang/
 F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 629ee8329b..1065196c63 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2006,7 +2006,6 @@ menu "Other"
 	source "package/capnproto/Config.in"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
-	source "package/clang/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
@@ -2107,6 +2106,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
+	source "package/llvm-project/clang/Config.in"
 	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
diff --git a/package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
similarity index 100%
rename from package/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
rename to package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
diff --git a/package/clang/Config.in b/package/llvm-project/clang/Config.in
similarity index 100%
rename from package/clang/Config.in
rename to package/llvm-project/clang/Config.in
diff --git a/package/clang/clang.hash b/package/llvm-project/clang/clang.hash
similarity index 100%
rename from package/clang/clang.hash
rename to package/llvm-project/clang/clang.hash
diff --git a/package/clang/clang.mk b/package/llvm-project/clang/clang.mk
similarity index 96%
rename from package/clang/clang.mk
rename to package/llvm-project/clang/clang.mk
index 3c75f8d6b1..0943e21a8c 100644
--- a/package/clang/clang.mk
+++ b/package/llvm-project/clang/clang.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-CLANG_VERSION_MAJOR = 11
-CLANG_VERSION = $(CLANG_VERSION_MAJOR).1.0
-CLANG_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(CLANG_VERSION)
+CLANG_VERSION_MAJOR = $(LLVM_PROJECT_VERSION_MAJOR)
+CLANG_VERSION = $(LLVM_PROJECT_VERSION)
+CLANG_SITE = $(LLVM_PROJECT_SITE)
 CLANG_SOURCE = clang-$(CLANG_VERSION).src.tar.xz
 CLANG_LICENSE = Apache-2.0 with exceptions
 CLANG_LICENSE_FILES = LICENSE.TXT
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
