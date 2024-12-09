Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F0EE7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2813F6088E;
	Mon,  9 Dec 2024 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWJ9--qT58wj; Mon,  9 Dec 2024 22:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7F846090A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7F846090A;
	Mon,  9 Dec 2024 22:43:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A3596F
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6281A40012
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STqC00BR3-rb for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 11D21404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11D21404A8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11D21404A8
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A2B845FFAA;
 Mon,  9 Dec 2024 23:42:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Dec 2024 23:42:54 +0100
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 23:42:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <64e5620d42bb895b47d18dd72c56bbf1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733784175;
 bh=oNOvI2x7igk5p5D1tg6ihvO9i7hcIOET0ISNrz4OjN4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lirAJwlFjOlD3xIXMuLdRDhRDPTegSZoPv6cNQk/Jhg0ck0WnxqQ3KYbutr6q9/AE
 yF/vuQCrHpYzTfKvoReBqMXjpo5kEo5Bi8FO+AKYIzroWutGZcLid992Mr+eldmc8t
 l3SWX9zzNtLvT7s5/vHlyrVl+YALBvXMjWl8mUyl+hNhKi+01OevWaOlkqATi4zb9l
 Q7W3zmrHyHJp2ztyelYqGGM45VBRjFlkDGpSyl6F+ittKwXh6cwbi2pFihExW2R3bz
 DQdhDQDtP0gYYxkRyznhwBtExNBOTvlyrfsQY6lVCZxcBxFrKCOQ6U3sTuIhGSTECG
 33Cchkme6XkSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lirAJwlF
Subject: Re: [Buildroot] [PATCH 01/23] package/autoconf: fix 'uncommitted'
 typo
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/12/2024 09:26, Peter Korsgaard wrote:
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.

> ---
>  package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch 
> b/package/autoconf/0001-dont-add-dirty-to-version.patch
> index 8df2276865..a1a50d2838 100644
> --- a/package/autoconf/0001-dont-add-dirty-to-version.patch
> +++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
> @@ -1,7 +1,7 @@
>  autoconf: don't append -dirty to version
> 
>  Don't append -dirty to autoconf version number if the buildroot git 
> tree
> -has uncommited changes.
> +has uncommitted changes.
> 
>  This script is meant for the autoconf developers, but it also 
> activates
>  if you build autoconf in a subdirectory of a git tree (E.G. like how 
> it's
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
