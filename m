Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F33C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 12:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77BB183DE8;
	Mon, 11 Aug 2025 12:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybVVuojcqzUu; Mon, 11 Aug 2025 12:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDB1883D54
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB1883D54;
	Mon, 11 Aug 2025 12:09:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 333BE154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 300FD82FA2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa_eLrhbruN1 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 12:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF32581B71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF32581B71
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF32581B71
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:08:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af922ab4849so633336866b.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 05:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754914137; x=1755518937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWetMewWJNqTH32zbJygESw2vUH04mlYGQCQ2B++e0c=;
 b=j3UaO29IrLUZMhfPPOwYCCgvBi/fDRkWXsO91ZHvugRJgMYRrSDSAnJX6h8THN1dq3
 cJQuk6r5XMx+MP16g75uqJPOrOkEsQi52IjoIUG8gsDjJspMFXTfrVKOfL0SA0Nuy8PJ
 kX1qUUqXYi1iH3rz5vSASV/c3PcFaZiXLSNOiXrQ7KX+Ep+pjEGy9D87ThWMo41S31ZC
 1hfD3ykV9I+I23QPE81QQqu2Pb+6WGeheYNz5eFU3EtjBRytDN7w4qwFQlxXpDrHYqbN
 3lWNzPvFByx5LzABv+NC+ByxNGZDN5EomxXBKgnrwDmy8mNxjvP6AZiKolL/T+ZVngJd
 kwCA==
X-Gm-Message-State: AOJu0YxMiEc13sOdJWUebawEgtSx1+6k2qj2Gm2rL2iZ+9ln4D1l3fa6
 57emUo1zW5BZBSt2YTwMpwYVnUQwOFRJx8P1ZEJF9ncX631XUx0jbhYIn4CFIbs1kPS+AHrZNog
 8Rz1K6uQ=
X-Gm-Gg: ASbGncsqr4IUs5QzP2L547n7C7/dDOG1KtbQwZdnUbI+apWXVB/EHusr5IZvNKJqtTW
 3nL8+bnJsf0hdciCyJa/dBeASyFbIxTHRPK+K93328WV5QVJg3MJ9J6bPsjzwXsEVDj9QFfeoHH
 6zzXUv+9IhqOmQ3y151jHGjKsj94jd86PsZZPxaCJek6BuKJ9yT+ex+HFiQGtE63nG+yj1BdNbh
 fW0sXe/vBC71d17npJCSsXW0L32/Q2X5DtKy1IXm/X4BxKm2RvnrqQ/7/AWIRAa4JXk/qikXv2i
 rC4A4pTjtE+UgMDhRpUrSI9hizyuTlTQ4GL56nTfFd/g3rg38uSIjB1+mj38hfYea8KfTDrprFt
 X3Cs5AgrPBQWhei5UwEXGHFA0ai/BkPazzdYbqKstR6DwXGqLCQ1vZy8qdeCgrchC72GbP4nphj
 jnOHqtdX6f7nzCAg==
X-Google-Smtp-Source: AGHT+IGY1PIY6bt9ntrmwagWNmVW9WYPVLkEKulT8fJhyNWK0lHyETgyLcDh1rm9oeVs1cnSjQNjPQ==
X-Received: by 2002:a17:907:3d8d:b0:af9:5ca0:e4fe with SMTP id
 a640c23a62f3a-af9c6608b5amr1130376566b.56.1754914137451; 
 Mon, 11 Aug 2025 05:08:57 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a218ab4sm2015207666b.92.2025.08.11.05.08.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 05:08:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 14:08:51 +0200
Message-ID: <20250811120851.543585-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811120851.543585-1-titouan.christophe@mind.be>
References: <20250811120851.543585-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754914137; x=1755518937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pWetMewWJNqTH32zbJygESw2vUH04mlYGQCQ2B++e0c=;
 b=dG7oq8u8RIEKIvGhqonZRHK418Bts2K5vIkfKlGCrLZGyxVTkLX5hzsv5rii12aRep
 xPm/7AWb8nMLQyUo/zR1+qq/HUE9FKNzQ9L0pL8evU+gjmeUnhPzUYZ92eQKKO6Bcfas
 JjNYe4rbXZQLSw4sjb8VTf0JV4V9JcTQF6lvEYGu9xdzePjakzUEkocoRmt+rwdJvvwi
 3nX38S6M5+CWvIwCti5ihvEvuA30UMntQf5ni1U3ncZH3LD4w9MPww5ugVs5qQ/kSvAl
 hI2ae8v/ZIeyPZxNkr/lxuiH409DcHZpXM+TWoNv7qDbnVrmgokTUeqPWuohfDAIC395
 2FXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dG7oq8u8
Subject: [Buildroot] [PATCH 2/2] package/ofono: security bump to v2.18
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:

- CVE-2023-2794:
    A flaw was found in ofono, an Open Source Telephony on Linux. A stack
    overflow bug is triggered within the decode_deliver() function during
    the SMS decoding. It is assumed that the attack scenario is accessible
    from a compromised modem, a malicious base station, or just SMS. There
    is a bound check for this memcpy length in decode_submit(), but it was
    forgotten in decode_deliver().
    https://www.cve.org/CVERecord?id=CVE-2023-2794

