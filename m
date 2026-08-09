Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBB3C5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 10:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A853440544;
	Sun,  9 Aug 2026 10:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OforsdmKCMvt; Sun,  9 Aug 2026 10:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EBE340387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786270877;
	bh=x4whb8GQwbw1ZFlxlMFh1aqQIxqhzMQobzUr6nvDqhE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N+nd3Bcx4P385+/n5+6hStCm/e0TXr2tvuPDR4I2YzEyMggecUbyVMGb5sE0q3Wm8
	 QaqX++cES/OjQR9EltymDSO8qQkxlZ/XcgWsOt9coAryWCGclh/dvDVyGaVVbwYnxn
	 R2HhOfyqBEpQ/j58g8xvZtHDVbx5McuNGmpEnIIK8LMdb3V1L7kw+ekqcPesPMyt0O
	 Eczrgfm+0pAtGUTF7w+Sjx+YYx0RI+a4YdbL/VlBsIUUD0Prt/EA9U6QsQcjURPa1Q
	 ztCm3CRfNHL+KTItq6HcTJiC/tMJEi0yR8rsWaGkKIvtFLKmtVhlOEhV+mtTOZmrfj
	 whePCOAcpU4cw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EBE340387;
	Sun,  9 Aug 2026 10:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F08C710E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2B5780CF8
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srJc_izGt1Jy for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 10:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECB7E80CF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB7E80CF1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECB7E80CF1
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 10:21:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B7497B0054C;
 Sun,  9 Aug 2026 12:21:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Aug 2026 12:21:08 +0200
MIME-Version: 1.0
Date: Sun, 09 Aug 2026 12:21:08 +0200
To: Marcin Niestroj <marcin.niestroj@grinn-global.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
In-Reply-To: <20260713182555.3147249-1-marcin.niestroj@grinn-global.com>
References: <20260713182555.3147249-1-marcin.niestroj@grinn-global.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <3301ef8b3af129b2e36fe30a16bc39ff@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786270870;
 bh=+8QtE3rSvC6OWHmgU+kVf2SkKqKz5jf5oKd2A/YfHYQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fQjYAqsU2Px0gZEAQiKgn37tEZfljXmuBkaSawt6uN6c1Wo2NiKgihs3V0WrWrMsR
 Dky7h5suUa2TNAVQ1C/K3Y1QHds1wEwrNR8dEaqe/eI1ptiWvz0LhTcTjXlxd71sWu
 xtrdqwN+YNM8oQPjc1IQ1eAV6Z/eu/F79zs/KYiL7m6+KJP8GN1pnigFkq5K54laFU
 cc6wP8WKHygl7VikjE6A2Mrf0QBgbI88S3n7I8Le/pr7jneDW3cIwAa+OZIj90Itzq
 DhRIbJPlsn2J5kgGyKKPh+m9NHUPE0FM+VGjkZrcTUhsTeKQaJZuPbNhzm1iI8PutH
 yMgX7zIuOqRuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fQjYAqsU
Subject: Re: [Buildroot] [PATCH 1/2] package/easydbus: bump to version 0.2.1
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

On 13/07/2026 20:25, Marcin Niestroj wrote:
> From: Marcin Niestroj <m.niestroj@grinn-global.com>
> 
> 0.2.1 builds against Lua 5.4 (previously excluded), so drop the
> !BR2_PACKAGE_LUA_5_4 dependency and the corresponding wording in
> the comment.
> 
> Changelog:
> https://github.com/mniestroj/easydbus/blob/master/CHANGELOG.md#021---2026-06-05
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Series applied to master, thanks.

For info, I simplified a bit the runtime test by moving the test
scripts into a rootfs overlay. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4456d899d0481efe7e7994090d0b709dbba47f39

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
