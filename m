Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A233ACD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A1A40BAB;
	Tue,  5 May 2026 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C6XOMQq_G29; Tue,  5 May 2026 19:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D21340BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010805;
	bh=4vlRkmnVL5wLZtJEsL9nQraHxqrqk/w2U517EwNLPQM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hO3kzO5qLCcrf558qxheF/1FuUNM9BkP2g0rYyyLnsxjqW1sliskjJelzrYzRsVH1
	 yixf9SHmNIm7Z1H7MObDftRdtxTcjzSB2OQg5RqyimGE+ORMtQyWJi7xzFhHY28DL4
	 CHEwO+9mLWRzj+KZa1XCKuHrTaxJMRCZTojx4jJm39qQw7ouYLnHr8jXARvn4JwlLn
	 tyCGUc5qun7qy6BTBmbv7mFvG2p4JQlcwEdCLn9CkYhJdx+/tfknHM0Mh/FU5WdJJI
	 POsU3+Grf/SZWfIsCMT/FGY56W4RypXnaz3c2BIGBHMH2VAefl+Lt2sZ/UTVlfqWBM
	 w4AUDmCM+129A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D21340BA5;
	Tue,  5 May 2026 19:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 673822A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D0D340BA5
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_-jS9GAPEqO for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4524240B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4524240B99
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4524240B99
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D71CB97C07D; Tue,  5 May 2026 21:53:21 +0200 (CEST)
Message-ID: <0146d0a9-5e72-42f4-8a4c-d9c2d4234749@rnout.be>
Date: Tue, 5 May 2026 21:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
 <20260426153334.1026982-7-fiona.klute@gmx.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260426153334.1026982-7-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1778010801; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VID5/Zz8pT8qn9FNDblAtjFHmpssPePo0Fm22kgQR0E=;
 b=QY9MkYUFI6vnoXoGCwsOAej6Wt2MAprjXaZ/RlLSk+CYsvSfM9yR3peSCT+zEq4jdA9QF1
 eF78m18pB10zSmqriBjRpJUd4y28RydjPom2zVxOUmEF7SjJlzRilYqEdiTJ6OTdCQ4oly
 JFgv0sNxiyxUDXHmEuKcBrqWRdk8WdWtZTC0E1vpgYfFip8aCduZzqkzjP8VmcxfdcZWEZ
 m51xI+xESo3+oWkjn3yZR9FRYth3clT93V0vGkFkr50g2UpOBWYgqi+5TzdrNsHKyFoNFi
 iWPP4xvLCIpjN6yqD+eJSboY42OvYCpQyT54XFRJ8Cgzy2fH8f09F3BjYbDgDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QY9MkYUF
Subject: Re: [Buildroot] [PATCH v2 6/6] support/scripts/pkg-stats: run main
 function only if called as script
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
> The __name__ == '__main__' guard allows importing pkg-stats as a
> module using importlib, circumventing the normal module filename
> requirements. This in turn makes it possible to test/debug individual
> functions.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

  Applied to master, thanks.
  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 5dcc812e2b..2b2194b9a5 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1334,7 +1334,7 @@ def is_newer_version_available(pkg):
>       )
>   
>   
> -def __main__():
> +def main():
>       global cvecheck
>   
>       args = parse_args()
> @@ -1403,4 +1403,5 @@ def __main__():
>           dump_json(packages, defconfigs, stats, date, commit, args.json)
>   
>   
> -__main__()
> +if __name__ == '__main__':
> +    main()

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
