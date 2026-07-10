Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1654AC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3F11810C3;
	Fri, 10 Jul 2026 20:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZNPGv9GLYQD; Fri, 10 Jul 2026 20:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08186810C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783715524;
	bh=lv52bKCNpswUAnF3gRo3bDlMmqmz7ADa4Bymd+7uRl0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BNSNfYSqkk5aRDxJ6osWSdyQKLotIoK0a+OQVTtD2Ob+ce1ObRigzLM5rPH+CayJB
	 FAmOpJ6wiLdPg9ukvHYT7RIzL2tNJOxZkxGGR3EaNsZ9oBOSbm0dttZFmXbj0Xswu3
	 MvISRWFmtKUXZ6DTL2SXr+a/26QF7sbkSnpdKXzIITNc6UQn7Tmkx7sE8iFBTS8t9f
	 As57x555Ks611wrMti5XJwfROkbUSnMWX7yvPe+c/Hgdy/uuA0LhiFBGoMW1re6tqu
	 lEsh7Umungdo1u3Qard4tEc1ZD0IX9DXSdWBRIF9wx1y9f3zACB3EsLvtiloJWp0P7
	 4PbeqUXk+bMMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08186810C6;
	Fri, 10 Jul 2026 20:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F71372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86823403B1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57Jf2RhO41Qq for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0AA4400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0AA4400FC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0AA4400FC
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:32:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0BAD719F5AF;
 Fri, 10 Jul 2026 22:31:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:31:58 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:31:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260704184423.2206921-1-bernd@kuhls.net>
References: <20260704184423.2206921-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <585c61bf5be600a1220756db67d713ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783715520;
 bh=JMf9pjYrKyG7Bt70nh4E1XdaTB2MY6xUVhSppJnwlgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W0V3fy9GqHfiBH95vhqrhIwU7d5ZJ7a47WmTCljubvmBY9O1id1n2VpgO2RemUvcz
 CQFtOvoJoPlm+Hd6riBoEB6t1dkM690u/qJuAhgyJa+hNERTV65t8s7OASWzs9OBhX
 G8eCEgslcaLLW83uMhT4sSagjl7vSdTvhLxmZZ8+0Bc+2Ojugu3UlttJ3+4K2sLnr6
 8rAsBcvkntnDJDaBnBlAjx+KEvPH8Wv7kDAspsSSug2J5quVN7imerxjfPzlJTdTUw
 pMBXjDC2EDgnBP+BafupmzQUu+gaCr2mDQgNeQ2Wx4EsM3J36CBM2CbiKA+hc2QV4N
 Ms1jgc3sfhXfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W0V3fy9G
Subject: Re: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 26.2
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

On 04/07/2026 20:44, Bernd Kuhls wrote:
> https://stellarium.org/release/2026/06/24/stellarium-26.2.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
