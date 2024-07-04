Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C99C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 18:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6E36076D;
	Thu,  4 Jul 2024 18:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGHJyPglQ6ey; Thu,  4 Jul 2024 18:45:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA25607BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA25607BD;
	Thu,  4 Jul 2024 18:45:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC7D1BF2FC
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB448444C
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuJIqm0F1mYw for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 18:45:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B741784113
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B741784113
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B741784113
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 18:45:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso1274750a12.0
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 11:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720118704; x=1720723504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxcAuIkjMWU02vv28vQr/NQic9wWR/0RqQUCFHm93tc=;
 b=fq6TMPBbF9mMYF3bxyLziQnT2o0lQSXXQAPjx+UDc9l92INlDtWfS63itZrv10IT9c
 V7vKmJ3/sakBNrAANil1MDFS9TKgwbEUoH8aZz93mijZLMgTSVKI9sMXgwUi/MsWKdbW
 uDRftRHffkvWXoEBcu1ISzY1V7YkVJgdQB3ubDPbJ5h85rLWhhsz5YGjIipOwwxba4EU
 W9Y0bJ0V+6Z3Gk94KhfWgYm502oykedCHDe+T6jN5jNmv/1yEIKJKUFrmG4iyKDAfoq9
 CdW0tdWLTkuJlkWXpZE8qX65ko4qQ1Za/9aZicqcQMbVl1iSJBnC/UDa3ubbK7+cF030
 2VQg==
X-Gm-Message-State: AOJu0YzzeQ1INOPVGZVFWUqwUI9tdKXRrwYYNUfnFKekeFtlMiV6n1ma
 OcYpXolC7AOS19qOIW6SaT6BcyEy0L2GqNbGQK+g76NyeK77LlCanx6Zu6MnuO9E+OlLBoSYP8r
 xtbg=
X-Google-Smtp-Source: AGHT+IFWRKYJzjPNQJPZ//iB3bEJjtTZBHeV2NbmfObCbmlvNWFLMmKTv2NrzieMVn9+DEPALllbVg==
X-Received: by 2002:a05:6402:5191:b0:57d:6326:c658 with SMTP id
 4fb4d7f45d1cf-58e577fadafmr2352932a12.0.1720118704318; 
 Thu, 04 Jul 2024 11:45:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861381868csm8654667a12.55.2024.07.04.11.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 11:45:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 20:44:56 +0200
Message-ID: <20240704184456.2970034-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720118704; x=1720723504;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cxcAuIkjMWU02vv28vQr/NQic9wWR/0RqQUCFHm93tc=;
 b=PTkNWyfwSuPPby6s0cfxlRvdHA61f4lZfCZcn1yT+wv97n5673aV+OIFeQ4Dian4Sd
 TkcsH3dp1iKSySh37jmS87z/JzVSKJOlmakyoLfG/sxW+mgsZZ6Qkw7fGEHrtqOe9+t2
 zH7snWwgSK5IDzWYUMftqY4aN7lHwlW17CzTU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PTkNWyfw
Subject: [Buildroot] [PATCH 1/1] package/nvidia-driver: update the patches
 to be applied with fuzz 0
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
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, nvidia-driver fails to build with output:

    Applying 0001-use-LDFLAGS.patch using patch:
    patching file kernel/nvidia/nvidia.Kbuild
    Hunk #1 FAILED at 87.
    1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia/nvidia.Kbuild.rej
    patching file kernel/nvidia-modeset/nvidia-modeset.Kbuild
    Hunk #1 FAILED at 70.
    1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia-modeset/nvidia-modeset.Kbuild.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/nvidia-driver/0001-use-LDFLAGS.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/0001-use-LDFLAGS.patch b/package/nvidia-driver/0001-use-LDFLAGS.patch
index 7b7df8098832..9ce237f9595e 100644
--- a/package/nvidia-driver/0001-use-LDFLAGS.patch
+++ b/package/nvidia-driver/0001-use-LDFLAGS.patch
@@ -17,6 +17,8 @@ Add use of $(LDFLAGS) when doing the link, as the kernel provides the
 proper emulation in those.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 ---
 Issue reported upstream:
@@ -25,8 +27,8 @@ Issue reported upstream:
 diff -durN nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild
 --- nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild	2016-08-09 01:57:50.000000000 +0200
 +++ nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild	2016-08-20 12:25:02.780233423 +0200
-@@ -87,7 +87,7 @@
- always += $(NVIDIA_INTERFACE)
+@@ -93,7 +93,7 @@
+ always-y += $(NVIDIA_INTERFACE)
  
  $(obj)/$(NVIDIA_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_OBJECTS))
 -	$(LD) -r -o $@ $^
@@ -37,8 +39,8 @@ diff -durN nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild nvidia-driver-3
 diff -durN nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild
 --- nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-09 01:43:19.000000000 +0200
 +++ nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-20 12:25:39.596772662 +0200
-@@ -70,7 +70,7 @@
- always += $(NVIDIA_MODESET_INTERFACE)
+@@ -75,7 +75,7 @@
+ always-y += $(NVIDIA_MODESET_INTERFACE)
  
  $(obj)/$(NVIDIA_MODESET_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_MODESET_OBJECTS))
 -	$(LD) -r -o $@ $^
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
