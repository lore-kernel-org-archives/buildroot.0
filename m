Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56CDC43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EF064060C;
	Mon, 18 Jul 2022 20:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF064060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYMfxjrZXKMW; Mon, 18 Jul 2022 20:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DB184052F;
	Mon, 18 Jul 2022 20:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB184052F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30A951BF3D4
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09E64416ED
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E64416ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpfugVt8zR0h for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 20:38:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56A9416E2
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A56A9416E2
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 20:38:50 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v16so18697986wrd.13
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 13:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zKbnuImqTV64yp+lxB+RhRGL+q227dDwdGD02IDIgL0=;
 b=NltC4U38Dv6KyoLFecHh3t4f3fG/uWTKSeVA6D6oBA9LXt7768MSJWqJM2D5nxdvA1
 RjqMBArsYKc5HpvuvUHVaoeYk2t3oq1LwPVZHg6gH27ypTt+WIYkxX9qoiXIFpTObLqg
 1c7j+PfXx0KpV2w2v85E3kUTuPdx1nW1eeQU8ksF7FOv9MO7vY2Wxd/UCNJrHCvrUvLa
 +dRAh5QOaCAgLbjC5HjoEWo7fPswe/cH6ztUYCC7iFArSlG1ouWm4PRP2nt2ct2gEo3p
 WCZbduNeMLSqyshXUf6f5ucv+ywi7lpN1bwHnoLyZ8lvZ3Sulun6Dfpz4uPfug8cFz8a
 9cQA==
X-Gm-Message-State: AJIora9oT+D8n/UHGX9JNr0fzci8zjWX2Z0CU1VfVr3hKTmN4MGp98n3
 DMPfLiUt8VRKl9O91RCeMcHoqBJI/k0=
X-Google-Smtp-Source: AGRyM1tNDsict8g8b/4iqYmVKDea78wOMWc6mk+2RpKwff71TxIhyC1/B7Pn9jHcfZQ15DnvG5OpKA==
X-Received: by 2002:adf:d1ef:0:b0:21d:983f:4b8e with SMTP id
 g15-20020adfd1ef000000b0021d983f4b8emr24828791wrd.334.1658176728575; 
 Mon, 18 Jul 2022 13:38:48 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a7bc006000000b003a02f957245sm19681571wmb.26.2022.07.18.13.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 13:38:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 22:38:47 +0200
Message-Id: <20220718203847.2646609-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zKbnuImqTV64yp+lxB+RhRGL+q227dDwdGD02IDIgL0=;
 b=jMYl5MtHOmNvpD6U7iM+K3Oi5erXR/ChKvTMe747533PO1RSakPYMhf4lUBqnzQiag
 s6yqdCeD+h8nNKlf/fK6wxbpv88/fE78UqZNj26ef0dQSFKrhSgBueEDyD4cao39aZ3U
 bVL7GipqJbs0V622HGA94ACgw311qZzmdC7tlwdekYoPMfaKkS6QyUrUfexVre/gbmfA
 r8S6uaO1joPIzh0yeyNPPKwWAgQKvAbLkS1ot9meXGFHZS9dMI0LU1PFm0YUKXaBwh6k
 xbe6oj7J6uHL7YdWbNplmqnL05QcZIAJioVe90z6+uS6ANh/1TAoiaHBHtd8qmy21eZy
 oAHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jMYl5MtH
Subject: [Buildroot] [PATCHv5] package/uacme: requires TLS support in libcurl
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Nicola Di Lieto <nicola.dilieto@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Baruch Siach <baruch@tkos.co.il>

uacme configure script fails when libcurl does not support TLS. This
means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.

Add a kconfig knob to libcurl, BR2_PACKAGE_LIBCURL_FORCE_TLS, so that
_TLS_NONE is not an option. Select that from uacme.

Note that, beside selecting BR2_PACKAGE_LIBCURL_FORCE_TLS, packages will
have to also select a package that can be used as a crypto backend by
libcurl. Use of BR2_PACKAGE_LIBCURL_FORCE_TLS is unlikely to become very
common in the foreseeable future, so we don't need to optimize for this
corner case.

uacme already needs a crypto package for itself, so the above
requirement is naturally met for uacme.

Fixes:
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998@free.fr:
  - keep the current forward select
  - add the kconfig knob
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
v5 (Yann E. MORIN):
  Rename knob to _FORCE_TLS (Baruch)
  _FORCE_TLS needs a crypto package to be selected (Baruch)
  Expand commit log to explain that (Baruch)

v4 (Yann E. MORIN):
  Restore forward select
  Add the _FORCE_SSL_TLS kconfig knob; use it from uacme

v3:
  Move comments up to fix suboption indentation (Yann)
  Add missing MMU comment dependency (Yann)

v2:
  Add dependency on crypto back end for uacme itself (Nicola Di Lieto)
---
 package/libcurl/Config.in | 7 +++++++
 package/uacme/Config.in   | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 3381decca8..bc2f8f47f2 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -45,6 +45,12 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	  - DICT
 	  - Gopher
 
+# Packages must select that if they require a SSL/TLS-enabled libcurl.
+# Those packages must also select one crypto package that can be used
+# as a backend below.
+config BR2_PACKAGE_LIBCURL_FORCE_TLS
+	bool
+
 choice
 	prompt "SSL/TLS library to use"
 
@@ -77,6 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
 
 endchoice
 
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..796f54754e 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C with minimal dependencies
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
