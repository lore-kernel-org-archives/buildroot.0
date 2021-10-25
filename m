Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F096AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD2D60230
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBD2D60230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87378605A6;
	Mon, 25 Oct 2021 20:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87HmfcLqMkqk; Mon, 25 Oct 2021 20:14:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F9860737;
	Mon, 25 Oct 2021 20:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA1931BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A80F1403D5
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8C3VTxPYLBI for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFBBB400F0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:14:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D7A28885F; Mon, 25 Oct 2021 20:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 22:13:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c8b881daf466c12f7e96282972021b927d473769
X-Git-Newrev: 09109ec95779b8890d9af5429ff54dec8b3fcd29
X-Patchwork-Hint: ignore
Message-Id: <20211025201042.3D7A28885F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gpsd: fix
 workaround for gcc bug 68485
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
Content-Type: multipart/mixed; boundary="===============2235838468338708404=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2235838468338708404==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=09109ec95779b8890d9af5429ff54dec8b3fcd29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Workaround for gcc bug 68485 doesn't work anymore since bump to version
3.21 in commit 5b3e72139952e0c953c8649cca55571cec5f3836 because CXXFLAGS
is appended after CFLAGS and does not contain -O0:

/tmp/instance-7/output-1/host/bin/microblazeel-linux-gcc -o rtcm2_json.os -c --sysroot=/tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot -pthread -Wall -Wcast-align -Wextra -Wimplicit-fallthrough -Wmissing-declarations -Wmissing-prototypes -Wno-missing-field-initializers -Wno-uninitialized -Wpointer-arith -Wreturn-type -Wstrict-prototypes -Wvla -O0 -Os -g0 -pthread -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/include/dbus-1.0 -I/tmp/instance-7/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/dbus-1.0/include rtcm2_json.c
during RTL pass: reload
rtcm2_json.c: In function ‘json_rtcm2_read’:
rtcm2_json.c:267:1: internal compiler error: in gen_reg_rtx, at emit-rtl.c:1155
  267 | }
      | ^

It should be noted that GPSD_CXXFLAGS was added 5 years ago with commit
b4c050e9afed7a8dc302e6e1014cc4ffb508590d but was not actually used in
that commit or any later.

Fixes:
 - http://autobuild.buildroot.org/results/fab33f25b08fa218af91640fdbd8c0dcf1d07228

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 922cd6f64c6923793f136b7cbe00e456575defd0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index ef82fd913f..7cec5d11fc 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -15,6 +15,7 @@ GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
+GPSD_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
@@ -45,6 +46,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 GPSD_CFLAGS += -O0
+GPSD_CXXFLAGS += -O0
 endif
 
 # If libusb is available build it before so the package can use it
@@ -202,7 +204,8 @@ endif
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
 	CFLAGS="$(GPSD_CFLAGS)" \
-	CCFLAGS="$(GPSD_CFLAGS)"
+	CCFLAGS="$(GPSD_CFLAGS)" \
+	CXXFLAGS="$(GPSD_CXXFLAGS)"
 
 define GPSD_BUILD_CMDS
 	(cd $(@D); \

--===============2235838468338708404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2235838468338708404==--
