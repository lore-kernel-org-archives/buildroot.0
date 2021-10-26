Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A47AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF4260D07
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 06:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FF4260D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4515C80CCA;
	Tue, 26 Oct 2021 06:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8CyXj7P7ojq; Tue, 26 Oct 2021 06:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C72880C40;
	Tue, 26 Oct 2021 06:28:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380421BF3AD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33A24401E8
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 06:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EG3b8depzt0j for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 06:28:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00A1A4012E
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 06:28:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B83A88CD3; Tue, 26 Oct 2021 06:25:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 08:28:21 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e91b7ce9eba2edbd018c8d1427b8ec645a396770
X-Git-Newrev: 6187d3465e2c3216557fac3113b06ae1011a7623
X-Patchwork-Hint: ignore
Message-Id: <20211026062515.4B83A88CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gensio: link with
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

commit: https://git.buildroot.net/buildroot/commit/?id=6187d3465e2c3216557fac3113b06ae1011a7623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 92f367b474e4bb6e9d2222abe631ee43465f8780)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index e68e75e2ad..2094c756fe 100644
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
