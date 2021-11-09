Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4A7C4332F
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A89261A07
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A89261A07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BEF80C85;
	Tue,  9 Nov 2021 22:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7PxtKo0uSJD; Tue,  9 Nov 2021 22:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE00C81776;
	Tue,  9 Nov 2021 22:18:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 468861BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4307F608A9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rv3z2htE0clv for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:18:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11793600D4
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:18:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c8so2251558ede.13
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2Yxuc5w7aDjuEUkjJteSEkxtk/gapdjgbK9LoOK2bXU=;
 b=Lel6uhfK6WXikgsEgGGWHRCidk8GsZrxjxfgjty7j5EqUSbbmaPL0c0O21Vxg3rllP
 T32K96zVxdQDZ9Ln1/64IhK62erAkIf4iR7Hj/GCZEVXRtIsLpk8feMMha4Q2C9kLRlj
 NJZmz3hr+/tqF/W+uEI/HVpUb+jfQ07eNWq5Zh0y4ozStCQhYYHR4J2PkBGAaB9OjFpc
 qyu7BXTbrSi8OfFMR4g0ap2YCis+aT/odfOZR7xtT+S9qGK/YmMG4t00eTmNfDLUr1p+
 euXI2Xybn1A7WcS8ybPlctt7k6BhYFbW1TKD0Q8K3DL4Bu0iQepdpHfTGcOfb/D8Ex5x
 EWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2Yxuc5w7aDjuEUkjJteSEkxtk/gapdjgbK9LoOK2bXU=;
 b=EGUGjNvekevM4mQfv9kMR5WDjVJf1pu2KC7bEbQZ6W5JFzd6Mr9FVVfNZsmuEthKrC
 E/3G6VSgnFx1ko5ekV2vzMx4x7pOwEwQ3YDmi4mFVd7SIAGUaPZi4gyGMH4RX0v2agaK
 nIRkCZXl9Deks3DqvZvpauiV8UZvi17T8ywj/G1Fgniy5JkKOjM6hKpya1TeiLeFPtnS
 VscFaZ6CbF/wPeiLx8S3onjlg5ex0MSmsuEiVMpjeGl4Os2lkgJqj8Vhhwa7dR/pCBtT
 1H7JIV+uzXhgeogXx1vFv/hcqWW3q5LlfGHUuvP9BDwbY79qx/NZElkAxoppOhetx2LE
 brZw==
X-Gm-Message-State: AOAM531z5udoSAAQS8/KZEoKlet8KCd4sYq2U3do6EhEQrlN7aB4uWci
 tcumwKDz7MsZpJdVDUdCbwA0dQ==
X-Google-Smtp-Source: ABdhPJzeMeZAOdvl6Zh5gjZZ8I+rP/LDn/RsQMZON91Cu4VXNxYtYEEk00AOwzDM5scJmp+/9XOkHQ==
X-Received: by 2002:a17:906:d1d1:: with SMTP id
 bs17mr13897344ejb.198.1636496308172; 
 Tue, 09 Nov 2021 14:18:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g15sm7926870ejt.10.2021.11.09.14.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 14:18:27 -0800 (PST)
