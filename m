Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F71C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 13:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D343A83267;
	Thu, 28 Apr 2022 13:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPNuHbqXEdg5; Thu, 28 Apr 2022 13:42:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0AF18174A;
	Thu, 28 Apr 2022 13:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9734B1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 13:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E3F41586
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 13:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRhr7d1eUOrM for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 13:42:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD957410D0
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651153344;
 bh=ObHF7jG/himOxJX8HCu8G8J/i9/PTYHjEGqfukAaYg4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ns0OJ24ZVjRHWBwkzdsEL+hKbjaYKsu9Dwswu4ITqX5j+fMzFp7qHVo16daN0hzXe
 ygYdj8P5TQHg/I1jD9ttfcMNj6Vm0nCzchnBROMj1FoCuAzc5fpA1aZs0tfop4/5+u
 37HQwQt81RdVg6r70uUKdx91r7UBkLGySesreabo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([84.133.21.31]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0oFz-1o7MOb1KVB-00wlTD; Thu, 28 Apr 2022 15:42:24 +0200
From: Andreas Ehmanns <universeiii@gmx.de>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 15:42:07 +0200
Message-Id: <20220428134207.16521-1-universeiii@gmx.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:BRXMUMva/0db4sZ4Ej6Efri3gb9/aGWfj3xnvR2e8XZ5uy00TSZ
 vc8TgdDryxxPRqibavKXecnhk0ZK5TGOwWQJkcCCcQpuileMUTNW7dvWx2rOH3f804qfZ0l
 Az6O0NYb7xY4ck+eOwg4ZhlKQpiqoajGdQMMA68X8p10LeOFx8WZw7XN4iiPLpveSeBm9LR
 m3sxrzjdnClorH9YCYPgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RpUTRD2jpRM=:0EgRwHjfFbpJ3buCRHC+v6
 ZrbLm79pm4+3RtvG+WO426arY49KlJt1Gw2HC5UsAayDuMszfJC3jY1+8+1udXn7earJyz+BT
 /9f6RhJQZ6JK+3jTcMihcaPvG8mdc13GV5cp2VQvO4SCfHK3FFGAeWfNga4al5r37au6c6Kdg
 SxZmMPSnKBohg1e7mQ5O6K4KwQ0wRKziakN4M545g5OZmAdorL9HMRf2WyXAaL0LUWdJwgFib
 IDkivNeryj/dmpIFcqcBkUB1jY2LzS9WeqsNVQXM4CLXxv4zwG2NBXGYXjKkxPOqunNjPkOQ+
 XMZtGQeAshIZutpsg5wm39TqoxuOdEj7Lzj5pQan+ucD30RyGyNNgagt75iojP+XjEXtg6MiI
 h2vibIYVDfg7b5yXCc1owQK4RnQH1VvCv+dXtpshXx04pkE5bhlM2gj5+dllvvdrkX6F+kbJL
 BNG36jinsoc9qILVssGaVuOcwnbmp22/HwVk9jUJyYpQ0IBNA83TjqdwNK/wMITvSg3cd8SVk
 Kntc5T1/38brQC1ccApmYqLU0bw8/U3k2QmWaLKT7gJlOa29lMIgk2SSi5l0VSMjqJsOVyIEZ
 lVEXgGbjlVi8z9LZcb1qzoVKqQQDoxYiWXLk4sYPbto4WgauN+cfnpLOSUMKeIv2E7dps2tk6
 55i0+VPEnTa3yBcmuv3c+n/dxH0PTBtmH+dVbx/M7L58N+YOm2EpDle8WuQJBBGVZwrd6Iw3O
 M6F3qLaUl1t1HiKwwahzB7QRnobUzhbYNRAj6AA5DMIYvzTL0oCcdcWoiB+fVRJLSfki98okq
 ywPtBcetfDrzdmOX+F/xQ7xrdpoKm6xhhSuNuoR6p+qrvYPiZu4cxgw2KA1Rnjb5ErPTHPXeP
 OMa+i11rJSGxhKNHQytLobz4lXUo/I8KtIRFqTyUdU4AqVYy2a2TfDB+XAMtq77s5zzhKIsJZ
 WoSP1WZD9Bg+AIaFut03LzNQwXeY7eUwylkQQ3xqsbZZQbPe5GtpDx4hu6jHgvEPAsuc2IyZC
 bYEP3r4vygVf+MUzlhNNEKOZGMDydbrBHd9idW0v4d9Aj80G41EYDjcVlj2iV2GyfFQxmTe6Z
 kxs7yyyDbvHtxU=
Subject: [Buildroot] [PATCH 1/1] package/tftpd: add include of config file
 to init script
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
Cc: Andreas Ehmanns <universeiii@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HPA's tftp server init script does not support include of a
configuration file. So changing daemon parameters would cause
a modification of the init script.
Similar to NFS, dropbear, DHCP, SNMP and other network services
in buildroot, this patch adds an include of /etc/default/tftpd
to the init script. So any user can change the default behaviour
by adding its own configuration file instead of changing the init
script.

Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
---
 package/tftpd/S80tftpd-hpa | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tftpd/S80tftpd-hpa b/package/tftpd/S80tftpd-hpa
index 4e8361faa7..8ae15150a1 100644
--- a/package/tftpd/S80tftpd-hpa
+++ b/package/tftpd/S80tftpd-hpa
@@ -11,6 +11,8 @@ DAEMON=/usr/sbin/$NAME
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/S80tftpd-hpa

+[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
+
 #
 #	Function that starts the daemon/service.
 #
--
2.26.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
