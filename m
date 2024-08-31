Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF92CD13D2
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 14:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39CA40376;
	Sat, 31 Aug 2024 14:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15_fIJcaUyqP; Sat, 31 Aug 2024 14:55:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B26403E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B26403E4;
	Sat, 31 Aug 2024 14:55:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4711BF867
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 14:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CF9F80D69
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 14:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8-11TmQ8Ff9 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 14:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6341580F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6341580F3E
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6341580F3E
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 14:55:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23573so2855756a12.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 07:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725116101; x=1725720901;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XLauVM5fKES8H9+ObOwWts7Kkd+qT4ZlgBD1FapPTAQ=;
 b=jNI1w/j0vch9jp6xcQ2AwfEXZjo+AyFjnnql8E/oMYNkKc/cIpa2/UGrj+3YYvgc2l
 JST9+JfevmNzBjHxzRJge8Nz2BbgP0u1yfHajVDfBwwGbrGB2kbKBhZaqChcQfjqhnBb
 fAvSRE5C6Cx+7UwbvBC3V0zqe0BgsQnCh6hQbPHE0KXClvhx9FS9zM/c31ZRgIGLpVmp
 f/sn2PhhiPPdbUQQslRPStiCwRsYiSmfJSFOLI9euoy9k5n51UgY0W1oRPPHkxExYkTn
 Qjwgtf1XPaJ6wBia6Z4QQy0tMejbDT6DwoUSgFFHNcyzDBd7YZmqrbu54Gncq9vNfc5y
 ZoEg==
X-Gm-Message-State: AOJu0YykWFZOI+TCukq5Q2bzitlcKvOrv8IZemHbzH8lCivgIMb7yMN3
 WJwobRjLSjJQAPuaKgii9VX6F+Vhw9xQs5IeH4blgkpnvXopeLegX0S7N64+6Om/lUApdpbEcYa
 ph2U=
X-Google-Smtp-Source: AGHT+IHg7Vemo0vOKg/VfaRQ1EcpAvxh6EjzLlr51J4nl0RJBhxGddHjHE+449apwph5HugBBJobwQ==
X-Received: by 2002:a17:907:3f14:b0:a86:a866:9e44 with SMTP id
 a640c23a62f3a-a897f1c576amr710321266b.0.1725116100649; 
 Sat, 31 Aug 2024 07:55:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196968sm333123966b.139.2024.08.31.07.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 07:55:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 16:54:49 +0200
Message-ID: <20240831145450.3162934-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725116101; x=1725720901;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XLauVM5fKES8H9+ObOwWts7Kkd+qT4ZlgBD1FapPTAQ=;
 b=kC4SDXqSXDUTx6AGGNLfvpYRO9TWDmMX92CtqHW6RIO+Qw5jWZ1v9GlzmZ/ELYLquk
 Muw2KsZSh8YSv6nAYfNMSGKjU0RZ6KyDtbm0XY+FFKiYvGi6AqWOX8NNsnV7jGMr4FhO
 PuaBlKmTNVCIPi4W0UZUcYXwj6HNnRtFvmlOM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kC4SDXqS
Subject: [Buildroot] [PATCH v2 1/2] package/babeld: update URL site
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
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1], version 1.9.2 has been moved to another archive, and
it is recommended to use https://github.com/jech/babeld as the official
repository.

It was also necessary to change the sha of the downloaded tar.gz.

Fixes:
- http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9

[1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
  - Don't bump to 1.10.0 but update the URL site.

 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa010..e725b1fe310c 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  c8c8c3698afb00caa5a5c9bbbb0a22b56d79ad3f9775382915ba979ac88c4e8f  babeld-1.9.2.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9f1..67d66da24f17 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_SITE = $(call github,jech,babeld,refs/tags)
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
