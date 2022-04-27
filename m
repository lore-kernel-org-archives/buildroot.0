Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A65283E93;
	Wed, 27 Apr 2022 17:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKyERAYlQOI2; Wed, 27 Apr 2022 17:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BB483E7A;
	Wed, 27 Apr 2022 17:18:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDB921BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC43083E8F
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZ01CdUV0_o4 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 145BB83E66
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:18:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A602F845FD; Wed, 27 Apr 2022 17:08:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 18:23:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cf8f4e13424a79ab2af2945e565e1cfb0dd4bf3
X-Git-Newrev: c97bc9a2e4ded6964f74a5d835dbeb18ea3f33d3
X-Patchwork-Hint: ignore
Message-Id: <20220427170806.A602F845FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairo: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c97bc9a2e4ded6964f74a5d835dbeb18ea3f33d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/836348270d564a46cc9ee840cf87b2494cc82cec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cairo/cairo.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 98f270442a..f479aa252a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -15,6 +15,8 @@ CAIRO_INSTALL_STAGING = YES
 # 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
 CAIRO_IGNORE_CVES += CVE-2018-19876
 
+CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
@@ -27,7 +29,7 @@ endif
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-CAIRO_CONF_ENV += LIBS="-latomic"
+CAIRO_LIBS += -latomic
 endif
 
 CAIRO_CONF_OPTS = \
@@ -81,6 +83,11 @@ else
 CAIRO_CONF_OPTS += --disable-ft
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+CAIRO_DEPENDENCIES += libexecinfo
+CAIRO_LIBS += -lexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 CAIRO_CONF_OPTS += --enable-gobject
 CAIRO_DEPENDENCIES += libglib2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
