Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E16C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 16:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63D7040985;
	Sat,  4 Jul 2026 16:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1dKjJ0NsqLQ; Sat,  4 Jul 2026 16:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575854097C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783183199;
	bh=csgE3UyeF86a9CI4qEqVfrkjAbTsB10FarLgaNgB8O0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bhmxOqoq9otRbNjleONh8BnFQdfOqJbRFmteuwO3lHjldEldP/HNqUjjDvotP/5Nm
	 yiHra7sMdlFlvwVgu9OOQeQuYQQ6uF79eecYSFxZVBW+YxmXhBw1sf+M6n564Db8Kc
	 J73nSK8W0cnHgW2V1uvTOcJvJRryGC7ZbOiHDvrvZUigQeYP7X18Eiv90ODOIyMOo7
	 sHHm/IUEz1rBXT6YE2V9nM50JWbLNX6JClVGXBKVFZp0b2QpNr5/0+P3w/dOH9yhBY
	 PTDwikjpQlo4nZ/F9ggJUj9vFYSoVNo/r1d9tQI29cPURKYVrz+qrzU3fskwFZ0FbB
	 NfYMFO1BtHU3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 575854097C;
	Sat,  4 Jul 2026 16:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A76A363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 606E540129
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7hoqz7yjqEu for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 16:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83E7540125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E7540125
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E7540125
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 16:39:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D7D13B0054C;
 Sat,  4 Jul 2026 18:39:52 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 18:39:52 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 18:39:52 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260703190314.3687595-1-bernd@kuhls.net>
References: <20260703190314.3687595-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <2b47dac6fbd7daf643f85210e262e388@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783183194;
 bh=eadpuTWou3j1u9Qrs2IZBPMUfnpVRYR0y5R1QepBnq0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VIWzkvxn3A6CKjSrwESoHzrE2ffm+nxOng7p5uWupvTiEfw+Ye3sQ04+nJpf70EAz
 GCZYPlILCa7YLdphQM/QdNqn4FxRj5dOie3FbfYKK6u5+bH/R60MfbvsNXnvXP3Ajf
 kwsnuQJEi09V8TbHazoHfAKKwgFTMdLjYZOX2BRwV+e/yXwr9sDokHaa20Y5i1015t
 mUrcsfyeieHqo4at+NVxgli6AnTSNMzF9thXC8IOmI99eCavV0mLGvDr5z1QcszqLL
 o0Tg+Q0U6FNQ2jj5bm/ADunH0AHlnekxIz2oDMGWOdXu/t/ObZfjeIsFouPR8VnoNP
 JNEqfvEJKzqyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VIWzkvxn
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.3
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

On 03/07/2026 21:03, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_53_3.html
> https://sqlite.org/src/timeline?from=version-3.53.2&to=version-3.53.3&to2=branch-3.53&y=ci
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
