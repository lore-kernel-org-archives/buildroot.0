Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F86C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C569060E08
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C569060E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86EE280F11;
	Sun, 24 Oct 2021 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRxeC_7uIG_U; Sun, 24 Oct 2021 13:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B444880F13;
	Sun, 24 Oct 2021 13:07:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF031BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18F4180F17
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCBZ8F-XJqeO for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:07:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65AC080F11
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:07:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C41708855D; Sun, 24 Oct 2021 13:04:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:07:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3477232fb180dd4a4b5c07ebdd5ec81a92ea1e8
X-Git-Newrev: 92f367b474e4bb6e9d2222abe631ee43465f8780
X-Patchwork-Hint: ignore
Message-Id: <20211024130408.C41708855D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: link with -latomic if
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=92f367b474e4bb6e9d2222abe631ee43465f8780
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link with -latomic if needed to avoid the following build failure since
bump to version 2.0.1 in commit 0f8d4a6ecd874770ce677b617b2c7f459eb1505d
and
https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

/tmp/instance-0/output-1/per-package/gensio/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.so: undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/2114f9cb3d820fc620932e793f53341a0c1f10bc
 - http://autobuild.buildroot.org/results/c1b397eea1c2eda19149844cec4a87d55651862d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index ad6c39b6fa..389de1e263 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -21,6 +21,10 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GENSIO_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 GENSIO_CONF_OPTS += --with-pthreads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
