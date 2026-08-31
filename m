Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE37C61DD9
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 00:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F83A40546;
	Mon, 31 Aug 2026 00:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POZ2_T0PJ2uF; Mon, 31 Aug 2026 00:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788135039;
	bh=mO0P73ShLiolJli8c742wyxcGkVDH0MEtuZIAZtJHWM=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=WvHHQAGjHngMME8BlWYdTWUxGf9P25WKx6sYJF741gCcNCGN8VplI0ZWp8H0THG7N
	 sCx2D/iHLR74+QufQRP3v95Uy6iGIsiRtE6FsVKR/WfeeDmT08lOub0SCput7Japmg
	 5vfMvKmfHzU8u7PVgREoA7cMD5Micl62EqsnyQavTRiLhEaZJp7IfshfnT2UZBhjLV
	 Z6pYzb1arj/62e9ryy2J+YHg29+/RgCSTCD+miLRv3cyVRTZyge56WPnR+5006nPFC
	 YAvLodop+Ax+hrHMoOKUnIzUSnuEWwj0ZQIl4Ma0VmuBAKGhsiKSjwJzwznsh97n/I
	 5nty1IeJT7DXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50BA640550;
	Mon, 31 Aug 2026 00:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C56034D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 00:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2571440056
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 00:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8U8T5HoJPyfU for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 00:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE18F40050
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 00:10:36 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5aec6360133so315819e87.1
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788135034; x=1788739834;
 h=content-type:cc:to:subject:message-id:date:mime-version:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ZGo55fjdRUoX/MQtq1fZZDwjsGCLX1YPeSVHd+lGsK8=;
 b=tQTUpN0mEgEbGDv5+RL6X2s/9YSYkHnX9h0bcqwhJxSX3Zu1+wYZ5g0kbk5mSDeN5S
 1rKGf7OT6Qcm09ScHC/dDbe3oyn4akV6Adu1UOsYsLOKBtxBMMak9/P+lPvBrGVLR41X
 yfgQruswvuL6kcSObip8E3q972T2xDrQ0PkqXBhmLzuqslXiDNBCV2AsPsI8w6BNvRBn
 P4ZyF6xL8u+bnABC74K/xdIVlqvbMo/GrY5RjVmOzorUoTv1Dv+4ItBXwRLKunsc1nhp
 R/jBXdm3FdLQdoXq0VrcPu3Hk4+Wz/owzLeXE07M2W8AXQFGfwlGrLAGqJqIhVmuGiAz
 QlQA==
X-Gm-Message-State: AFuF++lLCxlbRkdfQYEO7xfQdbWFbZ48+pGwnwxptPj4Colp0WmGWKAi
 3j44Q4T/aDhJFt7fYQ6wnD+lBX2GwTVjtNLU0kGsay6flEp1dVP95TKuLKqH+jY3zoE8eaDdK0B
 jRCYhx/0LDA==
X-Gm-Gg: AYBFou1PjzEBS0SmjNdaegi3v/hGWVbKqzUvjBOwQY2aSmZ4dluaBlmolQEKiTP3h6h
 vzAbkixBs2emVgp5l9yx2R61fgjhCMmSY0AJMsTBjcUwfINUqBlEct1UGqFDJ1xFkdWF4iZ/iJy
 QVyI/Kd51L6HdeGKYcACN06hjDnNMmED41KviaFUS3hb/2v94NJJY8qaxVATjRsBhTtNGGJApM4
 NbKaBMvww1fEbrx1uh3/YDCMJK7nicOJJ+baQvP3HXSIMSHhh5Nuop4hBbCikKHgoQDcUnx3PuJ
 pvWCwgel+OrkARRW90Jv02Zm+wnGap6cX49paZvwV7uNNvZG7k+IuunExH19q+xmDnUmND6T+J9
 93AXNWsTeLnNr7rRI4oBNRL5DZIxC3cOmQ6Xg6SiHUofZvwm54LMjECpdFio4uTQZIZ0IC1b3bA
 P8LW82ueBcGJ9N36A8hqIBn5yB5+iFQnXZCUXmbwdO1qi4kcb3U4eImH7SjMVzNAI63d2kXFVQf
 6pn2YaguPQJErr8aCaZ3hQxiwHL7/I=
