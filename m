Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55818CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0810860AF9;
	Tue,  5 May 2026 19:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoMq-8iJFaGS; Tue,  5 May 2026 19:32:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22D2760AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778009538;
	bh=ruFcHOfSyXr4ZPUo7z0PLl/tawiGKgKzZ/yFycKKLWc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W7itvaXVlwtnRT48tCIKttogSBbF81TikSUIXd/TkbQD4OOd4+4EYqWj4PSoilvqK
	 c/Zhq5p2YPF1ID/7hY3TPLaEDEKLK9zZzRQL6//ddWmKn8IJsS76SsRySdJ0MWOosT
	 OXTxDmngJIiZ+P2JSyBOu3w46N9tz22RrFIQr2ZT7Be1eLIFZs9ZjfYaAtxYFRPgFc
	 1guU1cjKnGwlC7zaXU6WjW+CNkjdkYzDd0m6s9Ojw5jbSDqkst9mzIZ9DdFSqClfcj
	 JoFigW7RAuMmaPzJjpnzW2s4uyVftj6uFOUdJmpKOqn64MZ0pbYQJ4DBmTF5NjXquQ
	 pgwtScnfpEBKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22D2760AFB;
	Tue,  5 May 2026 19:32:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D4B0315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27E660AF9
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ncfA1QmGQHfi for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:32:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D56F060AFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56F060AFC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D56F060AFC
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9CBD3B97C289; Tue,  5 May 2026 21:32:12 +0200 (CEST)
Message-ID: <51a2670e-19c1-4b40-a95e-1e38735ef8fd@rnout.be>
Date: Tue, 5 May 2026 21:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-2-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-2-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778009532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=8TTKM3pgMZR5tBgc2YgjzwsXoUfQhnmXlqqLrOaP9lM=;
 b=Un9n/KXceLXNRt2GUKBluEXz5M5vSwbKHSHv4zFhI0ep2FgDDOLzP2Z+QdoEk+Wnbh+L4t
 NMul2ze+pRmvoVF4CpOWar6++nzy4qCU/by2CMoyYSLO3TVekp56onC9IrsIf4GcM0trfA
 FhAz/hihU0/9V+wlDpbnBviN9l5Qh9F8LFRphfEE4GF2FHfgdLy0Cvg1bxZa/I/0YC8gPB
 +yV17+AkQ0tttsdxJL+4GOgJk0rk3fxlOgqQY7P/wobbxamd4kKr9qiNDdFQ46aED8W54b
 vFeCLbyvI2TkcXW4Mj71atWo8IpzKKgFvh7yMuRqw5nBjSCEuDoRltyW1CMZUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Un9n/KXc
Subject: Re: [Buildroot] [PATCH v2 1/6] support/scripts/pkg-stats: search
 only Config.in{, .host} for URL
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



On 26/04/2026 17:33, Fiona Klute via buildroot wrote:
> The previous Config.* glob also caught linux/Config.ext.in and
> package/php/Config.ext, as well as some backup files created by
> editors (e.g. Config.in~ after editing a Config.in file in Emacs),
> leading to wrong results depending on directory listing order.
> 
> Also use "with" to automatically close the file when the block is
> left, even on error.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.

> ---
> This cannot solve the problem we have no structured URL information
> and don't look at which option the URL is listed under, but at least
> it's less wrong.

  Does either of these actually cause problems?

  What is still incorrect is that it doesn't report when Config.in doesn't have 
an upstream URL while Config.in.host doesn't.

> 
> Changes v1 -> v2:
> * Try fixed names instead of globbing all directory entries
> 
>   support/scripts/pkg-stats | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 55aa63c861..efb85a7405 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -148,17 +148,17 @@ class Package:
>           Fills in the .url field
>           """
>           self.status['url'] = ("warning", "no Config.in")
> -        for filename in os.listdir(self.pkgdir):
> -            if fnmatch.fnmatch(filename, 'Config.*'):
> -                fp = open(os.path.join(self.pkgdir, filename), "r")
> -                for config_line in fp:
> -                    if URL_RE.match(config_line):
> -                        self.url = config_line.strip()
> -                        self.status['url'] = ("ok", "found")
> -                        fp.close()
> -                        return
> -                self.status['url'] = ("error", "missing")
> -                fp.close()
> +        for filename in ('Config.in', 'Config.in.host'):
> +            try:
> +                with open(os.path.join(self.pkgdir, filename), "r") as fp:
> +                    for config_line in fp:
> +                        if URL_RE.match(config_line):
> +                            self.url = config_line.strip()
> +                            self.status['url'] = ("ok", "found")
> +                            return
> +                    self.status['url'] = ("error", "missing")
> +            except FileNotFoundError:

  We could modernise things by switching to pathlib and using .exists() a priori 
(and never mind the exception in case of TOCTOU or unreadable file).

  But that's further improvement :-)

  Regards,
  Arnout

> +                continue
>   
>       @property
>       def patch_count(self):

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
