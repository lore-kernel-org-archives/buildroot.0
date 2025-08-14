Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70985CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477AE6084B;
	Thu, 14 Aug 2025 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9cIhah9C2om; Thu, 14 Aug 2025 20:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E334F60831
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E334F60831;
	Thu, 14 Aug 2025 20:32:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4C53228
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBAC840494
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIwQixxGQfW0 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE39240491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE39240491
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE39240491
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:32:19 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7aea37cso178928366b.3
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203538; x=1755808338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KrKDM43l3IaOFS055zEvBKVQZ2MPtPnvNFSN/FBKIQ=;
 b=gGA0XsQzPvG8jTFI94pQZTeWLzXFQXd1g3CH8mP+nf6OxGidaUrz74ZR62sxCYBaVL
 kszUkiESEEq8FfuKcmd89nvy/VAjh9Brl58CE9qZIxetPM9OzsF0T+ErEM9ezAi8HChj
 LqCic4c7pMZ2Vv/LlXIje05gPYRU49d1KdnQgOkPO1pn3Dptqdpq+EWnYtZr3Q18d8Dc
 SQrvW+1cDCehD7zAb06q2uPaxFGfEcn+og3z59xm7wQOz2nJpULE4wusXOPlWBnrgN2g
 7D3LsVQ5MaLArytMfKFPw0vbpeiOJvbVbZLlWNlrC2l+2P6QUSgIg8LE++fvisff0E60
 tE4w==
X-Gm-Message-State: AOJu0YyH5xh+wf5zq5H6ffBQA3xV9f8sXGkp6WL1tWr8T/GDxEheGm5n
 YtCVmRnmO0kLZL/U1hZUrTC2ryEc/DCa/O/9FToOjATM5e3UDDBaU3NbpaEkDJ1/JMAKrqPPbcJ
 YJCoEy+E=
X-Gm-Gg: ASbGncsQZoXtQ6IDRyrQ/hd37KnrM5yFi+IKQfBqPMrpvp/EG0MooN8eqOTQbvzB+XA
 uePsGzB7z9qJA4Z4WSZrs0SwtKyMe4HLu5OYoeAiEB3x4WrhwJzJXbppQaMXDnetTt7ZsXhRPcb
 tjQxpVJXrK1nKuXbd94S6umaz9x3Gd5EwdzGmHXbJ5lVdl7jufzdcDHg2YGclRL/yKNHkATqapr
 /OeAmjWTtDqzLIjQ1BbFR3aI4uABeZZTLY1bAkYjtpLA8nSxUP1vDNw+Jmok5rNmaWKTV6O1Zr6
 xJnCYD2pD88xQTqAAZNaWskIa2UPfeLqQPxYXXdSj+zS4mwccLfsD5XC47c8XDVnV8B6XKIOLIJ
 boSd2DriNx/vCHg==
X-Google-Smtp-Source: AGHT+IHH0WVcS++vj5dcGMcBrA6Mv5zwZJk4GR88LnEIKYtDTW10mdljFZd4wSc+R0aPC40fW8qQfA==
X-Received: by 2002:a17:907:1c26:b0:ae3:595f:91a0 with SMTP id
 a640c23a62f3a-afcb985ced0mr466397466b.16.1755203537680; 
 Thu, 14 Aug 2025 13:32:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a38aasm2657209666b.37.2025.08.14.13.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:32:17 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:32:16 +0200
Message-ID: <20250814203216.2816966-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250809201954.333758-1-thomas.perale@mind.be>
References: <20250809201954.333758-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203538; x=1755808338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KrKDM43l3IaOFS055zEvBKVQZ2MPtPnvNFSN/FBKIQ=;
 b=CZ2ZI1SoSi8Afal7MM9eUT8ePPl4r0AShOz4AHKT+fRLw26j8XA8xKKcOTiIdIHU+B
 eRq6x07zN71r7aN8SFvT8obRoxdjG8ZVkNC8GG8iRj8egXvlkAW5NB3FGAuiTK4z2lwe
 kDqMDBW4ysPPC5yJL1Zbm4HrM2SNY0wvKzdxQfFRaxcsZ335HdFV5MmnRy4VisKy0QuA
 +MdqK5I0Ee9usyJ3fm5Xu1hREN0OHIXfx/0hkpEpL255XqLbwEi3GkzbsV8lsCu/8gQS
 tShfT0RUTN1MnQPCSnMugiXVjFIaXilofkja57p8ObLzhjjop7czUt0OwuqGU1+Ovbcq
 5PwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CZ2ZI1So
