Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58985CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908654097B;
	Sat, 10 Oct 2026 12:25:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqbfrhWOoLxY; Sat, 10 Oct 2026 12:25:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B1C0C40965
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635154;
	b=TpeR/i9qCQPPAt8UWftUmuPefonpJLeXukZDpr8VomRLh//lZ9Lx3CtoZ8YMcbdc6XIL
	 dJVkPp4EYICcy6fKzYoHKX3Qf7Bek9YpKjWSNTQoop2l6/J0RrrqlfU0+ikVC7wXmCi1o
	 jbOe7wKdjPyMq98x/TP9MlIcR3mOF8VOd4vPb7zNvRTvdw8fZ8TWA0Qg3jSpStsnhpvtw
	 PQhc7zCG8z/JGZ+aIT5Mq7xSX9qKsmSaFp5QHzabofTnKqZXQsVGAVzDGCOBkTJrkQ71x
	 QvOVzzk1d2z/lq0f3/O+fqfTQuLWYMOIxTRGXQ331ArMhGe5tYQCxFnTy86RLEkQnYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AKRJatNOPcu0KaF6fOeWSdABTqCGSwwL/Nq5Kd7uBMw=;
	b=eO2u0trvnEL/gy9HUIjzS6VqMICq003gKJZc6QDoAxsSOO+UwVHxg7yUxmROGncrL2TS
	 aOl1WxIgSzui+Bh8Ht2+AH+tBBGuFpAZzlqN5rJIp5WHMVWAKB4woqHnZ3qF6mMxZrNzi
	 waUi00PDiZHhB4DSMdVhV7vfBiMX/owM2rv6RtUicV7QCBJdfFhUnpsKftsAd8WYxLreu
	 mqGBvu8ydDwBEcoJp5AHVkKAcLAdiETp1fhTvVfd3VOVf6hci98ibAu0/nBBsDB4bVpiX
	 weHXKYUovMuQrojhCGSS5Uux5Zh2xl2xb9sXxUrjJgPfexoE/omokLEhpSqne28d0Xg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635154;
	bh=AKRJatNOPcu0KaF6fOeWSdABTqCGSwwL/Nq5Kd7uBMw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OCgXevrcKY8B/Y6eZQbwDJrn7j11nj2kYXl2SBHGOrqsR3vlrNhskTthdZYsARfKv
	 dEEzwT6c7L5ysG5X0aBknTNF9Kmh8gUgV97wphHx4C91q4WyOZYst3TfjmrT235f0a
	 0oetPujklNgJKzUZ276dzNJTmtmKS5el+9sEnXFFrBRUbC8Xap3JP4Vb3ob9SZdiQz
	 Qwnv4bZChBM2sMmm1lyFqlt1X4jNrGnkeg8wR75kv/Xt6/nxzfxUyWcMsAwSQti+ft
	 HURnEwLDVZjVkqVnFrVJYF/SFYJERrRZ3n8XBw9Tvs1hxBBXjvenqWK1DfZfCGdoL4
	 LrmwUXCachwfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C0C40965;
	Sat, 10 Oct 2026 12:25:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 70CBD22B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62C5781155
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qbNAMz56Bjt for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:25:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6001881154
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635152;
 b=L15GUMrX+3mPwjasVGUcGANzhmEXwCku2/YqpgYvgNdiFNeaHhWugyQtEk0mI+E/uh8G
 302xT7Z7tEpNVQRwYPf21cbqGi7S+yCju1LZh2zijCA08O3vzgdTjslsRaCDdtjJIpp4K
 mjBfpgzU90SwJ+RLjCmSV56HylAKASynG2DaTlBB1YogILeIQrY42vuNkBpyOdI9UtOOG
 KBx0WzxLvwbeF9CeAkY8I7lMB4stGnQgmi4wZrs/oGUmZblmHm0tCPktd1p9lu305TPr4
 EsH6O3eP7jJKcigq1OOFh4DnGQ/K4/AxCT4mF44CPmehyr8wqJk+q7wc/Emx9hOOxXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635152;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=iYYUIAZKyLLqOJhs+aPgBV48Tm6jpaFz6GwhzmTRLF4=;
 b=XSCzaJjazpvsdpcLkRDL95tpWWjLB+UA6puv0UN+RtDQ6DInbX4428EGKdStWCQypzBT
 mGcaEbMOqeaCJHWlOrl/CGKMuFxRPCdvAujyPKNO0M545dWqY9/fZu3NGgD6ggwQPz1Pl
 DJXAvpGNwlIZHcpNhlZBRzefhxAE7+u1N+ogWB0iZsh9EtzqkJFUJ3yei3YlKJx0C/54m
 un5se9WthDSCqrlD9Bb62TjSm+JORY/DllUFss/azRvzGBrAnfXsCsx7WXHQu/+4ZMbEc
 +9+4+BE4iyXvvjtVv46z6BgtyEtAhUfM1Y0CEGVi1aW8V7j4uehXd/+b63n+KIV+yfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OaTaFgr7; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6001881154
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:25:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2FA0C2003D0;
 Sat, 10 Oct 2026 14:25:48 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:25:48 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:25:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-2-james.hilliard1@gmail.com>
References: <20261003224447.744966-2-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ec1f0c4d13a7f0f704afae2650987aab@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-chardet: bump to version
 7.6.0
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the hatchling build backend.
> 
> Add the host-python-hatch-vcs build dependency.
> 
> Update license to 0BSD:
> https://github.com/chardet/chardet/commit/64eac3b1824913a001ce255f766a54d423fed5c6
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
