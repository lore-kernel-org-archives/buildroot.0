Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD41D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88F96079D;
	Tue, 29 Oct 2024 21:52:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRp_loaamonw; Tue, 29 Oct 2024 21:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BF76081D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BF76081D;
	Tue, 29 Oct 2024 21:52:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E53DB4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C47B60728
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feV0iaZPwZtr for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 281D4605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 281D4605B1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 281D4605B1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:52:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F19F41BF203;
 Tue, 29 Oct 2024 21:52:12 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:52:11 +0100
To: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20241029225211.2e908cfe@windsurf>
In-Reply-To: <20240904114903.4020-1-tianyuanhao3@163.com>
References: <20240904114903.4020-1-tianyuanhao3@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730238733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kOWs08a9NWA++1P+E04eWzJEVBtmHUhUwVc5+qU0og=;
 b=oQNKoRLrJ21LkYxdPS+uQczysZ2Ga97bAqW7KM3PAB/udNspqG830GqRCZtGrZplKZPYK5
 qlPsGrdoex9HvsdXFYrz55keUgpEl7Jg8AjwvO5Zak6GvPYK7nTdlFIeJYi2L5b6g7m8Xr
 myG1hTQ9w9YSR74EFHdJliUQO37vpdAdbwbGmz7VFb1301rI1LWUq7dr1L0Xp+3UDSUqn2
 Ck65OGBghBgmLwLV8PfEFx11Lq82QNxmgMi69edhNCH0TW6jcCj0q5xHbUAsYi3Z3CP8JJ
 /fDzWT/9Kdau7dehAmDSz8KQ21SKurNY0avG4jMqgfthoq39/+wwQ+HSwvAlCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oQNKoRLr
Subject: Re: [Buildroot] [PATCH 1/1] package/ntp: add a patch to fix crashes
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

On Wed,  4 Sep 2024 04:49:03 -0700
TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> This patch fixes a regression [1] introduced in ntpd 4.2.8p18 [2].
> 
>   ntpd[200]: Listen normally on 3 lo [::1]:123
>   ntpd[200]: bind(20) AF_INET6 [fe80::bf3d:254d:dee0:d345%3]:123 flags 0x811 failed: Cannot assign requested address
>   ntpd[200]: unable to create socket on enp0s3 (4) for [fe80::bf3d:254d:dee0:d345%3]:123
>   ntpd[192]: daemon control: got EOF
>   ntpd[192]: daemon child died with signal 11
>   systemd[1]: ntpd.service: Control process exited, code=exited, status=70/SOFTWARE
>   systemd[1]: ntpd.service: Failed with result 'exit-code'.
>   systemd[1]: Failed to start Network Time Service.
> 
> If the IPv6 link-local interface was not ready for binding on the first
> attempt, ntpd would segfault in update_interfaces(). The segfault would
> only occur when ntpd was started as part of the boot sequence. Most
> - but not all - boots were affected. Evidently it could happen that the
> timing of ntpd's start up was delayed enough that the IPv6 link-local
> interface was ready for the bind() call when it was first issued by
> open_socket() via create_interface().
> 
> [1]: https://bugs.ntp.org/show_bug.cgi?id=3928
> [2]: https://bugs.ntp.org/show_bug.cgi?id=3913
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...-Fix-crash-when-binding-IPv6-address.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/ntp/0003-Fix-crash-when-binding-IPv6-address.patch

Applied to master after adding more details in the patch commit
message, especially an Upstream: tag. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
