Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C7DCAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 502BC81027;
	Fri, 19 Sep 2025 12:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIaD1snK_9rR; Fri, 19 Sep 2025 12:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C818104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C818104C;
	Fri, 19 Sep 2025 12:56:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B309E1290
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9913561046
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRJJPJZWecMf for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 660206107C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 660206107C
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 660206107C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso1840535f8f.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286579; x=1758891379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1tvK0vjkD7oIaW7oMTOW3uGhQfC7+yiOkIbdHJ56OQ=;
 b=Gg9jTrmNL/1+ySNR/Co7PzdedbptOAv+p/O/cVNpbbrsu3bWbCAvtVhaPCocXkg7Qg
 8AThkudyNYcO6K3mf0+3E+ti1rEChOAKR/KdtFySs6OlGdS2P+1ZXw4jLKPpNP8m4JVn
 9nwYMLQlYqMKq1HuuirP2gFNC8RLkmFtmQz2MDafTTSRCfZKZSMuJ6GLH0QnuSX9NMaU
 8Z2xoxJKtOi3e/yjQ5jDfoixIPwzTm4jJof6sBzZdT02thRINnaW4dL0vX6QTdisFz+e
 qjAHuZDhjInO97vaYlJHcNQe3Y/lCGMXyQMRjRd1l5dpNOlTYESXaFqFAGwl+f/Udv8W
 mHJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5sjKYSQQjtVDP4XdhMhTuHsVcWAx/lwIMCdA5krzBOB0ErOgy/5HLxOpkah+DNLqo1jilqNihgEg=@buildroot.org
X-Gm-Message-State: AOJu0Yy72LZFVTijBrpjwPtxw3nCRoTYdz5qTZ9CNdd3TG0tQIUwY+nP
 ys2KEjflb0HnAaPmnK6YtqnpYMk4bjkJjIEWGh+FeAUbq1fMQveBjIc7RW7eM3KJ3d6W1M/W6Oa
 GYnNLszQ=
X-Gm-Gg: ASbGncvplPzAYRp7mPd4Rqo1VoJG2qQ/fpHsW/58zN715E0HXc5QG0kD8zfdoAaAOjd
 hNgimubQW/fxgIzQVnQ8wzYfhGTbsZdvrKfYtZbGId3QHJ3doB0I2C9VWQLWJgFdIgOEZmCUlUa
 KkQfDSOWwKrp4ruWQbHCQp5EUdseDET8T9jhtqu67JYo6KgMCwX8JpZmhaujS/g+6+/zwxQihOJ
 rKhKZpuMOcbHd6EMhwCAGlrHQouYQd86IOl3ruBtbMDKTbl44pHErsVIK44vJsGjjHT67Lt4DW3
 wrYmU3pazY61l+50yulCD2XEIH2k/taGmK+rQnLvFbhvkZlTjwyhz/Oavo4eHEcisagsRctfBD1
 5tB4ja03qpARgX3E=
X-Google-Smtp-Source: AGHT+IGlxTxk72K5G0ABy8JzY6GOcqVUenj1peBAkWXG94sw84KvErxU1bLs9BCIVv2lyYD0acBGWw==
X-Received: by 2002:a05:6000:2910:b0:3e0:a5a2:ec9b with SMTP id
 ffacd0b85a97d-3ee855812f8mr2764269f8f.52.1758286578658; 
 Fri, 19 Sep 2025 05:56:18 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32114c62sm81626665e9.2.2025.09.19.05.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:18 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:17 +0200
Message-ID: <20250919125617.136371-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-3-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286579; x=1758891379; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1tvK0vjkD7oIaW7oMTOW3uGhQfC7+yiOkIbdHJ56OQ=;
 b=FhDNNK89xVZBbezTvGeqxN16tLcu1orpU6bepjKR386CPUVuX4e3PrIdsPfbZlOdRB
 LsCcGZpY8oeYRRWxfqHDLjhz+KkyEB8ethWZCzPrLJTM2RlcUAqQMbO6YhcOeBNE+ky+
 Nj1BUk6indWln+GK8R9THrTRk5HelgUw93ew+vDdJeaaiDtx/EfP7litw9sGyyVgHoyg
 dzZGg+eQIcwgLyzLfcHi2Ibh/5CT6OiJ25mOeb0U8PEL7EpSUd48ayebFKEv/0F09JJc
 D/WLOEeHDRl4uW67evERjWQvC9IC6vJkkpUmTu3mk1I6JgAUFTXTlwYeRBuUNvMSp4Pe
 kapQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FhDNNK89
