Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB73C5CFDB
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A368D606AA;
	Tue, 11 Aug 2026 11:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABvDeqMtNSIt; Tue, 11 Aug 2026 11:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D001D607E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448580;
	bh=4WHML0C8TZiRInGFozon+WJHrhga7QPVDMZnLQA/s4A=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=NWu0hlCakOctZB1aMeoZ//DlwQXUMsYvX+9azqqqdRH0qw0Sw5JosvyG3Yi5Evb7y
	 XU4KqEgYasrPUCJUmzI5Qcp2dqe14lc7njv4Zh9rqIhKRsdBi9s/HkqqwL1D4T2LB8
	 UezZ91c2JjwfbJclooMFxIAhd08jRcupaT3BsNEEp93nWOGzhPvOq014d6BkOavhha
	 jxm0MilsRSSM1+ZBKwAOjz6jkCFPinLRY0CGqj6HQKfLK8QvaKEQKmOGWe5yC/37NU
	 u1YohOqsaGtLZ/XT2UD+MhNjm7POczPFk+/8g6IqXDaMJj4HygvVbh0/KOXiCoHLfI
	 Fa/CwrZUtsi0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D001D607E3;
	Tue, 11 Aug 2026 11:42:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85321345
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6FC40764
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8OeGLEDARdZ for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52BCD40760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52BCD40760
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52BCD40760
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so26604925e9.2
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 04:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786448572; x=1787053372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=qqvAya1VDgXXDr2LXy9Do+Vuxg/PXnNjdkgKQxlzk5E=;
 b=LA+RqkAp5CcnHHrZHLbRTI2uouZI3cWseeMqgEmqVQ+c7UtmAklfu6fFQlNdi+VAVi
 oeSnH3HouUPsH6WyKF0ikD3TBg/waZ5b8of4trmkxq1MAWs5lTE5b26G2TzqfbkmdMUO
 AB3GhwX5yWAV3GgHZavvjo4Zl8GhAE3B6RZvdYaHYaz+9nH2UGJ7FE3zACVRgJVKZrq+
 ZbILip6Tez6BF+gcGrEh7L1sPO/ls+zAQPafzBWaqg4/bwixf3LHwGgibWOrg41xPran
 AWujm4Dck8qWrE6xs97iRpjtpQziw5cmNZs7E/jhWmsvaK4jNpcM4zg2N1YaeZ7iGz+b
 lqug==
X-Gm-Message-State: AOJu0YyexqFQNneM69mut49awoLdMq4jBd8xIFNV8wWFNcIj9JC+rzMm
 Sm4t6HR8iqj8XmEEOXTkICrLZXeTY5/9YYScBIw8CogIDHL5ApsC9bHhveleaWW4U3k9Pm8Ne4e
 9Rdi4
X-Gm-Gg: AR+sD12+SFGwzw9K87Dgvdvc2x0InwpnIyu8rlFRzUMgAgWx8luVCjs5IxchJ9giLYY
 U6zvl6ZR3MAptcddunSXqSPpLlSjYo6wi7VwrrPQd2pOD25w+mRvbwKbxxO3BctUBNl5yVFXfbk
 dsx1y0MEjHI9uX2cLoL1uRSdbv1z+6QoFOiGkDx0eEd2B3PhnbYwvjhsPBcEfsOJ7Zgae+cIO80
 D/yH6IMw/7UHNMO2rj1aZUQNQD1BFFuDb3dIpUpUDQVIJ0X41CsqiTOU2+eXkktbXiPoHNJzfoy
 tcMgy4ZiOM1syVlZXq7Nm1TqI3AZI8HBnjZXlveA/7G4KmbarNGQ8VR4tA+QVykbUxNXeTDe+Gn
 C/8BOQqdyc9tFYC+MWs5w54VJQrKqUe3Q58czz2awqe3OJwPbmqttHDEDUQedd+WFb6T8RBHfa1
 ouVn1lf/nMc2J7XMP6pE2M49dgbmSlmmZLEZDTPMvX6Fs1TK4h3L0Q7fhQAXmANOB9
X-Received: by 2002:a05:600c:4e86:b0:499:79b9:e220 with SMTP id
 5b1f17b1804b1-49979b9e2a6mr15417755e9.10.1786448572141; 
 Tue, 11 Aug 2026 04:42:52 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499740a6f4esm57122455e9.2.2026.08.11.04.42.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 04:42:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 13:42:48 +0200
Message-ID: <20260811114250.116254-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811114250.116254-1-thomas.perale@mind.be>
References: <20260811114250.116254-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786448572; x=1787053372; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=qqvAya1VDgXXDr2LXy9Do+Vuxg/PXnNjdkgKQxlzk5E=;
 b=fHOq/0+FJxVe4AqcQ7ROYHLcnGyB46KTK8tdwWkOQZgzADrzhJXddUmQxyZ+GuWmOd
 NcyhNIy1UECpqpDgSx8k9+4WRbq33mV7oVorlPFyDa1t5g9uB4NfY5Y+9vVRI7KBxUha
 CEgfxhEhY8SVObGVF5P8JcTudm0+DRQUq8TM4jRWi4a1Xmko/0ScHnYzW9JZQygk7URK
 XVTK2zZYYOHX9k58nBhebLqILwGbXmVNLER68nhdC7WGv+puag9Q177Ul442Zh03ofO4
 HTRq9k1+qyT3lG+VBYSi8ikrY2DoZTRU/4hXRCePmMx259LHK0v3/KvZlIEKHSqggKnx
 hDFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fHOq/0+F
Subject: [Buildroot] [PATCH 2025.02.x RESEND 3/5] package/busybox: patch
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
 create mode 100644 package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch

diff --git a/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch b/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch
new file mode 100644
index 0000000000..cea4e7de9a
--- /dev/null
+++ b/package/busybox/0016-archival-disallow-path-traversals-CVE-2023-39810.patch
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
index 0488518086..91d3b69139 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -19,6 +19,9 @@ BUSYBOX_IGNORE_CVES += CVE-2022-28391
 # 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
 BUSYBOX_IGNORE_CVES += CVE-2023-42366
 
+# 0016-archival-disallow-path-traversals-CVE-2023-39810.patch
+BUSYBOX_IGNORE_CVES += CVE-2023-39810
+
 # 0015-netstat-sanitize-argv0-for-p-CVE-2024-58251.patch
 BUSYBOX_IGNORE_CVES += CVE-2024-58251
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
