Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D4EF436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A17160E55;
	Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0E6n5jsiwfYk; Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6838560E56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439502;
	bh=9u2kqqKK0qNNYCi8cz6Tq9zenizJGhKni6aH50VaC0o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W2rQ26hoQdQwjyPTuznIn/asvHfQN/7inMeedSO5zQvInjwHO/fTCx8w+7o19kXKB
	 sJtwGfoj4188IXrU+T/8J0ZPlnOMKuMmwmGU3MOE7JfMAuafGYlecGQQ/OZ3bweSa1
	 /w8dk6lqQMvRyu//AGhNIts+ZtRsQ5m5vGot584UTl9ps9Neq4yygmyc/9Ycm52y1p
	 qYcL5Sly4ZDSSfwDOdBvqPeLy179EwoxZEvRQgPHSMiEp2deWWy9V/+5Qw4yE3ffhs
	 teu+YSGs9F11XCmI4zR8WQEfPIdVjPsg/1R9xEI+YmZXGsEGY4/xem3ZMBz60v3N53
	 Tviss6kMbjlZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6838560E56;
	Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DC8D396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E64A406D8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeUd2l-ESQQZ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B85F406D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B85F406D2
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B85F406D2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so12404765e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439496; x=1777044296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FLsgQoeO+lj+MF/EWW7fm+ytzhSndWEvq/HcFGGXRFc=;
 b=tKeYJmUWK7jvdx1Zi9Y9xn4xfHobDwmuznn3n9bTnoInlMQL+nqxeqnerS8wv++kyl
 iMl2WTPYeW0yP6LQWQpZGh9FRQxKxVdCTI6YbW2+3J88MFDlRmMk2lY+YEZaLWQd2nPw
 j130fgNejEq4WfTYHeAbhRXHTotAF7le9bEErs6e4/xFquu6gJyV6ylYZWCPQHEgSsjC
 SxrDxFNc3IaYj/wRhoz1cYM0WjAsrQvZWc+c/istZ+EA/k11E1lSU8qFFMLYLEw08TNA
 jmHjkJoEyAKTW3MHMFKo0iHUckaylpesckNMDJTEvo1UwaUX8fCa7w0IPutKf27yaHsV
 INpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ85mym0yVR3hEVbGv4+vBYKEqp8UTryPLYiSJyqwIAP2xWh8eqbHQrJER/Iq5fKXxY9w0OY+elyz58=@buildroot.org
X-Gm-Message-State: AOJu0YzpfDl2so7HIef9Z7uSld5ATZ7yKDZpl5tQhlS1835mjwewwAYi
 anP15u5rhnfd6Kj+MjmO5GnbGW1jGdrG9YOYvOhPT6Cw8GswS876KYbHPjwqoD3KZeI=
X-Gm-Gg: AeBDiesCjBIvwOA+vBg9Cf1H/OtJwHSrjefysdJTFafw7MO2NbCfzK5EOjc8LcNHaCR
 X/tmH4B7IMwjZBFv0myjRRYIopZK6OlZY8lD9LcKnTYHHfI8Hzy9Okfg8KzvEQjkJ/48LYwmQqL
 AYZkVIyJsRmAAvPJxYyAq952DeVXzzO00FXrFh0TKwL+CU8gCTI1gCCHJitYIBPBQV15LtAmCtO
 jQrxr/s2NhnNhCD6WNlKyH+oj2Npk66L74EklmRKsaSw19Y61avRwBYEdlh7xpQiEsmLZTWX5Zu
 pEpyveBdq8oGlmewPUOgbztLLWfPvXhdep5jxLmYljV0JUN2NmDZ3a1WogxhZIs/vKVZXjBrDik
 cgfxMiver9IbE/FajsEuhWMcRs2FSRBn/OXdVRYn03gpisG+PiklJA+JqCDMiv5pHnd5k0yMiIH
 RNi2hcrJ6b1r+Tl/9phWaDUE5kcf0=
X-Received: by 2002:a05:600c:4711:b0:488:d9ea:3da7 with SMTP id
 5b1f17b1804b1-488fb742ddbmr49836685e9.10.1776439495848; 
 Fri, 17 Apr 2026 08:24:55 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm59370125e9.2.2026.04.17.08.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:55 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:55 +0200
