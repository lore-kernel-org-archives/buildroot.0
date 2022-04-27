Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E73C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFAED40ADB;
	Wed, 27 Apr 2022 17:18:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GEgES-id67Ar; Wed, 27 Apr 2022 17:18:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9D6F408E2;
	Wed, 27 Apr 2022 17:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2DD61BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF57141B40
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2Y1hnyrid1u for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3BB841A5B
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7E2EE845FC; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 18:23:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80bd1002787815295118355f742f79930bf2974d
X-Git-Newrev: 25f56c5d602903b2c572fd05ded3be8bee79f981
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.7E2EE845FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpdf: link with -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=25f56c5d602903b2c572fd05ded3be8bee79f981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
