Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D9C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9EB60DA9;
	Sat,  9 Aug 2025 20:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CeSHTw_QjF9; Sat,  9 Aug 2025 20:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7470E60DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7470E60DA0;
	Sat,  9 Aug 2025 20:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1781D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 730CE80D78
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqWDwDVs3RrR for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 343CC80D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 343CC80D76
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 343CC80D76
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:19:57 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so2694355f8f.2
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 13:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754770795; x=1755375595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igZoSqPipj1xG8bmvCDFBQt9JLvylm96Y1zeOtW6Gf4=;
 b=YxYSGt1eeLFRCAIH8F3hpHxV6EfG2QhftoBUi7P5ExA3tHaSfkaBlfTwNBAsbZ0cJB
 5Gm1yCML8fNjYJDIY2Hd3yNPFi24pWYKJTcr2IQaYyT9XE1J9R+9iSXtlRyMjI01ZLOj
 vVY6OlIWlB1kEaRu5Sj6QUY482zlarLG2KnUDLMttaSL6CZKleszMkw6soAGzumU2YQ+
 q8rMONB7MZ6WRk3XmP0aImdKTA78ePLB/6gwOugiC+EApBruq4louiKmeGK1a1nuzV2Z
 NtCVFAmnBrE3OMZ3n5fQmSED2BlR0ivDLy3T1neDtStn1Y5FC5ZJ5Ckg9il5ASbsQJqE
 XWDA==
X-Gm-Message-State: AOJu0Ywl1mn6oYZrbrHO1WqZffUPkyZ8aiPwJvggLroZMqf/oaUfD/Pe
 0+gWIuU8DaXbNUYHF2CbmdU1LGeNqT9zF145nacf/VzlQDeaOUtYetlHoQhMgw91BUarGJzMOkp
 3FuLX
X-Gm-Gg: ASbGncsR4dObLLoz0xMnnDVvddcfvB0ZnBr44afy+zI2AShvEoENv7BwWBJBW7OGPG8
 7WTbUQ79cSdM87GeMQT3r+8mNAesrFpOBCILkt/M0zOiYBN8omHkPh1XfMDHOUj0WjARzwEAbFB
 mlmHcIgJvT1PzOZ5e9mH/9hQMJs/vIZWQ8v9jtNLf9+xjqcF2x5fTBXTVtvSfHj3+OkDDI2OlNR
 UHa7DZ11xjDmgtzeCVBh8UV5YPr+erwDP3LJVynRJxUo7wOCZ1sre3OrHVykdHK9clHZr+lTnSy
 QYaaadPBQevPTQUiDQjYuVPRcbHgiYogsqymU/6LvlwK8mhNK9sekZ4XVi9vnrJ/fCpuqGi2gvk
 eluFBN8enPE1nFQ==
X-Google-Smtp-Source: AGHT+IHrHjfSuHgwTumnnVB3z27YB+WPh2qSf/TMppLLdLRYK01uzQTbVN89cKFjshrfz7K7CadBqg==
X-Received: by 2002:a05:6000:400b:b0:3b7:61e5:a8a5 with SMTP id
 ffacd0b85a97d-3b900b83578mr6564126f8f.47.1754770795251; 
 Sat, 09 Aug 2025 13:19:55 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0683045sm25805449f8f.41.2025.08.09.13.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 13:19:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Sat,  9 Aug 2025 22:19:54 +0200
Message-ID: <20250809201954.333758-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754770795; x=1755375595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=igZoSqPipj1xG8bmvCDFBQt9JLvylm96Y1zeOtW6Gf4=;
 b=hZxNM0INoNwMx06woix5tQ1T+v+bqI8pCQm1l000i6XYDd9A8uy8lZhs8GA33KGLn0
 aRTREilee+T0kJYhWJhBfrjLlYJ5May1nAVjB25EuTdBNWNO5BZPS6Ki2d9xst8Nm+Dh
 lc/bzTBgm/ToOZvCibccURvwDqi6VJAZsE8u9TeeF/JN75pzepEEK+ouxC1VoJEPMG8q
 YMav8ZNesAl/evdWTj68YPc8wQ75r4qV+dPFVw1bseiVltNtpWbNqw3+50iki3Ru1jqR
 7V6jHSqN3sT5VAn0qTtKx9O00plr/j8eaHjeEh1SexUHfgsnB7Ifw0dTZxUU7rWlHy4G
 ZEig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hZxNM0IN
Subject: [Buildroot] [PATCH v2] package/tini: fix build w/ musl
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

When building tini with musl libc, the following error occurs dur to
missing declaration of 'basename':

```
/home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c: In function 'print_usage':
/home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
      |                                    ^~~~~~~~
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/tini-0.19.0/.stamp_built] Error 1
make: Leaving directory '/home/buildroot/instance-0/buildroot'
```

This error can be reproduced with:

```
cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
BR2_PACKAGE_TINI=y
EOF
make olddefconfig
make tini
```

This patch adds the upstream commit [1], that fixes this issue by
including `libgen.h`.

[1] https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395

Fixes: https://autobuild.buildroot.org/results/f0d/f0d10cd25f3b0e2a4af7266f7417b339ea5d242a
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...upport-posix-basename-from-musl-libc.patch | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/tini/0001-support-posix-basename-from-musl-libc.patch

diff --git a/package/tini/0001-support-posix-basename-from-musl-libc.patch b/package/tini/0001-support-posix-basename-from-musl-libc.patch
new file mode 100644
index 0000000000..17445d5b3b
--- /dev/null
+++ b/package/tini/0001-support-posix-basename-from-musl-libc.patch
@@ -0,0 +1,76 @@
+From 924c4bd6028457188942ecbfdc75e6a343fa9395 Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sun, 14 Apr 2024 15:33:51 +0200
+Subject: [PATCH] Support POSIX basename() from musl libc
+
+Musl libc 1.2.5 removed the definition of the basename() function from
+string.h and only provides it in libgen.h as the POSIX standard
+defines it.
+
+This change fixes compilation with musl libc 1.2.5.
+````
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Werror=format=]
+  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
+      |                        ~^          ~~~~~~~~~~~~~~
+      |                         |          |
+      |                         char *     int
+      |                        %d
+
+````
+
+basename() modifies the input string, copy it first with strdup(), If
+strdup() returns NULL the code will handle it.
+
+Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
+Upstream: https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/tini.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/src/tini.c b/src/tini.c
+index 7914d3a..41d1506 100644
+--- a/src/tini.c
++++ b/src/tini.c
+@@ -14,6 +14,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <stdbool.h>
++#include <libgen.h>
+ 
+ #include "tiniConfig.h"
+ #include "tiniLicense.h"
+@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const sigconf_ptr, char* const argv[], i
+ }
+ 
+ void print_usage(char* const name, FILE* const file) {
+-	fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
++	char *dirc, *bname;
++
++	dirc = strdup(name);
++	bname = basename(dirc);
++
++	fprintf(file, "%s (%s)\n", bname, TINI_VERSION_STRING);
+ 
+ #if TINI_MINIMAL
+-	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", bname);
+ #else
+-	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", basename(name));
++	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", bname);
+ #endif
+-	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", basename(name));
++	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", bname);
+ 
+ 	fprintf(file, "Command line options:\n\n");
+ 
+@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file) {
+ 	fprintf(file, "  %s: Send signals to the child's process group.\n", KILL_PROCESS_GROUP_GROUP_ENV_VAR);
+ 
+ 	fprintf(file, "\n");
++	free(dirc);
+ }
+ 
+ void print_license(FILE* const file) {
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
