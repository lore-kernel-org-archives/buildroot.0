Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61496C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86A1C40A88;
	Mon, 21 Mar 2022 21:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ipaGfOKmmXnh; Mon, 21 Mar 2022 21:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3674D40A30;
	Mon, 21 Mar 2022 21:00:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C065E1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADDD38412D
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8M1mj5fk1Lcy for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BFF984121
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 09C2484C9B; Mon, 21 Mar 2022 20:51:21 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 21:58:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2f1f28efd4236431b333fabe6c75aceba9678bc
X-Git-Newrev: 88471fe4fdc3d25d81b5b6898415a0550d06b90b
X-Patchwork-Hint: ignore
Message-Id: <20220321205121.09C2484C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odb: add dependency on host-libodb
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

commit: https://git.buildroot.net/buildroot/commit/?id=88471fe4fdc3d25d81b5b6898415a0550d06b90b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-odb installs the ODB compiler, which when executed at runtime,
needs access to the libodb headers. This is a runtime dependency,
normally added in Config.in, but for host packages there is no way to
express a runtime dependency. In order to have them installed, add a
dependency on host-libodb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[Kamel: Add optional host-libodb-boost dependency]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/odb/odb.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/odb/odb.mk b/package/odb/odb.mk
index 85c7ccb8bb..a234069952 100644
--- a/package/odb/odb.mk
+++ b/package/odb/odb.mk
@@ -10,7 +10,13 @@ ODB_SOURCE = odb-$(ODB_VERSION).tar.bz2
 ODB_SITE = https://www.codesynthesis.com/download/odb/$(ODB_VERSION_MAJOR)
 ODB_LICENSE = GPL-3.0
 ODB_LICENSE_FILES = LICENSE
-HOST_ODB_DEPENDENCIES = host-libcutl
+# host-libodb is not needed to build host-odb, but it is needed to use
+# the ODB compiler, as it install header files that are needed at
+# runtime by the odb compiler.
+HOST_ODB_DEPENDENCIES = host-libcutl host-libodb
+ifeq ($(BR2_PACKAGE_LIBODB_BOOST),y)
+HOST_ODB_DEPENDENCIES += host-libodb-boost
+endif
 HOST_ODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 # Prevent odb from trying to install the gcc plugin into the hosts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
