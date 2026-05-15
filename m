Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54188CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFC684334;
	Fri, 15 May 2026 13:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL39F3VfjPHJ; Fri, 15 May 2026 13:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FAD484335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852047;
	bh=jIGMP1A98L5ae1CS95cAqoKeYlyNfktk2fIy28BLcwM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gHmweW8qjEN7nxYtMI/Q7XYIlIviw235bUWbBYz69H9OTimvR1d8hW8lsTOIrlthr
	 skdVwmTrlGcJwzL3WcCP2u65dyD9+Kg+0y45RbHKJR3q20qUZr5pn8TOm2tgUZRpnx
	 Vma5Z3Tr/0H+cB252CJQrDo7eklUctPY5d+Qx9KQBK2IEutj+fVK6kafnBlH+VS1lm
	 F2sqbMpv9TFOKE4VcfhecAigIRhk2fhCuHkHwrNkg2grAHXSuz+dmtgSRgILQ1R2nZ
	 jAW+JS8+1Aro/D4WcBtYN896zd5j2KwTtreR06ifEmLphNtr9ViGilmLtc7QzkYfy4
	 x27fIVCexeT/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FAD484335;
	Fri, 15 May 2026 13:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CABA36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66F71615C6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Spz5-2uc5iNf for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5468061572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5468061572
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5468061572
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so5787563f8f.2
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852042; x=1779456842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=90cuYjkrAHAMRNy85Lo4K41QMdXcP/oKB+StiSprRaU=;
 b=ng/JR0rcOMpym25lDTEk+pPb8fDfnSDUBc1WVtIdYuiXHuUV6lY38+YFZgvrkAr6bN
 5GE/6pfh7N25+zbee+mu96Lyld2xluz5CjsXDEB4u1JN+B5rHaezktSEkCqWbpvW5V1g
 dcz/70ezmFNubRrDti5qAVKnwGMRzY/d2Rc/wOiH182lxYiQsZR3DaU/j3+gNpkqfjGz
 +jdBfjmRxHVijvFXQQcDV3CaouYSvskZDVJwtrddrYcFxO1ZCb2X0EyFjTdeSscPW8FZ
 z/A9L2WK5XRhhcJXy5DIoXTOtkdwRWMyXgam3TR5AqzaV9N9zFDohJhaGAj1i+P5WERO
 Wy2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pRQmaZiyF/FS3ehPzBZWsRodB/eDOwCBAQQVyX9FPiu1N4tkJDGB1/rwceZ9KAZa0FM0/3FFR/Eo=@buildroot.org
X-Gm-Message-State: AOJu0Yx51PLdCbzV3Fb9XViy6dS8nl3QB1eyndjbif6lp1Vc8X+jJE5g
 jdh/iQBHbqJu8+FbFa/ykjAbRcLVVVvTivLePBAHVmyETslqt66ktowB4nI79+6++iNwXRhU7Hf
 P3zIo
X-Gm-Gg: Acq92OFJM8QgHPW5QpT+t2wz0Anj0e24ka6+VSqS5+sCyJ64Fq76yDF0yKc+DzppksY
 4fhX9ZJTf2v65fodm2Tk9oivyAno9XYEWviXHPWLJRBHEwqFa9P8iFFN6wGwV4zm1KpNY4AndJO
 8HLmZ8voh6p4xf1N0oX+zK3Q59B6EqIVZSeStHJewbhhPgNqK3oBEbKNUVgM6gkoAlwYdXM3Jk0
 UczjZgvUkxxkLTWX7FI6XvPxiE5ZLXInyJGYLIjcRkDynZk8MBxKBmhvNRCmQH6UaHz1RxnwIfB
 hmuxYqo1pJl8iktOLNZ/utG3RItLdNnDnTYt9Q4en0LDGcljIjSdamDb5XiYyvUwm97FmFEbD64
 0e9MoOXDSvMpMwN3fEYSqvAOGTUfuj5J0cTsHSKIF8U3pnX14Qj8GbceHnjMkklYE8v2UgoSZiF
 PHN1HXnsxJeJbuS6LjFey6zSmAWQJT3CQEix/9fOG4zAH+
X-Received: by 2002:a5d:5d85:0:b0:45c:2859:676a with SMTP id
 ffacd0b85a97d-45e5c59a1b0mr5327142f8f.18.1778852041980; 
 Fri, 15 May 2026 06:34:01 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe0f72sm15638770f8f.25.2026.05.15.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:01 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:01 +0200
