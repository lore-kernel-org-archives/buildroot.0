Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA3C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BD66108C
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 07:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8BD66108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9AC84010A;
	Tue, 27 Jul 2021 07:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3w14-zOeD9Jy; Tue, 27 Jul 2021 07:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD21C400CA;
	Tue, 27 Jul 2021 07:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E43091BF2A1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3327607EC
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 07:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEbgIZSrWKkD for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 07:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0A94607D6
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 07:43:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 63686FF802;
 Tue, 27 Jul 2021 07:43:23 +0000 (UTC)
Date: Tue, 27 Jul 2021 09:43:20 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210727094320.2ad01290@windsurf>
In-Reply-To: <20210727072523.2273052-1-fontaine.fabrice@gmail.com>
References: <20210727072523.2273052-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: make a single
 option for avrcp and a2dp
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 27 Jul 2021 09:25:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build of avrcp without a2dp is broken since commit
> fb9fc969d91f69851b4c70dba512b607e52bda7b:
> 
> /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/9.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: profiles/audio/bluetoothd-avrcp.o: in function `avrcp_handle_set_volume':
> avrcp.c:(.text+0x9c4): undefined reference to `media_transport_update_device_volume'
> 
> However, build of a2dp without avrcp is also broken:
> 
> /data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `.L50':
> media.c:(.text+0x508): undefined reference to `avrcp_unregister_player'
> /data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv32-buildroot-linux-gnu/10.2.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: profiles/audio/bluetoothd-media.o: in function `match_endpoint_by_path':
> media.c:(.text+0x824): undefined reference to `avrcp_register_player'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d54cdfc03212fff772a863d1bc8afd3cfb605831
>  - http://autobuild.buildroot.org/results/64d75af986a4d6e9c5a176efb6e22046f4d82350
> 
> So make a single audio option for a2dp and avrcp

Shouldn't this be reported as bug to upstream bluez ? If they have
separate options, they should work independently from each other.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
