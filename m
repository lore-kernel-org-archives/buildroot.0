Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9ADC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 16:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655FF40CE1;
	Mon, 19 May 2025 16:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDX7d3iwZKlC; Mon, 19 May 2025 16:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D6540CFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D6540CFC;
	Mon, 19 May 2025 16:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEC46D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A000240CDD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRB1cqOwHRaq for <buildroot@buildroot.org>;
 Mon, 19 May 2025 16:52:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB4A140CDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB4A140CDE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB4A140CDE
 for <buildroot@buildroot.org>; Mon, 19 May 2025 16:52:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D056C780368;
 Mon, 19 May 2025 18:52:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 19 May 2025 18:52:46 +0200
MIME-Version: 1.0
Date: Mon, 19 May 2025 18:52:46 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 arnout@mind.be
In-Reply-To: <20250505084839.3872523-1-neal.frager@amd.com>
References: <20250505084839.3872523-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <91da5ffae5ea8e9533931262f528f830@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747673575;
 bh=JYnpunrDspgMqriuL/TuFn/rtQTk/IvNp8tAIhvA4gA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mgGtgB7DqIv9Wo5N0j6q12hEe37osKqhhWf7m5LNJETxnJCqWn0pkhK0mqYW9EQ4x
 zpT3erSsQveLJQ1HXPlUlAd4Ps+LEDytJ9pl8a+1FRi7XGUdvLwb0mYAyj/cFMKSKv
 I69eRfLZwclY0Hu0DDQcYUHRdKYbVIoKfVgE3BtxqB9PEeUSDvl+eUUv/OLAkStAm4
 7aRRZt7Q6/LuATJxDchpY8wt01Ulxhk8V2ampr/Q2421kabFyRuSXwhuzYWBIrABAQ
 sz7jBAIgcioMjnR8V0CKkpsgcU/NLNxwVZLP/Wz3w8ee3i7E3ZVnVKlUK6Nfl5E6fk
 DT34XsR17Dhmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mgGtgB7D
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 15.1.0
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

On 05/05/2025 10:48, Neal Frager via buildroot wrote:
> This patch bumps gcc-bare-metal to gcc 15.1.0.
> 
> See here for changes:
> https://gcc.gnu.org/gcc-15/changes.html
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
