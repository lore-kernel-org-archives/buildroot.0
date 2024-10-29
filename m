Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3874D3A66D
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 16:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99EBE8083B;
	Tue, 29 Oct 2024 16:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcXC1Iy8tBKX; Tue, 29 Oct 2024 16:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F39580A46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F39580A46;
	Tue, 29 Oct 2024 16:06:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 140D9496C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C724098E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1b80SH0UIO3 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 16:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7854440242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7854440242
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7854440242
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 16:06:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8176E240002;
 Tue, 29 Oct 2024 16:06:40 +0000 (UTC)
Date: Tue, 29 Oct 2024 17:06:39 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
Message-ID: <20241029170639.52600e61@windsurf>
In-Reply-To: <CACXRmJgoySzrYAu0KCNSfnXAxrFwameDABJR-AXoAiYxSX+2iQ@mail.gmail.com>
References: <20240920062014.132862-1-thomas@devoogdt.com>
 <20240920062014.132862-2-thomas@devoogdt.com>
 <20241026164305.34881a98@windsurf>
 <CACXRmJgoySzrYAu0KCNSfnXAxrFwameDABJR-AXoAiYxSX+2iQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730218001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agXEzdTTON/LpLRDO1cRj8cUqAJesiBGnjuggsKi63c=;
 b=M2mVi/D6MrEi963tZljMVuG7rwQfr6UIzuwHwCO/zjimw0Mq3cv/BCGrk/CkPMSq/QsDJh
 M+Nz2INhQgj8lni+Eif++ljLgcyEucQ1jmIyqEwEHkOBZ0mWYVf/jo2SkD7KmZiS+pWA6G
 yLQGB1llydkpOi4ChHE/6w3tmYjctp7Mnj139gIeLJ9ONg9/Q0VQHdcE0m5SIzKEePyGDr
 wrEPIdWVISTdFBI0ZqYZM8eHkHxp5cLTNQPL6NedD1LAT3Y+4ae0M8r+608Nr2IwYqcL2d
 z4YZEdyVFEnE/LVpnx43FLN/T9j912VkctLG5kJxqFv4qDHBCylT3CaSP2oVTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M2mVi/D6
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix
 LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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

On Sat, 26 Oct 2024 20:25:26 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> > The question is then why 32, and not 8, 16, or 64 ?  
> 
> The original comment mentioned the number 32, so it makes sense to keep that 32.
> 
> Also, see this older manual
> https://libwebsockets.org/lws-api-doc-master/html/md_README.coding.html:
> "You can control the context basic data allocation for multithreading
> from Cmake using -DLWS_MAX_SMP=, if not given it's set to 32."
> 
> And this newer manual
> https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html:
> "You can control the context basic data allocation for multithreading
> from Cmake using -DLWS_MAX_SMP=, if not given it's set to 1. "
> 
> So, given that the original manual talks about 32, it makes sense to
> use it, even though it is no longer valid.
> Other values will also work, as long the minimum is 2. But I guess
> that this 32 is a good trade-off.

It felt a bit random, but OK, I guess there's no "good" value there.
Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
