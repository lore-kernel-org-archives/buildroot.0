Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF79C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 12:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD56241910;
	Fri, 12 Aug 2022 12:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD56241910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MddU2-hKAJcO; Fri, 12 Aug 2022 12:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774364190E;
	Fri, 12 Aug 2022 12:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774364190E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 648F91BF280
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 12:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 397D260773
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 12:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 397D260773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R36jViORnePb for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 12:50:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 444AE60757
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 444AE60757
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 12:50:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u1so1225986lfq.4
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 05:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RPgKV672QYnPphMH9NABJLzQCidmembJ0cXwnyisd60=;
 b=N0aXoFN+eSZKErFMJPKf06o0Rp+lqj06S2y5TAmXsjquSzfoLmCLikBxkxBgrJwbuR
 t/WGtg2oG3FAUZjrLdQp82ojy4z8QRlwwGVJiQNiZQ9DlBq25wXvrEWSwmDUadD3EcCh
 k7kCOEEeu1o0M1fPSO1E2Qfqs3cezGVUQQoy/nU4Tvlf1NF8e1GYHqmlRS3GgBphTiEJ
 sPqIf+k+n+EUfVBYdKIyheQepENqHqAzPoK5C2QnJLwP8C+e2R1sEs2dKlLWS5Y5bYR8
 1kBWym5zPqfRxsfvDIMSNS+kqd3NZBDbBGKzsCHfdXSk+CX2QWnbqV0BtcMFcdkLWedD
 87Mw==
X-Gm-Message-State: ACgBeo22yLF5lg5mlzsgp1DR+gquj+vLBhyssqaMcxzaJN4L/npYf7BZ
 R9qUeYyPDvjXIvWdABd2erHcnrzRlxY=
X-Google-Smtp-Source: AA6agR4yXG2mU8curNq9vuFDT0MwfFmjfxKG4vXX0oeMr1RtMUCGLqVOtdxic9kYVzWgHfGJEaGEJw==
X-Received: by 2002:a05:6512:3b28:b0:48b:2071:e423 with SMTP id
 f40-20020a0565123b2800b0048b2071e423mr1332742lfv.434.1660308599541; 
 Fri, 12 Aug 2022 05:49:59 -0700 (PDT)
Received: from gimli.addiva.ad (a124.broadband3.quicknet.se. [46.17.184.124])
 by smtp.gmail.com with ESMTPSA id
 e28-20020ac2547c000000b0048a1a70d14dsm208274lfn.94.2022.08.12.05.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 05:49:58 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 14:49:52 +0200
Message-Id: <20220812124952.182664-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc;
 bh=RPgKV672QYnPphMH9NABJLzQCidmembJ0cXwnyisd60=;
 b=OEwnCSBOmYc3anwOzC5lyoxjfEqu5sFzKRHqFZNidSmn2ZCEV+iLB8LfV5CfzdJClF
 8UjlPmPa+d6duC5XIO4i25/cf056HZRh9z8fsSgXM7CiNBgVvPkvW3WgMM7RM05gUOOj
 wmRKqbx3BgEUf8Bs0rybU8P1Z0H4Q7hHqyqqO/lu33kdMga5TTdU9eALaN9yESsSJ5N7
 Iy2FSmPNWEwTj/sZcK1eRZIPPbi+BcUEaq2XzcBEvHbPEMo8YA4pkjui/MBPuYnuR6Wm
 1L4VPURxMpXbTG0N20Pbjstdz36r4zX22gjo6t/ruNCga7/78/kIAoG7U4MGgCsBmnT8
 j6Fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OEwnCSBO
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.4.3
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

Fixes garbled tag name in std log file output (critical), and addresses a
minor issue with confusing project name from `syslogd -v` vs `logger -v`.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index bac35ebcc1..6ddfcf16cb 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  64acdb6ade609a1f42eeb7fbdb25c539b1c16abf2f6ff722606773b84a3c4073  sysklogd-2.4.2.tar.gz
+sha256  58cbf7e82b3ee0f0ac2433192737dbb317656ff6eed0317490821b2a4532aa34  sysklogd-2.4.3.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index b25937df31..393482305d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.2
+SYSKLOGD_VERSION = 2.4.3
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
