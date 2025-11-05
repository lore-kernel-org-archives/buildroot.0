Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07BCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 21:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F96D40D12;
	Wed,  5 Nov 2025 21:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bOyPE0Wjrxhf; Wed,  5 Nov 2025 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387FC40B41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387FC40B41;
	Wed,  5 Nov 2025 21:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A2A462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F9EA613C9
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQqvOr_3KQBR for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 21:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F77661043
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F77661043
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F77661043
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 21:36:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5823460146;
 Wed,  5 Nov 2025 22:36:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 22:36:33 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 22:36:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251105181741.1333777-1-bernd@kuhls.net>
References: <20251105181741.1333777-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <30c6eeb873b0ef910e15b41c05359354@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762378594;
 bh=IZFwuQk+ZS8BeIzv7fxPE6cHeWgueWfAPYB6E+TDdP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bqF4O8MSRD0wewVX2NOu/YfvWg8dQDD/H7l1zQyDhjiNJ35vLKN/WPZYL+we65uta
 vzGAhEbjPkYmdAydtrstxtHgsRtstyCnVskYm0FpiYjWXWMDKW/mqvDu5VCK5gzzIc
 gHeYctbhfy7W18kzbaUTpMUpxm1mRZbU+Nwvx7Lh5qQwlGP71uR34PMDYB6SQK/Ke8
 XSX5ZDl0wHVWDynV6LM5uzqzNakcwJ/t9NjLCGpV4EJr1dmi03piAZAqLv/c+J6HId
 N/NjglXGOCUkOU/+i1QjikM2w1mE6Luae4WGbUaGYmP6txq5EdDgkLnH9yBsKehUGi
 Dn0vSqiBH4IBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bqF4O8MS
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: add dependency to
 gnutls for mkeficapsule
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

On 05/11/2025 19:17, Bernd Kuhls wrote:
> Buildroot commit 14a0169714cd5c35be40faadc066412f144bc1a6 added gnutls
> as dependency to BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE in uboot-tools.mk
> without adding the dependency and its reverse dependencies to the
> Config.in causing a build error:
> 
> Makefile:578: *** gnutls is in the dependency chain of uboot-tools that
>  has added it to its _DEPENDENCIES variable without selecting it or
>  depending on it from Config.in.  Stop.
> 
> Fixes:
> https://autobuild.buildroot.net/results/39d/39db5ae9aad95e4976c3d8a40aca95b26568f8ea/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
