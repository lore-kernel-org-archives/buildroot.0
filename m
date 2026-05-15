Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A25CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B2696151E;
	Fri, 15 May 2026 09:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb-Q-LxztJxm; Fri, 15 May 2026 09:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF3261507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839170;
	bh=O3/khjfMCpGlGcdtbougwNbEb0dpd14UfMUXC+oTseo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mV6qiJLLaoZMYze92u5xh/Ij466Kz48YgzlkmyaoSa5Cj0z0ua9T/gE6UjhUGj9wa
	 ZlvDxM1jFRGWs0T2R2LHJt8FM8Dkkb5ReBuCq9UoVSg6xAlGFLZouN13DOdX2u1uD2
	 Not2R3AcqO6Vlw+pwzZ26Rp/GiBYcZVekkca5aLdGckfrd7DIwKo3dlnztFNkqYM7N
	 4W+IQnqB+Lg+Ke1v0RHt8g6ABTxk6Z4LQ2FqXZKEKo+ejN5jPNJ6OQ04Ba+ZTWR/PK
	 gi9E8WEmWeqn9r7diKoeU7Fd0Ysqhf2zp15h8VRvoptIvW1yLw3/IthZpfdKRb4JRb
	 AwoGecwodkQqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBF3261507;
	Fri, 15 May 2026 09:59:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF1A36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5375D61507
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wI3gVshL1d6Q for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AB7661502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AB7661502
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6AB7661502
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AA13713F8BA;
 Fri, 15 May 2026 11:59:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:59:23 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:59:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260512163550.3645280-1-bernd@kuhls.net>
References: <20260512163550.3645280-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b38f64735477b4815663d7e1d220aea6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839165;
 bh=WiED+Gwc7svg5VrXoqr9pEjZlZvsEsz+b9FBTdPq/iM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lUXlxi9eZWLAa47ztFpGExyGi5AMProwMXvPaU+SOcV0FAdCXAFybzjQerBjhrmkj
 GnpSYwje+XyAqLOITT8gnbul/eAuM/yUil2CVCp0pGd+7Lr7weeYQ0CQYPv8daPfG3
 YBba+04imGjswniBbN2R+8yBbajn+n9wsaeShFXrkce9R15hIu4FjoxxiV0IdWs1RE
 y+2LWnuoTYpAN4A/zVXS9mzpD2SX01a3fzJs4ze64NSAIztYCC5QhEwM2puBwCw9W/
 9UAIaRii7u8a9tj3mLqgaorzun2P0Go6DPrHnGP3j39D5wIk2IBSB2+D+n7e/5toB0
 mxGDdoD2tq4BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lUXlxi9e
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libmediaart: bump version
 to 1.9.7
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

On 12/05/2026 18:35, Bernd Kuhls wrote:
> https://download.gnome.org/sources/libmediaart/1.9/libmediaart-1.9.7.news
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
