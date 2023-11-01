Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A0AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 228BD43111;
	Wed,  1 Nov 2023 11:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228BD43111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXQVSEHJ93ak; Wed,  1 Nov 2023 11:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAE06430DB;
	Wed,  1 Nov 2023 11:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE06430DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00CAB1BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD18C848E4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD18C848E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZvtfelxrY8I for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F55484938
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F55484938
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C68686320; Wed,  1 Nov 2023 11:26:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 12:25:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0645cb39e0ce3af743190e587812a5bd4c1f4b24
X-Git-Newrev: d4ca1b03c0d6f34d10d10cab06ca28c24a7d296d
X-Patchwork-Hint: ignore
Message-Id: <20231101112613.2C68686320@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettle: add missing dependency on
 host-m4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4ca1b03c0d6f34d10d10cab06ca28c24a7d296d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
