Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6946CA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF4198412B;
	Thu, 21 Aug 2025 19:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tvg8F_cJP-bC; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 836798476D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 836798476D;
	Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 386721C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F3EE40D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXf_d4_TB-M7 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F05BC40CF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F05BC40CF0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F05BC40CF0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b00797dso10143905e9.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804051; x=1756408851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKieo16qCY5Q8cPVg0r1TKx+0gLKgbVFnpHCTexvnAE=;
 b=L2ijWuL0ZvEUzarloowtxJzIc1QrLgl8xYa3DEvY4IsB6OqPq1KCgBa/HHfIAOwrAS
 oprixtzGFrEPzBMdvjQOOS1ftbamQ+k+kyhDLCtez4LaxQhve1mmK0kOi4CLGfFrezBD
 /kd8KKC1PW7VVwYT+FRPc91inyYuh96vBsJvuncAOSCIY9mA5HhnEj289ob/7ZOd0RwC
 UBv/iw1wOA2Rmq3hb7T1lmPMYUK89MI5yLWJyynPisWJXpckteau43ACtBo3Ql689NtJ
 oGd1fxyajs/7aVx9jJG/5ZmLbbEvJNa+3FanIFmMvEUF4Hl8hywO1ZBQGOv5OFMzitju
 iNnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo26t7SXXq64PSGocTYJmzIGoIqrg7Gg1KVdU2+fzlJK609LTaxa6a+OR1gut2MfvCBvkGBPLMYEM=@buildroot.org
X-Gm-Message-State: AOJu0YzrmrjO33G5uf2W5UXWh9EnYmxxONldp10DLELdhP3SYcJKT4KF
 1AiysNY2PVrqT9NPOM8KlQnPe/h1wfWZfD/+TVSZtHx5QtPM1EiK1FvfghxZI0056W4=
X-Gm-Gg: ASbGnctCNKUostpp4j1LjxGO8X6U2vvGHCz2CR7a8ZUWqzGdmSDxqIcK4M21uY/J6dl
 COSl8luzDkNKAJfJTawCQXGjhPo8pVrOUGM7hwXaH8y1PZ3XGtViXU6Fmp0KhUxiJEQa6gJugqB
 maftLdp3MQOveBciv8/0fMr6HnDocGoZ0lNRIU3D58nP2Sy+TDNfv26Z4brE8JZ+Z35+WNPoEC5
 ZDmPX/Y1TeE8QU7sDctoZGJ42+CjbwlEQ6+JOvQB1Ep8vt7w2aq8uDIAjAZOP44UAv3wCgl3HmW
 KEjqQtfYlKFAs650WtMQ4QdUUnAkz5cbgoJpYKG8SCJouo04qPde/qW0m4Is1KPWelgSQbVpUOd
 MxYorRQC7F2e90A==
X-Google-Smtp-Source: AGHT+IHjJ1m1qx9QU56Xe+4wrpT6YR+notxk3+4Vp8JhP6hq3LMK+rXRsLPJBjmfbp47uDpHZNOrRg==
X-Received: by 2002:a05:600c:1f83:b0:456:1c4a:82b2 with SMTP id
 5b1f17b1804b1-45b517ad803mr1826685e9.10.1755804050707; 
 Thu, 21 Aug 2025 12:20:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dde02csm8016045e9.7.2025.08.21.12.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:20:50 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:50 +0200
Message-ID: <20250821192050.23722-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811120851.543585-2-titouan.christophe@mind.be>
References: <20250811120851.543585-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804051; x=1756408851; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKieo16qCY5Q8cPVg0r1TKx+0gLKgbVFnpHCTexvnAE=;
 b=PKW0VyXbFkD8eVfsRF3DUo9uPoPRM7QflMQvLmKplxtEbQ7pL0n94V1Ld9jNgaE6sR
 MgJxltgtU6R/0XpFhrmFPbbXY8KtKMta3k0tb6pDCUYqpNFvYuqfZJEtq5s0p733xogE
 BIe54geuNttI3ms6spM4BnaeHlAA4xsnsxauE/oR08+XY8bf+HqYdEicTmrsCnADuIB8
 ZV/Tp41mdHW/l6XNM+H+fHejuZN5JPIP0QH2NFRWrJ8hbb1dCCSiAE0r5/sjcnbtvGiq
 ylhyQzqUxUwU0RNbEcxPWzg0B1o8r1tgWIMevuvsBHBeLklFjLvo4RZ4wu0GUNGQBCKZ
 WrtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PKW0VyXb
