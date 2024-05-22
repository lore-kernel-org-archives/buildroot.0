Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15D1C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 624EA81FFD;
	Wed, 22 May 2024 07:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFcj7BcQLntF; Wed, 22 May 2024 07:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 686A981EA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 686A981EA2;
	Wed, 22 May 2024 07:02:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4780D1C584B
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E1240347
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgJdBBFif_WN for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:02:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22EB440181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EB440181
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22EB440181
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:02:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so7728613a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361364; x=1716966164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fiJZv7pl5DxZQI1bma+xHsSlXe8FCt8CsZE2VmqR9fM=;
 b=Tz4isg3fTMy4ITY5YqfkCCAvr48amRhvDbEP48NbkScgiYsqwXAFEDvr7KD2xcO8V3
 mRU1ONUjTWjPG7T4LM3RzuCHfhi+1lZZWYZJf3axUa/TX7lZ2UN/idgB7SoYLKfhZeIS
 05igU7NIUbX1kyugyNv1Fasvjohdsx3SdJii4bPS0UmmAbsHCCM5kU6ZEMiCz//3V0JT
 zSiHmjiiS1rVZ/J/X2MNjeRje/ZslA1QZTSNJJk7kDgxgTx3wtzDbE6W5F8R423WB1Fd
 CanfdgmTOw6idQmBHXRc3E2YoIzcxvhqvUshkT6YdyfKBcFEGkUErEyUGdtNIOAmkP7h
 3hyA==
X-Gm-Message-State: AOJu0YzOPMKx/cLjRHw1qAh5TSWc1HB4n1hp21Kh0pF5tplSzEqPLyXl
 iskOzCQLkiDo5wcQQ3rxmRH2uSakMrewqnRa9V47Py0GjFXSHSIwRz2RjQ8FVVKn+oYkd49SbUB
 YGFw=
X-Google-Smtp-Source: AGHT+IHcJhzpEJt7b+wnioqKIj2zc+f2hCguq6xzEDKVT7AQY6yBVVtfXv+ruwzzzVIOXAlYdtFQPA==
X-Received: by 2002:a50:c058:0:b0:56c:522f:53e1 with SMTP id
 4fb4d7f45d1cf-578329fe256mr896437a12.17.1716361363429; 
 Wed, 22 May 2024 00:02:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:02:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:19 +0200
Message-ID: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361364; x=1716966164;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fiJZv7pl5DxZQI1bma+xHsSlXe8FCt8CsZE2VmqR9fM=;
 b=F0uoxkl94kSmLPGo6xAroyxP6v6dsVQpVVkeozQeDKS091cPjI9ndn//W8Fm/KKzd7
 OaHPUvNI4Imff/5b/LnIiNDKbYAdjUYU7IEQh/baIVHgg9lrwcncR+8PvyjaOyaFhikf
 vMBMt7FAPEqxXXx5GXTfv0kxBVaHBkHpbYhu8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=F0uoxkl9
Subject: [Buildroot] [PATCH v2 00/18] apply patches with fuzz factor 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series will allow applying package patches with a fuzz factor of 0
instead of 2 (the patch command default value).
By setting the maximum fuzz factor to 0, we avoid that patches which
cannot be applied are incorrectly reported as valid, with positive
side-effects on version bumps.

To avoid regressions, it was necessary to fix all those patches that
were applicable with a fuzz factor of 1 or 2 before implementing this
change. The series was tested on commit 47078cc11862 ("package/zxing-cpp:
add options for enabling readers and/or writers") with a script that
executed the make legal-info command for all defconfigs contained in
Buildroot. Then, for all the affected packages, the compilation was
executed.

Dario Binacchi (18):
  board/orangepi/orangepi-zero: make the patches to be applied with fuzz
    0
  board/pine64/rock64: make the patches to be applied with fuzz 0
  boot/syslinux: update the patches to be applied with fuzz 0
  package/alsa-lib: update the patch to be applied with fuzz 0
  package/bzip2: update the patches to be applied with fuzz 0
  package/elfutils: update the patches to be applied with fuzz 0
  package/ffmpeg: update the patches to be applied with fuzz 0
  package/giflib: update the patches to be applied with fuzz 0
  package/libabseil-cpp: update the patch to be applied with fuzz 0
  package/libglib2: update the patches to be applied with fuzz 0
  package/libnl: update the patch to be applied with fuzz 0
  package/libopenssl: update the patches to be applied with fuzz 0
  package/openocd: update the patch to be applied with fuzz 0
  package/patchelf: update the patch to be applied with fuzz 0
  package/qemu: update the patches to be applied with fuzz 0
  package/qt5/qt5base: update the patches to be applied with fuzz 0
  package/vboot-utils: update the patches to be applied with fuzz 0
  support/scripts/apply-patches.sh: set the maximum fuzz factor to 0

 ...RM-dts-orange-pi-zero-enable-spi-nor.patch | 41 ++++++++--------
 ...ARM-dts-orange-pi-zero-enable-spidev.patch | 23 +++++----
 ...328-needs-itb-image-to-boot-properly.patch | 18 +++----
 .../0015-efi-main.c-include-efisetjmp.h.patch | 10 ++--
 ...01-Don-t-use-fork-on-noMMU-platforms.patch | 19 ++++----
 package/bzip2/0001-build-objects-twice.patch  | 14 +++---
 package/bzip2/0002-improve-build-system.patch | 12 +++--
 ...e-Werror-conditional-to-BUILD_WERROR.patch | 12 +++--
 .../0003-libavutil-Fix-mips-build.patch       | 16 ++++---
 ...dd-targets-to-manage-static-building.patch | 18 +++----
 ...veral-defects-found-by-Coverity-scan.patch | 20 ++++----
 ...0001-force-position-independent-code.patch | 14 +++---
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 16 ++++---
 ...workaround-to-the-libc-compat.h-copy.patch | 17 ++++---
 .../0003-Revert-Fix-static-builds.patch       | 16 ++++---
 ...01-configure-enable-build-on-uclinux.patch | 12 +++--
 ...ke-the-rpath-relative-under-a-specif.patch | 48 ++++++++++---------
 ...on-t-build-fp-bench-test-if-fenv.h-i.patch |  9 ++--
 .../qt5base/0006-Fix-build-on-riscv32.patch   | 18 +++----
 ...05-include-sys-sysmacros.h-for-major.patch | 12 +++--
 support/scripts/apply-patches.sh              |  2 +-
 21 files changed, 204 insertions(+), 163 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
