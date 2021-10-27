Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E851C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 04:58:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18FFF610A5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 04:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18FFF610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 711F4400C1;
	Wed, 27 Oct 2021 04:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiboBW5kutu2; Wed, 27 Oct 2021 04:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862AF400D2;
	Wed, 27 Oct 2021 04:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71AAF1BF386
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 04:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FC0A403EB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 04:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MrrP3Y9oFJi8 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 04:58:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF74140241
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 04:58:52 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id A1DB06A03F7;
 Wed, 27 Oct 2021 06:58:49 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 27 Oct 2021 04:58:49 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <mailman.3672.1635273538.103149.buildroot@buildroot.org>
References: <mailman.3672.1635273538.103149.buildroot@buildroot.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <170e09cd599fceea54a6bac8ae1fea5d@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: fix build on musl
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On 2021-10-26 18:38, Fabrice Fontaine <fontaine.fabrice@gmail.com> 
wrote:

> Fix the following build failure on musl raised since bump to version
> 1.4.60 in commit d62b7f54f00291a50274409fb5510527fd725ffe:
> 
> In file included from buffer.h:404,
>                  from array.h:5,
>                  from array.c:3:
> ck.h:24:14: error: expected ';' before 'typedef'
>    24 | __BEGIN_DECLS
>       |              ^
>       |              ;
> ......
>    29 | typedef size_t rsize_t;
>       | ~~~~~~~
> 
> Fixes:
>  -
> http://autobuild.buildroot.org/results/0d56a44449e89773499051b35f21ec83bfab4ca6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-__BEGIN_DECLS-__END_DECLS-if-needed.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644
> package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
> 
> diff --git
> a/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
> b/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
> new file mode 100644
> index 0000000000..cd64f18794
> --- /dev/null
> +++
> b/package/lighttpd/0002-core-define-__BEGIN_DECLS-__END_DECLS-if-needed.patch
> @@ -0,0 +1,39 @@
> +From cf4dfbe15ef8ead3a7eda974af7d804d447f00db Mon Sep 17 00:00:00 2001
> +From: Glenn Strauss <gstrauss@gluelogic.com>
> +Date: Mon, 4 Oct 2021 09:51:22 -0400
> +Subject: [PATCH] [core] define __BEGIN_DECLS, __END_DECLS if needed
> +
> +[Retrieved from:
> +https://github.com/lighttpd/lighttpd1.4/commit/cf4dfbe15ef8ead3a7eda974af7d804d447f00db]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/first.h | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/src/first.h b/src/first.h
> +index df747ba46..9d0428ae6 100644
> +--- a/src/first.h
> ++++ b/src/first.h
> +@@ -39,6 +39,22 @@
> + #include <sys/types.h>
> + #include <stddef.h>
> +
> ++#ifndef __BEGIN_DECLS
> ++#ifdef __cplusplus
> ++#define __BEGIN_DECLS extern "C" {
> ++#else
> ++#define __BEGIN_DECLS
> ++#endif
> ++#endif

Instead of creating your own declarations of _*_DECLS, you might just 
add the missing <sys/cdefs.h> to ck.h; this seems to be the only place 
the problem occurs.

The header is part of glibc, but not of musl; within Buildroot it is 
automatically added by musl-compat-headers, which is selected if you use 
musl.

Kind regards,
Andreas

> ++
> ++#ifndef __END_DECLS
> ++#ifdef __cplusplus
> ++#define __END_DECLS }
> ++#else
> ++#define __END_DECLS
> ++#endif
> ++#endif
> ++
> + #if defined HAVE_STDINT_H
> + # include <stdint.h>
> + #elif defined HAVE_INTTYPES_H
> --
> 2.33.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
