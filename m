Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5132BC43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 10:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A459061034;
	Sun, 26 Jun 2022 10:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A459061034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocWGQlw7H2KL; Sun, 26 Jun 2022 10:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91B360BC1;
	Sun, 26 Jun 2022 10:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91B360BC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 847041BF25B
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5059360BC1
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 10:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5059360BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBUtGqjT-o_c for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 10:09:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1397E60B10
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1397E60B10
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 10:09:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so3899400wms.3
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 03:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVGzej3tKIlXLJCa2nHB3bWAPQ0onkIsP27O3JrWmk8=;
 b=eCOAHN5PMBaH8pV/PD0udv0TbsovqdGPEU2Qg7cWZFqCmkgP0yOQRza8Iy6RB5M871
 +iyhKhRZ7jM1OB1/3ru8LyTie1puelRO7Dsfn3rRFZiy6K9bWqhEWbAPOtDiOwb18/TQ
 lqKlQnBjEow7fBcndUtjMmsIJjRp6IoVImm+iMzsw5N7k8comYSAdWW7lPw1ZD1vUC5M
 IZAc8Jobveloi+rFDFThhPewTxq2GEnO5vxmZrx5cu0HPr3M3uMVQsEaa8alIfIGH2GX
 cbNevZ4Dpjf3tFBtFXHTG2bVCastEMUFD2qS9H8mWr/RjxSvcTg9IKzkE7NPFg4hPby9
 oMiQ==
X-Gm-Message-State: AJIora8jhWRs9tM3+zzZBP6nm4PEKgVPqcc0yjM03dE530JHPkHF40IU
 Yjs+del7MU4X29w6CRJe23udNANyTt4=
X-Google-Smtp-Source: AGRyM1s1U0Q94btzcCNBf+vEMxFZCiNt0SA+f0vfw8ObOJvap+mwPYwpoJW+tDQmxstvvz3gysDj8Q==
X-Received: by 2002:a05:600c:1d91:b0:39c:544b:abdd with SMTP id
 p17-20020a05600c1d9100b0039c544babddmr8961340wms.70.1656238153988; 
 Sun, 26 Jun 2022 03:09:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff90f000000b0021b90cc66a1sm7429321wrr.2.2022.06.26.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 03:09:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 12:06:17 +0200
Message-Id: <20220626100617.1477457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVGzej3tKIlXLJCa2nHB3bWAPQ0onkIsP27O3JrWmk8=;
 b=dm1L3X7KQ0IXy8CLcaDMhZkHeL2piz8bQ1HQPe3DGcHBvdqMKNs4o+rKGWeIV/MnyL
 Ivp6d8UNDuZeqzkhLLqazlF1WuMUr1Jx8gHTKOazo7ll3nsk4wSPD+Xy6EXLjLO6agx0
 BwHB7d1iZaV9Gs+68woOVaYJfad1n4RGdmURI2+owHjlH9LUaLNt21w3s50k0clKRw7d
 TrVdvzWVIZL+EYK1cHtFmg0yjb1/h4lejdI1vvsv6Z2BixJkUZUcyObkNXjN0VSf7hch
 kST4Wl5oe5yOVBeXDydJ1nhFV38L+9zO1CIeDjQFGNptv+jiWfw7RvPpDF9zOgqsvrO/
 wZ6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dm1L3X7K
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: fix build without NPTL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pedro Aguilar <paguilar@paguilar.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following guile build failure without NPTL raised since the
addition of bdwgc in commit b0476427f6c0036b7803d591a5394923c4b07142 and
https://github.com/ivmai/bdwgc/commit/7896408d4149347588ed0e36319b53bcea70115b:

configure:60776: checking for GC_is_heap_ptr
configure:60776: /home/buildroot/autobuild/instance-2/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu11 -o conftest  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O1 -g0  -DHAVE_GC_SET_FINALIZER_NOTIFIER -DHAVE_GC_GET_HEAP_USAGE_SAFE -DHAVE_GC_GET_FREE_SPACE_DIVISOR -DHAVE_GC_SET_FINALIZE_ON_DEMAND -flto -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -latomic_ops -lgc -lpthread -ldl  -latomic -lm >&5
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgc.so: undefined reference to `pthread_getattr_np'

[...]

In file included from ../libguile/alist.h:26,
                 from ../libguile.h:31,
                 from guile.c:38:
../libguile/pairs.h:205:1: error: conflicting types for 'GC_is_heap_ptr'
  205 | GC_is_heap_ptr (void *ptr)
      | ^~~~~~~~~~~~~~
In file included from ../libguile/bdw-gc.h:48,
                 from ../libguile/gc.h:142,
                 from ../libguile/pairs.h:26,
                 from ../libguile/alist.h:26,
                 from ../libguile.h:31,
                 from guile.c:38:
/home/buildroot/autobuild/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gc/gc.h:551:20: note: previous declaration of 'GC_is_heap_ptr' was here
  551 | GC_API int GC_CALL GC_is_heap_ptr(const void *);
      |                    ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/819f231a60fc81f9a8dd07bf5411aa9d8f78c3bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bdwgc/bdwgc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index d1c9d4dfdc..cefa975998 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -21,6 +21,9 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 BDWGC_CFLAGS_EXTRA += -DGC_NO_DLOPEN
 endif
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
+BDWGC_CFLAGS_EXTRA += -DNO_PTHREAD_GETATTR_NP
+endif
 
 # Ensure we use the system libatomic_ops, and not the internal one.
 BDWGC_CONF_OPTS += --with-libatomic-ops=yes
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
