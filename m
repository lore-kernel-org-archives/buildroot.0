Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC3CD98E4
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 01:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A3E960F31;
	Thu, 18 Jun 2026 01:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZYHHUy3L6zG; Thu, 18 Jun 2026 01:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B2B60F2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781745826;
	bh=R9xs0Rq1FpsOydx/50zzoqUZVrC87jSDjsX3j9xoeJ0=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gq+HTicFl3N2A3Eb+oqNb8SSu+Y/XLSiE2gumWqKsX7dfLPGn7BaEv4RQO0s0C9dI
	 kFSUjzsRkX9l+c29IjYaf2FXLtEVgcvlA/46Ny6oK8xH/C/GpDSCF/hd4MELUlnPki
	 ERU5T1xzxrpEDtc36AO5ceUXcEi/+3uLAblV7VfrAF/BY4LTXTLgU6IjPAPQgcvy44
	 DF2zdeLm9NlCd/8BJIEVvIEke+gZywwQyQlsRm9IwfsOCvzgWLK1uj3fmav3WTfup4
	 bidNSbcCeeqwxztswovrL3MpIYItu09dfcy0cVJG80kgzhfXzmS6sD9DtokqB12jtQ
	 /QfjYndDBUsGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B2B60F2C;
	Thu, 18 Jun 2026 01:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 094481F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E384B60F2D
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF0j3REyUWzp for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 01:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B354960F2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B354960F2A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B354960F2A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 01:23:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso1983975e9.3
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 18:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781745820; x=1782350620;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpGTD1PvLTD9Eu1acMFXjfx75XlY3iBuYQrhEuhVguE=;
 b=mfxrzzfVsS8VSzyRwT9dc3osdvBWqnM1k5wEJZP1l56eHJj/XRbynijQnwimPq3W7T
 Y1j3HZ2xk0NVUpq3MNV1WPzG+niOGUEvuLmGhC0kvIRV8SNCVTObp29Ei+ivBNaxlD4A
 J57wHwrfapBuGYOAT2+B5zA1REUN+pSzecvII4zSQzpHAFvkxvZoyKv5Yu4tqNh5rkWr
 x60939WUXys1Lla6IdLp0pVO05gWIZozcVsPkUmPM8qpM4JHMkEdhjgkR65FSoVKo3//
 5KpgaKv941/3nSCWe09XGcZ/u7m+qwj50QMXAHbrofnejf8WttdRab8DQVceftpYkn9J
 SKpQ==
X-Gm-Message-State: AOJu0YwmWtTiWo6H7poEJu/eXCPTW+cBGVdt827oKHdVdVpcvMX59uI3
 TltkDTGMFYZjGB1qmHS3NSZZp1UYRc+C0EXxhNT8CLd5iyrZlZrcomObHJzN9AzsW5c=
X-Gm-Gg: Acq92OHeHlv33Qz5SRuonbsEqBZOcKYYobrYI1QsKIjJS/F0wa9ggE7gk4PksR2RT1P
 R0JLWv39kBTl33/crtWP1tYtmp/PSK1JGuC9R8+RVm3hRU0pYtzehV6ReyZoU1S7vDIYVSHY39U
 GLYm9N678DrxpN90ly9dncREeP/YDeVzrY7DAs6QyE0P4Q98D/Dg30bTzOwbHTf72TUiIeBbsgq
 QmmCNJ3PqdIfJinMXGbMmoF15VvoRupSTd2Zcg+Q/u8XyQelFlkmhwnOHYQmiyhU9jtPb9Oep3J
 x6rM8YVa+SpAWF+d3Zlkm+8Q4QF+TiY0NmcnAiK4OcvD31qbqKFFYFz0jdHhXtK2cSFYsNxJd69
 bYZ8I9hzbAloeeKw2q3RfuYWWIW6qIMo/gqI15Spal/xaK1ahcdLCD0OaebSx+06RzPzSryWIPa
 RfnLr/iMtqQK69R+XVowkqouG/J5jgoni+j3mMiDVS9dInX3iRwKzcLjOja138/ByR3evgGRYNg
 WyVHzxzWfRNmsSiLjYNxx77t8KLi5pxYpj93H0zPqMEprZXra+9NerJt0BDE3zrPqCy3TXlOWJ6
 daBfXMDr9UiIjPIYy8XeB4TL9RhqrEErZJYkxYHjT4QHEhGnKVAqtFjdSIM=
X-Received: by 2002:a05:600c:a30c:b0:490:c024:2eba with SMTP id
 5b1f17b1804b1-492333e2829mr93468485e9.22.1781745820338; 
 Wed, 17 Jun 2026 18:23:40 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com.
 [86.170.11.80]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a96b47sm171906785e9.13.2026.06.17.18.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 18:23:39 -0700 (PDT)
