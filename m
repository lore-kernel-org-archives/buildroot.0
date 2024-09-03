Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C43CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB394605C4;
	Tue,  3 Sep 2024 21:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrLXhCVBv9Qn; Tue,  3 Sep 2024 21:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A85C605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A85C605FD;
	Tue,  3 Sep 2024 21:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 703291BF20B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E0FF605FD
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfK-E7k9khYU for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63684605C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63684605C4
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:59:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59F6B86D70; Tue,  3 Sep 2024 21:59:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:58:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a784191d3fd77a7af444495c065d55f1c5889943
X-Git-Newrev: 248c2d045e780b23e6ed19fec1f242460ac464e3
X-Patchwork-Hint: ignore
Message-Id: <20240903215901.59F6B86D70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add -no-pie to
 LDFLAGS
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
Content-Type: multipart/mixed; boundary="===============4622172867558570116=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4622172867558570116==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=248c2d045e780b23e6ed19fec1f242460ac464e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Arm Trusted Firmware (TF-A) v2.11 fails to build in some situations
with the error message:

    ld: build/qemu/release/bl1/bl1.elf: error: PHDR segment not covered by LOAD segment

This error can be reproduced with the commands:

    make qemu_aarch64_ebbr_defconfig
    utils/config --set-str BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE v2.11
    make olddefconfig
    make

This issue was reported in [1].

This error is coming from a check that was made more strict since
binutils ld 2.34. This error message is normally related to dynamic
linker, so it should normally not apply to a package like TF-A.

When BR2_SHARED_LIBS=y (shared libraries only) and BR2_PIC_PIE=y
(Build code with PIC/PIE), the Buildroot toolchain-wrapper will try
to enable position-independent code/executables. See [2]. This
configuration is a common default.

Arm Trusted Firmware (TF-A) build system, on its side, tries to detect
if the toolchain enables PIE automatically. It does so by checking if
--enable-default-pie is in the output of "$(CC) -v". If found, the TF-A
build system tries to disable PIE globally (it can be explicitly
enabled again with the ENABLE_PIE=1 build variable, in some specific
configurations). This detection mechanism is not working with the
Buildroot toolchain wrapper which is enabling PIE silently. See [3].

Commit 1061ed6c "boot/arm-trusted-firmware: add -fno-PIE to CFLAGS"
added the option -fno-PIE in CFLAGS for that reason. See [4].
TF-A >= v2.11 now needs the same treatment for LDFLAGS. This is
because TF-A switched the default linker from "ld" to "gcc", in
upstream commit [5]. This change makes the Buildroot toolchain wrapper
to enable PIE at link, without passing the "--no-dynamic-linker" option
that would normally avoids this ld error.

Also, even if there is no defconfigs using the
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION config directive, it is
worth mentioning that the Buildroot TF-A "latest version" was updated
to v2.11 in commit 9c50759cd "boot/arm-trusted-firmware: bump to
v2.11". See [6]. This latest version is the default choice. So
Buildroot is subject to generate this build failure. This can be
reproduced with the commands:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
    BR2_TOOLCHAIN_EXTERNAL=y
    EOF
    make olddefconfig
    make arm-trusted-firmware

This commit fixes the issue by adding the option "-no-pie" in LDFLAGS.
This will prevent the Buildroot toolchain wrapper to enable PIE, for
versions using "gcc" as a linker. This change should also remain
compatible with older TF-A < 2.11 using "ld" as a linker, since
"-no-pie" is also a valid ld option.

Fixes:

    ld: build/qemu/release/bl1/bl1.elf: error: PHDR segment not covered by LOAD segment

[1] https://github.com/TrustedFirmware-A/trusted-firmware-a/issues/26
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08-rc3/toolchain/toolchain-wrapper.c?ref_type=tags#L403
[3] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/tags/v2.11.0/Makefile#711
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/1061ed6c6273e90618b05ddc0cb66be17364da33
[5] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2f1c5e7eb1775b252fa4998e10093b8ac34ca699%5E%21/
[6] https://gitlab.com/buildroot.org/buildroot/-/commit/9c50759cd1677e1739078239a1e86fb1d62e33e8

Reported-by: Vincent Stehlé <vincent.stehle@arm.com>
Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a3a44feea9..172a930b5c 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -77,11 +77,13 @@ endif
 
 ifeq ($(BR2_PIC_PIE),y)
 ARM_TRUSTED_FIRMWARE_CFLAGS += -fno-PIE
+ARM_TRUSTED_FIRMWARE_LDFLAGS += -no-pie
 endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_ENV += \
 	$(TARGET_MAKE_ENV) \
-	CFLAGS="$(ARM_TRUSTED_FIRMWARE_CFLAGS)"
+	CFLAGS="$(ARM_TRUSTED_FIRMWARE_CFLAGS)" \
+	LDFLAGS="$(ARM_TRUSTED_FIRMWARE_LDFLAGS)"
 
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_ARCH_MAJOR=7

--===============4622172867558570116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4622172867558570116==--
