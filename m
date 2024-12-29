Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F423CE7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9880C80C3A;
	Sun, 29 Dec 2024 14:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGLj5GVvXM5X; Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4239C80C32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4239C80C32;
	Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE34772
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7FF360852
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWt7_WixE2CM for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02DC060783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DC060783
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02DC060783
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3B665E0003;
 Sun, 29 Dec 2024 14:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2024 15:55:23 +0100
Message-ID: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XN/lRtzJmS8NH68pxF2kwr1ec/unrNXuyi2WBdf/j90=;
 b=YzgPBSJgc/mbciHZhtn1AtcUBMHaSngqa7v/4YYUvtHfs36a8jN00gGqS4IPB6mVuENJn9
 gezZYlCHWgj/IKkZDYic8Asw85yO3I8kJokIuBAt5lwisT3MKyJgNzIFgmMgFvgWPAHaL4
 D1WPax9ymVY4c2rFT6zy7U9KZGt8afFq4drQIQOGknU1/c0DQJIjpWRlNkPxqMAQMxG/Z4
 WApzxgfOFZgWK5wa8Z7xQ2HEs8B84hQ6hPwfGiaIOpz/oeX6Yh51PCCmgg5J2T0hAWvai/
 bNCLv7+vOwut3fFmNePkffJgwz5QVBEZmHHZEZtR33MIBToIMaOyZyRNB1+wsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YzgPBSJg
Subject: [Buildroot] [PATCH 00/12] Remove DirectFB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This patch series proposes to remove DirectFB entirely.

Indeed, directfb.org has been down for many years: we are directly
using sources.buildroot.net as the source for directfb and
directfb-examples since 2022. The linux-fusion source code is still
fetched from directfb.org, and therefore causes autobuilder failures
[1].

A new directfb2 project at https://github.com/directfb2/ aims at
reviving DirectFB, and there has been an attempt in July 2024 [2] to
package it in Buildroot, but the quality level of the submission was
not very high, and despite a detailed review, the submitter never came
back with a v2.

Therefore, it is time to drop support for DirectFB entirely. In any
case, if DirectFB 2 is to be added at some point in the future, we
would have to revisit all users of DirectFB in Buildroot to verify
that they still work, so having a tree cleaned-up from DirectFB
support is in fact helping to get DirectFB 2 support added in the
future.

Best regards,

Thomas

[1] http://autobuild.buildroot.net/results/1b5b87883841b189bd9cd65853ca1e2fcd996365/
[2] https://lore.kernel.org/buildroot/20240705132544.351613-1-shengwen1997.tw@gmail.com/

