Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA7BC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48850847A6;
	Fri, 12 Jul 2024 19:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iTGNfvfQxyJ; Fri, 12 Jul 2024 19:17:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C387847A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C387847A8;
	Fri, 12 Jul 2024 19:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9F261BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A3B605EC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEVvcyD3pdy2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 956A7605EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 956A7605EB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 956A7605EB
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:17:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3A0D1BF206;
 Fri, 12 Jul 2024 19:17:08 +0000 (UTC)
Date: Fri, 12 Jul 2024 21:17:07 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20240712211707.65cb5e83@windsurf>
In-Reply-To: <20231101233931.25d66334@windsurf>
References: <20231015204753.5775-1-bernd@kuhls.net>
 <20231101233931.25d66334@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720811829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gm7JCSafQsc1x+L0O/zd5UW9Txwwv5poc6niKIKX0/Q=;
 b=EEqe7hgABupnZfdXcI/6FvosV/RJaSZ2ZT+j2Td/5/BnazfWduTMXWJcv6DhOJcxfeFXLD
 NYaQzIHGqir9mux7TIXTaDwel170wgb/847jSksX9V2hncftPUosEy2PskRsR6O7ZJInRA
 f2yjcjvcmN7QwC7W02u7+IhBa9G1Y0wYebn9a7eRIzpboY+gKoCjvqmdUXZciIBWuklBs1
 4h9mOC2AzRV22e1095EM7N1QUEpOCB5kAOKPH1jm4uOIL5DrXRd7NEeT0fzL7KDTuC/32Q
 l1yBCJkyVuE5GL5aGOUpPAh6/mlv7SYGJwdnd/2p/kyzZ6fcLz+GgLRVKdadag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EEqe7hgA
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: disable for sparc and
 sparc64 architectures
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed, 1 Nov 2023 23:39:31 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> If we wanted to merge that, it should be:
> 
> config BR2_PACKAGE_PPPD_ARCH_SUPPORTS
> 	bool
> 	default y if !BR2_sparc64 && !BR2_sparc
> 
> However, it's never nice to have to do something like this. Has this
> issue been reported to upstream pppd?
> 
> Also, it seems like the ppp package in Debian builds on sparc64, see
> https://packages.debian.org/sid/ppp. How do they achieve this? I
> haven't spotted a particular patch/quirk (but I looked quickly).
> 
> In
> https://github.com/ppp-project/ppp/blob/master/pppd/termios_linux.h#L14,
> the pppd code base is definitely playing with fire. I'm not sure what
> they are trying to do, but they know that the inclusion of kernel
> headers will cause some redefinition... Perhaps something to discuss
> with ppp upstream first.

I finally took some time, narrowed down the issue, and wrote a
work-around. The real fix was in fact done very recently in the Linux
kernel, but it will only appear in Linux 6.10, so we need a workaround
for toolchains that use headers < 6.10.

See my commit at:

  https://gitlab.com/buildroot.org/buildroot/-/commit/b162aab7c6da6b45dc5ba9ad30b59b4362e2dc2e

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
