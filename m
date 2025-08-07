Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6B9C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97BDE80F1C;
	Thu,  7 Aug 2025 20:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5P6X61EsUBE; Thu,  7 Aug 2025 20:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FBB80F28
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FBB80F28;
	Thu,  7 Aug 2025 20:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD9431
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825C540200
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxaUWvhF6P7t for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 20:46:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 031CC4005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 031CC4005F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 031CC4005F
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 20:46:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso9094575e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 13:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754599589; x=1755204389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/I/UtBBaI+a1sU+siQl5mFbzb5MNYL9wveeolCcnDvI=;
 b=sf4a4M5vcPueG9F2sHXb1aT7yhyIm2RErFX9COPxay3XsMH0zakO8Nrk9n86r3U82j
 85LlkthjTzIWzr52k4hp52sUYqXrTA+NCatzdGL9XIZnaiDupZg03EFUyFXekT+xyZnc
 mauaIUsgAghzhAbN/Q9eWxj7OnvST72XLCUDrx16pXUiwq8YqfNgtiI6WLkM7zQTiGpc
 4/XO/QQPWbNkkVqreiEA8pF5ppiBlKQJbjRbxR/QYaoi/MgcfVbMtO3hUwAcNVXhP+Ho
 BGdtoRgMX1IpfpQIaQfvfL3G3u3kEnlM2WoEaW1pmmkRxjdhDH6KYAo4jMCoPJt2tQLO
 WvSA==
X-Gm-Message-State: AOJu0YwUKybGWD6vVsVvX4FRf2TumOllrKv8Y0DwC31qfZTLmH7xzcfi
 L8EE/UJh+6PQUpanEuSJwErawco7IsouORj4pGDJuTSrUosp7zOuIL2XSvGREHE8P57IAEX02Xn
 9itsFtiI=
X-Gm-Gg: ASbGncsAlE1S4OaZ68qPFQ/ZAPfldhanhfJIy0q4yc34vFpg1bP93aRyvImIF+MW0bB
 la2ckVP1wjchxB7OhZ6klb3E48toS62vtr1i3XSxgQYVRJKH94IlJOK/TYpa78ohTTKTg/z8gS3
 5rQO+7kNz29rFjjgRZ1fyb0x+ySiJIPg8cJsHMByiob+NK8Mj6EU4Ni2e5+f52WlygkUxxoygtn
 ICItJSTjkVWAm0pPRpdbS2IduGeFrL53OWM4aeS1NzLpZTcb1FWwZ3+batYTdr3nlpD8Gh4tHZp
 tqiMZElulycgi0TbgH5mO7wbtscS4Ru/D87si+NXiKbS+j92MVYwjfDaBNoXwXXF9ZKIVhX44fF
 9ZNC6Y9/f3tFsZg==
X-Google-Smtp-Source: AGHT+IE9yfWdpXx7ld/VOiTC+yAoPeM5bRgF9aT1ZtBz2e3x1MnX+py/z4y6pV7jy/AjWa/d/+hGVw==
X-Received: by 2002:a05:600c:6286:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-459f5687c58mr1018735e9.30.1754599588888; 
 Thu, 07 Aug 2025 13:46:28 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc7e1ddesm185632395e9.27.2025.08.07.13.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 13:46:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Thu,  7 Aug 2025 22:46:27 +0200
Message-ID: <20250807204627.1067907-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754599589; x=1755204389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/I/UtBBaI+a1sU+siQl5mFbzb5MNYL9wveeolCcnDvI=;
 b=SScctN9AnM9lFPsO1GfvRnaQaO6sh/P3+cd7VL9XFOGm6gaQCgkY9UqPpzdNUiBuof
 z471c8Rc7lCPqXup8FA2cEtfUcGp4gF+kzTuv+ZYPZQsUlXQGoDjHcDgDJRQ4LUbp/pY
 O1LkyB8FFSXe0HHP4v6NCfdH/RDDAtL5/nHYPAGNUMHLXMaAUIVNyKbYd5NcCDrX7kUP
 BLeZ8EcDp2Umtzs2m9FxigHIWtRfhTsEDEUSfXQE3ny5iGaK/OqyCXTJ1oEUK4Oyedph
 Mmf+hyN8BdeCcV2hu2GrqRkxpar8NYk9bGHcqoSS44Rnpf7z8pfm1fnTUXgq+/gbSlKt
 g+Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SScctN9A
Subject: [Buildroot] [PATCH] package/tini: fix build w/ musl
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
BR2_PACKAGE_KVMTOOL=y
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
