Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD73C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 16:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7110040696;
	Tue,  4 Aug 2026 16:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XevFFRRpQoBG; Tue,  4 Aug 2026 16:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2141940594
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785860813;
	bh=SGqmb/H2pHiMeOn2z83FHl1cmqEALWbVQz/GE3JFp9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a7WDgVs3zrnG6U1Bye9A+39qehdd9i/oXVKBSSadN7EWS/g6uAMWBZJ9BxQatwi8h
	 ZG9DJ1fs4lTnnRkyegFO6DJqyL662pe645EemBBQWyyxMf9dn7sAbuaryLcidOicRw
	 yWqeOwwOvGBCK7EYs133h2s0lWEoaKHVhFpRmtEgW4h/GsD5Rkxjgaav/0aQGxepTf
	 WmfsczVUF2A3EeEgZ2oYeGuluRYRDhY2TwnNGR7NPtM6brQ4ud+bfKUNwktIEM3Jnk
	 TmY7i5LDb8rSDFXkG8fpRgxP4FsTlO1X4vBKb0n0RCYwv02HdUN/TDfQgzL3UrTQ4u
	 W0gCLK4uei0nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2141940594;
	Tue,  4 Aug 2026 16:26:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 096BA350
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02CE60774
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2rHtd6x4geh for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 16:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4285D6076F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4285D6076F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4285D6076F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 16:26:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6430813FA6C;
 Tue,  4 Aug 2026 18:26:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 18:26:46 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 18:26:46 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260804130356.1101294-1-fiona.klute@gmx.de>
References: <20260804130356.1101294-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <d9472cac8edabc79997d76c0758f72a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785860808;
 bh=YTChI09N66qEC5hwDtC66iD4iFAASCHrvMOmWhctmPA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L4k3VAj5g4OFv0WeLlKu3K3mm67JMs6HDBo3aoB37BiSGtfHTuC2hhYxWcMw5aEO7
 S0vHyW3n44Nm1mLZM4QNPrhzPcEcwFANSts5J1mhDy/FlCoWbsfzOW5pfxu5GqvkV7
 TYw0oyMXJeYxYgTzq9AiPulRVhFltwAlra79Yemue4IeMCnSDvwWSXTulywSBmMI9Q
 ynxs2vgpRVyPv1zk79JLiJunjRbWW2xAPhYBe6/BBPJqgXyKpOK2Sb7QQJ03RHw9wZ
 U3y1uxSdDcwwlvTTAHVkF+hd8FHr4k/T88IKymLDtVRHEyAsRKkkWsZygF5hF8ciJc
 SQl2wvSwdSeKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L4k3VAj5
Subject: Re: [Buildroot] [PATCH 1/1] package/librsvg: update project URL
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

On 04/08/2026 15:03, Fiona Klute via buildroot wrote:
> wiki.gnome.org has a big deprecation warning saying "All information
> on this site is out of date and should not be used." Point at the
> librsvg project on gitlab.gnome.org instead.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
