Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C44CD10BF8
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 12:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125AC406FE;
	Sat, 26 Oct 2024 12:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XmmhQq67E8w; Sat, 26 Oct 2024 12:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22FE4070B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22FE4070B;
	Sat, 26 Oct 2024 12:47:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D1542318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9BA40319
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKjqBFrhqsSt for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 12:47:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0B994026A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0B994026A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0B994026A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 12:47:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D6B61C0005;
 Sat, 26 Oct 2024 12:47:49 +0000 (UTC)
Date: Sat, 26 Oct 2024 14:47:48 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: buildroot@buildroot.org, Andy Yan <andyshrk@163.com>, Andy Yan
 <andyshrk@gmail.com>
Message-ID: <20241026144748.09d6b892@windsurf>
In-Reply-To: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
References: <20240927183553.2866682-1-andriy.shevchenko@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729946870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9WKU7gpq2FITdmTfwDsyuAd8XvzhmZ/cUqcdb3LgQY=;
 b=BA8/S8swwdqJhivvizIokIN4XMtAvvfIdcd7c3JUdXSHaU1DHeaGExdsWbgofAvHbrOqHY
 fqnLcSidncbjfK7wZhCErhfQdiv635Kl3ZQjZnM0w4cx3NCSwKgiwHKfIFSarVy/z/DInH
 TFxQqaWg23Stva4UET0HtO/eVb8jutYGd+BDrQeyYMjQ8Prt/tGc0RoHDf9FwFTTsakA/2
 EsvcJsLVt3y/mbDF76WlXOhvMXOslmvQEk3neEgufmgKq8OVUCv1F/hiXanTr0Ra7y/OlD
 IOVy2ewXd+tjENrXUahmn4k2GwJX7L/1zz8a4XJ020GlTAde9R4cc6vOR1eQ/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BA8/S8sw
Subject: Re: [Buildroot] [PATCH v2 1/1] package: Add iotools package
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

On Fri, 27 Sep 2024 21:34:59 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> The iotools package provides a set of simple command line tools which
> allow access to hardware device registers. Supported register interfaces
> include PCI, IO, memory mapped IO, SMBus, CPUID, and MSR. Also included
> are some utilities which allow for simple arithmetic, logical, and other
> operations.
> 
> If you ever have to debug hardware, you could probably use these tools.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to master after doing some tweaks:

- Used STATIC=1/STATIC=0 to achieve the proper behavior with regard to
  BR2_STATIC_LIBS

- Use the canonical $(INSTALL) incantation for the installation step

One thing that isn't super nice is your handling of the DEBUG variable.
Ideally in Buildroot we would want neither DEBUG=0 nor DEBUG=1, but
"don't do anything and let Buildroot pass the CFLAGS it wants".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