Subject: Re: [Buildroot] [PATCH 02/11] package/libsemanage: fix build issue
 due to basename()
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
> The build of libsemanage on musl configurations fails with:
> 
> direct_api.c: In function 'semanage_direct_install_file':
> direct_api.c:1746:20: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
>  1746 |         filename = basename(path);
>       |                    ^~~~~~~~
> 
> This fails to build even with a GCC 14.x toolchain, even with
> libsemanage 3.7, which is the version we have in our LTS branch.
> 
> Let's backport an upstream patch fixing this issue.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/913852e35c925888ced37e15be3731b9d3963019/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...te-semanage_basename-to-ensure-posix.patch | 172 ++++++++++++++++++
>  1 file changed, 172 insertions(+)
>  create mode 100644 package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
> 
> diff --git a/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch b/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
> new file mode 100644
> index 0000000000..10a81241a1
> --- /dev/null
> +++ b/package/libsemanage/0001-libsemanage-create-semanage_basename-to-ensure-posix.patch
> @@ -0,0 +1,172 @@
> +From 795f8381fd64abf692b26d01369561fc68be230c Mon Sep 17 00:00:00 2001
> +From: Rahul Sandhu <nvraxn@gmail.com>
> +Date: Fri, 21 Feb 2025 09:39:10 +0000
> +Subject: [PATCH] libsemanage: create semanage_basename to ensure posix
> + compliance
> +
> +Passing a const char * to basename(3) is a glibc-specific extension, so
> +create our own basename implementation. As it's a trivial 2 LOC, always
> +use our implementation of basename even if glibc is available to avoid
> +the complications of attaining the non-posix glibc implementation of
> +basename(3) as _GNU_SOURCE needs to be defined, but libgen.h also needs
> +to have not been included.
> +
> +Also fix a missing check for selinux_policy_root(3). From the man page:
> +On failure, selinux_policy_root returns NULL.
> +
> +As the glibc basename(3) (unlike posix basename(3)) does not support
> +having a nullptr passed to it, only pass the policy_root to basename(3)
> +if it is non-null.
> +
> +Signed-off-by: Rahul Sandhu <nvraxn@gmail.com>
> +Acked-by: James Carter <jwcart2@gmail.com>
> +Upstream: a339594da6f027aed5d66ec6798a3d732df235e4
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/conf-parse.y       | 13 ++++++++++---
> + src/direct_api.c       |  1 +
> + src/utilities.c        |  9 +++++++++
> + src/utilities.h        | 13 +++++++++++++
> + tests/test_utilities.c | 26 ++++++++++++++++++++++++++
> + 5 files changed, 59 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/conf-parse.y b/src/conf-parse.y
> +index 6cb8a598..d3ca5f1f 100644
> +--- a/src/conf-parse.y
> ++++ b/src/conf-parse.y
> +@@ -21,6 +21,7 @@
> + %{
> + 
> + #include "semanage_conf.h"
> ++#include "utilities.h"
> + 
> + #include <sepol/policydb.h>
> + #include <selinux/selinux.h>
> +@@ -382,7 +383,10 @@ external_opt:   PROG_PATH '=' ARG  { PASSIGN(new_external->path, $3); }
> + static int semanage_conf_init(semanage_conf_t * conf)
> + {
> + 	conf->store_type = SEMANAGE_CON_DIRECT;
> +-	conf->store_path = strdup(basename(selinux_policy_root()));
> ++	const char *policy_root = selinux_policy_root();
> ++	if (policy_root != NULL) {
> ++		conf->store_path = strdup(semanage_basename(policy_root));
> ++	}
> + 	conf->ignoredirs = NULL;
> + 	conf->store_root_path = strdup("/var/lib/selinux");
> + 	conf->compiler_directory_path = strdup("/usr/libexec/selinux/hll");
> +@@ -544,8 +548,11 @@ static int parse_module_store(char *arg)
> + 	free(current_conf->store_path);
> + 	if (strcmp(arg, "direct") == 0) {
> + 		current_conf->store_type = SEMANAGE_CON_DIRECT;
> +-		current_conf->store_path =
> +-		    strdup(basename(selinux_policy_root()));
> ++		const char *policy_root = selinux_policy_root();
> ++		if (policy_root != NULL) {
> ++			current_conf->store_path =
> ++			    strdup(semanage_basename(policy_root));
> ++		}
> + 		current_conf->server_port = -1;
> + 	} else if (*arg == '/') {
> + 		current_conf->store_type = SEMANAGE_CON_POLSERV_LOCAL;
> +diff --git a/src/direct_api.c b/src/direct_api.c
> +index 99cba7f7..ce12ccaf 100644
> +--- a/src/direct_api.c
> ++++ b/src/direct_api.c
> +@@ -26,6 +26,7 @@
> + 
> + #include <assert.h>
> + #include <fcntl.h>
> ++#include <libgen.h>
> + #include <stdio.h>
> + #include <stdio_ext.h>
> + #include <stdlib.h>
> +diff --git a/src/utilities.c b/src/utilities.c
> +index 70b5b677..004ffb62 100644
> +--- a/src/utilities.c
> ++++ b/src/utilities.c
> +@@ -349,3 +349,12 @@ int write_full(int fd, const void *buf, size_t len)
> + 
> + 	return 0;
> + }
> ++
> ++#ifdef __GNUC__
> ++__attribute__((nonnull))
> ++#endif
> ++char *semanage_basename(const char *filename)
> ++{
> ++	char *p = strrchr(filename, '/');
> ++	return p ? p + 1 : (char *)filename;
> ++}
> +diff --git a/src/utilities.h b/src/utilities.h
> +index c2d484a7..7481077a 100644
> +--- a/src/utilities.h
> ++++ b/src/utilities.h
> +@@ -156,4 +156,17 @@ semanage_list_t *semanage_slurp_file_filter(FILE * file,
> + 
> + int write_full(int fd, const void *buf, size_t len) WARN_UNUSED;
> + 
> ++/**
> ++ * Portable implementation of the glibc version of basename(3).
> ++ *
> ++ * @param filename  path to find basename of
> ++ *
> ++ * @return          basename of filename
> ++ */
> ++
> ++#ifdef __GNUC__
> ++__attribute__((nonnull))
> ++#endif
> ++char *semanage_basename(const char *filename);
> ++
> + #endif
> +diff --git a/tests/test_utilities.c b/tests/test_utilities.c
> +index bbd5af30..70a76fe7 100644
> +--- a/tests/test_utilities.c
> ++++ b/tests/test_utilities.c
> +@@ -46,6 +46,7 @@ static void test_semanage_rtrim(void);
> + static void test_semanage_str_replace(void);
> + static void test_semanage_findval(void);
> + static void test_slurp_file_filter(void);
> ++static void test_semanage_basename(void);
> + 
> + static char fname[] = {
> + 	'T', 'E', 'S', 'T', '_', 'T', 'E', 'M', 'P', '_', 'X', 'X', 'X', 'X',
> +@@ -117,6 +118,10 @@ int semanage_utilities_add_tests(CU_pSuite suite)
> + 				test_slurp_file_filter)) {
> + 		goto err;
> + 	}
> ++	if (NULL == CU_add_test(suite, "semanage_basename",
> ++				test_semanage_basename)) {
> ++		goto err;
> ++	}
> + 	return 0;
> +       err:
> + 	CU_cleanup_registry();
> +@@ -346,3 +351,24 @@ static void test_slurp_file_filter(void)
> + 
> + 	semanage_list_destroy(&data);
> + }
> ++
> ++static void test_semanage_basename(void)
> ++{
> ++	char *basename1 = semanage_basename("/foo/bar");
> ++	CU_ASSERT_STRING_EQUAL(basename1, "bar");
> ++
> ++	char *basename2 = semanage_basename("/foo/bar/");
> ++	CU_ASSERT_STRING_EQUAL(basename2, "");
> ++
> ++	char *basename3 = semanage_basename("/foo.bar");
> ++	CU_ASSERT_STRING_EQUAL(basename3, "foo.bar");
> ++
> ++	char *basename5 = semanage_basename(".");
> ++	CU_ASSERT_STRING_EQUAL(basename5, ".");
> ++
> ++	char *basename6 = semanage_basename("");
> ++	CU_ASSERT_STRING_EQUAL(basename6, "");
> ++
> ++	char *basename7 = semanage_basename("/");
> ++	CU_ASSERT_STRING_EQUAL(basename7, "");
> ++}
> +-- 
> +2.51.0
> +
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