X-Received: by 2002:a05:6512:3e25:b0:5ae:bcc4:c071 with SMTP id
 2adb3069b0e04-5b5fa4ecaeemr135549e87.0.1788135033648; 
 Sun, 30 Aug 2026 17:10:33 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b5e8a0f52dsm1843277e87.64.2026.08.30.17.10.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 17:10:32 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-39faa67fab8so21858881fa.2
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:10:30 -0700 (PDT)
X-Received: by 2002:a05:651c:a390:10b0:3a1:9562:73b with SMTP id
 38308e7fff4ca-3a333450496mr369151fa.11.1788135030400; Sun, 30 Aug 2026
 17:10:30 -0700 (PDT)
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 30 Aug 2026 20:10:29 -0400
Received: from 441462959560 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 30 Aug 2026 20:10:29 -0400
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Date: Sun, 30 Aug 2026 20:10:29 -0400
X-Gmail-Original-Message-ID: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
X-Gm-Features: AcwNN1XkYVFv6bh0yKju0HQBoPn6AG44TtZqkclwERt_Gt73Y747Th8Tbyuw4qI
Message-ID: <CA+h8R2pgiSspGVG7w0mSFETY+-HnjSB6B+h+xsu-EdRgLVqMog@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [PATCH v1 1/1] package/go: new major version 1.27
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to go1.27.0. The go-bootstrap-stage5 package (go1.25.x) still
satisfies the bootstrap requirement, so no bootstrap stage changes are
needed.

Remove the workaround for https://github.com/golang/go/issues/77436,
which the go.mk comment scheduled for removal at this bump: restore the
plain CGO_CFLAGS and CGO_CXXFLAGS settings in HOST_GO_TARGET_ENV.

https://go.dev/doc/go1.27#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   | 12 +++---------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 1c43cabf7b6..bc6d026a6c0 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a0721c54c688901448d77ad9b3ec7ea7c474730755ff891382e92ecb93ff2cb1
 go1.26.6.src.tar.gz
-sha256  f09a71029fc5cd2940fbe36b0eb1fb2d8f3407cd6adb6b7b4de3eaf04007f8c4
 go1.26.6.linux-386.tar.gz
-sha256  708effb774be8237570d0add163225abbdfaf4fca28b2611df167beba4feef89
 go1.26.6.linux-amd64.tar.gz
-sha256  d0507e9e9d7fe012aae570108cbd76c15de879e17130ab8cb90d4d7445cb1f2e
 go1.26.6.linux-arm64.tar.gz
-sha256  e1379a2fe77bd30fa29833074388247e7c65416e09279f746f20de2d5cf4dfea
 go1.26.6.linux-armv6l.tar.gz
-sha256  232b65543a42eda95df6a63f76235c1795bb535eba5c74e509faec71bc648388
 go1.26.6.linux-ppc64le.tar.gz
-sha256  958757933d38172dd544085d253c8738cf09793d24c8bc0422e5e1e1fffa4fde
 go1.26.6.linux-s390x.tar.gz
+sha256  7002403d7cc44529ef6d26f69a44818263395ead7c16c05a5808ae047ebeb0e5
 go1.27.0.src.tar.gz
+sha256  eac4abaca4113170a1cf261b8bf1d38480e61e99deecbc6a14767deb8b19e8ad
 go1.27.0.linux-386.tar.gz
+sha256  675c26c449cbb18fc24b74650de1eabbae6e16f64326fd85a283fb3b58280685
 go1.27.0.linux-amd64.tar.gz
+sha256  51798d2c42d0e1c6ed7fd9f48728b4193abac9e8aad6dbac2fe96a81f5909bda
 go1.27.0.linux-arm64.tar.gz
+sha256  e337ecd9c321377c0d8832690c2cb10463447c0bd0e65e2e3413dfff63a3435b
 go1.27.0.linux-armv6l.tar.gz
+sha256  068085e257a6014c036c723ca62943edbf48fd168b8d00a6d39527d10b656255
 go1.27.0.linux-ppc64le.tar.gz
+sha256  cb5c89fa48cba4123c68aee62b217ca030f281546df0898a0c32889c340b928c
 go1.27.0.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad
 LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index df1023c19be..a49dc206cc6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,10 +4,7 @@
 #
 ################################################################################

-# When bumping this to 1.27 (or beyond), remove the workaround for
-# upstream issue https://github.com/golang/go/issues/77436, below
-# (i.e. revert the commit adding these lines).
-GO_VERSION = 1.26.6
+GO_VERSION = 1.27.0

 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
@@ -78,14 +75,11 @@ HOST_GO_TARGET_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"

-# Workaround for https://github.com/golang/go/issues/77436
-HOST_GO_TARGET_ENV += \
-	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
-	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
-
 # Allow packages to use cgo support if it is available for the target. They
 # will need the toolchain for cgo support; for convenence, include that
 # dependency here.
-- 
2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
