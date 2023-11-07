Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E46C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23AB260D4F;
	Tue,  7 Nov 2023 21:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23AB260D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulkqOLBtScGn; Tue,  7 Nov 2023 21:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B28260C20;
	Tue,  7 Nov 2023 21:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B28260C20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24A5B1BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F244C60C20
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F244C60C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AX_lLy4GfL_6 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C1360C0F
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C1360C0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D2B86C3F; Tue,  7 Nov 2023 21:50:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Nov 2023 22:44:07 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 1adc7b166f7eddaf6c448aaaf50c3deb5e925d5e
X-Git-Newrev: 64afb0136d4e0b4398f4026b140a0fb0b57c9b52
X-Patchwork-Hint: ignore
Message-Id: <20231107215037.12D2B86C3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nettle: add
 missing dependency on host-m4
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

commit: https://git.buildroot.net/buildroot/commit/?id=64afb0136d4e0b4398f4026b140a0fb0b57c9b52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

nettle uses m4 during its build process. Without it, the build fails
with:

m4 ./m4-utils.m4 ./asm.m4 config.m4 machine.m4 aes-decrypt-internal.asm >aes-decrypt-internal.s
/bin/sh: 1: m4: not found

For the target package this is not visible, as the existing gmp
dependency pulls in host-m4. But technically speaking, nettle needs
host-m4 directly, so it makes sense to have this dependency.

For the host package, it clearly fails to build, but probably isn't
very visible as most systems have m4 installed system-wide: this was
noticed when building inside Buildroot's minimal Docker
container. There are no recorded autobuilder failures for this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4ca1b03c0d6f34d10d10cab06ca28c24a7d296d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index d1987d427f..04e3adb84e 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -6,7 +6,7 @@
 
 NETTLE_VERSION = 3.9.1
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
-NETTLE_DEPENDENCIES = gmp
+NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
@@ -15,6 +15,8 @@ NETTLE_CPE_ID_VENDOR = nettle_project
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
 
+HOST_NETTLE_DEPENDENCIES = host-m4
+
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_ARM_CPU_ARMV4)$(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV7M),y)
 NETTLE_CONF_OPTS += --disable-assembler
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
