Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A289EC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE336069C;
	Fri,  2 Aug 2024 21:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRkLfdyMccp8; Fri,  2 Aug 2024 21:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84297606D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84297606D3;
	Fri,  2 Aug 2024 21:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCA1B1BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAEBC80E5B
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmGatcWn2xYB for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82D7A80E5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D7A80E5A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D7A80E5A
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:15:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D655EE0006;
 Fri,  2 Aug 2024 21:15:02 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:15:01 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240802231501.5b9481fa@windsurf>
In-Reply-To: <20240627193335.4069574-5-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-5-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722633303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fQ4wrtkDWgXK/Mpez83DJSoFgqpwEBzFxIr+H6E1C4=;
 b=WThhBlHYFSv/Ty/JFe2KmbOtxKq1mZeup4FbZ/tyMPgcuHRrt5YzFM/GOep+s0DI4H6ZHj
 eNRHyF11/MRuO1XW0JZvzulNpqhx6c3GcVZbAq9Z986mccylmj4t3DGAZyfJCfhi0ir9J/
 lxSQclCm37w5ztws6CbCRsz+H4zGHm+anu+xv0WiRBjBAdCCJXbOd4Ad4+dSoeHx8e6dyS
 bbBUi7PfWbj6bXoo+boKCDMRnF0PcOf5ZcTWwdnbeKcSChS995rNsJ9xjuOahBEBtFcxBo
 FLLhSxANStMncJoQKFym3u15DxMdQCMSW1ctcQyyhLe3p204NVVBsbvmJCuJAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WThhBlHY
Subject: Re: [Buildroot] [PATCH v2 4/4] package/wpewebkit: disable libdrm
 usage when not available
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 22:33:32 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Pass USE_LIBDRM=OFF to the wpewebkit CMake configuration step when the
> libdrm package has not been selected.
> 
> WPE WebKit can be built without libdrm support, and it will still work
> with backends that use other platform-specific methods to handle
> graphics buffers and/or presenting content onto an output. For example
> this is the case with wpebackend-rdk configured to use rpi-userland,
> which uses dispmanx to produce the output instead of DRM/KMS.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
