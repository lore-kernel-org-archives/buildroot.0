Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DB9C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C83461108
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C83461108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3950A60A7F;
	Thu,  5 Aug 2021 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8YbUB-InNWI; Thu,  5 Aug 2021 11:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8956660A73;
	Thu,  5 Aug 2021 11:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E18A71BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D392E82FF9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaAMEUzL4N9q for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F30083083
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BD6488B7EF; Thu,  5 Aug 2021 11:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 13:05:58 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: bbc8e3578436a7d8e75fa5ed774ae03458311941
X-Git-Newrev: 35a7dabfd0e64ba4bdb687172664dd7ff7413510
X-Patchwork-Hint: ignore
Message-Id: <20210805110700.BD6488B7EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/mariadb: provide
 native compiled mariadb_config
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

commit: https://git.buildroot.net/buildroot/commit/?id=35a7dabfd0e64ba4bdb687172664dd7ff7413510
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
(cherry picked from commit 11b4552d8a9a19816748558f98cf44b7b189428d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
