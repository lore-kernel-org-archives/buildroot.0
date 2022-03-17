Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E44C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 20:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EED981253;
	Thu, 17 Mar 2022 20:54:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IiUIdjrb3_9z; Thu, 17 Mar 2022 20:54:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17430812B4;
	Thu, 17 Mar 2022 20:54:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29DA81BF40B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27F5A418F8
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SY7q-U_Jo7kc for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 20:54:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D440B41845
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 20:54:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1950420005;
 Thu, 17 Mar 2022 20:54:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUx8M-00DOUS-00; Thu, 17 Mar 2022 21:54:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20220222213202.642708-1-ju.o@free.fr>
Date: Thu, 17 Mar 2022 21:54:09 +0100
In-Reply-To: <20220222213202.642708-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 22 Feb 2022 22:32:02 +0100")
Message-ID: <875yocs3ke.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: fix mysql.service
 failing to create log directory
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > When enabling MariaDB (BR2_PACKAGE_MARIADB=y) and systemd
 > (BR2_INIT_SYSTEMD=y) in buildroot, the mysqld.service fail to start
 > with a permission error.  See output of command:

 >     journalctl --unit=mysqld

 > Which shows:

 >     systemd[1]: Starting MySQL database server...
 >     install[102]: install: can't create directory '/var/log/mysql': Permission denied
 >     systemd[1]: mysqld.service: Control process exited, code=exited, status=1/FAILURE

 > Since the service file includes the "User=mysql" directive, the
 > "ExecStartPre=" is executed as this user, which does not have
 > permission to create a directory in "/var/log".

 > This commit fixes this issue by adding the "!" prefix, which will
 > execute the command with full privileges.  See the systemd.service manual
 > page entry for "ExecStart=", table "Special executable prefixes":
 > https://www.freedesktop.org/software/systemd/man/systemd.service.html#ExecStart=
 > or https://github.com/systemd/systemd/blob/v250/man/systemd.service.xml#L339

 > Moreover, the "mysql_install_db" invocation does not need this special
 > prefix, as the "/var/lib/mysql" directory on target is already owned
 > by the "mysql" user.  The "chown" command is also useless and is
 > removed in this commit.

 > Reported-by: Gilles Talis <gilles.talis@gmail.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
