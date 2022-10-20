Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA19C433FE
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 14:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E781E8432B;
	Thu, 20 Oct 2022 14:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E781E8432B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZjDoX5NEbkP; Thu, 20 Oct 2022 14:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CDF984214;
	Thu, 20 Oct 2022 14:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CDF984214
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB1FF1BF312
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3C3C6FAF2
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 14:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3C3C6FAF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6VTWMyNysKq for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 14:14:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40C36FACA
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C40C36FACA
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 14:14:40 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id c20so26572297ljj.7
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 07:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5u+lY9yj1cyA+ESZrzj9o6FoJv4l4oOmO38j3uAYJTE=;
 b=qV0DbmL3GInu/MiXtk9GQOJi8+/ysLxieiXdgujaRmGpFxztCJgDn48kYfUBeSVroC
 Nv75iI+aj/n0R2+KLESyXsIfe+/+iXqqD1jjCGcuJJfIxsX9owVe3nMHGa9hvsVCviAg
 S6MlbDdJGcC/BA3xERho6ZY8EhQaBp+mU53Mie/r6FUfKBz16G51+16iR9c3dA1EPsGY
 uKxkKnkc8wNVOBUpkHoTyvqcCgDD4iXZZ/n4IzXIa1N5NaRZ/EH0G/Z9OIy/UBZ+hQgg
 ZGgSpHRSPE16oBgFclIn+O8UudFjdeaaPOA+hoykA3DjnQpR2ZThLNsJLVhbgXdWxc5v
 bdQg==
X-Gm-Message-State: ACrzQf381LX7af0Rv9jT6lUCixnJE4Ap9dXG9U9cYTScWf9ijFAh9AEI
 1V2MSJnSupkKLGAFi3iPqwL2eYfkDwrKQQ==
X-Google-Smtp-Source: AMsMyM7Ipk7GlBpJyjdkl+CO2qUXLth/6hEP2ZKIaqJDtVnQPgYMZjQ3fAO4Wf+tg7/Tvm/zHAJl5w==
X-Received: by 2002:a2e:be29:0:b0:26f:b78e:2e79 with SMTP id
 z41-20020a2ebe29000000b0026fb78e2e79mr4914010ljq.196.1666275277880; 
 Thu, 20 Oct 2022 07:14:37 -0700 (PDT)
Received: from wkz-x13.addiva.ad (a120.broadband3.quicknet.se. [46.17.184.120])
 by smtp.gmail.com with ESMTPSA id
 a3-20020ac25e63000000b0048b969ac5cdsm2739975lfr.5.2022.10.20.07.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 07:14:37 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: buildroot@buildroot.org
Date: Thu, 20 Oct 2022 16:14:09 +0200
Message-Id: <20221020141412.346992-2-tobias@waldekranz.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020141412.346992-1-tobias@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5u+lY9yj1cyA+ESZrzj9o6FoJv4l4oOmO38j3uAYJTE=;
 b=CQy7igvLVuZqq96cbLHn9Vn5Ab8H0WypmnIUG0fC17Q5WBasIbCvQ9IToe9FnyO/gt
 ReXwfh4smAR0vxK1KmYLwKIWbaP5w0z6RsUOSVOOk7q0flbo4VDI5nXYfvfDawSXgvkJ
 L6dcs9IyjBpoGn0PCFyDvblwye7FCglGHPtyagn0G12we87YmAEFF2PuETJyJorjXAJt
 XDkuSTOtl61r50ikj9Ir1bx+rA/sr0p4YYxL8mDuYILFKoaMf+UI7fPFjWKHaro4ohlY
 vH3nl6yiTx1ICSR6Hjrc/SVEQ2JalvK8+zRaD1dgA5sR6++OHx+mLcW7rF/JA/Qh+aDZ
 P5lQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CQy7igvL
Subject: [Buildroot] [PATCH 1/4] package/libbpf: fix cross compilation for
 32-bit targets
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch that sources the library path (lib vs. lib64) from
the compiler rather than from uname(1).

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 ...cross-compilation-for-32-bit-targets.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch

diff --git a/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
new file mode 100644
index 0000000000..3730b2fa41
--- /dev/null
+++ b/package/libbpf/1.0.1/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
@@ -0,0 +1,37 @@
+From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
+From: Tobias Waldekranz <tobias@waldekranz.com>
+Date: Fri, 14 Oct 2022 21:14:14 +0200
+Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
+
+Determining the correct library installation path (lib vs. lib64)
+using uname(1) breaks in cross compilation scenarios where word widths
+differ between the host and target system.
+
+Instead, source the information from the compilers '-dumpmachine'
+option (supported by both GCC and Clang).
+
+We call this the "host" architecture, using the same nomenclature as
+Autotools (--host configure option).
+
+Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
+---
+ src/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 3cd0854..d535f81 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -77,7 +77,8 @@ INSTALL = install
+ 
+ DESTDIR ?=
+ 
+-ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(shell uname -m)),)
++HOSTARCH = $(firstword $(subst -, ,$(shell $(CC) -dumpmachine)))
++ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(HOSTARCH)),)
+ 	LIBSUBDIR := lib64
+ else
+ 	LIBSUBDIR := lib
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
