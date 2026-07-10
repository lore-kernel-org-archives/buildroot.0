Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA58C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDAB60840;
	Fri, 10 Jul 2026 16:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNcm4z1RCqE1; Fri, 10 Jul 2026 16:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A277360693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783700934;
	bh=TUrnk1JFr864qQxJI2PUScOMZU0f12DvlN8XtlBFT/0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s6Y2vGbB6Fw1qJu2mcfC2W/Jb/C4Xkj5djplQ5g32Qfsua077jf9rfaaLQ5kvBcXJ
	 nW14vdp5WaPXW1oI/tdOuMhTCaZj0vFZgGTZAPNmY3dm3rDuAqOabnkVZK7f8znPM+
	 rvx9zq1/ScV29R1zml0Ph8PDpma6Q+p9+GKksYk4TkibwtvypV8gD6MS8P6E09T2v1
	 XerN1p+xm26gqvAML/N4A9o9bGiGb94CSgIwVDYqhU/xFv/ytkh0Wkt1X3XnEIr2Qu
	 dLEQGoIURwYDzMxJFNizVbaSxcHKGUr0GOhXFsFUKXsqRlaAXm77yv9SZi0NnmJl3u
	 JU9KE0hT+4yxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A277360693;
	Fri, 10 Jul 2026 16:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A271A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BFA380FEF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZCWc0PWFLJx for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:28:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB8A680F24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8A680F24
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB8A680F24
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:28:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0739213F8B9;
 Fri, 10 Jul 2026 18:28:47 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:28:47 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:28:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260707185207.2387124-1-bernd@kuhls.net>
References: <20260707185207.2387124-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <92970db0171d49a50a0a85052f18e884@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783700929;
 bh=fLWU6EwjhMxiaC1Y9VJ8M6+wKw9pA9vRBxNTOKn2Y3A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Evx8bxeCJvJ4vxoIneB6wB5M33FbEkEE6PqnCbSs+ggjWMVTV3LkdLn+0/ZiuPKjA
 6VamkT0jc5z86SaEn6n++Rg4Mx5Xa0PJ0NEvSG1j1B/vGGCNo5m4Wfn/jmYu1G/7nI
 S50TDx999NmAJqNmONv88tKUMQ0Lup3yGP/feldK9sN/K9WLaPEzkcwt7HbhBLbo5n
 WXRb3Jiqg6YGnAKFezIkL6zEfem3WdJvnfUrU1433YmLE5gdVZdBMUjcrR1mZp494W
 Ne2OH+S6TSyaJZX9BH+Kf18RXoKexHLM4LsNLupCDibjWQfBzRf9Ou+226c22Hec6n
 8bCfbzDtrLHpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Evx8bxeC
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump version
 to 2026.92
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

On 07/07/2026 20:52, Bernd Kuhls wrote:
> https://matt.ucc.asn.au/dropbear/CHANGES
> 
> - Security: server: Don't allow -B (accept blank password) with
>   -t (two factor auth). If run with -t and -B a user configured with a
>   blank password would be allowed to log in without pubkey auth.
>   
> https://github.com/mkj/dropbear/commit/23ec78285639edf068d86bb96f91cba755039740
>   Reported by nvidia
> 
> - Security: server: Fix parsing of long authorized_keys lines.
>   The remainder of a long line would be handled as the start of a new 
> line.
>   In the case where external programs add semi-trusted public keys to
>   authorized_keys, a crafted key might bypass restrictions such as 
> "command=".
>   
> https://github.com/mkj/dropbear/commit/8d8e1930b866eb44135ae393a793cbeb03b6b9d6
>   Reported by nvidia
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
