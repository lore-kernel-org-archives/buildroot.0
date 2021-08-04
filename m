Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C2DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319B961037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 319B961037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCA283AE0;
	Wed,  4 Aug 2021 21:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztIN2zPa0PDl; Wed,  4 Aug 2021 21:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536A68377F;
	Wed,  4 Aug 2021 21:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE3651BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E2CE8377F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tn4yGxc2ZQTs for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:00:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5835F83709
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:00:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c9so3660320wri.8
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yic6ZV7/D7NWTazMCo9mBn9bCN4b10oMa9Wwqo+BOmM=;
 b=t6lH8tzOR06VtXsj05NMjZn4+LIjb8ZK5p6RTPAPkt+ANeWaS+W7jk1nMTtmC5z4ac
 yw62HCCZdfPMrNBwE7MbJELrKft5EsZGe0tgXPplsEM/lZ/vtXPoAj3bj8hS4yGCt4kQ
 8ir8Wy14t0xT3B2iiRa9fsJAvSAL+N0yn2LGAKHlDDc+XD7bfLF4ZY4sx8PFtdwG3ft0
 S+lgsvrbBXvGGMKo88CNKLoCaKQz5DXMHV7bfGOqiQkzj5D/rU/EBoAjrcYhvLqvcZ42
 MoVeTwpqkNBO+M6ATNLhFugiFElQF2Z5iX00nwsW8u2zSBXwLQ1wK+TbZ+Tn8Vrvu+WA
 IEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yic6ZV7/D7NWTazMCo9mBn9bCN4b10oMa9Wwqo+BOmM=;
 b=iz239u21Z5/CQi8indDfxGcUn+kibNxM0Frul8OsDapdgNbam6Lckv5j/wYENPMpi1
 Z/lOWTopiea5IJFtKI/I6lZ1cbu2QfpVLIoxR0nR3cAXiaNLXtZ0D47UIKdik75R23P5
 LGOaSJstEKtcA82QXcLl+ukWJG9BlBdfU9mp+rkcusq8gO7h8ZBhI179F7uuaQZCdx7g
 oXImyIvFRGin2bpu2OyEVjvDdDNtQGSwbHwIlnSOjoGdUffPJyTnYhANweoHiAh70zR6
 xgQi4N44hvF2o+iS2YK+7a52mwFr2edtepdnIN7ZyR7zKc45459p5ElqBMdye/z9CU0j
 WN0A==
X-Gm-Message-State: AOAM5329t57Sr+Zb+VT2haFi4K9BYQGNn/DqFg4LiDI+QJy6p7eJmjEY
 +xtrLQEEhNLMrd7O5lhuV6ZZtoI69Cwk3A==
X-Google-Smtp-Source: ABdhPJy0NhEMxvSU58MGGGltSTtLJDG8kNB6BiGC7UzsZKFdHU4alpGjNatyCUMccwbJ34q6G6v5ZQ==
X-Received: by 2002:adf:9e01:: with SMTP id u1mr1267922wre.12.1628110808336;
 Wed, 04 Aug 2021 14:00:08 -0700 (PDT)
Received: from kali.home (pop.92-184-97-43.mobile.abo.orange.fr.
 [92.184.97.43])
 by smtp.gmail.com with ESMTPSA id w5sm4355337wro.45.2021.08.04.14.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 14:00:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Aug 2021 22:59:56 +0200
Message-Id: <20210804205956.1475477-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
References: <20210804205956.1475477-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/shairport-sync: fix static build
 with libsndfile
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

Fix the following static build failure with libsndfile raise since
commit dbc6e9e9f385995eb10bbfb0bb08e7674100ce66:

/tmp/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'

Fixes:
 - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e.ac-find-sndfile-through-pkg-config.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch

diff --git a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
new file mode 100644
index 0000000000..bd97ec0c3d
--- /dev/null
+++ b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
@@ -0,0 +1,43 @@
+From 900b1827c55cc6020b3242640075174c2e6b12a5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 22:16:40 +0200
+Subject: [PATCH] configure.ac: find sndfile through pkg-config
+
+Find sndfile through pkg-config to retrieve sndfile dependencies such as
+flac and avoid the following static build failure:
+
+/tmp/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
+flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mikebrady/shairport-sync/pull/1263]
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f77087c5..9b982c51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -304,7 +304,14 @@ AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP
+ if test "x$with_convolution" = "xyes" ; then
+   AM_INIT_AUTOMAKE([subdir-objects])
+   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
+-  AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  if  test "x${with_pkg_config}" = xyes ; then
++    PKG_CHECK_MODULES(
++      [sndfile], [sndfile],
++      [CFLAGS="${sndfile_CFLAGS} ${CFLAGS}"
++      LIBS="${sndfile_LIBS} ${LIBS}"], AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  else
++    AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
++  fi
+ fi
+ AM_CONDITIONAL([USE_CONVOLUTION], [test "x$with_convolution" = "xyes"])
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
