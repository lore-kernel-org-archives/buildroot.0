Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12647EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBABB60B44;
	Tue, 30 Dec 2025 18:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6ASZtqwEfBs; Tue, 30 Dec 2025 18:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AEF960B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118533;
	bh=HnL6Xk1+R0gRuN4f1f4vGBC00GV2T6pdZqQGAD4V/+M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=js7wQGWEp3VcUWLHUSQlR/yujXiXBXj8hhMc2G0HUF+5Has26kMaigvAeVLWgWf7G
	 WQe+9FLbapnO41gKrnTn9Iq1PcVsTNr6r1uwFVlAkmLlGVyDFYqiZrA4WWvMj3Aahb
	 UK++kHJ8qSYUgrCEVErxE+EG+wzMFVoGYZ3U9kdHcAtRbujrY5kez674glFF9J+fVt
	 4n0O6o3PEOo7Z91816X6Kp9jyGpnx3mafXopvP/VbPstbUgAwry8XQVhZNhX83kV/o
	 cvds1ZzLTod+TQOhUaznVL5VWFzB1Qu5yMSqh7ezVxVWR/49WT9KWgHr2xpusYT9R+
	 3tzPpVuv45UgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEF960B4C;
	Tue, 30 Dec 2025 18:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D0FC177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3309560B4C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTkZqrsqNd28 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 698AF60B44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 698AF60B44
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 698AF60B44
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:15:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 91CE44E41E68;
 Tue, 30 Dec 2025 18:15:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68A7F6072C;
 Tue, 30 Dec 2025 18:15:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA1FE113B05B3; Tue, 30 Dec 2025 19:15:25 +0100 (CET)
Date: Tue, 30 Dec 2025 19:15:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>, Angelo
 Compagnucci <angelo.compagnucci@gmail.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Mahyar Koshkouei
 <mahyar.koshkouei@gmail.com>, Matt Flax <flatmax@flatmax.org>, Romain Naour
 <romain.naour@gmail.com>, Simon Dawson <spdawson@gmail.com>, Woodrow
 Douglass <wdouglass@carnegierobotics.com>, Ben Boeckel <mathstuf@gmail.com>
Message-ID: <20251230191524.3ae254cd@windsurf>
In-Reply-To: <20251230114545.2236640-6-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
 <20251230114545.2236640-6-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767118527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rjBYXTv2y1dUe+mA4fQyYe8Ys4d1uo8p+b3xpBLbp04=;
 b=xqwAz3CN8RrDBuH2xEClo3sCxw5aT3A8diXFJuWXpa0LfP5aO957aG5Hsdxu8QggTmWkBb
 XDNUngpxXj8T17K1T9UPRbFmKTrIhdGrq1XU0jP932X7pszx1G6HarbYtbYmQNgPyrpDAJ
 S4GEOodvQzJamdLTjX2OLEM8meXhHXkqRvYXTqP2KIc5RrgBd0UT4RjSpabORqKU2wk22S
 INtMByX5Trx/BEQAwSwd1kvLMFAHalz4hyk5QI9PIteFekGFJLeEDuv5x2niYZc2I8mTRh
 1pvn5cPHCXg8xNgsFQTSMyvG0vYer3WuO+eQyBb9hl8is6ohwp6OoOvitvqE9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xqwAz3CN
Subject: Re: [Buildroot] [PATCH v9 05/19] package/taskd: remove package
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

On Tue, 30 Dec 2025 12:45:26 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_TASKD
> +	bool "taskd has been removed"
> +	select BR2_LEGACY
> +	help
> +	  taskd was deprecated upstream and has been removed
> +
>  config BR2_PACKAGE_SCONESERVER
>  	bool "sconeserver has been removed"
>  	select BR2_LEGACY
>  	help
> -	  sconeserver was deprecated upstream and has been removed
> +	  sconeserver is unmaintained and has been removed

This change belonged to the previous patch in the series.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
