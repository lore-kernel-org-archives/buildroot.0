Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F0CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 07:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05F9A414A1;
	Sat, 20 Sep 2025 07:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnLiGo6mf7PV; Sat, 20 Sep 2025 07:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12C1241494
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12C1241494;
	Sat, 20 Sep 2025 07:47:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93668D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A2FD4148B
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaHTTZ0qbvXA for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 07:47:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E716E41487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E716E41487
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E716E41487
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 07:47:19 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7761a8a1dbcso2639228b3a.1
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 00:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758354437; x=1758959237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mbfsfhV6D43ZrF5RPnJQDV5rgiWlSKRpv/lY2xEAaqw=;
 b=J+ZyDhVi8rVtslNq531OO5YH4Qmjy15NRT59GVM8tsme0WhrJEmT4TvqwHsK1HsPuO
 mRuJ0CAB9l9QCsIJA5p+pbjEUH3TdPDrsGJip4JSc/H/B7OmOcBqDgyOo/51lE1xvqaw
 nqhJq7V8KWAoL3uBkJG9urrxM/yo9IOfOd5irFIOiH1yWkQpTwYy0LvhKvBWskS4RYAr
 L6plH1HSHlRffXiPRw2W5zgpKhCqrO7mTjLa25KyZobf8mvtn4uP4WNy6t/6s26n0HCd
 a/iU32ZAxpk2NQaOg3Mt5Za6LzEO3FU655o7b935GsalpM11MmrxlYQUfE+rSTRYg1BF
 eVGQ==
X-Gm-Message-State: AOJu0YwVWU2qLw9zcg619AkWroJ/ccrqYEe7RAmldmTZbCSCUePesECq
 xCp93y8IaE25H800B1fktWeTxBbRNDPwoQtB9Lo1F1dW67Frc42YDCQBtu6gTSJX
X-Gm-Gg: ASbGnctBjYhweBv72tl7ZG/oNdGFR18R223hwmJOpnSSOEJaWjPbuSY+u2GVgeWsc5m
 9QeQ0b+8fE3fmMrFiMi4OHI/ANCGzAr3ofG3AnrYGWsCtSs0sXXnSwpCq9LfQabbULCdiOBPuLS
 7YLxQoz0F2RvaurljnUSEdJQB21GyMHeCMc6b3rCCd2NiVE6emKoPvxce1g+sWZn0P0K3h1DTWt
 1Ir9q/W0zsvG0JOMVx/W6qC1wuB5t6XR8e81VqjzqWYnynsvq6YHd8Y28oeefhOZcU4rS8Ky19D
 op8yqEk3cGmCD1TUvFESpBsrt8S4n07nXurdLOm1IemN1ePHg8aIg01DL046sqSHNpw4nWBV0Cb
 O+bvwSjBiMrawib9N/Rfj+bLspS5daHCq
X-Google-Smtp-Source: AGHT+IGqAVfugFUJ7DUWy1wxfaZT2Qq0qC+NnwQmdkCjkh9e/nQLEd5TwnMyaCYvwFA9C8sDHjkOgg==
X-Received: by 2002:a05:6a00:3cd3:b0:76b:c9b9:a11b with SMTP id
 d2e1a72fcca58-77e4cc3bd78mr6963960b3a.3.1758354437462; 
 Sat, 20 Sep 2025 00:47:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77f097b60e7sm3074315b3a.1.2025.09.20.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 00:47:16 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id AF0FD4227238; Sat, 20 Sep 2025 14:47:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Date: Sat, 20 Sep 2025 14:47:10 +0700
Message-ID: <20250920074707.584930-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920074707.584930-4-bagasdotme@gmail.com>
References: <20250920074707.584930-4-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250; i=bagasdotme@gmail.com;
 h=from:subject; bh=zOdLEJSQZtCNxab8lwKN73GF/NVRJ0S6NKxG7iHzLJM=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhoxz0b+3Fb8yiZb2m2G/VKE38mzu31n5u2PEDk5c9LqD0
 zPZO0qlo5SFQYyLQVZMkSV6rewuY969l8xiEopg5rAygQxh4OIUgInI8DEy/GvSZ1jv0/m9Zu/G
 VuGI7D/5vklS91h+uk5+McnUn/cdCyPDEZPgDgFun9XLL3loLfZV/Xp2hfap5mdiThuUJqTfkvv
 BCwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758354437; x=1758959237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mbfsfhV6D43ZrF5RPnJQDV5rgiWlSKRpv/lY2xEAaqw=;
 b=MrD+kATlskhKtaa6bh0+iPpYSJOi0jHzYbOYm2yF2yip/K0a6XhTaMDxNr7CAXC8S0
 /HKJZNOmD1MsIBhbunBbFHZcE1jls/0Q0pYz2k99AA9bDlpdpH2r2cBhrQBHcwoqPoIC
 k0H4xmWU9cRss2qzUi5ugRWupkNmTEVXwFB8j//D+qhij2rgZd7RsqgPsvn1YI6aQNGm
 CZaTNsbZaKWUvrW00FwlU3KEl02AsGdvH694kETL4w1c+Htywbs7UJ8FqaLf5deF6mmH
 i2Uw6CPf0LopuE3faYmRl36PUp4jGZNjnPbrSX77CvGu61ZVFtfoWnocLus43VFNU1XK
 7QRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MrD+kATl
Subject: [Buildroot] [PATCH 2/2] package/ncurses: Also build termlib
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

As a side effect of readline fix in previous commit, building host-gdb
fails with undefined reference to ncurses error:

  CXX    init.o
  CXXLD  gdb
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgoto@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `UP@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetent@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetnum@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `PC@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetstr@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tgetflag@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `BC@NCURSES6_TINFO_5.0.19991023'
/usr/bin/ld: /home/bagas/repo/buildroot/output/host/lib/libreadline.so: undefined reference to `tputs@NCURSES6_TINFO_5.0.19991023'
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:2232: gdb] Error 1

Fix above by also building termlib (libtinfo.so.6) so that host-readline
is linked to ncurses from buildroot instead from host distro.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/ncurses/ncurses.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 864f62b57c..a837ac96bf 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -162,7 +162,9 @@ HOST_NCURSES_CONF_OPTS = \
 	--without-ada \
 	--with-default-terminfo-dir=/usr/share/terminfo \
 	--disable-db-install \
-	--without-normal
+	--without-normal \
+	--with-termlib \
+	--disable-widec
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