Message-ID: <20260515133401.316013-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421184831.2576691-1-bernd@kuhls.net>
References: <20260421184831.2576691-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852042; x=1779456842; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=90cuYjkrAHAMRNy85Lo4K41QMdXcP/oKB+StiSprRaU=;
 b=EoSeLljntNn2cVzdHisSjTSbt6wx1IpLsVocnmBZT6MDLf3jh19rzVv/7I9grjIpxo
 ZRtRhmIf3iCmRXhPbJEvTtrI6YYe1ZDXVV05ZcMBvUrcqrtxYJ5W1pahmEaMP/tfSuMB
 naNhE6x1M0L2K6Y8rJ7zm1D+tPOu4AfomJdWG4u+F1azZvSE0Y64O1gmIAJZ9Ln7Rwm5
 ru2+jw+B6lNfZxmR1C9K5BHsCZfqUykza0muVIeY0v4gnm8At15xcrq0LoouU+gFxVG+
 CqUM5+ZAjIXnBRr+DhZOggX0NKn5nFZcFChjNMQoU9TdqAy9B6Ok4axvTfWpqcCYD527
 9hFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EoSeLljn
Subject: Re: [Buildroot] [PATCH 1/2] package/opensc: security bump version
 to 0.27.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/OpenSC/OpenSC/blob/0.27.1/NEWS
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Removed patch which is included in this release.
> 
> Fixes the following CVEs:
> * CVE-2025-13763: Several uses of potentially uninitialized memory
>                   detected by fuzzers
> * CVE-2025-49010: Possible write beyond buffer bounds during processing
>                   of GET RESPONSE APDU
> * CVE-2025-66215: Possible write beyond buffer bounds in oberthur driver
> * CVE-2025-66038: Possible read beyond buffer bounds when parsing
>                   historical bytes in PIV driver
> * CVE-2025-66037: Possible buffer overrun while parsing SPKI
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...ble-wrap-unwrap-test-until-OpenSC-17.patch | 41 -------------------
>  package/opensc/opensc.hash                    |  4 +-
>  package/opensc/opensc.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 44 deletions(-)
>  delete mode 100644 package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
> 
> diff --git a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch b/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
> deleted file mode 100644
> index 9bf601370a..0000000000
> --- a/package/opensc/0001-pkcs11-tool-disable-wrap-unwrap-test-until-OpenSC-17.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 768c9bfcd91206f0d85cd4757fde48e00850a014 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Mon, 6 Jan 2025 22:36:10 +0100
> -Subject: [PATCH] pkcs11-tool: disable wrap/unwrap test until OpenSC#1796 is
> - resolved
> -
> -Similar to ab74fae4d71d1705b77b9459141987a95dcfc91e ("pkcs11-tool:
> -disable wrap/unwrap test until OpenSC#1796 is resolved"), but for
> -0.26, since OpenSC#1796 is still open.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Upstream: https://github.com/OpenSC/OpenSC/pull/3303
> ----
> - src/tools/pkcs11-tool.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
> -index d701d76d6..871a39977 100644
> ---- a/src/tools/pkcs11-tool.c
> -+++ b/src/tools/pkcs11-tool.c
> -@@ -7681,7 +7681,7 @@ static int test_verify(CK_SESSION_HANDLE sess)
> - 	return errors;
> - }
> - 
> --#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
> -+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
> - #else
> - #ifdef ENABLE_OPENSSL
> - static int wrap_unwrap(CK_SESSION_HANDLE session,
> -@@ -7805,7 +7805,7 @@ static int wrap_unwrap(CK_SESSION_HANDLE session,
> -  */
> - static int test_unwrap(CK_SESSION_HANDLE sess)
> - {
> --#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 25
> -+#if OPENSC_VERSION_MAJOR == 0 && OPENSC_VERSION_MINOR <= 26
> - 	/* temporarily disable test, see https://github.com/OpenSC/OpenSC/issues/1796 */
> - 	return 0;
> - #else
> --- 
> -2.47.1
> -
> diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
> index e12d2d4bfa..b24a6bca98 100644
> --- a/package/opensc/opensc.hash
> +++ b/package/opensc/opensc.hash
> @@ -1,5 +1,5 @@
> -# Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
> -sha256  837baead45e1505260d868871056150ede6e73d35460a470f2595a9e5e75f82b  opensc-0.26.0.tar.gz
> +# From https://github.com/OpenSC/OpenSC/releases/tag/0.27.1
> +sha256  976f4a23eaf3397a1a2c3a7aac80bf971a8c3d829c9a79f06145bfaeeae5eca7  opensc-0.27.1.tar.gz
>  
>  # Computed locally
>  sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 11d1507d45..dbc83c2b0e 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENSC_VERSION = 0.26.0
> +OPENSC_VERSION = 0.27.1
>  OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
>  OPENSC_LICENSE = LGPL-2.1+
>  OPENSC_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
