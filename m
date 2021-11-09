Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB15C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2673C611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2673C611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFF880F7A;
	Tue,  9 Nov 2021 17:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id quxjgvs9QrKV; Tue,  9 Nov 2021 17:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE1C80F76;
	Tue,  9 Nov 2021 17:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7E2C1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A9140420
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tny6ZYeYPONE for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0336B4041F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:15:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i5so34285896wrb.2
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMD+HmbIgdssiXtQammpVyGErkAN5DXwr7UuS7Y1C2s=;
 b=aX98pWL1HSKf4mdiMe6tzgsMx3WlwwPYYfGoRkFYt2Y5UqZx47WJEdfHZWtUDqOfEW
 lUwneb0yTbV0DH6ouGKFxPtiKVnIyuVWZsqj0221oTMGvU1qsofa0GWhDKFDPKCPh8ar
 RNsaZUXv9eoHRZzOE3VUjeDhZSpiNcTdmlixsacy3yxQk/rWRRMDe9PwuNmnfov6BClf
 mKCzh1YYH7lxZEW/us6bG7dJD2YV4hICIY9WNiBCI/h+gXBY5CSHRX2+JpJehKz6r38v
 mpLVGooyrRiAH7NcmBzZ61mYiEWACOiM+r/S1b1ofgobUOxlD/E0sO1D+A0c3bfcMAUC
 0lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EMD+HmbIgdssiXtQammpVyGErkAN5DXwr7UuS7Y1C2s=;
 b=rtXZbq/pYWx494aTchJPUn2A/XjLYyzNHtuZlMN16Ozpm68pzbiDQxJclgYQ4mmf27
 xtyA9mt/3eFWsCF5kxpVBJhhpkpGJQ1oD5J7yw3I/Eqr7eSpbnYyY8KNyckJv5G/X3ev
 K9T27gQJ0ANT0MpT8cB18FXzgq7sbwQW9p7NIaC9P+JPbls8t5lrbb/JEuwBSGP6JtYo
 CIuta/sUWKEPod9+GfNQ81RxOhQHwWzHilUpyKA7Psx4/N1FR6Xo0OIpE6s+BKiZKvBb
 31l9TmG718iFk0xD0xnFo1M9PDKhncTLY1eQG96PHx21WVkxet4NfDQlY+c3utDyY1Gg
 yZcw==
X-Gm-Message-State: AOAM533VXxsTJ+BJ7rpqBb713H9/JyIh4VYoWxyBAWlSCX1+HBhg8C5p
 XTRIUPxG52OVqyg9cZE0UHZMQhI4pco=
X-Google-Smtp-Source: ABdhPJyu4cGA0QewC8/TgG/mTkg/7LAbmhZB8u9mkyJuRmxZmiA8z7A9TPMxsKDv7A4ERaWc2KMnNA==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr11223167wri.265.1636478151956; 
 Tue, 09 Nov 2021 09:15:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n7sm20271984wra.37.2021.11.09.09.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:15:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:13:51 +0100
Message-Id: <20211109171351.456708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix NLS build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/ddfbd684e78e2b8b9ad40bedb4612ea0197d231a:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/9.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: src/pipewire/libpipewire-0.3.so.0.339.0.p/pipewire.c.o: in function `i18n_ntext':
pipewire.c:(.text+0x3ec): undefined reference to `libintl_dngettext'

Indeed, since that time, pipewire uses the new meson intl dependency API
which has been added in version 0.59.0 with
https://github.com/mesonbuild/meson/commit/2c6ccfe4c40741ae1f15f073f7d7bc8c398a1648

This new intl dependency API is broken (which is not so surprising based
on my experience of meson). Don't even try to fix it as meson is not
very prone to merge our pull requests:
https://github.com/mesonbuild/meson/issues/6108
https://github.com/mesonbuild/meson/pull/6629

Fixes:
 - http://autobuild.buildroot.org/results/435d59d40209cc1028cee8e2a71a69cd3769ab56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pipewire/pipewire.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index f376f3c276..4cd2e7fcf5 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -11,6 +11,7 @@ PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
 PIPEWIRE_LICENSE_FILES = COPYING LICENSE
 PIPEWIRE_INSTALL_STAGING = YES
 PIPEWIRE_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+PIPEWIRE_LDFLAGS = $(TARGET_NLS_LIBS)
 
 PIPEWIRE_CONF_OPTS += \
 	-Ddocs=disabled \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
