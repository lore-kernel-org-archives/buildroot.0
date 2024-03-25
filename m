Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF29C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1780817AB;
	Mon, 25 Mar 2024 07:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh6s0qWzm2dC; Mon, 25 Mar 2024 07:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8773E817EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8773E817EB;
	Mon, 25 Mar 2024 07:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E69641BF909
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2C9140A66
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id st2mrf1SuTni for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16B8D40A39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16B8D40A39
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E8FE837B8; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:30:58 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9af8ad53b37ead14c9d4bcbf7dd8d0662bcc683b
X-Git-Newrev: 44f3a0c6dc8aa4ea6879983a960af85b7b317051
X-Patchwork-Hint: ignore
Message-Id: <20240325073406.0E8FE837B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/mariadb: requires
 DES in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=44f3a0c6dc8aa4ea6879983a960af85b7b317051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Enable DES in openssl to avoid the following build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359:

In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/mysqld.cc:50,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/lib_sql.cc:34:
/home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:26:3: error: 'DES_cblock' does not name a type
   26 |   DES_cblock key1, key2, key3;
      |   ^~~~~~~~~~
/home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:31:3: error: 'DES_key_schedule' does not name a type; did you mean 'st_des_keyschedule'?
   31 |   DES_key_schedule ks1, ks2, ks3;
      |   ^~~~~~~~~~~~~~~~
      |   st_des_keyschedule

Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 - http://autobuild.buildroot.org/results/bd067de9c2699dc9628c00b929a01890b14d53c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8b3497f3ab19ec828a94eaf19923a07603b5e916)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index d88dda3cda..acedd1da9d 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	help
 	  MariaDB is one of the most popular database servers in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
