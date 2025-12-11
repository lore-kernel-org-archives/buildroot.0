Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293B8D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBA69411AB;
	Thu, 11 Dec 2025 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zabo1ASYZ8ef; Thu, 11 Dec 2025 19:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0789411D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481444;
	bh=t26HPqSx0FE6/tkd0LLjQjJU0UcwDb8OfTc+o6WQf9M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=llv8I04SrIeDEoGSWOUOpDOHeuu6tKpNMcMEre9aYFPAXZyvTBu/Ao9yKEjh0Sc5v
	 PedzqQ1I65kcmgJd6gYKtfQvpNQ6kVpidje+jIJP9ymlAGxNXOnFp3jPh09cDa+ydE
	 9V4AaeJJBrW6ie//RkBTNRFnpayngfKUHJtbypdMIZYpA7of17ARjnnHUhHDfzdeZI
	 T2kG1auPXLshtlzVSJdXdqkVJQA/wUkgG7EAvn9aaclULeQCssKxoa3J0Lufcnishq
	 IibbmH9Rg29o3vGXRu8nTWLvbzI5jnlXtXPb74l52YZBEkD+HUk1XUv1xVxxewx/1g
	 HFmIIAncjctUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0789411D1;
	Thu, 11 Dec 2025 19:30:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46A94E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 442C940073
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8mKArTKYRV0 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 251114005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 251114005C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 251114005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BBDDB97A082; Thu, 11 Dec 2025 20:30:40 +0100 (CET)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:38 +0100
Message-ID: <20251211193038.1099026-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203191409.4096911-1-peter@korsgaard.com>
References: <20251203191409.4096911-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481440; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=K1q/oLnwchhmTl/hQHxL9wi3IHkE2kQk72YcSQDPvE8=;
 b=IWR/jj8WZIISBM0BAnM3MiZXvNKms0XivoBp6FGpBfKtSGBFW53E0IO9HEQfBZ4XkFKNLK
 50bBN+UK/+2rsbDPqzVJIpNnZRO0I9tvr3uJDvWKO9PVphgJryQC/ZgaG9MHOVCB1lcfBn
 /Fnzc2VJn9crzDxiON8QXtjY4iSiaCpTMhIUd0+7B5YQgbEF9rpwXJ0ET0leQF0gsDMkO2
 bWIIAejzJBmcBKYh4of+olWrNxdNe0b9SfDpWZCvkcLO9B7D8hsrh2spLoGZJTZQNcJ3am
 FtrB+NckSHe8RPNU4fs1lEkJcAy/S9m02iqzEvEr0hROfnS7L7wgiv4VOwQ5pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=IWR/jj8W
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: use an unique
 HTTP user-agent
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> As requested by the gnu.org admins:
> 
> "
> Since August 2024, we've been under DDoS attacks from common command line
> tools.
> 
> To fix this, we would need to change the user-agent from "Python/3.11
> aiohttp/3.8.4" to "buildroot.org pkg-stats" instead.
> "
> 
> It indeed probably makes sense to use an unique user-agent string, so rework
> the script to do that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  support/scripts/pkg-stats | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index c659acb80e..7d9170e30f 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -42,6 +42,8 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
>  RM_API_STATUS_FOUND_BY_PATTERN = 3
>  RM_API_STATUS_NOT_FOUND = 4
>  
> +HTTP_HEADERS = {'User-Agent': 'buildroot.org pkg-stats'}
> +
>  
>  class Defconfig:
>      def __init__(self, name, path):
> @@ -469,7 +471,7 @@ async def check_url_status(session, pkg, npkgs, retry=True, verbose=False):
>      global check_url_count
>  
>      try:
> -        async with session.head(pkg.url) as resp:
> +        async with session.head(pkg.url, headers=HTTP_HEADERS) as resp:
>              if resp.status >= 400:
>                  pkg.status['url'] = ("error", "invalid {}".format(resp.status))
>                  check_url_count += 1
> @@ -526,7 +528,7 @@ def check_package_latest_version_set_status(pkg, status, version, identifier):
>  async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
>      url = "https://release-monitoring.org/api/project/Buildroot/%s" % pkg.name
>      try:
> -        async with session.get(url) as resp:
> +        async with session.get(url, headers=HTTP_HEADERS) as resp:
>              if resp.status != 200:
>                  return False
>  
> @@ -553,7 +555,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
>  async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
>      url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
>      try:
> -        async with session.get(url) as resp:
> +        async with session.get(url, headers=HTTP_HEADERS) as resp:
>              if resp.status != 200:
>                  return False
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
