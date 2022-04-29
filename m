Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D1DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 14:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3838540588;
	Fri, 29 Apr 2022 14:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sl-iTlPAr4iP; Fri, 29 Apr 2022 14:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44813400F2;
	Fri, 29 Apr 2022 14:47:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 358801BF989
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 14:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2362F60BF9
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 14:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=agner.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dMEFamwSfXAo for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 14:47:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2E1C60E2C
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 14:47:44 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 8722B5C10E9;
 Fri, 29 Apr 2022 16:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1651243662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=pX0F9xjBkO8SkuRyUouuu0D8D9sEXu+1KzTjA7S6EnM=;
 b=ecLtx1YdykACrAxtgngD+ge5RLe5knT/lJLGIswpcPXhzruoz5LJUKgQhTYw0BpLzpmeaR
 l8C2s0gUVC/oDG5kvb/bcYfG43246/mKKgAtFtIFPG04qrBeSoZfBi7VgUbStBm3pdJKrB
 IURvdlcbXnvyApD/+aal5j+UWajN8w8=
MIME-Version: 1.0
Date: Fri, 29 Apr 2022 16:47:42 +0200
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <1f0d993a5097ca6e94a4ded0b7e0c5cb@agner.ch>
X-Sender: stefan@agner.ch
Subject: [Buildroot] GRUB2 2.04 (buildroot 2022.02.1) failure reading sector
 errors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On Home Assistant OS we are moving from Barebox to GRUB2 as the
bootloader for UEFI based systems. The switch is currently on our beta
channel with several hundert of users. I have now 4 independent reports
where the system stopped booting after upgrading to the new OS version
with GRUB2. The systems show the same error: "error: failure reading
sector 0x9c900 from `hd0`." The sector number is not always the same,
but it seems to be always within the partition holding the kernel. We
are using compressed squashfs which might be a factor influencing the
problem.

Despite testing on several actual and virtual x86-64 systems I am unable
to reproduce so far.

At least one of the systems has been successfully tested with Debian 11
bullseye (which is using GRUB2 2.04 as well). That boot flow doesn't
make use of squashfs of course.

Anyone seen similar issues? Ideas how to get to the bottom of this?

I am considering moving to 2.06 to see if that fixes the problem, is
anyone working on 2.06 already? I see that buildroot is carring 150
patches on-top of vanilla GRUB2, so that requires some work.

Best regards,
Stefan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
