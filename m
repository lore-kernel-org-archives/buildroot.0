Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2829FFC72AD
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 13:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D60406FC;
	Sun, 22 Mar 2026 13:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pTRNh3Ct0EA; Sun, 22 Mar 2026 13:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8AF406FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774186313;
	bh=H2yV+9J4/ucCvKkKoSQ6fW2WSknj0DAff+/NReDzTvU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DEmADkVNHAEpD/ie3Cj5UdOvSt9Q5g7zOi9I+pzg1PfG8tvjbU5y4M+0NsKuwM+wk
	 dT0chWL2QRftiHxGw9whwEZn024mFqRx6a6clZNd2Spx1pa295auGf99OawsTyr0Df
	 bX+I5JcWw0h0B/xZwjJcXX7olGjieyv6bl6pH3bOzEeV0siYYtOeSj0IddC4G95/hU
	 mOF+2rcDyM/abFarbngprVWi/SGOq6bXY3CksO9WHGAzWi3tPQPpCIJBJMsVtDCwBq
	 jmOAGmtY56lPMH3V4vtLXqLA7bu/xGXzWJue33PLKKn8/RnKZGiWcsKrMZVQF+DF46
	 T2Fju37qLICew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE8AF406FE;
	Sun, 22 Mar 2026 13:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7935353
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 13:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D97E406FE
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 13:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znlL8mASOFJh for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 13:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55DC1406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DC1406FC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55DC1406FC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 13:31:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1509D78034D;
 Sun, 22 Mar 2026 14:31:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 14:31:45 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 14:31:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>
In-Reply-To: <20260314170441.3059259-1-bernd@kuhls.net>
References: <20260314170441.3059259-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <62e4d5ad859e7eaa97cf8da0469ea68f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774186308;
 bh=P7YwB5zO8d3qzrtB+7K+XSNfcWHJG4B/2IRKXU2UV3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HoVRo4N8br9eDDYK6nSDQ/nK9giW9F7q49pM3tVMvE8GDQQl+oaBarjD462uSsTej
 14QPmROvfY4v9n+DWPbztqLJnfVXOlxeAgaJCUztNElDMLyBqt5YSDwvqmwjo2jlGA
 k5g/q5UI5Gb0DHTBqhDWAaGvFZzqSW9pIdBXa0M7Ftla5GZ7WtmbUBkDY4cL4A2OFD
 dV043SVbetk2WmAylzfCJ1RQ0/FvA3rbGfCLt2WXX3eJQsHS7PJr/m7m/CEe2PJC8n
 nxCU8/WjXL+c8dJi6EJdwNRrtHd1zYp5txGl9lPtLmf6nHhaKyQDthos0i4ZczcsVK
 YawE4iodGXOQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HoVRo4N8
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: bump version to 0.1.1
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

On 14/03/2026 18:04, Bernd Kuhls wrote:
> https://github.com/ikwzm/dtbocfg/compare/v0.1.0...v0.1.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
