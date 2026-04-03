Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF65E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BB6041234;
	Fri,  3 Apr 2026 17:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwLLSAwlFqZJ; Fri,  3 Apr 2026 17:32:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC7D410E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237565;
	bh=7vpmPe6aAn+8GVlT8dS7NjmmlLcX2qW96I1N8t6qUW0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i++CN90J+A8HF8rWWHtfbJsy0GehQRDv2KzxDerxVWMn3bcJtyZQoJyDIhkuLpV1P
	 MetI/j/IRddjzy5dQmt1TstJA1QY2zYNkkoS1RnyklpbJK9rtLLJwhefRG5WmAE389
	 vDdfrfndDnp2R313ZttiwkRCR4JEn7/qxo+akvplLPrEebTy0/7PZnUVs9r1FDoNMU
	 SJ2fnOeDS8osFL10fp/HohQCa4ZUjl+a91qbyfNWaa3LgUUcFmDCngwtO5ons2vdO2
	 cXwEuaZBJXGuXcmUawanBsm1vJpmYQJWdFaRfaEjzPYjQX/L/7cDR6rzcaxEg4yEP6
	 +sZN7hLaxPZAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC7D410E7;
	Fri,  3 Apr 2026 17:32:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43DE71A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 352C382F31
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fl-appuPO62e for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:32:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 553E682EE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553E682EE1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 553E682EE1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:32:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 42E6E19F759;
 Fri,  3 Apr 2026 19:32:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:32:40 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:32:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402175848.2779597-1-bernd@kuhls.net>
References: <20260402175848.2779597-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <4a54fed0a971e28ff5402ccc0263eb0d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775237561;
 bh=fRDY+ghGGFbWOBq+vgwrOwx8KXypw5d69PM+3CDnl+Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tylzi5zdwpo/zrX6yOjq/mQz3e6wdaevenGtesckCQELt6TqLxTePt/ipdUsd1KAD
 nxPkzfHlD0i/l9KsvJm6lP7w+VEC3Nk5VTnc/wQvYWGCBJP937Foak35/0RZrhPW2s
 leSpyVLJbu5tsm+8Uq+5mw8f3nDcgVIxjKVsKRETo+kAah9HpxfQKmg60keJyA9idY
 lpKxoJJIAqwDfTBzdH3UlV6cEavjjBkyD0liDn5Skvr1FUx8D+FQkEG4qx7H5DB9z+
 IRU8HME2YfnBWImR0ndkxbmFsWiVya0wT99n5qnah0DkByezncESeo4NRdqbDl66+j
 Mn7P6Tg+O18eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tylzi5zd
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 21.3.3
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

On 02/04/2026 19:58, Bernd Kuhls wrote:
> https://github.com/janbar/pvr.mythtv/blob/21.3.3-Omega/pvr.mythtv/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
