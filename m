Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051AE69165
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 20:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8267760AE1;
	Mon, 22 Dec 2025 20:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RS2W_fiOBo0i; Mon, 22 Dec 2025 20:15:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDCF60AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766434525;
	bh=WD/OTCoGSDxiQ9qz8wqcVKN4JLp3ZIlLw4DnED+jhKc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iLsCgb/FCl+K1DaIur1SR7AauHj5bLMjkZ2WTIY5YxjwkR5GyFRNdzSPNP9W7Wveh
	 zbX+yADtgJbeAHl24RiniVCfqi56gO4ohsMDrhlW5QKZOXZUqK/cB97pUgSpOwbBQi
	 H24vq8njGhJKBgEuw7W4BkvWqRURJahoLAdZ1EkAR34mePOhH4cXFEAPziSgRpoZVk
	 kQAKQwTU+MKumpc6MkgiWLFdoBtwk+sJHdVI+Hc1adTWPGw20lM1BDotOGYHoyjpmX
	 AZEIzuxfjukkBh4jsxg5dcze85AniNK/BdAC85fMNyqj07LPnswrDV44s8lihCaZnt
	 HQTgMupDeGdkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDCF60AD3;
	Mon, 22 Dec 2025 20:15:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1618119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E718228D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lP6huFeaId45 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 20:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDFAA82240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDFAA82240
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDFAA82240
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 20:15:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D2069780372;
 Mon, 22 Dec 2025 21:15:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Dec 2025 21:15:17 +0100
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 21:15:17 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251204134742.406507-2-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
 <20251204134742.406507-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <7e067bc248f149089b3b9215afd4c1f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766434520;
 bh=gkJBFqhf5ghd2HXJWkKCxBlG6X65XmzdQj6zrLNAtRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LSl9oPmv1lZYCv2v8QV+3dFAJqDHgqOvEiqpwysBPlZoZdbQYu5/CZj4AsR3iAjKO
 WPgOVmNeOGTk9bevh+ZzBbYYmHJoKGulIWSi8araTVUi59AcnXnRoArFAWSry6j6qe
 wDUTHPdS7UBcD8NN9QNWSTC66btsSxWhYng8kGatsKEQHnKHLofGk6RvBFZ0wDmktk
 ICmWwyRfBgpBcs3qxuwNQFes+xCTPYTf0xn3qaGScUVRD7O31AbdmkDLmWvoblr1NX
 /RVp4V1Rxk1wZ44hSFj20I/3GolqCCBDE69kRyzag+z3bfaiMezv/oZEUidjyofBS2
 6Wf+brpbm71eA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LSl9oPmv
Subject: Re: [Buildroot] [PATCH 1/7] package/dpdk: bump to 25.11 version
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

On 04/12/2025 14:47, Maxime Leroy wrote:
> See the release note of the new versions:
> - https://doc.dpdk.org/guides/rel_notes/release_25_11.html
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
