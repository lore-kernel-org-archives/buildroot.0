Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E9EC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 09:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B86E7403C0;
	Mon,  3 Jun 2024 09:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3MyUn1SeE1h; Mon,  3 Jun 2024 09:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBA5C40510
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBA5C40510;
	Mon,  3 Jun 2024 09:23:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03B061BF3EB
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F053940683
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 09:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IQhXfbb9RVg for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 09:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A0F5340648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F5340648
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0F5340648
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 09:23:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D904113F88D;
 Mon,  3 Jun 2024 11:23:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jun 2024 11:23:05 +0200
Date: Mon, 3 Jun 2024 11:23:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zl2LecutuYFb4nQM@landeda>
MIME-Version: 1.0
Content-Disposition: inline
I.n-Reply-To: <20240603071726.532652-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717406587;
 bh=BKJGa7rtuzMDQsN9faV6dP+47O8CrG9i+3NpnOsCGrM=;
 h=Date:From:To:Cc:Subject:From;
 b=MDrVmHlknC1xW98tV4HuK8QhjIXILkMb3zaFf5D/jkyvR2DcM0jZ66aXKTX6dOsZk
 +5Ehys3dagYe0j438Rg6BvEPdkGNjypJd+XjtqZaxXkL/NpbeQo65b1u6ZbjvjBypb
 LFFVzJm1ZPlBongnleyWKw3KKrDkneLGC4PTzo1eNw683+gL2yX2xJkBtiZjRmVnH9
 EFEUc0E93QCmaY/etV75kIMWN6QTm68ZL6YXdF3krl3x91q8vmYaOC5y5MKGGee2vx
 or0pE7gVGm8jfezFgCt0fq5q9C0eJi5kEJwQGFCkQfBKBrFLZ7L2ltKl97ta8D21Ca
 vtVDNj0l82HMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MDrVmHlk
Subject: Re: [Buildroot] [PATCH 02/23] package/ebtables/ebtables.hash: use
 http:// to match _SITE
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

Peter, All,

On 2024-06-03 09:17 +0200, Peter Korsgaard spake thusly:
> For consistency.

As suggested by Baruch, I've switched to https instead, both in
the hash file and in the .mk for _SITE.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ebtables/ebtables.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ebtables/ebtables.hash b/package/ebtables/ebtables.hash
> index 98106b0d60..06e2f9f345 100644
> --- a/package/ebtables/ebtables.hash
> +++ b/package/ebtables/ebtables.hash
> @@ -1,4 +1,4 @@
> -# ftp://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
> +# http://ftp.netfilter.org/pub/ebtables/ebtables-2.0.11.tar.gz.sha256sum
>  sha256  b71f654784a726329f88b412ef7b96b4e5d786ed2bd28193ed7b4c0d677dfd2a  ebtables-2.0.11.tar.gz
>  # Locally computed
>  sha256  ebdb8ae564c952792017ec680e2edd30443642216eb9f8a3d8fa166c0cb628c1  COPYING
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
