Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437CFC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 09:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC9D417C9;
	Sat, 13 Aug 2022 09:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAC9D417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2xFpw6yLSxy; Sat, 13 Aug 2022 09:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77999418E2;
	Sat, 13 Aug 2022 09:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77999418E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF9761BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0D04019D
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0D04019D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16Ap2FQ0rbno for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 09:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1EC40143
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1EC40143
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 09:00:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j1so3476412wrw.1
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 02:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=dST6JVB0sqQbyyATAQhURQDLKLiuRmcriEHlxK2STQc=;
 b=8Q8qwusaEQYSnea0gisleXjpxhmbOT8v7ds2zfBNbUnYO8uELWh5zEo9j5QhjN+pIU
 oMr20yTXgc/joMe3eMoqwxu5LL/K/EjLmUzkk8e0pK3aewB6K5qHqU4intjtfjtxmKER
 AA8Fb84umOErJytaG6NvARAOJuAcXqgNHpS446auNhw2BPA2J1xH98ke+ZzNGdqE6L+8
 I3l4ywHTRLyHMyhhYVW3YYraAKw9LPQb7XZFWIKmZhh8CKrYDuudJ+pksTnVmQc5JHaA
 Yaxnopih1tX7yzYSIqgcgMivjqvSckO3kZKAdnxM7x74iD56jBlIh+tmbBHXwFqvt5ko
 2w/A==
X-Gm-Message-State: ACgBeo0y8rxYmrmQ6HE2ym/v0otJ2ndf/TT1/6BIUmP5YWZHZmT2EIzA
 PGEHCkmYEWf4XDRDGUg4l4d8PLtMgis=
X-Google-Smtp-Source: AA6agR4pIXeK9PgXfahRn+Ge5NpiKoovIJG8N6pyGyBXYdoK/fg3lX5UyqsAwURyFbU6IsN+Xd/Jvw==
X-Received: by 2002:a05:6000:4084:b0:21e:c694:80db with SMTP id
 da4-20020a056000408400b0021ec69480dbmr3735108wrb.681.1660381216446; 
 Sat, 13 Aug 2022 02:00:16 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:ac43:2f79:1c81:6f7d])
 by smtp.gmail.com with ESMTPSA id
 d6-20020adffbc6000000b002206d5fded3sm1480892wrs.104.2022.08.13.02.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 02:00:15 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 11:00:14 +0200
Message-Id: <20220813090014.2734188-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=dST6JVB0sqQbyyATAQhURQDLKLiuRmcriEHlxK2STQc=;
 b=q1up1pfFUNrryUiuOaGjNYjIL+LInkVHrigr1KTrpU1qivXwq5pubuaSYiVOAg0LPG
 Ex264hksz2QSwwdbfLVkRROCmyHLg3MPhZVJfhhq98faaxsxSofuBgWBMVvkoF2GLc02
 f6Bi6yfCZNf5rXmTkn49s8UmA+ut1bvM3RC9yKyA06bqgJoq5710lT0oxyO9GjWXe6+c
 PLxAJr0uUxiMVr3aYz2aWyn3f775rvdh7B5rNiEBiuT8Wo/Oi0FuSroOrFHLbdCTbWO8
 DnnCu7EwlTOqCHQL+afJaQXZjAGSal0wLq2emxprFau1TeJu93uCMIzj3JaBi7OnSZB7
 KXjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q1up1pfF
Subject: [Buildroot] [PATCH] package/pkg-generic: don't exclude virtual
 packages from packages list
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, with a configuration with an internal toolchain, and no other
package is selected [0], especially when one wants to generate an SDK or
a pre-built, pre-installed toolchain, running 'make' will only build
glibc (and its dependencies), and not the full toolchain, as one would
have expected, so there would be no host-final-gcc.

The reason is that 'toolchain' is a virtual package, so it is excluded
from PACKAGES, the list of packages enabled in the configuration. so it
is not a dependency of target-finalize, and so nothing pulls it in the
build.

The reason for excluding virtual packages from that list is not obvious.

When virtual packages were introduced in 743982441201 (packages: add
infrastructure for virtual packages), there was no BR2_PACKAGE_FOO
symbol for virtual packages (but there was BR2_PACKAGE_HAS_FOO), so
there was no telling that the virtual package was enabled, like we had
for the other kinds of packages (normal, bootloader, toolchain, or linux
kernel).

That caused issues, so in f674c428c2ef (core/pkg-virtual: do not check
they are neabled [sic]), and then 3e1b33a5349b (pkg-generic: improve
incorrectly used package detection), we explicitly excluded the virtual
packages from causing a build failure when something depended on them,
as we could not yet now whether a virtual package was actually enabled
or not.

Then, in 842ba7eceffb (pkg-generic: fix rdepends and phony targets of
virtual packages), we eventually associated a virtual package to is
BR2_PACKAGE_HAS_FOO, which allows treating virtual packages like the
other kinds of packages. There, we explicitly kept virtual packages out
of the list, though (the reasoning was that virtual packages install
nothing in host/ or target/, so they do not directly contribute to the
final content, so we do not need to rsync them, so this was an
optimisation).

However, virtual packages are in fact actual generic packages, and it is
possible for virtual packages to actually provide content for the final
image. Even though we do not have any virtual package that has actual
_INSTALL_CMDS, we still have udev that provides a user for example;
virtual packages in br2-external trees may also very well provide
install commands (e.g. to install files common to their various
implementations).

So, there is currently no technical reason to exclude virtual packages
from PACKAGES, the list of packages enabled in the configuration.

Drop the excluding condition, and always add enabled package, whatever
their kind, to the list of enabled packages.

[0] defconfig to reproduce the issue:
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b233b07548..f24e03a325 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1207,9 +1207,7 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
-ifneq ($$($(2)_IS_VIRTUAL),YES)
 PACKAGES += $(1)
-endif
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
