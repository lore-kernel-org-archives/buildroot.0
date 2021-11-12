Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3E8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64B76102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D64B76102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF7886061C;
	Fri, 12 Nov 2021 13:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vmmOG9Ba1qgw; Fri, 12 Nov 2021 13:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05C460682;
	Fri, 12 Nov 2021 13:36:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE621BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9F924053E
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVC0UNrfGD4u for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE23840530
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 408EA8B716; Fri, 12 Nov 2021 13:32:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:35:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 907fc65bbb07b2d099d6b721e12abb60e1d22d0d
X-Git-Newrev: fb6b8e5ee671c8b6fb913c7dd98e5187cae08884
X-Patchwork-Hint: ignore
Message-Id: <20211112133210.408EA8B716@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix NLS build
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb6b8e5ee671c8b6fb913c7dd98e5187cae08884
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/ddfbd684e78e2b8b9ad40bedb4612ea0197d231a:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/9.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.339.0.p/pipewire.c.o: in function `i18n_ntext':
pipewire.c:(.text+0x3ec): undefined reference to `libintl_dngettext'

Indeed, since that time, pipewire uses the new meson intl dependency API
which has been added in version 0.59.0 with
https://github.com/mesonbuild/meson/commit/2c6ccfe4c40741ae1f15f073f7d7bc8c398a1648

This new intl dependency API is broken (which is not so surprising based
on my experience of meson). Don't even try to fix it as meson is not
very prone to merge our pull requests:
https://github.com/mesonbuild/meson/issues/6108
https://github.com/mesonbuild/meson/pull/6629

Fixes:
 - http://autobuild.buildroot.org/results/435d59d40209cc1028cee8e2a71a69cd3769ab56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire/pipewire.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 97a6b77510..cbf24dd0ec 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -11,6 +11,7 @@ PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
 PIPEWIRE_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+PIPEWIRE_LDFLAGS = $(TARGET_NLS_LIBS)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
