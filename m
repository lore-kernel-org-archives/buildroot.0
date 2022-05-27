Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B0584AC1;
	Fri, 27 May 2022 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1j60Bnx9vMn; Fri, 27 May 2022 09:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738E284A1E;
	Fri, 27 May 2022 09:53:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8D71BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BA7C615F4
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nSfjC4A1zHEd for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F792614D2
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 642478662B; Fri, 27 May 2022 09:42:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 11:43:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a081ec3b1d54057e096683c3294b9dd90799b5d6
X-Git-Newrev: 1253317a906a3751014ba1ef7a9fbfaeeea76425
X-Patchwork-Hint: ignore
Message-Id: <20220527094200.642478662B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tftpd: add
 include of config file to init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=1253317a906a3751014ba1ef7a9fbfaeeea76425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 61bfaf0354b44ae2d4927c54983eaa4c74cd3e0b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
