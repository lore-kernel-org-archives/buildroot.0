Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08CCD343F
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7944108D;
	Tue, 12 May 2026 20:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz6BSayX4o2p; Tue, 12 May 2026 20:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B1C41073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778618580;
	bh=MbfKfYK8OOedklTxc/FqAs0tDAmPwjQlVSCBg1+gXbw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xi3p6nssieC7wmdvOcz7drqQks9yva5ZfDEi6BulsBQF9yEcO2fOjk9nD0F94kWp5
	 eUjMwIZGwjHU6ivAI4LGWAHyyqmqzjJLOoPyNzPSdSkDFd6y7wSslRvLWri8yNAIvV
	 tzHj6siRi4Oa2YQ+XKoisxQctayxhsGOJ0xpmjzwTOI2wFMSTSF7bGNIf7LRXp72F+
	 UAFgjm9BYceSgbLZcVlamykfFFYLtEPVwtg9GkBwrImY5N1fOBohMhOSWLtsEqVttU
	 G8DLTwzr6upgzbKP48KtOFGevr545Npis8G1O3pjSw+B+C6pVOnXeOW/LNDNf8SJm0
	 P8r+Snk5d+XJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B1C41073;
	Tue, 12 May 2026 20:42:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E414F15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55F780CA6
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJqgcl3JWXtj for <buildroot@buildroot.org>;
 Tue, 12 May 2026 20:42:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2934680C74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2934680C74
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2934680C74
 for <buildroot@buildroot.org>; Tue, 12 May 2026 20:42:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 146315FFA3;
 Tue, 12 May 2026 22:42:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 22:42:54 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 22:42:54 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512081041.85459-1-thomas.perale@mind.be>
References: <20260512081041.85459-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <5cb9218530b37cb86f9f055c36631ca2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778618576;
 bh=vD9dFGFaROGrQqBYOSaRX6iKf6Mg7um/bTvUmTJRDzI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kzHjbJAx1N70JLfxFsdolXv73/SEMi7FT2DQhtfDp70UvkA50reluY9OqHWpHFDkH
 iY8YZzfKek6GGMYU52TH28AeZThRVFzYJX9bxr77P4JCva9Di1Y5yVoHIe7PMLE//c
 C1KtNzqAflO8gqDBE3VSgOIDtjry1LjikoT190MwUrU06fKtKc8H3EOPANRtU+UrkG
 AVPoaoXOuOK0eaJ9ImnqFTCeGwJcTOWnkrCDfM0XUpb9eDxApozl9ygtReZDcqOPjd
 2Eb9Dza+RZZvM1/j/R/m+n7YNgkzYgHnl8wlexBju2fYDcE0cx3HHhSB5LXHowNfQ8
 Ram83QP3ZSABA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kzHjbJAx
Subject: Re: [Buildroot] [PATCH] package/libvncserver: patch CVE-2026-3285{3, 4}
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

On 12/05/2026 10:10, Thomas Perale via buildroot wrote:
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
