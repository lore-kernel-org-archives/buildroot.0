Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60463E82CDE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D002142EFE;
	Fri, 29 Sep 2023 22:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D002142EFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DX5CBbOY_rIt; Fri, 29 Sep 2023 22:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A948542F02;
	Fri, 29 Sep 2023 22:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A948542F02
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 876241BF2BB
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ED6083CE9
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ED6083CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tuh80SPoc6TX for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:02:58 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02A5A830C2
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 22:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A5A830C2
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so2006334266b.1
 for <buildroot@busybox.net>; Fri, 29 Sep 2023 15:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696024976; x=1696629776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RJzfbJWHS/gIan/neJxKGVSqvg1E3w07wTpA4WOuz3o=;
 b=qilnelMmUHGzwFaoGtxfC7D8V6RiezvsWOHzxf9VAs7MoYHirS7zn2ae1b5XnsNiSm
 KVEdvLWO00kQcqa4fjMjl5481B+FO8calhrN1q9y5pvKX7c+cWk9B8vZteDs06DDTw1u
 Gg5X7YhTbAJkJ8DhcgxFZ5sN4ktwy4X2DSMkI8fHL+enGQjRPn0Sxszbqh0DeVp6Z5oj
 Pn8nwBu1qq/2dAZd1hMsmqHzFrFlZyJ4sKdI+qCpOGWkmcTeYB97Cum1qLZcIr/B7Voz
 lvLoojppEYlhZ3+YsODDRhTd+U1xfW2IqxsNIp7ibJdW/IsyJ4xGpKxIjxaDdvGv7+HD
 RPfw==
X-Gm-Message-State: AOJu0YyjvgKvVB1YBupwQ23MB6tOQO8tyVCjg4iV2MiY01fHHmEfD459
 cyCTgl2wdsr/KskBxmyeQyV4wd1l8nE=
X-Google-Smtp-Source: AGHT+IHHSNev/phmWKr2hYs+AwZ0rJBABWGxf6UaOn4HKX0KXVIZgA30RUSHmHA/TRQPhICl1v8tWw==
X-Received: by 2002:a17:906:9c9:b0:9a5:c4c0:2d8a with SMTP id
 r9-20020a17090609c900b009a5c4c02d8amr4519059eje.24.1696024975826; 
 Fri, 29 Sep 2023 15:02:55 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1709060e9400b009ae587ce135sm12996857ejf.223.2023.09.29.15.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 15:02:55 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 30 Sep 2023 00:02:47 +0200
Message-Id: <20230929220248.3314845-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696024976; x=1696629776; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RJzfbJWHS/gIan/neJxKGVSqvg1E3w07wTpA4WOuz3o=;
 b=c6ors9rJeTcAlu89nwWsLNUlkhUEkfoLkVbmjCGdwe9pEyrmcrAVbnFk4jKXQISXPC
 /SOWw/WCx+7LAVVldybtndthJLc5Ia8HwOypD0pdpSnTQA3Z15HcHsXo1RoGVcGWdIMI
 5qmuLGXShyGYxVuuQgoLxyBYpV/3zcxa84N1MrSlbM+HCqZOTnr7WDHMI2KAvYC0F0Rr
 aHqMetOtRl9dgWNU2XE+p5UaVypOGgtafc41/lM80Lnc/gcKOASp9umhh6Yleo1Fr9dY
 3HvFT7G2VUAO7P+yfXTLJevFHlqgkP2HXNGZY4igjkXlynW8B2QJw5sZdGxT53h4vpMV
 cGeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=c6ors9rJ
Subject: [Buildroot] [PATCH 1/2] package/perl-mozilla-ca: bump to version
 20230821
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 6 +++---
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 799a531fe..33465ca31 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  2f136d096352a418e546e4afb70e7aa9  Mozilla-CA-20221114.tar.gz
-sha256  701bea67be670add5a102f9f8c879402b4983096b1cb0e20dd47d52d7a10666b  Mozilla-CA-20221114.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  a9b7b700e651cd74130edf7432f8657f  Mozilla-CA-20230821.tar.gz
+sha256  32e1d0045299004045b9c4d16c2daae453a216208873deea2440f71260a7cda1  Mozilla-CA-20230821.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index a124860b7..b122798a2 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20221114
+PERL_MOZILLA_CA_VERSION = 20230821
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
-PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
+PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
 PERL_MOZILLA_CA_LICENSE_FILES = README
 PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
