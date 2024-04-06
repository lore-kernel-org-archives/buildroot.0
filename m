Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8459FC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FA6560613;
	Sat,  6 Apr 2024 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvBqcmiE2Twp; Sat,  6 Apr 2024 21:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42A3560615
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A3560615;
	Sat,  6 Apr 2024 21:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3823A1BF5A7
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 21:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2503360615
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 21:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUn3WJZhSjhM for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 21:34:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D222E60613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D222E60613
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D222E60613
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 21:34:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53A541C0003;
 Sat,  6 Apr 2024 21:34:45 +0000 (UTC)
Date: Sat, 6 Apr 2024 23:34:44 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20240406233444.3e78ce4b@windsurf>
In-Reply-To: <4570d0d7-b1b8-412d-a3f8-957ee8b0dfc9@grenoble.cnrs.fr>
References: <4570d0d7-b1b8-412d-a3f8-957ee8b0dfc9@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712439285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLQQej5VRVShCVOchvkYCEqq8Yv8odmHhgzmSUTi60A=;
 b=n2N5gQNk6CuVGc2+xEg7PfbelffBY8LrgbFVH7FrHpqRhDPTBK6kS8L2M8/F7KZDevMBtr
 nacH1pCn8IaaMGxfp1rONIsron9w3l+HhcQpZtEhrnJhuq4aev3ZEdjb7lheg6ICbFQ8ZK
 D2CJJKDrNbFeXqaDN0n8iJvxKosMlSVqdtVDRb3VeQGm1uM4mFFuLrUkNxQk0Fr7asTh6L
 dT22UtudN4xxSFMFoXsbx+c3ZSP/llsh5RvwNlvoBEdKXUmdWBdq+eSbf13ukTAIVJccVG
 ZLdLWyOK+xrozA98Ti26iUkWEqMHdc4Lw8ba17+9OVRtozjYA7eI+6HJX546eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n2N5gQNk
Subject: Re: [Buildroot] Binutils 2.41 cannot compile old Linux kernels
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

Hello Edgar,

Thanks for having looked into this issue. See below some feedback.

On Sat, 6 Apr 2024 21:32:46 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> Another option would be to bump the kernel version, but I assume this
> should be done (and tested) by the maintainers of the affected
> defconfigs.

This is definitely the right thing. If those maintainers are no longer
available, it means those defconfigs are unmaintained and should be
dropped.

In my opinion, this is actually a good side effect of those toolchain
changes: they allow from time to time to detect that some defconfigs
are bitrotting, without being maintained, and encourages us to revisit
the relevance of such defconfigs in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
