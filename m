Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0D9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 15:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41AA6404C4;
	Thu, 28 Apr 2022 15:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tTM1bzOY-k1; Thu, 28 Apr 2022 15:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A396403F7;
	Thu, 28 Apr 2022 15:45:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE9441BF39D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB24041B3E
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 15:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6tu8Bij9K33 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 15:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF23041A6C
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 15:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3AC9784632; Thu, 28 Apr 2022 15:34:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 17:43:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d163e12a47845804f7f979ddc55402e54ae88b3
X-Git-Newrev: 61bfaf0354b44ae2d4927c54983eaa4c74cd3e0b
X-Patchwork-Hint: ignore
Message-Id: <20220428153451.3AC9784632@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tftpd: add include of config file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61bfaf0354b44ae2d4927c54983eaa4c74cd3e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HPA's tftp server init script does not support include of a
configuration file. So changing daemon parameters would cause
a modification of the init script.
Similar to NFS, dropbear, DHCP, SNMP and other network services
in buildroot, this patch adds an include of /etc/default/tftpd
to the init script. So any user can change the default behaviour
by adding its own configuration file instead of changing the init
script.

Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
