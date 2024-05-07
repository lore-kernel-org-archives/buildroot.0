Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583EEC10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C28404EF;
	Tue,  7 May 2024 07:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNLqCrTsf5mW; Tue,  7 May 2024 07:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4953941572
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4953941572;
	Tue,  7 May 2024 07:12:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 198881BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0627641585
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1Ujarwwtq4o for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:12:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9D11404EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9D11404EF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9D11404EF
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:12:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3392A1C0003;
 Tue,  7 May 2024 07:12:36 +0000 (UTC)
Date: Tue, 7 May 2024 09:12:35 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240507091235.613acaaa@windsurf>
In-Reply-To: <20240506205250.1264901-1-fontaine.fabrice@gmail.com>
References: <20240506205250.1264901-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715065956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFns4wL8sOAdYcm+ir+PXGurF1Th3XfIolzdchv1l3M=;
 b=D79FUtY/D8KXr6TmHoUtYO3i2jK5AHXyXYKPptZKyyGNORlgvPtlikp+NCcLJaVDP0C++H
 Wl2zAPM8VQoyc/PaID0if7yzQnNQxQ2FNqhBBoLWZ/nxBNL/Kr4lE8i/K22BBowafnAypH
 Q8aRhnh6nvztYGIxHqeJDdM5CKAqYEA9yh1v2/0Vz67bYvz/oIydxBCpxN2Qecqooc5fjP
 wDe3fGD45U/4Gfjq/vxEoye85CpSnDK93uwJ/IRhmkhLztP1krz8PXqp36EGIFA6mFQ4dd
 y7PI0qrcZDXZzDMPSR29Ggi6DnEq3Qpj2SK8beFWs69ehq6of7O4VfyNLUstrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D79FUtY/
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: fix build with
 libgpiod2
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

On Mon,  6 May 2024 22:52:49 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openocd is not compatible with libgpiod2 resulting in the following
> build failure since the addition of libgpiod2 in commit
> 57391fad2e619395340b81957ddceab1b1df2e20:
> 
> src/jtag/drivers/linuxgpiod.c: In function 'helper_get_line':
> src/jtag/drivers/linuxgpiod.c:283:19: error: 'GPIOD_LINE_REQUEST_DIRECTION_INPUT' undeclared (first use in this function); did you mean 'GPIOD_LINE_DIRECTION_INPUT'?
>   283 |         int dir = GPIOD_LINE_REQUEST_DIRECTION_INPUT, flags = 0, val = 0, retval;
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                   GPIOD_LINE_DIRECTION_INPUT
> 
> Fixes: 57391fad2e619395340b81957ddceab1b1df2e20
>  - http://autobuild.buildroot.org/results/7195e8b76350f26ab3b963702d88b254512e6928
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openocd/openocd.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

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
