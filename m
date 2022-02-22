Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F01BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 21:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4739410A8;
	Tue, 22 Feb 2022 21:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3ZIbdTsFuo5; Tue, 22 Feb 2022 21:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C768409EA;
	Tue, 22 Feb 2022 21:32:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D3CB1BF39A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78857401EE
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvW_vhpusx30 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 21:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F2E401C2
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 21:32:14 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.136.16])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9B53513F87C;
 Tue, 22 Feb 2022 22:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645565531;
 bh=gI6YHpD+vISsikUyMwX4On4uuR1cKlokIFrc6an+2Fs=;
 h=From:To:Cc:Subject:Date:From;
 b=V4OqEz5tLU1f8f6WA1uxuHcNACJpxPYFflyIIGMCx3nKZUyX5F1H/wL/pBJeo/mz3
 PLGqP+Ltf4N4ozmvGp6weL8PNYP3lsTJp9lB0x4eAq2yOuqtEBdBKqBYq8s9UC+53Z
 4/iC1Jfn3pAyvbvy2/FScFB4/s/dK8hbceDyHzPEJ2XHJU5sqirKJ3VDroL3X6X/uP
 hpWnmK6atW3FWX2qRQ2LAQX7NFAalONLpBI0XyQYAoUETu9LtAUt5T6SjB4vPDkB4t
 1gt7SQjHCLDwpnD5llEtLNgmtYjyKr4lL+eEqT0i3XkActjeMQOiUZ3dLiu0cQNt0d
 1nEuJq0SEhBAg==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 22:32:02 +0100
Message-Id: <20220222213202.642708-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: fix mysql.service failing
 to create log directory
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When enabling MariaDB (BR2_PACKAGE_MARIADB=y) and systemd
(BR2_INIT_SYSTEMD=y) in buildroot, the mysqld.service fail to start
with a permission error.  See output of command:

    journalctl --unit=mysqld

Which shows:

    systemd[1]: Starting MySQL database server...
    install[102]: install: can't create directory '/var/log/mysql': Permission denied
    systemd[1]: mysqld.service: Control process exited, code=exited, status=1/FAILURE

Since the service file includes the "User=mysql" directive, the
"ExecStartPre=" is executed as this user, which does not have
permission to create a directory in "/var/log".

This commit fixes this issue by adding the "!" prefix, which will
execute the command with full privileges.  See the systemd.service manual
page entry for "ExecStart=", table "Special executable prefixes":
https://www.freedesktop.org/software/systemd/man/systemd.service.html#ExecStart=
or https://github.com/systemd/systemd/blob/v250/man/systemd.service.xml#L339

Moreover, the "mysql_install_db" invocation does not need this special
prefix, as the "/var/lib/mysql" directory on target is already owned
by the "mysql" user.  The "chown" command is also useless and is
removed in this commit.

Reported-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mariadb/mysqld.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mariadb/mysqld.service b/package/mariadb/mysqld.service
index d9ea74ebc3..537430e9a2 100644
--- a/package/mariadb/mysqld.service
+++ b/package/mariadb/mysqld.service
@@ -2,8 +2,8 @@
 Description=MySQL database server
 
 [Service]
-ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql && chown -R mysql:mysql /var/lib/mysql'
-ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
+ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
+ExecStartPre=!install -d -o mysql -g root -m 0755 /var/log/mysql
 ExecStart=/usr/bin/mysqld_safe --log-error=/var/log/mysql/mysqld.log
 Restart=always
 User=mysql
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
