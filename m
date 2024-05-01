Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3B2C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D11282133;
	Wed,  1 May 2024 21:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vt9uvNzH3X5W; Wed,  1 May 2024 21:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5D182137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5D182137;
	Wed,  1 May 2024 21:32:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0204F1BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1CF940750
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuIXpnjI1GNm for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:32:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5E964074B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E964074B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5E964074B
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:32:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D6EAD13F8AD;
 Wed,  1 May 2024 23:32:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:32:29 +0200
Date: Wed, 1 May 2024 23:32:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjK07Se8dPiwAOHa@landeda>
References: <20240501212627.17988-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501212627.17988-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714599155;
 bh=J27l5zEPfFhZUDlsW1o2BzGJ1B1eDoV1PdfrBceTLno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TnjwlOsZngQniB7kPp48fQyrM4le7LiPl4ug385RaFHdkctfFmlRxZ+GSceVIWAKV
 WGqGQuY8sdDvneSIYiYaUwxLPTeGeQxLZ4EKOl/3QqKXcc/wQcV/J+yO4JP+4GIEyR
 Y7c5EBJUEWW6Wu/2NE01c6hEVbGRRPuv5zT7Q4mHzUpxpm/Jzzpggo/9iGm/Vb4DDy
 kXnWmkroPUaknzsPgunwG8ub3eHZqAIodweTSxY0FS++6uxKVQ34VMpFGBdnD+eGjN
 x1AZM+GEUX3lvIZY9LfANOOuh15dmQC9rxmgG45uLdEBM2fbmkcQPQctdolZ31a9bd
 wNPmr2nHG2xrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TnjwlOsZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix legal info
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-01 23:26 +0200, Fabrice Fontaine spake thusly:
> Commit dfaa34ddd3398f22718f7361d617d98d53b51630 forgot to update hash of
> LICENSE file:
> 
> ERROR: LICENSE has wrong sha256 hash:
> ERROR: expected: e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a
> ERROR: got     : cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37
> 
> LICENSE file has been updated to clean up authors and contributors:
> https://github.com/python-pillow/Pillow/commit/4197263dff19a79f13cd86f6cdc9a0ec6c06da92
> 
> Fixes: dfaa34ddd3398f22718f7361d617d98d53b51630
>  - http://autobuild.buildroot.org/results/5a35d83c73367e1b20534b1bc7f2f564cf653a38
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pillow/python-pillow.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 073b758dfe..352536a035 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -3,4 +3,4 @@ md5  6c21a12849ae42f93881f614d8f6f651  pillow-10.3.0.tar.gz
>  sha256  9d2455fbf44c914840c793e89aa82d0e1763a14253a000743719ae5946814b2d  pillow-10.3.0.tar.gz
>  
>  # Locally computed sha256 checksums
> -sha256  e706384c6f299d1b6fa782ae657740b372b4bd7938a1a318bf94ac249114758a  LICENSE
> +sha256  cf234c27a3f275f5a050f4df3946f8855704226fe4e7ca8b33928cbcecbced37  LICENSE
> -- 
> 2.43.0
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
