Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F1CD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 11:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43F3A8137E;
	Sat, 23 May 2026 11:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biIrUt-aFiub; Sat, 23 May 2026 11:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C0981349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779537058;
	bh=HUYsDCcWK0OWRuD9453T8HAPxPwWHK/Gn9WDyhuWcXs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OvCL3R7CpoEB97CfaC47i8DuTC4OIuxIrC1arMspsdFVWzf+xp0o5A2f4PJdcl9si
	 GA0C3cjxyAVWOKoymBCWz8AL3fcBLypfyeye1gIjSNBQsjkTxvLMBytQ/XHTQNooS4
	 pA2DG5Px681jbyRnEqt6fqHQkLscNa+PhLOgcOFCLzbCbnREeAjliWRWKeDxT05Eol
	 7u2m2LuvOB6FEHqW3xPVttBxg6b0pq04/foZyVXdl1Be4vjOHlPzx2hjb3dLh9C9HS
	 xS/I1oAyFBVWNMgw3EbidEN0sGBzcWYJdlh3/Di2T+6LcfxJLV15+H45HsHPT4kGHJ
	 oz2ALU4bu1z1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C0981349;
	Sat, 23 May 2026 11:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F64265
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23EC981343
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpBUNISnfxXA for <buildroot@buildroot.org>;
 Sat, 23 May 2026 11:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2608481349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2608481349
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2608481349
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:50:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 25B9413F89A;
 Sat, 23 May 2026 13:50:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 May 2026 13:50:50 +0200
MIME-Version: 1.0
Date: Sat, 23 May 2026 13:50:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260519212845.1235400-1-bernd@kuhls.net>
References: <20260519212845.1235400-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <084b2cdd13bde95c8bf8250254ec1e6c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779537053;
 bh=EOeOUd1swUCMnRnYz8k3m7J0H6DM4v5fxcS+woEYmZM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=knMHAvw65piYTPn962JEwwuEKyiU5oEZCL84rC/8Dc8V120B1HLV5jdUpMuZA/o+a
 VuC+jr0iC58rSdd0MP3rkfhWytpikwbH7xwuoZsbirXg7txIJYshry/bwbwRf5QgWf
 kQj4GTov3phGs6ujFrUeojYN2j9nNmko6Zo0VlMlwuTkx+SA8dlya5NVsP3DOf/sSx
 wVGQiZr/ZJkPA5GgcKfz8Cfevlc7iU04b74PJurFHTw8z+oRRym6mIEP6lAULvmJQo
 bRD1CqGE2QFjCcxwEaeoacCpr6uiM0bMqWJSQlm8VrAaqTeArpqsO0RlS4vhlD6XLf
 2GCd+hL7ZpY6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=knMHAvw6
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.1
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

On 19/05/2026 23:28, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
> "The bugfix release 26.1.1 is now available."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
