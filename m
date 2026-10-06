Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C924FCA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9458C40674;
	Tue,  6 Oct 2026 16:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b35_vwroKvoX; Tue,  6 Oct 2026 16:31:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A0090406B0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304294;
	b=gEU6IGmrhHgOWQTuPPmYXIGgtXannhcPRtudlCRoi+fijIPTTaCbjWaZwIvUzu09ULXZ
	 o3FycdCTh4kI8BS2KGatk5dGLl5Mi5VnqK3nZJy42Dwl+OjM71+FZcmZAbHYAf7hIqi+l
	 tJTXZrj8GgDLHBgsi0Ed15m8GXIvyjFzFtJSHhO4BCQigMdXNErg5qIPIuPweAqDg87B2
	 nNYJt5eRZMF+M44F+OJXNDQvq8UOIbTGyX/sMNwwU9Cm2lqwRCxms6N1HaAwhcxrahfUH
	 HZ1Vt8OamB6dT+Tvn/Za5ukStOZzYWnwWkrDrFOHBYU4p1akqbCw24FkMdsg/GZd4ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	b=jbNeL+5gjcrrvhG2G3FuLovMTuBllQJzo25Rt1S+grLusqQbzy4f3twyEAqxNeVSI4se
	 xq14Qql9bl5gzspKoIfua4ISgjBfDInOX32sh9s1+ndhPutTQLEKruIu+ugnb2yj7583b
	 DazZZh0oUBWBUrIgRzApFEsmRxj/ekgR/cm3oySjYxx6TRHsyz4GOMvnorslYE2WraFQl
	 WEETW7Tjjp2or53EopxeMNA/b5To+UTIy+i168WsHr4SUdO8UaQG7KiKLK9N4kTDS47tb
	 ArbuVb5JWqxoiqz+HMoa3jurrLiSQ+JMosbl1K7j3HeIZvv7IRdwR29OuLCtePOAJ6A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304294;
	bh=FeM1LIQtFjnvZneUxyIDTux9HM1UVakMnhA7CbBLp/U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q8SkOu5RYlgyXKDWgUv6T8RuPzciHIKHE7oIsiWVU7Q+X3Pq1kgIcLjgffsLrXT+z
	 CJdlqtZu1uzBoVxy1nLOFe2ZgOqScSG7+jT29dv440KKPbEOxST5CyKob4cOiXgGcH
	 fGAUuFxSmpLKiLrXUpjx3qlWXUP14jIqFYqpGSC8GEzRwaUFkCRiB6y9+vKSqEwcIz
	 tegBs60tAqurXKdcSkajv4EyGFkUnhqmayRa5CtQ91DtICBckOwGpFeQvg7MjhgVLe
	 si5Yt9VysmbnjEHt32lc1fSPncvKf4Yh94bEFilc3bp5yVRamq3lf36T49CUO98tZ8
	 CiDSs7OrU6Q3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0090406B0;
	Tue,  6 Oct 2026 16:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA69D317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A027980D8C
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAzPN6vJaBLk for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:29:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D730A80C73
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304169;
 b=f3IZjYtTp2FqJpUfVfCfZ77H7g50vehu5rhQJVxcyF3hbPW8fVIjVOdD4wEKBKhdP5Wo
 2VZ1t81dpYriI46DAdxT8EyoeogDPSiUkOYjxNjgrorCEn9875mFrrj95O3P/0/MKLdNR
 lkb5IBqaz2PO8kOrWjUiLUZaN8aRPRj7pv1aYjz7EJ4G3TGvwyHRGRyzQLBNRomo9Oqqv
 4plKC19AzDKr0kW0+2tHwQevSLkXBEOaQvdxKosDK1zXlbK149g0nOJdet0SdAal+BeKh
 i9tVZFTxd1MLqjRE4U5cumBRpD1qB5DVH8EifR+DzGfji+wbeYbiiFRY0dIIR6yL/vA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304169;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=396Yd0cDXtHL5UJquEEANIDjZ5YaL973TXF94IgAf08=;
 b=Q36kwpt9hezQvJDNBimkaqUI5DL/04B7O8Rl/Tzm0bIra/Y0AVZpRnckB6EbJVW7ysHr
 ALdXRRZ4gpzknD/PcebBb423niJXHcErJxWu/yEKwbWtr8rn72l5GQ/RFeWYAl/pWpaQr
 VbkL/ywlDtLe00rFGghkZRwaEZpiLCudbn5ZWIdjR6FMsRTTc6sm/zPvW7C1cexBdaHef
 Npl0A0GwYvfc7BamZ5qF59kiXKhGX/SAAxmwseOpMjxN7/OCP75Bm+Q1pTmHCQHGgMd5l
 c9u1q8UovatPepAMnCCDSEZAg0x5HgeG95ELa7nng7NxSnO6gKTxQtm932kKKBCPvRA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=n3e+xRCI; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D730A80C73
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:29:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 945965FFAA;
 Tue,  6 Oct 2026 18:29:24 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:41332])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:29:24 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:29:24 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Ralf Dragon <hypnotoad@lindra.de>
In-Reply-To: <20261004201853.915471-4-james.hilliard1@gmail.com>
References: <20261004201853.915471-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <bdc628e0e08dd2fa1a886c72162c8a32@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyqt5-sip: bump to
 version 12.20.0
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

On 04/10/2026 22:18, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
