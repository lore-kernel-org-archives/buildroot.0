Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666D4C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82F4607F5;
	Sun,  7 Jul 2024 09:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqDe1bdwgLPp; Sun,  7 Jul 2024 09:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1795607C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1795607C3;
	Sun,  7 Jul 2024 09:14:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E43E1BF3A4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C3F0607C3
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 09:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riwat968ucV7 for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 09:14:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 25C5C605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C5C605A6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25C5C605A6
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 09:14:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso59378266b.0
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 02:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720343683; x=1720948483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wGO/LY+BUNgjE9UyciMiGayki7uqfYqFlnPy+kk4tlg=;
 b=Ro/1KFHpkYvp6LzJFiK39qXynIdDQMZKVj0B4B92SqBDpV8AHMiRuA1Z5LDb57Sjwn
 2GXCcOjuRQOyckbfndFbE3LXsC06EJJnbu9QC0GZOi3fWQrOiLCbxAuZzGoyPdFN/KTP
 bGrrspCaGXqtnnn1AbzvzdcfyyXjzwj0O9FcfSRvF8VSo7/zj90pnSK904UD2CqczL+c
 WeTsIPwNWamIOecIXv/Z7vTCcX9gA+alzbADorDVpPoIKBnH1JaxaiDBqIfc/iZYK4Bo
 eBPjl/h1VrMUEAs+FlkqrYAnVS8UsfpR+V30wMBTlmsYhbC83enT7VlG+gW613iTTTJ4
 kvKw==
X-Gm-Message-State: AOJu0YxZnBzQVbtj+MvXoruqcn873LjX9iPT/hyxI4tTWhomFXOrxfZX
 u+solSOjv/3gabwKo/RiWcDazgpm+ONrE5Hqc3BadKQMYjPHs9XnxE3RQHsu1aPfS3TGmgDmuIE
 l0jI=
X-Google-Smtp-Source: AGHT+IFHs9EcsZpKvlOlQFhZdrMUfnZboqO9Sb7z0ADjxPKrkbL8bsVsdB7mqMI0TVhEkYE1uoDABA==
X-Received: by 2002:a17:906:adc7:b0:a77:c7d7:5ece with SMTP id
 a640c23a62f3a-a77c7d76168mr373316466b.35.1720343682715; 
 Sun, 07 Jul 2024 02:14:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77e8d4aee5sm91456966b.221.2024.07.07.02.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 02:14:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 11:14:37 +0200
Message-ID: <20240707091437.3872260-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720343683; x=1720948483;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wGO/LY+BUNgjE9UyciMiGayki7uqfYqFlnPy+kk4tlg=;
 b=H4eU4gNGYTB0Sz2bapz5iWm0AC5F2RXPNnoBx4tpt0z3wHYJOJZ0tvv1VOoGwroLSS
 YuvClbYBAraTP4/y1ogdAJvegS3cj02BQvwX2FUhEcBu8Otj1ISnMCSX4nIonR3aie4C
 EDU7H6J0GrNOsBtvm+Ukry2C6y4823fdgVrxI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H4eU4gNG
Subject: [Buildroot] [PATCH 1/1] package/libgdiplus: update the patches to
 be applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libgdiplus fails to build with output:

    Applying 0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch using patch:
    patching file Makefile.am
    patching file configure.ac
    Hunk #1 FAILED at 39.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ild-unit-tests-only-when-enable-unit-tests-is-pass.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
index 33746872ac0d..0ac5ecaad03f 100644
--- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
+++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
@@ -11,6 +11,8 @@ So let's disable the build of unit tests by default and introduce
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 Upstream: https://github.com/mono/libgdiplus/pull/701
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile.am  | 8 ++++++--
  configure.ac | 4 ++++
@@ -38,8 +40,8 @@ diff --git a/configure.ac b/configure.ac
 index 098fd0a664bd..c126ff091e58 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -39,6 +39,10 @@ if test $warnaserror = "yes"; then
-   GDIPLUS_CFLAGS="$GDIPLUS_CFLAGS -Werror -Wno-unknown-warning-option -Wno-clobbered -Wno-typedef-redefinition"
+@@ -47,6 +47,10 @@
+   GDIPLUS_CFLAGS="$GDIPLUS_CFLAGS -Werror -Wno-unknown-warning-option -Wno-clobbered"
  fi
  
 +AC_ARG_ENABLE(unittests, AS_HELP_STRING([--enable-unittests],[Enable building unit tests.]),[unittests=yes],[unittests=no])
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
