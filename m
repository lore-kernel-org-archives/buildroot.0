Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21ADD3C537
	for <buildroot@archiver.kernel.org>; Fri, 18 Oct 2024 04:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B39600B8;
	Fri, 18 Oct 2024 04:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYrfzjQVm85d; Fri, 18 Oct 2024 04:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18645605B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18645605B1;
	Fri, 18 Oct 2024 04:34:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 594CA27DD
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 04:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3177D40761
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 04:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kt3h0XZY80tj for <buildroot@buildroot.org>;
 Fri, 18 Oct 2024 04:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B6694075E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B6694075E
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B6694075E
 for <buildroot@buildroot.org>; Fri, 18 Oct 2024 04:34:50 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e2903a48ef7so1697609276.2
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 21:34:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729226089; x=1729830889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Og7pWwJUOwnnLpNQJTe2X2uotbmpxSpagK5IMlwjaYc=;
 b=F4OFI7bxWtwO+Fzo2QiYHtpeIQOok8E6wW/CbiGZ7FXwkaJunyhKqP4q+HaHMpkwiT
 X2mxL9VCHbx8aey9Ie417jW3PWcPHwhw1FLp15/DCoPdXwAGwl2Nt5nHcwNx1ZGh3BIp
 CCYh4w/vwQIBRXgmpjeZZamdleRA3cFJiv5AgmjAbwbVoILVGipGNRY1B63rCpJnmTqF
 08+9eMirq0zvudFWWzyvpfGxky+qQCD5yn5Bp0aDRqg3Sl925s/Q7qu3DrhTj4ZMSNZS
 EJ44Xt/A2TpxElbPI8jzGOYyBgXL6VopzjTxpdJGv1gPojdEILfugCVmvFbkE1sXS9xu
 KnPg==
X-Gm-Message-State: AOJu0Yy3PVznBamSObk3lH0ewHuhDf4y5CHsteSHv69zw1Z6F77LOEf6
 zLdW9p8dA0iBNl1kwoWe4iOyZtHbcjSYNpChhNuWhe/wrHfrw0hVH6jlISQy
X-Google-Smtp-Source: AGHT+IGOlJ1oNeAwJ6oAop9ixPN5t4VSqs5yx9tqfQ+SNInHrlfXurqFhQwb/V8jpVlw04uzdFIRrA==
X-Received: by 2002:a05:6902:1b0f:b0:e29:44e5:c426 with SMTP id
 3f1490d57ef6-e2bb1309527mr1242254276.21.1729226088645; 
 Thu, 17 Oct 2024 21:34:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7eacc22a5c9sm447194a12.32.2024.10.17.21.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 21:34:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 8FB664433457; Fri, 18 Oct 2024 11:34:43 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot development <buildroot@buildroot.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Date: Fri, 18 Oct 2024 11:34:38 +0700
Message-ID: <20241018043437.28475-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3804; i=bagasdotme@gmail.com;
 h=from:subject; bh=EQuikyE0OKHnqIhevKKIuhlRHuOC1I5FCERBiKzOSpw=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhnTBp7EdR/du5X/T3l7/fXU/b9T745/aE0JkC+5eaeQrX
 2SVEW/RUcrCIMbFICumyBK9VnaXMe/eS2YxCUUwc1iZQIYwcHEKwET+7mb4K23UZDzT8rHgmvyT
 nu4fmN8c/u8osDq+6ud3xXsC61e55TIyfN6/sOJuvma9c6nVsQRBl2dBjSJfW+dltPi9MZm98tw
 GFgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729226089; x=1729830889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Og7pWwJUOwnnLpNQJTe2X2uotbmpxSpagK5IMlwjaYc=;
 b=ek9e1Hu/uKHomiTGuvJNkW6tSXYB+Qj/LJLQ5BjIlyKx+N7yAt7of8D8N9qtUCQoOG
 +vv5kx8fGVbC2FVilEtR+5M3TieuAsWS90/OOquWfW2tM9lyx7D30n/V387krqDuws55
 MvuE+jlGLxDdVsWMCwXv3GXWInqSGSzdYLMRTXdtVDkm0Yl4SUtmJL0r0W3Ck0d0ASp/
 7hcv1+9hge/980fOji5kIa5eUKz+3Tamd88NVp9KRFteTfeZLFFLxppbn6Nn0Uc5uwNK
 zpFGYCjKaApunpMls8btcOUEJRS57pT73Nd1cA9Zo7TMQMX/RxezFUuM+MQyq8+n35YH
 uckw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ek9e1Hu/
Subject: [Buildroot] [PATCH] package/git: require wchar support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Git version 2.47.0 fails to build on systems without wide characters support
(e.g. uClibc-ng without BR2_TOOLCHAIN_BUILDROOT_WCHAR selected):

```
    CC t/unit-tests/unit-test.o
t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
In file included from t/unit-tests/clar/clar.c:13:
t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
  769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
      |                                                                 ^~~~~~
t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
  787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
      |                                                                 ^~~~~~~
make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
```

This is because git now imports clar unit testing framework since
upstream commit 9b7caa2809cb (t: import the clar unit testing framework,
2024-09-04).

From upstream discussion [1], git requires toolchains with full ISO C99
support (including wchar). As such, depend the package on toolchain's
wchar support (BR2_USE_WCHAR).

[1]: https://lore.kernel.org/git/ZxCJqe4-rsRo1yHg@archie.me/t/#u

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/git/Config.in b/package/git/Config.in
index d53921d7d5..a8ae5f59bf 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_USE_WCHAR # clar unit test
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -9,3 +10,7 @@ config BR2_PACKAGE_GIT
 	  projects.
 
 	  http://git-scm.com
+
+comment "git needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR

base-commit: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
