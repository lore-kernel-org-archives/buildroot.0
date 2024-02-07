Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C297FC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9101981E61;
	Wed,  7 Feb 2024 15:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwEt0V7vi2Nw; Wed,  7 Feb 2024 15:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B36B181E80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B36B181E80;
	Wed,  7 Feb 2024 15:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 866391BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81AE0613F2
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXZyMO7lqm0X for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74AF960D59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74AF960D59
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74AF960D59
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:40:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A6641C0004;
 Wed,  7 Feb 2024 15:40:49 +0000 (UTC)
Date: Wed, 7 Feb 2024 16:40:48 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207164048.65fe5d46@windsurf>
In-Reply-To: <20240112192154.1005937-1-fontaine.fabrice@gmail.com>
References: <20240112192154.1005937-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707320449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0eg22jt3FxEraYDAgmU0A94+DYXoNT/jqyvU47ikS4=;
 b=Hdvx044Fl1Tic66BQ9g2BqBr6dxBvPYCRaAju8V2eX6fuVkRxY40NTRPYSwhZarX9wcc81
 bRGdTndcgs9PsBbvDimjhluhyk3kd2V6R6GfJHBeLC1VMZzT57VP6ZyLcaxPA/KElJI6BP
 zR9uRfCsS0QQIluhTCba+iqjDVfiFSuj8P3XrLRvV+Lucw+rDHYGf+vv8+QfyymgYTtgAO
 lValgMKIjdDn8U5mwsBxDgN2svOkKYfuDoqWTbFfKhFi29bzU3nPPrAE9RxJwea/JAcrWm
 eg+DViORhmQtVOnvpa8OsU/Bwem2gH67n7LRZsNM2xyPjRJQXcio7cn8NnnIdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hdvx044F
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: drop -fpic workaround
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jan 2024 20:21:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -fpic workaround is not needed since bump to version 0.166 in commit
> 794ae61a15f7a36e199b62b2e5224cfc41bdabea and
> https://sourceware.org/git/?p=elfutils.git;a=commit;h=133509fa406e0e8d4d0f0632e2ee8c5e32dcb010
> https://sourceware.org/git/?p=elfutils.git;a=commit;h=6a20e20ea9f122aea86533d28a688e7bb2812aa1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/elfutils/elfutils.mk | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
