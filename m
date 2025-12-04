Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B351FD2A537
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888456084D;
	Thu,  4 Dec 2025 20:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCRnzmveqM3S; Thu,  4 Dec 2025 20:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 988A1607F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880997;
	bh=CgtqeXVXeWdQ6zxPznV24/RzU9dniAJDIKjWUveZQT4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sBCvhlgYqxKYoDZSy0//BgcSvfQcfQlgiQcjPqNqpm6vff+On9ZRZAYLU99PSXkAb
	 esSxLwOCPTY9WtYhEMVmPeZ5vAPIYY++w8nrJpzwNX98y7uTfakuvNGJoCsVGol3Jy
	 M4VA5CAFktv9OJ6AETFQSTfw9o85+nzocFxG9WluICwAYYqolzw3742D+9LGEvQYrK
	 RW2FPEqJEh2Gqz2Ofb/9nbEu66PljcFIbVdpIcPv1qmR0viGxynHHHcWUZKm7z3iGR
	 05zNfCts+Y38i2GA+jqAr+CfbJ3IxIqyfSzYn9zzaJgD6mpo4a0mBze7FmOyzIgAC3
	 iQOYnFDBvCdsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988A1607F7;
	Thu,  4 Dec 2025 20:43:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D66E31A9
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C73DD607EA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17zgKa0158ve for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B94516076B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B94516076B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B94516076B
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:43:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 78E282003AE;
 Thu,  4 Dec 2025 21:43:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Dec 2025 21:43:11 +0100
MIME-Version: 1.0
Date: Thu, 04 Dec 2025 21:43:11 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251203043535.53886-1-nemaakhilesh@gmail.com>
References: <20251203043535.53886-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7628d3bd79985373600bc07785e0a160@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764880992;
 bh=Ipeu73NHflh3wGv5HP2UBR3I38n1GG1sKj247iICcuU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E9K0PiMKNY4OBtG8qx0xAxZ08tck16fhHUS57aUzJPflYZXPzkMamyzNI0uLtRdTd
 2IfX4WkHZzJ0Xdo/um8GbkUS2R/mcKe9DunFXkTVjFESOVdM3mz3Q9APvCrmZdkIkZ
 ektLb1RY3sPk53dMuaLWiDhAmxGy9/L0CZtjXtolZ5FhhssbKhZ0SbLF0dj3P2Atei
 otQGsxmaIfmTLe1Y8Dtubw5hDuUANt2EfiHLYuEtKWq57UlpuaLaK28Wvh3VmOfiWr
 PzYLinY5AoMO7tjRiZMuW/YpIGT5ZzDNRfVsquLYVJ0rfa2WFn4lZ0WI/gk3AU3KZH
 Z8NGz2Kad9baA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E9K0PiMK
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.402
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

On 03/12/2025 05:35, Akhilesh Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.402
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