Thomas Petazzoni (12):
  package/directfb-examples: remove package
  package/linux-fusion: remove package
  package/lite: remove package
  package/links: drop directfb support
  package/gstreamer1/gst1-plugins-bad: drop directfb plugin
  package/qt5/qt5base: drop directfb graphics backend
  package/sdl: drop directfb support
  package/sdl2: drop directfb support
  package/tekui: drop directfb support
  package/vulkan-loader: drop directfb support
  package/vulkan-tools: drop directfb support
  package/directfb: remove package

 .checkpackageignore                           |   19 +-
 Config.in.legacy                              |   58 +-
 package/Config.in                             |    4 -
 .../directfb-examples/0001-remove-bzero.patch |   17 -
 package/directfb-examples/Config.in           |   11 -
 .../directfb-examples/directfb-examples.hash  |    3 -
 .../directfb-examples/directfb-examples.mk    |   18 -
 ...01-fix-missing-davinci-voodoo-header.patch | 1726 -----------------
 package/directfb/0002-imlib2-config.patch     |   36 -
 package/directfb/0003-setregion-lock.patch    |   99 -
 package/directfb/0004-use-gcc-link.patch      |   35 -
 .../0005-add-missing-idivine-header.patch     |   65 -
 ...-fix-client-gfx_state-initialisation.patch |   39 -
 ...-__NR_futex-on-32bit-architectures-u.patch |   43 -
 package/directfb/Config.in                    |  167 --
 package/directfb/directfb.hash                |    3 -
 package/directfb/directfb.mk                  |  172 --
 package/gstreamer1/gst1-plugins-bad/Config.in |    5 -
 .../gst1-plugins-bad/gst1-plugins-bad.mk      |   10 +-
 package/links/Config.in                       |    6 +-
 package/links/links.mk                        |   11 +-
 .../0001-fix-for-linux-4-and-above.patch      |   25 -
 ...-conversion-spec-and-value-in-printk.patch |   29 -
 ...n-Unknown-symbol-tasklist_lock-err-0.patch |   38 -
 ...0004-Port-one-one_udp.c-to-Linux-4.1.patch |  118 --
 package/linux-fusion/40-fusion.rules          |    1 -
 package/linux-fusion/Config.in                |   12 -
 package/linux-fusion/linux-fusion.hash        |    3 -
 package/linux-fusion/linux-fusion.mk          |   43 -
 package/lite/0001-dfbspy-stat.patch           |   53 -
 package/lite/0002-no-tests.patch              |   11 -
 package/lite/0003-pkg-config.patch            |   22 -
 package/lite/Config.in                        |   11 -
 package/lite/lite.hash                        |    3 -
 package/lite/lite.mk                          |   27 -
 package/qt5/qt5base/Config.in                 |    8 -
 package/qt5/qt5base/qt5base.mk                |    5 +-
 ...=> 0001-fix-compilation-with-libx11.patch} |    0
 .../0001-use-correct-directfb-config.patch    |   25 -
 ...11yuv.c-fix-possible-use-after-free.patch} |    0
 package/sdl/Config.in                         |    4 -
 package/sdl/sdl.mk                            |   12 +-
 package/sdl2/Config.in                        |    7 -
 package/sdl2/sdl2.mk                          |    9 +-
 package/tekui/tekui.mk                        |    8 -
 package/vulkan-loader/vulkan-loader.mk        |    8 +-
 package/vulkan-tools/vulkan-tools.mk          |   10 +-
 47 files changed, 73 insertions(+), 2966 deletions(-)
 delete mode 100644 package/directfb-examples/0001-remove-bzero.patch
 delete mode 100644 package/directfb-examples/Config.in
 delete mode 100644 package/directfb-examples/directfb-examples.hash
 delete mode 100644 package/directfb-examples/directfb-examples.mk
 delete mode 100644 package/directfb/0001-fix-missing-davinci-voodoo-header.patch
 delete mode 100644 package/directfb/0002-imlib2-config.patch
 delete mode 100644 package/directfb/0003-setregion-lock.patch
 delete mode 100644 package/directfb/0004-use-gcc-link.patch
 delete mode 100644 package/directfb/0005-add-missing-idivine-header.patch
 delete mode 100644 package/directfb/0006-fix-client-gfx_state-initialisation.patch
 delete mode 100644 package/directfb/0007-libdirect-define-__NR_futex-on-32bit-architectures-u.patch
 delete mode 100644 package/directfb/Config.in
 delete mode 100644 package/directfb/directfb.hash
 delete mode 100644 package/directfb/directfb.mk
 delete mode 100644 package/linux-fusion/0001-fix-for-linux-4-and-above.patch
 delete mode 100644 package/linux-fusion/0002-Fix-mismatched-conversion-spec-and-value-in-printk.patch
 delete mode 100644 package/linux-fusion/0003-Fix-fusion-Unknown-symbol-tasklist_lock-err-0.patch
 delete mode 100644 package/linux-fusion/0004-Port-one-one_udp.c-to-Linux-4.1.patch
 delete mode 100644 package/linux-fusion/40-fusion.rules
 delete mode 100644 package/linux-fusion/Config.in
 delete mode 100644 package/linux-fusion/linux-fusion.hash
 delete mode 100644 package/linux-fusion/linux-fusion.mk
 delete mode 100644 package/lite/0001-dfbspy-stat.patch
 delete mode 100644 package/lite/0002-no-tests.patch
 delete mode 100644 package/lite/0003-pkg-config.patch
 delete mode 100644 package/lite/Config.in
 delete mode 100644 package/lite/lite.hash
 delete mode 100644 package/lite/lite.mk
 rename package/sdl/{0002-fix-compilation-with-libx11.patch => 0001-fix-compilation-with-libx11.patch} (100%)
 delete mode 100644 package/sdl/0001-use-correct-directfb-config.patch
 rename package/sdl/{0003-SDL_x11yuv.c-fix-possible-use-after-free.patch => 0002-SDL_x11yuv.c-fix-possible-use-after-free.patch} (100%)

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
