Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C755CD8C88
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 06:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B4684A24;
	Sun,  7 Jun 2026 06:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFy80hicfBhl; Sun,  7 Jun 2026 06:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB21849FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780813591;
	bh=jZNPsvMXNkc+FlBNljPKvnwolAyeMkx7mpqQsGye6Rs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYHYmJoIcUadjycoeUCnbB1Xw+sIZKAHTCDheF+/V5u5U3UgH6k+xmMAxvPK0dIZu
	 l/hR79SPEtHygGI2XYtVXDFXrxHM1NNunAFfItx9IbY4AYYllgf8dIP4hCfwnz0QuQ
	 a4JO7sBE+EPUdqAxPi/N83cwcnyog/Dl0vkzJhImWZpUwmZ3s681eOOs8xWSZlVt1z
	 S5ehEkHtwPKU26KM+ohoILzmK+jiAFshXkIfv4L/9aCcyQ2eiE9Q8EefP8gMYUGwrE
	 y5sM8uGlvDcHdPtZ8ZELdZB7UJC+/SM2jyGJ7iA1/VUY5UOREDynrrstseEUo973Fv
	 TJ2BXLwmZU1LQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB21849FD;
	Sun,  7 Jun 2026 06:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E58187
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 06:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6318B61AB8
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 06:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3AUn1VPnS7m for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 06:26:29 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD68D61047
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD68D61047
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD68D61047
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 06:26:26 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6FA0CBDE2641;
 Sun, 07 Jun 2026 08:26:23 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 07 Jun 2026 06:26:23 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260606182032.3803327-1-fiona.klute@gmx.de>
References: <20260606182032.3803327-1-fiona.klute@gmx.de>
Message-ID: <cbb32ba62892442e1cbbf79c0559393f@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1780813583; bh=tXguCufVMy/XHCl1WduRTCfF2jQKBQ3spOxjLddImMY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HuGsdsyK6GNclEk2M1IMKt1WX6zWW6QbG38MscItG5WrDPHF678tqAY37wadMjt7+
 rx8jQpBLLimoS+Xu2R7SKFsWCxYO0niJR32wt+EuDHenGrosCE6S0qtVxDU/AlK0fj
 AvNBpmL1LQjoXsO6vF3WykS1rq8tbPQXLBvZsxSc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=HuGsdsyK
Subject: Re: [Buildroot] [PATCH 0/4] fix shellcheck 0.10 & 0.11 warnings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona, Everyone,

On 2026-06-06 18:20, Fiona Klute wrote:
> Hi everyone,
> 
> this series fixes shellcheck warnings that appear with shellcheck 0.10
> (as present in Debian Trixie) and 0.11 (Sid) to prepare for updating
> the CI container image to Trixie. With the current image "make
> check-package" still passes with the patches applied, so they can be
> applied at any point before updating the container image.
> 
> Most changes are pretty trivial (the mdnsd init script a little less),
> but only OpenRC has runtime tests, so tests from people actually using
> the packages would be appreciated.

The changes to the mpd init script (1, 2) work as intended:
Tested-by: Andreas Ziegler <br025@umbiko.net>

> Best regards,
> Fiona
> 
> Fiona Klute (4):
>   package/mpd/S95mpd: avoid unnecessary exit
>   package/mpd/S95mpd: do not wait for exit if sending stop failed
>   package/mdnsd/S50mdnsd: rewrite to match current guidelines
>   package/openrc/sysv-rcs: fix shellcheck 0.10 warnings

<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
