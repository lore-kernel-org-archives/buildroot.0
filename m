Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB098C5DF71
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 07:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 787CA40F07;
	Tue,  2 Jun 2026 07:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzxSdw11gbpu; Tue,  2 Jun 2026 07:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D05540809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780385231;
	bh=Km6w9Ymfzz1oOKxa70E2Nhb54+T2RPiVYBca/ttUzK0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=NbFiTtOukDgnTNSuIbPrVKceMaT59lEaZxyJZawa4QOfdS4GJ915SlG7iw36+mKp6
	 Ot5eMKmlnw2j/dw7Twwt6u51OBEZePy6DB4OMRJ48Y1T+zsZAgcV82qYmk0JMaMWAg
	 d1EwaDXnQn/CTsfLr8hkDzTJY6c2/V9dHbJzoKhC4+QUlgxQHW/QvGhsFtyokbOXMR
	 xFubqRUfE0gFyanEFZT4PXZtoThkO+ihzR7ycKnHsyZ+HhLRu4QAREgiqfBqetE1oE
	 z0uuzS8Zg6v1Slc9RNYqD0al8b2aDNcuzZwjes0daq/b/PtzUA0X9zB/4q8GzqiLv1
	 rbSKHX2TPnrgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D05540809;
	Tue,  2 Jun 2026 07:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED94D223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D372840809
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAJBYFZcSh0U for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 07:27:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9C8240721
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C8240721
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9C8240721
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 07:27:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490b12270b3so3211345e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 00:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780385226; x=1780990026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0NC+4O0T0vQlONot+hcG8RvnGwQx5YNJUsd9xDSmlAc=;
 b=h0fzlmrJosKNLYLMoxstzHFIQxw7nWxSOXMIdszElHjprUg299U8jhOtbH+9u0wgRV
 B/aR2/QeVsQCPjj7LhsS+yPSOrnDu0AY14lV6fRTR60PyOeXCFD/cyfweqqxdAydCbfY
 l/nwRv4H6V1v1WMkQFVY7k6mHE/UPAgWu5bI//WGcMe7zeQykwqPjk4WxX5gWLxSDlqn
 nTjBuzuRN7B0QyyqKc7qTYMkJ7v9ezp5BB8U7+yzgpt+3j7FejJ/SAx53w6E/eFX2Fz7
 hmpbvKHoqBuHBww25GI5hI92MfWxd2MZ6FziRgjrFrCwMIT7Yd5n35XW5zERsKixvcTq
 bYiA==
X-Gm-Message-State: AOJu0YyDoTfJJnCIVxxmutSZ4M7xzpzQXBD2YG/Uv535VutXpN4Nyoet
 DfzRGn9stXN6yHIvXA92+Jl0NTupzXe4AGNdLacHfR0YF9qCDKGxljSlpx1zir61P7x0CpBaRjk
 m3Y92
X-Gm-Gg: Acq92OFY/WGqNAGOT5djyw6DGj4ed1u1qgGPaIznbxiiakhCkvzPDNkMnlHDsOb6Cfx
 cRiNGo+tcsQU0G4grZV2orlbTGb8vDOfgytvjmgS6RTXLS70QlTCuBd17Lt/G/9KIgxulIybPn9
 2Uoyf9UQjxwZTX+nIg/H+6ibsJkDdtYWoA1WTHRiFVP/hI3guyfMHhSOdGIXJAwM0mnyE4UP69E
 SAlTxUlLB8e4h9GwWMo2q6xkz1Ny32S/p+Q9CCviPCGFG9frRTpuZKg/GrWA1tlbayGIWGwCg0I
 Q3HZiuv1HueX/y/7OKAmJQ/8qNlhljnf3V0tB9aG+0MwTfTeiEXZCUlPVdvecV/bBy0/D9mUawc
 sg2oYAYuDDsy3EhqsLPSGo67+glSGKiez2jP9PxIOTzQEa5YFE3eSQMnfBS/bArBEvf64Lq3iLV
 M45tjJYxk2rp16vs9aO5A2mvkdNdTvrRF5UqksLI3LJdC129za5UR+9MTj9w==
