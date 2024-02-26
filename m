Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFEFC5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 321F460A8D;
	Mon, 26 Feb 2024 20:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vh5rp7wq6xnr; Mon, 26 Feb 2024 20:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B029605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B029605E8;
	Mon, 26 Feb 2024 20:35:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BECA1BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5928E8151E
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8uJ7LoA7sftr for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B90A81517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B90A81517
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B90A81517
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:35:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:cb16:2077:13b7:ce5e:758a:d84c:e478])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 06CBC7804FD;
 Mon, 26 Feb 2024 21:35:38 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 21:35:32 +0100
Message-ID: <20240226203532.12112-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708979740;
 bh=ssA7O/8L4aPzDwPHS6KIHJqdF2GDQMGOGgL0LbDH5co=;
 h=From:To:Cc:Subject:Date:From;
 b=hv7EQBnIl99PxmJa+PzYrdAXaWKIgrZMiXlFsnERYXMrajL+8k3LxAML7ltdCBCxk
 IN0FbYJeY86UZh+bHSDIk0/ZFJbYsQFwI7XKaMRyYeSmus2FTMt4RdxFK6YA9w/6EE
 yBzq2OY4vwsQCQ4jVgQXgeGRxrLU59ryOzjarRsKsf2W/kTj07x1pvymPjpudnz+8H
 hKQ8fMop4zM+9CR87Z2mjd58BaWYVNVmMH90OmATDq8XbpKaYci4EAE3DbyLQLBMWg
 nEJH5K/rTAUmJvc78sqlLK++ijiRPx39UVcInILkhIf54SecEE5IvXQYq23Y2ZskoO
 mC1OFyxylY8pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hv7EQBnI
Subject: [Buildroot] [PATCH 1/1] package/mysql: change default
 implementation to mariadb
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mysql package is a virtual package with two implementations:
oracle-mysql (the initial project), and mariadb (the fork of mysql).
This virtual package was introduced in commit [1] (2016).

The last version bump of oracle-mysql was in commit [2] (2014). This
mysql version 5.1.73 dates from 2013 [3].

Package statistics at [4] reports 177 CVEs on this oracle-mysql
version (as of Buildroot tag 2024.02-rc1).

Finally, oracle-mysql has 12 package patches accumulated over the time
and there is nobody registered in the DEVELOPER file for it.

On the other hand, the Buildroot mariadb package seems to be in a
better shape: the package version is more recent, and received
frequent updates, since its introduction.

There is several packages selecting BR2_PACKAGE_MYSQL, which will use
the old oracle-mysql without the user knowing it (other than
generating the CVE list with "make pkg-stats").

In the meantime oracle-mysql receive a major update, this commits
changes the default implementation of the mysql virtual package from
oracle-mysql to mariadb.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d707d2b4fa6362cb37754f6c5fbb06240f5faf5
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/42c56751fc554503a03d4a914ce2e814eeaf5a41
[3] https://github.com/mysql/mysql-server/releases/tag/mysql-5.1.73
[4] http://autobuild.buildroot.org/stats/master.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 7a9ba7a with commands:

    make check-package
    ...
    0 warnings generated

    # Build packages using mysql
    cat > .config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
    BR2_PACKAGE_MOTION=y
    BR2_PACKAGE_PERL=y
    BR2_PACKAGE_PERL_DBD_MYSQL=y
    BR2_PACKAGE_TCL=y
    BR2_PACKAGE_CPPDB=y
    BR2_PACKAGE_LIBDBI_DRIVERS=y
    BR2_PACKAGE_MARIADB_SERVER=y
    BR2_PACKAGE_APR_UTIL=y
    BR2_PACKAGE_POCO=y
    BR2_PACKAGE_POCO_DATA_MYSQL=y
    BR2_PACKAGE_DOVECOT=y
    BR2_PACKAGE_DOVECOT_MYSQL=y
    BR2_PACKAGE_COLLECTD=y
    BR2_PACKAGE_COLLECTD_MYSQL=y
    BR2_PACKAGE_FREERADIUS_SERVER=y
    BR2_PACKAGE_GERBERA=y
    BR2_PACKAGE_PURE_FTPD=y
    BR2_PACKAGE_ZABBIX=y
    BR2_PACKAGE_ZABBIX_SERVER=y
    BR2_PACKAGE_RSYSLOG=y
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="500M"
    # BR2_TARGET_ROOTFS_TAR is not set
    EOF
    make olddefconfig
    make -j$(nproc)
---
 package/mysql/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index 8942e55a455..dc9a899329f 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -10,7 +10,7 @@ if BR2_PACKAGE_MYSQL
 
 choice
 	prompt "mysql variant"
-	default BR2_PACKAGE_ORACLE_MYSQL
+	default BR2_PACKAGE_MARIADB
 	help
 	  Select either the oracle mysql server or the mariadb server
 
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
