Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5493EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 23:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8405400F6;
	Thu,  3 Feb 2022 23:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zq_UBkucIJcR; Thu,  3 Feb 2022 23:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47556404AA;
	Thu,  3 Feb 2022 23:23:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57D6D1BF2F3
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 466A940988
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 23:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-ceY4V-SP5A for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 23:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1D7F4095F
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 23:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643930602;
 bh=aKYxTdZN6pDgMqSptpFEMQ+dmdoVWg95aJO6UOD0igA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kAJlRvLQQ1grIbPAui6Mte7BUUFjDB50v9og8U56ivi4znwPO7dIT2Wn6mvhB5khc
 MYYmC8Ha1GyByDtseuYPNXr5ixQ7dqA6KGUaQpYwFkMFtOhnCY/EsEXrqn7tlYPsh+
 zLMUi1/Ta3iQJJJ8Cs6CK7bTr7oqdZWNhWqzudC0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mzyyk-1mK6al3VYs-00x48G; Fri, 04 Feb 2022 00:23:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 00:23:21 +0100
Message-Id: <20220203232321.26733-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:1JsXm1pSLzDOQxrsuRW9V449zIF26Ugk9D/z55K/dveiGWXKdgb
 3JW8CMs6QpubAPJBhNnLzYCgEWJRFXRhmWafNZ2VQfZCZxhWvYACusLticzDIFa57cc1I9y
 XGt04uuFHpP56rzovuO9oJXU4nFBEoI2XGG0zUNIS4465/Z8sNQEcaAI5V9YdZzVy7Vo+W8
 5DuewkbTeiBByfYZUc52w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5V/2WMWAHJk=:ILwUhOCreWtUdbThxLbFmN
 sJPfsZeExNA9RSW0D852UYWN4JnqS152A9gi1TuE90017Gf8roxxuwt/Of6OFmgkAYXDWzbl8
 jSBIryiz8kWo9uXkDO1MShFw18OPXDktrA6655vdAYFGgTF5WDN97EjuQg08ynUW6RFJRhvcQ
 sRQmxyV+gm5y3misjUXpIYWa6R/4Rh0rOfQapmGPuwOVSEO+0c9/PMid21vO1mryMb0UyGaDO
 P7WS1NtrqdRs4M5zvXZRl9q9nIl6CK9bLVnbqQqsRDS2h5qkRb4nTLwGBfJBVNVn41CJmNWxe
 NtB22nP3w45lgBHRutMnuBEAJYKYCXaeV8fixRJZxsr6jSswomRQftYkhoM4QldotQXCMkur/
 McEmymxNU3bjyuY4a56fp7UCzAKVM22huzigtIncXOVHu2fkmcH+ncfa/TpCq7Hope1R0PiHO
 h8CUFzcjfAWpo4pLQkVdczaUlsmtlnOhonTwmSRIulzs7bwaoWkQ4q4hNQgpz/A+ckYvwROwr
 gchCEHHJ+dMxzIPY2Sm/X8UoRsFXaUMZ5/HLBLZYdUDCSrcuAoNpD/Agp2Ah40W/PJQX6K99g
 0QCQv/x44uRQqsQV84MCHQy7GQ1sPUR2NJa9jcJcai2ftFTOf/5XDFDoaBByl/IWCRsrsianN
 c6VSVl0CZBGpDD6cGKfjLFOkhOTI3qsa2gutP5WfN4k4yelgZ6B7BAU8xuXJKNAnUkwwmFfdg
 R9htIdpIgCeTCpOi9o6iiqkaifWQsNFXl7qMcP4y1fyYL2PWBrnzqKzaI2eiqZq2gtpA6gs+5
 swugrgzm75ZfeOjuqvo7SNPLeB/s1j9yvc/sAfojJ2OdH4QqRCXV0FVR20+/PJv8bKB5+pb+a
 U8h6g5SfHANlJJA+NmJc73eE4A4dG3WWTXyCRi8FWjF5EwMz3KHcUxNb4Lj19o7NBsMjvvUuG
 bfp5jBfBd4YiaBofee+aJkKqkUI4oBAa8fLdbfwNWghA58+dHB/l+1/l/bv2BAMkeXfZwxqIj
 q+RFxjek81T8Zae1RgI9F7udmbhMdQ/hbCf+Wl+qTo6tybd0F9te1yvos1Imw2K3gF4q53sdA
 SAdTT+WxH/mCRk=
Subject: [Buildroot] [PATCH v2] package/libcamera: fix uclibc/musl compile
 with libexecinfo enabled
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- depend and link against libexecinfo if enabled to fix linking failure
  in case execinfo.h is detected, see
  libcamera-40f5fddca7f774944a53f58eeaebc4db79c373d8/meson.build:

   32 if cc.has_header_symbol('execinfo.h', 'backtrace')
   33     config_h.set('HAVE_BACKTRACE', 1)
   34 endif

- libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC

Fixes:

  - http://autobuild.buildroot.net/results/a1077815895ab847c5ca82ec17c7d13fe97cff53

  .../powerpc-buildroot-linux-uclibc/bin/ld: src/libcamera/base/libcamera-base.so.p/log.cpp.o: in function `libcamera::Logger::backtrace()':
  log.cpp:(.text+0x34b0): undefined reference to `backtrace'
  .../powerpc-buildroot-linux-uclibc/bin/ld: log.cpp:(.text+0x34c0): undefined reference to `backtrace_symbols'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - preserver original TARGET_LDFLAGS while setting LIBCAMERA_LDFLAGS
---
 package/libcamera/libcamera.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 524cf07e03..534d8d2637 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -99,4 +99,9 @@ else
 LIBCAMERA_CONF_OPTS += -Dtracing=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+LIBCAMERA_DEPENDENCIES += libexecinfo
+LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
