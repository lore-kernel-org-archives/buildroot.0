Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DCCECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 16:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321C260D7F;
	Sat, 27 Aug 2022 16:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321C260D7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPHbmCbzTW5S; Sat, 27 Aug 2022 16:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD7D60D76;
	Sat, 27 Aug 2022 16:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AD7D60D76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 975C11BF314
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 16:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73002404BA
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 16:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73002404BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcgxdrmSU03n for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 16:14:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69270401B7
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69270401B7
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 16:14:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e13so4254385wrm.1
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 09:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=L0oK/iMge38zbZ2XGLJRImbOcra4L7I8PgDSRmujYjI=;
 b=NUWlmjn2lpweX6TjrDNDKQh2STbbzHVDh9zWUXic0JtRwajwz+TiWc9iRtFMdKbs8y
 4QkPPbfbGqo1iACTCAkn4QiQwXYK4iWf5kP8hKSasMuRIJALYT54ueWiS8Umes48YGRN
 /RQVI0IUOWtENm8R1EB+mUDvpXC59VOaOzELvJP9hX3EIV0ttHxLLMGZR5ktovm2BHLa
 D4zLriN/TCFr0rgD209hswQf+MoZaJB9XwLIUsuXcjAqaJgVYYPgKUF5nzNT6kT5D7hH
 1dw77r4nBnWlxla1ouzfki6WgpqlQRCYH39goWt2I21UpuKT8WEa4bY9Y4tcxgcyd5TQ
 C2lw==
X-Gm-Message-State: ACgBeo1xRu1QC2E6WSYDUDiFTEZvywbfxrbjYC9UzZUlReHRhXvZZLf5
 173uIevW6Ntu9+XqJNdyBKbUXcc6JWI=
X-Google-Smtp-Source: AA6agR6G0CIs1FEXzjxn1I3sPax6Pw5xPUBNI0s9PZAtMaqBAn0x2sUVWmsbF+Woe4w2GifIpbdp4Q==
X-Received: by 2002:a5d:6f08:0:b0:225:3bc2:ac94 with SMTP id
 ay8-20020a5d6f08000000b002253bc2ac94mr2303674wrb.203.1661616882457; 
 Sat, 27 Aug 2022 09:14:42 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a5d6391000000b0022511d35d5bsm2696016wru.12.2022.08.27.09.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 09:14:41 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 18:14:30 +0200
Message-Id: <20220827161431.333659-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=L0oK/iMge38zbZ2XGLJRImbOcra4L7I8PgDSRmujYjI=;
 b=OhFnXVw14XmI3cO2ik4h5UHvGHCCeodLpf33VnEoCtSggmbnd5oR6tX/seWXcFOA0w
 7bacspp2jcop3p9ue+wj3yf63tqE2qBhVQKTibS9dXvQQ7g+21U7R97wtGI0kj5vrSBY
 Oj2x7pGfPHmwPonXOERCoGpRc9R9PlGGNF5ER2LW8aIaetZWr+aXEt5U7uxXHsCe6s4B
 Lu+2M7Q4xPxdHoD41mbQTfHBwmhknwscIUZQt7AEyu6z9z2nMseTOFlhWHOOk05Xm8La
 qgRNYl5tHGqS8zqhnAOSx1KJ4Xvz/ljQxVIfcP3GQi9P5KpeQGH/Q5wUhepWngm4BIN/
 nSrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OhFnXVw1
Subject: [Buildroot] [for-master 1/2] package/glibc: glibc on or1k needs a
 toolchain w/ headers >= 5.4
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] enabled glibc on or1k since it's now supported but it
requires a toolchain with linux-headers >= 5.4.

From [2]:
"Here we define the minumum linux kernel version at 5.4.0, as that is the
long term support version where 32-bit architectures start to support
64-bit time API's.  The OpenRISC kernel had some bugs up until version 5.8
which caused issues with glibc fork/clone, they have been backported to
5.4 but not previous versions."

Fixes:

  checking installed Linux kernel header files... 3.2.0 or later
  checking for kernel header at least 5.4.0... too old!
  configure: error: *** The available kernel headers are older than the requested

https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/2875256686

[1] 68d0aede597d32816c5b2ff32de0ce33cc14eb93
[2] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0c3c62ca7d9ff3bdacdd13e636bc858101e3e288

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/glibc/Config.in                 | 1 +
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 23cbfcd9aa..ba9f691d80 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_or1k
 
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 836af3b22a..154cf69ef1 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -67,6 +67,10 @@ comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
 	depends on BR2_arc
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
+comment "glibc on or1k needs a toolchain w/ headers >= 5.4"
+	depends on BR2_or1k
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_PACKAGE_MUSL_SUPPORTS
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
