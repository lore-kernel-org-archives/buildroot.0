Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFCCC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:01:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7A860184
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 22:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B7A860184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2F4608B1;
	Mon, 11 Oct 2021 22:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izYB8OqiGQaw; Mon, 11 Oct 2021 22:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E4A606DB;
	Mon, 11 Oct 2021 22:01:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00DA61BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E43CC4037E
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 22:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLnIaiJwLBqw for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 22:00:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FDEA402DF
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 22:00:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e12so60489182wra.4
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 15:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJ9jgHmwrh6Yg5rWQ0mdkGdSUIuGVel3siiAKQgjJd4=;
 b=ISI5d4BbJg0c2QImc4uTTmtRKq12YF44spoZfhrbaeYk0vM/nlCJz9ZYNQts/TP8lj
 fmjdtpBxxrylSlq9RiHYw8Vm+Nanw5F4dpLuffZKmFH/jCkPHZh8b8H9anWkAiYlwfJI
 bJxarfcnFXOEXQE5VgitnErKjfY+K9FurNR0ZQ4Vg1CwzWeDPvN/N39B01I330fkBCEm
 DktJOpTp1p+dVoXQjVi0lA11zqCLw8jQiixPaR55Pe53usBan4KRrj4Hf0lG6AHZvg2d
 6EIMVoxN/gx+UO3OvvcCUzm3IGWrbcH9kU6bK/JcVrxQgqkKAuYs040+p5OmSclFN5Rn
 cC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJ9jgHmwrh6Yg5rWQ0mdkGdSUIuGVel3siiAKQgjJd4=;
 b=mPD+pk/qdASm8cxgOp+EB3nn7xtlbb19AWAXiMbwwu2BESCqRhRal2/Bd9gW2TdrBI
 t2bvAEZJW8yS8Xlv2OsrkQRWsYxtWA+cdFxBXqEy209lQBkg9yffat+lDf7y3JCnB696
 zPVDT2Z42xrx/qdTM55PvpNMa51kk1y0jbtCyTuMTlhOVAleU0qHJQzP0wwRz4LQCaac
 OgjOe4W188n8LDDM749gR8Rei8Ai8fZqg4ELFpfvy/6mNfECoPjSKncKu39NU3y+7HTd
 aKnJBX2V22aJ7KHQpR4q9kCS+iZTuBmfsplrhz1lZxvQUYKDvWMGbawrqhYsKBZf2scm
 weDA==
X-Gm-Message-State: AOAM533CVN1A+H/xRp/LQ8LDh7BQlLfYuDsF2AeKZ0N37Hr8L+KN+oz+
 2iWAY7N/j8hNHE72fEOn2Z8jb4ztsMw=
X-Google-Smtp-Source: ABdhPJzbdZ3p4CkoFPxb5oilSn0c3qpPXH83cJQeAAkGQebEamftbguUEZFalA2HLqHfoSJuULuArA==
X-Received: by 2002:a05:6000:1acc:: with SMTP id
 i12mr27177752wry.249.1633989636857; 
 Mon, 11 Oct 2021 15:00:36 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g25sm9214992wrc.88.2021.10.11.15.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 15:00:36 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 00:00:24 +0200
Message-Id: <20211011220025.7998-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011220025.7998-1-petr.vorel@gmail.com>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 2/3] make: Drop `type -p ...' fallback
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

`command -v' is good enough as it's POSIX.
For easier debugging previous problems removed separately.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 Makefile            | 22 +++++++++++-----------
 package/Makefile.in |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 2317655272..81b7173974 100644
--- a/Makefile
+++ b/Makefile
@@ -284,12 +284,12 @@ HOSTAS := as
 endif
 ifndef HOSTCC
 HOSTCC := gcc
-HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p '$(HOSTCC)' || echo gcc")
+HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || echo gcc")
 endif
 HOSTCC_NOCCACHE := $(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX := g++
-HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type -p '$(HOSTCXX)' || echo g++")
+HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || echo g++")
 endif
 HOSTCXX_NOCCACHE := $(HOSTCXX)
 ifndef HOSTCPP
@@ -310,15 +310,15 @@ endif
 ifndef HOSTRANLIB
 HOSTRANLIB := ranlib
 endif
-HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type -p '$(HOSTAR)' || echo ar")
-HOSTAS := $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as")
-HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || type -p '$(HOSTCPP)' || echo cpp")
-HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || type -p '$(HOSTLD)' || echo ld")
-HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || type -p '$(HOSTLN)' || echo ln")
-HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || type -p '$(HOSTNM)' || echo nm")
-HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo objcopy")
-HOSTRANLIB := $(shell '$(SHELL)' -c "command -v '$(HOSTRANLIB)' || type -p '$(HOSTRANLIB)' || echo ranlib")
-SED := $(shell $(SHELL) -c "command -v sed || type -p sed") -i -e
+HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || echo ar")
+HOSTAS := $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || echo as")
+HOSTCPP := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || echo cpp")
+HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || echo ld")
+HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || echo ln")
+HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || echo nm")
+HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' || echo objcopy")
+HOSTRANLIB := $(shell '$(SHELL)' -c "command -v '$(HOSTRANLIB)' || echo ranlib")
+SED := $(shell $(SHELL) -c "command -v sed") -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 2ba4d8b381..4e993ecd5f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -4,7 +4,7 @@ endif
 ifndef HOSTMAKE
 HOSTMAKE = $(MAKE)
 endif
-HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || type -p '$(HOSTMAKE)' || echo make")
+HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || echo make")
 
 # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
@@ -222,8 +222,8 @@ else
 TARGET_STRIP = /bin/true
 STRIPCMD = $(TARGET_STRIP)
 endif
-INSTALL := $(shell $(SHELL) -c "command -v install || type -p install")
-UNZIP := $(shell $(SHELL) -c "command -v unzip || type -p unzip") -q
+INSTALL := $(shell $(SHELL) -c "command -v install")
+UNZIP := $(shell $(SHELL) -c "command -v unzip") -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
