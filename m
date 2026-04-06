Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B03EF46C71
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DA0081046;
	Mon,  6 Apr 2026 18:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10y2R2BZIdHz; Mon,  6 Apr 2026 18:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703FB8104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775501590;
	bh=nchlCTPdkwo0Yj7l11N1yAW/yzuP/zZUtuIZk38Kw+c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OCGIApfox0IAgZLyxGz7OoBoWzBEK/m7SIlpwyOlogWLV0yWuwmlUlIM5iaAeWrRo
	 plAG6ePptJVLgANET5NeOj5nLQkYLp2+B9LW12/MQ2atTCV51b9gwYGk3k3DuAkgM5
	 bB76ACuAqTwUBzQsGeN6gG34YQzowNc+aAH2mdNNuukBvuKl7bNoU+pmHlTzXnC/b2
	 9/MY5oTmsBDF52UpMF7b+WWjD4C5TlVV+DhEtw4GY4hxXcA10kFbk2An6qtudcR07n
	 sR62Kt3LjzQ+2ph48cv/osSSdhW9gNkg1DpjorIawEEpEyCBuzA7lMthqMraeu8z4M
	 3/JQTlJKLpEPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703FB8104B;
	Mon,  6 Apr 2026 18:53:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B70731EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED4660B6E
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 377J1peVlT9X for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85A8D60B6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A8D60B6A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85A8D60B6A
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:53:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso38015145e9.1
 for <buildroot@buildroot.org>; Mon, 06 Apr 2026 11:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775501586; x=1776106386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nsE8OZfynmfZ4JSXOQVykRVOctTX/5sUUno1nhdDNgg=;
 b=sAfvBGWYXrVZUg2fGIxDwFIrR72+HRTqQ0epez03ciRa6x8k/V1L0xSxb5YHEogfH8
 55EDVK8oH+xjGtFDN2uqUtNtXtBL4nDKzUkjagJ9KCuXYS0P1nGCgnpnzMBIb1/qkTGE
 ON4yzh7E/Qb4itaib07kRuWEYSFXYBl/wjHfqMxhILz3tHNXn4eXbSNACjsjpb2YsHcV
 Na19pcaaGVlrD+e9uG/5KMpWEiXkDHI44mUbYqrar32uudSKL9VCCFNS55KsvgiL27M8
 D9VgFxI/ydoR60sviV6TTL0rPWq0MLnVyXjNABvQEjlAPpLBk0dU1EHw+4dMFrC9U6IA
 0CRA==
X-Gm-Message-State: AOJu0Yy5hFj6MvRZx8I013D+XHYY3ONWIsuK5FzHaoZLq356HF74cLwQ
 baGEByCBpo7P80zNpS021lEG1YxeE5yPEyjSiHEaoQKdhWivhrPTt6k3gAEyJQ==
X-Gm-Gg: AeBDietk9NqCLR6J/kZH3KMy52wxciuKrxcz41el1iKAZrX+boh81fgw/gHZROZoNzs
 2RgYAZqIqKwatf5nBBxXVEDgb9btihwgTIq0YYKmbhrafbSD/JZtlAm947t+Ay9t0xjj/86W0rC
 Gg+6rv7bSy4IE9TdQKkjzI2Wfalef5WvrpjDdvNq3veDdynWOjLZFjbogfisrA4Lamv79OybI0I
 Nbd9c1M24ZQkCJ4loUe05Pi/lv9XliCKn+SIg7ke/Sdqu91704yhwTBTJuPYVt67XSq/zLsZWQr
 RS2PmyyY4k0LCfIoho9lq/jL1GyQOgd7tu14aYYqKRGPozRhbsW5ruYOuvM4r/ReJMNda3XMSHF
 Rl/2n3HnSI6v39hqgA+QPr+Dvwv0JF2VM/dgkXR9BiBbMbF2kk0Lf3ZDKcLopNe7ABu4m0mH8pw
 kxD40hoP8tsmcdAR4TrZhGqFjqpE1sot3G+kgYHTBGRZfEvaHmgszcmpea7uyIX3kY99M/GtFCs
 WxDUp6ZC8SW3zQO5XDhUCOSGdySbrz2YfJE5FU=
