Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CAFC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 14:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F1740CEB;
	Sat, 27 Jul 2024 14:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJSl2wJd1kgD; Sat, 27 Jul 2024 14:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5074340CEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5074340CEF;
	Sat, 27 Jul 2024 14:18:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93D7F1BF84C
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8061E40274
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 14:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIBWUmu0xeoC for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 14:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F72E4024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F72E4024E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F72E4024E
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 14:18:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49E0FFF804;
 Sat, 27 Jul 2024 14:18:47 +0000 (UTC)
Date: Sat, 27 Jul 2024 16:18:46 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240727161846.21ab4b13@windsurf>
In-Reply-To: <20240727135748.397792-1-fontaine.fabrice@gmail.com>
References: <20240727135748.397792-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722089927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k34Mp7kCU4DZw8z3oGwf5AMz5ANBt6mz3A6IXG172CQ=;
 b=MO13Uv120xr2JitnwEerrjW/i+NYxDAdVLztVrveVV1fyxhcKugZ+FqcOK8JLEItERs+2T
 aJx51y+i/1QAwcv5EU1lGZQ3bxZuRc3h2JRcHVECFojo8Ha4RLMhrnS0B8GBKbEp05vYn+
 rD7KeXYMaQwuBNM2qeK8D4baBJ7xB+Z+bFgColl4NqftN4kXNIFKaV1FIm+tmc6MZ67jqu
 MztwuUHZI+hCBuiJF/Q91hP2+JoxXT10odVFXt8g5KYilscni9B3seYQrxoRHcoCXjHzSk
 2HxKccgtZay3kBLslHD4tyQjl1nD9ohUbwmYnxv55RiquGnlq/mV1P/9qwZNfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MO13Uv12
Subject: Re: [Buildroot] [PATCH 1/1] package/nasm: bump to version 2.16.03
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

On Sat, 27 Jul 2024 15:57:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://nasm.us/doc/nasmdocc.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nasm/nasm.hash | 2 +-
>  package/nasm/nasm.mk   | 2 +-
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
