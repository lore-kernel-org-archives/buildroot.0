Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEECA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B62608E3;
	Sat, 10 Oct 2026 09:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vmV6T0ubHwr; Sat, 10 Oct 2026 09:24:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C324608D9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624245;
	b=ClCOPyjNFW4KnuhN47u5M5rRX0Utv2uROiBzisnTb1Xi6pwteh6MPZ37NrOzTDsZeKzp
	 asazG9tEuPFyTaZ+mOQfhmoYRo6/dT085yk4EO/wK9H1RKAJy9x//mN989hB8AmrnIosg
	 Td9GeCLNrZf5KjGvPfNpFh3h7KfU3/Dv7Lx17uqEkAmpLWc3OWO81gs92ormSOPoj0Sp6
	 5NzJea2clbBoddeXrPLom4RWyoesv5SP8NDBjGr/XjNDROTsB4+JIq0RQ1kiONJm8TRD7
	 WhK5mJqpY5Nn1/0nIHqv+dcJ8NMw64lMey5lL5YoPFoooebP6DgC/HnMQ3ICGExYq8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zUG9d8JH17f+D7AKwzWvHRfA5SMLcLQHgEIZ/c+PAfw=;
	b=tIYaHtl407yEzSNiJq3N1XnY4HWlfUehrMi6a9SWb1dauXRXnfU9VbbvcCVddO47HMuL
	 jX/79ueq1rZHOhRZB3xgcoIWEd3jg0muJA2W+2WAyCdxTr5GIBd0HJdzO+A3NunOM14bD
	 xoSxJRfcI7BuFeTPHUdXheYBcj7oNYu2fQobJ4QLE/k0G5CXunkjh9OMrAurHr4n7uJFT
	 zXUlHGpA1UhB0aeAJjBxx6CxTcUC+AwoL4AwYSpYYSyv93kksIaEJxppqOg1ycWQ6eQpb
	 asiaupxG2XAeI8fCFJ3rAyMBJvAvKiJZvkcmaUyO/6P93TetQdo1O0ZKZ0Xsmx20YJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624245;
	bh=zUG9d8JH17f+D7AKwzWvHRfA5SMLcLQHgEIZ/c+PAfw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sVjsN2CxFwVXTIep+mfJJZyPHMtarS49Cx8YhbOz79RxKKYMvaVgm8SnhnQTxpXEf
	 3UjAcrG5ty+2+QrV0HxcxkezGcKCJCyavwjTLuNozNHk32DHa9Id4HFT0RK2S6ovJb
	 WBTTaR/wwWHR/sXhVH16ZPgc6hWQn6WowdT/7SKcQ99CIG5IRQp6GZqsIEZAqKuOlT
	 7YXDD0icNBlnEp41sJkuiZWfxgkG1ahyvmMyG4tjL91qsQjD2IUduPl7mbADNYH10f
	 PklXhge/v2D/BqH6vlJvUSUNpXD1PapMfa1dtAtUlEyqqFRMqexoFU1OFdx+43BUui
	 CV/QYTK1rhNdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C324608D9;
	Sat, 10 Oct 2026 09:24:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54A1F75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39D93608D9
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6RqJgtfiRbz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C7264608C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624241;
 b=f7AK3hCBehAYdxTtllR/sn3m0H2QGvWhqompdmB/CS+q4Et0f1tN1WTqGSUAKrhfi99+
 sG9VU8TAoLWsy2I7fxyW7yPbW0esEODqiCvsXtIcH+RZq86VmDijiyepjJeY2EKkfzXNQ
 4b4F75lzU5uzdJLNVtnOZvJWnHdXg8fjQIUFBvfj/JKpRm7oik0nk5La7s1+N42F84FUk
 pA6aziUIOYZMxREscZibeByDbQ334/rKL5meXuUqna+fTeJKUNUH6qFMoCVxlkHYKRrof
 r10HqfYS/hzMbNTaaFiJYicN/rQ6jbrCBK91bNvimAo5pXTf/jK9grYKbAUeg5pLSIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624241;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=oOKCvG4YDjcMtFlrHSHoqh3b0iCzSDxPay4shfjvjlY=;
 b=dsDBzqTCmsNnDRBvFYmdebyZ+TiULjtAzVsVZzjKBXj9tA/NIH5Zv9FY6iBpEqlSDNyx
 X7gbvCttiUqcGFsscux+GxL92NPLaUd9yJM0aDKVdM12AjEUWDqknh2rNO69R60ewryua
 U+DvX8iHWwatkpDNCjGdP2IYPzmrJaj8xxJ8eR17UlgoAwvRHEZ95CSyn3NQs9hulTFCQ
 NmjPMMIK2o+3BrPq6zlaFZUFGqxlGsqXpL2bPbTPOguvWbpCEK/mPmi7e4eNQc3DpTovH
 54wVDaUuS0Fvkf3f1SP6BObEKGgVxv7gu9oBSfpQPbkuqMk8K6xjvtmn1cLSOvoOt7g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Anuw0KLF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7264608C5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:00 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so3134335e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624239; x=1792229039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oOKCvG4YDjcMtFlrHSHoqh3b0iCzSDxPay4shfjvjlY=;
 b=Od/mt1VTcWYYhBN+hBNWawB4YOtVt2uGzWvX3w05YkqWQYdMyfq5Lq+kJTGUTokgJO
 6C9nV8dmovs5s0G3KdPzo/F3kefCLtdkbbFJ6MSLMqugIW7qlFq5UhM1qsGv3XUKH8SC
 Qem5/zkvLwmXMOrTRBR9MLKeH0JSAzjXCmbP3BPS4swlPogSjxqetlr2l6W03h0zpjLF
 v42QCqLmpExcnipuuxQRzXjaPvYCLuRhTiZ0oN527mYlxY+YHrFt1H7/CAq60rJ5u/bd
 1EIAy78YI6CxuIYGttcXVRwctbyjDyS5snLePxzsQtzAHvhtv3KpbK4772hVSSYc7oti
 DPsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhi/auVcwAH2Hh2KIB1DgTfeWnhWc+w2YRmMAL7XHV4G2HrmKsE3AylU2KzEea3jcFvHi4tfvVSgI=@buildroot.org