- CVE-2024-7537:
    oFono QMI SMS Handling Out-Of-Bounds Read Information Disclosure
    Vulnerability. This vulnerability allows local attackers to disclose
    sensitive information on affected installations of oFono.
    Authentication is not required to exploit this vulnerability.  The
    specific flaw exists within the processing of SMS message lists. The
    issue results from the lack of proper validation of user-supplied
    data, which can result in a read past the end of an allocated buffer.
    An attacker can leverage this in conjunction with other
    vulnerabilities to execute arbitrary code in the context of root. Was
    ZDI-CAN-23157.
    https://www.cve.org/CVERecord?id=CVE-2024-7537

- CVE-2024-7539:
    oFono CUSD Stack-based Buffer Overflow Code Execution Vulnerability.
    This vulnerability allows local attackers to execute arbitrary code on
    affected installations of oFono. An attacker must first obtain the
    ability to execute code on the target modem in order to exploit this
    vulnerability.  The specific flaw exists within the parsing of
    responses from AT+CUSD commands. The issue results from the lack of
    proper validation of the length of user-supplied data prior to copying
    it to a stack-based buffer. An attacker can leverage this
    vulnerability to execute code in the context of root. Was ZDI-
    CAN-23195.
    https://www.cve.org/CVERecord?id=CVE-2024-7539

- CVE-2024-7540:
    oFono AT CMGL Command Uninitialized Variable Information Disclosure
    Vulnerability. This vulnerability allows local attackers to disclose
    sensitive information on affected installations of oFono. An attacker
    must first obtain the ability to execute code on the target modem in
    order to exploit this vulnerability.  The specific flaw exists within
    the parsing of responses from AT+CMGL commands. The issue results from
    the lack of proper initialization of memory prior to accessing it. An
    attacker can leverage this in conjunction with other vulnerabilities
    to execute arbitrary code in the context of root. Was ZDI-CAN-23307.
    https://www.cve.org/CVERecord?id=CVE-2024-7540

- CVE-2024-7541:
    oFono AT CMT Command Uninitialized Variable Information Disclosure
    Vulnerability. This vulnerability allows local attackers to disclose
    sensitive information on affected installations of oFono. An attacker
    must first obtain the ability to execute code on the target modem in
    order to exploit this vulnerability.  The specific flaw exists within
    the parsing of responses from AT+CMT commands. The issue results from
    the lack of proper initialization of memory prior to accessing it. An
    attacker can leverage this in conjunction with other vulnerabilities
    to execute arbitrary code in the context of root. Was ZDI-CAN-23308.
    https://www.cve.org/CVERecord?id=CVE-2024-7541

- CVE-2024-7542:
    oFono AT CMGR Command Uninitialized Variable Information Disclosure
    Vulnerability. This vulnerability allows local attackers to disclose
    sensitive information on affected installations of oFono. An attacker
    must first obtain the ability to execute code on the target modem in
    order to exploit this vulnerability.  The specific flaw exists within
    the parsing of responses from AT+CMGR commands. The issue results from
    the lack of proper initialization of memory prior to accessing it. An
    attacker can leverage this in conjunction with other vulnerabilities
    to execute arbitrary code in the context of root. Was ZDI-CAN-23309.
    https://www.cve.org/CVERecord?id=CVE-2024-7542

Also drop local patch that is no longer applicable, since upstream now
relies on HAS_BACKTRACE as well

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ofono/0001-uclibc-backtrace.patch | 49 -----------------------
 package/ofono/ofono.hash                  |  2 +-
 package/ofono/ofono.mk                    |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/ofono/0001-uclibc-backtrace.patch

diff --git a/package/ofono/0001-uclibc-backtrace.patch b/package/ofono/0001-uclibc-backtrace.patch
deleted file mode 100644
index 3fa2414978..0000000000
--- a/package/ofono/0001-uclibc-backtrace.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-[PATCH] fix build on uClibc without UCLIBC_HAS_BACKTRACE
-
-Backtrace support is only used for logging on signal errors, which
-isn't really critical, so simply remove backtrace info if not
-available in uClibc.
-
-NOTE: based on patch from Peter Korsgaard <jacmet@sunsite.dk>
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
---- ofono-1.7.orig/src/log.c
-+++ ofono-1.7/src/log.c
-@@ -30,7 +30,8 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && !defined (__UCLIBC_HAS_BACKTRACE__))
-+#define HAVE_BACKTRACE
- #include <execinfo.h>
- #endif
- #include <dlfcn.h>
-@@ -115,7 +116,7 @@
-	va_end(ap);
- }
- 
--#ifdef __GLIBC__
-+#ifdef HAVE_BACKTRACE
- static void print_backtrace(unsigned int offset)
- {
- 	void *frames[99];
-@@ -312,7 +313,7 @@
-	if (detach == FALSE)
-		option |= LOG_PERROR;
- 
--#ifdef __GLIBC__
-+#ifdef HAVE_BACKTRACE
-	signal_setup(signal_handler);
- #endif
-
-@@ -329,7 +330,7 @@
-
-	closelog();
-
--#ifdef __GLIBC__
-+#ifdef HAVE_BACKTRACE
-	signal_setup(SIG_DFL);
- #endif
- 
diff --git a/package/ofono/ofono.hash b/package/ofono/ofono.hash
index 9e2fd413f9..31fae82eb9 100644
--- a/package/ofono/ofono.hash
+++ b/package/ofono/ofono.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/ofono/sha256sums.asc
-sha256  5e13121c0f885a81ad882db065549ea13477abbcc219f150b38a8d2ac92521de  ofono-2.2.tar.xz
+sha256  f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00  ofono-2.18.tar.xz
 # Locally computed
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index ba0846e823..ee6020ab2e 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 2.2
+OFONO_VERSION = 2.18
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
