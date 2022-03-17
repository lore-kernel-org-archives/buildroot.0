Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0492BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96E6640502;
	Thu, 17 Mar 2022 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1UUVUGvM_ty; Thu, 17 Mar 2022 21:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFDFF40469;
	Thu, 17 Mar 2022 21:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 759AB1BF40B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FF8D4048A
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:02:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UCNf7-8yzi3 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 857AB40412
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 26099843BA; Thu, 17 Mar 2022 20:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 21:53:31 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e4d21fda051b78af74e446d32937ff0e9d612b20
X-Git-Newrev: 0c6ab290d67105e432448563979d81e3c395c80d
X-Patchwork-Hint: ignore
Message-Id: <20220317205358.26099843BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mariadb: fix
 mysql.service failing to create log directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c6ab290d67105e432448563979d81e3c395c80d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit fd03d4f057bdbd343f78360bd732df1b47d774a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
