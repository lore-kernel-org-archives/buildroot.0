Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1076EC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6FF04014E;
	Fri, 23 Aug 2024 16:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWu80l-33mEx; Fri, 23 Aug 2024 16:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B69A412EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B69A412EC;
	Fri, 23 Aug 2024 16:46:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 821F31BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA2941278
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87WTI366MQL8 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B849412EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B849412EC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B849412EC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:46:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C4721BF205;
 Fri, 23 Aug 2024 16:46:26 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:46:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240823184625.6fa61813@windsurf>
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
References: <20240822182050.65230-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724431587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CyNrXRVsZ1jg12g67JaM/P0eUiGo2ZCVchKIl2EfYE=;
 b=gyKwWCuWGk4rh8iPWYxZ2yySuQdEdsue5XoCpavhAoIDG5rjMqWwlUpuZuiLZIUOuHfr6X
 rn+Fw4BZ7exMDWL5Y5SOlY0fxTRYIlBrCvYJW9xG40xPUlTc3kZuoK7xx6bnTCGmgtFcTL
 L+qAQ+/xbj8y2sxRG7sQmlQX0UnGJ/YFSifv/HHZcfRHpme+nOULraEebaIkNqw81X+ELr
 e9JpVZRcl4xTkhGj4djXRrtrISbX3vYyLtAGqtiKJoXRB2Y46p3FGBIE4yhk9I6gBjednC
 psNCiS61NPuVdFPK6WRTQJZ2rk3o/sXCK74gds+45WTMjpl2ALcRzn00AqqB1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gyKwWCuW
Subject: Re: [Buildroot] [PATCH/next 01/13] package/exfatprogs: bump version
 to 1.2.5
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 Louis-Paul Cordier <lpdev@cordier.org>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Petr Vorel <petr.vorel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 22 Aug 2024 20:20:38 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/exfatprogs/exfatprogs/blob/1.2.5/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/exfatprogs/exfatprogs.hash | 4 ++--
>  package/exfatprogs/exfatprogs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, series applied to next, except the libtirpc bump (already in
next) and the libcurl bump (applied to master).

Hopefully the libv4l switch to meson will not break too many things,
let's keep an eye on the autobuilders in the coming days.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
