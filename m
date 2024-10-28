Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A22D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C87607CA;
	Mon, 28 Oct 2024 21:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrHYa6lngH4k; Mon, 28 Oct 2024 21:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E302E607FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E302E607FD;
	Mon, 28 Oct 2024 21:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC2734EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7555840621
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGf9MBwKtStp for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C989540613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C989540613
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C989540613
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:43:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AC4D1C0005;
 Mon, 28 Oct 2024 21:43:06 +0000 (UTC)
Date: Mon, 28 Oct 2024 22:43:05 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Andreas Naumann <ANaumann@ultratronik.de>,
 Christian Hitz <christian@klarinett.li>, Zoltan Gyarmati
 <zgyarmati@zgyarmati.de>, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20241028224305.138c39f5@windsurf>
In-Reply-To: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
References: <20241004210919.3699625-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730151786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q88Od+IlBlLOtpiogsOOoVyOAYavyWcG0NO9zedTtAs=;
 b=bksn0DxvvP7cgpWzK820uNBAIfwTEcnlkmCecp3/aBEGzecqm2LCtjCwrb2YrKU5uu9YAT
 LolXLJVHYejVTRPa5rgLt43TpJwLgrL5Isdri0MUm+QIKvdAp4Qplm/htDxNuPhBpobQgl
 JEXrMMnrLslwmkcvDGLLcE3OBoX1mljN1WvOXs3hamzFdJYFI351brt6+nQLZMukWUctml
 H0E2K0i/HCGpokR8lWHTa2cmts6UZy7w9njRM8G00sY5D70HHE2mZ+kv+eSiAGoUTk+V7p
 4w0KCsZCVxfiXMLbKqvc+ZxZmcNp1hQYsHaWq2AtLNck2tPW92KHmL2L3sbd+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bksn0Dxv
Subject: Re: [Buildroot] [PATCH v2 1/2] package/qt6: bump version to 6.7.3
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

On Fri,  4 Oct 2024 23:09:16 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> For details see:
> 
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.3/release-note.md
> 
> I have removed a couple of patches here, since they are included in this
> version:
> 
>  - CVE-2024-39936  (qtbase)
>  - QTBUG-125066 Configure fails in qttools if PrintSupport is disabled  (qttools)
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
> Notes v1:
>   qt 6.8.0 is going to be released in a few days, but I think it makes sense
>   to do this bump anyway, since there are a lot of bug fixes here that likely
>   can be safely backported

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
