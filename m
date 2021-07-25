Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF37C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:39:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0DA60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 19:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA0DA60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B301040261;
	Sun, 25 Jul 2021 19:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMHjkHyqMc0W; Sun, 25 Jul 2021 19:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1527640201;
	Sun, 25 Jul 2021 19:39:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6F511BF405
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68C6840372
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 19:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jWjOdSonUbrB for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 19:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 985C540377
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 19:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B1CC88F3D; Sun, 25 Jul 2021 19:04:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 21:38:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dae174e7eb98191610df7a5a7e5a9bd6ca03d66
X-Git-Newrev: 11b4552d8a9a19816748558f98cf44b7b189428d
X-Patchwork-Hint: ignore
Message-Id: <20210725190427.0B1CC88F3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: provide native compiled
 mariadb_config
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=11b4552d8a9a19816748558f98cf44b7b189428d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- overwrite cross-compiled mariadb_config executable (used from the
  mysql_config script) by a native/host compiled one

Fixes (qt5base configure):

  Trying source 0 (type mysqlConfig) of library mysql ...
  + .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config --version
  > .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mysql_config: line 100: \
    .../host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: cannot execute binary file: Exec format error

  with

  $ file host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config
  host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/mariadb_config: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 5.10.0, with debug_info, not stripped

Reported-by: Scott Bartolett <SBartolett@thorlabs.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index ade73ccfe0..374b3dc352 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -135,5 +135,13 @@ endef
 
 MARIADB_POST_INSTALL_TARGET_HOOKS += MARIADB_POST_INSTALL
 
+# overwrite cross-compiled mariadb_config executable by an native one
+define MARIADB_POST_STAGING_INSTALL
+	$(HOSTCC) -I$(@D)/libmariadb/include \
+		-o $(STAGING_DIR)/usr/bin/mariadb_config \
+		$(@D)/libmariadb/mariadb_config/mariadb_config.c
+endef
+MARIADB_POST_INSTALL_STAGING_HOOKS += MARIADB_POST_STAGING_INSTALL
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
