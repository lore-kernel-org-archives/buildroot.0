Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BFBC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 19:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DA4412F9;
	Tue,  4 Jun 2024 19:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29jT-lJq1k9h; Tue,  4 Jun 2024 19:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C9E240917
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C9E240917;
	Tue,  4 Jun 2024 19:14:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 100611BF3E1
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F072E4048B
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 19:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yh_Pmpn0CRnS for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 19:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76CCB4028D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76CCB4028D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76CCB4028D
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 19:14:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9B06813F8A2;
 Tue,  4 Jun 2024 21:14:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 21:14:35 +0200
Date: Tue, 4 Jun 2024 21:14:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <Zl9nm8m7XX8pYgm2@landeda>
References: <20240426215144.1107186-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240426215144.1107186-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717528477;
 bh=YOFfbbPdWbtfPImNj1nVAGT/Uo5KkqpvAnggBfQL1K0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MqKMSLpzzpyibEAa4jstWU85oEPvQXW2B9RJg/ReZcWRwJ4EzOQ/KDt32uwOWqIYo
 02W43a9nYCNUsb6AF38moRllFWvO7S+VsSh0N7ZiXEU0+zGEy7IvTvLGB5oMCa+Kmb
 2kddB5Ax/v26JoQpLFxf3fCPySKjm5N2D5w2nGnso8M/kyBw6KuoFASXpy79du7zor
 uv03b31qHiNo9fhgTB0rww6sr8btCuSRYq1u52HAHAD5kuo/EKJ3w4uzRnw6eJ9VOW
 R1JfYH7gJ6qI2hB/tK3WGpP8nar9m798b+eTGmocEBxs1LubfcnLQ0CvBoLcIW/tbs
 Xjm/jPqiZAAuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqKMSLpz
