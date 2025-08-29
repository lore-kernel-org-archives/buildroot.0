Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E6BCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8BB38422B;
	Fri, 29 Aug 2025 09:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i94TLn_2LR_P; Fri, 29 Aug 2025 09:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAD6B84215
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAD6B84215;
	Fri, 29 Aug 2025 09:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7FCF69
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B97E36110B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VugVu2cjIWeI for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE51660E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE51660E47
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE51660E47
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:33:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0990F4E40BD2;
 Fri, 29 Aug 2025 09:33:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D476F606B9;
 Fri, 29 Aug 2025 09:33:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBD901C22C97A; 
 Fri, 29 Aug 2025 11:33:13 +0200 (CEST)
Date: Fri, 29 Aug 2025 11:33:12 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20250829113312.46070790@windsurf>
In-Reply-To: <20250829090842.103239-1-titouan.christophe@mind.be>
References: <20250829090842.103239-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756459997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k/N2/9YWNGbzUP02aGA2Z3wGGVHwfJLq0N1hTCabqNA=;
 b=jWTIW/o3bHkcSz28KYHwj/839TcCltQKhZdGrq4LAmZIetgsxhMidn0PrPz1G5TD3f1n6e
 3RmCuuw+TY3TuB6so8OVpzABDH0ANL3oGo1vNBwGm8toopH75wpcNKU56iir4ihf+niOBo
 ZopFrwW4B7kSGsBqJWNkE4/t8pzD8roZXpvwHTc41s/tszbnyQ5wiABWoyuuPhSR4uyCKT
 oMSZC9wf1S4zFGjnfeFI3kcEm60PZju9BQcvwqoIqgc8eRyFhYknzvSScBMSvVf2ymjAe6
 D/WDJTcXCRy7f0F0TK/H4nIb9ce68m8k7PSRvBFVB34GDGpramhlQKIX0p1Wdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=jWTIW/o3
Subject: Re: [Buildroot] [PATCH] docs/download: rework download section
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
Cc: thomas.perale@mind.be, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Aug 2025 11:08:42 +0200
Titouan Christophe <titouan.christophe@mind.be> wrote:

> - Display active Buildroot versions as a table, similarly to kernel.org
> - Add latest release date for all version
> - Add expected End of Life dates for all versions
> - Add link to the changelog
> 
> This makes the section much more compact, which makes it easier for
> users to compare the versions and know what to expect from them
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
> This is how it now looks like: https://imgur.com/a/a3ipSiz

Didn't review the HTML soup, but the result looks very nice, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
