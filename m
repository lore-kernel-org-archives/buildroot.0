Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7F4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 22:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5AE6108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 22:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F5AE6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E140340600;
	Mon, 18 Oct 2021 22:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8EW6qYk4toPS; Mon, 18 Oct 2021 22:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5142C405E4;
	Mon, 18 Oct 2021 22:00:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6A11BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 22:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BB7980D93
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 22:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7dBN3TuMXS0 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 22:00:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9592C80D79
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 22:00:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t2so44008934wrb.8
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg/ZsbQnmeC3zLqkMNF3RumFRGojaUz+eDtFSi/An/c=;
 b=AGg2Wi/SYJIzd+F6Xc8tASNPRXebCD9m6UmLgYhHIWMcnc0nKWFZi4fkHLaBmXngvA
 fSCqQoItav/vjdsC3E/ymsaxC4On4tywrd6HG5S0AxzKCU59Om/KDFdzU4e5WbHt8Fdb
 trKVllrRRY8noTPK4vfO0pPqyhPamiEtejMu5Lw5+cHe7K71IiflejaTiUo8Co6tHaVv
 YWNgFIgoCVuGej9vMIgXqJEMFXGU9R8E6/l00NUIVbKahgqjSkXbYkX+if0i2wD5BDRN
 scMZknwQBsWzLkna6P+ZtXOicWGH9uY0wrNyReUAx9cYVFHxK72K1eaWXZUjAdYSb7Vu
 c7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg/ZsbQnmeC3zLqkMNF3RumFRGojaUz+eDtFSi/An/c=;
 b=tDBjG1eZ8D2M0S/ZM3wHSxw0gvu7eHt6S9dG7L0lrcLm6fJN63cS1Iu0VdYgNA188w
 ydwl/untrpc/yt8dYutW4qs7fmqO4ITq35pLhtY5aZaIWe87wLgbfL0E3XWsmHjkFnoq
 470Z3BUbu+eGsBwxg2Cilh5eH9tEdRKfnTr7fe8xVm2vX71V24ooFQ11hY4faaW6XIGg
 lhcJfAQubVstgwTVitfkYt4Co5Sx/19yR6fHZNJEDhn4+K2GFCG/mDalrdCH+tCcGsfT
 f7aiXbcDhlcVxOMNHXNzShjcOD19i7/e0nh2SfQ+riY49+M4VTdRE7QAxzcrsdqyXsh+
 SB4w==
X-Gm-Message-State: AOAM5330oF9Uzi/wCEBMPmus+QiS9ZoEmb17wsu/aLLaU5DvgswJZZxV
 HRBtqMgbPzcp08X52a73lmHtGNALF9Y=
X-Google-Smtp-Source: ABdhPJw7XtzoNiQO1yjNuimFIL+dLdV8g9HW5HFcNn2GIdejTplCjJX5JEYoIFwF1Hxr8iHQMxo4IQ==
X-Received: by 2002:adf:a550:: with SMTP id j16mr38561309wrb.180.1634594446514; 
 Mon, 18 Oct 2021 15:00:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n7sm13347879wra.37.2021.10.18.15.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 15:00:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 23:59:30 +0200
Message-Id: <20211018215930.1515668-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bats-core: bump to version 1.4.1
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

https://github.com/bats-core/bats-core/releases/tag/v1.3.0
https://github.com/bats-core/bats-core/releases/tag/v1.4.0
https://github.com/bats-core/bats-core/releases/tag/v1.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index b50543a269..369cc703d4 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  91c49b1fe6f0656c46491929ed728f8dfa9a96df0cce294963e8c6082bff87a2  bats-core-1.2.1.tar.gz
+sha256  bff517da043ae24440ec8272039f396c2a7907076ac67693c0f18d4a17c08f7d  bats-core-1.4.1.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index fc8ac674ae..181d4eb033 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.2.1
+BATS_CORE_VERSION = 1.4.1
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