X-Received: by 2002:a05:600c:8b30:b0:490:adb6:7957 with SMTP id
 5b1f17b1804b1-490adb67fafmr99644635e9.33.1780385226493; 
 Tue, 02 Jun 2026 00:27:06 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ab75sm93869395e9.6.2026.06.02.00.27.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 00:27:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 09:27:02 +0200
Message-ID: <20260602072705.43945-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602072705.43945-1-thomas.perale@mind.be>
References: <20260602072705.43945-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780385226; x=1780990026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0NC+4O0T0vQlONot+hcG8RvnGwQx5YNJUsd9xDSmlAc=;
 b=b91ubRwK9rkD/l103E44/xiDQY5lwnzEommcdHaR6RsCv/9yzDHmoci1JNvHrhuQV9
 PyULKQb7qHOyJAE+b796ek5qt2uv5OR1vdQsessM72M/aHGPjvKkMxUt2P+dFlXDvbiT
 BnMmNtC2mnG4KediQHrG7ha7VUKEn7Gwdc4wCNFIdxQvVt/R5kIdPaYPgoQGswLWhrD8
 63JS+nEG9fieWpI35RC5gYNBkh0od2+l1QCayl8QVLyCXP/DTfKegM6JtVewXaJsrz8y
 UQWTbtvgjsegYGIYv1dlqJd2URGaHKKIbMh8rVn+kyP95vw1GgsdsP7SNM6KcqNkZ9of
 6GNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=b91ubRwK
Subject: [Buildroot] [PATCH 2025.02.x 2/5] package/busybox: patch
 CVE-2023-39810
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

Based on the work of the Debian community, this commit patches the
following vulnerability.

- CVE-2023-39810:
    An issue in the CPIO command of Busybox v1.33.2 allows attackers to
    execute a directory traversal.

For more information, see:
  - https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/archival-disallow-path-traversals-CVE-2023-39810.patch
  - https://www.cve.org/CVERecord?id=CVE-2023-39810

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...allow-path-traversals-CVE-2023-39810.patch | 126 ++++++++++++++++++
 package/busybox/busybox.mk                    |   3 +
 2 files changed, 129 insertions(+)
 create mode 100644 package/busybox/0015-archival-disallow-path-traversals-CVE-2023-39810.patch

