Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD6CC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3154541521;
	Thu,  9 May 2024 21:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHSq9byQZqZM; Thu,  9 May 2024 21:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079414154D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079414154D;
	Thu,  9 May 2024 21:14:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DDCF1BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 664994154D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ijIFu1s3Epih for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:14:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1709D41521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1709D41521
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1709D41521
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:14:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05C451C000A;
 Thu,  9 May 2024 21:14:12 +0000 (UTC)
Date: Thu, 9 May 2024 23:14:11 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240509231411.07a42954@windsurf>
In-Reply-To: <9e8a2daf-327b-4d22-88a6-fda7b38d4d78@mind.be>
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
 <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
 <CAPi7W828vTKG5W6=e9RvFMLC=0gge42GnQTNrr4m4qs2yNGfmQ@mail.gmail.com>
 <20240509184648.5a3719f4@windsurf>
 <9e8a2daf-327b-4d22-88a6-fda7b38d4d78@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715289253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEaHqe4DQhJ2BYYfzrxTEGxgjKK6oedZ4zSZh1SxUWM=;
 b=b8iYKST4T3w91hpkpTu4N31C7awYuAI4WsUkTHAhajLhdW8tf81mGkE200gtXySfmi/6vo
 b/5sAv7DKiNi8Zm6rd/uAAVTmhmOF0cmPk932Om4FXbyDLBbEoqGlFr/ULgPkpEZkGT2e/
 c7tN1B3kTwLk3/1UCS+gQtElHmTjrIMkbNco6GYNfZN8FOd96haF49QE+G3AvKJ/P1pynf
 Yrfx/MgYeyGbLVcQWz/XzkxZypjgndKphKiEOb10sqPL7Fs4EFTgkxGyRj/qetgaUdR6yK
 qacXhgr8TIqFXnjrj0gGTCJ2wsW8oETW7dmKYOoK0C212BnpB8ZiWpzKSvsKAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b8iYKST4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 May 2024 22:54:34 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>   Theoretically I agree. However, IIUC, the dependencies that are checked are 
> usually _runtime_ dependencies anyway, so we don't have it as an actual 
> dependency.

Well, we do select them. But I guess you mean that since they are not
guaranteed to be around at build time, there is no way to have a proper
dependency check?

If that's the case, then how are all the other packages that don't do
--skip-dependency-check achieving a successful build?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
