Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A356D2ECE9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 21:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2BF841EE;
	Mon, 19 Jan 2026 21:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coYP8U_30hzR; Mon, 19 Jan 2026 21:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE97E841E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768856621;
	bh=5kVZfJWpU1OZcULISzqb+ZUwwasGYGXuCuvWUkR30vY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qZDBW2WlSBK74mHzbvffqVBBFlBlOYf98uxJe4FzReb+LwrDQTQq9sV6NFnNeYbGK
	 YCmmijbANmOSz6lp2bEW4IiNcfwirIS+C2+cTh0ViTsTChB2IZhNx/XvB0jufBCGn4
	 jF0fknLNq7c5WhTb47m0EGS5XEFbl8ZJ9sbjZTXjJTkcngGHcZT3OpyYtAZgzTPyxk
	 Cm/9QUONU0ODSK/pyBSyolXyQ3546TvDSQQe9LTjzIYvLXfVgR1k7rWcrqLkJHDBJM
	 YWVVFnhYF4zMdDUY0kvSqE/Kcht3PBJ7m/2fsez598zxkq/K+qsWEtydwn49ZWYC2/
	 dPll8f9iUhgUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE97E841E6;
	Mon, 19 Jan 2026 21:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9656E2A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85288841E6
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otd3UJzFd-Y1 for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 21:03:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87325841E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87325841E1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87325841E1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 21:03:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1280DB00548;
 Mon, 19 Jan 2026 22:03:35 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 Jan 2026 22:03:35 +0100
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 22:03:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260118224947.3879017-7-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
 <20260118224947.3879017-7-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <9eacaf400ebf908f602b7f31429bbe09@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768856617;
 bh=0jrEmGqUZD9gnA6o9YOi3mZrJErQ02cgA9apScoF4Bk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qFPFt4RBg9I+wM7msFDNpjZbXakzK3TloCwjGEelJScII6+XfmaP4bDEIO6Qa6RyY
 hiVChBuf/HJg4pFsJXchN5KN2TrDwB+UZ8uETMlP8/SkMGpAnSvCow6LwneamPN4Hj
 dskrxKysXpAl+n8GbRGYZ2g6DwY0Kl+WL+SXX42YWatq7+m2tJgUEJEqV1xmEmGa++
 yK91n9Wg+o3yDcwz02Yqho0HW2TLZnE44d/XONo6UmELphCW/d+T83bAElp3k3SHIa
 Eo1A86utBwuHlGy+bXN+nyVzZodOIaLQPqfSb+JOWhrJz8Hq3uCXJGksjrM/8ZZ8Ze
 D2a9Apj2qOI3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qFPFt4RB
Subject: Re: [Buildroot] [PATCH 6/6] package/php: bump version to 8.5.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 18/01/2026 23:49, Bernd Kuhls wrote:
> Release notes:
> https://www.php.net/releases/8.5/en.php
> https://news-web.php.net/php.announce/474
> https://news-web.php.net/php.announce/475
> https://news-web.php.net/php.announce/481
> 
> Rebased patches 0001-0003.
> 
> Removed patch 0005 due to the configure check being non-fatal now:
> https://github.com/php/php-src/commit/e4078a6a70d5ad7896049bc19f3affe2fe806c24
> 
> opcache is not an optional dependency anymore:
> https://github.com/php/php-src/commit/7b4c14dc10167b65ce51371507d7b37b74252077
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/php/0005-allow-opcache-cross-compiling.patch 
> b/package/php/0005-allow-opcache-cross-compiling.patch
> deleted file mode 100644

The command "make check-package" is reporting an error
due to this removed file:
.checkpackageignore:784: ignored file 
package/php/0005-allow-opcache-cross-compiling.patch is missing

Could you fix this error, please?

> index 1031b45f19..0000000000
> --- a/package/php/0005-allow-opcache-cross-compiling.patch
> +++ /dev/null
[...]

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
