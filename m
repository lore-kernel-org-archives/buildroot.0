Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5E0FA3750
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2461B407E9;
	Sat,  3 Jan 2026 11:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9YB01oa8bhT0; Sat,  3 Jan 2026 11:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170F3404D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440540;
	bh=9N/e8AVQcJF5Pkwa5gafbOlWfxAK2IjBr5OBUDF5+EA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VloP1sJ7V/3xMcumuU2iSg4y7KbIjbNPnb/0lwMAYLqXFkgGwb74tDdzJYyD6bug3
	 WxueL8dV0H9v7Z91rer7EwD6RmTwBkTCc1wpShXDgfQ7xKk4uxK8WLUX1H3/Neq1Yq
	 mqCCxBt2DF6NNy/nFAPqkd9yACT9gnVWAgkuAcyXqpX7caguVMcVCqiA2JFcOwZBPr
	 HtFDzjBqQ9o+OY5XuNRE5Mgf+P7Tg5t+s7Tev0xebBf5zv7fFblXdfxyCnMNGElGcS
	 uOCt+ldPxJpLnm+3KzZNL6GYy6b+FqgnD3THJZHxSonXzbC2lfjfbT0X4K/K4p5A5t
	 YkVi28W+OCI4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170F3404D9;
	Sat,  3 Jan 2026 11:42:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B7EF6440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA29B81250
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fedcwKGRlIBm for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9754381233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9754381233
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9754381233
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:42:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 93D0178034E;
 Sat,  3 Jan 2026 12:42:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:42:14 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:42:14 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103012058.745351-1-james.hilliard1@gmail.com>
References: <20260103012058.745351-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <21fee64ea14b78ae19c662d6caf4dcf1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767440535;
 bh=cl/oANHYevGP+LOWiYbgo3GPzlQq2xeDZ9iNNBeL0gs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iZOU8z6jEp6fh8caTxLw9ErHEY2aK2q/lT28k0pgrgF38CB/+NvGdRLEV2V05eDK0
 J+UWKThW1hSeqHyn5Dc4KSd4VExaSBuJouCaL/s2eMWVVKJ7xO7C8j4wqr768fiNl6
 K+eVE2mj/yiPeY6CHPPK4Cdt6qZ5cbdB0DKtlJczSHEq4aiBBrk1MrRoWKcVPAUb/G
 9XdLvGVF8ej+xHudREHGiBv9zNfMY6Iai701OnD90+rYe4qAIfv42gCOb9pQQQ0Pcv
 R92hMokJPr7cjB00svekdH0ae4d+00EaEjt55RLoYMJDWeGiWx8RtibKA5fQJHu+re
 IL7FJ+hzBNS/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iZOU8z6j
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.8.0
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

On 03/01/2026 02:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
