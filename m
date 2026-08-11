Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B6C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AC9D607F8;
	Tue, 11 Aug 2026 11:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HR1LdqPFzHf; Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16776605CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448576;
	bh=B23SbafsTyhhW4omM/3swMzhQzCOqyuq4XiXoz166YQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=iJy8nwYdBM8ZYiNTgqFQGUM0ovhVFz5qr6zf6DGJMnmFpsCuIrzJ8xH/xrGthY0Ts
	 9DGMmoXexVkQTl4YqTP57qhdcYIo0ThtYMwH7Bhtvazusfl9+Aa/wETwWCZGp4Tai/
	 PQAHdgmuxg67wxdWjAcgCg+RQ15WvE6Um7yBj04bUjR1bU9xaMtyeozgMxeJrnrLOG
	 /3tFWaGYrIIqB1vgbppDFhHxvp8mWK/dP+qsvFOfL/UKrwnyApPRybLooDugRi32Wn
	 e3SjDxAcBVpV/RX8Xn9sXc59Yy1eiIjJEdF3/3cKQe7lgeZbJY7oClIvZ/AivxtRR5
	 s8MVMjUfRrlmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16776605CB;
	Tue, 11 Aug 2026 11:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA7E3259
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC72840063
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16-ZKuGeVVup for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA1CD400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA1CD400FF
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA1CD400FF
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so32728785e9.2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448572; x=1787053372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=V6ag/Ne3b2SjzdY5SZgPXGcR/PwgN+y0JYItj6fzEsU=;
 b=HTjhsfbm3VRKcIQu+/0F90QJCX5mp/wD3srvkLdtk+JmWxI5ZXo7smjm7X4xbMwQPL
 53bf+/duIBLvD96FVi2JwIRtN1tw4v84dtv/ji4w9KvRysf/8EKcs/7b3AYrgT6RaOfV
 HmrmoH7oIMjhb7Sl4ilzc+w7I5tK5kL0UuDE8ffa9ZOnNvgGY++KMH/OMplDRq+/6/wx
 6Ay5iDFE8KkmOuvOer1PLqp9ytvBmYnbLqC1d02mU0b5qeHp/JsbkTEklVMD1XSvsnq8
 Co8zYKw2xTJJrPZnBfSphDRyA1zhukjF2iiO8EDBbTRG0ljDZQtZZIwwm6x/VyqVJhyA
 Bk1A==
X-Gm-Message-State: AOJu0YxmMx3M8xIDm95lP3o6wm+Ed8PKfZNU8yJjE1orwkFqJSsJHwoN
 ALiNL5jxpfSG7oN85A9Kh2mbHqM1SLpOEYYAlWJLcNk20Kvs6jhrP5qfj4iArOXUThQk43Ji7RW
 pfb6n
X-Gm-Gg: AR+sD12BDHP+zrpqYRzMO2U9Lg9GIXmUhZcjvRHI6awBWIt48GATrz9hpnh7Ymg9bpD
 ieKEWHSl5g3czCJ3z5bpXirRsY+TCnN0Fw5BR2Axecny9vCA+dOp/XtI9nDWV6OAicnJMop437S
 LwUjO0r3oNlsAxk1wbg6loplXHTTFBvePV1ao1dmUIvlA35nZ35J4GLbp7NX8MEqDY9ry2Yq9as
 vH1ZxzkreWaS4wxuWUTNJ0bFaNMufXAF5bQd41HxoRGd99nRY32o5vUBucfyWWhQsvNo9SB7JWN
 mD6KPNE5zlwGgEaoy3C2t88kljbhA1sxn1tRz9UNgoDJd/HHhAvHQCy7LXh5CgjcdzuBCXAia5Q
 2IJl7QbxdRtjbEDBdX6WeF6gX5gf0egXkpq9a/AGixLr/p+/AYuus2zFLelH/Twci2q3AVXdT/0
 GLXNb2R0Oc0wF0QaKJHcI1p/a7n6hJeTkUivsTP00+OBcaQlrzNGgJzN8+wMxGMRo0
X-Received: by 2002:a05:600c:3b9e:b0:499:795a:c60b with SMTP id
 5b1f17b1804b1-499795ac6e4mr22790685e9.19.1786448571746; 
 Tue, 11 Aug 2026 04:42:51 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740a6f4esm57122455e9.2.2026.08.11.04.42.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:42:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:42:47 +0200
Message-ID: <20260811114250.116254-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811114250.116254-1-thomas.perale@mind.be>
References: <20260811114250.116254-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448572; x=1787053372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=V6ag/Ne3b2SjzdY5SZgPXGcR/PwgN+y0JYItj6fzEsU=;
 b=a6/0iShuJxadjPj/cVSwxVvWW/hfbb8j/VDqmTSwtOB0OPyBqCbrqegw4odLcb5HTz
 XvHYSCYEA0zxI6GIGjFeqxmfLu8n9NYa7r3ULXO1D8o3GlXukRi20YiomNx8GUng7C/V
 JubUnPxm0xWMvZfnOBaPNaYvuVWtpaG9/Hhn5EmviaJB5JmTY5JQihCcZS3LNbUpYown
 JOBW6SNz9GAiPwpGJ+9dgCbBg6nwl6//T12Ipp3eEYkNSsAbKGLneK7Fh3kuN9j+W0m6
 mjdYfxwVpcrjMbsrk5/Pb/JNR8H9ZxvVHmeN7Rj53c0UpBxTrCyBf9mtLGKZ2bkQirAN
 7iRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a6/0iShu
Subject: [Buildroot] [PATCH 2025.02.x RESEND 2/5] package/busybox: patch
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
 create mode 100644 package/busybox/0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch

diff --git a/package/busybox/0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch b/package/busybox/0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
new file mode 100644
index 0000000000..5891424c00
--- /dev/null
+++ b/package/busybox/0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
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
index 092fd5d1e1..0488518086 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
+BUSYBOX_IGNORE_CVES += CVE-2024-58251
+
 # 0012-archival-libarchive-sanitize-filenames-on-output.patch
 # 0013-testsuite-tar-tests-fix-test-after-cve-2025-46394.patch
 BUSYBOX_IGNORE_CVES += CVE-2025-46394
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
