Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BAFC25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5381740316;
	Fri, 10 May 2024 11:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzANW9RxdQFH; Fri, 10 May 2024 11:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB9A40288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB9A40288;
	Fri, 10 May 2024 11:23:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5276C1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E969401FE
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BaQgTLf0sbw for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E663942450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E663942450
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E663942450
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:23:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5B24FF804;
 Fri, 10 May 2024 11:23:20 +0000 (UTC)
Date: Fri, 10 May 2024 13:23:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240510132320.18d5cb7a@windsurf>
In-Reply-To: <20240427083402.10703-1-bernd@kuhls.net>
References: <20240427083402.10703-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715340201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDWAu1ILVpVQ9mK8iLs0oLTWkWbBKQCrhWUzCukaEt0=;
 b=j/hJQLeTdjPBqRmKjoq+v8gEFhuHcivJPW/FU4WsXtCb23b2aVaP+FBDTPpSBWtj3jPJNg
 me/jFjpPUrEhzIAHddedFJWQChsOI/Wc7J2FX1TYaHziPoHqJ0xTMa+LPOyRJ3OojlN2oL
 ycP218INko0REPsYH+g2cat/+Qnd0vvMiz1p4UtWK2kPGOnM4qXSe8U+tB11ewtxFatd64
 kBVIps22weM3bXVl5aDu1BGTRHSUOEbM617L42yjCl6I5tOF7ZsUwKnjZF4ZHKm59hLw3s
 fFDYw2jiLXkQnZSMvMMVnoibkfd3toSJNVr3VBcWqt2/NByG3hpWEbBe0ZjABg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j/hJQLeT
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.0.6
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

On Sat, 27 Apr 2024 10:34:02 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://blog.clamav.net/2024/04/clamav-131-123-106-patch-versions.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
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
