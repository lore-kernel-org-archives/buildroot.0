Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1855C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 678C540423;
	Sat,  9 Apr 2022 14:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15FoCaPJiMDw; Sat,  9 Apr 2022 14:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E5F40320;
	Sat,  9 Apr 2022 14:13:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1FA91BF425
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC9940320
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a2BITRrA4t9O for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:13:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE8D3400A8
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:13:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6E0BD83701; Sat,  9 Apr 2022 14:03:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Apr 2022 16:09:45 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 47f14d9a0f34bd9f596465c14b31a4bf9ce6b2cc
X-Git-Newrev: 446d7c537109a1a7de7c947d59c77dc04e247f4a
X-Patchwork-Hint: ignore
Message-Id: <20220409140344.6E0BD83701@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/flac: fix build
 on ppc64
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

commit: https://git.buildroot.net/buildroot/commit/?id=446d7c537109a1a7de7c947d59c77dc04e247f4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Disable vsx to avoid the following build failure on ppc64 raised since
bump to version 1.3.3 in commit 89337e4f39343b3cba0e9f77b3a198fa8ea340af
and
https://github.com/xiph/flac/commit/cdb030cd3749b4547399a049ce3cae5e974ccd48:

In file included from lpc_intrin_vsx.c:46:
/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/9.4.0/include/altivec.h:34:2: error: #error Use the "-maltivec" flag to enable PowerPC AltiVec support
   34 | #error Use the "-maltivec" flag to enable PowerPC AltiVec support
      |  ^~~~~
lpc_intrin_vsx.c: In function 'FLAC__lpc_compute_autocorrelation_intrin_power8_vsx_lag_16':
lpc_intrin_vsx.c:94:7: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Wimplicit-function-declaration]
   94 |  d0 = vec_vsx_ld(0, base);
      |       ^~~~~~~~~~
      |       vec_vslh

Fixes:
 - http://autobuild.buildroot.org/results/a97a0522c58964fa51815236bc39b378e10b5008

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5197ce5ff30d1a23b811ddddca8030f13658d7da)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flac/flac.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 2ff048b6e6..3a18d81591 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -20,7 +20,8 @@ FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
 	--disable-altivec \
-	--disable-stack-smash-protection
+	--disable-stack-smash-protection \
+	--disable-vsx
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
