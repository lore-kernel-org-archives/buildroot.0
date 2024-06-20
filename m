Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4CCC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749F840103;
	Thu, 20 Jun 2024 18:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLC6v7GOlKRF; Thu, 20 Jun 2024 18:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEEF40186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BEEF40186;
	Thu, 20 Jun 2024 18:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63F951BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51886614A6
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNizOB5oYVd7 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2489361487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2489361487
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2489361487
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:21:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4247f36f689so5998775e9.1
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718907706; x=1719512506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tzrFuAR5iud9frtpv4Lw2dJF4KYpfiiFjFBniJ4mP+I=;
 b=gl/n3nG2Q1vHsY5JA2HiNummi2yE29Q6/TvaRhrHSabRXdkPgyE4qj6DdOqeDjV/Kn
 /kjGv04W+YKoWj3JzCa0DtBVp0gcM6EyTlHyH3IIss54kasQ2gJPjrzWGrUplrhZvwSQ
 mLTkrFjyoTAYnSMiOGzo49lgGKlEpB7LiWPQtpBEZ6opIz6SSHGR4XOO2u4SyjQhajHP
 cz4RiSjdx2iNwhNS8oFFYtzhnp0S8ICP5sKW/QcZob54fhY9t3ongHegq2G2qYQ860kK
 BgY4+ERphvwodnWHtYtVrw2Y5z9hEIF2q7QE9bCIRVLVNQ4R7i3+Wlc6Lp2iFwqshWfE
 l2/Q==
X-Gm-Message-State: AOJu0YwT2JKKwrUc1oliZJSBz53PKfKYjufY/JJibjpSzrXYqkAxxFMP
 eEv4yZbBebTm9NgD0LxhlCqrZ0i9/avEk8UM/UbqNU39OHrLxi7b1Am5uw==
X-Google-Smtp-Source: AGHT+IGUjz5Vxv+FpzD4mfCBftbE22osabb0f1dkSN74U6CV0yWS/3RPLEzFPb+RWzwjXciFdtRP2g==
X-Received: by 2002:a05:600c:6d5:b0:422:47a:15c8 with SMTP id
 5b1f17b1804b1-42475173e20mr45094575e9.12.1718907705711; 
 Thu, 20 Jun 2024 11:21:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f249csm20374058f8f.75.2024.06.20.11.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 11:21:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 20:21:44 +0200
Message-ID: <20240620182144.3027565-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718907706; x=1719512506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=tzrFuAR5iud9frtpv4Lw2dJF4KYpfiiFjFBniJ4mP+I=;
 b=E4QWled4Xcfv/dquiiM4dCiRLH6zJLGsuUidPcNtTxwLOBd3YM3vWP/mm3Rm3xjSlc
 3v2EgThBZrvg8+5FD6L9xvu37TPs+2CjH8L7+uLzLNxWYv46mjBIEUmHmAoLvKPOGsd2
 kHitnoYZ5hxhZByljxQNiPr6Xm+Bj4njLYcRJobzHn0Lo3DvHb2AHRQyxjJrAGFJBM3r
 RPmiDMQfH0RZx6ZC76jnfyCLImCPNqOOX+mH/H+PCByAUWMMfGL+47X9a83it4q8dp62
 00GEi9NaH+wAejMgfjRS3sv48oN6oxOOODp/pU1XT2yuOWmHw5fkGWfaQyoE2yIiUTAa
 SsDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E4QWled4
Subject: [Buildroot] [PATCH] package/go: ensure the toolchain is available
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The toolchain is needed to build the final-stage go compiler, when it
should have CGO support.

However, in commit 0290c543dec8 (package/go: new subdirectory for go
variants), the HOST_GO_DEPENDENCIES assignment was only partially split
off to the new location; part of it was left in the ole go.mk to act as
common variables. With that commit, the go package had not been renamed,
which meant that the dependencies were still correct.

But in commit fa2536ec9401 (package/go: make host package a virtual
package), the 'go' package was renamed to 'go-src', and replaced by a
'go' virtual package.

The variables in the go-src package were properly renamed, and the
variables in the go virtual package were properly _not_ renamed. As a
consequence, the go-src package lost its dependency on the toolchain
when needed, while the go virtual package still had it.

However, that was not correct when CGO is enabled (i.e. when the target
has threads): go-src then fails to build:

    Building Go cmd/dist using [...]/host/lib/go-1.21.8. (go1.21.8 linux/amd64)
    go tool dist: cannot invoke C compiler ["[...]/host/bin/aarch64-linux-gcc"]:
    fork/exec [...]/host/bin/aarch64-linux-gcc: no such file or directory

    Go needs a system C compiler for use with cgo.
    To set a C compiler, set CC=the-compiler.
    To disable cgo, set CGO_ENABLED=0.

After some retro-thinking, the reasoning behind this was that the
toolchain would _also_ be needed when using the prebuilt go-bin, which
is indeed correct, so by having it as a dependency of the virtual
package, it would ensure the toolchain be present in both cases, when
building from scratch or when using a prebuilt go.

The oversight being that the toolchain is _also_ needed to actually
build go when CGO is enabled.

We fix this by handling the toolchain dependency for CGO by exposing it
in a variable, that can be used as a dependency in go-src, like is done
to actually enable or disable CGO support.

We still ensure that host-go still depends on it, for a future go-bin
provider.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/go-src/go-src.mk | 4 +++-
 package/go/go.mk            | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.mk b/package/go/go-src/go-src.mk
index 1e061e20bc..0d1a9b3187 100644
--- a/package/go/go-src/go-src.mk
+++ b/package/go/go-src/go-src.mk
@@ -12,7 +12,9 @@ GO_SRC_LICENSE_FILES = LICENSE
 GO_SRC_CPE_ID_VENDOR = golang
 
 HOST_GO_SRC_PROVIDES = host-go
-HOST_GO_SRC_DEPENDENCIES = host-go-bootstrap-stage3
+HOST_GO_SRC_DEPENDENCIES = \
+	host-go-bootstrap-stage3 \
+	$(HOST_GO_DEPENDENCIES_CGO)
 
 ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
 
diff --git a/package/go/go.mk b/package/go/go.mk
index 6f92893204..91a8fb828f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -83,7 +83,7 @@ HOST_GO_TARGET_ENV = \
 # any target package needing cgo support must include
 # 'depends on BR2_TOOLCHAIN_HAS_THREADS' in its config file.
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HOST_GO_DEPENDENCIES += toolchain
+HOST_GO_DEPENDENCIES_CGO += toolchain
 HOST_GO_CGO_ENABLED = 1
 else
 HOST_GO_CGO_ENABLED = 0
@@ -95,6 +95,9 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
+# Ensure the toolchain is available, whatever the provider
+HOST_GO_DEPENDENCIES += $(HOST_GO_DEPENDENCIES_CGO)
+
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
