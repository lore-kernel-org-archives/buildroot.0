Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D01C433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 18:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BA64088A;
	Sat, 29 Oct 2022 18:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9BA64088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3H9MkcWsyYqf; Sat, 29 Oct 2022 18:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32D740888;
	Sat, 29 Oct 2022 18:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32D740888
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4571E1BF5A9
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 18:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C7440882
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 18:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C7440882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwC7F1hQo8FF for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 18:47:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2E940761
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A2E940761
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 18:47:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id 5so4986538wmo.1
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 11:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0aHrhCfCGBUz2lmHRBZ1061l8nEUH3IzKuWM7UVJG0=;
 b=XB3hQdWDMHEqwKUUaJ+6/s8nEmHc7FopOsCJ8zXo4t3ksOQ/ZXjZS9P8M52a0tN0FA
 HjocZCF9BoS2SUQ05u8XFp4nsQL2ZG/1jvKVuEFRX9FT8TPBi9mU7F3LCj+0Ve2GZQIH
 moDwYWgz13xvatIdvr/mIeFbaBaTjPtu5MglTwzxQtYgQ+K2/hFeLgNH7nTzFckku0mu
 eyXRN4yYwY9nthTfZIMUnrqKSas8O3tJEw3OxFB35nsFqHCzDFsRA4nMtnt/AmfmDczN
 1IeWNWOYtIQ88esjopULZjPoX3LCU69aWrVV6lYdOIuVgY1PtCysW7wWHVavHHfcuN7x
 gJ3g==
X-Gm-Message-State: ACrzQf3/TaU1TC5JnzeFiJgMSjAVjcKu6D7WN4ibrOnOGDuJFFswR7qR
 KG5JWkhzzFoPWLpWGBHWwlcOwCYkFcE=
X-Google-Smtp-Source: AMsMyM4W+HQxVLEfPW8/mMqI7f/IGyybNpQxwhqDP+jUJKZ8CNvaWCBxFhxldAyZkZuEJ/9+Glx7nQ==
X-Received: by 2002:a05:600c:1819:b0:3cf:63fe:944a with SMTP id
 n25-20020a05600c181900b003cf63fe944amr2634698wmp.17.1667069265254; 
 Sat, 29 Oct 2022 11:47:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c358100b003c6237e867esm2785391wmq.0.2022.10.29.11.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 11:47:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 20:47:42 +0200
Message-Id: <20221029184742.17565-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v0aHrhCfCGBUz2lmHRBZ1061l8nEUH3IzKuWM7UVJG0=;
 b=f7dE3QmAIiWNxKcnR/vDwy8QkAguUM8Jad8vZxGuYnD3z5T0DHgVC3oLwEP4eZdDQw
 waC7VPoGR7V8UEIv38EpLyY5jgYMV4/jQ/2URMEU9hRUOxChMds4frcZQf85dFooWFKa
 nPg+B6eGLq1feMj5cQluGYBsRknhr7y3IZsWBfyX43dnrtAaWRnP0TBsH2nXhTAP0QYk
 kBQFcGdXY5l0ekgH2hKen4yrJd1NqPYadznnCr9FwAcdNJHDe1csDYIoDSuxMmVISOyo
 LvhJ2nPsrj0MWIRyj2NF0KUk/6HcnWhfZSundddLlYgWSyekyq3+FK8X0P3MzbDBEbm5
 wIwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f7dE3QmA
Subject: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.2.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 894c939c5b..3ab0cfdbb3 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.2.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  d87629386e894bbea11a5e00515fc909dc9b7249529dad9e6a3a2c77085f7ea2  gawk-5.1.1.tar.xz
+sha256  e4ddbad1c2ef10e8e815ca80208d0162d4c983e6cca16f925e8418632d639018  gawk-5.2.0.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 3a1cec4969..47f681339d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.1.1
+GAWK_VERSION = 5.2.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
