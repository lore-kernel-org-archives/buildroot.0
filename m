Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A9C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 20:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12DFA610C3;
	Fri, 28 Jun 2024 20:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NO39J0wOHrQ; Fri, 28 Jun 2024 20:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBA7160845
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBA7160845;
	Fri, 28 Jun 2024 20:25:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8E01BF3BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0BAA40585
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv7kj99sXLbK for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 20:25:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0186640180
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0186640180
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0186640180
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 20:25:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B693613F88F;
 Fri, 28 Jun 2024 22:25:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 28 Jun 2024 22:25:03 +0200
Date: Fri, 28 Jun 2024 22:25:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zn8cHy5ehdIU7OJU@landeda>
References: <20240627220653.3626619-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627220653.3626619-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719606305;
 bh=slQauGqveawV8eXKGHTG1/daEbfdwBuLZuEeFuPEmP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=un2gwPp72GORwhq02kaSQPo3jnUvj5/WjtzHrgW8SBCILiVnhvbDA1tgnA+b48oZ/
 E6KgFaW8uIp3QT9BQQJ7Pj8DCScUnttI4C0GgQyvTV749WUDit0rzKxORaWACSZJ7e
 c81AHDZu6CSkv/WtOSn8sC/XznYORZBIE6YuhOaf7p4q1MUrmO3E3Eq19lax56e3VX
 pv32AjwOh8rLLZVIQgclKAMYuAJotD1bmDr5ykttxjASEQwuFRefKidMVUk4CcSH2+
 0B9wyQBLagtKhMWOihDeFcDxTjFUj6/apjPI9OL8d2N1ObdkSLLq+fsMPmHA90IpEv
 26pOPnjdj/khw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=un2gwPp7
Subject: Re: [Buildroot] [PATCH 1/1] package/rrdtool: fix patch fuzz
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

Bernd, All,

On 2024-06-28 00:06 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, rrdtool fails to build with output:
> 
>     patching file src/rrd_tool.c
>     Hunk #2 FAILED at 42.
>     Hunk #3 succeeded at 435 (offset -8 lines).
>     Hunk #4 succeeded at 518 (offset -8 lines).
>     Hunk #5 succeeded at 564 (offset -8 lines).
>     Hunk #6 succeeded at 879 (offset -8 lines).
>     1 out of 6 hunks FAILED -- saving rejects to file src/rrd_tool.c.rej
> 
> Because this was caused by an upstream patch we do not change it but add
> another upstream patch to be applied before our current patch to avoid
> the problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6996dbd764b0066da49dd009f1385196342c89dc/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, after expanding the existing comment as suggested,
thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ix-BUILD_DATE-in-rrdtool-help-output.patch | 57 +++++++++++++++++++
>  ... => 0002-Constify-argv-fix-warnings.patch} |  0
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
>  rename package/rrdtool/{0001-Constify-argv-fix-warnings.patch => 0002-Constify-argv-fix-warnings.patch} (100%)
> 
> diff --git a/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch b/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
> new file mode 100644
> index 0000000000..9e5af9c148
> --- /dev/null
> +++ b/package/rrdtool/0001-Fix-BUILD_DATE-in-rrdtool-help-output.patch
> @@ -0,0 +1,57 @@
> +From e59f703bbcc0af949ee365206426b6394c340c6f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Wolfgang=20St=C3=B6ggl?= <c72578@yahoo.de>
> +Date: Wed, 23 Mar 2022 17:58:45 +0100
> +Subject: [PATCH] Fix BUILD_DATE in rrdtool help output
> +
> +- This is a followup to #1102
> +- Fixes segfault when running "rrdtool --help"
> +- Change DATE_FMT to the same date format as the __DATE__ macro [1]:
> +  mmm dd yyyy
> +
> +[1] https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html
> +
> +Upstream: https://github.com/oetiker/rrdtool-1.x/commit/e59f703bbcc0af949ee365206426b6394c340c6f
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + configure.ac   | 2 +-
> + src/rrd_tool.c | 8 ++++++++
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4d2345855..5169b0d49 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -695,7 +695,7 @@ AC_MSG_RESULT(${COMP_PERL:-No Perl Modules will be built})
> + 
> + # Use reproducible build date and time
> + if test "$SOURCE_DATE_EPOCH"; then
> +-	DATE_FMT="%d %b %Y %H:%M:%S"
> ++	DATE_FMT="%b %d %Y %H:%M:%S"
> + 	BUILD_DATE=$(LC_ALL=C date -u -d "@$SOURCE_DATE_EPOCH" "+$DATE_FMT")
> + 	AC_DEFINE_UNQUOTED([BUILD_DATE], ["$BUILD_DATE"], [Use reproducible build date])
> + fi
> +diff --git a/src/rrd_tool.c b/src/rrd_tool.c
> +index 930d08272..cc6119d9a 100644
> +--- a/src/rrd_tool.c
> ++++ b/src/rrd_tool.c
> +@@ -45,11 +45,19 @@ static void PrintUsage(
> +     char *cmd)
> + {
> + 
> ++#ifdef BUILD_DATE
> ++    const char *help_main =
> ++        N_("RRDtool %s"
> ++           "  Copyright by Tobias Oetiker <tobi@oetiker.ch>\n"
> ++           "               Compiled %s\n\n"
> ++           "Usage: rrdtool [options] command command_options\n");
> ++#else
> +     const char *help_main =
> +         N_("RRDtool %s"
> +            "  Copyright by Tobias Oetiker <tobi@oetiker.ch>\n"
> +            "               Compiled %s %s\n\n"
> +            "Usage: rrdtool [options] command command_options\n");
> ++#endif
> + 
> +     const char *help_list =
> +         N_
> diff --git a/package/rrdtool/0001-Constify-argv-fix-warnings.patch b/package/rrdtool/0002-Constify-argv-fix-warnings.patch
> similarity index 100%
> rename from package/rrdtool/0001-Constify-argv-fix-warnings.patch
> rename to package/rrdtool/0002-Constify-argv-fix-warnings.patch
> -- 
> 2.39.2
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
