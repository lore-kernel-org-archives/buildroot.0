Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38CECEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7CCA4050C;
	Mon, 17 Nov 2025 20:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdbmV27mjgWU; Mon, 17 Nov 2025 20:00:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B022F4059F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B022F4059F;
	Mon, 17 Nov 2025 20:00:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 27CF01BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEA94059F
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfyckvDFQKUi for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:00:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF19240022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF19240022
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF19240022
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:00:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C9D53B9796C0; Mon, 17 Nov 2025 21:00:03 +0100 (CET)
Message-ID: <27fc51fa-3f01-448d-a7b9-40e81c91aa98@rnout.be>
Date: Mon, 17 Nov 2025 21:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
References: <20251030195405.1475836-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251030195405.1475836-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vuq79nDqghlo4bHPa4nCCcaosfjXelwQXKJ2h9KVZUU=;
 b=ndaR4YOCfz2dIuxj7774bhyi4anLEBFk97YqTbl0WMlUCmYmzWGBoRMjCt10bsHw9Z50my
 J+jv8+UBxQNfks+V/ogNJDGp7W/yhvBxT8QUBvT5fN3SPVwAe4Uc6c6NHKYSzwAeN9+LLa
 sgLUig28n6PzSjqkHF+COAg97BSAIeuf3CU2DoypTb9+u+Fk/n4Fl8+P1hg8mZJDQyLX5V
 yraekIossA24frWAq6Zng/+wZKun/v3CEtl26LKPjp3aWvFeh6k8KH72U/RQT764Zrt9vm
 gQE8mtvsXFDXcmQU7MUFwCe54hGl96WMoVz3NxPXNSbXpM8bieQsaIYX+VMyhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ndaR4YOC
Subject: Re: [Buildroot] [PATCH 1/2] package/quota: Fix building on musl
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/10/2025 20:54, Bernd Kuhls wrote:
> Add upstream commit to fix musl build.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7de/7de6acab2b10d1b6b7d5e95104f1f2686bcd126b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks. Only this one, not the bump.

  Regards,
  Arnout

