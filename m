Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6223CC87FCA
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 01:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FC7F41E51;
	Wed, 30 Jul 2025 01:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig3-GA0-KMLo; Wed, 30 Jul 2025 01:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285D041E84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285D041E84;
	Wed, 30 Jul 2025 01:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 51892194
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381A241E84
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfPJuMVnm3fG for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 01:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C35941E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C35941E51
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C35941E51
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 01:22:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6F4C35FFAA;
 Wed, 30 Jul 2025 03:22:42 +0200 (CEST)
Received: from [192.214.236.6:56272] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Jul 2025 03:22:42 +0200
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 03:22:42 +0200
To: Nathaniel Roach <nroach44@nroach44.id.au>
Cc: buildroot@buildroot.org
In-Reply-To: <20250721120820.3901333-1-nroach44@nroach44.id.au>
References: <20250721120820.3901333-1-nroach44@nroach44.id.au>
User-Agent: Webmail Free/1.6.11
Message-ID: <0d613e3fcfa528be2f89451458eb28de@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753838563;
 bh=MQkihKGkQVM2tN5f+JE32TWsiRQuMUTHGZcfRLOqZIQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uc/KBHP1PoicS/uw9BcaqhUKe8U9L4BDM6bI1xREUSVIm7zG4z/WGUjvY8rbC9KRd
 NxT6ejQ+uvGNj6XnjW4iLqSQcEoZk5EgKRvXbE/fNH0WbdU6IGpaudDvTxw1terMt2
 OgBRp7Krp1DvaH66WHg18X9gom/2LyhlztmaRja6SWzaWdP31V7Xn75QK19PLWw7m5
 WBgSwUr1MQNpFfesrVVmAd4AMLVWZOLbCRlMNe8AyOSNo0fBy0WSuAORxbwbsTZvO/
 YgU57iAXoW4U7CFrd2FBd8+YLrFAiJlavhwHw2LZPdPjIWE8FDoSSOtocH/NLWaR0+
 3fc2o6UxHXIJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uc/KBHP1
Subject: Re: [Buildroot] [PATCH v2] package/sudo: Enable libxcrypt with
 glibc, allowing hashed passwords without PAM
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/07/2025 14:08, Nathaniel Roach via buildroot wrote:
> Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 , on glibc
> builds without PAM, sudo will "fail" all password prompts.
> 
> It was found that it's simply checking the entered string against the
> raw hash, because 'libcryp' isn't available. On glibc, we need 
> libxcrypt,
> so enable it and ensure sudo is built with it.
> 
> musl and uclibc do have crypt() functions, so this is not needed.
> 
> Relevant code from sudo:
>  
> https://github.com/sudo-project/sudo/blob/v1.9.17p1/plugins/sudoers/auth/passwd.c#L139
> 
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
