Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC7CD6554E
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D6E24ECB1;
	Tue, 26 Nov 2024 18:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08sGqFlW9uqV; Tue, 26 Nov 2024 18:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AE124EBEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE124EBEE;
	Tue, 26 Nov 2024 18:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D672DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454774ECB1
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-164OKcaOWo for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 124594EBED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 124594EBED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 124594EBED
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:54:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AB28C60128;
 Tue, 26 Nov 2024 19:54:07 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51294])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 19:54:07 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 19:54:07 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20241124224134.351652-1-giulio.benetti@benettiengineering.com>
References: <20241124224134.351652-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bd7636b75fe1280ef389c7db78077226@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732647249;
 bh=VmwVEkowgdnbpKTHVDVD5qVG+kE/tW43UdhqHJKclxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q/NItKJHQiSsAAzNArAOkKxyUngyPwZEOdk77v0ShN5VjTJjNjFR0yMAcp5foqTBo
 UpddfQ38kZS1Yqg124EgBbrGebq1+IwzMaAAu8fMR8gU/jFmnVt8xavrKidOCO8htF
 5afu+bILbuYuMfJCIddI3IXynkdJh1vKAHp8SdDH/LXEHlt4MP+sw09lO+3M3aZxyN
 21kERVvYh2g4HdyPBlOSYSPq/3u/jLqqdFZyXnHUKwJ0jVVQyXCf4s2BJc2y5LMLZr
 9pHreYqUZ0JrdpYn93Exjh1PdUL+MusHDqFTxTLtXcVHP6mInhLv0coqrJ41LL3Hq7
 zaRDtQcyHYl/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q/NItKJH
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.107
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

On 24/11/2024 23:41, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 36e2296d38..fe29029633 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From 
> https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_106_RTM/src/SHA256SUMS
> -sha256  
> 026b744e1e0784b890c3846ac9506472a92138c1f4d41dec581949574c585c38  
> nss-3.106.tar.gz
> +# From 
> https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_107_RTM/src/SHA256SUMS
> +sha256  
> 7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729  
> nss-3.107.tar.gz
>  # Locally calculated
>  sha256  
> a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  
> nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 35cfd0edb1..8f2da4a5c4 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBNSS_VERSION = 3.106
> +LIBNSS_VERSION = 3.107
>  LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>  LIBNSS_SITE = 
> https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst 
> .,_,$(LIBNSS_VERSION))_RTM/src
>  LIBNSS_DISTDIR = dist
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
