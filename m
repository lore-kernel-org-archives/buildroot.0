Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B87C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:24:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DE1846BC;
	Sat, 14 Sep 2024 08:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WUcxGxetSGs; Sat, 14 Sep 2024 08:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DFC3846F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DFC3846F4;
	Sat, 14 Sep 2024 08:24:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 507B51BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C0AA846F4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQrG6haPwB2A for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:24:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3493F846BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3493F846BC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3493F846BC
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:24:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FCC41C0004;
 Sat, 14 Sep 2024 08:24:22 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:24:20 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240914102420.735bee69@windsurf>
In-Reply-To: <20240914071930.1189715-2-peter@korsgaard.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
 <20240914071930.1189715-2-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726302262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UN1hKeJOo1xfkr9rXi5VvkGvctAplKJPG3X37lu4Ok=;
 b=K6Nr+XvACOsViTX8iMJMh3n8Yz2xH/0Q4JxU7AY6GQYQgX7T3+D4alc5TTmWRKG+HVF4/t
 DLyF1qFZ6ZMHQ0jxbXyXPb58l7AtfLV3zguo9suT5VwYveRRdya1tZATmhJNbdD/TywgGX
 zM8fj+UUsD4FkY4wUZODh+T+/6zI46Smzfe5hmTx6rjj5IvSLRJruZJ98/1JV6AURz4EM7
 mwQxAHsglopQM/Ou4lGBF0JmE2I5OowMpfg0S3RAkNCmdZ6NppFFu5Po4WDFqkypRP1oIQ
 CaEwlrH05OmlxW+/UCpP+t89hlULf8AOPbDVCMQAvyxWjKgS0OMUYgkhqILJUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K6Nr+XvA
Subject: Re: [Buildroot] [PATCH 02/23] package/irda-utils: fix typos in
 patch descriptions
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

On Sat, 14 Sep 2024 09:19:09 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> diff --git a/package/irda-utils/0002-nommu.patch b/package/irda-utils/0002-nommu.patch
> index bc76bd3957..019cec3619 100644
> --- a/package/irda-utils/0002-nommu.patch
> +++ b/package/irda-utils/0002-nommu.patch
> @@ -3,8 +3,8 @@ written by Mike Frysinger
>  https://sourceforge.net/tracker/?func=detail&aid=3132056&group_id=5616&atid=305616
>  
>  nommu systems cannot fork() as the hardware cannot support
> -it. irattach uses it as a minor optimization, but it isnt
> -necessary for correct functioning of the utility. so add a
> +it. irattach uses it as a minor optimization, but it isn't
> +necessary for correct functioning of the utility. o add a

                                                     ^^^ you added a typo here so -> o

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
