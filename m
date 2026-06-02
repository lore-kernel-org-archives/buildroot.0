Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6204CD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5491040827;
	Tue,  2 Jun 2026 07:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50dgt1vrPn2W; Tue,  2 Jun 2026 07:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 164574062D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385172;
	bh=JCZ3/KK1WHsDKtdJtUGGm+oHrMP1DwEnRR892q21yvg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jAy+OAcOXVkZHP3CS9W6pT8By++gtShO7ytdEmchmZXNbffJJmPjlWmYKRflsfL9g
	 QLbhJp0ZqEn6JcQ4uYKm2fL70gTBmPYEW8joAZ6tRGImLwdiUdiyuF2gCSWcUXP2Ce
	 4/EXjwCPGEPqPPIyJu6q/mf68zjCt1X+HvhzagH0h4e4zZ6+l6OsdocPRMuW/qCsSB
	 7SBWN6ic1HWRDTTHa97R1wGMHZ0wT0r+5bN/6PlvxPawLydNlnBlxMjEhAv2wssM3v
	 k6lBx1RLfQ3TORbK6dOidvvfzVMNlQOFmFYQ/DYUC/diVWIzOeChvOXNLQN8mAyQCI
	 dmItVis4yK1JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 164574062D;
	Tue,  2 Jun 2026 07:26:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 824CF4D2
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 680C7404DC
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc9dQXr8_wVE for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 361B8402C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361B8402C3
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 361B8402C3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:26:07 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso1965986f8f.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385166; x=1780989966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PvEqbZv+zxMgeF0K9AamzDD7eLLMMumku2k48yT7Dl4=;
 b=mFp7G6FlmzB2/rOHT4hpmqm0QTgqidIOErzSEI8aDgWZ+ZfQ6bkFmG641JtaOD1146
 pTk9XFWYRNUDCGtBG86Q2/XhRiC+3n2D+eOu5kjbGXbaECKglPzUXmYFG1yZhVPf71VX
 E9sXmz7S5rQLIIHEuYSWBYE6xIfzM009krlLJ8sakut/s+y85yNQ6+ibhL4AVqt4cKFo
 CjJWHs0oUmLRbZ3E2YTPxCBag3Gwa1Blh9iqLW6HwAkwVYyKA3tkB8NyPVdRxXbzYQ12
 VUdbtqrQxidER2AYtJ4J3wx3faUMJigiOWgcyTbu1UfpH3ElKKAs8ZA12w5V32/dlFwx
 0+Uw==
X-Gm-Message-State: AOJu0Yw6ixkwSzMXh7Q8m26vHrXCiFt7Elhar/SoVuDhcCWyfZn1KWyt
 a/RCLMQIQVWVagefUvOJkSd9M2BxwSIO6qbmnJcTJ19EbRqESqlMiV0hUlKLC+8t2SYyvudrCjS
 Z68Xu
X-Gm-Gg: Acq92OFYtQLgnzIE1EkV8GXHk+qW7zs9KDqui8PXvgBbljoMGmpYXAv0mvw/FnB9w/D
 lTfGvmLQ+zI4sRDfpSOVaXjD5juRV4Gug8yFntKtJ43KCNljvxlCrVCpf5OVKWKWQnwxGzoTKZM
 f9u/5FQFRBkRfVnoT3QRj+pbZwx7cpQWXS04j1htAEXjwXNGj/PEqt3y4Wzk/dbqKai6ALOPx6R
 q2UUbGS9lpHil6FRzf9n/t6UZ/9msEE6pCiVZxW1JiIeXUg3pFqGG9ZlKk+I144KX8yi5lcJPtl
 Eh9Vm8x3SxTpHMJ12JhICCanmvkpW1ROTwzo7RDn11aVcKCZOTR8vAyQWN6BOep/q85Hz38bc0a
 7hRuoTfr82qVbmvj0n2+szm8G4oTWv2tp7+hD9hqrq0u/NEGbCywljcXxuLtmFoe37dAilk3Mz3
 yil163YAGKHrLqbuuj2XP0+B+ucXEiQ6Ts140S2EJ8mORA89L3zMj0Q1blJQ==
X-Received: by 2002:adf:ec51:0:b0:43f:e2b7:7160 with SMTP id
 ffacd0b85a97d-45ef6b02310mr21749508f8f.4.1780385165761; 
 Tue, 02 Jun 2026 00:26:05 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34c50f6sm35314189f8f.16.2026.06.02.00.26.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:26:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:26:04 +0200
