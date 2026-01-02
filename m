Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5873FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 885D14087D;
	Fri,  2 Jan 2026 17:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqXdeijOBSa8; Fri,  2 Jan 2026 17:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220F840873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373679;
	bh=0ygXsuYehpB0P+sjDKadFi8m/lLZ+dsd1PlMZIOVxu0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hdmTqcwr4/mAw1RXHNh8+9bYR1mrqUmGyrlotY4dz0roHyh/aeSNG68ZmoVHkKTnC
	 +fdJmaybUAFlKTibUWmm9gL+/yYp1cMYPYn5uhtCFCL7bNFB4cWZXy/fUez4glRYbS
	 p+CxDYNQVkwUC06VhtsOFMU8daR3/Qnom2jWCQ8sgugCMdtd/RtEvAItNF7HzCnZoP
	 MA3EIziIYpVSwh+uo2nuC6pcrVWxdWOYzmZ/bIVYHe3Isf1v9HE0ejTikfo89pBTE+
	 DdcubZRGqCZxWhTXRVdya+srptNuYagg3ztjPBZ8GphapkgIl5zDAe91FDTB4KLHIs
	 aCwFgYIriBPEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220F840873;
	Fri,  2 Jan 2026 17:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 186E6351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39E1812C4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJDAK_ST8xvh for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D51780D1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D51780D1C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D51780D1C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 699E84E41F00
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:07:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EB2E606C7;
 Fri,  2 Jan 2026 17:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D202113B0718; Fri,  2 Jan 2026 18:07:53 +0100 (CET)
Date: Fri, 2 Jan 2026 18:07:50 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20260102180750.64b70f1a@windsurf>
In-Reply-To: <aPIcBESMsMyWuILS@waldemar-brodkorb.de>
References: <aPIcBESMsMyWuILS@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767373674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=tONzabGIveMELjKEo0NM/t5etZ0dw/ryrytxje9jUXM=;
 b=VhyMLdqXTOfQ7UTlUEFyg8Rym+GV7HK9VdHHHmIjZSeA/woWQde7A0XglA7mlKZTXhOFjz
 SRwA91/uSdBmpFe7KkLxVIo/eokeYQBSoN6QYKUu8VyryTwX6sIocaAQa0tKIb6Wv4bSWC
 9sCutuveZXBIsSKIIV3Bo448K+zW9og8HUCuKFmGCyzhks0BrkaR26yN6/10dgYgsciweV
 9kf3oSQJ0hyLnCVToPb3xKR97mdUw3ZtNgugt/zj4mpWwSrJ11VwFMMF+xoi4RJX0lh7tB
 PPje74KxwdpLqIjxOjAFWou3uBeQjzABVongKMJOVZd+cnHpHtKgY669+7D/5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VhyMLdqX
Subject: Re: [Buildroot] [PATCH v2 1/6] package/fontconfig: disable doc and
 tests for host
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

On Fri, 17 Oct 2025 12:35:48 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> On Debian 13 doc generation fails. Disable it like for
> the target.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/fontconfig/fontconfig.mk | 4 ++++
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
