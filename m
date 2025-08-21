Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DEFCA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B9B61701;
	Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTuW3IqnXshc; Thu, 21 Aug 2025 19:20:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D50D8616FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50D8616FB;
	Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AB725B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2793D4192B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-rOWIRcQLIV for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3680141921
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3680141921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 262DE8750F; Thu, 21 Aug 2025 19:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:51:17 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 8e13c0776213e5d6631a9c76be8e788a9763347b
X-Git-Newrev: 573aca61f3d04f7f9e861b9f5721d9861c336f6d
X-Patchwork-Hint: ignore
Message-Id: <20250821192007.262DE8750F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ofono: security
 bump to v2.18
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=573aca61f3d04f7f9e861b9f5721d9861c336f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
relies on HAS_BACKTRACE as well.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 611a795cfc3c39c5603be467ff98ca0839721ea6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                       |  1 -
 package/ofono/0001-uclibc-backtrace.patch | 49 -------------------------------
 package/ofono/ofono.hash                  |  2 +-
 package/ofono/ofono.mk                    |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0ad81f3bd6..1cf0e76510 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -870,7 +870,6 @@ package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch l
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
-package/ofono/0001-uclibc-backtrace.patch lib_patch.Upstream
 package/ofono/S46ofono lib_sysv.Variables
 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch lib_patch.Upstream
 package/olsr/0001-olsrd-migrate-to-using-bison-3.7.1.patch lib_patch.Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