Subject: Re: [Buildroot] [PATCH 1/1] package/kmod: fix build with musl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-04-26 23:51 +0200, Fiona Klute via buildroot spake thusly:
> From: Fiona Klute <fiona.klute+wiwa@gmx.de>
> 
> Patch from upstream PR still being discussed:
> https://github.com/kmod-project/kmod/pull/32
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Applied to master, after adding your SoB line, and a reference to bug
#16093, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...able-implementation-for-basename-API.patch | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 package/kmod/0002-Use-portable-implementation-for-basename-API.patch
> 
> diff --git a/package/kmod/0002-Use-portable-implementation-for-basename-API.patch b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
> new file mode 100644
> index 0000000000..46d23f4fa9
> --- /dev/null
> +++ b/package/kmod/0002-Use-portable-implementation-for-basename-API.patch
> @@ -0,0 +1,131 @@
> +From 721ed6040c7aa47070faf6378c433089e178bd43 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 9 Dec 2023 17:35:59 -0800
> +Subject: [PATCH] Use portable implementation for basename API
> +
> +musl has removed the non-prototype declaration of basename from
> +string.h [1] which now results in build errors with clang-17+ compiler
> +
> +Implement GNU basename behavior using strchr which is portable across libcs
> +
> +Fixes
> +../git/tools/kmod.c:71:19: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> +71 | "Commands:\n", basename(argv[0]));
> +| ^
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
> +
> +Suggested-by: Rich Felker
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + libkmod/libkmod-config.c | 2 +-
> + shared/util.c            | 4 ++--
> + shared/util.h            | 7 +++++++
> + testsuite/testsuite.c    | 2 +-
> + tools/depmod.c           | 2 +-
> + tools/kmod.c             | 4 ++--
> + 6 files changed, 14 insertions(+), 7 deletions(-)
> +
> +diff --git a/libkmod/libkmod-config.c b/libkmod/libkmod-config.c
> +index e83621b3..8aa555a4 100644
> +--- a/libkmod/libkmod-config.c
> ++++ b/libkmod/libkmod-config.c
> +@@ -794,7 +794,7 @@ static int conf_files_insert_sorted(struct kmod_ctx *ctx,
> + 	bool is_single = false;
> +
> + 	if (name == NULL) {
> +-		name = basename(path);
> ++		name = gnu_basename(path);
> + 		is_single = true;
> + 	}
> +
> +diff --git a/shared/util.c b/shared/util.c
> +index e2bab83a..0e16670e 100644
> +--- a/shared/util.c
> ++++ b/shared/util.c
> +@@ -172,9 +172,9 @@ char *modname_normalize(const char *modname, char buf[static PATH_MAX], size_t *
> +
> + char *path_to_modname(const char *path, char buf[static PATH_MAX], size_t *len)
> + {
> +-	char *modname;
> ++	const char *modname;
> +
> +-	modname = basename(path);
> ++	modname = gnu_basename(path);
> + 	if (modname == NULL || modname[0] == '\0')
> + 		return NULL;
> +
> +diff --git a/shared/util.h b/shared/util.h
> +index c4a3916b..073dc5a7 100644
> +--- a/shared/util.h
> ++++ b/shared/util.h
> +@@ -5,6 +5,7 @@
> + #include <stdbool.h>
> + #include <stdlib.h>
> + #include <stdio.h>
> ++#include <string.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <time.h>
> +@@ -76,6 +77,12 @@ do {						\
> + 	__p->__v = (val);			\
> + } while(0)
> +
> ++static _always_inline_ const char *gnu_basename(const char *s)
> ++{
> ++  const char *p = strrchr(s, '/');
> ++  return p ? p+1 : s;
> ++}
> ++
> + static _always_inline_ unsigned int ALIGN_POWER2(unsigned int u)
> + {
> + 	return 1 << ((sizeof(u) * 8) - __builtin_clz(u - 1));
> +diff --git a/testsuite/testsuite.c b/testsuite/testsuite.c
> +index 318343ac..aafc9873 100644
> +--- a/testsuite/testsuite.c
> ++++ b/testsuite/testsuite.c
> +@@ -70,7 +70,7 @@ static void help(void)
> +
> + 	printf("Usage:\n"
> + 	       "\t%s [options] <test>\n"
> +-	       "Options:\n", basename(progname));
> ++	       "Options:\n", gnu_basename(progname));
> +
> + 	for (itr = options, itr_short = options_short;
> + 				itr->name != NULL; itr++, itr_short++)
> +diff --git a/tools/depmod.c b/tools/depmod.c
> +index 43fc354a..cfb15b11 100644
> +--- a/tools/depmod.c
> ++++ b/tools/depmod.c
> +@@ -762,7 +762,7 @@ static int cfg_files_insert_sorted(struct cfg_file ***p_files, size_t *p_n_files
> + 	if (name != NULL)
> + 		namelen = strlen(name);
> + 	else {
> +-		name = basename(dir);
> ++		name = gnu_basename(dir);
> + 		namelen = strlen(name);
> + 		dirlen -= namelen + 1;
> + 	}
> +diff --git a/tools/kmod.c b/tools/kmod.c
> +index 55689c07..df91e5c6 100644
> +--- a/tools/kmod.c
> ++++ b/tools/kmod.c
> +@@ -68,7 +68,7 @@ static int kmod_help(int argc, char *argv[])
> + 			"Options:\n"
> + 			"\t-V, --version     show version\n"
> + 			"\t-h, --help        show this help\n\n"
> +-			"Commands:\n", basename(argv[0]));
> ++			"Commands:\n", gnu_basename(argv[0]));
> +
> + 	for (i = 0; i < ARRAY_SIZE(kmod_cmds); i++) {
> + 		if (kmod_cmds[i]->help != NULL) {
> +@@ -156,7 +156,7 @@ static int handle_kmod_compat_commands(int argc, char *argv[])
> + 	const char *cmd;
> + 	size_t i;
> +
> +-	cmd = basename(argv[0]);
> ++	cmd = gnu_basename(argv[0]);
> +
> + 	for (i = 0; i < ARRAY_SIZE(kmod_compat_cmds); i++) {
> + 		if (streq(kmod_compat_cmds[i]->name, cmd))
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
