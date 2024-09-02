Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ACBCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 20:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE32340208;
	Mon,  2 Sep 2024 20:57:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFkmR4gPPypr; Mon,  2 Sep 2024 20:57:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6816F4021D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6816F4021D;
	Mon,  2 Sep 2024 20:57:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBA41BF426
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F18AF80EA7
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 20:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUC5zdyZhk6M for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 20:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB43480E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB43480E62
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB43480E62
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 20:57:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42c7856ed66so20563955e9.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 13:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725310636; x=1725915436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTtJLh6y5RX3ed/nuPOnAOKHqdSniRkn7hTSfqj9FRY=;
 b=XW5xFh4ws/U+NtLQJVNx7hJGnbAC1vBFxKMO4sRmuh1jhec/5jcdREQxB0fpvr1/Dt
 Qt0QEuRG0xjNcAS8WjYJCrcy9pKEp6m2qdE9PCR87q+48ms1gboNY4w4bCTp49yCoRcS
 CPSOIHhw82obdyAVYL13twnZc3VXUZioxoi3Sm43Scot3zLdfjCBEWPEH3Y7XPlQzft8
 i1bdmyHn6HkcmUIsEkSrdTKIKGvTKl70jdCpXUHpZ+1Cl7jFqC5taG7YOk8h+Q39DK83
 AA3m0nud0lA4GXeknos7zTmHnRD9oCX1bR8+ay9hpLHtR8xP1R5UnSOmIc/k9301nEQ6
 OG9A==
X-Gm-Message-State: AOJu0YxnKzqsoLta2cGdCoxAswBwdztTl7j220NBzOj8W9XehsYS0AKn
 47mM2i9bsakOqrtzjCLUtIzK+feA3twysfsjECNM1R+N2We5f8IhPPPvxPSBCfCCKUQnCiITvAH
 RQ+8=
X-Google-Smtp-Source: AGHT+IFL8VvBenFUs0H+JVQNnX6wwAYCKkaPcUuL4JiWIZk5h12JqxWjyxG0ghOTDF/3+POuWL+2FQ==
X-Received: by 2002:a05:600c:3550:b0:428:1310:b6b5 with SMTP id
 5b1f17b1804b1-42bb27bc4acmr134076645e9.34.1725310636072; 
 Mon, 02 Sep 2024 13:57:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb43esm149733725e9.7.2024.09.02.13.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:57:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 22:57:06 +0200
Message-ID: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725310636; x=1725915436;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTtJLh6y5RX3ed/nuPOnAOKHqdSniRkn7hTSfqj9FRY=;
 b=RfwzS6dXkiKu6Oo4VqTHditHeIdPMQ+WZCZH/q2mVXiZvREF3jwZ29rypIBGnBZLn0
 uhPirJdXzVhrYwd2xR9z3i0sKo7zWyutFHMBaTUsGHWx3cx9wItFobpq6uG+v2Va+1SO
 qucz72eZEE9WUhSUFrrTne/EFBonNaz1YjMPc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RfwzS6dX
Subject: [Buildroot] [PATCH v4 1/2] package/babeld: update URL site
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

As reported in [1], version 1.9.2 has been moved to another archive, and
it is recommended to use https://github.com/jech/babeld as the official
repository.

The use of the github macro:

$(call github,jech,babeld,babeld-$(BABELD_VERSION))

would have downloaded a file with the same name (e.g. babeld-1.9.2.tar.gz)
but with a different hash from the one downloaded from the previous URL,
creating unacceptable backward compatibility issues.
Therefore, it was decided to download the package via the git method. In
this way, the downloaded file is babeld-babeld-1.9.2-git4.tar.gz, thus
with a different name, to which its SHA can be associated without side
effects, except for breaking the release monitoring process.
Unfortunately, for now, we will have to live with this limitation.

Particularly interesting are the explanations provided by Yann E. Morin,
which you can find in [2], that guided the creation of this patch.

Fixes:
- http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9

[1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240901063634.3504315-1-dario.binacchi@amarulasolutions.com/

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v3 -> v4:
  - Use the git method to download the package instead of the github
    macro.

Changes v2 -> v3:
  - Fix the way the github macro is called.

Changes v1 -> v2:
  - Don't bump to 1.10.0 but update the URL site.

 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa010..1c534d6184a0 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  22549e27645ecb9ef4c715a3cbeea01fa2dc7ea6951e8f97dc9c4a7b2a1de8f5  babeld-babeld-1.9.2-git4.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9f1..ac32e798c859 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_VERSION = babeld-1.9.2
+BABELD_SITE = https://github.com/jech/babeld
+BABELD_SITE_METHOD = git
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
