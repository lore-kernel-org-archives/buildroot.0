Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51809C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 08:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC643841D1;
	Fri, 18 Jul 2025 08:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8BpipfHkvBV; Fri, 18 Jul 2025 08:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2AE5841CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2AE5841CB;
	Fri, 18 Jul 2025 08:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EFAD1A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D38340AB7
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Br0r4o9BPzHn for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 08:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=fede.evol@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF27E40B24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF27E40B24
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF27E40B24
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 08:55:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-60c51860bf5so3320450a12.1
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 01:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752828921; x=1753433721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3TNBAfyfpj1u4GvOWQswjA1IZ7r5vq6rHWtqiD0I0s=;
 b=BJgz+dhW3BCCbOkNs+3QsukGhs7AvXbi2FrUb7qORMRrMlcAt9VJlTqiw4gHXbpQN1
 fbcWodRMSIGVKV4G8KApuB4PIKyhnc9OssKynjXzpbimwHvFeYtkDGXBswkcxiTDzoft
 50sK623w48ueBTh/5sGpf74+sgNGzS768KPXs8QEOZc0qMhnKDFMYPD6bDd/QGLIL/CO
 9jZmW3Tu/9QB52Mzx6l77RxoPVRYe/4qqUcTAKxDG/BXHRLgR7EaauRH069xxc6TLrvj
 2iLrJ9WPW9o7TU1oxB+WJwSYsab46QCw6meOte9cha4NQPaIBC5FLxncOE/7MBHVU19l
 wGtw==
X-Gm-Message-State: AOJu0Yyhf9G1EJcMGF9qBEWQ2lC9507gt6ZsKFkzrTxk/gDhgKyWhGjM
 3Gcb7bB+uBBlw84eJWWQdKhGNBBDGzDVWIUUKsl8ckIgUCpyIXMaAfjdIg7+0A==
X-Gm-Gg: ASbGnctsF+5yX9wGqnMtdfE09LtGlS75pL2KFGdc61osVLbm3LrBc8xi5P/1BC271rH
 +TKGiQEQaw9+nr9yx7u1qef+hdmjOeb7DEpmFj7mOKvAQIAKTWW52yHRE2PHpe/52PqMiBnA+NZ
 mXrzry2mZqgcjWPH0+f5ul3DmhygZ8finmYwtkURlMHbuL5uEmNqcP/wPWjM0Qjru9nSiHMzKYG
 U3pvsxzIjpnzJ0RFGzBchyB06QE/poFxuP+txHHNsAmsTFQ+TM6fFq136cQ36Jzg02D/11oTfQ6
 K/ZN8fjzGiiRZhsv03J0JnmfDR0vVPo8zu3yP3x8DJme99rwYTrSP6EwZMD0CLtMkjf71zB9N/8
 F+U3c5YfKh+1WZuAZ7xHC3cFFvEaOW+QsJCHtNSnYfaIeDrqvFcsYwZjfGXkz1adOQspthhrOpd
 AwLCH9X4UlIZCLnYSIMdppe/Zjfsqq3IGbGiOsjTmmow==
X-Google-Smtp-Source: AGHT+IFPXLWU4lS/U8OZ+Rv4CBZwASWo5rWo8l6y7029StaT9w9dqhJ6MJ9NXalrXVyjr5TJIaUPsQ==
X-Received: by 2002:a05:6402:3591:b0:612:d9c9:4a57 with SMTP id
 4fb4d7f45d1cf-612d9d8a37emr344206a12.7.1752828920586; 
 Fri, 18 Jul 2025 01:55:20 -0700 (PDT)
