Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B62BC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7A8F82036;
	Wed, 22 May 2024 07:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvrVQpQ2UksY; Wed, 22 May 2024 07:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 584688211D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 584688211D;
	Wed, 22 May 2024 07:03:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA2A01C5867
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A0840BC1
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_2-J6ar0MMh for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE4F840347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE4F840347
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE4F840347
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:07 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57342829409so1068171a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361386; x=1716966186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGNEwYTft0D3HpQQwO14RkZiYIu0tASwNYFUJ8S7qXs=;
 b=QUyNMem3pPpBIQr0ywtOjF2nnfV7w81ogmTrJ+clGXumHxyqzKLqCc/LefNU4tWxiQ
 6gtr7U3iLHrtECdDps1X63RJwZPKEX2tORWQiMjx5R6OmyrIYKJeg4Ueu1hRqhlPALI+
 YUVtGo2I57yqG9HTO38B4mLDjvkz3At6+7k81Y9E4SEMUwQlzArr/9WfvC+IzgUP6R5A
 3VsC6BwgQ3ae841g1tNN+dxBqdjFH4yEaecKrCRxUrCCCNo/NDlRH3oQ91t6yZ0Q2XA5
 E6Fj7Us/eHYJG0fb3bssWjWSDyJF3TaBCqADg6u8YdnVew3DcRWZ/gh1G/ZYkJMv8dIA
 sC4Q==
X-Gm-Message-State: AOJu0Yw8YPgdfwJaLgh7Q/r35BC34bz8UCGz+02OHUmkepAolx3M7gkg
 mIvAh92ygKzIDq7wBJCBA0FMogkzdyKRHChUfwhEWLZfA9mAZamyylwuObEPHOr+VX+FC5QyRxL
 G9iY=
X-Google-Smtp-Source: AGHT+IHFnPgh1YejXqOk+o5HNsj1ll53efbfpKWBrzB5q3DO6T+rlDT6g7/8VCynb73if1r/UiIpyw==
X-Received: by 2002:a50:8ad0:0:b0:574:c3e4:1fa3 with SMTP id
 4fb4d7f45d1cf-5752b4e5ee6mr8574178a12.20.1716361385526; 
 Wed, 22 May 2024 00:03:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:32 +0200
Message-ID: <20240522070238.3282121-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361386; x=1716966186;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGNEwYTft0D3HpQQwO14RkZiYIu0tASwNYFUJ8S7qXs=;
 b=MNPAWGAtlfq+bH3GuAy+t2ZkiWsocwnN2ApwAbpjhtxp8z81Q/bHSbzBB+gHpQCXu2
 MkEzUTPiUdZof2WCGrVz8er9f7NPrmFj3ObBcuI12LIdjD6tp57ztiZJqpGY4tGeCLp8
 hVNald7Mptik61KIepOsBx7gF5299wUu3ZPx0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MNPAWGAt
Subject: [Buildroot] [PATCH v2 13/18] package/openocd: update the patch to
 be applied with fuzz 0
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
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-configure-enable-build-on-uclinux.patch     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/openocd/0001-configure-enable-build-on-uclinux.patch b/package/openocd/0001-configure-enable-build-on-uclinux.patch
index 2f2d3208405f..d5f1e3295823 100644
--- a/package/openocd/0001-configure-enable-build-on-uclinux.patch
+++ b/package/openocd/0001-configure-enable-build-on-uclinux.patch
@@ -1,19 +1,21 @@
-From 11ea78c4d253bb90296e2dd8c3f7fbf59ba397b6 Mon Sep 17 00:00:00 2001
+From 86dd032d77166b7ed59d08c99fbe47b8b7667406 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Thu, 17 Aug 2017 06:30:31 +0200
 Subject: [PATCH] configure: enable build on uclinux
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c680bda7..1a7980a0 100644
+index eee42d4240f8..b0445f92e0b5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -327,7 +327,7 @@ AC_ARG_ENABLE([sysfsgpio],
-   [build_sysfsgpio=$enableval], [build_sysfsgpio=no])
+@@ -342,7 +342,7 @@ AC_ARG_ENABLE([xlnx_pcie_xvc],
+   [build_xlnx_pcie_xvc=$enableval], [build_xlnx_pcie_xvc=no])
  
  AS_CASE([$host_os],
 -  [linux*], [],
@@ -22,5 +24,5 @@ index c680bda7..1a7980a0 100644
      AS_IF([test "x$build_sysfsgpio" = "xyes"], [
        AC_MSG_ERROR([sysfsgpio is only available on linux])
 -- 
-2.11.0
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
