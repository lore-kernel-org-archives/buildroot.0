Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31525C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCED04099F;
	Sat,  8 Jan 2022 09:59:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvif-01deTFx; Sat,  8 Jan 2022 09:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BC640340;
	Sat,  8 Jan 2022 09:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D19E1BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AFE58144B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSSWPWEf_s7w for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E22198141F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E414182ACB; Sat,  8 Jan 2022 09:52:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 10:58:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16bfbeca6f4f2ec4a4fbb1a2325552190efcc687
X-Git-Newrev: 21a1a5927004787217b19f09e6b113b68f91511e
X-Patchwork-Hint: ignore
Message-Id: <20220108095249.E414182ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: disable versioned
 symbols only when unsupported
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

commit: https://git.buildroot.net/buildroot/commit/?id=21a1a5927004787217b19f09e6b113b68f91511e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back in commit e90a4bf4af3b6466b2a2d8df12cfe84f5d364cca ("alsa-lib:
don't use versioned symbols") from 2009, symbol versioning was
disabled in alsa-lib, because it was causing problems with C
libraries (such as uClibc) that doesn't support symbol versioning. The
thread at
http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
has some background discussion about this.

Essentially, the issue was that alsa-lib in the new version of a given
symbol calls into an old version of the same symbol. If your C library
has symbol versioning, everything works fine. But if your C library
doesn't support symbol versioning, the call from the new symbol into
the old symbol will in fact end up in the new symbol, causing an
infinite recursion.

That problem was solved back then by unconditionally disabling symbol
versioning in alsa-lib.

However, some libraries such as CEF depend on versioned symbols from
alsa-lib, and the build fails during linking with versioning disabled.

This patch conditionally disables versioned symbols when unsupported
by the toolchain, leaving them enabled otherwise. We assume only glibc
has support for symbol versioning. uClibc has no support, and musl has
some limited support, so we take the safe route of only enabling
symbol versioning for glibc.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-lib/alsa-lib.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index c43803f607..b5cd3f0d13 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -16,8 +16,11 @@ ALSA_LIB_AUTORECONF = YES
 ALSA_LIB_CONF_OPTS = \
 	--with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
-	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
-	--without-versioned
+	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))"
+
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
+ALSA_LIB_CONF_OPTS += --without-versioned
+endif
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