From: Christopher Obbard <obbardc@gmail.com>
Date: Thu, 18 Jun 2026 02:23:28 +0100
Message-Id: <20260618-wip-obbardc-boot-efibootguard-initial-pkg-v4-0-65fa5eb2acf4@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJBIM2oC/5WRQU7DMBBFr1J5zSB77MQxK+6BurAdOx3RxsFJU
 1CVu+MEEIhdVqP/NXpPmrmzMWQKI3s63FkOM42U+hLUw4H5k+27ANSWzJBjxZFruNEAyTmbWw8
 upQlCpHV211IB9TSRPcPw2oFpRR2Uw0bGlhXekMvq++Z6OZZ8onFK+WNTz2JtN4tAYXZYZgEce
 JRch6ClEea5u1g6P/p0Yatlxh9yzdU+MhayUMi9aqJuov1Plr/kCtUesixkpaNvsMbKCPeXvHy
 dKoe3a/nG9H2vZfkEhVIMtqsBAAA=
X-Change-ID: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6415; i=obbardc@gmail.com;
 h=from:subject:message-id; bh=u0AFy14m/TClHoO2OENtpUJ+BPqbqmf/en+E9gbXRUY=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqM0iWDk1yJ7Weh5AeyjNx7MWk/hijFkICm//Fx
 fy8/7NJLWOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCajNIlgAKCRBjTcTwaHBG
 +EenD/49uLM2GMMkTPYX2oNvIM8SGgc5VaAbb6MB1mWhhZakzhsrx0zPr3rrGk/buV9+qAmyt+j
 pmrnL8u2D3h98FnBJJfwCwMixI8eoyyt0vC8smK5jWJLOHdYlN7xh9y0ySImtycYALi8ODJGALE
 t4w/0RVDcSkrQEnHvgJrlEkYTPjolyVPfx3dMOO/spZAxmubdLtGq6UFSHNRcZnBYFqHaTPGBKt
 KZ3zDdijb8MZRCynlSCu5ygx+K6PoECYG4EsogQkyf9F1IZc7sQ4QHoJ165eq/Fan9SV6WyVgag
 7D1hlX7Y0ia53nX5eUgSYaK/TLyptCeqbnBiLK/Mau85fUVgQi4Zf5TXx8IMeVif+RN/MVNmuNg
 ZnNxjROozWFCxAZgFo80Y+xRFrqMOdOf2CKzo7ony2zzKD5wqRbw16XpBIeLqWqVMIv/rxOya+N
 8wSvGf4lyflVt9MV9odciYNnOP9jeC9o9ufbO2HpyEKRNiTQs4mOjIJYPrkX/3Dgd1aSktgacEX
 gQ6Jq7dF1pdzVkgXpl2mhPO5qVIzWaXwMui/Lphn8dPwaaP4xcGzxZ0R0Gfjebow4pbLligLLML
 hr3r6sqcZGG5YdDfGv5nw5i6fMzJ7PhgO8QuxeLufsG6FsgdC++je2PdEpbdWX0Jr2dI8k6A26Z
 c5eY8wSQr+B1SSA==
X-Developer-Key: i=obbardc@gmail.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781745820; x=1782350620; darn=buildroot.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bpGTD1PvLTD9Eu1acMFXjfx75XlY3iBuYQrhEuhVguE=;
 b=H+5hmgO2On29czMJoht/b+a16pfX0hQL3odSoepxng0B0Nrea0tKyFRprsUNX3OKYF
 N1+6UMSH/Y3JnqGaW1dk9TwPyyIGxd6b7oMptaMjlzPneVbeKSN/wUSA92nNcsrGIgME
 IdMaE5wfQyoIVENWw0LO4xb2DaeCzbMPM8F3KVAO9ZeeHnv9WPdYh9Hzt0aIlco40nsk
 yj7aazzErBkDIyWW/wDj0+KfL5IC9TAqYzPTPJsTBr6iUm9QMaovWieoaS2eVfTiWhD4
 RAAyUIbzuQWuN3hYKl0Ibv6PNODIoToHiwNsb81iBuPnHi1yjfeGwNDMfS09TSN7uaZO
 yWqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H+5hmgO2
