Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA60CC38150
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85A5460708;
	Fri,  5 Jul 2024 19:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioalHilB3Ni6; Fri,  5 Jul 2024 19:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9435D60818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9435D60818;
	Fri,  5 Jul 2024 19:52:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A744A1BF98E
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A106160818
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrfIEZSVxb5m for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E8DB60708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E8DB60708
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E8DB60708
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:52:41 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52e97e5a84bso3005477e87.2
 for <buildroot@buildroot.org>; Fri, 05 Jul 2024 12:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720209159; x=1720813959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZTTCTK+5jiap6o8uvmoB3h/HfmM5pIhPOubfjmt0E+I=;
 b=tCA54fKclVwsUVx8o1HgzMq5NI5AvdkDulm8P27iUQJe7095s7Gzuy423tPhgsR31I
 wdRYP/94GXONrVJFAK/6R1zFLgDXWCfv4YrAxII6uVshyTBkl79GjqZSb/5/TYbFolNe
 dDZ4999eShxbc03XwRJeWIqPimRcOca9/qJlCIvBHfyYgxND2iDjInA+cVlMUoMJKtE3
 UFCx3kSdvE52fLi/MwGwUvPdTMnq59RKjw3zD5CB4Ec6QYMbpIPCKsxz+LeZ1DgFw/q6
 RfgWRAti6tBl/FbUgHGvikllXbjQTaxx0CjW6kAB28pF20iaE7G2a6QFAVemngHpIiwv
 KoXg==
X-Gm-Message-State: AOJu0YwVwSjJTeznXHI644L4tSBfmcuL2L+u9YTaJbvxE43Wz9BACTFy
 1rH3oGtrlRIp+uEnWlSRFZR1tMxIjRTeDU8c42rm8yVaYKsiKKyyjQWbreA+N5WsB+MMYBTdC7v
 JQDs=
X-Google-Smtp-Source: AGHT+IHYuR2RdONN9uRWpX/TLZSsa6DukofiK+YmVT/zb3de/thm5quFOYSEwbm4OMB5vy4ABJptcw==
X-Received: by 2002:a05:6512:3256:b0:52e:73f5:b7c4 with SMTP id
 2adb3069b0e04-52ea06325e9mr4706817e87.37.1720209158691; 
 Fri, 05 Jul 2024 12:52:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0b81b3sm709814966b.221.2024.07.05.12.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 12:52:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jul 2024 21:52:31 +0200
Message-ID: <20240705195231.3430104-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720209159; x=1720813959;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTTCTK+5jiap6o8uvmoB3h/HfmM5pIhPOubfjmt0E+I=;
 b=e5K/SdxL1kANevr/zNcHVCUvPT+lBWPZaqbA+0G7o8EphMH8Onc3j3LR+EWddOq1u5
 xRkaeRdIlBjLXbdooIRasZ7uisKGgnF8hr67Df9oLkbHdc7h2N4ilwhewcBoC4vHscek
 1q4uHJG3k7Xp6wufx63qRgzi/B+D/9TUptSig=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=e5K/SdxL
Subject: [Buildroot] [PATCH 1/1] package/libsvgtiny: update the patches to
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libsvgtiny fails to build with output:

    Applying 0004-Build-Include-gperf-generated-code-directly.patch using patch:
    patching file src/Makefile
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file src/Makefile.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...0004-Build-Include-gperf-generated-code-directly.patch | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
index c17426ff051b..b5443e991217 100644
--- a/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
+++ b/package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch
@@ -11,6 +11,8 @@ svgtiny.c instead, which is the only place its used.
 [Retrieved from:
 https://source.netsurf-browser.org/libsvgtiny.git/commit/src?id=4390f1c84e8fee51fc22468821e6fc158e783053]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/Makefile           | 13 +++++++------
  src/colors.gperf       |  8 --------
@@ -44,7 +46,7 @@ index a979720..fb8a72f 100644
 +
 +CLEAN_ITEMS := $(DIR)autogenerated_colors.c
  
- include $(NSBUILD)/Makefile.subdir
+ include build/makefiles/Makefile.subdir
 diff --git a/src/colors.gperf b/src/colors.gperf
 index 96d5b9e..a836787 100644
 --- a/src/colors.gperf
@@ -68,7 +70,7 @@ diff --git a/src/svgtiny.c b/src/svgtiny.c
 index 4661a58..bbefb88 100644
 --- a/src/svgtiny.c
 +++ b/src/svgtiny.c
-@@ -20,6 +20,9 @@
+@@ -17,6 +17,9 @@
  #include "svgtiny.h"
  #include "svgtiny_internal.h"
  
@@ -82,7 +84,7 @@ diff --git a/src/svgtiny_internal.h b/src/svgtiny_internal.h
 index 158d230..6bf5d64 100644
 --- a/src/svgtiny_internal.h
 +++ b/src/svgtiny_internal.h
-@@ -102,9 +102,4 @@ void *svgtiny_list_get(struct svgtiny_list *list,
+@@ -87,9 +87,4 @@
  void *svgtiny_list_push(struct svgtiny_list *list);
  void svgtiny_list_free(struct svgtiny_list *list);
  
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
