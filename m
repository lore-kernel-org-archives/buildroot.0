Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EC8E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 11:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F384F80B97;
	Sun,  5 Jan 2025 11:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcAOyLv5W_ct; Sun,  5 Jan 2025 11:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2257B80B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2257B80B99;
	Sun,  5 Jan 2025 11:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20DEED92
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01836402FE
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxVPSPY-im8y for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 11:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBDDA4028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDDA4028C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBDDA4028C
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:37:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BA6EC19F5BA;
 Sun,  5 Jan 2025 12:37:48 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60306])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 12:37:48 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 12:37:48 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
References: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8ba74269c904d6403ab5e1d1abe7d245@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736077069;
 bh=kMqeM/adhtiALUU5GKzCJ7jxRx009QmpQgdG8JPNROk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uKwwPHjCwlh8C19+KBlsrq+8kD6+0YgB/DsmWPGk2NQShTEaXfLQegUtxay3uUbcu
 xcebAah0gkrL8/N2I0sccNw6FunY/RapjmyMivzp+7cob+kaQwd5VDNqJQmZ+Sf0MU
 cjpSot/iwznOb29sadFXSlV4PRgc4F8wOL9KQso3Yc06193wmLlbXgbN0oDnCcfH9m
 j3v5PnXeCWMTD00RgWkvNylpkBrNby6E9cseAhilc4Rs0eUXumXT2JkmfzJWlgLQ2n
 j2fiO80ZW2aajT3J8G2W1pKDMzk4+Q0asZLClnyFRU2WDM/3YG0UYnL9RSo1aCT5Cr
 o783XNhrIDf8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uKwwPHjC
Subject: Re: [Buildroot] [PATCH 1/2] package/cryptodev-linux: ensure
 <pkg>_LINUX_CONFIG_FIXUPS has an effect
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

On 04/01/2025 22:38, Thomas Petazzoni via buildroot wrote:
> The variable <pkg>_LINUX_CONFIG_FIXUPS defined in the
> cryptodev-linux... has no effect. Indeed, the variable is only named
> CRYPTODEV_LINUX_CONFIG_FIXUPS.
> 
> But the variable name being <pkg>_LINUX_CONFIG_FIXUPS and the package
> name being CRYPTODEV_LINUX, the correct variable name is
> CRYPTODEV_LINUX_LINUX_CONFIG_FIXUPS.
> 
> Prior to this commit, a configuration with cryptodev-linux enabled
> would result in:
> 
> $ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
> $
> 
> Aka, empty, while PACKAGES_LINUX_CONFIG_FIXUPS collects in
> package/pkg-generic.mk the value of the <pkg>_LINUX_CONFIG_FIXUPS
> variables from all enabled packages.
> 
> With this patch applied:
> 
> $ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
> PACKAGES_LINUX_CONFIG_FIXUPS=		@if ! grep -q '^CONFIG_CRYPTO=[my]' /; 
> then 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO\>/d' / && echo 
> 'CONFIG_CRYPTO=y' >> /; fi
> 		@if ! grep -q '^CONFIG_CRYPTO_USER_API_AEAD=[my]' /; then 
> 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO_USER_API_AEAD\>/d' / && 
> echo 'CONFIG_CRYPTO_USER_API_AEAD=y' >> /; fi
> $
> 
> As one would expect.
> 
> Fixes: 4b12336d1fad12fbb82b4d9144e6cb5636a12256 
> ("package/cryptodev-linux: needs CONFIG_CRYPTO_USER_API_AEAD")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
