Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D1C021B5
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 13:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C55A60AED;
	Sat, 22 Feb 2025 13:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOourZg4cGNw; Sat, 22 Feb 2025 13:31:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C13F60AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C13F60AF6;
	Sat, 22 Feb 2025 13:31:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B0986B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E30B181177
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJOf4_l0RHAs for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 13:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com;
 envelope-from=devin.buildroot@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D49078116F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D49078116F
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D49078116F
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:37 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7be8f28172dso208621185a.3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740231095; x=1740835895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L02s1h5tS9Ajwh9twH7XSW74PBM/rQVU4tlEYikwOV4=;
 b=qcSiUj8xg1iOw2zYm/WSWjJWgKR9TgMIduDY2GavGYuVoZFw6ZBkqQ8rVdRWYilOqv
 JRb0GB8+VWu2j+9oOz8CmamxR2Y0GRAdH0FPeZMqeFetFbZAbBDJO3spZyZLUUxA2E8x
 IxnGkA+LbBvQp5XAGvyoXeza+In8nQrrZerCHsY5BRR0VO5d3eD26q7/L1fMyZ9rUXLv
 03/WAWLyHKTkt8QYweQkZT5iw41OmYkF3a2/z7evVjDWuUf3yJk8HrXFrxJEAcCIaDXd
 CaKGzKkD8ebhJ9MOZtA8xxJ92xiOCVaI34rBXIJgEMm1wPwO8AL7lYjlsFyki3IsaK9t
 nyrA==
X-Gm-Message-State: AOJu0YyCenqAk6XkggQDjH2uHWQbIHBYaCQYmgBOllCkEDWtFaspQVel
 bwYEeMfX3gl3Oe/m16G4OqUdVvhkWu+Kds4qt9gwFIuiTBkvAldq4jMYkD4Q4lg=
X-Gm-Gg: ASbGncszfNqUH3ueAnRrmFY7PKqacDufwFCLYZxhtyTeeb/fhs/TWkbudy7bHJcxHVs
 M81Xwq8CXmeyRA3xLgkZSUfw6vGJ/+0tHmOd26YvDHHV9HtfPxolZG9VJE37BzBGF0NNUJUnY9J
 MeSl0+alsbOP8b+gbO04yBjWiXn/OqLQfEbKzJmsRNzLpxbJFfTb9dSkoWB2BghdYLRq4pSuFVu
 VBAffLn8qNRUbAMTwRYGRtL0vF9mnexo+/cU1VuRqtCpiJpIBpCJYio8OjxX4ILKahqriAJJQNQ
 aV0Eq5CjhkRsW/qJejjBuAk3xsEucU+QhYf6ZhCSsqKtNbQwlWifsOgaHix8/3kQXFSegyfqdSC
 OnvgV7mbZOVfVvZ+B+GKCd/yZjj2fshwKWnFFFg==
X-Google-Smtp-Source: AGHT+IFtoiXzibQYDIBLzUVoy75SkN/w8sz84VFdOyF1BfpfPjPVw9xEHLhagYF0hhWKsa/CgkuUhQ==
X-Received: by 2002:a05:620a:28cc:b0:7c0:a63e:4622 with SMTP id
 af79cd13be357-7c0cef1120amr908879285a.31.1740231095586; 
 Sat, 22 Feb 2025 05:31:35 -0800 (PST)
Received: from localhost.localdomain
 (vlnsm6-toronto12-142-117-124-97.internet.virginmobile.ca. [142.117.124.97])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c0a63cdcd7sm653747185a.1.2025.02.22.05.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 05:31:35 -0800 (PST)
From: devin.buildroot@gmail.com
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 22 Feb 2025 08:31:26 -0500
Message-ID: <20250222133127.9445-2-devin.buildroot@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250222133127.9445-1-devin.buildroot@gmail.com>
References: <20250222133127.9445-1-devin.buildroot@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740231095; x=1740835895; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L02s1h5tS9Ajwh9twH7XSW74PBM/rQVU4tlEYikwOV4=;
 b=h6PiJ6ADKupHc3ze+cGBA0rVI9VLuK3vVIA66zKYV7VhcnQYLEOKBbX2/vFwJPzXDj
 0rGwCh5mifAFv+Np5C8WXd3B/rcqy1CEaCEa5gUUzfn5dBtARCi6BDEaTWIDXl2MFw0p
 sFxnsLfulhtT29r01L5WDD0wXXquFa2UWolKPHYVioCP0UuWIcQttEK9MuMT9DREPzGF
 j+Da1eVJcEBRLyRyWYzjp6Ht3GUtdsJxRGU6Qd6ceRK27w0yyd2NR+ZceVF4vNwboPEp
 WxkAYH7OGqQif4OHl7OSNU8gKho0GQ2a26PTBArBZtiWe9l27azUb6x5puBUgstaiieE
 mzGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h6PiJ6AD
Subject: [Buildroot] [PATCH 2/3] package/lttng-tools: bump to version 2.13.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Devin Steffler <devin.buildroot@gmail.com>

This is the second of three patches relating to lttng-modules 2.13.10 not compiling with buildroot.

Since I am submitting a patch to bump lttng-modules to 2.13.17 and lttng-tools is a tightly related package,
I am also submitting this patch to bump lttng-tools to 2.13.14 (the latest version at this time).

The chanagelog for lttng-tools 2.13.14 can be found here:
https://git.lttng.org/?p=lttng-tools.git;a=blob_plain;f=ChangeLog;hb=556250037f05705059581107159a60c2c7468744

Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
---
 package/lttng-tools/lttng-tools.hash | 4 ++--
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index b48904d0b9..c280809666 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2.sha256
-sha256  b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1  lttng-tools-2.13.8.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.14.tar.bz2.sha256
+sha256  53bdf7c4ad07dbfe660ee4d9affc63fe44ae59e9a73c6f7a96e0fca140e5adcb  lttng-tools-2.13.14.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index add1f12a8c..5a1e555f7a 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.13.8
+LTTNG_TOOLS_VERSION = 2.13.14
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