X-Gm-Message-State: AFq9FYKmb2HWUecPfQm4E7rgHZNbQUOVB7v8zeCx6WDda+qTv3KnKXY5
 0pPgInfrjTM1O5LTCa94+wKZ7LtDArpas8Oo1bjZEzk5ZiEUKp0uiZHEBFQt3n68f7wggqpCHEH
 i5utykA0=
X-Gm-Gg: AYBFou3pepY6Sr2I1ijlBcj3T8Bbej4ZGmZgv+VtWnwBwgdD0ozoAN3XjLhryLNNubT
 mlMT/PY/NUhQ/MqN0YhI5HE3LYWZbHc1m8cmd8Y58Ishig0+yLq8Xzd8e9R9CpOdWD8li7/vwHI
 6jpBbx71J53SDiXanYK/QqucTxHN5JZsznIcVO0J1OF7tcux8e3EF84rlfHtjvCnwj/R9s6/ZOn
 c9fEUFdqiMlulNMzqEEWeqFdWgwGGv3rLWXf1K2xLW4VBgX21vldp0sh6TRbupP/zZ8hxO78tV2
 9pegrWduGpA4bYnlC+CxxUuJP3H1IK7+kpdUd77bMQPN/PiWnQmjsq6CAjCO457Yr5Xqk3IrV6B
 n1v4t7d0YRkVaxe/dQObPvZbSMArKL2htdK3BnCxCTl0zXZr06KSoKUG8oT1FMELB9IWBsDxS7V
 AhFaIR1gqmTkppDD1222VHbPWevEDJnuEXbUr5AU3/fE8ujy1tD/e+RLv1EJoJG/hkjTEwy+ZY9
 fXLZgHHq7JJvukJ22CSaumGDZXnJsP0XCSlqoCmh6dz0BpGegvZ2AycCQ==