Subject: [Buildroot] [PATCH v4 0/3] Add EFI Boot Guard bootloader package &
 example recipe
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christopher Obbard <obbardc@gmail.com>, efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series adds support for the EFI Boot Guard bootloader
(https://github.com/siemens/efibootguard) to Buildroot. EFI Boot Guard
can be useful when designing systems using A/B slot-based upgrades.

The first patch introduces the EFI Boot Guard bootloader package which
builds the EFI application as well as userspace and host applications.

The second patch adds a host-only package, osslsigncode, which is used
for signing the EFI binaries in the example EFI Boot Guard recipe
(introduced in the next patch).

The third patch adds an example recipe which demonstrates how to use
EFI Boot Guard in a typical EFI A/B boot scenario. This may serve as a
reference for users looking to integrate EFI Boot Guard into their
system. The introduced readme.txt file documents the example recipe.

A later patch series will extend the example recipe with integration
between EFI Boot Guard and RAUC, but that is still pending on RAUC
upstream [0].

EFI Boot Guard also provides a tool for generating UKI images, which
can then be signed for Secure Boot. The example recipe includes
instructions on how to generate a certificate chain, sign the image
and test Secure Boot in QEMU with OVMF firmware.

The example recipe has been boot-tested on QEMU with OVMF firmware and
I have confirmed the image boots & runs as expected.

Feedback welcome!

[0] https://github.com/rauc/rauc/pull/1450

Signed-off-by: Christopher Obbard <obbardc@gmail.com>
---
Changes in v4:
- Rebase onto latest master Buildroot branch.
- Patch 1 - "boot/efibootguard: new boot package":
 - Add EFIBOOTGUARD_CPE_ID_VENDOR.
 - Use BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS instead of a local architecture
   support symbol and remove the unused x86-64 only option.
 - Depend on a glibc toolchain with wchar support and add a Config.in
   comment for unsupported toolchains.
 - Always select BR2_PACKAGE_PCIUTILS since EFI Boot Guard links against
   libpci.
 - Add host-pkgconf to target and host dependencies and host-python3 to
   host dependencies (for bg_gen_unified_kernel).
 - Use the full --include argument in AUTORECONF_OPTS instead of -I.
 - Update user visible references from efibootguard to EFI Boot Guard.
 - Install EFI Boot Guard and kernel-stub EFI binaries for all supported
   architectures.
 - Install EFI binaries directly to BINARIES_DIR instead of an
   efibootguard subdirectory.
 - Add the Debian patch to drop ld --fatal-warnings to fix issue building
   on armhf.
 - Do not install bg_gen_unified_kernel into the target filesystem as it
   is mainly useful at image/UKI assembly time.
 - Remove the stale TODO about the Debian stack-protector patch.
- Patch 2 - "package/osslsigncode: add host package":
 - Newly package required to sign EFI binaries in example recipe.
- Patch 3 - "board/pc-efibootguard: add example EFI Boot Guard recipe":
 - Generate the ESP, EFI Boot Guard slot configuration and boot slot
   contents from post-image.sh instead of post-build.sh.
 - Drop unused genimage.cfg UUID templating.
 - Replace README.md with Buildroot-style readme.txt and expand the
   documentation for image layout, QEMU usage, slot configuration,
   watchdog handling, UKI boot and Secure Boot testing.
 - Remove the QEMU helper script and document the QEMU command directly
   in the readme.
 - Enable EFI Boot Guard watchdog by default.
 - Add optional UKI generation using bg_gen_unified_kernel (enabled by
   default).
 - Add optional Secure Boot signing support (enabled by default).
 - Enable EFI framebuffer console support and the QEMU i6300esb watchdog
   driver in the kernel fragment.
 - Add a systemd watchdog configuration so Linux takes over the watchdog
   after EFI Boot Guard arms it.
 - Reduce the example image size by shrinking boot partitions to 32M
   and rootfs partitions to 120M.
 - Switch to Bootlin x86-64 glibc stable external toolchain.
 - Simplify the kernel configuration by using the upstream x86_64
   defconfig.
 - Remove unrelated packages from the example image, including wifi
   firmware, connman and acpid.
- Link to v3: https://lore.kernel.org/r/20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com

Changes in v3:
- Rebase on latest master branch
- Fix shellcheck warnings in board/pc-efibootguard/post-build.sh
- Add note that UKI/Secure Boot is not enabled in the example recipe
- Convert example recipe readme.txt to Markdown
- Bring-up EFI Boot Guard tools in example recipe & document usage
- Add note about RAUC integration patch
- Link to v2: https://lore.kernel.org/r/20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com

Changes in v2:
- Rebase on top of buildroot 2026.02
- Update efibootguard to v0.22
- Link to v1: https://lore.kernel.org/r/20251219-wip-obbardc-boot-efibootguard-initial-pkg-v1-0-0f307ee73919@gmail.com

---
Christopher Obbard (3):
      boot/efibootguard: new boot package
      package/osslsigncode: add host package
      board/pc-efibootguard: add example EFI Boot Guard recipe

 DEVELOPERS                                         |   4 +
 board/pc-efibootguard/genimage.cfg                 |  56 ++++
 board/pc-efibootguard/linux.fragment               |  29 +++
 board/pc-efibootguard/post-image.sh                | 162 ++++++++++++
 board/pc-efibootguard/readme.txt                   | 281 +++++++++++++++++++++
 .../etc/systemd/system.conf.d/10-watchdog.conf     |   7 +
 boot/Config.in                                     |   2 +
 .../0001-Do-not-use-ld-fatal-warnings.patch        |  32 +++
 boot/efibootguard/Config.in                        |  30 +++
 boot/efibootguard/Config.in.host                   |   8 +
 boot/efibootguard/efibootguard.hash                |   3 +
 boot/efibootguard/efibootguard.mk                  |  67 +++++
 configs/pc_x86_64_efibootguard_defconfig           |  24 ++
 package/Config.in.host                             |   1 +
 package/osslsigncode/Config.in.host                |   9 +
 package/osslsigncode/osslsigncode.hash             |   3 +
 package/osslsigncode/osslsigncode.mk               |  21 ++
 17 files changed, 739 insertions(+)
---
base-commit: 67449130e9fdd71a38ca26539dddfa8c882b1977
change-id: 20250207-wip-obbardc-boot-efibootguard-initial-pkg-9d16e4b283fd

Best regards,
-- 
Christopher Obbard <obbardc@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
