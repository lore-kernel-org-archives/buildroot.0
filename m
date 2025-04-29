Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6922CC369DC
	for <buildroot@archiver.kernel.org>; Tue, 29 Apr 2025 19:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A994097A;
	Tue, 29 Apr 2025 19:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-gCVzUmifPa; Tue, 29 Apr 2025 19:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05C20408F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05C20408F7;
	Tue, 29 Apr 2025 19:54:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 554CFE4
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6A060EE1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n60jYAOsVh2G for <buildroot@buildroot.org>;
 Tue, 29 Apr 2025 19:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1895A60C24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1895A60C24
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1895A60C24
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 19:54:26 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-acec5b99052so234373166b.1
 for <buildroot@buildroot.org>; Tue, 29 Apr 2025 12:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745956465; x=1746561265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUtvYdvPlkbfbsSZUCK581hqWADzuLVeohOnqO4PHLA=;
 b=OVg5wkGh+9vRlXNVYaS+z1kA/hMiug+0fkyZU6Cp8Fu3CxFanJUKG878s5pwHAftEV
 nbA9l9MLGpoOz2MMiCmJAbimMy9oukW0F8RcL2ZpQ9NxSqY1f8xtKzogzQta0Hw8jdBn
 marKjW22preAkZc9EEQXatNRcou/Dlk0xlN7Rgrn8e2xUUQ6nIFdr9/LjPF0056DUfZe
 sx9Hr552UX+4n5TqkEtyhuW84rxNSGHRBe0TNh0IeGk2sT1+nEH8lOUyURANvYmWXvHn
 RoZxq8RmNgPeeNlLJHilhO8RsA6/4DA44xZXjoSHA9PsPSi8Ujm9hpCPl12h7cTx4+QT
 q1Ig==
X-Gm-Message-State: AOJu0Yw9fh6QR0AB9B4y7Mk++LkEAx71aZa6vtE7H9bJfEirzpDTDJu+
 RDhk/ouNmnX6KHuo4NO37UPOlzGzPP8Wl4+vzvcW+34pmRoeBeAyKRxsDQNfbzZuFx80cONgIy8
 x
X-Gm-Gg: ASbGncujm3yHOFMSp2chj4k1ydWuUENyizkn5rgmUFZIGwMcmymk9UQ1iutvpfEa1R7
 /1c/YB5HllyfsuoMYZ8cLvwp9I5UMQe+dffb3yBU0oXYrs2u7BDFJM8SpeSSrNDdGCgj5uH/Q41
 op9GEeO8CPXAnr5UkpBxeo9NwDQwhd+Zqd0XDyFW+MpHC8/Rxg/eyjfQcmO36yg24PvHiMfp5QK
 C3XNQdquwDLrFEM2Q7Z1HbDBMbjh+m8EA3CvBwYgZg+um6hXnH/Sixah7W6jobHDpcjAgchHHo1
 4E+9pgV8PaRuk+Vc61V5/ZHxk/NRubArMewzGMhZIKupAwzKuRV7hqlDtDV8oV4/HnhbDD5mSdC
 d62HGXG7yT6qJjSN7pEYnj0HCkCX29A==
X-Google-Smtp-Source: AGHT+IG9dV1VQSm3LPtnjhLI8kwnxoKwxsqHGJFNEsrqcFOhQ6atoJe7csV/8rv3DQ/VVvpQTdyqxg==
X-Received: by 2002:a17:907:9722:b0:ac2:cdcb:6a85 with SMTP id
 a640c23a62f3a-acedc5e1a6amr63635266b.22.1745956464895; 
 Tue, 29 Apr 2025 12:54:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.22])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acec806f725sm162189666b.121.2025.04.29.12.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 12:54:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 29 Apr 2025 21:53:37 +0200
Message-ID: <20250429195337.566859-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745956465; x=1746561265;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vUtvYdvPlkbfbsSZUCK581hqWADzuLVeohOnqO4PHLA=;
 b=YwvbLgzL0iPyH2T3RajFd88JY02RzoXjaR/vNK580ICEjvINtHo786E4shnJQj2EiI
 glgOMD3dsMHe683tmaP87H+cmblmcel4uwbI1Nn7/wIo1lozBl08GNtQS+S2ODQFQhk/
 +kgAUtWpyKyoRuMcV5IMEh3cf4JZlQYjv8iPY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YwvbLgzL
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump version to
 c515ea2e1ceb
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log since last version bump:

  c515ea2e1ceb mmc-utils: Doc: new secure write protect commands
  3fc7643ac148 mmc-utils: Secure Write Protect Mode Read
  bd51a271de9d mmc-utils: Enable/Disable write protect
  5d3a04e70b05 mmc-utils: Add secure write-protect mode enable/disable
  05051e40351c mmc-utils: Refactor RPMB key handling into a separate function
  f4247f56085f mmc-utils: Add SECURE_WP_INFO field in ext_csd register
  50a30df1b74d mmc-utils: Add byte offset comments to rpmb_frame structure
  88e956459a79 mmc-utils: Pack rpmb_frame structure to avoid padding bytes
  d4d3eb24f560 mmc-utils: Reduce scope of nargs for RPMB commands
  437d369cd9d9 mmc-utils: Initialize RPMB frame_out structures to zero

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 17dedad2b7bb..685952a6150b 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9630d911bcf59e235a349d862700fa7ccea7545eb314da48431dcb4da125023  mmc-utils-2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa-git4.tar.gz
+sha256  e10cd7fded5f248d515fe40e35f73fe491e87e4b608ca857afa40fcb8cda1ae2  mmc-utils-c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58-git4.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 0036a775eeec..b439c84d474f 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa
+MMC_UTILS_VERSION = c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
