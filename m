Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E26C5478C
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 06:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09E7F401B1;
	Tue,  5 Mar 2024 06:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcnKd3AI4J6Q; Tue,  5 Mar 2024 06:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7947414F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7947414F1;
	Tue,  5 Mar 2024 06:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50C5A1BF32A
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E43B401B1
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 06:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNeTH6KXO_lP for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 06:32:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F00BC40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00BC40137
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F00BC40137
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 06:32:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CD16913F88D;
 Tue,  5 Mar 2024 07:32:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Mar 2024 07:32:38 +0100
Date: Tue, 5 Mar 2024 07:32:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sen Hastings <sen@hastings.org>
Message-ID: <Zea8hgsclG51x3Mu@landeda>
References: <20240305013353.1763404-1-sen@hastings.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240305013353.1763404-1-sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709620361;
 bh=gZI8azNUoWlYk74yR7+Kvr0jIW5Q+5D0aKNqO6GcotM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z8QUQpsxiPcRvWpjkaUYWO0SSolTKjKB3mZgiBLTZhSyZpWfjls6bim4VV249IAwX
 hYzjuyPeM8e1eYXAffogsbo8xQO/rK7wEk65moQ2c3BzPHIvHqfnJy+MSJVy/MJ84L
 uIgR3k1D9ZOPBRZVytyEPw6FefHX6/noJ3+0dSDZt6NTDjmhvMu5ErT/u6aVab/d3F
 Y27KVKecCUmBHqxyx077kQOyorVcBKddivVG2eW3dE52u9n/mBZSq2f1QN0hGaso2O
 EyGxrlGa1ptUpCgE2h/dnzc6h71mT5aMbmeAxvnv6dlVQxiF+++Q9WDMsd+2+5WGTI
 Qt6vlidqAGIgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z8QUQpsx
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix/improve
 git hash sorting
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

Sen, All,

On 2024-03-04 17:33 -0800, Sen Hastings spake thusly:
> sortGrid()'s handling of git hashes has been inconsistent, they can
> be detected as strings or numbers depending on what type of character
> they start with. This patch fixes the behaviour by using a regex to
> capture everything that looks like a git hash and treat it as a
> string. This means when you sort by current version ascending
> all the version strings with git hashes should show up first, sorted
> 0-9,a-f.

There are non-git-hash versions that get interspersed in the list,
though:

  - package/sunxi-tools/sunxi-tools.mk  1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292
  - package/glibc/glibc.mk              2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
  - package/localedef/localedef.mk      2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
  - package/ctorrent/ctorrent.mk        dnh3.3.2
  - boot/edk2/edk2.mk                   edk2-stable202308

But honestly, that's really not a problem (I'm not even sure that
sorting by version is even meaningful for this table).

> A demo is available here:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-improve-git-hash-sorting.html
> 
> Signed-off-by: Sen Hastings <sen@hastings.org>
> ---
>  support/scripts/pkg-stats | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 3295eb7a48..4dc1857a9e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -741,6 +741,7 @@ addedCSSRules.forEach(rule => styleSheet.insertRule(rule));
>  function sortGrid(sortLabel){
>  	let i = 0;
>  	let pkgSortArray = [], sortedPkgArray = [], pkgStringSortArray = [], pkgNumSortArray = [];
> +	const git_hash_regex = /[a-f,0-9]/gi;
>  	const columnValues = Array.from(document.getElementsByClassName(sortLabel));
>  	const columnName = document.getElementById(sortLabel);
>  	let lastStyle = document.getElementById("sort-css");
> @@ -765,7 +766,9 @@ function sortGrid(sortLabel){
>                  pkgSortArray.push(sortArr);
>          });
>          pkgSortArray.forEach((listing) => {
> -                if ( isNaN(parseInt(listing[1], 10)) ){
> +                if ( listing[1].length >= 39 && listing[1].match(git_hash_regex).length >= 39){

Why at least 39? Git hashes are exactly 40 char long, no more, no less.
So if you need to check for a little bit less, or for more, then this
should be explained.

For 39, this can indeed be explained: we do have a 39-long hash, to avoid
collisions with a previous release of Buildroot (in package
package/rockchip-mali/rockchip-mali.mk). But for more than 40, I don't
immediately see...

Could you please respin with an extended commit log, that explains the
39-long hash, and explains the above-40?

Regards,
Yann E. MORIN.

> +                        pkgStringSortArray.push(listing);
> +		} else if ( isNaN(parseInt(listing[1], 10)) ){
>                          pkgStringSortArray.push(listing);
>                  } else {
>                          listing[1] = parseFloat(listing[1]);
> -- 
> 2.25.1
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
