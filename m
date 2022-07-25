Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC29C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80A284C85;
	Mon, 25 Jul 2022 12:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80A284C85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2Q9eurjnSKO; Mon, 25 Jul 2022 12:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1E9F84C80;
	Mon, 25 Jul 2022 12:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1E9F84C80
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25BCD1BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06FA6404C9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06FA6404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnZEG5ZmWsEl for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:51:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8412E404C2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8412E404C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:51:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 r188-20020a1c44c5000000b003a34ac64bdfso2405196wma.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 05:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTFeBS6JGNCInuovBmu//4kYPJqWHz68LyLfXFk2rYk=;
 b=aLFpn4mAy4vikVFf6Vt8hrPa/9Tz6VVydBGjMEZLceL64aR0xpTHnUwB0/O9D/3WHf
 aGQJMcJbXLTx/jzL4LuZ95Q1BbMEwsOf8xJQG1kVB/SUA38h0XkZE5bTmYOZkU4tgep1
 J8igzIQavLvnd6oR3+oz2sxOyD9ufBtKVam24WnveFZBEVqjx5sCXiSkXC6Zs+MYi4Vx
 MOhRWL+9srExiqA8v0wkPwamuv2ep+6Hj2sPjCAZDcp8PVkjfdxjZq5k4l02fwCCvfDz
 tXd/fAj8s+irKzEkQnJl4AwxExJ+3d2CXXR0zjl0qZUz1GzMZOSvDnSzSn+cJTkSHRdQ
 G8YQ==
X-Gm-Message-State: AJIora+WbOB0aLEl2Cbv5PQDBO1crqIABa5M229zICF9ImTSfNs7VGIu
 S7yyQA1j1ZQBGUlpNmAlHoLw/t90CWRuew==
X-Google-Smtp-Source: AGRyM1uGiYBGoh2fzS2juWN86SSm4sfkZR8V1UTCbMhmUDVL5qa+JEw3zy0DSJyZ4XBk104eR8BDTw==
X-Received: by 2002:a05:600c:4f95:b0:3a3:4612:6884 with SMTP id
 n21-20020a05600c4f9500b003a346126884mr9105030wmq.39.1658753510550; 
 Mon, 25 Jul 2022 05:51:50 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 q184-20020a1c43c1000000b003a302fb9df7sm17689862wma.21.2022.07.25.05.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:51:50 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 14:51:47 +0200
Message-Id: <20220725125147.19057-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tTFeBS6JGNCInuovBmu//4kYPJqWHz68LyLfXFk2rYk=;
 b=EXFg+touYBJ/vctbiQzEk0OQlUp6xlqgJWAC3issUtXmho/fPGxxVgdcLzhILtXl+C
 LlZt+9ooVGcsD66oYqee0zMxRH8jFKKbDa64wi83wBDENIi0IFPEQjnpouOV0LyI5CNr
 6vJbZPJiQcFASxsnGO7tBTGc1D+KTeIJTAmet+fQ06DCDbxrVGYIXf13iQkfN1YgBcbh
 aBeVyFDQjA8d6I3zn3rs1p251x7BnsBYm3ypzdsmhSOLuD7AkhE/ycUgKgXjeSUHphsD
 Uh714UhLZJbndX47j67g+eDHjce+8L7pCe2doCits79PgOcvPgayiqT0rt2NcXl8WR8F
 q5/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=EXFg+tou
Subject: [Buildroot] [PATCH] package/gcc: disable split-stack for non-thread
 builds for gcc powerpc spe
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The toolchain for powerpc spe can use uClibc-ng without thread support.
So we need the same fix as commit [1].

[1] fff68f75b3519cadb2639fde2296b26db919d79d

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch

diff --git a/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch b/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..8d99e89293
--- /dev/null
+++ b/package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 1ddcb4870533af1b71b6afb75b8f2b271fd88eb4 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.34.3
+
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
