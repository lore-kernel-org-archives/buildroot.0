Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8171CD8CB9
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 06:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E6340AA9;
	Wed, 10 Jun 2026 06:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsLhDlto35re; Wed, 10 Jun 2026 06:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC4440BAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781074019;
	bh=ByA6ayJo7c5NmRib9KpzsuJbc1ySGClgJYx7Gv5S+wQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pdtPGwRVSERUcSe7zRmxu/mofCT1u96vPuA0E75Ly0Nc95aszGrqkRhA7HbZ11bPe
	 nktGMmKdLxHomKOC2uhjOfdBwPI1C1KB5V2rL5hlGmQpG/Sy002oEX5ZUeYM/JyRRp
	 FIzCaL23MHqv4I0U2ooCBUm4jZe0GbGKBcrSn3YO/pc9382pTrvbqW0I20y8lcpn70
	 ohDcDsOHD/RFsxOUirBQSKWpK4jyW3Vmb2BmrBSB0UZmRgTSyiLQfzqspzclk/IPw9
	 fg77MfPjxXwHkdVq3I7ZjfOVZ3zEyoGYFoP/NKO/CDHfLiV2ltpkW4SUZjNszIHPXC
	 MKPNlosv5vp7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC4440BAD;
	Wed, 10 Jun 2026 06:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2875C256
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BFA80F11
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec-8bJTv7Gja for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 06:46:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 204E680F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204E680F10
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 204E680F10
 for <buildroot@busybox.net>; Wed, 10 Jun 2026 06:46:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so4395074f8f.0
 for <buildroot@busybox.net>; Tue, 09 Jun 2026 23:46:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781074014; x=1781678814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WfGJwodPeQ8sidqDZQxfKIqI6CIYMx50CjmgZbvF/5k=;
 b=cz34Lbbs3W2+0c2xeY1qYJgPbXOzs7XTnhvmXWnr1pl1xhTdb2qSUlQb89ubL2YMzJ
 RMJdKnaf1dx8aX4j1DoKu6Jl069IlNxJPu3tgMZj0ZHwZptZXvHjjnivBQOtwDCoRnZ2
 6Vhn08XG/DjtWckqoJGjqTeoTxK3e1kQ0MGn/bVFp1ZN4fTAeEQQQ5Ia9zVDGZS3Fn4y
 T8igzlk5/cJ8eWgBBM3RRKNbxyMbS59naUgEBWYDG9BC/mzcPoPL/N3m3S0bYpKi2Qxf
 Nl2U1EsSddfK9fATvMDp5PL/QRMISCpJbNG+VttOlhoGThxm+dzGVcpXloMRf1fgoDxA
 WkDA==
X-Gm-Message-State: AOJu0YxgcolIKqABMUOR89GWPWZqJgTzWZMXwjaJ8fkZJuG5BprpwJcN
 3uTi+SjKG3kS2RMNlHSjXHC/4GBR4rRxzRGFQliez6cp4+TLX+ZSyQrX21NM+XaKgh9XJums8Lw
 GDH4U0Z8j
X-Gm-Gg: Acq92OF48yvOzutn8TUZspppn6ETupzdCkz86E4dBtru3CNklbyXnrcaJmnlXv2vZXp
 UoXKAbd+lEbgxDDbJS6kLi70Lqu4bIl4A/NOfA5hRzCB5vXlhXuYAZMd2PlsRc7sUAZZ7N6gpKp
 TRQIaflsV8IJEdmrp1x30MLEbA8/f3ALGVM7kUwqV4xSd4TdfXTVh68pVVsmr3Bdf5gs4Zre2Z9
 LLHDI1R8bVeMH6421X18o9IIRJIbhX7kkmahkVQmfxaFSj06/qO4vjb+87nTn9IvimB4ulP2IHS
 QkTgAEXJCJlva/tNlv4GTDsX94TOia/JvMGsFqcxo8bsVavHK1FF1WRm4KNDs5CwRXGIUCPNaof
 zxU6sn7F/6rzHCbKFY21tjdXD+v05n4tIwsmW8vI9cwmvRFY3ZdRP3rvY40VMQCpcV4UzXfJMUN
 EvO4e1a10Dv4xm5zH7Pr6DxJrbzwWZ8d7fZ42zxvCrGzqK756D/NJKbey7bfB7
