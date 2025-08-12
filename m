Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57076CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 15:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D60428CE;
	Tue, 12 Aug 2025 15:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-bjhv5Ek-bm; Tue, 12 Aug 2025 15:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C8BB428C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C8BB428C6;
	Tue, 12 Aug 2025 15:02:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 955F6B8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8694C41B5A
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMR3zzRtGwuN for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 15:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E35741C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E35741C30
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E35741C30
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 15:02:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0323319F740;
 Tue, 12 Aug 2025 17:02:33 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 Aug 2025 17:02:33 +0200
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 17:02:33 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250811221238.85607-1-giulio.benetti@benettiengineering.com>
References: <20250811221238.85607-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <53469de392606850d078375881c6a66e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755010955;
 bh=n3PkK5Hzkw/n3RDlNQ3RbC/vFh47glgwDR882F5vecI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ljdlq+je5UGH1NGP3WzRegEh2R7Y6TGWFsdEMq4ufVd5V24aY2dGhG4nkpZVTKA4+
 3XcAveNqvZLWPF1xwrSvq+OKswPJ+8q/ih/c0nYy71DtLAXscmOmvKDUImeZzze6Qm
 r0IWGP1qI7Z4NjboLKWRQiQyXhXqJaMljGeju4zVPm7epobH/FvqcK4IgN++IWKF2Y
 kbWS85s4ccsgi8E0vSsjq1pXZh+w7/Mgea/hSIFeSerSe7iN1dUaFZZT2NtDdsREX6
 na2+nOy5RKqIWNOUK7ntiXVYHfBgqylRlHdaG4Ix9RI7RNJ/jYYgF1B4/MiJ8LdMv9
 l4Qn9mdLLbkkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ljdlq+je
Subject: Re: [Buildroot] [PATCH] package/swugenerator: bump to version 0.5
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

On 12/08/2025 00:12, Giulio Benetti wrote:
> For release note, see:
> https://github.com/sbabic/swugenerator/releases/tag/0.5
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
