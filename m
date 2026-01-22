Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C5D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EA8182151;
	Thu, 22 Jan 2026 19:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAH1Erlw2emB; Thu, 22 Jan 2026 19:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E2D8213F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108997;
	bh=LUk1P7M+YzoUoqZwAJ7bG4LxlXN6wtsxivB6yVvoWuE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VY9Tmm6UdhumcVogk7uaG8nmu3xm5DTPFkG8xcWQP+P5JsyBhogeMqvr9Vm4WaUIg
	 VhfJzueMLi9IrC6TovbGSJCSVJBeybnHtIzIYAT9koLmpHua0yqJAoPddFswfe7sIk
	 rNhKNvJ8tsk9XPiYNnLxITRnpQ3j7m/MLisDhz+qvnl4zUnP1DsjAgAir8ZEtV+zgV
	 3eXlXFjxLvZfpm/pw8h04yBi4fAsrLcd3pcrVeROxI4woLp95gunX0GBQWj2nHCuQ8
	 hDTY/RFz7Rnw/wZA2BWMHzvGFO52XKspTvdh8Rai0IWAzN9LQ6kgpTZApiNgUaT/5L
	 4W/ZuRp+sFBKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E2D8213F;
	Thu, 22 Jan 2026 19:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ABE64DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F3B6407E2
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69Vi1e4M2StV for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4BC68407E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BC68407E1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BC68407E1
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:09:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 23D222003C3;
 Thu, 22 Jan 2026 20:09:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 22 Jan 2026 20:09:52 +0100
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 20:09:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260121180719.47597-2-bernd@kuhls.net>
References: <20260121180719.47597-1-bernd@kuhls.net>
 <20260121180719.47597-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c9032bd66b9fbd641b5743adae7c4420@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769108993;
 bh=7ySgFMJ1Fq0fusYCBg5ykq6EVCuuCsJR1qiq5Gm8zro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fng/bvVBNFEOXe46kQfkBVKLon86kwWjl6YaTMT9qFaFeLhFtSxknho6icvUGc5Cv
 RCspu1oS+r0Gsms/5DCxn94Kucmsi3h9gcEi1VPwPc1uYBjom+bKwRNbGQA3rDotOO
 Tn5tIYgZ+1qyZ+n7J3uuwDXLGgi7S0R3XIZjfV1Tl03+3DMwk/T8jXjc1WkTAv6TK5
 YEBdpRGFqC5p4XhsjYx7hlciPfivhfozrzWsRd1C28uSRvnHlupmVZiPwe6gwcOjU+
 4Hiywo6Z03wSMzH/+l7B1wKIjlQ2pk1TavQ0bzvyIVPS9JDATOeLrFp9i0r4aqvE52
 OnsG0gB80V6cQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fng/bvVB
Subject: Re: [Buildroot] [PATCH] package/opus: bump version to 1.6.1
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

On 21/01/2026 19:07, Bernd Kuhls wrote:
> https://opus-codec.org/release/stable/2026/01/14/libopus-1_6_1.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
