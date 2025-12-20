Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE64E6748B
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 22:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D75694085F;
	Sat, 20 Dec 2025 22:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NY_5Tq4lI83; Sat, 20 Dec 2025 22:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B6F408C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766270267;
	bh=YteTyN9adynHblD7gEI4e/4H5FqgDcvATYsSOJQImKI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HlJAXtzLlAZxwWU+ngFruayRQrxbtLKpFecvR0SeP1uc50JtbYTp0BdaN6JZZr6ne
	 btXAnO2ug/6EjmlzDmdla2Gy2F/ztpQQzfQPYWqDM8IwAZiBP5Ecv2DEs+JKN5w3JQ
	 dOEsPuUVpZNgcSGZ5Hd0Ny9G2sJdr1c10FhwR8rt98jhyELUaWXVyZMI/WkNIWEy+R
	 m4N2FlTKks6PzsdM9aVx5DLheuYrMyVGlYea62Tz6gaj837GwAZZT50vPZPvwgmsRJ
	 7MXjyyeUakLaNrJ1z/YMycX3F07JVbSEFNAqkBODgzwzpQYfpW6d0NPnWsEm+VgURs
	 V3Cn/RAW4CUkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B6F408C3;
	Sat, 20 Dec 2025 22:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E74B923D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9A3740572
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDKVorPKl07b for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 22:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC8A940541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC8A940541
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC8A940541
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 22:37:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5D072780368;
 Sat, 20 Dec 2025 23:37:40 +0100 (CET)
Received: from 2a0d:e487:415e:c872:3368:1af:2d0c:bc81
 via 2a0d:e487:415e:c872:3368:1af:2d0c:bc81 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 23:37:40 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 23:37:40 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
In-Reply-To: <20251116202053.3276072-1-fiona.klute@gmx.de>
References: <20251116202053.3276072-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <ed049e33cbc7d1ca058b76267ac32a1e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766270262;
 bh=Vh701pqIXacGis6vfkagiyD61ijcxSuLhDCWjeDMqoY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rWT8AzgIONg7M8bjBMkWJUYyylkMLu794PnDV8wY7ufq1WtntVeSho7G4itMlytR8
 nSAs4pU0QU9AR6x4vyYztJFuS1dfTbqIG9LS34+MqR7PbZFn6JMidPlq9ObjOsK+/+
 5tgrteb4IuVd0NdLru376y6E24wOPZnf6eGsXZRWPVbqhQ+VU8hLiQqQ8Wzh3AguZd
 JpEP+Ujl7n2jAEzrUivyZP7gj0nIYDaja9+q47sQ+VGuyUcrqGPfVDCOoKKDJZDb3h
 dWCtPVYgZCD2gre3s9+D33tHNasSulh56jOoQc87HDdQC1PE71q7vaJNxBarq5u4+o
 EWJ/jBQf/q+uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rWT8AzgI
Subject: Re: [Buildroot] [PATCH 1/3] package/uboot-tools: include FIT print
 support if FIT support is enabled
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

On 16/11/2025 21:20, Fiona Klute via buildroot wrote:
> Otherwise "dumpimage -l" produces only a newline when processing a FIT
> image.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
For info, I did two minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/befb6ae81d274342d316061a648c2f276e44db23
https://gitlab.com/buildroot.org/buildroot/-/commit/2dbe71dba6eb5a813b2685bc5136d78a132a1580

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
