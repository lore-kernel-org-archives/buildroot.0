Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801DC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A2681004;
	Wed,  1 May 2024 20:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSqdWd51GI6S; Wed,  1 May 2024 20:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818C18121F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818C18121F;
	Wed,  1 May 2024 20:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF761BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77D3D40328
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_Fq2u1v6TPJ for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 248E540132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 248E540132
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 248E540132
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:06:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 133C9240004;
 Wed,  1 May 2024 20:06:41 +0000 (UTC)
Date: Wed, 1 May 2024 22:06:41 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501220641.4303d7b1@windsurf>
In-Reply-To: <20240420143618.1809745-1-ju.o@free.fr>
References: <20240420143618.1809745-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714594002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkXEX3E8qOF3hKeykSbAFlKLR4Wwpw2sd0QqZbwutFE=;
 b=psrcqbsuRocCw7DWQiu+FZoCCHmvDvbb4P2Tg38blOr/tA4tl4WI5sdthuw9ZHqCHlBw3t
 puent9bJQLl0pEMMP6W3vLOMKLB9Cn3f6gIRl4oMQuX9DZ94U58poBSLa2d44pnUJWH8fB
 qumjmZ3yaAtBHXdUU4f6xuR1frDM1GR1flJP9bkGlPgbnawFZSdv8y9Rj1Z0iU2PfOWO3K
 aRq+/MyS6zJykdMYzOYlLBF5a6Q0pIK7GCQPSCASuU5FoNZqD1BwZwvnetIiys+s1iprH+
 UIz5AkDMb1UcLB0fUH7CiDM/i/IDpd1k4fa9mWMUrhj1TlNOuhToQmhC9optdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=psrcqbsu
Subject: Re: [Buildroot] [PATCH 1/2] package/fwts: update _SITE url to use
 https
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

On Sat, 20 Apr 2024 16:36:17 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The http URL redirects to https. This commit updates this URL to
> directly use https.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/fwts/fwts.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