Message-ID: <20260602072604.42796-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602072604.42796-1-thomas.perale@mind.be>
References: <20260602072604.42796-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385166; x=1780989966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvEqbZv+zxMgeF0K9AamzDD7eLLMMumku2k48yT7Dl4=;
 b=cBfsTKECEY4bWvlgFGDIR0zEIzp+FrtRa0Y+pr0XhlysF5KRLa2+f6dXJ7P+sr+uoN
 7oIc+2eG7vmgsguKkPqTYlte1ftmeNW5E2GLfzR8yTY+u5TGEnqmf5hdExg+6LNqqhep
 WDAtkVjMfCbB3AL8G5Zjc0oHOcMXMiYjtygBzq3t3HBZm25iwJM9DXhRy/fWIZ98QbfM
 jpW0Z/qkRSpfCsZi07wnBcSgVQoou747jz0bbsC87coi4kLNPnKI5eeuuDAhFx2I5Pu4
 yWlll6bS4zrLOfi2TEGbl1GUgTmrg07tSAv1CE2zTjyJQ3SW3u0mb+tWn5+oyJNetBJx
 /MdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cBfsTKEC
Subject: [Buildroot] [PATCH v2 2/2] package/busybox: patch CVE-2024-58251
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

Based on the work of the Debian community, this patch fixes the
following vulnerability:

- CVE-2024-58251:
    In netstat in BusyBox through 1.37.0, local users can launch of
    network application with an argv[0] containing an ANSI terminal escape
    sequence, leading to a denial of service (terminal locked up) when
    netstat is used by a victim.

For more information, see:
  - https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
  - https://www.cve.org/CVERecord?id=CVE-2024-58251

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-sanitize-argv0-for-p-CVE-2024-58251.patch | 50 +++++++++++++++++++
 package/busybox/busybox.mk                    |  3 ++
 2 files changed, 53 insertions(+)
 create mode 100644 package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch

diff --git a/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch b/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
new file mode 100644
index 0000000000..5891424c00
--- /dev/null
+++ b/package/busybox/0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
@@ -0,0 +1,50 @@
+From: Valery Ushakov <valery.ushakov@bell-sw.com>
+Date: Thu, 21 Aug 2025 12:31:53 +0000
+Subject: netstat: CVE-2024-58251 - sanitize argv0 for -p
+Bug-Debian: https://bugs.debian.org/1104009
+
+Signed-off-by: Valery Ushakov <valery.ushakov@bell-sw.com>
+Upstream: https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+CVE: CVE-2024-58251
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ networking/netstat.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/networking/netstat.c b/networking/netstat.c
+index 807800a62..d979f6079 100644
+--- a/networking/netstat.c
++++ b/networking/netstat.c
+@@ -41,6 +41,7 @@
+ 
+ #include "libbb.h"
+ #include "inet_common.h"
++#include "unicode.h"
+ 
+ //usage:#define netstat_trivial_usage
+ //usage:       "[-"IF_ROUTE("r")"al] [-tuwx] [-en"IF_FEATURE_NETSTAT_WIDE("W")IF_FEATURE_NETSTAT_PRG("p")"]"
+@@ -314,9 +315,12 @@ static int FAST_FUNC dir_act(struct recursive_state *state,
+ 		return FALSE;
+ 	cmdline_buf[n] = '\0';
+ 
++	/* don't write process-controlled argv[0] to the user's terminal as-is */
++	const char *argv0base = printable_string(bb_basename(cmdline_buf));
++
+ 	/* go through all files in /proc/PID/fd and check whether they are sockets */
+ 	strcpy(proc_pid_fname + len - (sizeof("cmdline")-1), "fd");
+-	pid_slash_progname = concat_path_file(pid, bb_basename(cmdline_buf)); /* "PID/argv0" */
++	pid_slash_progname = concat_path_file(pid, argv0base); /* "PID/argv0" */
+ 	n = recursive_action(proc_pid_fname,
+ 			ACTION_RECURSE | ACTION_QUIET,
+ 			add_to_prg_cache_if_socket,
+@@ -686,6 +690,7 @@ int netstat_main(int argc UNUSED_PARAM, char **argv)
+ 	unsigned opt;
+ 
+ 	INIT_G();
++	init_unicode();
+ 
+ 	/* Option string must match NETSTAT_xxx constants */
+ 	opt = getopt32(argv, NETSTAT_OPTS);
+-- 
+2.34.1
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f7b1fec487..6170c50212 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0012-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+BUSYBOX_IGNORE_CVES += CVE-2024-58251
+
 # 0010-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
