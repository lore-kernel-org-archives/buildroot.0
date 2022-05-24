Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839ECC433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BF241506;
	Tue, 24 May 2022 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3xE8wDshKl9d; Tue, 24 May 2022 15:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348E9414E6;
	Tue, 24 May 2022 15:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 989731BF329
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9433740936
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QT9JwgRmh1i for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:02:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75D59414C2
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:02:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF2FC8645A; Tue, 24 May 2022 14:51:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 17:02:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d578253cdbb43857fc832a7dbfb2416a96e05fb8
X-Git-Newrev: 672ce3571d4f744a903dd5061719385c394c4754
X-Patchwork-Hint: ignore
Message-Id: <20220524145119.CF2FC8645A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mariadb: fix
 build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=672ce3571d4f744a903dd5061719385c394c4754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure with libressl:

CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
   LIBRESSL_RESULT (advanced)
   LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake

Fixes:
 - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 174808651947428e68fd5380c8968ce26bb297d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
