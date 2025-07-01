Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE930C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 18:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 938BA60DCD;
	Tue,  1 Jul 2025 18:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0JRqj8tIRjD; Tue,  1 Jul 2025 18:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B24608AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2B24608AD;
	Tue,  1 Jul 2025 18:20:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39B56128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B41F84279
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lemLL6LHa3Ml for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 18:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1063; helo=mail-pj1-x1063.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0104A81469
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0104A81469
Received: from mail-pj1-x1063.google.com (mail-pj1-x1063.google.com
 [IPv6:2607:f8b0:4864:20::1063])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0104A81469
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 18:20:11 +0000 (UTC)
Received: by mail-pj1-x1063.google.com with SMTP id
 98e67ed59e1d1-311e46d38ddso5051998a91.0
 for <buildroot@buildroot.org>; Tue, 01 Jul 2025 11:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751394011; x=1751998811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zCXFiJ+Q8n+hoiGvxUoGeo+FIQPE0BTUlS0QRDnfeso=;
 b=jP1ua1Aby+9XCyU6SNBNSJ9fQv160oebTPj9Ggh98fba9Aw/2rHLmvlXA/JUbo+EK6
 MRbZFfWs2NOtTnQd6GWpiQt2rUaJEOgWMVxlH+QNj6rPjE4zZvk1kWulrbS07dH5gbqt
 oKok7DKpBKfRcSY+vgRBDpMIQaOSH+BM/pUQysnGz104DfVOLVforrFZUSjj/NWekmuE
 KFnxdPdbMhyGOa0S0yHHufkYn0DE/p9SvpaqQLG48tVxL6Ykp+S5wr2o9guNN6/mB0L8
 eCOn5SR+yC6uppJGJIBaT7s7KeBoQI7qrtEW/SR6R/8PjjR8q3bP3MfvXCrFTvZBLQkz
 8oMA==
X-Gm-Message-State: AOJu0YzUXm1Hla6NXRuxef27Y1a8SKMeoyQbcnwF1KvWtGyZiDnXZvDf
 KsoTvhA/ouJ5owUhHqq9vZAvhP1rfadl0Z5u4Da2rfqrhMWoHmKipNroC2S8HxPOJR0AzMCMc6P
 c/geCrAjyoBVJNiYcWOhBWPFU29atQ4XRtvk7dOUEv67mHT0=
X-Gm-Gg: ASbGncuJ7esbk13Y1WUluV+tNMNSuqV8/HWpDK2j1rJr0BXxq2hUako8nAAdGHoyycR
 nSvW+kxvwjbh+fImIa3Lb8BKft3Q9/cFD/PC3CC0zOd6IMwmM3uXhC1k3LYPl0lfviiryP/D6tW
 M7z0OA/zXfC9etGiqV8+/kVbx65wyX8iMgszE+8Ci+xCdEsWtnF7GFWDuteqsfwYnKfouJSj9Zk
 n0IRv9AyOGRU/F2Z9mFTwZjbLLaPfOWESpzgMdsi3CifHw446G18V7NlwESlDsMsFKOSFIMa0Dp
 7W96FB6OT1Q+zSI2PyBEleo+4RpehJxVFInj81AhKqs=
X-Google-Smtp-Source: AGHT+IEov5UEQexGN6nE7A6SdFDxxDbK2zJYHKGdzA/tLXmR6pzdoqDzpmyOP3Qv0bo770BTYWgUxMVA4dir
X-Received: by 2002:a17:90b:3841:b0:311:c93b:3ca2 with SMTP id
 98e67ed59e1d1-31a90afc58fmr57252a91.6.1751394010710; 
 Tue, 01 Jul 2025 11:20:10 -0700 (PDT)
Received: from localhost.localdomain ([184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-318c1366ebcsm377577a91.2.2025.07.01.11.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 11:20:10 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Tue,  1 Jul 2025 14:19:46 -0400
Message-ID: <20250701181946.2106-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751394011; x=1751998811;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zCXFiJ+Q8n+hoiGvxUoGeo+FIQPE0BTUlS0QRDnfeso=;
 b=RHVs7qcTgkskqnO/q3vfCRfuYtNQOvW+z3ZE5bRX7cUDlQGtsNJzqjDEEsWdm9fDCR
 S055+nVQTMZu5/dZ2X4XVwRjNRo+iCvv7Kn1xDXQV449N38gwoK/1sKbbAftr5ZANUOR
 XQHQahzQmSPgKlSSsT8+26Z8+ASd4C7I/+Acw9qe6iop6ayGVxQ8fogS0edq7nH4zJhR
 9g8By5EMdSuJQU1qiIq/nQmhbfsgGIvGcsA7BXgwSUbVscE8eS6hMZS8ztu8HjrIj3hP
 GpryJ7SY//bkrq0bMJc+S47QwrdnKW8PkksLKCa0w0IZEHfuhpCpV03CAN2y/+stflWi
 ttxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RHVs7qcT
Subject: [Buildroot] [PATCH 1/1] package/libpqxx: bump to version 7.10.1
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

Note the `COPYING` file has changed due to copyright year bumps.

See also: https://github.com/jtv/libpqxx/blob/master/NEWS

Signed-off-by: James Knight <git@jdknight.me>
---
$ cat libpqxx.config
BR2_PACKAGE_POSTGRESQL=y
BR2_PACKAGE_LIBPQXX=y

$ ./utils/test-pkg -c libpqxx.config -p libpqxx -a
                             arm-aarch64 [ 1/40]: OK
                   bootlin-aarch64-glibc [ 2/40]: OK
               bootlin-arcle-hs38-uclibc [ 3/40]: OK
                    bootlin-armv5-uclibc [ 4/40]: OK
                     bootlin-armv7-glibc [ 5/40]: OK
                      bootlin-armv7-musl [ 6/40]: OK
                   bootlin-armv7m-uclibc [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: OK
             bootlin-microblazeel-uclibc [10/40]: OK
                   bootlin-mipsel-uclibc [11/40]: OK
                bootlin-mipsel32r6-glibc [12/40]: OK
                 bootlin-openrisc-uclibc [13/40]: OK
           bootlin-powerpc-e500mc-uclibc [14/40]: OK
        bootlin-powerpc64le-power8-glibc [15/40]: OK
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: OK
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: OK
                    bootlin-sparc-uclibc [21/40]: OK
                   bootlin-sparc64-glibc [22/40]: OK
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: OK
                   bootlin-x86-64-uclibc [25/40]: OK
                   bootlin-x86-i686-musl [26/40]: OK
                   bootlin-xtensa-uclibc [27/40]: OK
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: OK
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: OK
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: OK
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                           sourcery-mips [39/40]: SKIPPED
                         sourcery-mips64 [40/40]: SKIPPED
40 builds, 12 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 7e13e7415b..5fb93cbe63 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e37d5774c39f6c802e32d7f418e88b8e530404fb54758516e884fc0ebdee6da4  libpqxx-7.9.2.tar.gz
-sha256  3dd057a614dd24688aafc38d4c41111140e17147cfd94f314a80af30879641b2  COPYING
+sha256  cfbbb1d93a0a3d81319ec71d9a3db80447bb033c4f6cee088554a88862fd77d7  libpqxx-7.10.1.tar.gz
+sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index c69b77260d..4364dd09a9 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.9.2
+LIBPQXX_VERSION = 7.10.1
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
