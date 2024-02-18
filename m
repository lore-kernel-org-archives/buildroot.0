Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD75BC4829E
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 06:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C3E40217;
	Sun, 18 Feb 2024 06:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0pjamr_OCqt; Sun, 18 Feb 2024 06:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7FA34031E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7FA34031E;
	Sun, 18 Feb 2024 06:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2FDE1BF23C
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED33D60905
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 06:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RN4kJIGb8RUj for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 06:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D89D360903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D89D360903
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D89D360903
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 06:16:57 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e0507eb60cso2251370b3a.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 22:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708237016; x=1708841816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hawQz8BKBdEAFOO6rNlP9a/J9Fy2crnYvqzosq/xxLA=;
 b=ATGm0llXwTtGlfpamW0af8WlKisFi/isH2kCgQzXHaPxePPsIRhw/WBf1EsMgZ3c5x
 m5vYyO8s9H/CMa2knm3ntLta6qgA4+InFt2XNDAnJpHyeU6IMjF89fWTLlD/g5Heu7GS
 YSbGfIBK5T1SB24zGwZCPm89WZMFjiJ3Ukz5JB4JaSrq1xTopRwzfNtrnRWc8p/z3yLK
 L3rqcwq/4Pd4vPARA60vbkiHY+5AYHe+zgIrXxax8DgbduMbK1axjE631RshYV4nvLTU
 3I0aTCeBZtdegb5YkJHBQpV2oVwDP4EySLOScTD2KRaE/C/YshlrMZKp0yHG6f+kVDQb
 YKMA==
X-Gm-Message-State: AOJu0Yyg58++a+6jlxDCTxInUUWRbTE3u+0TM8qrwZmnspCtw4pzve3x
 hRKE8KXOo02GJTSxgiuN5CVDnEaFKHsw8rR7fiQgp1O58bDfUK/SV92vQnZfODk=
X-Google-Smtp-Source: AGHT+IHstSmc3nzt7OybsPzB17BI81b1R+LBLujQGjqI/sGVrlzOejFyomuUlkb8EcBK3sFrQ6jhpg==
X-Received: by 2002:a05:6a00:27ac:b0:6e0:520f:bb7c with SMTP id
 bd44-20020a056a0027ac00b006e0520fbb7cmr11682384pfb.23.1708237016270; 
 Sat, 17 Feb 2024 22:16:56 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 13-20020a056a00072d00b006e45b910a98sm346358pfm.6.2024.02.17.22.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 22:16:55 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 22:16:52 -0800
Message-Id: <20240218061652.1048008-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708237016; x=1708841816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hawQz8BKBdEAFOO6rNlP9a/J9Fy2crnYvqzosq/xxLA=;
 b=Bd2Fn0Bhdr6Grrw5JDYejm4gUrq6sudlOGTrDkS0E4Cjg3MLXTu217+W77XJORX2Is
 6HxWHx3B3/tea9++5YJTzcckTSu9PR4nx7GLa+yrEKdmVnK3nUxURq3hmdbgXnQ0z37S
 go/a+fkOcM2wesnELcNObxaBMIVfCrmbCpa6AJY8DgGLVHgtW8mWhqhHxbdX+cuqxcyr
 dWwXK+bq0VaMCD45Sx8SZws7lLWjvURwsU4ALQdJj08dJm9jBIupMCq3ttYfJK92q3se
 B0y1ghGZXj4qSLVg4IIafbgKPXRm8eBAWZISGNG5evLE8IsPGGOJjPWpN5UwUUjjt8/K
 MPEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bd2Fn0Bh
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump version to 7.5.2
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Bernd Kuhls <bernd@kuhls.net>, Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

$ ./utils/test-pkg -d br_test -k -c  dos2unix.config -p dos2unix
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index 032c8ea2d2..d4d682cd0c 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.0.tar.gz.asc
-sha256  7a3b01d01e214d62c2b3e04c3a92e0ddc728a385566e4c0356efa66fd6eb95af  dos2unix-7.5.0.tar.gz
-sha256  6009a35c7aaee9888fd4844972c37b84bce22e7407893727c70f4f3560ae3eac  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
+sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
+sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 6d1e70cf26..e30fc999d4 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.0
+DOS2UNIX_VERSION = 7.5.2
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
