Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E93CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F3C1614F5;
	Fri, 29 May 2026 16:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFif-ITEaSpR; Fri, 29 May 2026 16:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 896AF614F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071515;
	bh=8Nu32bF4vCogfFpMItVoVy4dVysin/FdQuT3xpOPCVA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=BVy0yux4UWtbQPrym9HuEp3SF4k51BtMIoFhH+unRxaTM/kasbS1msyopMUQeVWbl
	 H2V0S6B7Yka1p/oaCJXcWrLeYh8Tv/wWdp4JvX5/VM76X3ubce4CtshlI7XF6+2WX2
	 83RB19jOXVZs52IE5zV8Gmu8S3a+30QaMMPGDEaxdwr4NvGf8P9J7VypRTPOY9KOeD
	 CNWpfmllFzTuFoSnjOcTaA7+NT8P9USRxQkoqJLCcMnDDGPQZ1hOGnzBhEKEqX0VjE
	 Xa6N35u4h92fZ/epSpUPdnETqlOfcC9kb0y97C1kVNSMHi8cZw+nXQLScfIz96qdkI
	 WSILgcSmsFnRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 896AF614F7;
	Fri, 29 May 2026 16:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCC17288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C785D84224
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TLLuk87tmZL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FD6584227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FD6584227
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FD6584227
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4903d5c67bfso46579955e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071508; x=1780676308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KXyLlmbepxuXgSXAkvsm2wSvl6RKVpfQp4+Du9ne5Cg=;
 b=OmYsm4XQfP8Bqad/cb2PgvAe5nfj62kCV2HFZHL1bOYzq1rkSkJLYzgHVtPrPr/7H2
 cGffci3o4ExsFXxuEOr5rQrVxAqknA2FzBDX4evutNho2oDgNzNCp9GeRIWlwH6bG5rL
 K3UgUUlSe6ObDljqVEYbA2M8mCtsIw3butiv8FrP/cI3pRYjsNHCR6xMchKBdhA0Q/kH
 GXuvdr57MnPvi4nt3UHJaQLCUYDPJjDeiR/7a+OtK5FnEpOww4TbxIdU/Q3murnE4HDF
 czLVd4HR1g+oGbV1dVCholLx+52pTWBN87X5OSi02MzR3bS5Cvqp05jDzsjD8AwKPgPx
 ksWQ==
X-Gm-Message-State: AOJu0YweGDFNjjv/M0VIJGPEhnmkWS8TLnQBa8eBkLOtdcWLZJ5IHDaw
 knIpTKGMryXblffXBNnO2Qn9q4iKY/4mMXKDFMCtb3B7WktSTQaIP3ZuTShI4xVpAYiyCzxWGTl
 aExSS
X-Gm-Gg: Acq92OG3a2oY875r7ae0pjgS3Nq/035ejYSDBQ5Gapbz2xuAR2f/kK8lbH2fkppDmJw
 CiBj9dx7FIcEcD8ajEiEmxrqipLyelSPe1DwOF6tiZnvJJJ05RHUaAF3IHXIFMu7cwPzZIorB6x
 WJNnbMBFx2idsk9r7CYava+tcjUrws5iIrJkd4scFuWxE6R/i/rtGHnDkN5n+/rmEBdAq1/gW7D
 gCk6EANFACUQ4SC+VK6+J0/jtknE4xhxbLQJlIk9546leS08nihn1xCnpo6UMd+wKmlUWx3CKde
 ZDrhrZqQ/JmaypPXgqDqyEyHrBKsX0W977l6K7PLKx6rLyaplTVnHYqPe0ihxqJP96JmBKnMHlr
 neGzl5X/BgXd33W+PBw3bzE/d8gdAZiZfLBJBMRqKKZ0mu/1i5tYnyLuLAQnh7ix/E7oUAoJ6S+
 GJfuPbSNZUMu/oMKApt5f/eoN2R6xcquNSUMfUaYBxdMqPRugyghy4c19P+w==
X-Received: by 2002:a05:600c:5395:b0:490:4b89:535d with SMTP id
 5b1f17b1804b1-490a2904b29mr6834205e9.1.1780071508366; 
 Fri, 29 May 2026 09:18:28 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm4810103f8f.0.2026.05.29.09.18.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:18:28 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:18:24 +0200
Message-ID: <20260529161826.517403-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529161826.517403-1-thomas.perale@mind.be>
References: <20260529161826.517403-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071508; x=1780676308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXyLlmbepxuXgSXAkvsm2wSvl6RKVpfQp4+Du9ne5Cg=;
 b=Vgu1UzkVFEOs8JPgAWTVutRkd58TKsNCNFVTlgRMJp8f8x4mz7m2gVyXcId3nnKNYx
 dlB/18wx47EyaKdvF+X+eZAgha0EbjNrlIyiIVPPCuoEz41PV+SZO0P4cP5/gywY7DQ3
 nQi1sX2qbj6Pai3Fl2jOpeGjvtqEEIvKyFax13TIBt/AKJGNFap6sk6iH+3S+7Y7T4p/
 Jq2eahsPb+zESne0gRl7x9ac3r/MxP4T0GEORegVj6pJ+dkCVZymnOqioKMHyPrp3bAP
 P+tuQaCr12Y7XMLqncog09WVENL2egP0CtarBZRVvbJUyEhrp6Mfjf+SEX3RvU/hdpRQ
 EkuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Vgu1UzkV
Subject: [Buildroot] [PATCH 3/5] package/busybox: patch CVE-2024-58251
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
index 5b5cdc75e1..ff868bd719 100644
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
