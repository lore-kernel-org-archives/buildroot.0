Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7345F8D775
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 637F0810A4;
	Thu, 16 Apr 2026 20:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AMcuZT3V_GG; Thu, 16 Apr 2026 20:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E474810A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776370098;
	bh=WIAYEP1xyMbqz0SbU9panbwh85XsTbzmoSiYYZqTclQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WAddln/qKT4kMM+4r9sAS0THTZ0m1KVTHwh+bz80O2qWpp5gNuIQ9LPwhcpIFQprO
	 awXLblkHYoFGsIsfjfnmfuxkzK6BLORPjFcvk38AphgJbWQTA8Zi2rCg2fSCuffEpG
	 LroSOCO/OXPSoDZzmviJa4gJfws9MN+ky2r2m9Uk1tj9dowdtd1De/0JiVQw1xHecr
	 UcfpHK6tYMuGtkgGn/iHA8PD0jGS+VmjWHZxdwV1WYUwGRK7BkZoB2PZIwt7+Dz0Cw
	 Ljxb2LdOEvgZPe5CwWUD0Yi5kuKgzniNCruWD5VZfCKT64Fm5pZvkEBfTZQYpUL/G/
	 Zm+pnbJNvGhMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E474810A6;
	Thu, 16 Apr 2026 20:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02FA22F4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C5B810A6
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id je2qc4imR_Eu for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 20:08:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2254E810A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2254E810A4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2254E810A4
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:08:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2F28613F8AD;
 Thu, 16 Apr 2026 22:08:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 22:08:12 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 22:08:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260416073412.3605054-1-bernd@kuhls.net>
References: <20260416073412.3605054-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8b3b5bc98411595dd27531f44dcd22bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776370094;
 bh=W0jsWieYzEKcTZe6riQXfGykv2wAMOhX65p/8cXw+ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E4gYfQ4dzj9w9tzRxNuuIyAkxvcG071giUYHEnjjnTBpzGSee8JmHH7HflD4183Fc
 n3bjcQHe2I2bdofIw/sSCPRCL7M9cGsWSadRxqS8jbbQIzvgRah1GRVfJLNnkD9fBn
 aToxSwk4veu5xWEFup7WzPk1qrW6+ToIzqJ1yPdmDm4lyba1Sx8E2IpuIV9OpYsnHF
 06f4d7vIeSPnlQ4+WQS2+Fei7M9nc77Ldctxl2hQLZLuVsJCI1qELyJ7T6fTPEabrU
 5Lflr+LNBZ8GPVPIpWCjZg0CmvUWXIv5GmVJnK7/AZNLSJz0a6GtvjY2yUHymCNpl2
 2evEWQ6xjr/vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E4gYfQ4d
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.3
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

On 16/04/2026 09:34, Bernd Kuhls wrote:
> https://ccache.dev/releasenotes.html#_ccache_4_13_3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
