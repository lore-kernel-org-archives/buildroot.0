Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1832C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 17:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC25605F4;
	Sun,  5 May 2024 17:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhoQoDWLGYNi; Sun,  5 May 2024 17:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE8A6062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE8A6062C;
	Sun,  5 May 2024 17:41:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98FD51BF3F2
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9184481FE8
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqSOxYq-NwkJ for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 17:41:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42CE381FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CE381FA7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42CE381FA7
 for <buildroot@buildroot.org>; Sun,  5 May 2024 17:41:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4C44213F8B5;
 Sun,  5 May 2024 19:41:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 19:41:42 +0200
Date: Sun, 5 May 2024 19:41:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjfE1lt9BoRK0854@landeda>
References: <20240504082014.238310-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504082014.238310-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714930905;
 bh=mtFbb+orjOpbpDNS33AJoU2SRXTd1NQNVy2KEJFuzKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CoP0/BuT1QtJoCdr4LORUDuckKVfNjjWgbfm7G2KAg5aD6kefsakok9XHshMJEd2+
 bRLpngxlg8oa5qLWQ0sr2nO/+CCYNnS+bCg7T40x20+QqUfTtiq3fr8qBq/NsNRuYN
 Jr4oNkOizhVYYOky+Nu7WtjjuL8MTX2U0RRxyLc5StK6lhaFUwIMeTmGQEazN9XThn
 bw0uVyjo+vN86zG+vdk/DY5Zgw0DHVwevUpKa8KCQrbttC6DPyBAYVIIHOXp2YBrMl
 Fe1ZOmyLkIkHBLc6F/HDcpuCQ50CwSyeK04mkaRacEBfMVhpH1B/x4bbyT/PNkmYpH
 Y9ljvYKDfGlrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CoP0/BuT
Subject: Re: [Buildroot] [PATCH 1/1] package/stress-ng: fix uclibc-ng build
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-04 10:20 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc-ng build failure raised since bump to version
> 0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
> https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:
> 
> stress-sock.c: In function 'stress_sock_client':
> stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
>   656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
>       |                                   ^~~~~~~~~~~
>       |                                   MSG_ZEROCOPY
> stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
> CC stress-sockfd.c
> stress-sock.c: In function 'stress_sock_server':
> stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
>  1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
>       |                                  ^~~~~~~~~~~
>       |                                  MSG_ZEROCOPY
> 
> Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
>  - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after changing the Upstream tag to the commit now
your PR has been merged, thanks!

Regards,
Yann E. MORIN.

> ---
>  ...sock.c-fix-build-without-SO_ZEROCOPY.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
> 
> diff --git a/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
> new file mode 100644
> index 0000000000..88fef900e7
> --- /dev/null
> +++ b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
> @@ -0,0 +1,56 @@
> +From 6a719f95e0547a6dfaa9178b42c2a5dbd931ce1a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 4 May 2024 10:04:20 +0200
> +Subject: [PATCH] stress-sock.c: fix build without SO_ZEROCOPY
> +
> +uclibc-ng defines MSG_ZEROCOPY but not SO_ZEROCOPY resulting in the
> +following build failure since version 0.17.04 and
> +https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:
> +
> +stress-sock.c: In function 'stress_sock_client':
> +stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
> +  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
> +      |                                   ^~~~~~~~~~~
> +      |                                   MSG_ZEROCOPY
> +stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
> +CC stress-sockfd.c
> +stress-sock.c: In function 'stress_sock_server':
> +stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
> + 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
> +      |                                  ^~~~~~~~~~~
> +      |                                  MSG_ZEROCOPY
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/ColinIanKing/stress-ng/pull/381
> +---
> + stress-sock.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/stress-sock.c b/stress-sock.c
> +index 253730168..880530d04 100644
> +--- a/stress-sock.c
> ++++ b/stress-sock.c
> +@@ -649,7 +649,7 @@ retry:
> + 				args->name, errno, strerror(errno));
> + 			goto free_controls;
> + 		}
> +-#if defined(MSG_ZEROCOPY)
> ++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
> + 		if (sock_zerocopy) {
> + 			int so_zerocopy = 1;
> + 
> +@@ -1053,7 +1053,7 @@ static int OPTIMIZE3 stress_sock_server(
> + 		goto die;
> + 	}
> + 
> +-#if defined(MSG_ZEROCOPY)
> ++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
> + 	if (sock_zerocopy) {
> + 		int so_zerocopy = 1;
> + 
> +-- 
> +2.43.0
> +
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
