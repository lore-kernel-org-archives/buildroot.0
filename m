Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2241EC25B4E
	for <buildroot@archiver.kernel.org>; Sun, 22 Jan 2023 11:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D27360B57;
	Sun, 22 Jan 2023 11:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D27360B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-wA8IquNXAq; Sun, 22 Jan 2023 11:56:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD16160AC1;
	Sun, 22 Jan 2023 11:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD16160AC1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8001BF379
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85F740452
 for <buildroot@lists.busybox.net>; Sun, 22 Jan 2023 11:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85F740452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ISfVQmfV_HP for <buildroot@lists.busybox.net>;
 Sun, 22 Jan 2023 11:56:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6AA40101
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB6AA40101
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 11:56:43 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout04.t-online.de (Postfix) with SMTP id 77B6A12BC1
 for <buildroot@buildroot.org>; Sun, 22 Jan 2023 12:56:41 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.185.38]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pJYxl-29ALRb0; Sun, 22 Jan 2023 12:56:41 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:36428)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pJYxk-0007vS-32
 for buildroot@buildroot.org; Sun, 22 Jan 2023 12:56:41 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 22 Jan 2023 12:56:38 +0100
Message-Id: <20230122115640.24776-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230122115640.24776-1-bernd.kuhls@t-online.de>
References: <20230122115640.24776-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674388601-927EB95E-B53BA483/0/0 CLEAN NORMAL
X-TOI-MSGID: dca7ab31-6aed-4bf5-8087-e56ca450b0c0
Subject: [Buildroot] [PATCH 4/6] package/kodi: fix armv5 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable neon support when not available.

Fixes build error not yet found by autobuilders

/tmp/cc8LvPwi.s: Assembler messages:
/tmp/cc8LvPwi.s:28: Error: selected processor does not support `vldmia r1,{ q4-q7 }' in ARM mode
/tmp/cc8LvPwi.s:29: Error: selected processor does not support `vldmia r0,{ q8-q11 }' in ARM mode
/tmp/cc8LvPwi.s:30: Error: selected processor does not support `vmul.f32 q0,q8,d8[0]' in ARM mode
/tmp/cc8LvPwi.s:31: Error: selected processor does not support `vmul.f32 q1,q8,d10[0]' in ARM mode
/tmp/cc8LvPwi.s:32: Error: selected processor does not support `vmul.f32 q2,q8,d12[0]' in ARM mode
/tmp/cc8LvPwi.s:33: Error: selected processor does not support `vmul.f32 q3,q8,d14[0]' in ARM mode
/tmp/cc8LvPwi.s:34: Error: selected processor does not support `vmla.f32 q0,q9,d8[1]' in ARM mode
/tmp/cc8LvPwi.s:35: Error: selected processor does not support `vmla.f32 q1,q9,d10[1]' in ARM mode
/tmp/cc8LvPwi.s:36: Error: selected processor does not support `vmla.f32 q2,q9,d12[1]' in ARM mode
/tmp/cc8LvPwi.s:37: Error: selected processor does not support `vmla.f32 q3,q9,d14[1]' in ARM mode
/tmp/cc8LvPwi.s:38: Error: selected processor does not support `vmla.f32 q0,q10,d9[0]' in ARM mode
/tmp/cc8LvPwi.s:39: Error: selected processor does not support `vmla.f32 q1,q10,d11[0]' in ARM mode
/tmp/cc8LvPwi.s:40: Error: selected processor does not support `vmla.f32 q2,q10,d13[0]' in ARM mode
/tmp/cc8LvPwi.s:41: Error: selected processor does not support `vmla.f32 q3,q10,d15[0]' in ARM mode
/tmp/cc8LvPwi.s:42: Error: selected processor does not support `vmla.f32 q0,q11,d9[1]' in ARM mode
/tmp/cc8LvPwi.s:43: Error: selected processor does not support `vmla.f32 q1,q11,d11[1]' in ARM mode
/tmp/cc8LvPwi.s:44: Error: selected processor does not support `vmla.f32 q2,q11,d13[1]' in ARM mode
/tmp/cc8LvPwi.s:45: Error: selected processor does not support `vmla.f32 q3,q11,d15[1]' in ARM mode
/tmp/cc8LvPwi.s:46: Error: selected processor does not support `vstmia r0,{ q0-q3 }' in ARM mode

with this defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 812c4be6e8..5161314aa1 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -144,6 +144,14 @@ else
 KODI_CONF_OPTS += -DWITH_CPU=$(BR2_ARCH)
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+KODI_CONF_OPTS += -DENABLE_NEON=ON
+else ifeq ($(BR2_aarch64),y)
+KODI_CONF_OPTS += -DENABLE_NEON=ON
+else
+KODI_CONF_OPTS += -DENABLE_NEON=OFF
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 KODI_CONF_OPTS += -D_SSE_OK=ON -D_SSE_TRUE=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
