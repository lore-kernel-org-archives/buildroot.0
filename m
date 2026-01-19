Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76406CCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49AF480626;
	Mon, 19 Jan 2026 10:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DhtCak0kHFsc; Mon, 19 Jan 2026 10:09:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60B8F806EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817382;
	bh=dQfcQDztz0Bdbnp7lCNb6DLk8kouERlnmaSVVOQnS5o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JtZ7YsGU/be6iCNYexUFKP2zc5TwNK0NXL6YBzxns+x3bUMh7lE51cUJJcbX7ND6+
	 FKmNruoBp6J6VSsDv3ImCK55rORuHFnc/0RC/2jkY2opZm/uRUkD4uK4TSIsY5bUfn
	 mNQ0KZeHjNYXgZqFWPN0iJHwT0/r4W9I4ZFQqiPqI6AeDPvU0rwmp6qQKCoydxMk2+
	 KC4FHNckqqfHce/N/0rYJm7F8q/FxYpBl+SblMXmewAi1l7bf3AfffYMCKo3rr5Fkm
	 gt+YYM4P8kkyDZJ4bKDHACMDRMc7qHn+FqRxcOs78eY9QLjbLIJ1KLLasGGEw03elJ
	 HkgsS9G+ua3GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60B8F806EF;
	Mon, 19 Jan 2026 10:09:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E7C160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73BCA40D39
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ympjCa1Be-z for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EBE24025B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EBE24025B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EBE24025B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 93662B97A961; Mon, 19 Jan 2026 11:09:29 +0100 (CET)
To: Preyas <preyas17@zohomail.in>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:28 +0100
Message-ID: <20260119100928.13096-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110155452.5532-1-preyas17@zohomail.in>
References: <20260110155452.5532-1-preyas17@zohomail.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817369; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JwC2NQOmdBpp8ZWSACasKBqRZR7otSr7AyGmtPXqKNc=;
 b=fg49fdks47QXfX3oSGzJfhufsoM6zD/wU1LkPv20M0HTJwgm52zzpPUk99ZErO4upS1VAR
 21QvdmkaqS3ttbj2fiPAXoG+0FqveuVqucYLlm4yOmSuKTzhjFXkqlqryzb/iSiaaVcb5W
 abnTNjerMhGRZS3u1qkFcTSezDATvzwWBWhPtvSLnwTx2v30Bi8BMNOqCrSs35dlQjKX8c
 iyAxb4kgdw1vNPnmhWkkgqHWAKMLixevohM2ItxurjMVjtOX/2i4pvQSg/pWQVWN1L5Lf9
 SsiKbWRzB6+DD8Y1uhtuxjyp530TYEiCZZKIJWXIWCdZ5lA/O/S5An7ftcj06g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fg49fdks
Subject: Re: [Buildroot] [PATCH] docs: use https for documentation links
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
> Switch a handful of documentation/website links from http to https.
> 
> Signed-off-by: Preyas Sharma <preyas17@zohomail.in>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  README                       |  2 +-
>  docs/website/contribute.html | 10 +++++-----
>  docs/website/download.html   |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/README b/README
> index 008e996f5f..143b476be6 100644
> --- a/README
> +++ b/README
> @@ -3,7 +3,7 @@ Linux systems through cross-compilation.
>  
>  The documentation can be found in docs/manual. You can generate a text
>  document with 'make manual-text' and read output/docs/manual/manual.text.
> -Online documentation can be found at http://buildroot.org/docs.html
> +Online documentation can be found at https://buildroot.org/docs.html
>  
>  To build and use the buildroot stuff, do the following:
>  
> diff --git a/docs/website/contribute.html b/docs/website/contribute.html
> index 52c30d60d3..115b1fd8b8 100644
> --- a/docs/website/contribute.html
> +++ b/docs/website/contribute.html
> @@ -14,22 +14,22 @@
>        <ul>
>  	<li>Reproducing, analyzing and fixing bugs from our
>  	  <a href="https://gitlab.com/buildroot.org/buildroot/-/issues">bug tracker</a></li>
> -	<li>Analyzing and fixing <a href="http://autobuild.buildroot.org/">
> +	<li>Analyzing and fixing <a href="https://autobuild.buildroot.org/">
>  	    autobuild failures</a></li>
>  	<li>Reviewing and testing patches sent by other developers. See the
> -	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
> +	  <a href="https://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
>  	  </a> or <a href="https://patchwork.ozlabs.org/project/buildroot/list/">
>  	    patchwork</a>.</li>
>  	<li>Working on items from the
> -	  <a href="http://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
> -	<li><a href="http://buildroot.org/manual.html#submitting-patches">Submitting
> +	  <a href="https://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
> +	<li><a href="https://buildroot.org/manual.html#submitting-patches">Submitting
>  	  your own patches</a> through the
>  	  <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
>  	</a></li>
>        </ul>
>  
>        <p>For more details on these topics, check out the
> -	<a href="http://buildroot.org/manual.html#_contributing_to_buildroot">
> +	<a href="https://buildroot.org/manual.html#_contributing_to_buildroot">
>  	  Contributing to buildroot</a> chapter in the Buildroot manual. Thanks for your help!</p>
>  
>        <p>If you need any support yourself, have a look at <a href="./support.html">
> diff --git a/docs/website/download.html b/docs/website/download.html
> index d1d92c8e6b..b2b4891464 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -98,7 +98,7 @@
>        </table>
>  
>        This and earlier releases (and their PGP signatures) can always be downloaded from
> -      <a href="/downloads/">http://buildroot.net/downloads/</a>.
> +      <a href="/downloads/">https://buildroot.org/downloads/</a>.
>      </div>
>    </div>
>  
> @@ -123,7 +123,7 @@
>        </div><br>
>  
>        <p>If you are not already familiar with using Git, we recommend
> -	you visit <a href="http://git-scm.org">the Git
> +	you visit <a href="https://git-scm.org">the Git
>  	website</a>.</p>
>  
>        <p>Once you've checked out a copy of the source tree, you can
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