> ---
>   package/quota/0001-Fix-building-on-musl.patch | 234 ++++++++++++++++++
>   1 file changed, 234 insertions(+)
>   create mode 100644 package/quota/0001-Fix-building-on-musl.patch
> 
> diff --git a/package/quota/0001-Fix-building-on-musl.patch b/package/quota/0001-Fix-building-on-musl.patch
> new file mode 100644
> index 0000000000..df6c32fb34
> --- /dev/null
> +++ b/package/quota/0001-Fix-building-on-musl.patch
> @@ -0,0 +1,234 @@
> +From e73c5b48e12c3f02e532864a1107cdc8a4feafc3 Mon Sep 17 00:00:00 2001
> +From: Brahmajit Das <brahmajit.xyz@gmail.com>
> +Date: Sun, 14 Jul 2024 07:58:50 +0000
> +Subject: [PATCH] Fix building on musl
> +
> +basename(3) is defined in libgen.h in MUSL. Include libgen.h where
> +basename(3) is used.
> +
> +Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> +Signed-off-by: Jan Kara <jack@suse.cz>
> +
> +Upstream: https://sourceforge.net/p/linuxquota/code/ci/e73c5b48e12c3f02e532864a1107cdc8a4feafc3/
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + convertquota.c |  1 +
> + edquota.c      | 11 ++++++-----
> + quota.c        |  1 +
> + quota_nld.c    |  1 +
> + quotacheck.c   |  1 +
> + quotaon.c      |  1 +
> + quotastats.c   |  1 +
> + quotasync.c    |  1 +
> + repquota.c     |  1 +
> + rquota_svc.c   |  1 +
> + setquota.c     |  1 +
> + warnquota.c    |  1 +
> + xqmstats.c     |  1 +
> + 13 files changed, 18 insertions(+), 5 deletions(-)
> +
> +diff --git a/convertquota.c b/convertquota.c
> +index 6c8a553..4eb05ed 100644
> +--- a/convertquota.c
> ++++ b/convertquota.c
> +@@ -14,6 +14,7 @@
> + #include <fcntl.h>
> + #include <errno.h>
> + #include <getopt.h>
> ++#include <libgen.h>
> +
> + #include <endian.h>
> +
> +diff --git a/edquota.c b/edquota.c
> +index 20ca306..c5b27cf 100644
> +--- a/edquota.c
> ++++ b/edquota.c
> +@@ -20,6 +20,7 @@
> + #include <stdlib.h>
> + #include <fcntl.h>
> + #include <getopt.h>
> ++#include <libgen.h>
> +
> + #include "pot.h"
> + #include "quotaops.h"
> +@@ -38,7 +39,7 @@ char *progname;
> + static int flags, quotatype;
> + static int fmt = -1;
> + static char *protoname;
> +-static char *dirname;
> ++static char *dir_name;
> +
> + static void usage(void)
> + {
> +@@ -138,7 +139,7 @@ static int parse_options(int argc, char **argv)
> + 				  exit(1);
> + 			  break;
> + 		  case 'f':
> +-			  dirname = optarg;
> ++			  dir_name = optarg;
> + 			  break;
> + 		  case 256:
> + 			  flags |= FL_NUMNAMES;
> +@@ -176,7 +177,7 @@ static void copy_prototype(int argc, char **argv, struct quota_handle **handles)
> + 	protoprivs = getprivs(protoid, handles, 0);
> + 	while (argc-- > 0) {
> + 		id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
> +-		curprivs = getprivs(id, handles, !dirname);
> ++		curprivs = getprivs(id, handles, !dir_name);
> + 		if (!curprivs)
> + 			die(1, _("Cannot get quota information for user %s\n"), *argv);
> + 		argv++;
> +@@ -223,7 +224,7 @@ int main(int argc, char **argv)
> + 	argv += ret;
> +
> + 	init_kernel_interface();
> +-	handles = create_handle_list(dirname ? 1 : 0, dirname ? &dirname : NULL, quotatype, fmt,
> ++	handles = create_handle_list(dir_name ? 1 : 0, dir_name ? &dir_name : NULL, quotatype, fmt,
> + 			(flags & FL_NO_MIXED_PATHS) ? 0 : IOI_NFS_MIXED_PATHS,
> + 			(flags & FL_REMOTE) ? 0 : MS_LOCALONLY);
> + 	if (!handles[0]) {
> +@@ -296,7 +297,7 @@ int main(int argc, char **argv)
> + 	else {
> + 		for (; argc > 0; argc--, argv++) {
> + 			id = name2id(*argv, quotatype, !!(flags & FL_NUMNAMES), NULL);
> +-			curprivs = getprivs(id, handles, !dirname);
> ++			curprivs = getprivs(id, handles, !dir_name);
> + 			if (!curprivs)
> + 				die(1, _("Cannot get quota information for user %s.\n"), *argv);
> + 			if (flags & FL_EDIT_TIMES) {
> +diff --git a/quota.c b/quota.c
> +index a60de12..66b0fa3 100644
> +--- a/quota.c
> ++++ b/quota.c
> +@@ -20,6 +20,7 @@
> + #include <unistd.h>
> + #include <limits.h>
> + #include <ctype.h>
> ++#include <libgen.h>
> + #ifdef RPC
> + #include <rpc/rpc.h>
> + #include "rquota.h"
> +diff --git a/quota_nld.c b/quota_nld.c
> +index 58a62af..710b556 100644
> +--- a/quota_nld.c
> ++++ b/quota_nld.c
> +@@ -26,6 +26,7 @@
> + #include <fcntl.h>
> + #include <limits.h>
> + #include <signal.h>
> ++#include <libgen.h>
> + #include <sys/stat.h>
> + #include <asm/types.h>
> +
> +diff --git a/quotacheck.c b/quotacheck.c
> +index e2c3bbd..fa1d297 100644
> +--- a/quotacheck.c
> ++++ b/quotacheck.c
> +@@ -19,6 +19,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> + #include <errno.h>
> ++#include <libgen.h>
> +
> + #include <sys/stat.h>
> + #include <sys/types.h>
> +diff --git a/quotaon.c b/quotaon.c
> +index 351c851..17b6bcc 100644
> +--- a/quotaon.c
> ++++ b/quotaon.c
> +@@ -13,6 +13,7 @@
> + #include <string.h>
> + #include <stdlib.h>
> + #include <stdarg.h>
> ++#include <libgen.h>
> +
> + #include "quotaon.h"
> + #include "quota.h"
> +diff --git a/quotastats.c b/quotastats.c
> +index a059812..4076a7d 100644
> +--- a/quotastats.c
> ++++ b/quotastats.c
> +@@ -24,6 +24,7 @@
> + #include <errno.h>
> + #include <string.h>
> + #include <signal.h>
> ++#include <libgen.h>
> +
> + #include "pot.h"
> + #include "common.h"
> +diff --git a/quotasync.c b/quotasync.c
> +index cad2a20..e90b24a 100644
> +--- a/quotasync.c
> ++++ b/quotasync.c
> +@@ -7,6 +7,7 @@
> + #include <string.h>
> + #include <errno.h>
> + #include <getopt.h>
> ++#include <libgen.h>
> +
> + #include "pot.h"
> + #include "common.h"
> +diff --git a/repquota.c b/repquota.c
> +index e79fc4d..8e509bd 100644
> +--- a/repquota.c
> ++++ b/repquota.c
> +@@ -18,6 +18,7 @@
> + #include <pwd.h>
> + #include <grp.h>
> + #include <getopt.h>
> ++#include <libgen.h>
> +
> + #include "pot.h"
> + #include "common.h"
> +diff --git a/rquota_svc.c b/rquota_svc.c
> +index 6e856bb..c17df13 100644
> +--- a/rquota_svc.c
> ++++ b/rquota_svc.c
> +@@ -34,6 +34,7 @@
> + #include <signal.h>
> + #include <errno.h>
> + #include <netconfig.h>
> ++#include <libgen.h>
> + #ifdef HOSTS_ACCESS
> + #include <tcpd.h>
> + #include <netdb.h>
> +diff --git a/setquota.c b/setquota.c
> +index c517ab1..9e4b2fa 100644
> +--- a/setquota.c
> ++++ b/setquota.c
> +@@ -18,6 +18,7 @@
> + #include <time.h>
> + #include <ctype.h>
> + #include <stdlib.h>
> ++#include <libgen.h>
> +
> + #if defined(RPC)
> + #include "rquota.h"
> +diff --git a/warnquota.c b/warnquota.c
> +index 2882fee..6f63ce7 100644
> +--- a/warnquota.c
> ++++ b/warnquota.c
> +@@ -31,6 +31,7 @@
> + #include <time.h>
> + #include <getopt.h>
> + #include <locale.h>
> ++#include <libgen.h>
> + #ifdef HAVE_NL_LANGINFO
> + #include <langinfo.h>
> + #endif
> +diff --git a/xqmstats.c b/xqmstats.c
> +index 59b1d66..345b060 100644
> +--- a/xqmstats.c
> ++++ b/xqmstats.c
> +@@ -8,6 +8,7 @@
> + #include <stdio.h>
> + #include <unistd.h>
> + #include <string.h>
> ++#include <libgen.h>
> + #include "common.h"
> + #include "pot.h"
> +
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
