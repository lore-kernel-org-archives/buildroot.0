Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D54C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:31:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25466120C
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F25466120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA99B404FE;
	Mon, 23 Aug 2021 23:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1oMY0yKCZAF; Mon, 23 Aug 2021 23:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE2A4051B;
	Mon, 23 Aug 2021 23:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9A8B1BF3AF
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C466540365
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 23:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cqw_meGosq62 for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 23:31:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB5740360
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 23:31:24 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n12so28719077edx.8
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 16:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJhgJYDG1HkLfnVRMiDgjKDRFG4xZRiTFscXe+md6qc=;
 b=FcgL2PrX9OoBnaJFdyMSRCPDrSn3UKl7WHPcqvyE0cdxe5zYRF4W/I0p0vo0Z8taZv
 Lx7Z//7919hgxub9sbNfkjjocCWxKDGC2KtEx1wwGY7LDagZnDCbYi2oW4SUelI1kYp8
 iPP3t5N6BHzWzd+Z4rLAGkAE+6pL9J1+c77qxahIdl8Z1jiSKE5Lgj3AMcCw1IEk412H
 Ac+FUnH5gwQUJkw/fFN4CNaczSKMoVUyFm/idqUlv4xdbe2NCLi3Wou7SJTsxvrPZ2zJ
 aktVStCgcE14u21t/IG/UR0CoGNwFzcT7WSRA+o22bAMkPzTjYMm4kfLw+rxlVFPmEcb
 CKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NJhgJYDG1HkLfnVRMiDgjKDRFG4xZRiTFscXe+md6qc=;
 b=NmoN4PxyO3kzgMcjykOW8vDVAHiASlkG3KUlWl073qw3lzISnJLhkGPHrXluqlnkvM
 soJu9l+ZStuW99DKCIlOu5L0fQpYgQ2jgLjvA7bx7J3wuCLYb1ULn0H/WGwirbdxomcA
 jpFXkFef7Jh/dRpi9BhI7OEqbn7dta9id3t+oja7dBs9JJkSHfWDR/3xRwq9sinDu20j
 XIDt8bzGcg47w7Nnu4M2o8WlRqwQcFAdxU2FV80sjb+JydMx0uuHT83PJ6MKSCR1y8IB
 RCrLOpW1XC8+O5Pm8gX/ElW2Xprmh2wt6udQhTuLCf3Vd+ab9A/VB73rraA6HDnWCGp8
 oTsw==
X-Gm-Message-State: AOAM531DJytbQS0eVCsJnavawmZ8fbhnF3139e0NuOHD0suTuFw7aktV
 FTULWVBoBgf7yB42XnTTmaLtBOIAKGUwhQ==
X-Google-Smtp-Source: ABdhPJxyDS4d74ogl+JGNJ2Dq4axh+k4o4Jb3bl83u2oqsF88ZZP7iPtDIvIUAXsKW946YVA+h5nlg==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr39219267edv.230.1629761482368; 
 Mon, 23 Aug 2021 16:31:22 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id js21sm2633798ejc.35.2021.08.23.16.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 16:31:21 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 01:31:13 +0200
Message-Id: <20210823233113.936711-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcap: don't overwrite 'empty' when
 generating loader.txt
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Upstream commit [1] introduced an invocation of objcopy to generat
loader.txt. However, objcopy, if not provided with an output file, will
overwrite the input file. This is usually harmless because it will be
identical, but the timestamp is updated. This may cause 'empty' to be
newer than 'loader.txt', which causes 'loader.txt' and its dependencies
to be rebuilt during 'make install'

We provide a different set of parameters during 'make install'. In
particular, we no longer pass in HOST_CONFIGURE_OPTS, so we no longer
set LDFLAGS. Thus, there is no -Wl,rpath option that is passed in, which
causes the resulting binaries to have an incorrect RPATH.

Fix this by adding /dev/null as the output file in the objcopy
invocation.

Patch was sent upstream, but there's no mailing list, just a single
person.

Fixes: http://autobuild.buildroot.net/results/600/600aff5b839b48db80751cace5fa9670b7a3d698
(hopefully)

[1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=efd293947f940180eedd8d0915b124f4aedccc08

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Note: I tried updating to v1.2.53 first, but that failed due to [2]

[2] https://bugzilla.kernel.org/show_bug.cgi?id=214023#c16
---
 ...don-t-overwrite-empty-when-generatin.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch

diff --git a/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
new file mode 100644
index 0000000000..a47a2c788e
--- /dev/null
+++ b/package/libcap/0001-libcap-Makefile-don-t-overwrite-empty-when-generatin.patch
@@ -0,0 +1,50 @@
+From dc507a812d931c24f1ac98c811fdd29bffa21da9 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 24 Aug 2021 00:36:40 +0200
+Subject: [PATCH] libcap/Makefile: don't overwrite 'empty' when generating
+ loader.txt
+
+objcopy takes an input file and an output file as arguments. If the
+output file is left out, the input file will be overwritten.
+
+Since the objcopy command used to generate loader.txt only does a
+dump-section and no filtering, in practice there is no change to empty.
+However, as a side-effect, its timestamp is updated. The timestamp of
+empty and of loader.txt will be more or less the same; however,
+loader.txt is closed just before the output file is closed, so it's
+possible that the timestamp of loader.txt is just a little bit earlier.
+If this happens, it causes loader.txt to be rebuilt later, which in turn
+causes a number of other object files to be rebuilt.
+
+Usually that's harmless, but it sometimes causes the rebuild to happen
+during 'make install'. This is particularly annoying if 'make install'
+is done as root, since loader.txt becomes owned by root in that case.
+
+Fix this by specifying a harmless output file: /dev/null.
+
+While we're at it, take in an upstream change that removes the redundant
+redirect.
+
+Fixes: ee3b25c0a877fa74d1aec88f325ac45b09963c82
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ libcap/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index 47cf8f4..18e4f4f 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -105,7 +105,7 @@ empty: empty.c
+ 	$(CC) -o $@ $<
+ 
+ loader.txt: empty
+-	$(OBJCOPY) --dump-section .interp=/dev/stdout $< > $@
++	$(OBJCOPY) --dump-section .interp=$@ $< /dev/null
+ 
+ cap_magic.o: execable.h execable.c loader.txt
+ 	$(CC) $(CFLAGS) $(IPATH) -DLIBRARY_VERSION=\"$(LIBTITLE)-$(VERSION).$(MINOR)\" -DSHARED_LOADER=\"$(shell cat loader.txt)\" -c execable.c -o $@
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