Received: from rawyouth.fritz.box
 (dynamic-2a02-3102-6875-9900-19b4-7432-1ff2-cb8d.310.pool.telefonica.de.
 [2a02:3102:6875:9900:19b4:7432:1ff2:cb8d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c8f09dbcsm672115a12.12.2025.07.18.01.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 01:55:20 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org,
	joris.lijssens@gmail.com,
	baruch@tkos.co.il
Cc: Federico Pellegrin <fede@evolware.org>
Date: Fri, 18 Jul 2025 10:55:17 +0200
Message-ID: <20250718085517.48149-1-fede@evolware.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752828921; x=1753433721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=i3TNBAfyfpj1u4GvOWQswjA1IZ7r5vq6rHWtqiD0I0s=;
 b=Plfx913sHcpkAxazMVjjSBOeQd5DGf2NiiCOrNa8+K5irseXZfxogAIPElvFJk9dir
 P6hqdWDCjUloeh2KqoarnlAY5hT+RlrhjWBTTYJvUs2zp7P+uvNPFZJ/VzxlN8DefH5A
 zEEXZGnry/t/slGs/CauCh6WymzUwUZoIPRbcoo/piPCjTDocmngEFCD1Y1WSXI796+O
 Ib5leY0+1yqA4bEBySNaMJ2AIUFGVNhL0BtggJ5H+jxX+nqE3x/2Ln3XcYIJ13T/7K6S
 ZYp3QmtqRaZJGbHqCcHRA9VbebvWe+6YpYJ33TESvwGhD2FhGznag/DRNioLQB3gT8p4
 U8Sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Plfx913s
Subject: [Buildroot] [PATCH v2 1/1] package/netsniff-ng: bump to 0.6.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.9

Remove now upstreamed patch 0001-Detect-libpcap-dependencies-using-pkg-config.patch.
Fixes also: https://patchwork-proxy.ozlabs.org/project/buildroot/patch/20240829075015.39164-1-fede@evolware.org/

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 .checkpackageignore                           |  1 -
 ...ibpcap-dependencies-using-pkg-config.patch | 51 -------------------
 package/netsniff-ng/netsniff-ng.hash          |  2 +-
 package/netsniff-ng/netsniff-ng.mk            |  2 +-
 4 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b0c103ee4b..f74e107adc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -828,7 +828,6 @@ package/netplug/0002-add-missing-time-include.patch lib_patch.Upstream
 package/netplug/0003-remove-assert-fail.patch lib_patch.Upstream
 package/netplug/S29netplug Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/netplug/netplug-script Shellcheck lib_shellscript.ConsecutiveEmptyLines
-package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch lib_patch.Upstream
 package/netsnmp/S59snmpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/netsurf/0001-avoid-system-perl-dependencies.patch lib_patch.Upstream
 package/netsurf/0002-do-not-cross-compile-nsgenbind.patch lib_patch.Upstream
diff --git a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch b/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
deleted file mode 100644
index bbcbd2bfc3..0000000000
--- a/package/netsniff-ng/0001-Detect-libpcap-dependencies-using-pkg-config.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 194ec61843b9598ce90873c812b817c4b96e2e0d Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 2 Sep 2021 12:56:00 +0300
-Subject: [PATCH] Detect libpcap dependencies using pkg-config
-
-When building statically the link command line must include all
-dependencies of all libraries. libpcap can optionally depend on libnl.
-mausezahn can't build statically in this case.
-
-Use pkg-config in configure and in the link command to construct the
-library flags we need to link with libpcap.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
----
-Upstream status: commit 194ec61843b9598ce90873c812b817c4b96e2e0d
-
- configure          | 4 +++-
- mausezahn/Makefile | 2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 510826a798f5..598ae2433a7a 100755
---- a/configure
-+++ b/configure
-@@ -588,7 +588,9 @@ int main(void)
- }
- EOF
- 
--	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c -lpcap >> config.log 2>&1
-+	$CC -o $TMPDIR/pcaptest $TMPDIR/pcaptest.c \
-+		$($PKG_CONFIG --libs libpcap 2>> config.log) \
-+		>> config.log 2>&1
- 	if [ ! -x $TMPDIR/pcaptest ] ; then
- 		echo "[NO]"
- 		echo "CONFIG_LIBPCAP=0" >> Config
-diff --git a/mausezahn/Makefile b/mausezahn/Makefile
-index ca16b6579583..9544565355cc 100644
---- a/mausezahn/Makefile
-+++ b/mausezahn/Makefile
-@@ -1,6 +1,6 @@
- mausezahn-libs =	-lcli \
- 			-lnet \
--			-lpcap \
-+			$(shell PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) $(PKG_CONFIG) --libs libpcap 2> /dev/null ) \
- 			-lrt \
- 			-lpthread \
- 			-lm
--- 
-2.33.0
-
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 40b015cb0d..e63963c6d7 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  77d17d4158faf1d93c7d922a1bd7f093a8b437bd658292c830708540e10894ba  netsniff-ng-0.6.8.tar.xz
+sha256  027840fa3c4e11abfe4fd0fffe9909c5c4ed1428d4b9397fb6d2f5ea69325918  netsniff-ng-0.6.9.tar.xz
 # Locally computed
 sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
 sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 2b5b19b27f..5e779f1cfb 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = 0.6.8
+NETSNIFF_NG_VERSION = 0.6.9
 NETSNIFF_NG_SITE = http://pub.netsniff-ng.org/netsniff-ng
 NETSNIFF_NG_SOURCE = netsniff-ng-$(NETSNIFF_NG_VERSION).tar.xz
 NETSNIFF_NG_LICENSE = GPL-2.0
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
