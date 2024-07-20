Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B1C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D7BB405B3;
	Sat, 20 Jul 2024 21:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpwdTKWprIaR; Sat, 20 Jul 2024 21:09:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26A8405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A26A8405B5;
	Sat, 20 Jul 2024 21:09:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52F291BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BA2E81D3A
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zefN5M4v3W17 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43E5E819BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E5E819BC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43E5E819BC
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:09:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67653FF803;
 Sat, 20 Jul 2024 21:09:00 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:08:59 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230859.78025649@windsurf>
In-Reply-To: <20240719212354.19307-1-fontaine.fabrice@gmail.com>
References: <20240719212354.19307-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Q5IDFLRhpw0NHtjUvkkLSIUg6TOIqlQekaZzYdhGzo=;
 b=kr+CxCLc955zo1isOo3vs+8eMbV66luF7y5dPbsSXMXr5tAQHXoZkNvp6bfJH7MC3pryws
 XDH9b8q97uZkJNuve7yiGaFPuz1salHEbq4XEcvnWJUyXmw+6N5s4eQpJlakQhs3vOrGOR
 F28kBszvduUD/zXkNQVI9f/yz3kEX82DPXRHHXcRi6asgR4c3dEcoc4aT+g7k/rcrsUYVA
 4C30H8v5i+E0cX6Eq5ro39IiG2Gu5Y1QGLacmekE8vVOXXZ8Xv9VSC8h0CzwGA62cRkmDa
 EO+BE5mIRYEHzRWEZra2Nlq8htm5NbkpCANOCEqy3YixskQ1WFXnjd0ptSf0IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kr+CxCLc
Subject: Re: [Buildroot] [PATCH 1/1] package/liburing: bump to version 2.6
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

On Fri, 19 Jul 2024 23:23:54 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patch (already in version)
> - Update hash of README (typo fixed with
>   https://github.com/axboe/liburing/commit/2c89b57f3d55b2e3098a629e8aabe659fd5ec138)
> 
> https://github.com/axboe/liburing/blob/liburing-2.6/CHANGELOG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-src-arch-aarch64-fix-uclibc-build.patch | 39 -------------------
>  package/liburing/liburing.hash                |  4 +-
>  package/liburing/liburing.mk                  |  2 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch

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
