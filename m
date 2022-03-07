Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6394EC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EBAF4174A;
	Mon,  7 Mar 2022 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPhHGmNxzRFc; Mon,  7 Mar 2022 22:10:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54DC941748;
	Mon,  7 Mar 2022 22:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1206B1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2174828F7
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEqzNEYv6COR for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:09:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 000138294A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 258D482DD8; Mon,  7 Mar 2022 22:01:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 23:07:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f5be21db989acbb41b0f432d0f72bc7cc458b24
X-Git-Newrev: fd03d4f057bdbd343f78360bd732df1b47d774a0
X-Patchwork-Hint: ignore
Message-Id: <20220307220127.258D482DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix mysql.service failing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd03d4f057bdbd343f78360bd732df1b47d774a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-By: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
