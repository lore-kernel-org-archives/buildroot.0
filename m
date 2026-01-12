Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E30CF45B2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F06C60B9A;
	Mon, 12 Jan 2026 17:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ_6v46m8RXo; Mon, 12 Jan 2026 17:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2C5060B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240075;
	bh=Bd7WvUnNkLXE9OQu7KvAbgMvVZ7ERXqG4KZsB72fqD4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AuiIuo1J/lSL+JPh+1FquJWxFF27uPeD875deMXkpRPLLxaggylVu77ujlPi7HtWV
	 ZqkNoodOWOV6FsVtjvcudfEOssrhuaoMVaztzaEuuepBvb7uWdx+PLwOBrx0qaL+3Q
	 5F8fkukGMvFoc38bfQUCTMDTWmLDa/YlrO2fk8pz8XtZb0S5fF1qDNYrXb6HMchk39
	 O0qsV+zfmkQMZwH12F4zR4oEAgt1cn8+S3PVyvNLCpCHtsa78Ni4ctYIvKLBNbktw7
	 zUxgwAATdh7oEu3Wk0mePrm9AZdF1u8YnOhaD/lXCbQN3djfPIMxdG/iw5qDyGkDs6
	 Bed1a2P83os8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C5060B96;
	Mon, 12 Jan 2026 17:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 51F451CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434BA60B96
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbQ41yc2AWoh for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AE2360B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE2360B95
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AE2360B95
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:47:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4B2E219F574;
 Mon, 12 Jan 2026 18:47:48 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 Jan 2026 18:47:48 +0100
MIME-Version: 1.0
Date: Mon, 12 Jan 2026 18:47:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260111112021.3551404-1-bernd@kuhls.net>
References: <20260111112021.3551404-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <3efa7e8b3e30b078d1dfb9a6e6dff367@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768240069;
 bh=B2qQAdc3Np16JkVjrYVGKJaBpWLG7LcaWUmtECMX/AU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C3FuCxoO83PMvSKFGOZM8TnnlZvAw6JBzHumIHthoafiyvktkfmYniFcEsU50c2+7
 /VGyK0E8EDZB+79chX9rEOI3SQ5MDTyKM0+lPdk9vkHMR+Ev1Os4Nhdk7dAx38/ttD
 uF4X4EejYdZyFDHzvZkCdA6sk7uHQsQQGnVs7PObmNHo0UBHqm8WhdOa4kkwsp68Lo
 UvCfV1b+iwV37WOHEa2/0heZ+UBNpzhJcIT4ylDUEb01H+IzXYVk/brr5hQFiMfrAj
 CwzADgsxaqECV+QHeQRt3IFQ3smWWTdSppqAm4znzQK9XzoiuNq+e2M2maKcG8+c85
 UakbSBY9ETZ9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C3FuCxoO
Subject: Re: [Buildroot] [PATCH 1/1] package/uqmi: bump version
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

On 11/01/2026 12:20, Bernd Kuhls wrote:
> Removed patch 0001, not needed anymore due to upstream commit
> https://git.openwrt.org/?p=project/uqmi.git;a=commitdiff;h=ebfe8b47b366092457df7a7f631c8f746e8455fd
> 
> Updated license file name due to upstream rename:
> https://git.openwrt.org/?p=project/uqmi.git;a=commitdiff;h=a043a7407bf602cac66c9e7bb2b81aa2e50a6993
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
