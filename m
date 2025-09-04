Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457E4CA1012
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 17:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EDF36069F;
	Thu,  4 Sep 2025 17:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ya3ldNa8o5q9; Thu,  4 Sep 2025 17:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AD9860686
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD9860686;
	Thu,  4 Sep 2025 17:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99E16111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5F940075
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wRG98flfy8U for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 17:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2435D4004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2435D4004D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2435D4004D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:45:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b02c719a117so244415666b.1
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 10:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757007953; x=1757612753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9TGpMMvQZtt0GsZoYmowSDHHMUDDWwmqMZyaBPNxuhU=;
 b=WPFp5HILvbDJ3/grzZWAsKTYFWWewzTGBo6YvWRoth7if2HrBTEEulokUcQwH6VTqN
 ELjid2awH3wyFELhKA2Lzi53fE2Mwjdz9P6ddXFAAjwIvH+GQg9OGba76zI/9479U6WU
 QBymHlZajsv1iAlgf75/Pk03tXU/jiQQe15e/3+5kwrEJm8ALs/JPccDmJNkg8XTEqZl
 Nw4A8qm/j3aFY7CVJxnPYs0ZX1ogN62oPH3I9lHpUBUtygNTNYdjDSaxdoO3wjAOoe1b
 KZ2TCGY5ljiEpR41qrqUfn/FhCisMVAftDITKexEjrB5DYmKC3OhHfrMh6Q/DWmf9/Ap
 6YSw==
X-Gm-Message-State: AOJu0YyQlYcqY5nqOgeoWiQTuCU4RneaN5BedrEuYbdXSoXjdne23rEe
 bMZH8Teb3YQAh4vOPYXowm8xeITcjs0l0wBDqRvAChT8qMa2ugS21cEcjF8cnvmc0Ii+b5MxlrB
 x4IUfiko=
X-Gm-Gg: ASbGnctYAjEDH5MA4nMyNFzrI7+A5QrrhbwmYtNoYnvoQEcOo77XgtQNmzhOA0rIuD0
 Ago7MGTSCUINn9Jd4R/1YyWqVgYnLXJbR6m3DN6/JB7oFpsaB5PjLnn4YyZ25mtjO3sbdiA1/Xf
 KAhfq30jHCqOXSapWpxFKtzALM+OAkM99pVexPwWn5LlMKCb1g+SuKA0LGLFr15lDIbAvPrR3Yk
 CYtOjrK5YssRfMyb/0WEk4t/mqEdEw9JWr98VYWjexP7I2xmDRjVmYY/tYPT8rurMpLm6muRD5C
 cDTFZSuBskAOi/Z3mh9BHQIFoZ3ZwLWWkdyQgrvUMiyKj7KtwffuyjXOZE2LGSyrCx1qbJNqDwg
 Eyza3vBBiUGwnwlpKtj9+jum+byhj3lzSSIRtqrdPH08CKC0=
X-Google-Smtp-Source: AGHT+IGFdXvbtrmSBmxHJNLN4pDaiABUMy9VqLrl9C7Ezj+X1ZBg11V0ae10G5S9X9Q7hQJkKnS6ew==
X-Received: by 2002:a17:906:f0cd:b0:b04:1cb0:bac3 with SMTP id
 a640c23a62f3a-b041cb0c00bmr1413574866b.37.1757007953566; 
 Thu, 04 Sep 2025 10:45:53 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm1086291966b.21.2025.09.04.10.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 10:45:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu,  4 Sep 2025 19:45:39 +0200
Message-Id: <20250904174539.596715-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757007953; x=1757612753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9TGpMMvQZtt0GsZoYmowSDHHMUDDWwmqMZyaBPNxuhU=;
 b=N/FBB52Cfbpk1ZCDa1vgFSaOg6Bz6zLH65CibrUzfx681FLcIE9QAoQGzugW8qSIUL
 yrxkybxyD2Jm/ed/33Dxs6049hdf6dE/HcxRjKl5pfHN17PGkKvZnWQXP1/j6J+4TjzQ
 D4QfplNfEpqQbY9ccEZHIRQlc2SYOtnkeRAODK9gHY2d1Nz8vJlBfkIKAio2DO7QnKFn
 NqxdIy/MRPc4SnFPkG/6VeyYGIGf0SllsbhNcvuz+UVgrzK+2LJHtMk7hbe0EwVTKoeR
 hZR4vQKsm2wUg09PeOuXdMj6fBSxjibYQO0wRxlZCbjbYCQe2/t+JUfbRsr5L6c+ttYy
 ctdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=N/FBB52C
Subject: [Buildroot] [2025.02.x, PATCH 1/1] package/ipset: fix build w/ musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building ipset with musl libc the following error appeared on the
autobuilder in 2025.02.x:

```
ipset.c: In function 'main':
ipset.c:35:21: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
   35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
      |                     ^~~~~~~~
ipset.c:35:21: error: passing argument 1 of 'strcmp' makes pointer from integer without a cast [-Wint-conversion]
   35 |         if (!strcmp(basename(argv[0]), "ipset-translate")) {
      |                     ^~~~~~~~~~~~~~~~~
      |                     |
      |                     int
In file included from ipset.c:13:
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_IPSET=y
EOF
make olddefconfig
make ipset
```

This patch adds the upstream commit [1], that fixes this issue by
including explicitely `libgen.h`. This patch is part of the master
branch since commit [2].

[1] https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
[2] 8fdbbefa08 package/ipset: bump to version 7.23

Fixes: https://autobuild.buildroot.org/results/930/930802ecc324c4cfc697191aa6a68642a4188e7b
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...cit-declaration-of-function-basename.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch

diff --git a/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
new file mode 100644
index 0000000000..c01fdaf671
--- /dev/null
+++ b/package/ipset/0001-ipset-fix-implicit-declaration-of-function-basename.patch
@@ -0,0 +1,31 @@
+From 316f592ddc547c28388da4e7cb7c5c8f89cd3591 Mon Sep 17 00:00:00 2001
+From: Mike Pagano <mpagano@gentoo.org>
+Date: Fri, 30 Aug 2024 11:31:19 -0400
+Subject: ipset: Fix implicit declaration of function basename
+
+basename(3) is defined in libgen.h in MUSL.
+Include libgen.h where basename(3) is used.
+
+Signed-off-by: Mike Pagano <mpagano@gentoo.org>
+Acked-by: Phil Sutter <phil@nwl.cc>
+Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>
+Upstream: https://git.netfilter.org/ipset/commit/?id=316f592ddc547c28388da4e7cb7c5c8f89cd3591
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/ipset.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipset.c b/src/ipset.c
+index 162f477..d7733bf 100644
+--- a/src/ipset.c
++++ b/src/ipset.c
+@@ -15,6 +15,7 @@
+ #include <config.h>
+ #include <libipset/ipset.h>		/* ipset library */
+ #include <libipset/xlate.h>		/* translate to nftables */
++#include <libgen.h>
+ 
+ int
+ main(int argc, char *argv[])
+-- 
+cgit v1.2.3
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
