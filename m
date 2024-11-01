Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486E9E6F091
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3184605CF;
	Fri,  1 Nov 2024 21:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfFU0AU0qgUz; Fri,  1 Nov 2024 21:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1543605D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1543605D8;
	Fri,  1 Nov 2024 21:38:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFADB112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C045840324
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nD8VIj4ZYbVw for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7256C40314
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7256C40314
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7256C40314
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:38:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 3BB0BB0055A;
 Fri,  1 Nov 2024 22:38:02 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53270])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 22:38:02 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 22:38:02 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20241101171044.3320155-1-romain.naour@smile.fr>
References: <20241101171044.3320155-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <77c46ca7edda3314e34d4185f38527ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730497084;
 bh=m5uAz7TskQi/8rb0KOk8pOvQ5Ajype8s/z5WFCF+ZE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fQM/2+WizJIXArl667oQLKCvxFX9X6CnTx11n5dKBmuHlNARCZptMpqO9knsVfJas
 1cHpieHKL3FrhFHUiCTJFDmGkaEksvX5SzCEexUOv02ncO5w2vV8uVXsre7Gko13XA
 Uu7oB3/eqN9dJEv4sG4/Qk+pKttz140aUfkJTJpcXs1F5wLVt8jFqHvLAfOAHC+BgK
 RzuNbTu6zrAyY3SGRZmL5LAA595IWb/y8LbIM62yWqRNc+702znCU/7uGfLq+w3Nyf
 ynzZC3cSiwcUxyZl+A7ryKSWpYtNMiymWeWZNxWs2lqwuBcr32ptrQlsjETjuoVySq
 6fv9hu+nwtK1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fQM/2+Wi
Subject: Re: [Buildroot] [PATCHv2 1/3] package/python-twisted: add missing
 python3-zlib dependency
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

On 01/11/2024 18:10, Romain Naour via buildroot wrote:
> Currently the test TestPythonTwisted is not broken [1] since it doesn't
> test all modules provided by python-twisted package.
> 
> But TestPythonTwisted should have failed due to missing zlib in
> twisted/web/client.py and twisted/conch modules.
> 
> Due to this, other runtime test like TestPythonPy3MagicWormhole or
> TestPythonPy3Txtorcon are currently broken [2][3].
> 
> Add missing python3-zlib dependency and update
> sample_python_twisted.py to load twisted/web/client that uses zlib
> module.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992685
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687
> [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687 
> (TestPythonPy3Txtorcon)
> 
> Fixes (partially due to missing python xml dependency):
> https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646 
> (TestPythonPy3MagicWormhole)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>

Series applied to master. Thanks!

> ---
> It's not clear if all python-twisted modules really requires zlib,
> but add python3-zlib to be on the safe side.
> 
> v2: update the commit log
> ---
>  package/python-twisted/Config.in                       | 1 +
>  support/testing/tests/package/sample_python_twisted.py | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/python-twisted/Config.in 
> b/package/python-twisted/Config.in
> index 84786689b7..2d2bc30972 100644
> --- a/package/python-twisted/Config.in
> +++ b/package/python-twisted/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
>  	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
>  	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
>  	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
> +	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
>  	help
>  	  Twisted is an event-driven networking engine written in
>  	  Python.
> diff --git a/support/testing/tests/package/sample_python_twisted.py 
> b/support/testing/tests/package/sample_python_twisted.py
> index 47d6c5debc..b5540522fc 100644
> --- a/support/testing/tests/package/sample_python_twisted.py
> +++ b/support/testing/tests/package/sample_python_twisted.py
> @@ -1,4 +1,5 @@
>  from twisted.internet import protocol, reactor, endpoints
> +from twisted.web.client import readBody  # noqa: F401
> 
> 
>  class F(protocol.Factory):
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
