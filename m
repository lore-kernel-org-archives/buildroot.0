Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC05C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AF2940A5F;
	Sat, 23 Apr 2022 15:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJN4juyjciPu; Sat, 23 Apr 2022 15:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B0E40A18;
	Sat, 23 Apr 2022 15:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 672151BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 541A683E27
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQs7SCGAG94f for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B66E283E0B
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C75183FDF; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 16:43:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0b467436ccbdda862f93a9d0933b0c0dfcf2a2e
X-Git-Newrev: 174808651947428e68fd5380c8968ce26bb297d5
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.7C75183FDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=174808651947428e68fd5380c8968ce26bb297d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl:

CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
   LIBRESSL_RESULT (advanced)
   LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake

Fixes:
 - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mariadb/mariadb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4eb9c71827..18667e7e70 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -60,6 +60,12 @@ MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 # Explicitly disable dtrace to avoid detection of a host version
 MARIADB_CONF_OPTS += -DENABLE_DTRACE=0
 
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+MARIADB_CONF_OPTS += \
+	-DLIBRESSL_RESULT=ON \
+	-DLIBRESSL_RESULT__TRYRUN_OUTPUT="LibreSSL $(LIBRESSL_VERSION)"
+endif
+
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER),y)
 ifeq ($(BR2_PACKAGE_MARIADB_SERVER_EMBEDDED),y)
 MARIADB_CONF_OPTS += -DWITH_EMBEDDED_SERVER=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
