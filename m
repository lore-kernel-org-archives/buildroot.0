Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C741E7718F
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 14:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B50BB607C7;
	Fri,  3 Jan 2025 14:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ceRfpCSrAch7; Fri,  3 Jan 2025 14:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D6B60845
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7D6B60845;
	Fri,  3 Jan 2025 14:37:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA40BF27
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C356240140
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHST9x15V0OJ for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 14:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15823400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15823400BD
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15823400BD
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 14:37:42 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:851f:aacd:bf36:fec8] (unknown
 [IPv6:2a01:e0a:12:eba0:851f:aacd:bf36:fec8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 43F24BFB2A;
 Fri,  3 Jan 2025 15:37:41 +0100 (CET)
Message-ID: <5ff49b76-caae-4707-a1ad-c8836d37d87a@grenoble.cnrs.fr>
Date: Fri, 3 Jan 2025 15:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kilian Zinnecker <kilian.zinnecker@mail.de>, buildroot@buildroot.org
References: <6114083.lOV4Wx5bFT@kilian-laptop> <87r05mpti4.fsf@tarshish>
 <4618658.LvFx2qVVIh@kilian-laptop>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <4618658.LvFx2qVVIh@kilian-laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1735915061;
 bh=Rsuu1AqTVUUJC1McDZBF2gCXzIx3vAqYk/IyaRCoKDU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=gZcMD6tFwQU3PNdbWXDUNCQULdNi6gPQev7eBMYBcG+FZri9tfXrzBBT8liBqz1Ls
 g/Xkw2riNLq/sjBX6qDTEkZEzaQzoD28cvwefXG6847l6O0nKQaYwYZ+3o73yodUeF
 eVM/iIJnioCJmYVTVrgYU3gnQlWr8qSbZ4stkSoMxEKX/4d81T8PseZOzqBW4ICm5x
 gDnVGjQfVXpmG8uYK5ukRcMdm6m4nbOIRkgzy7iUrRspasdztBxp1co2Aa0IZ3ElHh
 FmkKAMTy17oeRTO/n0Q0g+YPjXtQS9BhDbLB141a40qHU66L83AqCvSYKj3RRsDhzL
 MedO6XKfVtcDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=gZcMD6tF
Subject: Re: [Buildroot] [Help] Problem with
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH and kernel 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Baruch Siach wrote:
> See the link below for a recent discussions of this issue on the list:
>
>   https://lore.kernel.org/buildroot/dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr/
>
> Edgar Bonet suggested a fix that you might want to test:
>
>   https://lore.kernel.org/buildroot/035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr/

Kilian Zinnecker replied:
> Great, thanks, I will have a look!

I just sent a v3 of this patch. If you have a chance to test it, could
you please reply to the patch with your Tested-By?

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
