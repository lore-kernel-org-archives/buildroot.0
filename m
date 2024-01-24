Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7274AC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 10:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C3961446;
	Wed, 24 Jan 2024 10:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C3961446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5zE1Q4E9Efz; Wed, 24 Jan 2024 10:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7C26158B;
	Wed, 24 Jan 2024 10:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B7C26158B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11A941BF391
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9EA783F28
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EA783F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id opg7kc-KnlhJ for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36ACF83EBC
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 10:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36ACF83EBC
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so62947965e9.0
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 02:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706092508; x=1706697308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFl7OM2QAsUgYKKf9QALrOBUnOdwkhdNefazXukeXnA=;
 b=FG5GE7YLnFi1wqzYicKqAEMVnq1CNDjTMJUUQ4A98WLxHui1BDHo8Ns/SA+57FF4SK
 Otw6/ZZE4hYiPrgUKuenjYt3aHxLn8wOxBPYJn9gmLKI8bJXCd1tRk9vqxKEN5aGYFxB
 6sur7GHkRxb+mdqDdExGsIcNWMwSjD3KthTMRd9o70zMTAajQl/YaljeLlfi5LBZOnJL
 gL12LNMmtFDk5KeVcEURgaLGbfVCBjF82Gfx75E2ZOMj0JDqdLeDczJCrQtvJks0mCU/
 PSnxfDqFOMIBkzoz8X/Az8CjWEzzWmTJYIhPhwr183Ol0CZ2v41kHxrzKemtrKPIE7Cd
 ue1A==
X-Gm-Message-State: AOJu0YwouBYcPn9a0LZb0tCpZvSpmdrEYDJnqn06h5wVLHK3fpcR07BQ
 x7AgunYf9SigE95Hx9oAbceOQd1/wpxyqH6zugevpCc246gen77EM4Q0PV6D
X-Google-Smtp-Source: AGHT+IFt8T2FB9TmrLHrQzALlUcm4ik3CnXqIZ7mMOjYGHRi9rtB3js87G8knXSAgE4jIEfUeh8Vtg==
X-Received: by 2002:a05:600c:204b:b0:40e:62a0:6a6 with SMTP id
 p11-20020a05600c204b00b0040e62a006a6mr648740wmg.210.1706092508283; 
 Wed, 24 Jan 2024 02:35:08 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm49195392wmq.32.2024.01.24.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 02:35:08 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 11:34:48 +0100
Message-Id: <20240124103453.623733-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240124103453.623733-1-francois.perrad@gadz.org>
References: <20240124103453.623733-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706092508; x=1706697308; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFl7OM2QAsUgYKKf9QALrOBUnOdwkhdNefazXukeXnA=;
 b=E4ShwZBok+IaH8+K6n+gXWH5y6qnJWCjmho+uGkA7JoDqhWODmD99AfQF2LqE7ZxWO
 JbYKIipDVEKhe1n1uQv7PRRPsalE/sz0QLRzWqzNTMkE2F8AnbR8TjqI7DfvI04Cd/tC
 LtXi5Sc2xwJOIHhtEfP5R4sMNU+erHMTtUODr8hRom71MWvW7bRoFKuUPwRmDBREJUTB
 SCFpXCp+Qef4bXcRKbpuC71yN2QeO12Fxz6Lth293rXk9XE2FhMljMDJPX0tZNTJ5Nrg
 zGk5ChWQVrItiSGzueEU2NC7PQ+cIoJszEkv5ceK7cVph/zjURFBMPPmFLJHV0tOBbWO
 eM5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E4ShwZBo
Subject: [Buildroot] [PATCH 05/10] package/perl-math-int64: bump to version
 0.57
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-math-int64/perl-math-int64.hash | 6 +++---
 package/perl-math-int64/perl-math-int64.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-math-int64/perl-math-int64.hash b/package/perl-math-int64/perl-math-int64.hash
index 4f2374b10..7730b722a 100644
--- a/package/perl-math-int64/perl-math-int64.hash
+++ b/package/perl-math-int64/perl-math-int64.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  1ad0ce8b5e903dfe9f7ffbabd8a43014  Math-Int64-0.54.tar.gz
-sha256  dcfc51e698437ea6b9cefe0276215c56cdb6a7f85e3e24a2b6b4189f1960d351  Math-Int64-0.54.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  ed431cca1c403b1078fb1b3e2860d8de  Math-Int64-0.57.tar.gz
+sha256  12c60111c1cfceb257ac2ccc5b2e1721879efa09a1b0a73e8836afca107a7d75  Math-Int64-0.57.tar.gz
 
 # computed by scancpan
 sha256  59feedfdc4f99a746c54e06ac46c4627fb1e29be3bc71756184f92333600f72b  COPYING
diff --git a/package/perl-math-int64/perl-math-int64.mk b/package/perl-math-int64/perl-math-int64.mk
index 749ff60c9..c0abcf48a 100644
--- a/package/perl-math-int64/perl-math-int64.mk
+++ b/package/perl-math-int64/perl-math-int64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MATH_INT64_VERSION = 0.54
+PERL_MATH_INT64_VERSION = 0.57
 PERL_MATH_INT64_SOURCE = Math-Int64-$(PERL_MATH_INT64_VERSION).tar.gz
 PERL_MATH_INT64_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_MATH_INT64_LICENSE = Artistic or GPL-1.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
