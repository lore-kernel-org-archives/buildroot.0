Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86BEEB579
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF6580F88;
	Thu,  1 Jan 2026 16:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZXHaBofd_jR; Thu,  1 Jan 2026 16:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E4281006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767286452;
	bh=xcbMsh3473uSlcNksYkcpDvJt2IRD7vLZe+OYDhIg5c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ngVgU1+eSE1bFDhEtIqGLe0Po7cPQ5d7P2YRqg2dhMMQbyDWMd5IlT0RsmaxUnoRG
	 NiKVg/5mqzxxmhApNxpEgCD314sB4JFYh+Twppr1JLIx3HP3SwyiDHuetW27PkCQR/
	 shaEeBo5C9YSlr7v5Y1t2q/fBfE3hcE7btmhRzWIfpMlNiaK3k/0hnRlZQDTJJnuF4
	 igyGU6s1elNY4EPFe17JT2GFMmuOA/FY5vj8phsRYNMv77Dnm3qAageMqTasjKwUwT
	 R+k3nIKt8CUJUVmimBMhVV556vB8Khcy2ubN1OftG4qdp4xqfsiLaczYkyuiNVKkUd
	 pkMcHH91csiuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E4281006;
	Thu,  1 Jan 2026 16:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75FC7351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54FAC60B15
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4iW88bPYauj for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D465960AFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D465960AFE
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D465960AFE
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:54:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4059BC1C39B;
 Thu,  1 Jan 2026 16:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C6E6060749;
 Thu,  1 Jan 2026 16:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1F4C6113B0777; Thu,  1 Jan 2026 17:53:47 +0100 (CET)
Date: Thu, 1 Jan 2026 17:53:46 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: bernd.kuhls@t-online.de, buildroot@buildroot.org, Thomas Devoogdt
 <thomas.devoogdt@barco.com>
Message-ID: <20260101175346.47e2d139@windsurf>
In-Reply-To: <20251025143557.79322-1-thomas@devoogdt.com>
References: <20230516173411.823978-1-bernd.kuhls@t-online.de>
 <20251025143557.79322-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767286429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AW0U4sSsqBv5nXJiy6Y59olmbxLEfQiHWdgdR/hhMr8=;
 b=MDXGQgwWSPrm/z54uneTkuGRYNlsB5DymIKxf3ByEFSCgicNY7O0JiV2nIo8QHhxgd4kzU
 nyr8+9TwQAwNKxLXACYnSvRYNrOKr++vE2El9Xdixcgkb48WY17VOG8HVDghw6TTKA0Wdc
 7BuGTn73xx0kXxynoOFI8XL7aVoxgal4AiVB6Mihlh18PvKoYAx9wAHZT5hQndOUE2Ivy2
 /UZVANCLBnAT2m+RU83PdIMmrBHa4zXhAQpRC4d+cCFmx0LkfpTHhtpBoz4g5Q5k3sUr1M
 ek6VYIbM1hTtyMOIDW0CQTUnSoOv3wFY2o5ksaK5i4Cu/BugNKzmqPa6lGyS6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MDXGQgwW
Subject: Re: [Buildroot] [PATCH v1] package/icu: disable icu config
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

Hello Thomas,

On Sat, 25 Oct 2025 16:35:57 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Seen while using BR2_PER_PACKAGE_DIRECTORIES, not sure on how to reproduce.
> 
> Fixes:
> 
> /usr/bin/install: cannot stat 'config/icu-config.1': No such file or directory
> 2025-10-25T00:09:10 make[2]: *** [Makefile:359: install-manx] Error 1
> 2025-10-25T00:09:10 make[2]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
> 2025-10-25T00:09:10 make[1]: *** [Makefile:153: install-recursive] Error 2
> 2025-10-25T00:09:10 make[1]: *** Waiting for unfinished jobs....
> 2025-10-25T00:09:10 make[1]: Leaving directory '/home/thomas/buildroot/build/output/build/host-icu-73-2/source'
> 2025-10-25T00:09:10 make: *** [package/pkg-generic.mk:283: /home/thomas/buildroot/build/output/build/host-icu-73-2/.stamp_host_installed] Error 2
> 2025-10-25T00:09:10 make: *** Waiting for unfinished jobs....

Thanks for the patch, but the explanation is a bit weak I'm afraid. Is
this a parallel build issue within the icu build system?

The thing is that even if icu-config might be deprecated by the ICU
developers, how many packages using ICU still use icu-config?

Such a change would need at least a bit of analysis of how many
Buildroot packages rely on icu, and a test build of those packages
after removing icu-config. We don't need a 100% coverage testing on
this, but at least some sanity checking with a majority of packages
using icu, to see how bad the breakage might be (or not).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
