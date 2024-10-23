Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7651BCFA478
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F3BF605AA;
	Wed, 23 Oct 2024 21:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMm6XBk42Ton; Wed, 23 Oct 2024 21:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F24560837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F24560837;
	Wed, 23 Oct 2024 21:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ABE9972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B03940256
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jcL-pwAjRy-r for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2F9E40287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2F9E40287
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2F9E40287
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:13:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0C2540003;
 Wed, 23 Oct 2024 21:13:38 +0000 (UTC)
Date: Wed, 23 Oct 2024 23:13:37 +0200
To: Anisse Astier <anisse@astier.eu>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <20241023231337.1b0997be@windsurf>
In-Reply-To: <20241023202814.447269-1-anisse@astier.eu>
References: <20241023202814.447269-1-anisse@astier.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729718019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKiVI6rEv9Un2kYtJ7iUd2eY4pyjOyHWpUG6de0GCzw=;
 b=aUYgArOyyULxDVYPU9PQf1tOoNDkeH1GAjLS36wVPYf0jFZCHXnWBLoqL/+IFov6P8WTL1
 LHpseuS+jws0uSf9ScdjnaqEriKczez1pf6OzyQCB1sx75N+p/qWvycbMLU46CcRtgalbf
 chXI2rOXN534cQ6EGE6rrZjGtHS3nHG44/vqJBmi3BptzZm8DZtvS2Y1q05QYYFiaTf0JN
 ETPbESCOOFP4agVo4JorHH9PclPf0AGf+JKSBXFPQrfn7QHfCm+RHk3SXwAMQVkba7Sofm
 rS7yEql0IcgS4YZNHBuJser1PcpxGSQFEuPqyZO29xZiknJTc7HaTL4dcNTzkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aUYgArOy
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Anisse Astier
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

On Wed, 23 Oct 2024 22:28:14 +0200
Anisse Astier <anisse@astier.eu> wrote:

> I am no longer actively involved in Buildroot.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)

Applied to master, thanks a lot for your contributions to Buildroot
over the years!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
