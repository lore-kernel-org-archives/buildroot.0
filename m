Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F228C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 02:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D10266062F;
	Sun, 24 Mar 2024 02:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQ7RuRA4b7OG; Sun, 24 Mar 2024 02:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C7160650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C7160650;
	Sun, 24 Mar 2024 02:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC521BF3DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 02:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96B4860650
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 02:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuK4VCsVIeU6 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 02:51:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73DB56062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73DB56062F
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73DB56062F
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 02:51:05 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5a485724ddaso2055384eaf.1
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 19:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711248664; x=1711853464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXLLPSjvlnJabLXxgeFTuBCH88XKQnqsITebXcOQ/Yc=;
 b=GLJDNvSSquOFQJPIEXQ193EeFtbCxzCRmK0tLvUbRLhE9DbnWJay0NFCs4G1GYagMN
 /hhxFDIiYW8sGa1jGY0c0cO4PmEqtEUY0uGCaISB+3GJMwtjvoynim55DR+nbzHimeWZ
 FMwj5/3WOPcHcy9apKLyJES/l0HV2L/qViDapsB+/JpJeZOZo+bR4NdWxEu/h8DLwuD5
 d3gwemX8NPUOPCQrCu5qBKq5ko4otKtCHEijf0Krm9SBBOmcbSSWlvPvsbRfOzR+A5g/
 wvI73GFtxWa9YcW43TX2gL2i5v16CUz66bT65k8W9zFCrBTplZ0phgJMrKlf90xTrK/p
 fMzA==
X-Gm-Message-State: AOJu0YwWyE3Tzp4KwFCD0OdCu9mF3cU8oMZHfKYhPh2xexcCFtPLGdrv
 m5Xr5J2E19HRPecOsh69Idaan/Vev33OUnqnvzS2Soc3KYOxPndt5EdkfEDb
X-Google-Smtp-Source: AGHT+IGJW84Im7NBvfPrF8L753AK1KHMamYenZx3BpdkDi8o3udjQFD2LDfkG8EVXRaBV++VmwLbNg==
X-Received: by 2002:a05:6359:3206:b0:17f:72c9:99fe with SMTP id
 rj6-20020a056359320600b0017f72c999femr1843524rwb.9.1711248663431; 
 Sat, 23 Mar 2024 19:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:5be:8083:7ea:b94e])
 by smtp.gmail.com with ESMTPSA id
 fa4-20020a056a002d0400b006e53cc789c3sm1984921pfb.107.2024.03.23.19.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 19:51:03 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 19:50:59 -0700
Message-Id: <20240324025059.1253709-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711248664; x=1711853464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CXLLPSjvlnJabLXxgeFTuBCH88XKQnqsITebXcOQ/Yc=;
 b=PeUtVv2gbF6Q0onOnFgemydgzsX+aGsgF7ZZffBQ4pzwLpKtncrzQR/aKX5tr8tSKp
 ZUemiuMMyXcuk72/HDGpKT01DXthpXRxgAHTx0ruRHYTMNpcK5tVS53w18IGFtxsCMsx
 Oxe9pQ9b2cRuAxIkNKz2kp2oL9SOU19GrcHvuV3Jk6OivQW5rn5x81sVfdK5Ahkt9Zfd
 QvrVQjMO9pN961IC97rqg1BV4utJU9VIWT9MRPYo3mMgp8hs5w0XJknNNg5konaoxVr/
 57ROtkm/sJ7BZzItd0uf+OXggr+z6o5o4M7mBtgOFdEcfAjnBc5qmsv9ObgZ0+/g6plE
 2buA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PeUtVv2g
Subject: [Buildroot] [PATCH 1/1] package/strace: bump to version 6.8
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/strace/strace/releases/tag/v6.8

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---

./utils/test-pkg -k -c strace.config -p strace
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

$ utils/docker-run make check-package
398423 lines processed
0 warnings generated

$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_strace.TestStrace
17:35:09 TestStrace                               Starting
17:35:09 TestStrace                               Building
17:36:36 TestStrace                               Building done
17:36:41 TestStrace                               Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 92.282s

OK

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index a35d2b0be6..68b9cc5f93 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.7/strace-6.7.tar.xz.asc
-sha256  2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7  strace-6.7.tar.xz
+# https://strace.io/files/6.8/strace-6.8.tar.xz.asc
+sha256  ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149  strace-6.8.tar.xz
 sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ddcdfabb29..908aed6653 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.7
+STRACE_VERSION = 6.8
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
