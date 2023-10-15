Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0C7CDB482
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E67A404A3;
	Sun, 15 Oct 2023 09:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E67A404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bCy72lX069ww; Sun, 15 Oct 2023 09:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 341AB405CB;
	Sun, 15 Oct 2023 09:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 341AB405CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB7591BF30B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910A1408FA
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910A1408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6HUJKo0RSTv for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:26:56 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14D99408E4
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D99408E4
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-53e855d7dacso1146347a12.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 02:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697362014; x=1697966814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KaUcF710O/+E6VRKSQY02v8crWEmrTHso75FkcYc6ZM=;
 b=svtjm055D9YKTGavoJwYL2FYAnfcID9Zwptln9aqwLitR6IGmH1oFHYAMUe0lCu90x
 q6UYahJrRhjjCr9PvJBZHd2rMfv3Fhf06DS8MmQEXCBoa+bGIvis7D7EE7HGKqnMaVkL
 OmidFjxnXS+vFaiQ3jtWnSqPt6ADeNb/aP1QQLP/Mzju6GsG72l9SOTyINnZFGbea+8n
 5oeBduJtU6Fta8TO/w9JjkjESUSynyORy4Nu0FV3KMDOgnK1NZTdUny21uSc8SysLRkT
 zTdnh7gUGTKnLMIDH7BJ6kT2aL46p8lRzfm7CcWoxKQFR7Jo0I/zdphXSonoxZtaxax3
 MlxQ==
X-Gm-Message-State: AOJu0YxgQWdKn0egr/CxUxgspnCQiDG1D3WmqDnf19BCwifINWFGuIqO
 yfbu9hax5+jCRYgr+iSex8TrUv6gPys=
X-Google-Smtp-Source: AGHT+IG0GmCjkleijTaeDz0Yx2xoKSYoA0gynY1LgPZOXqiZPA5ctTrvWCf0nhg4YGme8KBrbzyDlQ==
X-Received: by 2002:a05:6402:1205:b0:533:c75a:6f6 with SMTP id
 c5-20020a056402120500b00533c75a06f6mr24880511edw.12.1697362013747; 
 Sun, 15 Oct 2023 02:26:53 -0700 (PDT)
Received: from localhost.localdomain ([98.128.186.118])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a056402125000b00536159c6c45sm13484206edw.15.2023.10.15.02.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 02:26:53 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 11:26:50 +0200
Message-Id: <20231015092650.392835-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231015064117.1362398-1-troglobit@gmail.com>
References: <20231015064117.1362398-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697362014; x=1697966814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KaUcF710O/+E6VRKSQY02v8crWEmrTHso75FkcYc6ZM=;
 b=h/ErdRHKm1pNuPW0dPE80IGBfkMbVaCVQpI+cN6erE58FFk3+gpXGbtOOFAgRO+6ZH
 Z7B2FlZR9l9DD6esPawrpAnXrUm0WLkjs3ulTS5yHkh46LoTkKzz8dNCfWT93wk366TK
 +g83qNnnN37Sr6q+abuReNWWG5n0+9UDZ1wT7UzPwRnQHobuueL5JOi207KNLJwPbM+j
 pNoa7Lz9yq51AUxO7Z8/UjRZ3J1tSaD4SK9L6s4AqLfLNUEvK9Z5oXHvhk5bmi6B0uh4
 hx4oh+MGIwCm6PXOFi06bdpCjoDo0mMYzDJXkEPlCD08SYqkOSHPUQBkcqWQFy4qdtAG
 zaMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h/ErdRHK
Subject: [Buildroot] [PATCH 1/1] package/libite: bump to v2.6.1
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

Changes:
 - New APIs introduced in v2.6.0, for details, see
   https://github.com/troglobit/libite/releases/tag/v2.6.0
 - FTBFS fix for uClibc and musl libc, v2.6.1
   https://github.com/troglobit/libite/releases/tag/v2.6.1

Packaging:
 - LICENSE hash changed due to bump in copyright years
 - Disable doxygen (html docs) in build, introduced in v2.4.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 7dac198ab8..3abad09b0a 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
+sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
 
 # Locally calculated
-sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
+sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
 sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 1cef992e53..e4bd845487 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.3
+LIBITE_VERSION = 2.6.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
-LIBITE_CONF_OPTS = --without-symlink
+LIBITE_CONF_OPTS = --without-symlink --disable-doxygen-doc
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
