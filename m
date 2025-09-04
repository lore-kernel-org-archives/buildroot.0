Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84D9CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D41040626;
	Thu,  4 Sep 2025 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7q8ZH7bUK64k; Thu,  4 Sep 2025 16:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99D8B4060C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D8B4060C;
	Thu,  4 Sep 2025 16:34:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50EF2106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACC7A4008B
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J27smxugZtWI for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10EAC4005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10EAC4005F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F1DF87EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:14:13 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 173d4190c314868f657dce230b80c6162c810b19
X-Git-Newrev: 2e059d216c132b02f2968cace8cc8e28f71811ed
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.0F1DF87EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/mariadb:
 explicitly disable the column store plugin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e059d216c132b02f2968cace8cc8e28f71811ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Building the column store plugin (which gets automatically enabled
when Boost with a bunch of submodules is found) currently fails as it
requires a number of runtime checks that obviously cannot work when
cross-compiling.

OpenEmbedded has defined them as such:

  -DLSTAT_FOLLOWS_SLASHED_SYMLINK_EXITCODE=0 \
  -DSTAT_EMPTY_STRING_BUG_EXITCODE=0 \
  -DMASK_LONGDOUBLE_EXITCODE=0 \

but it really isn't clear whether those values are completely correct
for all CPU architectures, especially the last one.

So instead, let's disable the column store plugin until someone
actually needs it and figures out how to set those variables properly.

The issue fixed by this commit can be reproduced using the following
defconfig:

BR2_aarch64=y
BR2_ARM_FPU_VFPV3D16=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y
BR2_PACKAGE_BOOST=y
BR2_PACKAGE_BOOST_DATE_TIME=y
BR2_PACKAGE_BOOST_FILESYSTEM=y
BR2_PACKAGE_BOOST_REGEX=y
BR2_PACKAGE_BOOST_THREAD=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 44bba495071f754a5cc91b15a3bbfa221de0e55e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/mariadb/mariadb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 0d872442f2..53395afc91 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -112,7 +112,8 @@ MARIADB_CONF_OPTS += \
 	-DINSTALL_SQLBENCHDIR=share/mysql/bench \
 	-DINSTALL_SUPPORTFILESDIR=share/mysql \
 	-DMYSQL_DATADIR=/var/lib/mysql \
-	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
+	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET) \
+	-DPLUGIN_COLUMNSTORE=NO
 
 HOST_MARIADB_DEPENDENCIES = host-openssl
 HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
