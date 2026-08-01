Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE22C5516F
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 09:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 556E880834;
	Sat,  1 Aug 2026 09:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ogv0rK7RPcH; Sat,  1 Aug 2026 09:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8896880D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785578182;
	bh=btBT51tTYHJ+OLsoJqS5w890gN3VQUaKqirYeaKOBvU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MnxKxDBRgUzlygKrsE1ZSi0PmGhiLf9jAp4bReEOz94Ts1MITfJHwhBwa9Dy26mV0
	 UnX+xHlB6Bn165kjOPOoM0B9jVBUYMeeIsVgpP0l0vmw3NJMQJUi3x/s1Zd7x4105n
	 HqMSWySpV0tOuHtplCkaUoVUHutiMLS9kNFlMNx8xLPT+RHglenU405tXorwtYrywD
	 6RjYAneTEvApeLGjNzTrwTMjcf9CVWqinCOZTcmiFCGQMDo1gReKeKZqa2p55jbNZk
	 NlQbikeOxaJ5I+5byLSs0NBVstPpO2tbEqbgrJdXeVyywfiSr/iX+CNyWPDqyDKrFw
	 v3j56f6+0ApSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8896880D91;
	Sat,  1 Aug 2026 09:56:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0FC31344
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D316E80834
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Y1E4kWReuls for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 09:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9593780DE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9593780DE0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9593780DE0
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 09:56:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 908C019F734;
 Sat,  1 Aug 2026 11:56:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 11:56:14 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 11:56:14 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <am2u9u6kKC5O1kFl@waldemar-brodkorb.de>
References: <am2u9u6kKC5O1kFl@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <bec8eb8730e1b7c95fb334afd4f509f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785578175;
 bh=W8Mlyj6WzIvhaBmIHTJwrhm4RtkXs67QYQOSQkCudU0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dPNPmEXVn540kJ2AtefOnMBFsIGRuwPLtvBqP7Eup9GHR/PQr6BlIUHGd3KDHJe9H
 ud+qG4mDNOr6KDKRZdwE0W1Pu9docU7lgGXxid3rpYDp6qjsz9iILXeW5FQLof/ns8
 PxhOA0VLNEMkvCFO73uf92RC2m/nOf8sFdAWaMrS+g5/AXd7WxKG1m9graISoKY81L
 jnsA1U8KQiXJXJh/WRzs8FhUrwQGDbowB5eWVlnYllw90uuppEVDIA31KCY2qBF68J
 V09o9KYo+Cd+S53GOMzUYiBmzmuEAmsovYrJIz7dVg3cpyq7zbPB5PiKXzy+tyf3M3
 VVaytbG2gzyNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dPNPmEXV
Subject: Re: [Buildroot] [PATCH] package/atop: bump to 2.13.0
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

On 01/08/2026 10:31, Waldemar Brodkorb wrote:
> See here for changes:
> https://github.com/Atoptool/atop/releases/tag/v2.13.0
> 
> This commit fixes uClibc-ng autobuild failures:
> https://github.com/Atoptool/atop/commit/5e853bba484d22620e8b6f97bf329da3075070b5
> 
> Fixes:
>  - 
> https://autobuild.buildroot.net/results/f98/f983d97b232a45ce4e176d93684fffcc771daa44
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