X-Received: by 2002:a05:600c:450a:b0:490:c2a2:b1d3 with SMTP id
 5b1f17b1804b1-490c2a2b3c6mr350078905e9.34.1781074013041; 
 Tue, 09 Jun 2026 23:46:53 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcad5sm75767033f8f.5.2026.06.09.23.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 23:46:52 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 10 Jun 2026 08:46:43 +0200
Message-ID: <20260610064643.70497-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610064643.70497-1-francois.perrad@gadz.org>
References: <20260610064643.70497-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781074014; x=1781678814; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfGJwodPeQ8sidqDZQxfKIqI6CIYMx50CjmgZbvF/5k=;
 b=f572+K2p5K4Pjx5YDjfRzkW54ighUmup04qL2Tc58csQiMHPqXrsQR4PLGcbt3UghM
 zxQIqWyAVJdGx9Qba0LMhsoJhgJY61vysvV4XHPfBzzFZoRPYG52+ethF5EiDFiVig2D
 dkn7bJjaoFq2v6z2CGo8K9vqh1LEA/ujPyqtKIhjpg0F4sezfA5DPMdEzO1Fn+VIchFB
 mpPp3iymJYFsGMWRH80xDtw+b1zuLlW4r5Ntw/ITW5t9jkdxYJXiLHNJp9V0+fumnL2e
 cdsnxUBldFkG+YpEqqe/3S8PYWHhN4jU++DeS+LcCPxUT9rswFpNnPhEfFnlKe0SUN4V
 n4Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=f572+K2p
Subject: [Buildroot] [PATCH 2/2] package/argparse: remove it
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

duplicate of lua-argparse

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy               |  9 +++++++++
 DEVELOPERS                     |  2 +-
 package/Config.in              |  1 -
 package/argparse/Config.in     | 10 ----------
 package/argparse/argparse.hash |  3 ---
 package/argparse/argparse.mk   | 11 -----------
 6 files changed, 10 insertions(+), 26 deletions(-)
 delete mode 100644 package/argparse/Config.in
 delete mode 100644 package/argparse/argparse.hash
 delete mode 100644 package/argparse/argparse.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a36e33159..2377891be 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.08"
+
+config BR2_PACKAGE_ARGPARSE
+	bool "argparse has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LUA_ARGPARSE
+	help
+	  package argparse duplicates the package lua-argparse
+
 comment "Legacy options removed in 2026.05"
 
 config BR2_PACKAGE_PTPD2
diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a..0f3e0dabb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2235,10 +2235,10 @@ F:	board/orangepi/orangepi-zero3/
 F:	configs/grinn_*
 F:	configs/orangepi_zero_plus_defconfig
 F:	configs/orangepi_zero3_defconfig
-F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
 F:	package/gitlab-runner/
+F:	package/lua-argparse/
 F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
diff --git a/package/Config.in b/package/Config.in
index 630662477..31e958bcd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -699,7 +699,6 @@ menu "Lua libraries/modules"
 # upstream package is "luafoo", call it "luafoo" in Buildroot; if the upstream
 # package is "foo", call it "lua-foo". Many packages currently don't follow
 # this convention, but that's historical accident.
-	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
 	source "package/coxpcall/Config.in"
diff --git a/package/argparse/Config.in b/package/argparse/Config.in
deleted file mode 100644
index d02b19125..000000000
--- a/package/argparse/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_ARGPARSE
-	bool "argparse"
-	help
-	  Argparse is a feature-rich command line parser for Lua
-	  inspired by argparse for Python. Argparse supports
-	  positional arguments, options, flags, optional arguments,
-	  subcommands and more. Argparse automatically generates
-	  usage, help and error messages.
-
-	  https://github.com/luarocks/argparse
diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
deleted file mode 100644
index c573ba579..000000000
--- a/package/argparse/argparse.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# computed by luarocks/buildroot
-sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
-sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
deleted file mode 100644
index d719e67d8..000000000
--- a/package/argparse/argparse.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# argparse
-#
-################################################################################
-
-ARGPARSE_VERSION = 0.7.1-1
-ARGPARSE_LICENSE = MIT
-ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
-
-$(eval $(luarocks-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
