Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F34FC43216
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:08:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1D360E78
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 09:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A1D360E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BDF40626;
	Wed,  4 Aug 2021 09:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAoxQrFBAnY3; Wed,  4 Aug 2021 09:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A11405E0;
	Wed,  4 Aug 2021 09:08:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 476DB1BF41A
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 369BE405E0
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 09:08:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUY7dGEYOZ0l for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 09:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C069405D4
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 09:08:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso3407797wmq.3
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 02:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ie2k3rJOP6cha7M7AUvqeomd8qMcwyzpEDkJJQ+YOrs=;
 b=PW7FCt+YCEfTTnx3AJy6CtMRkyJ577xNet9ILD7kHyUpNPMLk3t96DR5Cxwafymwch
 JoIo+6cKok+yx3CMcfua7VjX4iX8nhIsMttX3rM62AXYmiIHZqWb/W9ot0+r4JunYmDS
 WrtwFb1tvw0C1XVkYRIyp4efXIdCPqZiL+bPSmU0L+k/lM9yjV0dUekGqvftQoB/5jkn
 2jVm2RfpFX6eEvuUnk4ylh+tI9EisxoBQ1axvkIz+nj9BlO3F4HhVkPG5sLh68DE7KRz
 /pux3FHav6FSiqtK4ogf9isyd8gS2tDDRXRnXz1WcYJsKDYh5cSA2c/IwFk+d0MiPSCb
 tESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ie2k3rJOP6cha7M7AUvqeomd8qMcwyzpEDkJJQ+YOrs=;
 b=SlT9KyaPu+jxiGoT5cSZKA0egPPTiMbREx3ISU/w8G15uPdoJsp1p5a3GScMZLoCLY
 ZEGqi8Jqd+xchkVleVjVR5qWI8oeKLHZQVGB4bihpaPB38wZCtl+qdMANgvFyU0fVM+B
 TQGYIAWNqrL7J6Tt4TlrdKSGuxCBpeRIdkFYzPMNzN4Mw9AgaV7rM1ui/5j2LK95Sx89
 Aeg437U+VSWrZvzxN3pEFS1V65JhE3wipDRxGiXqiSkNe/zSSGFxTZqp5PhShX39NeTR
 lO05a1qkpZu9IErqyfDqLiM7CgywpzYNkC+ksU4Y4gPdVmwyhcp7L2rbDJexpTRQDLxU
 e+6w==
X-Gm-Message-State: AOAM530MXy3jljZ3w+iIDQCBseAMTiCQGiV0OnZB3gKM1eCLBRZJBvSI
 4tB6hA5FPXVQcnQu6Az4KPRB1punnhf/dw==
X-Google-Smtp-Source: ABdhPJyBPvr9AbU3B9a8XPC69qHfMHOiO0yhb+q0t31r15cFw3qrdBXuvkqBig8ySUPCiDs0cqP4hw==
X-Received: by 2002:a1c:7711:: with SMTP id t17mr8580205wmi.77.1628068105966; 
 Wed, 04 Aug 2021 02:08:25 -0700 (PDT)
Received: from kali.home (pop.92-184-97-247.mobile.abo.orange.fr.
 [92.184.97.247])
 by smtp.gmail.com with ESMTPSA id q9sm5222954wmj.2.2021.08.04.02.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 02:08:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 11:08:13 +0200
Message-Id: <20210804090813.789131-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sox: fix static build with
 libsndfile
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following static build failure with libsndfile raised since
commit dbc6e9e9f385995eb10bbfb0bb08e7674100ce66:

configure:14720: checking for sf_open_virtual in -lsndfile
configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   73 | char sf_open_virtual ();
      | ^~~~
conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   75 | main ()
      | ^~~~
/tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'

Fixes:
 - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e.ac-fix-static-linking-with-sndfile.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch

diff --git a/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
new file mode 100644
index 0000000000..2233459331
--- /dev/null
+++ b/package/sox/0005-configure.ac-fix-static-linking-with-sndfile.patch
@@ -0,0 +1,44 @@
+From 06109c84ab6930265287049c4bf9405e7ebc4986 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 10:27:16 +0200
+Subject: [PATCH] configure.ac: fix static linking with sndfile
+
+Use SOX_FMT_PKG to retrieve sndfile dependencies (e.g. flac, opus or
+vorbis). This will fix the following static build failure:
+
+configure:14720: checking for sf_open_virtual in -lsndfile
+configure:14745: /tmp/instance-1/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -g0  -static -Wall -Wmissing-prototypes -Wstrict-prototypes  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -Wl,--as-needed conftest.c -lsndfile    >&5
+conftest.c:73:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   73 | char sf_open_virtual ();
+      | ^~~~
+conftest.c:75:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+   75 | main ()
+      | ^~~~
+/tmp/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-1/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
+flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4bc58ed68b29642876bb02710d0cd4f31540de86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet (waiting for feedback on third patch)]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ae3202c..26510769 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -117,7 +117,7 @@ SOX_FMT_REQ([mp3], [MAD LAME TWOLAME])
+ SOX_FMT_PKG([oggvorbis], [ogg vorbis vorbisenc vorbisfile])
+ SOX_FMT_PKG([opus], [opusfile])
+ 
+-SOX_DL_LIB([libsndfile], [sndfile.h], [sndfile], [sf_open_virtual])
++SOX_FMT_PKG([libsndfile], [sndfile])
+ SOX_FMT_REQ([sndfile], [LIBSNDFILE])
+ 
+ SOX_FMT_LIB([wavpack], [wavpack/wavpack.h], [wavpack], [WavpackGetSampleRate])
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
