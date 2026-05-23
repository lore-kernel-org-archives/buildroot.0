Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001ACD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D09981E12;
	Sat, 23 May 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7wy7SXuxSaU; Sat, 23 May 2026 15:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1767281E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779551645;
	bh=bhbe1CfMH/lRr3N8OWnAp1shdpAypPpi9mRJr244/Hc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MzVzLX4XHt3rCsr49LJYNs6S7pI3P6XD4s5TmlkNBLQxNE5QmFIdVU56SO6MLZZ7q
	 1UFxYj7dhGxCmk1fAxsEwuc8BaKf+2q3ZHbiUFKRE0mo3/fbV6+dcOYCIgwROIvrBW
	 xH28KOp33XoXw+XKZrSVGTWOetLR4jYL+3rBV/emS4NcXT3XMYdEhASFKuYnxQNZk+
	 XyoBM1cBo1C/SauZX+K6LbGy6UcbcUoG22LphuUUvDb99WzwapRj51oYEOWdmo8Pca
	 5tgtXIpkroboclQbuWbcyXbeLz/OvF01UwenxVJTPHbH8Oo5QScortuMCc/dAD+Lrq
	 gnRLwmuQhwx4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1767281E0A;
	Sat, 23 May 2026 15:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF8FE263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC79E60811
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNYUtbl5IpMy for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85AA6605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AA6605E6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85AA6605E6
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:54:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E958C13F8AD;
 Sat, 23 May 2026 17:53:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 May 2026 17:53:57 +0200
MIME-Version: 1.0
Date: Sat, 23 May 2026 17:53:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260519205958.1155754-1-bernd@kuhls.net>
References: <20260519205958.1155754-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b5805514dd3e251cabf0b0f32399c749@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779551640;
 bh=6rhRl3KQnpREeHv/FvKptrkP8T2jsB0S/8hSaUkxZtA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SJYwJtW8DKp/bTeFhP+TMgMboBMZ82VkapEw5eCANzmouk4B/OU+i7vIO0Ysqs2s9
 1/eqIecJxZr4FtV8va2Kr//yoFg6jTxdCTYH8h3zUre4NvwV+YuO3SvNRpb5XaXASz
 mqJC6Q3HXTmptYIsI4G1baTWq7bEaEFUzCQUfCrD025z6wPxgxmsMcw0LmWKvoik81
 fqndcPrvK0E6yg0WLEi/1hsb2yqfpuKqXERnjR0ShQ3Mh/vfnirFbw3iRwN/88qWir
 /aMuSG/ahrGSVLvg0q0FcjZezk0dyNvrTW12URb/aN/Xmu61HytCzOmqWVBWmHHEDr
 eBpDmU2Jagtfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SJYwJtW8
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libffi: bump version to
 3.5.2
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

On 19/05/2026 22:59, Bernd Kuhls wrote:
> https://github.com/libffi/libffi/releases/tag/v3.5.0
> https://github.com/libffi/libffi/releases/tag/v3.5.1
> https://github.com/libffi/libffi/releases/tag/v3.5.2
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to copyright year bump:
> https://github.com/libffi/libffi/commit/8b0eab28cb45c6862b30f5cadfc1a7fe996b072c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
