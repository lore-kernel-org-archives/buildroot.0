Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C36C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377B74091A;
	Fri, 29 Jul 2022 19:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377B74091A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IMa5tQyVL9bv; Fri, 29 Jul 2022 19:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7CE408BE;
	Fri, 29 Jul 2022 19:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B7CE408BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB42D1BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C1940896
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C1940896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHuj5jjWXC71 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:58:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C07740860
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C07740860
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 33F7C86955; Fri, 29 Jul 2022 19:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:58:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43daab350d633512df07159b7ba3f90673335c0f
X-Git-Newrev: 4900fc717cea67a6e2692c714377d27093a5f76a
X-Patchwork-Hint: ignore
Message-Id: <20220729194423.33F7C86955@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: work around gcc bug 68485
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4900fc717cea67a6e2692c714377d27093a5f76a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version <= 12.x the build fails due to gcc bug
68485: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug
show up when building mariadb with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y,
we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/9b5/9b5dce4958b602c80140440addb1f072332e53c2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 06fd1484b6..4c855985b1 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -82,6 +82,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 MARIADB_CXXFLAGS += -latomic
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+MARIADB_CXXFLAGS += -O0
+endif
+
 MARIADB_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(MARIADB_CXXFLAGS)" \
 	-DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
