Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44439C5CFC1
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9226063A;
	Tue, 11 Aug 2026 11:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yskNvxKz48h; Tue, 11 Aug 2026 11:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8395606AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448109;
	bh=IydWNu3Nl1BBsjiTZHOGeEVtE8naZ0qauCgGl56r3S4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Dw6vZeT8d+bHpoTlVdyxCRz1TDfMX3Z7V5wHdgX7FrPflE3nz9LF+KFydh9/kqfGb
	 6DU6wuYtQ27JpEBqO0A6DDvNoF2ERza6YTwyLl3nu4efk0+IBBYATzG33KCnzuo7Xr
	 24Zt3xrpFiO3L1Rvsw8miQ+8kdIc7gnflmgEwdrwoH0SAjuTlaAzNS6HyMPp7Fya5s
	 NcAzmRqeRZ6+kPJO3HsvX8IiQnl+NdUbcY07V544lukCs6sTsKU5n7m6z42QAQLJ7G
	 g2KZetlFkIFZ7tILgz4bQ8bBNbgnQRfEOq2aM/jgsSTFdZ1ZGk96qyQyikr5fEqrf0
	 vgcfj+Y/jQWEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8395606AA;
	Tue, 11 Aug 2026 11:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8F19722
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE0F80F7F
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3oqKA436sBV for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:35:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4654C80ED7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4654C80ED7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4654C80ED7
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:35:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4997581cdc1so5494375e9.3
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448104; x=1787052904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=TXdQoWUw5wAHMHZigQu6CT3O6FL6pAjCAFhNkXgm1tA=;
 b=CkzufikIxkdp4ke9eURyVYFwR4Wh6a7OeUoLBvf1qRUPcTbgHA1/2zqZpDXPPO7R0h
 2Q4W9iHIIZxN8Fv4Ktdo86cVCMm6zglwp/Cc/WrdnaoGUyB2+Q/ATzgoB7yUaZbbW393
 XKK5FjGiieIqXKF0uWoT00HUBtP4MVHNhH+QizIazb/qR7BhSbwhaHAydn0+UrDASCqB
 W7VjZP+mJAdr46fYcl0YssOP+gLcOBRhgPIKM6KNV3ayZedENKwOv8qeOqm/6O6ulAZ7
 es9pzhSsJ2svN03T1o+PBwgDm6F2yZPDLRyesgBhvBgwDVH/uZdG8nq94dRMOFoAPJTh
 1oBw==
X-Gm-Message-State: AOJu0YxHUyWfXaHQwvfImut3Wlrd+7lIB4U4QyF4E0j8huAKG5Ab5A2b
 xNC31CmuKHvdZTT5UCYrDowzLGwvLmuRYJYkI1poukYUFoZG0+a4cj0ld+Vk0rlDJpAXvYk0Sus
 P/zkO
X-Gm-Gg: AR+sD10bzYusFWmxJ6ma+UYbSlcGWNlcVZuAGeukU7Hm5EJc3gCalKH6DJkt0qrauTt
 l8CrAYQUmkMHAybuFFzeOaabxwuP2aV4yX5dvBAyE4JpVRpza8h4bvQtJFGhDNMoSNYgVdbOwMB
 QGY90snVrn2okYieMNDyq2Ox7n20ClKyEdC7vXQ3nl5cYCSn9rqRxGTqjVo637ALLbkIvpSc+F2
 u3hn60qf++r/OO7cuCPEMDDzu2iBqutgkqCOe15/XXVrYnAVkTZeZDPmFAskJ9a1HbemshdQtVY
 3etqssM/EJ9IHQfYyTVj+ClG30LAfVGfJ76IJwc4LYhMMeyLdDqthTc+S+6C552Cs640foCwu9j
 HCAkdla3l6lzNWNxXVp1bDRqxNNYWIjXBW6jIR9+jsCJ4BGBSh9wRT0VB6GTA5JRWvs52frgAuX
 AP6rGYjIQIiccaTqiBjs23eoHFZCHrdSVXi2eheWy5nKbehd75ZLJCZA==
X-Received: by 2002:a05:600c:4f49:b0:499:4892:e84e with SMTP id
 5b1f17b1804b1-49978468bcdmr45517855e9.11.1786448103731; 
 Tue, 11 Aug 2026 04:35:03 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499788f11b8sm43981595e9.10.2026.08.11.04.35.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:35:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:35:02 +0200
Message-ID: <20260811113502.106639-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811113502.106639-1-thomas.perale@mind.be>
References: <20260811113502.106639-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448104; x=1787052904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=TXdQoWUw5wAHMHZigQu6CT3O6FL6pAjCAFhNkXgm1tA=;
 b=YTPB0sHzeBSebrWjf6Z1CvuKxdfks4HlgrPf4nbREEldo0xyWyJksTg1dnHxOy7DMD
 KBm8fiSh7QT29VBNTJlCwNQGldq5UTx7/3sMhHoYUplGFtDALFqBqHZcFJBRok9iOOk/
 K25GBC2D7tEJdZeEtUppRmaCc/ARJSoZlDsXAs6X0SzD66WqCUWsNRKS9RYFucdEylKf
 OxFqdww5SniRORTrWY58Ft/q6Vb50gH2ggYiBjwxnseQVo35ZGIZTEqdBDplnkOJpN5P
 ONENxZ+5u2o5IoRvG2nbdyKY1QjXo1zPybsJJ5BSQmu4TXTTq9Nl3BjxwaTaR4rl6ad8
 g2fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YTPB0sHz
Subject: [Buildroot] [PATCH RESEND 2/2] package/busybox: patch CVE-2024-58251
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

This CVE hasn't been addressed upstream and the bugs discussion is 404
[1]. But the same patch is applied on Busybox v1.38 in Yocto & Debian.

- CVE-2024-58251:
    In netstat in BusyBox through 1.37.0, local users can launch of
    network application with an argv[0] containing an ANSI terminal escape
    sequence, leading to a denial of service (terminal locked up) when
    netstat is used by a victim.

For more information, see:
  - https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
  - https://www.cve.org/CVERecord?id=CVE-2024-58251

This patch is still applied on Debian & Yocto as of busybox version
1.38.

[1] https://bugs.busybox.net/show_bug.cgi?id=15922

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
index c938782590..293538b722 100644
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
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
