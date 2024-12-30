Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2361E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 08:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA0160595;
	Mon, 30 Dec 2024 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6G7bezxsqZ-L; Mon, 30 Dec 2024 08:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A038460742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A038460742;
	Mon, 30 Dec 2024 08:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCDA2968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 08:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADBEF40B93
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 08:30:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVOlqkTpRwxL for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 08:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A3A440B81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A3A440B81
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A3A440B81
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 08:30:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8098540002;
 Mon, 30 Dec 2024 08:30:32 +0000 (UTC)
Date: Mon, 30 Dec 2024 09:30:31 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241230093031.65bffe39@windsurf>
In-Reply-To: <20241203184953.505225-1-ju.o@free.fr>
References: <20241203184953.505225-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735547432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I38KJ4jONsM7+6f6VKnJeDL0YkMMlWJReXnyaRPf64Y=;
 b=ScQxg0fzJYbT77s0LpaikpWxJ6Gm+2umKO0OQ2lv/Uq5W+m2m2cDc1GwGaWE+HmPCmVJf1
 EHNT7XSeEtYh5DltCMR5C8hrch1sAYjofwnxjR497eOUpOuGEV87nhOYXbz6F0jzRlOtps
 cH3ecGzEJQ45+GNmzqGBLezTLmi7rzVNvzynlRU89eYjMkjhsmyhwYMyfbhk9c2JkMNAQk
 jy9scdw8ZlgfNOjtpJnrDeoczQiiuK8bPTgBS/pGxlnB6bFboGTEqkAOTRaFGLb3fquCuL
 VPQs+gaZJXUDa4pjHXXBF27wmjE0eHTw+qFlbh3iaOvIpZtUWi28bcK798ei2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ScQxg0fz
Subject: Re: [Buildroot] [PATCH next 1/1] package/kexec: bump to version
 2.0.30
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

On Tue,  3 Dec 2024 19:49:53 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For release announce, see:
> https://lists.infradead.org/pipermail/kexec/2024-December/031314.html
> 
> Fixes:
> https://autobuild.buildroot.org/results/64f179d996e9111ffe7b8ad18948066ebb1c6f93
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1571444138
> https://gitlab.com/jolivain/buildroot/-/jobs/8534474708
> ---
>  package/kexec/kexec.hash | 2 +-
>  package/kexec/kexec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
