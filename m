Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED5E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA7E80B6C;
	Sun, 29 Dec 2024 21:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODlLCr_ompGv; Sun, 29 Dec 2024 21:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE37480B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE37480B77;
	Sun, 29 Dec 2024 21:50:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD6A2CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDC240604
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp3tU5qC98yX for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56746405F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56746405F3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56746405F3
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:50:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86BF460002;
 Sun, 29 Dec 2024 21:50:27 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:50:26 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241229225026.3d7b0bb7@windsurf>
In-Reply-To: <20241104211536.640566-1-ju.o@free.fr>
References: <20241104211536.640566-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735509027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwkXSa5DaKQYn6PRYtKnkVogp4V/mKd1scssII87eH0=;
 b=OZiOrWSo89YC67tHr0idZbF8ECn1rmMslH6wvgFVeaOrLHTcKo/cKO/xMeOG35nlfFKf6F
 rymJsCbGiWcW5ikIN9qLAM5H5Ibm6l8Aw0ynZDM3I4ZAU6HtpNjsNe47DK1DjN9wCjQ5DV
 +H6FEPOQ7p3Fw85ldeY3vrlqxF0JEvwOZ0Xp24lwK2eiKmZIK4+9I0wD569DwwFz5A7ToC
 WcIodWrEmpQGwhhjfdUv3/CB/WZLvvP+emHX9/mxLxKU7erF61wlfJdcOaxUXNj+ygm5Yy
 Z9EMqKvvh6wNA1evzXjg0MQH7dBFjM3U3+v8afO5YnFQvJYhBzWyr2m/j2z+rg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OZiOrWSo
Subject: Re: [Buildroot] [PATCH 1/1] package/opkg: add optional libsolv
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Nov 2024 22:15:36 +0100
Julien Olivain <ju.o@free.fr> wrote:

> opkg configure script supports the --with-libsolv option since v0.3.2.
> See [1].
> 
> Note that the opkg internal statisfaction solver is beeing deprecated as
> of v0.7.0. See the note in changelog [2].
> 
> [1] https://git.yoctoproject.org/opkg/commit?id=bc2d3413e7dd61dd0001cc30b7785880c26eada4
> [2] https://git.yoctoproject.org/opkg/tree/CHANGELOG.md?h=v0.7.0#n12
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested (compilation only) at:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1526813066
> ---
>  package/opkg/opkg.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
