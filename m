Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F60D11180
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 16:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C702C80EFE;
	Sun,  3 Nov 2024 16:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2uTghaLWgTGi; Sun,  3 Nov 2024 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E559180EED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E559180EED;
	Sun,  3 Nov 2024 16:29:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 039AE1128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E3141228
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_C1JaCz8m_5 for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 16:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 973D141214
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 973D141214
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 973D141214
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 16:29:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 309906013A;
 Sun,  3 Nov 2024 17:29:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46536])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Nov 2024 17:29:44 +0100
MIME-Version: 1.0
Date: Sun, 03 Nov 2024 17:29:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241102170128.532820-1-romain.naour@smile.fr>
References: <20241102170128.532820-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <5b79795fef997f8e6ff444b763eee968@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730651385;
 bh=cFBeqta1BvRHIFmvFWcbLFb21QwvhMo4Q+ZvU0o4Qgg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FhqhHI829afIc5IaY587tmcHlTkAJ9XhOVsOgiF5htCm9QPCo9t++izLs5aVaEqPW
 uR2zI9YEX0mFjhKscn1fTXXJGtzKdkhVp8pztdLYJAmn3sfGgxOEjXN+2RtRqa6F/4
 YIDM0Q14CSHtb6yFF2unaI3LltXkJgkcWsWIx3JJ+8Kg+FO3BDFjuA99RgRObgboPs
 1iq3qoiu+aFsi0oLPRYcpVfl5MnnaVCd8zhdsH4ydTZ+XeJtz1+oIkWF4NLj0gZ2Pg
 7DLrO+qaycYjSqYw8caUEZ72B3A/WuSoRsBUmb+HZxvnNFRFjHISoTms4IXS0IENNB
 LrTBiQRxUeJ3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FhqhHI82
Subject: Re: [Buildroot] [PATCH] support/testing: TestPythonPy3Incremental:
 update expected string
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

On 02/11/2024 18:01, Romain Naour via buildroot wrote:
> Since python-incremental 24.7.0, there is no longer a dot before an rc
> specifier [1].
> 
> Update TestPythonPy3Incremental expected result to
> "[package, version 1.2.3rc4]".
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992642
> 
> [1] 
> https://github.com/twisted/incremental/commit/d482dfff3f1c18eed69372937958c3f2481f6252
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master. Thanks!

> ---
>  support/testing/tests/package/sample_python_incremental.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/sample_python_incremental.py 
> b/support/testing/tests/package/sample_python_incremental.py
> index efab8b2067..b6e2aa803c 100644
> --- a/support/testing/tests/package/sample_python_incremental.py
> +++ b/support/testing/tests/package/sample_python_incremental.py
> @@ -1,3 +1,3 @@
>  import incremental
>  v = incremental.Version("package", 1, 2, 3, release_candidate=4)
> -assert(str(v) == "[package, version 1.2.3.rc4]")
> +assert(str(v) == "[package, version 1.2.3rc4]")
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
