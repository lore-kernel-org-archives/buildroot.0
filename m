Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9D9D68BF5
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D6A605B3;
	Sat, 16 Nov 2024 18:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBfUSKXBT9M0; Sat, 16 Nov 2024 18:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6304A606D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6304A606D3;
	Sat, 16 Nov 2024 18:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76AD41EB9
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55B8984569
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PmH8qE6EumG for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF771846D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF771846D0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF771846D0
 for <buildroot@busybox.net>; Sat, 16 Nov 2024 18:23:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso437031f8f.0
 for <buildroot@busybox.net>; Sat, 16 Nov 2024 10:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731781424; x=1732386224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jic/6y+mj395vmhHUes5vHZKyZ22VqtSI+HNhcwwB5w=;
 b=XnaW76wsxoTieSX01nY2eCfpG1m9ZEjlq4XRNtysmI2cqaaiyQTXEfVNa/1Y3f5Jgq
 S+41sQ7FV12XeIcebzTgm/QfQCJLcl86kr55nXOzPSW5X2AAouqgArjOng7V3Maw4X4M
 8j3gopz/VPN8xwScRn2KX/NscrgvgdKV2bkHAxa+Ilw26T9YbGErwQbYTyCaVtBDcYbH
 IDAkcVc0V/V7SCVVTy5vahSGfkQ5Wt4v0lujXG2t3WiAPKGItWg5qTB8dKuyqMRdOB8F
 /bdKK46WzyM+z9xgaa+RkoHxuS2MuQ5X67MffD6gP0EWKzTYhFoyMV3d9Vr6EqYRMHyF
 pYXQ==
X-Gm-Message-State: AOJu0YyHnYzvFr7lqxxrZBWuVj6f7mEHFrWcHA3kBlf3fCIdNQrYfORe
 BommOP1ohaK+9YKKVRrgHixYTX4NUavy2kgLMcejVYnY1PvHHzW/AvsddytbPUg06zApmY7A/AX
 X/w==
X-Google-Smtp-Source: AGHT+IGJ0DdWl5o+KbEIoeMbAlIgTTLzk5BGzGjrTu/8LruTSnbqTTzlnefwqcnVMRZgVtiUmbmrUQ==
X-Received: by 2002:a5d:598e:0:b0:37d:498a:a233 with SMTP id
 ffacd0b85a97d-38225a92098mr5596112f8f.43.1731781423606; 
 Sat, 16 Nov 2024 10:23:43 -0800 (PST)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada3e65sm7782078f8f.13.2024.11.16.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 10:23:43 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Nov 2024 19:23:34 +0100
Message-ID: <20241116182335.121470-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1731781424; x=1732386224; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jic/6y+mj395vmhHUes5vHZKyZ22VqtSI+HNhcwwB5w=;
 b=JPlblYNyp4afHKV8CV+0JbEcnSTAGEMV9j7bfXCbJ+OIkqi0WcQESN7t0Jp6nHjox5
 On8uc3yEgNnmByUEaIzBFvgyLeYg+lyBR5bA7dI18X92Ge9OBxSX26dDc2Wt7HRf24YS
 ex2EdFCFL7yoTNKOZfeZaFNLK74bsFzuxOwyCc/6st2vltjZJWIxgzeG3jArYPJjvmac
 p0c5M+kwluK/y9QyaS1qxHSyfw7LfNjD0/JCRhcPbSvVqTiBwR1cOLMN6+wjjeyzS0rU
 kkxP4f0t3unfIuaotYIrep+YuSxgFBrWNhnbUzy6v2UKCjuRNlC9joqjzeJWWnevV/wX
 Tjzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=JPlblYNy
Subject: [Buildroot] [PATCH] package/perl: fix static build
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

see https://autobuild.buildroot.org/?reason=perl-5.40.0

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/0001-fix-static-build.patch | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/perl/0001-fix-static-build.patch

diff --git a/package/perl/0001-fix-static-build.patch b/package/perl/0001-fix-static-build.patch
new file mode 100644
index 000000000..9db50da80
--- /dev/null
+++ b/package/perl/0001-fix-static-build.patch
@@ -0,0 +1,52 @@
+From f05bcc4a518a1798be692e76277b96c078383f4c Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 13 Nov 2024 12:09:50 +0100
+Subject: [PATCH] fix static build
+
+Upstream: revert of https://github.com/Perl/perl5/commit/3b03ffb49b24a05e8de3844ea7e754df141b39cf
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ ext/re/Makefile.PL | 7 -------
+ regcomp.h          | 4 ++--
+ 2 files changed, 2 insertions(+), 9 deletions(-)
+
+diff --git a/ext/re/Makefile.PL b/ext/re/Makefile.PL
+index 01786e1ec2..8d4a576e4c 100644
+--- a/ext/re/Makefile.PL
++++ b/ext/re/Makefile.PL
+@@ -28,13 +28,6 @@ foreach my $tuple (@files) {
+ }
+ 
+ my $defines = '-DPERL_EXT_RE_BUILD -DPERL_EXT_RE_DEBUG -DPERL_EXT';
+-my %args;
+-for my $arg (@ARGV) {
+-    $args{$1} = $2 if $arg =~ /^(\w+)=(.*)$/;
+-}
+-if ($args{LINKTYPE} eq "static") {
+-    $defines .= ' -DPERL_EXT_RE_STATIC';
+-}
+ 
+ my @libs;
+ if ($^O eq 'cygwin' && $Config{usequadmath}) {
+diff --git a/regcomp.h b/regcomp.h
+index 7a20b54fdf..017a9f8435 100644
+--- a/regcomp.h
++++ b/regcomp.h
+@@ -1559,12 +1559,12 @@ typedef enum {
+  * and this is not a DEBUGGING enabled build (identified by
+  * DEBUGGING_RE_ONLY being defined)
+  */
+-#if ( !defined(PERL_EXT_RE_STATIC) && defined(DEBUGGING)) ||       \
++#if ( defined(USE_DYNAMIC_LOADING) && defined(DEBUGGING)) || \
+     ( defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING_RE_ONLY)) || \
+     (!defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING))
+ #define PERL_RE_BUILD_DEBUG
+ #endif
+-#if !defined(PERL_EXT_RE_STATIC)
++#if ( defined(USE_DYNAMIC_LOADING) || !defined(PERL_EXT_RE_BUILD) )
+ #define PERL_RE_BUILD_AUX
+ #endif
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
