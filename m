Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC66C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 184DB60720
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 184DB60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4FCD401CA;
	Thu,  5 Aug 2021 19:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L7kstRSXVTW0; Thu,  5 Aug 2021 19:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED0E40287;
	Thu,  5 Aug 2021 19:51:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2775F1C115D
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1450440532
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dg2ivWeY5l5n for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1637F40287
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C4CEC8B54B; Thu,  5 Aug 2021 19:49:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:18:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 53b25aa393bfefc9487b814af0f55a8a4235c3df
X-Git-Newrev: 922cd6f64c6923793f136b7cbe00e456575defd0
X-Patchwork-Hint: ignore
Message-Id: <20210805194938.C4CEC8B54B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gpsd: fix workaround
 for gcc bug 68485
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4272176864451122022=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4272176864451122022==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=922cd6f64c6923793f136b7cbe00e456575defd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 package/gpsd/gpsd.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0fbb5dfa1d..45f6d35ef8 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -16,6 +16,7 @@ GPSD_DEPENDENCIES = host-python3 host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
+GPSD_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
 
@@ -46,6 +47,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 GPSD_CFLAGS += -O0
+GPSD_CXXFLAGS += -O0
 endif
 
 # If libusb is available build it before so the package can use it
@@ -203,7 +205,8 @@ endif
 GPSD_SCONS_ENV += \
 	LDFLAGS="$(GPSD_LDFLAGS)" \
 	CFLAGS="$(GPSD_CFLAGS)" \
-	CCFLAGS="$(GPSD_CFLAGS)"
+	CCFLAGS="$(GPSD_CFLAGS)" \
+	CXXFLAGS="$(GPSD_CXXFLAGS)"
 
 define GPSD_BUILD_CMDS
 	(cd $(@D); \

--===============4272176864451122022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4272176864451122022==--
