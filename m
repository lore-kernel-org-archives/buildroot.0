Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1230BFDEE45
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 19:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5768983DA1;
	Thu, 23 Apr 2026 19:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7JuF3bDpmDJ; Thu, 23 Apr 2026 19:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF9283D8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776972236;
	bh=IHIiE4iwJfCkZ4O1g0W7DrIq0AD751NYlmC/4TUV9jQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qw1QijJzExJrQD9phOe7G0ghN+pNmW426DAAf6Q6qSV1SHhXrv3s+XQQGm9EnMCEr
	 0PCwK/Pq4Gai4weKBdfvKm3mHgq4JG7C72Upw2/qcQeoiAOY6QqaE6tqxWQkMW/vby
	 CrlWc4aKpppzdriRsp0bnW8EEigs0HBwCeDEFEYIpzBQ47JkeFBiQPWgvPNXfNj2EB
	 asEs+D8sOuyHnAqUVX9nVMDM/YhIkLCvaPs+YF3y6HVdOeGGLXpGMlxQMQfmGiEa0d
	 iZAUw/yjsbGZVfC6f3/yhTzX6mO/AR9bZK4cjHyfDeCbk+svOEQavPV6uaMz+H/L59
	 k1VvVpXaadVZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDF9283D8D;
	Thu, 23 Apr 2026 19:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A7A24D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D513408DA
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdHqT6sMGbmG for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 19:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E12D1403B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E12D1403B3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E12D1403B3
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 19:23:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D9E9E19F576;
 Thu, 23 Apr 2026 21:23:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 21:23:49 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 21:23:49 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260422233421.1804260-1-fiona.klute@gmx.de>
References: <20260422233421.1804260-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <db262fcffb4e03f7c06c26402d16bffd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776972231;
 bh=ZhTA709RiKc+fO8P/fGGbCibqKHmSMY9AzvjddZCmVg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ka3/oKOXjecu8si/3Q0fgYA1Iv9dI4QKY5Mr7qDDyBmLrORXpkzaEWeaa3YREJVu6
 wblGnAsIyomQGx3txWD7/GAXzfeL/tjKCCGU/AmaGL1+l7WYpbWzKpuXfR48iQsLK4
 KRGgeU8furImFAKwWBStiScRTf4GAelgAXMlHPwTB7bFFUfM7B6kyb3OoUUJOLfoNL
 YbKnc4S3TG/RdoTosVbHgrQUWAQKK+PCm29t+nwEwymx8BQn4uQLxfRuLmCOXLcGqp
 1uq1dEmvJBUFnIpnJvMx0CMZz4KcHNOffufOSplNqfXWKj7j1KyezADbG83L7wunsU
 cot9o2qopo2FA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ka3/oKOX
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: remove unnecessary
 autoreconf
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

On 23/04/2026 01:34, Fiona Klute via buildroot wrote:
> Commit 1c11f9020ad98db11e6d67066d0fdb2cfab27605 removed the patch
> changing configure.ac with the bump to 6.10, so it is no longer
> needed.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
