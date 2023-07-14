Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FE1EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A87AF405EF;
	Fri, 14 Jul 2023 21:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87AF405EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qy1Dy0MVoNsj; Fri, 14 Jul 2023 21:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1F2B405B9;
	Fri, 14 Jul 2023 21:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1F2B405B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3B501BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB290417D0
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB290417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mLYPxkGpciuk for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:21:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001E8417CD
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 001E8417CD
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:21:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C0D60004;
 Fri, 14 Jul 2023 21:21:32 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:21:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714232131.27c0bbd7@windsurf>
In-Reply-To: <20230714201830.504801-1-bernd@kuhls.net>
References: <20230714201830.504801-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vkPYFZIxch1MLPo18hdfVWpKAokRknhiVQs6CjMxyw0=;
 b=SWzS27bKBi4JM7fDt2OZe1GKL0tKWnFsLjLAa5j638KcnOJ7IYSrguNjXME+annahjOHlK
 rHxq+Q+8vK2l1MYtgBIlnhTDRpkMleNAeY9iMJ/MJyodqJeeuWwVQNCkRqUpsIDAf+Cxjp
 a1CMLZWTQNH3gj/FjLb03sK6EaxZm0/ANr2QabTauMrfi2sjn8+lV5rsKgmhGCHU59ffNj
 0FBOdogzKJXZvpomNtSF5r1eKeAEaWBCs5E3tRXT4tTWkh3j8zEEeuIZHIUaQXSW0tSPgC
 X5ocwzradWPIYQTTtQYsMYxdtNk5V8fAHXSkAO7AeGfjl1NmzC1d7G/9I8eVoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SWzS27bK
Subject: Re: [Buildroot] [PATCH 1/1] package/elfutils: fix build without c++
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

On Fri, 14 Jul 2023 22:18:30 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The version bump to 0.189 with commit
> 258c27f6335aa66ce634c93b82ab146bf65f7f2 introduced an error when
> libstdc++ support is not available and --disable-demangler was not used:
> https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=73e212b0a778c6dbe84f79b7eb2647dea50ea16f
> 
> Fixes:
> http://autobuild.buildroot.net/results/cd4/cd4ca1a2b2eabe6937cb920cda5d8e566216546e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/elfutils/elfutils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

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
