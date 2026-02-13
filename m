Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17327EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5795613C0;
	Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kym-AETVq4FO; Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDFF461467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011455;
	bh=Xq4Lk6grW/FmNq9NX/6Z4LvNm8ouyGR7bCbs3LdAqaQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UbDi0B+hll5gU3a2BuKxgJVtFJmSpSEwcKY5AcglJB/mhGmigfnJCwcclsXRs7u9M
	 i8vHAMWsWug66wVCMLQQjKx6/Pqluel6LPC9fm1l55UfDw5c53IpysVF0ezgpMEWln
	 NbIYWn4E4cDnZM1mbN0ERGbq5EpdV6aFmA6IErBGw+z0U6lxX0qElBknTE/fXnDfK2
	 3wcRwbzAK3BoXtUBLd+5C6vWtCyBQIpsTxlzikXoxBiaSPrONXtVtst+60H9L1tnyk
	 E1ospNjGTEmTNrExrxUkXe3Ul3k8CtJLRjGFOnWBtpdInGUPnVMqctZP1z9cJA8Pvw
	 Ej/ykYx5M+SeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDFF461467;
	Fri, 13 Feb 2026 19:37:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ABD1EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A59161456
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcJgz1pv1jSf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3421A61565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3421A61565
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3421A61565
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4376de3f128so876778f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011411; x=1771616211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VpmC3rykm8jdseszYQEgPtuVwCzyyBAbygVMWVff2JQ=;
 b=CP4LLMX32BZWWyPXvWKBtaZhz5prcj9klOyP/2fRx1q5wA6vX+3Wya7Ae6PeLDpQMP
 SicIZZNfzj0/iqTx3ESZ/thdJehiY+/tiAxM+pQ5BsHtyMUo/MgbNrjaagllmIAtYfR7
 X8VTUD6U+VUkfzUpcAN5h3nxSkk+1GEp8bnCMPStHHJCpUE5zCR9TzE5r/B5JqUPA1mn
 h0UnEIr/PZ39WI3RisMerkyyTNSkLriCjA9swCxpqJ16ZbKq5zmh0Fai4bN/Fkh0GnEB
 oFsxIAUl6FcG3eEmUppCdk9zDCvYOxwniphuovJy73MS0Iw0UqjEfZGdpTR+YlD51YmM
 xfDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMY6o/C71Ur6v+MKvI9D1D960bmCZtkjJja6FBuNeluL9svxqpE7rPZSsvVGNHSdhdHS8Oq2bqKM8=@buildroot.org
X-Gm-Message-State: AOJu0YzFPjuH3Mq0gcMxsBEgKWzVzM+UOx3JIgLXsr6HV3OKIF0ctISd
 qB0lug129JbMECMo0a+g+lrrtEP5nhAGailrd2I5hX83yyW1ePPzIOtU4mvOvywzWmo=
X-Gm-Gg: AZuq6aKVAUQCpWBF0RNeHn9sp1BQ58jYeAsz7PRBsw6NnTw+VubbBgen7CplO0cSO9X
 uuBXsbwOLeawyqj2CowaHRjwaJAozJikB7M8Wx4ocA6FU7b0kZkIPC1ARLTWzj8z+rCNbALInKB
 vmMTu7D8+mEup4pSZtceYAk4zHGYWVEpUKsYB8zr16wL5zJc6pj5ghc+1/G2Ijt4rsjdV2vvziR
 5Bn9KQ5jswukPr7+y6VBW9UoC9AfxlYbRpoDbxhPcO1xhRhb+/HY+WDuWMNXqNuzYjY2UkFDvvp
 vX0rU55ew/fHe2aV/pQbj8TRaa+q71nPweJ2i5MqM+rtAWRWpRcSleEYAkLHufaO+2FaYdUt7Av
 Wpz9XJ2F9V3k2fZJ95KyYZWFiDov1haAlrk0Eo91Z0tVA/pvRj1YPMoBZtVafznVJJib71sA8Hx
 0TYFgwKlqaD7qPSIA=