X-Received: by 2002:a05:600c:4708:b0:4a0:258a:b25c with SMTP id
 5b1f17b1804b1-4a18e4da3c8mr84449485e9.29.1791624238602; 
 Sat, 10 Oct 2026 02:23:58 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e481993sm96857995e9.2.2026.10.10.02.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:58 -0700 (PDT)
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:57 +0200
Message-ID: <20261010092357.139803-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001141804.833216-1-yegorslists@gmail.com>
References: <20261001141804.833216-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/erlang: fix build with
 BR2_TIME_BITS_64
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
> erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
> including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
> -D_TIME_BITS=64, which glibc only accepts together with
> _FILE_OFFSET_BITS=64, so the build fails with:
> 
>   error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> 
> Backport the upstream commit that removes this ancient workaround.
> 
> Fixes:
> https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  .../erlang/0002-otp-Fix-build-on-Yocto.patch  | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/erlang/0002-otp-Fix-build-on-Yocto.patch
> 
> diff --git a/package/erlang/0002-otp-Fix-build-on-Yocto.patch b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
> new file mode 100644
> index 0000000000..9f4de3508e
> --- /dev/null
> +++ b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
> @@ -0,0 +1,80 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?John=20H=C3=B6gberg?= <john@erlang.org>
> +Date: Wed, 13 Dec 2023 16:34:04 +0100
> +Subject: [PATCH] otp: Fix build on Yocto
> +
> +A workaround to avoid breaking "micro level process accounting on
> +/proc/self" broke the build on Yocto. As this is a really ancient
> +workaround (pre-2009) and the comment is unclear about what
> +actually breaks, we'll try removing it to see if this is still a
> +problem.
> +
> +Upstream: https://github.com/erlang/otp/commit/c38fc7c62e818273870340f3faf83cc3905e1cf1
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + erts/configure                    |  9 ---------
> + erts/emulator/sys/unix/sys_time.c | 10 ----------
> + make/autoconf/otp.m4              |  9 ---------
> + 3 files changed, 28 deletions(-)
> +
> +diff --git a/erts/configure b/erts/configure
> +index 1d573b4..0b046dd 100755
> +--- a/erts/configure
> ++++ b/erts/configure
> +@@ -24417,15 +24417,6 @@ else $as_nop
> + /* end confdefs.h.  */
> + 
> + /* gethrvtime procfs ioctl test */
> +-/* These need to be undef:ed to not break activation of
> +- * micro level process accounting on /proc/self
> +- */
> +-#ifdef _LARGEFILE_SOURCE
> +-#  undef _LARGEFILE_SOURCE
> +-#endif
> +-#ifdef _FILE_OFFSET_BITS
> +-#  undef _FILE_OFFSET_BITS
> +-#endif
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <string.h>
> +diff --git a/erts/emulator/sys/unix/sys_time.c b/erts/emulator/sys/unix/sys_time.c
> +index eb2c47b..f60e345 100644
> +--- a/erts/emulator/sys/unix/sys_time.c
> ++++ b/erts/emulator/sys/unix/sys_time.c
> +@@ -22,16 +22,6 @@
> + #  include "config.h"
> + #endif
> + 
> +-/* These need to be undef:ed to not break activation of
> +- * micro level process accounting on /proc/self 
> +- */
> +-#ifdef _LARGEFILE_SOURCE
> +-#  undef _LARGEFILE_SOURCE
> +-#endif
> +-#ifdef _FILE_OFFSET_BITS
> +-#  undef _FILE_OFFSET_BITS
> +-#endif
> +-
> + #include <stdlib.h>
> + #include "sys.h"
> + #include "global.h"
> +diff --git a/make/autoconf/otp.m4 b/make/autoconf/otp.m4
> +index f543101..984ee1a 100644
> +--- a/make/autoconf/otp.m4
> ++++ b/make/autoconf/otp.m4
> +@@ -2705,15 +2705,6 @@ dnl
> + AC_MSG_CHECKING([if gethrvtime works and how to use it])
> + AC_RUN_IFELSE([AC_LANG_SOURCE([[
> + /* gethrvtime procfs ioctl test */
> +-/* These need to be undef:ed to not break activation of
> +- * micro level process accounting on /proc/self 
> +- */
> +-#ifdef _LARGEFILE_SOURCE
> +-#  undef _LARGEFILE_SOURCE
> +-#endif
> +-#ifdef _FILE_OFFSET_BITS
> +-#  undef _FILE_OFFSET_BITS
> +-#endif
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <string.h>
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
