Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1E6C433FE
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175E161037
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 175E161037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C062340771;
	Fri,  5 Nov 2021 16:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OeOlj4o55HPv; Fri,  5 Nov 2021 16:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE84B4076F;
	Fri,  5 Nov 2021 16:47:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 447CD1BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25E674076F
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTG6MzCAH5Xx for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:47:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCED24076E
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:47:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d3so14650316wrh.8
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 09:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CQmrBBKkX33k2hv3r98gBFC90l/G3eMHrEYWTx7AX1A=;
 b=gmgGBfpgDw7jMQgVbYtmkAiUsupK9AiID0SP2l4Qo2iMv7sdTMP2Sr509XGoNK+Mxh
 vfMtGvjyPeUBEEucfCxMTwQZFk9bsQB+c8jQ3feaoV2WntIJ3TWMdnm81zj7LHXMS4ke
 IDRoGaAJV0RJLnAkCXQawds/yK6tLHwVmXxbIMUixanSGHS77rq3ezf1Ioc9FLKQUdrT
 5z63q3axqUo/i/k3ipa7ox6v/PC28yNFu/7a/XlavqcPlXAvGABZlbyrFwiai+bxxGz1
 tzgpSeD9+v5hcaicS/jizSx4sBXrSfcIH5VBhviqcspt5NpPnBg1tuH5SzU0a/CwpncJ
 OqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CQmrBBKkX33k2hv3r98gBFC90l/G3eMHrEYWTx7AX1A=;
 b=d3Ffe5dB07f65hs+fi7qL2iVn9e7gGSMgHyWvMGxDE2cuqy7DHF+8zUiPVvRvwdPDK
 1FKjafCtM5tTKoYVapobmIju4Mxhzf21aH9vuddg7Xv3EGLCOM0JfQ4siabx9G+u7/ui
 j9vo3w9ND6yboCmRE+wIitvguE13r4ptRySKam4cDJAHbjis8wNcH/IRE/oqZOuJgiG1
 Neyqza/c4BN4zYxbEqgvEPTbUtuRGIA/a5+dgZXE4UOiaiKt1SBitEI19IsAOv2Si6v6
 0nUmHs2H+nqCurhVEibfhmt71vcroDxeEbksvxOk7qhIiDD5Kl6MTpjIV1l+LkjZ3YZs
 yJ3g==
X-Gm-Message-State: AOAM532ldaAu1bt2QY2zK2Z7q51teobwi12TRvnMryxCRBpq6WMqHeZg
 S/eHKKoW9q7qnlRGfHVtDonFHMbHkcA=
X-Google-Smtp-Source: ABdhPJwJxVbqu6W2KRDhUa9KS4CY3ZgoFjk/7snKcnhcsuEHLp/gHOsshaF9sVF7+R5LnL2vrZREXw==
X-Received: by 2002:adf:fe88:: with SMTP id l8mr54457566wrr.208.1636130825823; 
 Fri, 05 Nov 2021 09:47:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l7sm10967790wry.86.2021.11.05.09.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 09:47:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 17:45:09 +0100
Message-Id: <20211105164509.2410873-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/erlang: bump to version 22.3.4.22
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop third patch (already in version)
- Fix build failure with autoconf >= 2.70 raised since commit
  ecd54b65c1f998a7ccd91f7c523e4ff38c4781da

Fixes:
 - http://autobuild.buildroot.org/results/4f52b2f194dcfd619fefb192d1c0fd070d5bd408

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-ODR-violation-of-ei_default_socket.patch | 54 -------------------
 package/erlang/erlang.hash                    |  9 ++--
 package/erlang/erlang.mk                      |  7 +--
 3 files changed, 9 insertions(+), 61 deletions(-)
 delete mode 100644 package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch

diff --git a/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch b/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch
deleted file mode 100644
index 69b6fae81f..0000000000
--- a/package/erlang/0003-ei_portio.h-avoid-ODR-violation-of-ei_default_socket.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From de870d7f9f36b3e68f280057851a4585a67ab219 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Tue, 14 Jan 2020 23:15:01 +0000
-Subject: [PATCH] ei_portio.h: avoid ODR violation of
- 'ei_default_socket_callbacks'
-
-Noticed as a build failure against fresh gcc-master:
-
-```
-LD otp/lib/erl_interface/bin/x86_64-unknown-linux-gnu/erl_call
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(eirecv.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(send.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(send_reg.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(epmd_port.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-ld: otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_portio.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: multiple definition of `ei_default_socket_callbacks'; otp/lib/erl_interface/obj/x86_64-unknown-linux-gnu/libei.a(ei_connect.o):otp/lib/erl_interface/src/misc/ei_portio.h:50: first defined here
-collect2: error: ld returned 1 exit status
-make[3]: *** [x86_64-unknown-linux-gnu/Makefile:669: otp/lib/erl_interface/bin/x86_64-unknown-linux-gnu/erl_call] Error 1
-```
-
-The failure looks legitimate: `ei_default_socket_callbacks` is a
-struct defined in 'ei_portio.h' and in 'ei_portio.c'.
-
-The change flips 'ei_portio.h' definition to declaration.
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-
-Patch taken from upstream: https://github.com/erlang/otp/commit/de870d7f9f36b3e68f280057851a4585a67ab219
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- lib/erl_interface/src/misc/ei_portio.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/erl_interface/src/misc/ei_portio.h b/lib/erl_interface/src/misc/ei_portio.h
-index 84ebc5039a..5172d085b4 100644
-
---- a/lib/erl_interface/src/misc/ei_portio.h
-+++ b/lib/erl_interface/src/misc/ei_portio.h
-@@ -47,7 +47,7 @@ int ei_writev_fill_ctx_t__(ei_socket_callbacks *cbs, void *ctx, const struct iov
- int ei_socket_callbacks_have_writev__(ei_socket_callbacks *cbs);
- #endif
- 
--ei_socket_callbacks ei_default_socket_callbacks;
-+extern ei_socket_callbacks ei_default_socket_callbacks;
- 
- #define EI_FD_AS_CTX__(FD)                                              \
-     ((void *) (long) (FD))
--- 
-2.20.1
-
diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 3c2f039496..338545a0ba 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,4 +1,5 @@
-# md5 from http://www.erlang.org/download/MD5, sha256 locally computed
-md5 b2b48dad6e69c1e882843edbf2abcfd3  otp_src_22.2.tar.gz
-sha256 89c2480cdac566065577c82704a48e10f89cf2e6ca5ab99e1cf80027784c678f  otp_src_22.2.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
+# From https://github.com/erlang/otp/releases/download/OTP-22.3.4.22/SHA256.txt
+sha256  e7f0793e62f8da4f7551dc9c1c0de76c40f19773ba516121fc56315c840f60cc  otp_src_22.3.4.22.tar.gz
+
+# Hash for license file
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 527eb15a00..ac2c204a49 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 # See note below when updating Erlang
-ERLANG_VERSION = 22.2
-ERLANG_SITE = http://www.erlang.org/download
+ERLANG_VERSION = 22.3.4.22
+ERLANG_SITE = \
+	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
 ERLANG_DEPENDENCIES = host-erlang
 
@@ -37,7 +38,7 @@ HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 
 # Whenever updating Erlang, this value should be updated as well, to the
 # value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 3.13.1
+ERLANG_EI_VSN = 3.13.2.2
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