Subject: Re: [Buildroot] [PATCH 2/2] package/ofono: security bump to v2.18
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
> This fixes the following vulnerabilities:
> 
> - CVE-2023-2794:
>     A flaw was found in ofono, an Open Source Telephony on Linux. A stack
>     overflow bug is triggered within the decode_deliver() function during
>     the SMS decoding. It is assumed that the attack scenario is accessible
>     from a compromised modem, a malicious base station, or just SMS. There
>     is a bound check for this memcpy length in decode_submit(), but it was
>     forgotten in decode_deliver().
>     https://www.cve.org/CVERecord?id=CVE-2023-2794
> 
> - CVE-2024-7537:
>     oFono QMI SMS Handling Out-Of-Bounds Read Information Disclosure
>     Vulnerability. This vulnerability allows local attackers to disclose
>     sensitive information on affected installations of oFono.
>     Authentication is not required to exploit this vulnerability.  The
>     specific flaw exists within the processing of SMS message lists. The
>     issue results from the lack of proper validation of user-supplied
>     data, which can result in a read past the end of an allocated buffer.
>     An attacker can leverage this in conjunction with other
>     vulnerabilities to execute arbitrary code in the context of root. Was
>     ZDI-CAN-23157.
>     https://www.cve.org/CVERecord?id=CVE-2024-7537
> 
> - CVE-2024-7539:
>     oFono CUSD Stack-based Buffer Overflow Code Execution Vulnerability.
>     This vulnerability allows local attackers to execute arbitrary code on
>     affected installations of oFono. An attacker must first obtain the
>     ability to execute code on the target modem in order to exploit this
>     vulnerability.  The specific flaw exists within the parsing of
>     responses from AT+CUSD commands. The issue results from the lack of
>     proper validation of the length of user-supplied data prior to copying
>     it to a stack-based buffer. An attacker can leverage this
>     vulnerability to execute code in the context of root. Was ZDI-
>     CAN-23195.
>     https://www.cve.org/CVERecord?id=CVE-2024-7539
> 
> - CVE-2024-7540:
>     oFono AT CMGL Command Uninitialized Variable Information Disclosure
>     Vulnerability. This vulnerability allows local attackers to disclose
>     sensitive information on affected installations of oFono. An attacker
>     must first obtain the ability to execute code on the target modem in
>     order to exploit this vulnerability.  The specific flaw exists within
>     the parsing of responses from AT+CMGL commands. The issue results from
>     the lack of proper initialization of memory prior to accessing it. An
>     attacker can leverage this in conjunction with other vulnerabilities
>     to execute arbitrary code in the context of root. Was ZDI-CAN-23307.
>     https://www.cve.org/CVERecord?id=CVE-2024-7540
> 
> - CVE-2024-7541:
>     oFono AT CMT Command Uninitialized Variable Information Disclosure
>     Vulnerability. This vulnerability allows local attackers to disclose
>     sensitive information on affected installations of oFono. An attacker
>     must first obtain the ability to execute code on the target modem in
>     order to exploit this vulnerability.  The specific flaw exists within
>     the parsing of responses from AT+CMT commands. The issue results from
>     the lack of proper initialization of memory prior to accessing it. An
>     attacker can leverage this in conjunction with other vulnerabilities
>     to execute arbitrary code in the context of root. Was ZDI-CAN-23308.
>     https://www.cve.org/CVERecord?id=CVE-2024-7541
> 
> - CVE-2024-7542:
>     oFono AT CMGR Command Uninitialized Variable Information Disclosure
>     Vulnerability. This vulnerability allows local attackers to disclose
>     sensitive information on affected installations of oFono. An attacker
>     must first obtain the ability to execute code on the target modem in
>     order to exploit this vulnerability.  The specific flaw exists within
>     the parsing of responses from AT+CMGR commands. The issue results from
>     the lack of proper initialization of memory prior to accessing it. An
>     attacker can leverage this in conjunction with other vulnerabilities
>     to execute arbitrary code in the context of root. Was ZDI-CAN-23309.
>     https://www.cve.org/CVERecord?id=CVE-2024-7542
> 
> Also drop local patch that is no longer applicable, since upstream now
> relies on HAS_BACKTRACE as well
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/ofono/0001-uclibc-backtrace.patch | 49 -----------------------
>  package/ofono/ofono.hash                  |  2 +-
>  package/ofono/ofono.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 51 deletions(-)
>  delete mode 100644 package/ofono/0001-uclibc-backtrace.patch
> 
> diff --git a/package/ofono/0001-uclibc-backtrace.patch b/package/ofono/0001-uclibc-backtrace.patch
> deleted file mode 100644
> index 3fa2414978..0000000000
> --- a/package/ofono/0001-uclibc-backtrace.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
> -
> -Backtrace support is only used for logging on signal errors, which
> -isn't really critical, so simply remove backtrace info if not
> -available in uClibc.
> -
> -NOTE: based on patch from Peter Korsgaard <jacmet@sunsite.dk>
> -
> -Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ----
> ---- ofono-1.7.orig/src/log.c
> -+++ ofono-1.7/src/log.c
> -@@ -30,7 +30,8 @@
> - #include <stdlib.h>
> - #include <string.h>
> - #include <syslog.h>
> --#ifdef __GLIBC__
> -+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
> -+#define HAVE_BACKTRACE
> - #include <execinfo.h>
> - #endif
> - #include <dlfcn.h>
> -@@ -115,7 +116,7 @@
> -	va_end(ap);
> - }
> - 
> --#ifdef __GLIBC__
> -+#ifdef HAVE_BACKTRACE
> - static void print_backtrace(unsigned int offset)
> - {
> - 	void *frames[99];
> -@@ -312,7 +313,7 @@
> -	if (detach == FALSE)
> -		option |= LOG_PERROR;
> - 
> --#ifdef __GLIBC__
> -+#ifdef HAVE_BACKTRACE
> -	signal_setup(signal_handler);
> - #endif
> -
> -@@ -329,7 +330,7 @@
> -
> -	closelog();
> -
> --#ifdef __GLIBC__
> -+#ifdef HAVE_BACKTRACE
> -	signal_setup(SIG_DFL);
> - #endif
> - 
> diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
> index 9e2fd413f9..31fae82eb9 100644
> --- a/package/ofono/ofono.hash
> +++ b/package/ofono/ofono.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
> -sha256  5e13121c0f885a81ad882db065549ea13477abbcc219f150b38a8d2ac92521de  ofono-2.2.tar.xz
> +sha256  f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00  ofono-2.18.tar.xz
>  # Locally computed
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
> index ba0846e823..ee6020ab2e 100644
> --- a/package/ofono/ofono.mk
> +++ b/package/ofono/ofono.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OFONO_VERSION = 2.2
> +OFONO_VERSION = 2.18
>  OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
>  OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
>  OFONO_LICENSE = GPL-2.0
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
