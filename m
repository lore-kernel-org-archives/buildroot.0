Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95126C25B7C
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D40881CAD;
	Mon, 27 May 2024 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbYRHbC_Fz8Q; Mon, 27 May 2024 13:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DC481CC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DC481CC3;
	Mon, 27 May 2024 13:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 995051D1276
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86D51401B2
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRm5UbKm19we for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C03044014D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C03044014D
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACD6C8769F; Mon, 27 May 2024 13:16:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 15:14:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ed19064d162a294b175eab51324828c8f98f0dcf
X-Git-Newrev: 40d64599f4c22a5beb2e22892f74bd177191c1ae
X-Patchwork-Hint: ignore
Message-Id: <20240527131637.ACD6C8769F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/perl-dbd-mysql:
 fix runtime issue with MariaDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=40d64599f4c22a5beb2e22892f74bd177191c1ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Now that the TestPerlDBDmysql can be run normally, a new runtime issue
appear due to switch from oracle-mysql to MariaDB:

  # perl -MDBI -e '1'
  # echo $?
  0

  # perl -MDBD::mysql -e '1'
  Can't load '/usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so'
  for module DBD::mysql: /usr/lib/perl5/site_perl/5.38.2/arm-linux/auto/DBD/mysql/mysql.so:
  undefined symbol: net_buffer_length at /usr/lib/perl5/5.38.2/arm-linux/DynaLoader.pm line 206.

This is fixed by an upstream commit [1] from 4.046_01 release.

[1] https://github.com/perl5-dbi/DBD-mysql/commit/0f0cebe87fab335873fd3701bc304922da826940

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cefcd5bbadf2a8c8cb8c97049a478964ebddb95e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Use-net_buffer_length-macro-if-available.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch b/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch
new file mode 100644
index 0000000000..d7767c1f42
--- /dev/null
+++ b/package/perl-dbd-mysql/0001-Use-net_buffer_length-macro-if-available.patch
@@ -0,0 +1,41 @@
+From 9189ef77679c22de3bbd2142031858373236520b Mon Sep 17 00:00:00 2001
+From: Michiel Beijen <michiel.beijen@gmail.com>
+Date: Fri, 23 Feb 2018 07:52:33 +0000
+Subject: [PATCH] Use net_buffer_length macro if available
+
+Upstream: https://github.com/perl5-dbi/DBD-mysql/commit/0f0cebe87fab335873fd3701bc304922da826940
+
+(cherry picked from commit 0f0cebe87fab335873fd3701bc304922da826940)
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ mysql.xs | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/mysql.xs b/mysql.xs
+index 8edee55..9b4d60f 100644
+--- a/mysql.xs
++++ b/mysql.xs
+@@ -819,15 +819,14 @@ dbd_mysql_get_info(dbh, sql_info_type)
+ 	    retsv = newSVpvn("`", 1);
+ 	    break;
+ 	case SQL_MAXIMUM_STATEMENT_LENGTH:
+-#if !defined(MARIADB_BASE_VERSION) && MYSQL_VERSION_ID >= 50709
+-        /* MariaDB 10 is not MySQL source level compatible so this
+-           only applies to MySQL*/
+-	    /* mysql_get_option() was added in mysql 5.7.3 */
+-	    /* MYSQL_OPT_NET_BUFFER_LENGTH was added in mysql 5.7.9 */
++        /* net_buffer_length macro is not defined in MySQL 5.7 and some MariaDB
++        versions - if it is not available, use newer mysql_get_option */
++#if !defined(net_buffer_length)
++            ;
++	    unsigned long buffer_len;
+ 	    mysql_get_option(NULL, MYSQL_OPT_NET_BUFFER_LENGTH, &buffer_len);
+ 	    retsv = newSViv(buffer_len);
+ #else
+-	    /* before mysql 5.7.9 use net_buffer_length macro */
+ 	    retsv = newSViv(net_buffer_length);
+ #endif
+ 	    break;
+-- 
+2.44.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
