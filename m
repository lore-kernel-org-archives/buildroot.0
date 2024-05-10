Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2ABC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D012F404A3;
	Fri, 10 May 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WP05RpaYT4i; Fri, 10 May 2024 20:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E150440B8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E150440B8C;
	Fri, 10 May 2024 20:51:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2238A1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EA7D424A7
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ByjTx3XNHkLy for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:51:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0D8842495
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D8842495
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D8842495
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:51:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 253451BF206;
 Fri, 10 May 2024 20:51:32 +0000 (UTC)
Date: Fri, 10 May 2024 22:51:21 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240510225121.15469657@windsurf>
In-Reply-To: <20240310151036.1392876-1-ju.o@free.fr>
References: <20240310151036.1392876-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715374292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPUKYeQtXFABAfqyQG4gzAv/I0/nZ9FN0S4Peua9E5o=;
 b=ft27mnFap9iQwTo8nReO7/6Ljj10f8oeRNj4ReQTpfTkZTN4OfQoOPr9feoeIRglTuAUsi
 l9hiM+uDNvymDr6wmF4mVgK2EwWGi4CaH9wDurn5BCehgu+6+/I/81JuWdm4BWhZJnXXmt
 zedh/2rxYokQjh0Be83TzAKRy3nAftFBBeAYPHWM27zgslSFHBzaJeTS/1tS74Hy8SYR4D
 nnEaeYf4wwf78aTxpwI8vcHmHb9fFOVwB1I5wIpSc6p/z7lLMoXPKXGWNncvNFolm948+n
 VMbh7VB6KEx9QbggL8MxF4LQ3SCAHU8U5CMPkiDHv4WlW5jzXSNSqJDGrQj/Nw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ft27mnFa
Subject: Re: [Buildroot] [PATCH 1/1] package/mokutil: new package
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

On Sun, 10 Mar 2024 16:10:36 +0100
Julien Olivain <ju.o@free.fr> wrote:

> mokutil is a tool to import or delete the machines owner
> keys (MOK) stored in the database of shim.
> 
> "shim" is the first stage bootloader to support UEFI Secure
> Boot. See also the "shim" package in the bootloaders
> section.
> 
> https://github.com/lcp/mokutil
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 31abe2f with commands:

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
