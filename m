Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51792C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 19:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD9E41822;
	Wed,  3 Jan 2024 19:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD9E41822
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTTfAPja4S1N; Wed,  3 Jan 2024 19:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1302D41903;
	Wed,  3 Jan 2024 19:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1302D41903
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 224E91BF286
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5650825B1
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 19:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5650825B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtSLOt5GYVMb for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 19:11:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B15C282244
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 19:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B15C282244
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84DD1A4C0A3F;
 Wed,  3 Jan 2024 20:11:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39414)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rL6ed-000000008FW-1E79;
 Wed, 03 Jan 2024 20:11:51 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 20:11:50 +0100
Message-Id: <20240103191151.2777684-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704309111;
 bh=JXSIp25QLIO3H0L30OSQz/LCq2kjbW+SnfBuV6opZ3A=;
 h=From:To:Cc:Subject:Date:From;
 b=gv9bR4U9Ox0aShDk6Ab+LjVsmsognZUFush8fyRsztwlkYZrulSfL35Ol7av9V+22
 LflD70w9f/bWytpCtdJ5Bs3x08Ga6WJwEQ6XRHT4JV+4hfz4egff2jWGRpHjFz4VOD
 ZfbhP2sOwnvD/i3WiO+PqyeMJYSVTuMbyd0lrDB+Lhwlw/XVHWNLC+NiGafouaiy9g
 TZtVkhfipne44BTdClzyqjynDs0nAa/tU0wRCgyJyiC9ux9qLgsgMVS4u+zg6+hDSS
 AgjJuZseZhA/eGs0Z+pFa08B9aXNxYFg0wiKT/e3cz3cVDqYfA9YzFClFnAgPOSSDc
 18jdXrclKfS8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=gv9bR4U9
Subject: [Buildroot] [PATCH v2 1/2] package/exim: fix build with libexecinfo
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added optional support for execinfo

https://git.exim.org/exim.git/commitdiff/204a7a2c2e8601558905dc34c576a627045a9f21
https://git.exim.org/exim.git/commitdiff/48ea675fee2d5fee8d33c525e28727b69114cfce

in version 4.97 which was added to buildroot with commit
faec3ca30e358575f70a036879029f63f7da9b29

Fixes:
http://autobuild.buildroot.net/results/282/282882371e1d8c224c457bf65016f8abd11f8c45/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: add -DNO_EXECINFO only for non-glibc builds (Yann)

 package/exim/exim.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index fb9eecd71b..25d171875d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCC,$(HOSTCC))
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_EXTRALIBS)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -126,6 +127,15 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+EXIM_DEPENDENCIES += libexecinfo
+define EXIM_EXTRALIBS
+$(call exim-config-add,EXTRALIBS,-lexecinfo)
+endef
+else ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+EXIM_C_FLAGS = -DNO_EXECINFO
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
@@ -136,7 +146,7 @@ define EXIM_BUILD_CMDS
 		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
 		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
-		CFLAGS="-std=c99 $(TARGET_CFLAGS)"
+		CFLAGS="-std=c99 $(TARGET_CFLAGS) $(EXIM_C_FLAGS)"
 endef
 
 # Need to replicate the LFLAGS in install, as exim still wants to build
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
