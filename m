Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFBCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 14:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E42CF6164D;
	Fri, 29 Aug 2025 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5MA64nsBCAH; Fri, 29 Aug 2025 14:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E85161600
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E85161600;
	Fri, 29 Aug 2025 14:30:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C253ED2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79F383BDF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9K3TZ0SiW1A for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 14:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18F8837B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F18F8837B6
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB8F687D85; Fri, 29 Aug 2025 14:30:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 16:28:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1512a76d7b2ed74dccca60ba035afd8088ea125
X-Git-Newrev: 44bba495071f754a5cc91b15a3bbfa221de0e55e
X-Patchwork-Hint: ignore
Message-Id: <20250829143031.EB8F687D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: explicitly disable the
 column store plugin
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44bba495071f754a5cc91b15a3bbfa221de0e55e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
