Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCFDC05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE10C611F2;
	Fri, 10 Feb 2023 22:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE10C611F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oG_0TIe0o9qF; Fri, 10 Feb 2023 22:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA04B611FC;
	Fri, 10 Feb 2023 22:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA04B611FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC0811BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B056E41B4D
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B056E41B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKegcbiimGmM for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A4841B4A
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39A4841B4A
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id co8so2790240wrb.1
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AXVzyVbrWW8GKuY9mD9x3hfUo4tbK0Da4pFydpacB0A=;
 b=LQ2u5u3PawfUE+uexNG53h8IJBnjZYHhrdApkPkrjzRYUmIKGTTE/T0AxWcj+9Qs7S
 yc+W6E5pQiO1ZCL6Pvbtcg56gEsnUY76FtNeVx7tssU6Ak2yb5hBrk2PsUhwWe/dUvBQ
 klBL7UkxfA4aJEC2LQ/NSKBqTv0RjF+Zm3G6cJLCzooQMB1BhTPzpTmYx51ZOS8JXI8w
 9yFjZEHk2Gr/xBhcXiH40kEY6+/VkmDT6t4zS3u8EdZ4TMVLBm2wQzC3/j9br0QNjgFN
 4PajsWEF7HfmtVEMvxe7N7KGaqM+YOc40BlMDObeb0O70TIuMnryHOrG0vPkfPwKQEZE
 x1uQ==
X-Gm-Message-State: AO0yUKWFNzrbHwFSSLuBRXgkziBfQHLfWH+qqQfdjtP1+xO3u90dVa93
 8nI1zYsJ0YiYRjqBI8aMVIlVp5DznyjJq8/o
X-Google-Smtp-Source: AK7set8aDUQH+8m6aTG5nM4zwZF8EN+wDSp38i5S0dLRulP2yqdjm6ksOPECccm749U808Q2kmRC7g==
X-Received: by 2002:adf:f3cc:0:b0:2c3:ea59:a8b with SMTP id
 g12-20020adff3cc000000b002c3ea590a8bmr16066482wrp.24.1676069246500; 
 Fri, 10 Feb 2023 14:47:26 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:26 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:09 +0100
Message-Id: <20230210224717.3293906-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230210224717.3293906-1-romain.naour@smile.fr>
References: <20230210224717.3293906-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AXVzyVbrWW8GKuY9mD9x3hfUo4tbK0Da4pFydpacB0A=;
 b=PGLUFP2coOXJ/MkzXpSNi5adZdeg+sN0NkWCG8he7hydQ11YgTGj+XCKTqM0UzUEj8
 jz9o/F4yP8IsvlonpUJiSgUu+fz7GQRDz5kjO+GZ+e2Mff2VJY5pQKvgqYvx9QXrtl0T
 pPO5aa8OGFjKOzUHI/eBABY73Q3t40cIdFkbR3ycFY55v72TL/YEu/eaJPbH6SElt8ml
 6bpf5ahosUZjDM1jme44OYtNRd1ZhT295IHr9UG49kkg5o+MXts+bIz9mOQ4qtrpJt2v
 EX5GUDU0pyOUwsjrFnu0lkqOFa3S4mUxJ8HkgZx7YJsYOaILFlaLR2r2nf0iBbgAFnJu
 VvRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=PGLUFP2c
Subject: [Buildroot] [PATCH v3 02/10] package/llvm: move to llvm-project
 folder
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

To make updating easier, move llvm into the llvm-project folder
and use the defined information.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                                  | 6 +++---
 package/Config.in                                           | 2 +-
 .../llvm/0001-nfc-Fix-missing-include.patch                 | 0
 package/{ => llvm-project}/llvm/Config.in                   | 0
 package/{ => llvm-project}/llvm/llvm.hash                   | 0
 package/{ => llvm-project}/llvm/llvm.mk                     | 5 ++---
 6 files changed, 6 insertions(+), 7 deletions(-)
 rename package/{ => llvm-project}/llvm/0001-nfc-Fix-missing-include.patch (100%)
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (100%)
 rename package/{ => llvm-project}/llvm/llvm.mk (98%)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0af1323340..6244b30d0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1619,7 +1619,7 @@ F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/
@@ -2580,7 +2580,7 @@ F:	package/libgta/
 F:	package/libiec61850/
 F:	package/libspatialindex/
 F:	package/linux-syscall-support/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 F:	package/lugaru/
 F:	package/mcelog/
 F:	package/mesa3d/
@@ -2991,7 +2991,7 @@ N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
 F:	package/libclc/
-F:	package/llvm/
+F:	package/llvm-project/llvm/
 
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
diff --git a/package/Config.in b/package/Config.in
index 511e691ed3..629ee8329b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2107,7 +2107,7 @@ comment "linux-pam plugins"
 	source "package/libpam-tacplus/Config.in"
 endif
 	source "package/liquid-dsp/Config.in"
-	source "package/llvm/Config.in"
+	source "package/llvm-project/llvm/Config.in"
 	source "package/lttng-libust/Config.in"
 	source "package/matio/Config.in"
 	source "package/mpc/Config.in"
diff --git a/package/llvm/0001-nfc-Fix-missing-include.patch b/package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
similarity index 100%
rename from package/llvm/0001-nfc-Fix-missing-include.patch
rename to package/llvm-project/llvm/0001-nfc-Fix-missing-include.patch
diff --git a/package/llvm/Config.in b/package/llvm-project/llvm/Config.in
similarity index 100%
rename from package/llvm/Config.in
rename to package/llvm-project/llvm/Config.in
diff --git a/package/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
similarity index 100%
rename from package/llvm/llvm.hash
rename to package/llvm-project/llvm/llvm.hash
diff --git a/package/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
similarity index 98%
rename from package/llvm/llvm.mk
rename to package/llvm-project/llvm/llvm.mk
index 977c0a08c2..1adad17b16 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLVM_VERSION = 11.1.0
-LLVM_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_VERSION)
+LLVM_VERSION = $(LLVM_PROJECT_VERSION)
+LLVM_SITE = $(LLVM_PROJECT_SITE)
 LLVM_SOURCE = llvm-$(LLVM_VERSION).src.tar.xz
 LLVM_LICENSE = Apache-2.0 with exceptions
 LLVM_LICENSE_FILES = LICENSE.TXT
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
