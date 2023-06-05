Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16C9C7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E40A82217;
	Mon,  5 Jun 2023 20:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E40A82217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMHR1YX2-jvu; Mon,  5 Jun 2023 20:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89553821B4;
	Mon,  5 Jun 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89553821B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 365051BF3A1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3462A60F83
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3462A60F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwEb6PlckVmI for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 525B960FE6
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 525B960FE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A24386C8E; Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:09:26 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ff7de79f729ec54629db7c7e46ed620884995cb1
X-Git-Newrev: 2cf01c59ed6a2e8500017936f3d6ecdb7940c399
X-Patchwork-Hint: ignore
Message-Id: <20230605201058.3A24386C8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/busybox: disable
 sha1/sha256 hwaccel with x86
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

commit: https://git.buildroot.net/buildroot/commit/?id=2cf01c59ed6a2e8500017936f3d6ecdb7940c399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buxybox's init segfault when built with x86 musl toolchain due to
recent changes about sha1 and sha156 hwaccel support in Busybox 1.36.0.

From Alpinelinux [1]:
"main/busybox: disable sha hwaccel
 the flag check for this seems incorrect- it triggers sha_ni use when
 the instructions aren't available, but avx512vl/bw is - Elly on irc

 causes failures in github actions, which have avx512 but no sha_no"

The flag check was supposed to be fixed upstream by commit [2].

But init still crash with the latest 1_36_stable (with backported patch)
and master branch...

The same workaround has been applied to openembedded-core [3], which
states that they also have the issue with glibc.

Disable hardware sha acceleration on x86 (not x86_64), to avoid the
issue.

Checked that qemu_x86_64_defconfig with musl for x86_64 for core2 boot
as expected with sha hwaccel enabled.

Fixes:
https://gitlab.com/buildroot.org/toolchains-builder/-/jobs/4202276721

[1] https://git.alpinelinux.org/aports/commit/main/busybox?id=ae2cfdf6f6da3dc46ee09d8ceafa26921f6e058e
[2] https://git.busybox.net/busybox/commit/?id=bd76b75f72f717150b909e8c64edfda725cabe11
[3] https://github.com/openembedded/openembedded-core/commit/22f639d61127f4b82a79008c5305e44e090a3680

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a57c02a4ea48bdb3ffc8cdba2569d240275b1bc3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1633ca525d..fd4f3c17c5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -276,6 +276,15 @@ define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
 endef
 endif
 
+# Disable SHA1 and SHA256 HWACCEL to avoid segfault in init
+# with some x86 toolchains (mostly musl?).
+ifeq ($(BR2_i386),y)
+define BUSYBOX_MUSL_DISABLE_SHA_HWACCEL
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA1_HWACCEL)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SHA256_HWACCEL)
+endef
+endif
+
 # Only install our logging scripts if no other package does it.
 ifeq ($(BR2_PACKAGE_SYSKLOGD)$(BR2_PACKAGE_RSYSLOG)$(BR2_PACKAGE_SYSLOG_NG),)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
@@ -364,6 +373,7 @@ endef
 BUSYBOX_TARGET_FINALIZE_HOOKS += BUSYBOX_INSTALL_ADD_TO_SHELLS
 
 define BUSYBOX_KCONFIG_FIXUP_CMDS
+	$(BUSYBOX_MUSL_DISABLE_SHA_HWACCEL)
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
