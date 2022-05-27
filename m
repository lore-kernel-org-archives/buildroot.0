Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E013C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3417B6166C;
	Fri, 27 May 2022 09:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6GdY_z7pCwQs; Fri, 27 May 2022 09:39:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C14E61667;
	Fri, 27 May 2022 09:39:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EDB91BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC7D6164D
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2ONycVbQ_D2 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C4A60E90
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:38:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95EA98662D; Fri, 27 May 2022 09:27:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:51:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7960fbee3e36e6221f0f7031a4a67a52aba61c0d
X-Git-Newrev: d6cc9524a44e98f935ae7184a5d21da96f57ba57
X-Patchwork-Hint: ignore
Message-Id: <20220527092724.95EA98662D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qpdf: link with
 -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6cc9524a44e98f935ae7184a5d21da96f57ba57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Link with -latomic if needed to avoid the following build failure since
bump to version 10.5.0 in commit
b5352c2177011ca389cbb7c68e78447549cbdaaa and
https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:

/nvmedata/autobuild/instance-20/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-20/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
QPDF.cc:(.text+0x4e44): undefined reference to `__atomic_fetch_add_8'

Fixes:
  - http://autobuild.buildroot.org/results/b69e6e380c47bc64c6555899c2f61f57bdae7ecc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 25f56c5d602903b2c572fd05ded3be8bee79f981)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qpdf/qpdf.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 8e0769059d..a58781f4f1 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -32,4 +32,8 @@ else
 QPDF_CONF_OPTS += --disable-crypto-openssl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+QPDF_CONF_ENV += LIBS=-latomic
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
