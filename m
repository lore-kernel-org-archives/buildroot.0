Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93CAC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89A0042BF5;
	Fri, 10 May 2024 20:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irSDIuekcuWG; Fri, 10 May 2024 20:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 925ED42BDD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 925ED42BDD;
	Fri, 10 May 2024 20:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DC331BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09AC84231F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hd3e5u67S5W7 for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A79914231E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79914231E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A79914231E
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:56:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8A591BF203;
 Fri, 10 May 2024 20:56:08 +0000 (UTC)
Date: Fri, 10 May 2024 22:56:08 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240510225608.40978be1@windsurf>
In-Reply-To: <20240308182637.37011-1-brandon.maier@collins.com>
References: <20240308182637.37011-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J9IgC8++yMHRXW4NEKIzRHsGcLR3BOIr9kocDodZKTk=;
 b=Dsd6L1w+x013ZxpH+ydp9CzsAwdxih1PZXNclGPlTCj5bglumGM8DXvLS9ootWCJPvnsfu
 2J8PPwpKMnJiE5vIWfsTEw44yO6fch1BgKNu+PvgVOq7egZShs/JeQq8TTA4BQughcsJB7
 pS7cqGJL5itAayvn4zx0TsGkzCzPWpLhHoAf58v4UPJBFQEJE6y6L/Zd73sUUT2cjwTO68
 qem+HkXZh8JtwX4tNeqbqAplHHXRgILKVHAJyRw92A2YtOTQ1QIyFlOOsFVGUlLOez75Cn
 oboecbofKbKyEizHFBFbxtkC5z4TIWwOcUL06xoNOmKyD9uEPma09Oo/UJJRlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dsd6L1w+
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: require host gcc of at
 least 8
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  8 Mar 2024 18:26:37 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Ccache 4.9.1 requires a host gcc of at least 8.
> See "Build-time support" at
> https://ccache.dev/platform-compiler-language-support.html
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

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