diff --git a/package/busybox/0015-archival-disallow-path-traversals-CVE-2023-39810.patch b/package/busybox/0015-archival-disallow-path-traversals-CVE-2023-39810.patch
new file mode 100644
index 0000000000..cea4e7de9a
--- /dev/null
+++ b/package/busybox/0015-archival-disallow-path-traversals-CVE-2023-39810.patch
@@ -0,0 +1,126 @@
+Commit-ID: 9a8796436b9b0641e13480811902ea2ac57881d3
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 2 Oct 2024 10:12:05 +0200
+Subject: archival: disallow path traversals (CVE-2023-39810)
+Origin: upstream, https://git.busybox.net/busybox/commit/?id=9a8796436b9b0641e13480811902ea2ac57881d3
+Forwarded: not-needed
+Bug-Debian: https://bugs.debian.org/1055307
+
+Create new configure option for archival/libarchive based extractions to
+disallow path traversals.
+As this is a paranoid option and might introduce backward
+incompatibility, default it to no.
+
+Based on the patch by Peter Kaestle <peter.kaestle@nokia.com>
+
+function                                             old     new   delta
+data_extract_all                                     921     945     +24
+strip_unsafe_prefix                                  101     102      +1
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 25/0)               Total: 25 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE: CVE-2023-39810
+Upstream: https://salsa.debian.org/installer-team/busybox/-/blob/master/debian/patches/archival-disallow-path-traversals-CVE-2023-39810.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ archival/Config.src                        | 11 +++++++++++
+ archival/libarchive/data_extract_all.c     |  8 ++++++++
+ archival/libarchive/unsafe_prefix.c        |  6 +++++-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |  2 +-
+ testsuite/cpio.tests                       | 23 ++++++++++++++++++++++
+ 5 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/archival/Config.src b/archival/Config.src
+index 6f4f30c43..cbcd7217c 100644
+--- a/archival/Config.src
++++ b/archival/Config.src
+@@ -35,4 +35,15 @@ config FEATURE_LZMA_FAST
+ 	This option reduces decompression time by about 25% at the cost of
+ 	a 1K bigger binary.
+ 
++config FEATURE_PATH_TRAVERSAL_PROTECTION
++	bool "Prevent extraction of filenames with /../ path component"
++	default n
++	help
++	busybox tar and unzip remove "PREFIX/../" (if it exists)
++	from extracted names.
++	This option enables this behavior for all other unpacking applets,
++	such as cpio, ar, rpm.
++	GNU cpio 2.15 has NO such sanity check.
++# try other archivers and document their behavior?
++
+ endmenu
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index 049c2c156..8a69711c1 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -65,6 +65,14 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 		} while (--n != 0);
+ 	}
+ #endif
++#if ENABLE_FEATURE_PATH_TRAVERSAL_PROTECTION
++	/* Strip leading "/" and up to last "/../" path component */
++	dst_name = (char *)strip_unsafe_prefix(dst_name);
++#endif
++// ^^^ This may be a problem if some applets do need to extract absolute names.
++// (Probably will need to invent ARCHIVE_ALLOW_UNSAFE_NAME flag).
++// You might think that rpm needs it, but in my tests rpm's internal cpio
++// archive has names like "./usr/bin/FOO", not "/usr/bin/FOO".
+ 
+ 	if (archive_handle->ah_flags & ARCHIVE_CREATE_LEADING_DIRS) {
+ 		char *slash = strrchr(dst_name, '/');
+diff --git a/archival/libarchive/unsafe_prefix.c b/archival/libarchive/unsafe_prefix.c
+index 33e487bf9..667081195 100644
+--- a/archival/libarchive/unsafe_prefix.c
++++ b/archival/libarchive/unsafe_prefix.c
+@@ -14,7 +14,11 @@ const char* FAST_FUNC strip_unsafe_prefix(const char *str)
+ 			cp++;
+ 			continue;
+ 		}
+-		if (is_prefixed_with(cp, "/../"+1)) {
++		/* We are called lots of times.
++		 * is_prefixed_with(cp, "../") is slower than open-coding it,
++		 * with minimal code growth (~few bytes).
++		 */
++		if (cp[0] == '.' && cp[1] == '.' && cp[2] == '/') {
+ 			cp += 3;
+ 			continue;
+ 		}
+diff --git a/testsuite/cpio.tests b/testsuite/cpio.tests
+index 85e746589..a4462c53e 100755
+--- a/testsuite/cpio.tests
++++ b/testsuite/cpio.tests
+@@ -154,6 +154,29 @@ testing "cpio -R with extract" \
+ " "" ""
+ SKIP=
+ 
++# Create an archive containing a file with "../dont_write" filename.
++# See that it will not be allowed to unpack.
++# NB: GNU cpio 2.15 DOES NOT do such checks.
++optional FEATURE_PATH_TRAVERSAL_PROTECTION
++rm -rf cpio.testdir
++mkdir -p cpio.testdir/prepare/inner
++echo "file outside of destination was written" > cpio.testdir/prepare/dont_write
++echo "data" > cpio.testdir/prepare/inner/to_extract
++mkdir -p cpio.testdir/extract
++testing "cpio extract file outside of destination" "\
++(cd cpio.testdir/prepare/inner && $ECHO -e '../dont_write\nto_extract' | cpio -o -H newc) | (cd cpio.testdir/extract && cpio -vi 2>&1)
++echo \$?
++ls cpio.testdir/dont_write 2>&1" \
++"\
++cpio: removing leading '../' from member names
++../dont_write
++to_extract
++1 blocks
++0
++ls: cpio.testdir/dont_write: No such file or directory
++" "" ""
++SKIP=
++
+ # Clean up
+ rm -rf cpio.testdir cpio.testdir2 2>/dev/null
+ 
+-- 
+2.47.2
+
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 215a69e51f..c5e56c7829 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0015-archival-disallow-path-traversals-CVE-2023-39810.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-39810
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
