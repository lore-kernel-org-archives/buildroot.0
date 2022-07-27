Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3532CC19F2C
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBCB160B5C;
	Wed, 27 Jul 2022 10:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBCB160B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B0uOjZhdt-rN; Wed, 27 Jul 2022 10:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F35CB60B4C;
	Wed, 27 Jul 2022 10:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F35CB60B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A32ED1BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E33A81AEA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E33A81AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_vnUfBmM9xR for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF04981AD1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF04981AD1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E177886561; Wed, 27 Jul 2022 09:47:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:56:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9e25d993778fec3080c35866befa43fc1fd3792
X-Git-Newrev: e861c85d4501d581bb731fd00d87e5ccae1bbbea
X-Patchwork-Hint: ignore
Message-Id: <20220727094717.E177886561@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pulseaudio: fix NLS build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e861c85d4501d581bb731fd00d87e5ccae1bbbea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with NLS raised since bump to version
16.1 in commit 6f3131296484767f037d3535ab69f328e94351db:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/11.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: src/libpulsecommon-16.1.so.p/pulsecore_lock-autospawn.c.o: in function `.L0 ':
lock-autospawn.c:(.text+0x1f8): undefined reference to `libintl_dgettext'

Fixes:
 - http://autobuild.buildroot.org/results/58ce701da2896125507048b29ded75cf9bcd6e35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0958107f8c..747c09ad4a 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -29,6 +29,8 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
+PULSEAUDIO_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
 PULSEAUDIO_CONF_OPTS += -Dsamplerate=enabled
 PULSEAUDIO_DEPENDENCIES += libsamplerate
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
