Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A097C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ADAD401AD;
	Sun, 28 Jul 2024 19:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BluDX7I4w0r; Sun, 28 Jul 2024 19:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1104403BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1104403BF;
	Sun, 28 Jul 2024 19:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D21C71BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA548403BF
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xcvu8MIFKNwp for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32D0D401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D0D401AD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32D0D401AD
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:51:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AFFE40002;
 Sun, 28 Jul 2024 19:51:14 +0000 (UTC)
Date: Sun, 28 Jul 2024 21:51:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240728215113.7c271d4e@windsurf>
In-Reply-To: <20240728154617.41716-1-ju.o@free.fr>
References: <20240728154617.41716-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722196275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcPBch8lwh8MXBjC7SqkdZdZPxgNuGfytyv3Jt0IWvE=;
 b=VZsg8kWBO6ZukvP+7luazHsjHQdbw0LxOoxyh5M6VkfEgA5KuWwMsDDmDoSqcYY+8cZhbd
 ZQ2/O0bTgbGhQLmVwZw2LoaZVnROQj3zjK6JpQ81pNOAl03zgMuIcx+KLhBigDD6pRb57y
 C+GnOrsh5dM4pVsvmgQDVqeHcfkgKNW5dvt5sT2tyX3vij2FPLIR5/Y3W6mPN5UmGAI2vi
 HcqfAbGPmWEThAThs37Jdg2ws8f/KeVHCe1T4AX03b90toDxaQ2/SmqkW1z5sBtmxs3uWU
 TU9XnZzRHVc0aDeUn4c5muHIJeZKhyMOM8BAQWeg+xIidt8hkx2Eh9lXFXg+XQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VZsg8kWB
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: add
 host load info in run log
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jul 2024 17:46:17 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Runtime tests running on test runners are subject to a high
> variability in term of performance and timing. Most or the runtime
> test commands are executed with a timeout, in pexpect.
> 
> Slow or very loaded test runners can use the timeout_multiplier to
> globally increase those timeouts.
> 
> Some runtime test commands sometimes needs to poll or query a state,
> rather than having purely sequential actions. It is sometimes hard to
> know, from the test writer point of view, the maximum timeout to set, or
> if a retry logic is needed.
> 
> In order to help debugging runtime tests failing due very slow
> execution, this commit adds extra information on the host test runner
> about its load in the run log. Relevant information are: number of
> cpus, the load average at the moment the emulator is started and the
> current timeout_multiplier.
> 
> Note: this change was discussed in:
> https://lists.buildroot.org/pipermail/buildroot/2024-July/759119.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/infra/emulator.py | 7 +++++++
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
