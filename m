Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B0CD6E64
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9DF40F1A;
	Tue,  2 Jun 2026 07:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMWSgUQHBb-f; Tue,  2 Jun 2026 07:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E8240721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385232;
	bh=j4j5kRmnEEgyhvq5IRXgwYJGxia2UKgoqaSYoZbR+N0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=D7Lg4q7EjxsEd0qS6xN85W/HpvMkZlbzvB+AuLJ/+sJdCygijHnHREyGena79v9qV
	 fsxDuutU1ZvOGJzUC4OfCu8aw8jpMDze5SzRl0U3pxA2939JjCbfmqh2HnHAEiS7E5
	 u23ju7no4EroydJyO58HaPesfWMWX5ecddu850lcnikU+sj1HH59XptsA8FbrRWrDW
	 XIWlvUQME4HOUlvwgwP12oxMZAQc7SvF2T2GGkZQZYZLcOBpaP+NI2svfl1cAndIkQ
	 mPXfnJeiSxC3uqU6v5mTdrmg4hz0e3P5bo1XsoTwDxtiSvgXyLs5hgM2NShAnOjSTs
	 s1bHo5uB53o8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E8240721;
	Tue,  2 Jun 2026 07:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D88DD33C
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D689C81EC6
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8v7uPbNJXeZ for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CF4F81EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CF4F81EB8
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CF4F81EB8
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso2870495e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385227; x=1780990027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PfGzIZkPQ7JlXtMQq0LBwxFHfzcUcbvXQsZpN7nNR2w=;
 b=JyiCZr8Cmo+uGdVCw5eQBLGyHKre1ggaAnkDoS0X6/EKbIlGto3kCCTNYloxcld+P/
 HfuAHeZTU98hg05WVzxvcsnUxukrlg4woMI12WscDjrPfwjvxrgxWle/KcM1EtaIYtjq
 WxE3NbkiFEhH3wEXNyI5yTN6kbUfOONUY8vbwuP4GtjldFi9+180gqBUG8WLEdgLVuNi
 39le3xJZKTjPvC+D9K+ioE/m/YmRZH6LjRCtg04b7soQLDwNKdLysHCunHMCUtLh0EHj
 GwQAJitM5GmnITLHCCPERLfxGKMSkQonWwDXni8Xz/DcraxXf37JSmgY528S0NTkmNIe
 Og7A==
X-Gm-Message-State: AOJu0YyHH+31w9Jg9o8br/BCfHcSiJ8Gm5GlomwL6KmpOVQDtZJrqF8G
 Y7FRmCucRmaU03PKDYCZN6FZLqOSF5PP+vIvzjtJt4wTGGtTuGmDxHJ7rBqNNMvsexVM7r15SBO
 hMHr9
X-Gm-Gg: Acq92OHV8W7mvB5f5ZIJWkUHAY+0GNdl0E1l0tPCYzs4QuWHyOk/zExf1Z4xAytdItJ
 ExlP6UDs698LXCtZk2DyY81EBies7BBCvcn/VJTCpHlUGfpQq+qSG3UXTUelrh7cZFlmClYO/To
 VpKk2/GUZj7Xyu4jib/tJrQ87EnXJUl2lfRXDo1UpMsRATcSucsVzMGq0ZR3wzhKrFvhn0026xb
 TlkRBTrSnYP3I3//BL5JFvxGckRaMIky8DICltLgMBPNbBsJ4Dr9izniQB2SxluGRgXb9uPLFIP
 AKC6RO68tyzErZgnk93tUuwxcF/kkCdZ8+6LN/23VmBSdrOkVwRIZuOKV3ET0PlZkLx3jDABCY8
 WzyO0DpYbO7HemLRxY8NzEvgUAknJzncRgL5MPhZ7u12pldUKD8CCJShTMbx9+TCeypaBgCj5gb
 JrXjksXDIOzshsnxu7HzPZ8cGEDfSs/6i+EcG+TRNFm5FNXqa3HXriJCUEjnwgi1pNVkB/
X-Received: by 2002:a05:600c:c492:b0:490:a2dc:1612 with SMTP id
 5b1f17b1804b1-490a2dc16f6mr247040775e9.10.1780385226963; 
 Tue, 02 Jun 2026 00:27:06 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ab75sm93869395e9.6.2026.06.02.00.27.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:27:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:27:03 +0200
Message-ID: <20260602072705.43945-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602072705.43945-1-thomas.perale@mind.be>
References: <20260602072705.43945-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385227; x=1780990027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PfGzIZkPQ7JlXtMQq0LBwxFHfzcUcbvXQsZpN7nNR2w=;
 b=Jj5ix4kPlCUlnSM+yw6tuuYJBV/ma+1ORhisEb47M/4XGYM1ftL0Fhxweo8rTgKULI
 UC1FSx/fhwPwq2TTk/IYhWeNkjOG/w3fHouuUcKkvEDznYmjM2sUCrgSRmWxL5lRze9u
 TjYu0KuTtZS7kuswb/9BKGobend/7e+k6mtKezj31oSUrG7KO90cFx0AtGvKTSTaorXa
 EZ8JU2ki7vhwGpdFJoiN7iinDbnorxf8B864k2i9NUy31q2YssoEVoj3McPY/TgKxcb2
 /MT4PgiQqV+Aet8kN/NQ6qpY6cc3+s9qzzaOD2YX0ZfgJFQhqVSaI4l+x62GYKXintmW
 +lgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Jj5ix4kP
Subject: [Buildroot] [PATCH 2025.02.x 3/5] package/busybox: patch
 CVE-2024-58251
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
 create mode 100644 package/busybox/0016-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch

diff --git a/package/busybox/0016-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch b/package/busybox/0016-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
new file mode 100644
index 0000000000..5891424c00
--- /dev/null
+++ b/package/busybox/0016-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
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
index c5e56c7829..0923f20965 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,9 @@ BUSYBOX_IGNORE_CVES += CVE-2023-42366
 # 0015-archival-disallow-path-traversals-CVE-2023-39810.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-39810
 
+# 0016-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+BUSYBOX_IGNORE_CVES += CVE-2024-58251
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
