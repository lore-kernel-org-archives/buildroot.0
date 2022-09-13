Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F19BC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A49360E2D;
	Tue, 13 Sep 2022 14:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A49360E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qY4Xq3aXNplR; Tue, 13 Sep 2022 14:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C2960B73;
	Tue, 13 Sep 2022 14:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51C2960B73
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0731BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DACAC408BF
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DACAC408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqLGleN3WWLw for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:21:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3A83401CA
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3A83401CA
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D1510837A5; Tue, 13 Sep 2022 14:21:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:13:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: baf818d688539da8917106ea89160125b8380cc4
X-Git-Newrev: 76c40f548014d9aae4d39c4c26853eef025992fa
X-Patchwork-Hint: ignore
Message-Id: <20220913142130.D1510837A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mariadb: work
 around gcc bug 68485
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

commit: https://git.buildroot.net/buildroot/commit/?id=76c40f548014d9aae4d39c4c26853eef025992fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

With Microblaze Gcc version <= 12.x the build fails due to gcc bug
68485: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug
show up when building mariadb with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y,
we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/9b5/9b5dce4958b602c80140440addb1f072332e53c2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4900fc717cea67a6e2692c714377d27093a5f76a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