Message-ID: <20260417152455.313403-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409131700.278723-1-bernd@kuhls.net>
References: <20260409131700.278723-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439496; x=1777044296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FLsgQoeO+lj+MF/EWW7fm+ytzhSndWEvq/HcFGGXRFc=;
 b=S0UtevEGlEN4de5lQuQCplffnxtNjNcvY4fdFUd/aBf/eKGdl/2Gtsb2ayQziNn9YU
 4vlUZEsRhAXYEaqhAs1hWmJkAyQS5ynyzbkZpcH5p8j/az75txc476xa2rFH0NTnzS+b
 l7RvTcBXFo/kEGCPZhnffGViOzsQmQN1OqrxAWBGvBSfoN6+RPB7tFlYCMYh4x7lvlqy
 dCutZ6UD6ADsRi6xEk7wOdnjYhiKbXMDMQYrBSrXxSvvWsHIIBPyP0MANyS8/uml/aow
 CfRMkkFkT0GqdHS+u8OiEITHII2BslIi6BZ1zZPxk0PsuL8fdJVzLgtoXmzB8I5Nb7OR
 0/RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S0UtevEG
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 3.6.2
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
> https://openssl-library.org/post/2026-04-07-release-announcement/
> 
> Fixes the following vulnerabilities:
> 
> CVE-2026-31790 - Incorrect Failure Handling in RSA KEM RSASVE Encapsulation.
> CVE-2026-28386 - Out-of-bounds Read in AES-CFB-128 on X86-64 with AVX-512 Support.
> CVE-2026-28387 - Potential Use-after-free in DANE Client Code.
> CVE-2026-28388 - NULL Pointer Dereference When Processing a Delta CRL.
> CVE-2026-28389 - Possible NULL Dereference When Processing CMS KeyAgreeRecipientInfo.
> CVE-2026-28390 - Possible NULL Dereference When Processing CMS KeyTransportRecipientInfo.
> CVE-2026-31789 - Heap Buffer Overflow in Hexadecimal Conversion.
> 
> Removed patch 0004 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  ...ppc.pl-Removed-.localentry-directive.patch | 69 -------------------
>  package/libopenssl/libopenssl.hash            |  4 +-
>  package/libopenssl/libopenssl.mk              |  2 +-
>  3 files changed, 3 insertions(+), 72 deletions(-)
>  delete mode 100644 package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> 
> diff --git a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch b/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> deleted file mode 100644
> index 7c507a2687..0000000000
> --- a/package/libopenssl/0004-aes-gcm-ppc.pl-Removed-.localentry-directive.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From 5aaa7e5fdc59e88a13d2911cb86d814d4e2669da Mon Sep 17 00:00:00 2001
> -From: Danny Tsen <dtsen@us.ibm.com>
> -Date: Wed, 28 Jan 2026 07:23:13 -0500
> -Subject: [PATCH] aes-gcm-ppc.pl: Removed .localentry directive
> -
> -Otherwise there is mixing of  ELFv1 ABI and ELFv2 ABI directives
> -and PPC64 big endian builds fail.
> -
> -Fixes #29815
> -
> -Signed-off-by: Danny Tsen <dtsen@us.ibm.com>
> -
> -Reviewed-by: Paul Dale <paul.dale@oracle.com>
> -Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -MergeDate: Tue Feb  3 08:39:50 2026
> -(Merged from https://github.com/openssl/openssl/pull/29827)
> -
> -Upstream: https://github.com/openssl/openssl/commit/5aaa7e5fdc59e88a13d2911cb86d814d4e2669da
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - crypto/modes/asm/aes-gcm-ppc.pl | 5 -----
> - 1 file changed, 5 deletions(-)
> -
> -diff --git a/crypto/modes/asm/aes-gcm-ppc.pl b/crypto/modes/asm/aes-gcm-ppc.pl
> -index 68918a9305a2b..fd5dcc22a6117 100644
> ---- a/crypto/modes/asm/aes-gcm-ppc.pl
> -+++ b/crypto/modes/asm/aes-gcm-ppc.pl
> -@@ -409,7 +409,6 @@
> - ################################################################################
> - .align 4
> - aes_gcm_crypt_1x:
> --.localentry	aes_gcm_crypt_1x,0
> - 
> - 	cmpdi	5, 16
> - 	bge	__More_1x
> -@@ -492,7 +491,6 @@
> - ################################################################################
> - .align 4
> - __Process_partial:
> --.localentry	__Process_partial,0
> - 
> - 	# create partial mask
> - 	vspltisb 16, -1
> -@@ -564,7 +562,6 @@
> - .global ppc_aes_gcm_encrypt
> - .align 5
> - ppc_aes_gcm_encrypt:
> --.localentry     ppc_aes_gcm_encrypt,0
> - 
> - 	SAVE_REGS
> - 	LOAD_HASH_TABLE
> -@@ -752,7 +749,6 @@
> - .global ppc_aes_gcm_decrypt
> - .align 5
> - ppc_aes_gcm_decrypt:
> --.localentry	ppc_aes_gcm_decrypt, 0
> - 
> - 	SAVE_REGS
> - 	LOAD_HASH_TABLE
> -@@ -1032,7 +1028,6 @@
> - .size   ppc_aes_gcm_decrypt,.-ppc_aes_gcm_decrypt
> - 
> - aes_gcm_out:
> --.localentry	aes_gcm_out,0
> - 
> - 	mr	3, 11			# return count
> - 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 0e0dbd3926..05777cdac2 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.6.1/openssl-3.6.1.tar.gz.sha256
> -sha256  b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e  openssl-3.6.1.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.6.2/openssl-3.6.2.tar.gz.sha256
> +sha256  aaf51a1fe064384f811daeaeb4ec4dce7340ec8bd893027eee676af31e83a04f  openssl-3.6.2.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index d580947899..bd4b889c88 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.6.1
> +LIBOPENSSL_VERSION = 3.6.2
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
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
