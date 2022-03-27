Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 423E582A56;
	Sun, 27 Mar 2022 15:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phJ_s12bkWsW; Sun, 27 Mar 2022 15:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4875882A4E;
	Sun, 27 Mar 2022 15:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E3351BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4533D81D7C
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPDQOjDoutvv for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93B9581DB2
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:46:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4196385D67; Sun, 27 Mar 2022 15:37:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:33:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6d6c2f6a41442fe1905dc51b7cef15c683bff65
X-Git-Newrev: 5f5c5703464514e4b3773ac5590556ba301a2754
X-Patchwork-Hint: ignore
Message-Id: <20220327153712.4196385D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libscrypt: fix CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f5c5703464514e4b3773ac5590556ba301a2754
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't pass TARGET_CONFIGURE_OPTS in LIBSCRYPT_MAKE_OPTS to avoid
overriding CFLAGS (and so loossing -fPIC). This will fix the following
build failure raised since bump to version 1.22 in commit
4542c6714d3951070c31739d24e4bd42b446fbae:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: BFD (GNU Binutils) 2.36.1 assertion fail elf32-microblaze.c:1534
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: sha256.o: probably compiled without -fPIC?
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/10.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: final link failed: bad value

Fixes:
 - http://autobuild.buildroot.org/results/ba4234ad305badb5ce815080ddcad6727e8d51c4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libscrypt/libscrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index d28bd4e900..193c963f76 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -11,7 +11,7 @@ LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
 
 LIBSCRYPT_MAKE_OPTS = \
-	$(TARGET_CONFIGURE_OPTS) \
+	CC=$(TARGET_CC) \
 	CFLAGS_EXTRA="$(TARGET_CFLAGS)" \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	PREFIX=/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