X-Received: by 2002:a05:6000:4310:b0:437:719d:a753 with SMTP id
 ffacd0b85a97d-4379db3414bmr1226640f8f.11.1771011410985; 
 Fri, 13 Feb 2026 11:36:50 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a74918sm7645571f8f.17.2026.02.13.11.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:50 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:50 +0100
Message-ID: <20260213193650.38342-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105194056.2156773-1-bernd@kuhls.net>
References: <20260105194056.2156773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011411; x=1771616211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpmC3rykm8jdseszYQEgPtuVwCzyyBAbygVMWVff2JQ=;
 b=hNbWsEzup0rqBQngSDJm8MXhSObSFXBbf1tiNNfN6zT7FWkBLsntTl54E5Na4hV+lf
 up6qp6SXSGJcHbr26mfwwoObJew8VUDHRYVXbw/mGKDciqTeECOqOARpNC4yKCnxKDki
 Qkfd8XJ/9gZqLZJwTuMi/LDWTfxz8vTrtSOAiRaj04UK2fGHTiMcQcw15p8gjAVoLicz
 tVotcJNIDtOQcdGFoUVSUJdY3QQLt4cOAEcII0ifL/xc3vdz2WBIzjRN1BfOqug11tow
 ZJl97SBrSQzj+Q+PlhAvPCVZVELWkULbfVf4dXwfFqtgCeMQ1bpzs592OGtILphweP4y
 kFNA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hNbWsEzu
Subject: Re: [Buildroot] [PATCH 1/3] package/dc3dd: fix build with gcc-15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/257/2575202e9a5164a4068a943fb36445cd63e61f0c/
> 
> The build error does not occur with gcc-14.x, tested using this
> defconfig:
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_DC3DD=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/dc3dd/0005-gcc15.patch | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/dc3dd/0005-gcc15.patch
> 
> diff --git a/package/dc3dd/0005-gcc15.patch b/package/dc3dd/0005-gcc15.patch
> new file mode 100644
> index 0000000000..a2133cec4a
> --- /dev/null
> +++ b/package/dc3dd/0005-gcc15.patch
> @@ -0,0 +1,39 @@
> +Description: Fix FTBFS with GCC-15
> +Origin: backport, https://build.opensuse.org/projects/security:forensics/packages/dc3dd/files/dc3dd-gcc15.patch
> +Bug: https://sourceforge.net/p/dc3dd/bugs/24/
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1096508
> +Forwarded: not-needed
> +Reviewed-by: Sven Geuer <sge@debian.org>
> +Last-Update: 2025-09-25
> +
> +Upstream: https://sourceforge.net/p/dc3dd/bugs/24/
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> +This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
> +Index: dc3dd-7.3.1/lib/posixtm.c
> +===================================================================
> +--- dc3dd-7.3.1.orig/lib/posixtm.c
> ++++ dc3dd-7.3.1/lib/posixtm.c
> +@@ -41,7 +41,7 @@
> +    of `digit' even when the host does not conform to POSIX.  */
> + #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
> + 
> +-time_t mktime ();
> ++time_t mktime (struct tm *tm);
> + 
> + /*
> +   POSIX requires:
> +Index: dc3dd-7.3.1/m4/jm-macros.m4
> +===================================================================
> +--- dc3dd-7.3.1.orig/m4/jm-macros.m4
> ++++ dc3dd-7.3.1/m4/jm-macros.m4
> +@@ -38,7 +38,7 @@ AC_DEFUN([coreutils_MACROS],
> +   # By default, argmatch should fail calling usage (1).
> +   AC_DEFINE(ARGMATCH_DIE, [usage (1)],
> + 	    [Define to the function xargmatch calls on failures.])
> +-  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage ()],
> ++  AC_DEFINE(ARGMATCH_DIE_DECL, [void usage (int)],
> + 	    [Define to the declaration of the xargmatch failure function.])
> + 
> +   # used by ls
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
