Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94A7C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 13:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 589548204C;
	Thu, 22 Dec 2022 13:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 589548204C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZvPYt_WFvGz; Thu, 22 Dec 2022 13:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7C8B8209C;
	Thu, 22 Dec 2022 13:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C8B8209C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DACE51BF577
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C277F41886
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 13:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C277F41886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J__EnXYUE0vj for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 13:46:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D050418D8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D050418D8
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 13:46:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o5so1706826wrm.1
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 05:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jpOEAhy+swbVinfpipdbPyEZOJjES17Pg7mPZ+Vs4u8=;
 b=rlmSLQes7ADL8doPksMAyVw8DAowlkEYfQJJK8Xp1ZYuR7bQS2NLwsg0I96Q3siuhk
 QAc/MFADqbDZEze+YMGsrPKQ6sZbZTMN2AzK0HLmB16BaPsr2wpC8DVHJ+ouCemKPOrA
 ZzWIXhA35nVmXCa0/wttTgiF3fzbyANjftjVr6cuKIbAO5Dc4J9iTVBaeHA1HtRcoQnF
 lLecHx9npmjBYoXELebrg9vVU7KFKtB25HCk0I7u3U7K19CKRKza6IcUlQ/D7H4CRhCp
 4y7xy4/ifjYxdx/52NxD0gHMmG1dBIK1XMEDEsPt5c2q/KneoCV13M2ibjsgvvJQM3CV
 pJxA==
X-Gm-Message-State: AFqh2kpoJSNKfkdnu+RodmmOm79xWw/2FZ6Ki089t/v6ryAa9sWKDd1O
 RePu+2mpZXfyPRj9Kr/fgi1io6IVbUk=
X-Google-Smtp-Source: AMrXdXuOz/MtZXFgnrv6DNxlJvhFi9jY28xv4PGtsBxBKsfRMlqVoO8pbZm4z4dBQefanKqNI7RhQg==
X-Received: by 2002:a05:6000:609:b0:242:eda:dda5 with SMTP id
 bn9-20020a056000060900b002420edadda5mr3910949wrb.25.1671716799463; 
 Thu, 22 Dec 2022 05:46:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfe7c2000000b0024245e543absm558743wrn.88.2022.12.22.05.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 05:46:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 14:46:33 +0100
Message-Id: <20221222134633.103213-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jpOEAhy+swbVinfpipdbPyEZOJjES17Pg7mPZ+Vs4u8=;
 b=PMON14QYNqgtghnBG0EhJlI+44sr/nP8chn5Y43poM/plYKTqWpWKNJKdgriM4V2oq
 bJFjQGlhG5NQbo6Gz0/WXfzLZbx8lGbmDZrxzy4qpZWpof5bqP/9cLFJsKaFZD7y5JBX
 dVz3gHw6Vo8gikAhLPRuCc5wRangaRrGN00rldpKpur8ODNMT2ecbfz8KaLIopWr494v
 DkCfCeN4C172uCisBPO3BZrbHThd+2eeIaH05Io0ib7Md4v0GWuk6381oKJ2Ug05C6yB
 TZYVom9v1qk9VGVfh09nq/dF6l736EyqKcd4Yz67SZExl6Vj3zURhMKHYF34tLsDVQ3W
 ecGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PMON14QY
Subject: [Buildroot] [PATCH 1/1] package/nasm: bump to version 2.16.01
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

https://nasm.us/doc/nasmdocc.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nasm/nasm.hash | 2 +-
 package/nasm/nasm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.hash b/package/nasm/nasm.hash
index 86c67d6ba5..e9771c1d7f 100644
--- a/package/nasm/nasm.hash
+++ b/package/nasm/nasm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3caf6729c1073bf96629b57cee31eeb54f4f8129b01902c73428836550b30a3f  nasm-2.15.05.tar.xz
+sha256  c77745f4802375efeee2ec5c0ad6b7f037ea9c87c92b149a9637ff099f162558  nasm-2.16.01.tar.xz
 sha256  1563996c52e220e15ef2418e67d39488255aa8c28c89e617074d3afe3ee329e0  LICENSE
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index ecb0889363..043a84cf07 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.15.05
+NASM_VERSION = 2.16.01
 NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
