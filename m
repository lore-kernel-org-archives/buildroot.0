Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB235C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65C8C60BA1;
	Thu, 18 Jul 2024 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-6sriu2mgYE; Thu, 18 Jul 2024 20:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A06B60BC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A06B60BC4;
	Thu, 18 Jul 2024 20:06:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BDBE1BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 797B460BA1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuMhY-JaJ9f4 for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:06:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59B3460B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B3460B8A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59B3460B8A
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:06:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ED601BF206;
 Thu, 18 Jul 2024 20:05:58 +0000 (UTC)
Date: Thu, 18 Jul 2024 22:05:57 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240718220557.189b6f22@windsurf>
In-Reply-To: <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
References: <DM4PR02MB9216BC15AD2F3FEE125A71118AA32@DM4PR02MB9216.namprd02.prod.outlook.com>
 <20240717221000.5ced2d0d@windsurf>
 <b03840bf-6a53-4db7-ac58-ce1cc2587b8c@gmail.com>
 <20240717235322.5f90b271@windsurf>
 <57bbc792-5d28-4f2d-b33f-f0735c31fbae@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721333158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRt78X/uXGh3dg/bzqe0x4iF6VpEd60pMDXux8p2T/c=;
 b=NPre6KNqKgMkzp7YBJtJLSZVKk6TXMkylU7Y+5muRtQ22VQIuMZ+dHFHn/XiE9VoBQnwQ7
 vZxakyCAXHt992iyqRrHvMYweM1vU2rm7QReAJI5fjdAE/jkkWaTN5QZ4znJqZwi/zhQIL
 7VgzPF6bxf67hZoNTadJL3k4A64NTFhGx3HUiMhr3bhrfqP2uGvnqgPNYtqvcXBt4zVEhh
 GkqsGhwTfKikb7H1YEiHqcQEni8Z+5wVDUlOumKIZe2wCyinZX29JaQCXFNI2aF89Dcyb0
 XsYOAzKmhHiDONLyVawxK+chiQ4xav/xk1Qs36TtJYWBAx834dvBbNxZ9pT5fw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NPre6KNq
Subject: Re: [Buildroot] Year 2038 time util issue - Build failure in
 2024.02.x
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
Cc: "Karicheri, Murali" <Murali.Karicheri@sandc.com>, "Karicheri, Murali via
 buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Florian,

On Wed, 17 Jul 2024 15:06:50 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> This is not happening with a defconfig, however it is currently 
> happening after refreshing my existing .config file:
> 
> https://gist.github.com/ffainelli/8fe7988c86ee8a3016b893268b9a2f49

For me, this configuration builds fine. Or more precisely:
host-gcc-final builds fine, several target packages are built OK, but
it fails when building the Linux kernel, because
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5.14" doesn't work, it should be
v5.14.

But clearly, I don't hit the <scsi/scsi.h> issue. Are you sure you can
reproduce with this configuration? If so, on which host distro (even
though I don't really see how this could be related to the host system,
but who knows)?

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