Message-ID: <25794b87-836f-85ad-5e3e-87155fef545d@mind.be>
Date: Tue, 9 Nov 2021 23:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211105093135.2239592-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211105093135.2239592-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liburcu: fix build with gcc 4.8
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2021 10:31, Fabrice Fontaine wrote:
> Fix the following lttng-tools build failure raised since bump of liburcu
> to version 0.13.0 in commit 9cedbcf494e647371f92368014d31091848772bb and
> https://github.com/urcu/userspace-rcu/commit/109267f653502cf5ef5ada5d098167b9726daa2d:
> 
> In file included from ../../../src/common/error.h:16:0,
>                   from directory-handle.c:9:
> ../../../src/common/error.h:44:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
>   extern DECLARE_URCU_TLS(struct log_time, error_log_time);
>                           ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/70d645593c9e164d0d044da1b0128cda9c96e830
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ix-don-t-use-C-thread_local-on-MacOs.patch | 41 ++++++++++++++
>   ...-Thread-local-storage-except-on-MSVC.patch | 53 +++++++++++++++++++
>   2 files changed, 94 insertions(+)
>   create mode 100644 package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
>   create mode 100644 package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
> 
> diff --git a/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
> new file mode 100644
> index 0000000000..002df34d70
> --- /dev/null
> +++ b/package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch
> @@ -0,0 +1,41 @@
> +From e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37 Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Thu, 9 Sep 2021 12:11:16 -0400
> +Subject: [PATCH] fix: don't use C++ thread_local on MacOs
> +
> +Recent versions of Apple's clang++ do support 'thread_local' but the
> +implementation generates additional helper symbols. This is a problem
> +when accessing an extern TLS variable in a C++ compile unit that is
> +provided by a C library that doesn't have those extra symbols.
> +
> +Fallback to using '__thread' on MacOs.
> +
> +Change-Id: I87cb5b3c9293f7bf66f7115f453b546dd793a449
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +
> +[Retrieved from:
> +https://github.com/urcu/userspace-rcu/commit/e915ab84fd0c02d37504f3eb1e1f3be93ea6dc37]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/urcu/tls-compat.h | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
> +index 24ef1b9a..25cf375a 100644
> +--- a/include/urcu/tls-compat.h
> ++++ b/include/urcu/tls-compat.h
> +@@ -34,7 +34,12 @@ extern "C" {
> +
> + #ifdef CONFIG_RCU_TLS
> +
> +-#if defined (__cplusplus) && (__cplusplus >= 201103L)
> ++/*
> ++ * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
> ++ * with C and will result in a link error when accessing an extern variable
> ++ * provided by the C library from C++ code.
> ++ */
> ++#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
> + # define URCU_TLS_STORAGE_CLASS	thread_local
> + #elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
> + # define URCU_TLS_STORAGE_CLASS	_Thread_local
> diff --git a/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
> new file mode 100644
> index 0000000000..aa71cf2f20
> --- /dev/null
> +++ b/package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch
> @@ -0,0 +1,53 @@
> +From 2e359284497c361e3208501fc70d49b2c54dc4ef Mon Sep 17 00:00:00 2001
> +From: Michael Jeanson <mjeanson@efficios.com>
> +Date: Tue, 14 Sep 2021 10:41:08 -0400
> +Subject: [PATCH] Always use '__thread' for Thread local storage except on MSVC
> +
> +Use the GCC extension '__thread' [1] for Thread local storage on all C
> +and C++ compilers except MSVC.
> +
> +While C11 and C++11 respectively offer '_Thread_local' and
> +'thread_local' as potentialy faster implementations, they offer no
> +guarantees of compatibility when used in a library interface which might
> +be used by both C and C++ client code.
> +
> +[1] https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html
> +
> +Change-Id: If4fe8bcdbda24b21dedf382112bd5c5f836c00c8
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> +
> +[Retrieved from:
> +https://github.com/urcu/userspace-rcu/commit/2e359284497c361e3208501fc70d49b2c54dc4ef]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/urcu/tls-compat.h | 15 +++++++--------
> + 1 file changed, 7 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/urcu/tls-compat.h b/include/urcu/tls-compat.h
> +index 25cf375a..a2c94ded 100644
> +--- a/include/urcu/tls-compat.h
> ++++ b/include/urcu/tls-compat.h
> +@@ -35,15 +35,14 @@ extern "C" {
> + #ifdef CONFIG_RCU_TLS
> +
> + /*
> +- * Don't use C++ 'thread_local' on MacOs, the implementation is incompatible
> +- * with C and will result in a link error when accessing an extern variable
> +- * provided by the C library from C++ code.
> ++ * Default to '__thread' on all C and C++ compilers except MSVC. While C11 has
> ++ * '_Thread_local' and C++11 has 'thread_local', only '__thread' seems to have
> ++ * a compatible implementation when linking public extern symbols across
> ++ * language boundaries.
> ++ *
> ++ * For more details, see 'https://gcc.gnu.org/onlinedocs/gcc/Thread-Local.html'.
> +  */
> +-#if defined (__cplusplus) && (__cplusplus >= 201103L) && !defined(__APPLE__)
> +-# define URCU_TLS_STORAGE_CLASS	thread_local
> +-#elif defined (__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L)
> +-# define URCU_TLS_STORAGE_CLASS	_Thread_local
> +-#elif defined (_MSC_VER)
> ++#if defined(_MSC_VER)
> + # define URCU_TLS_STORAGE_CLASS	__declspec(thread)
> + #else
> + # define URCU_TLS_STORAGE_CLASS	__thread
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
