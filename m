Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C54E7E649
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 15:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C09823CF;
	Tue, 26 Sep 2023 15:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C09823CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBBjUuZKXmIB; Tue, 26 Sep 2023 15:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA8F8823A0;
	Tue, 26 Sep 2023 15:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA8F8823A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABDB11BF2A6
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 15:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 859D760BA9
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 15:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 859D760BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCKNv_Zl76ZB for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 15:47:07 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8869860BC1
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 15:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8869860BC1
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so3521636f8f.0
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 08:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695743225; x=1696348025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRZVZ0X0HHVgsooJa5lMrr/xkfN7TiIkfWQ4eB6spcY=;
 b=AukWJdhQMtgS+MDJm2UOTOLW7rHAAgu/U0oMPDTwlqZiuNxAxssnMTPUkVsTEBz062
 KIrGQ1vX+QX4wBL6fKfXhGKrR+0p3LuY2w2zunZuhNVX7HWRJ/bxGFYp3x0bBtdRoSMj
 EGCm65W/5t32vfxglYcwhIMRFNYj57Au6ZJhOG51UrlUjX+24MIfNrxg9yXXFKL2kRAp
 IDeJadzGA5OGeqZglRHQPhbg3sxTl2MhWiMGMS8kcgmk6rq3Fk91d9BDc7iPZvE/KVdC
 sg+LWEAJU1iT5CRNDc5+C/o7NSXyP+M4wMGayluNav2ekTJ578U67JL7dXJHZX3H1I9l
 rgVw==
X-Gm-Message-State: AOJu0YzcQM0Zf0U6ooMs8ZGgplwJic1zuAa46x5fFnQI+WMfzPxUTGsa
 u8EpfULxhHJXxKRfQePWyqLKaOk11LQ=
X-Google-Smtp-Source: AGHT+IEo/VH2eLaniOAYeXna7tQgpOYwjC9OIvyDzcWqQ/K6hWSfhuTS66VpOprZjlumUgS8G/qZEA==
X-Received: by 2002:adf:9dce:0:b0:316:fc03:3c66 with SMTP id
 q14-20020adf9dce000000b00316fc033c66mr2257711wre.3.1695743225349; 
 Tue, 26 Sep 2023 08:47:05 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:fa2:d20d:4ebf:d634])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d68cd000000b00321673de0d7sm14943602wrw.25.2023.09.26.08.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 08:47:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 17:47:03 +0200
Message-Id: <20230926154703.160448-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695743225; x=1696348025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=vRZVZ0X0HHVgsooJa5lMrr/xkfN7TiIkfWQ4eB6spcY=;
 b=SKmnslvijM9+mX6+NR3t5kyFbSvDoT8z1CW79IN5F+sqXnT9WGj+seuFVsoeRenX3S
 f80LNxJNGjJ16U4Mx7yC+z8DMp11GkBHPi/xoLPIFE7dGHjMWr4GJackVAZcPKrPReQS
 G9dlMGVE2L5LwQzMcc025LRU5AixBLCO6dhc3b98e+gECHinV0Jvb0dtfKK2M4UO9Msi
 jLDqA/sZUnmU57y1z6a82HB0tohL1kyVZXG9+sD0UvsyPShFbNiJTWe7/GYQGiaRBdSi
 OOHZsSTfTdqwNVOG2y2yDx9iKC57yYeVuStXIQRCoRIBPjobYfKFjoGMSFIBS0E5QXJe
 eCDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SKmnslvi
Subject: [Buildroot] [PATCH] support/runtime-test: fix weston test
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The weston runtime test uses the CRC of the framebuffer to detect that
"something" is being drawned on the framebuffer. This requires that the
sampling of the CRC happens does not happen too early after trigerring
an action, or the rendering may be not be finishe, either:

  - weston may not have had time to initialise, or
  - the test application may not have started rednering,

The sequence of rendering that has been observed yields this sequence of
CRCs (elided for brevity):

  - boot:
    - alternating between 0x4c4126bf and 0x5d2f9aa5: console cursor
      blinking

  - start weston:
    - 0x4c4126bf: weston switches to an clearted vt)
      ...
    - 0xe54b7895: weston is starting
      ...
    - 0xe54b7895: wayland socket appears!
      ...
    - 0x6bf28bdf: weston is ready
      ...

  - start weston-simple-egl:
    - 0x6bf28bdf: application is starting
      ...
    - 0xNNNNNNNN: random CRCs while the application renders
      ...

  - stop weston-simple-egl:
    - 0xNNNNNNNN: izero, one, or two random CRCs while the application
        renders before it handles SIGTERM
    - 0x6bf28bdf: application is stopped
      ...

  - stop weston:
    - 0x6bf28bdf: a few CRC identical to when weston was started, while
        weston is processing SIGTERM
    - ocillating between 0x4c4126bf and 0x5d2f9aa5: console cursor
        blinking, back to initial vt, weston dead.

So, we need to wait "enough" after each action. Moreover, when the
wayland socket appears, weston may not have stabilised yet, so we also
need to wait after the socket appears.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_weston.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index 276788c649..df1b7a4135 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -78,6 +78,7 @@ class TestWeston(infra.basetest.BRTest):
         wayland_socket = "${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
         cmd = f"while [ ! -e \"{wayland_socket}\" ] ; do sleep 1 ; done"
         self.assertRunOk(cmd, timeout=10)
+        time.sleep(4)
 
     def stop_weston(self):
         cmd = "killall weston && sleep 3"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
