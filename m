Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDBC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B2CF808D8;
	Sat, 14 Sep 2024 09:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7Wevjdgt_8B; Sat, 14 Sep 2024 09:32:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E3180B3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E3180B3E;
	Sat, 14 Sep 2024 09:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA7811BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7E0740264
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McS1c2dJRQhW for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:32:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B87C40260
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B87C40260
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B87C40260
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:32:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7365E240003;
 Sat, 14 Sep 2024 09:32:41 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:32:40 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240914113240.491cbc99@windsurf>
In-Reply-To: <ZuMD4asCM8pq3KRe@waldemar-brodkorb.de>
References: <ZuFeS3LE0/MttrzN@waldemar-brodkorb.de>
 <93c0a59a-f9b7-4dfb-92cc-d381f6aae6e5@smile.fr>
 <ZuMD4asCM8pq3KRe@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726306361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TD+Ya/vUVF7f0McWwKrxC5ksx18uvkvolerYb1rf1n8=;
 b=CGEB318a1agcfujx6kM0v3TDchKQa9u+Y3diqlT/mil74mDfuAMV4i9jcOW9MoH9fYmqhG
 U0jLEi1+oUl0Zbzr9HY4QgbVIgCFdRoNehHZuo73G17ClYyiAUyvmXv3FZpVXy/GXi/tPB
 GT8qSJlqZCGuUIUGCQpK+7j4YRLcgOk3z+7hxBfnUjaKU65zxb3HnobSsGLAw1+eQUTb1V
 TRrbkK5XDa7xDWtJqiVL5kD8g1rrT5vyn+lL+ehD4T+c328YryLcKdT2paptz0iaKceG14
 qcOM68+Ynmp5qotS12pDTBd7UFRgPMCCButM3wzQ72wwVYW8MJlPc6r+wvoANg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CGEB318a
Subject: Re: [Buildroot] [PATCH] package/qemu: update to 9.1.0
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 12 Sep 2024 17:08:17 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > We need to remove host-qemu from the qemu_nios2_10m50_defconfig or simply remove
> > this defconfig since the qemu support is gone.  
> 
> Should the removal of the defconfig be in the same patch?

No, in a separate preparation patch, but in the same series.

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
