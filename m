Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B92C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22DA640606;
	Thu,  9 May 2024 16:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oh7vQbAxjL7G; Thu,  9 May 2024 16:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB21D406D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB21D406D5;
	Thu,  9 May 2024 16:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 450721BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F0DA83ECB
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxQe8QTkIOhk for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20C8C83E68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C8C83E68
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20C8C83E68
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:42:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A13920002;
 Thu,  9 May 2024 16:42:34 +0000 (UTC)
Date: Thu, 9 May 2024 18:42:33 +0200
To: cp0613@linux.alibaba.com
Message-ID: <20240509184233.25d27458@windsurf>
In-Reply-To: <20240409111635.5181-1-cp0613@linux.alibaba.com>
References: <20240409111635.5181-1-cp0613@linux.alibaba.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715272955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qhH4b4s+2RziwnQt4rfoSuti/p1V1HIvP+Z2YWn+3tE=;
 b=THiQ1qX9a+Bnb0T450/4JP4oyAWxARivUu5yEWXgufSNvOpL0eH4WYCsM6fT+i7tPpf9It
 efOXdqp5IgfSKzYFi33Hb+4KajVkIAaKH4OFF+w4H4r0KGNAphUseWH5LP+ru/jsF30ueE
 wWkB/U7k3GgwocAHIRtSnOXCvGlX0E/LV4/o7VT2AiccaAmhnAkkyX5xTXWne6uw5/Oa+h
 L4dLK6eey/+XUxOoShZYLFoAVGWnp0NNWuURxfiPzsMiwCAaaLTNIXyl+Yj3r9gWiplWDt
 WNrulEyGktaHhYG5Ro9lMjYv9u5eTHkzTa7dz9ZR0xfjyyiKA+qUDiC/JHUmBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=THiQ1qX9
Subject: Re: [Buildroot] [PATCH] package/bpftool: fix riscv support
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

On Tue,  9 Apr 2024 19:16:35 +0800
cp0613@linux.alibaba.com wrote:

> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> bpftool already supports riscv, including rv64 and rv32, so support is enabled.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  package/bpftool/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Thanks for your contribution, I've applied to our master branch, after
adjusting the commit title. Indeed your commit is not "fixing riscv
support", it is merely allowing the bpftool package to be enabled on
riscv.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