Subject: Re: [Buildroot] [PATCH v2] package/tini: fix build w/ musl
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

In reply of:
> When building tini with musl libc, the following error occurs dur to
> missing declaration of 'basename':
> 
> ```
> /home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c: In function 'print_usage':
> /home/buildroot/instance-0/output-1/build/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
>   227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
>       |                                    ^~~~~~~~
> make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/tini-0.19.0/.stamp_built] Error 1
> make: Leaving directory '/home/buildroot/instance-0/buildroot'
> ```
> 
> This error can be reproduced with:
> 
> ```
> cat >.config <<EOF
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
> BR2_PACKAGE_TINI=y
> EOF
> make olddefconfig
> make tini
> ```
> 
> This patch adds the upstream commit [1], that fixes this issue by
> including `libgen.h`.
> 
> [1] https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395
> 
> Fixes: https://autobuild.buildroot.org/results/f0d/f0d10cd25f3b0e2a4af7266f7417b339ea5d242a
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...upport-posix-basename-from-musl-libc.patch | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 package/tini/0001-support-posix-basename-from-musl-libc.patch
> 
> diff --git a/package/tini/0001-support-posix-basename-from-musl-libc.patch b/package/tini/0001-support-posix-basename-from-musl-libc.patch
> new file mode 100644
> index 0000000000..17445d5b3b
> --- /dev/null
> +++ b/package/tini/0001-support-posix-basename-from-musl-libc.patch
> @@ -0,0 +1,76 @@
> +From 924c4bd6028457188942ecbfdc75e6a343fa9395 Mon Sep 17 00:00:00 2001
> +From: Hauke Mehrtens <hauke@hauke-m.de>
> +Date: Sun, 14 Apr 2024 15:33:51 +0200
> +Subject: [PATCH] Support POSIX basename() from musl libc
> +
> +Musl libc 1.2.5 removed the definition of the basename() function from
> +string.h and only provides it in libgen.h as the POSIX standard
> +defines it.
> +
> +This change fixes compilation with musl libc 1.2.5.
> +````
> +build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
> +  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
> +build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Werror=format=]
> +  227 |         fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
> +      |                        ~^          ~~~~~~~~~~~~~~
> +      |                         |          |
> +      |                         char *     int
> +      |                        %d
> +
> +````
> +
> +basename() modifies the input string, copy it first with strdup(), If
> +strdup() returns NULL the code will handle it.
> +
> +Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> +Upstream: https://github.com/krallin/tini/commit/924c4bd6028457188942ecbfdc75e6a343fa9395
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/tini.c | 15 +++++++++++----
> + 1 file changed, 11 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/tini.c b/src/tini.c
> +index 7914d3a..41d1506 100644
> +--- a/src/tini.c
> ++++ b/src/tini.c
> +@@ -14,6 +14,7 @@
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <stdbool.h>
> ++#include <libgen.h>
> + 
> + #include "tiniConfig.h"
> + #include "tiniLicense.h"
> +@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const sigconf_ptr, char* const argv[], i
> + }
> + 
> + void print_usage(char* const name, FILE* const file) {
> +-	fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
> ++	char *dirc, *bname;
> ++
> ++	dirc = strdup(name);
> ++	bname = basename(dirc);
> ++
> ++	fprintf(file, "%s (%s)\n", bname, TINI_VERSION_STRING);
> + 
> + #if TINI_MINIMAL
> +-	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", basename(name));
> ++	fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", bname);
> + #else
> +-	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", basename(name));
> ++	fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] | --version\n\n", bname);
> + #endif
> +-	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", basename(name));
> ++	fprintf(file, "Execute a program under the supervision of a valid init process (%s)\n\n", bname);
> + 
> + 	fprintf(file, "Command line options:\n\n");
> + 
> +@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file) {
> + 	fprintf(file, "  %s: Send signals to the child's process group.\n", KILL_PROCESS_GROUP_GROUP_ENV_VAR);
> + 
> + 	fprintf(file, "\n");
> ++	free(dirc);
> + }
> + 
> + void print_license(FILE* const file) {
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
