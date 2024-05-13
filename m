Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A685AC25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720916058D;
	Mon, 13 May 2024 20:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b72fs1OYG9gg; Mon, 13 May 2024 20:08:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8358160591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8358160591;
	Mon, 13 May 2024 20:08:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF931BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6299A823A0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 20:08:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeM3CNjIfjBA for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 20:08:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35BE08239A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BE08239A
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35BE08239A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 20:08:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00FC920007;
 Mon, 13 May 2024 20:08:32 +0000 (UTC)
Date: Mon, 13 May 2024 22:08:32 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20240513220832.069a1b9b@windsurf>
In-Reply-To: <CACXRmJi2z3zApRQ0vUupEQVjDE0C6chEBr1F_rZn16juJzXMCQ@mail.gmail.com>
References: <CACXRmJi2z3zApRQ0vUupEQVjDE0C6chEBr1F_rZn16juJzXMCQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715630913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwucPMlCtj2kQVvAgNKS1CUQZOcN8Df7xGxxcfcQv6o=;
 b=JBbxrBESRTVtWIAydGu43R8qlXc+oBU62fjxlSmXxjLqKWdHL8XiyP0CSHTY768OYw28n8
 zb58NEjL69GX0ZYBlQCCTLcBDtWgx5uB+zbvnco2Ba6kCJLEdEeZO7NsuQqVz1GMmTrocK
 Ma7TNdWf5E1Dj9L36/SJGMrKj8zdrUoiMS8XUJnjAbfX1/3QmnL4pkDJTDnfFEhcSzDS/4
 1xrcv6ejSy/fVv2B3B+SCsirLa1CeD+/ZmGIA4Sv0XKF50x32hiEwdcR0VnAzVCuPzlDTJ
 BQm7ytVrFAlNKIHywxhCFwA26rRJU/gtJcTA2MwtJQmwUMDNsdH+T3mt1dqaQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JBbxrBES
Subject: Re: [Buildroot] [PATCH v1] package/libsoup3: bump to 3.5.1
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

On Mon, 13 May 2024 10:24:19 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> News: https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.news.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
>  package/libsoup3/libsoup3.hash | 4 ++--
>  package/libsoup3/libsoup3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libsoup3/libsoup3.hash b/package/libsoup3/libsoup3.hash
> index 11e48b42aa..139771a11e 100644
> --- a/package/libsoup3/libsoup3.hash
> +++ b/package/libsoup3/libsoup3.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libsoup/3.4/libsoup-3.4.4.sha256sum
> -sha256  291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa
>  libsoup-3.4.4.tar.xz
> +# From https://download.gnome.org/sources/libsoup/3.5/libsoup-3.5.1.sha256sum
> +sha256  c1d7cfb89832d35c271f37d544f2cfe21fa60ae9faad4a7ac58996ae4031f7ba
>  libsoup-3.5.1.tar.xz

Your patch was badly line-wrapped. I'm not sure what happened, but most
likely you didn't send it with git send-email?

Anyway, I fixed that up locally (because the change was small) and
applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
