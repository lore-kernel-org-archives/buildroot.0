Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5349CC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 20:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9F59605DB;
	Sun,  9 Jun 2024 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pyqTkrH9oAV; Sun,  9 Jun 2024 20:53:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8FA5605DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8FA5605DC;
	Sun,  9 Jun 2024 20:53:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0A31BF3DC
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 20:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 758BF80EB6
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 20:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AR7y6Q5mn1gR for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 20:53:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 313E680EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313E680EAD
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 313E680EAD
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 20:53:55 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso875925a12.1
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 13:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717966434; x=1718571234;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xevhl2SPQ2Gx68rq3zFOPZFDHUT5PQCozlVOBa5thyU=;
 b=QT4W5WTuygzF15axD75gmfbI3EUY3VxHXiHTlqeSjxGQvREVRA8OCmd9CcDt/06a5U
 6Hse4Vig4ggCNUfUF5+VMspYTflGu5IAtBfMdnLEV32O6s6rrmqsKhuUsEFhdMKALX1O
 b+ngpq5lWXDBZSva3aENmCL7O6NvHLW97Sm3ZtTpZ+htcc1x1OUx0u/ufjvXUWxv0nGB
 Z5YvX7xawvlcHV5/ZgREWlpGhb4e1Vzw3S08zPzk16VhG9012NLEfXtFBYtE2Jn3KOau
 rr/cKcZGHgybNWb2Ljg2S+bkV40hJ1F1aF4+C5RC0LGfItW8C627zXeKZ0VlpGskH6VU
 C+GA==
X-Gm-Message-State: AOJu0YyhwY7JG2EjbK6+5Z2qLPAHlpj6Yr5ff9x6lMHva9GX+PYAxHrn
 c0EEblgbZw0oIezVceApbOxamLN1PvkTUOS847HMxOmPlr/cSw4PIDXH4X2F
X-Google-Smtp-Source: AGHT+IHnLlw0ZgCuGp0aNN9HIgakmquL7rqjrReHPEo9+7IZikARyBFGDInPqnT5KP6yi+q2rkIrNA==
X-Received: by 2002:a50:d59d:0:b0:57c:7dcd:bcec with SMTP id
 4fb4d7f45d1cf-57c7dcdbf06mr1239566a12.11.1717966433924; 
 Sun, 09 Jun 2024 13:53:53 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aadf9e093sm6127517a12.13.2024.06.09.13.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 13:53:53 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jun 2024 22:53:45 +0200
Message-ID: <20240609205345.679518-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717966434; x=1718571234; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xevhl2SPQ2Gx68rq3zFOPZFDHUT5PQCozlVOBa5thyU=;
 b=RFCDsdYSm5lDDNEJDyhsNMgFuVI0BWwdjDofMg5ZKr7Q6+qxKLxK2DMGoRkv1xE82V
 eYq8T6iBGBjRlXrp1LltfGst6GPRy6xoopx+AICb8l1ltpluYvOW4WuhzBwc0sHVRzx7
 O/IZfBGqQYEGuGkpdzYboownnOFCILsJfT3t+muTjoEbhBlXPxSRa9RAPWhrieyjtMi5
 78P+nwU724HmIxo7nGOjPwrjQBvZKzIQWC8LKT6NrupkDoq+sPh8tY4fq3WEmCu1YK2s
 2cg9/5HZ7xDkFdjUV1mOiD5GdQkzpDTT9eQEiAJQ+HmVKgvdvSeMyAqQXADHzCgksdB0
 ioaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RFCDsdYS
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: Bump version to
 20240524
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Petr Vorel <pvorel@suse.cz>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <pvorel@suse.cz>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

Kind regards,
Petr

 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 1562f346b4..03aa586156 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20240129/ltp-full-20240129.tar.xz.sha256
-sha256  c302f6b2ca09cbb7835f549777bdb9233fe31f7086d7ad8e65472a0804e3e025  ltp-full-20240129.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20240524/ltp-full-20240524.tar.xz.sha256
+sha256  2b7c07bb281b7ec49981eeb06c4b66f147b103977254632678d384034f6e9663  ltp-full-20240524.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 0996b77e58..bbeb80c732 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20240129
+LTP_TESTSUITE_VERSION = 20240524
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
