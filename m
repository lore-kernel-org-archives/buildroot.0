Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5178DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 06:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5441401BE;
	Mon, 29 Jul 2024 06:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6ZdP_MH_Nvh; Mon, 29 Jul 2024 06:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B935404A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B935404A6;
	Mon, 29 Jul 2024 06:34:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F02D41BF3E1
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 06:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB43F81154
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 06:34:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugz6KtW5QFel for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 06:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8A5C81150
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8A5C81150
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8A5C81150
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 06:34:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so48139021fa.0
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 23:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722234864; x=1722839664;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFj/Be+TphjAmgSq6nPh2WTUNi3uFjfeI8/HlVkqv7Y=;
 b=TTxpBlkqFOgvvsHhgGKOFmjA8jzZsbFHhzH8U0+HoHmAEqiXg7eh6C6hWHZq9lAYnY
 4HHqQQZHFW5CBGPs/Xu7jOmRrUO5z6rMSZiHmlpMfQ1b+/QPMhs0LrbywmWz12yards/
 VBDNfYKOMNdDaQhEp0fpueP7KxgbEVvnE3KM1cxyljM8TDfi8zIPiV5luxawyUMEYXuT
 pe2Isz92P2oTFHU9M3jaUC3nHmk+iPfOVSrUoZwFCDkQifEkh4r+QC5YxDb2z0CwZ/Zf
 EZkojItT584WiIZdRbXKJb13eC99mVkN93uYAYnj9lubi55sVzwF+zBu6nhQExhERS4j
 gWHQ==
X-Gm-Message-State: AOJu0Yz1qYGvwngx150mRet8dkzE+uwLqtVQ3Nqw06FFPAj6Ih2cfXO8
 nOLsv2PGJw0O+eS0kTAmhRuc5z5UlCULs5ZicNkUEc66A8HKjo+b7S5pfw==
X-Google-Smtp-Source: AGHT+IFSF6OJ577ojqZ5I3nRX1eemB49LdvIMB+qLm0o4BfmitK6ON/vBYUgKXkbpPRRsfYNULIeIQ==
X-Received: by 2002:a05:651c:545:b0:2f0:1fd5:2f29 with SMTP id
 38308e7fff4ca-2f12edfef11mr45711321fa.19.1722234863345; 
 Sun, 28 Jul 2024 23:34:23 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d07583csm12210941fa.113.2024.07.28.23.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 23:34:22 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 08:34:20 +0200
Message-Id: <20240729063420.4147514-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722234864; x=1722839664; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nFj/Be+TphjAmgSq6nPh2WTUNi3uFjfeI8/HlVkqv7Y=;
 b=e9l17G544gwxuQybqi9Q+cqkaZHK64uwUVpQMKDhIJ+n2ZHzFnUev/Z8CRs7bs47Zr
 tR/m04y1wZEZ31PPhhL+T8pQ0+Z3MIONtJF44hBjNR+bg++NFSs9/qEFqEO4vMkB2OLZ
 Vvc9PvYmKfMNIFykycL4lrN7EGU/rJ+0nMRsUa4s+aLMoxDu/7ULG6BKWCYG1+9IcPu6
 Z3+/kY6Mvhgdk4vn4uLYQWrdepZE2jqDAevdyudsAFUmBMzV8A7kaYhNch4vSZyPsuzG
 jGy6C2tuhWKJsQN8Q4VISg0SYnaA0B9/AB5JRCV4inrDiFsPoLy6efaJtDGh9xIrSRZN
 N9hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e9l17G54
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.6.1
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From https://github.com/troglobit/sysklogd/releases/tag/v2.6.1:

 - Read .conf files from include directories sorted alphabetically
 - Add extra linefeed to wall messages to ensure they are seen
 - Fix segfault on SIGTERM, regression from v2.6.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 361d68a157..0a5790a1a5 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  c5ae067b479b54ef90fa9352c277d44ff7b4314023fc6ee0a37e81b99a78a917  sysklogd-2.6.0.tar.gz
+sha256  e35d5c5f55019976302ac9818890bd6b6858db257506f0e9afaa718a8dee9cc3  sysklogd-2.6.1.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 59081f2734..86bd4ef168 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.6.0
+SYSKLOGD_VERSION = 2.6.1
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