X-Received: by 2002:a05:600c:8b32:b0:487:1c2:6a56 with SMTP id
 5b1f17b1804b1-488996afe1cmr189280115e9.3.1775501586093; 
 Mon, 06 Apr 2026 11:53:06 -0700 (PDT)
Received: from trial.home (83.4.93.130.neoplus.adsl.tpnet.pl. [83.4.93.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d29bbsm43501466f8f.21.2026.04.06.11.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:53:05 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Franciszek Stachura <fbstachura@gmail.com>
Date: Mon,  6 Apr 2026 20:48:59 +0200
Message-ID: <20260406184858.1335459-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775501586; x=1776106386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nsE8OZfynmfZ4JSXOQVykRVOctTX/5sUUno1nhdDNgg=;
 b=KAmq4X9S3/WjNrUgyk/A2cS54+oLmVwjHXl5aABnJ9zmSpFWokA8x1xt2o9pvAW1VJ
 LZpTI3RuSJo4yvLFddLuD5x1QKt2dPd4NJ0mqQYl9kjekW5KVwRJewtSEMxUeKJCV0iw
 opgcca4KEtufjNIk9CwQCscAHIdMTkgtNezHoaLNjABe6fUT8ErAEVAVzu0deEIbzbKE
 MkCXU/dIntroiXAbhRQ/UekbQOC8M57ghmqYkT3a1fX2hFm9IxrLregfIIdXKxnQZKCm
 2tcA2iuRbuH/esQKY7qyEb6YJmJR4G7NQL8VUWY97WN6E/4PlwRJpA93AtomaiThqVzI
 5X8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KAmq4X9S
Subject: [Buildroot] [PATCH] package/libphidget: bump to version
 1.24.20260127
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is also a backward-incompatible upgrade from version 21 to 22 [1].

Version 21 was deprecated in 2020, it doesn't support latest phidget
devices [2].

Version 22 is covered by BSD-3 instead of LGPL3 [3].

Release notes: https://www.phidgets.com/?view=changelog

[1]
https://www.phidgets.com/docs/Upgrading_Code_from_Phidget21_to_Phidget22
[2] https://www.phidgets.com/docs21/Main_Page
[3] https://www.phidgets.com/docs/Software_License

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
Note that I do not have any phidget devices, so I have not tested if
this truly works.
As an alternative, I would propose removing this package from Buildroot.
Version 21 was deprecated some time ago and the package has been causing
the same errors in autobuild, almost daily, for more than a year already
(see 2024-07-06).
The build issues seem to be caused by some change in either
Java native interface headers or GCC warnings, although I didn't
look into that too deep.

 package/libphidget/libphidget.hash | 4 ++--
 package/libphidget/libphidget.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
index 9789f78646..7c2f67af7f 100644
--- a/package/libphidget/libphidget.hash
+++ b/package/libphidget/libphidget.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0e789912700228808519cf5c41e19f9b761da635c6bb676b147897936b23851f  libphidget_2.1.9.20190409.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  b1682ffb4a9a7d4589ec24256cbd30af1342880914117d3e3f4814e70049238c  libphidget22-1.24.20260127.tar.gz
+sha256  7c1c42a1485cd44f9b8275931e645962b7af86c524c0b683ab9fba62e7e3ece5  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index f7d471f99a..f81080e1da 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBPHIDGET_VERSION = 2.1.9.20190409
-LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
+LIBPHIDGET_VERSION = 1.24.20260127
+LIBPHIDGET_SOURCE = libphidget22-$(LIBPHIDGET_VERSION).tar.gz
+LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22
 LIBPHIDGET_DEPENDENCIES = libusb
 LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
-LIBPHIDGET_LICENSE = LGPL-3.0
+LIBPHIDGET_LICENSE = BSD-3-Clause
 LIBPHIDGET_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
