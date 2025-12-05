Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBC6D374AD
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B45436F49E;
	Fri,  5 Dec 2025 21:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BG0izToqQnPv; Fri,  5 Dec 2025 21:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40DE960717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971040;
	bh=52VZpO8pyMyUiWAp0rZyXt18J9hHOtcVZb33DFvzVXY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YGi4ma0StSzR+aLEdoKu4iD528hncg0yOG9RN4Qi0zvQfSEnXyrk4oBbHFfvT/Bc6
	 zAe9v+AfEpMObK9IuYBMnBnEXeElwJnMx5ozB9bB8PfB2E1SPw0TeJfnHQIPoSkv7O
	 xNPxnFoeIHZwTY7wQMjwkKZrVPQaCUzFqE2Kh432i3JzkhJoRCyJ6kRP7ObHT0i1YZ
	 I9++pE30lP2tLigcxuOTWx1ty/GeoPN0xIW6fxK88jLJVhG186uaS2gS2/mxm3M4Xd
	 l1rU/gYsXpM0+lPjc93MBLCdJ7TRewifket2xsQRsjkUz9UM8AN0bNkwLRVRRKIFcL
	 2d7LnX286IMnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40DE960717;
	Fri,  5 Dec 2025 21:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDEC5E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCFD4003D
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuFrUME5xEJO for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9E7240010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9E7240010
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9E7240010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:43:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 38E5219F57E;
 Fri,  5 Dec 2025 22:43:46 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 22:43:46 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 22:43:46 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20251204114409.3355954-1-neal.frager@amd.com>
References: <20251204114409.3355954-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <20ba2cc9e57d8a5b9bfcd9d5c41c9054@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764971036;
 bh=nfYCq2al6hlWTAvcOLe2+bngtk1vZIBRynQ2wbxJ9Wc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mVlYk3EW5KB/cgT0zto1Xxp1K4ov4iHeeSTOGIVC1fr2MFHrfwpkf0vQQ3rKxuxge
 dNYnDKMPk9EkxwAGFhcNAQADWh0/oZZ5oYsTlcs7IRO6Obt8KtufO5ylXMuFCa+bdF
 PgV6/eb99dsi0KGs0zAKP5Ju6pd3GY6FByE2H3j74R4wQNHz97dyzsUxJruXIzk2qJ
 BVn8c9DYO6qk8Mqx6s0FVFv2wnFtwyAa6lUflh0NBYF1/kMRvBgYDzKeErWiewYK0C
 LTYneD7vVitB0cjl81XV4nD6w86UmCxfV2sUWh5kCigr7j7IZOpxV96/jr8DC8y2UP
 LRnRttUvJN0hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mVlYk3EW
Subject: Re: [Buildroot] [PATCH v3 1/1] boot/xilinx-prebuilt: add local
 versal xsa support
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

On 04/12/2025 12:44, Neal Frager via buildroot wrote:
> Most of the time, users will be running Vivado on their local host 
> machine,
> and will generate a XSA (Xilinx Shell Archive) locally.
> 
> Instead of requiring users to create a URL location for their XSA file,
> this patch improves ease of use by allowing users to work directly with
> just a path on the local host machine.
> 
> BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA_LOCATION can thus be defined as 
> either
> a simple local location or a URL location for the XSA file.
> 
> In either case, a hash for the XSA file needs to be added to the
> boot/xilinx-prebuilt/xilinx-prebuilt.hash when using this option.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
