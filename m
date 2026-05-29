Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BB6CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8118422B;
	Fri, 29 May 2026 16:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6emEGxQPua3; Fri, 29 May 2026 16:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C2F18422D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071514;
	bh=uEKhu1KA0wLWGq15q/PQDiZmSN9tFt+r0sENXbSOEDY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=jsPaIHyTL1pPgOZkNnN9HWZgfoTVTLviXw6g7aBUIB1R1m0sB8Zm5r8bXBRH90c1J
	 pMnRzU3gQGd5Nrvp6i8z32jRHhM/g7bdIXzWeH280rFnq/URkDcVc+4kx6Mo3YC5X6
	 8yDilMqs6FKNZCTXL6vx2EY1kIHlFuhfehKMbu+JhhracdspoBSH8OHgRlYwhQ7WZV
	 51ovdhPEHw7GVo/7Gtz0hd6qW/nYq7rgjAY0nCAWlLL9H31BIbZPbN5OoZaT2DqVWm
	 1GiiUWzkCSA8rOwI7FegHnLr16i7o9jJKGRKDKFt/5kOHF5DGL8J3j0Z9ELc649UTA
	 9Z7x1CSCxV0Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2F18422D;
	Fri, 29 May 2026 16:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 27068288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07E5A60DD8
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sDlGCfTQrm6 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB91260B23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB91260B23
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB91260B23
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso1143021f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 09:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780071508; x=1780676308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kt/BRYAsa40dAVSHO64AhMDTIsD8wr7g+NwC+Eu0LN0=;
 b=aWEqKylbUaYc2BtLiV4rkPvYKHrSeqsTx/X0jrXw9WCchdiG7UmL+qHC0nQVfmr+20
 kj6aVLja18ikiPoF9Vdnsu0iUol3PgcbUq7i1shCCahlm49gun80CcFAyuhd0Eu+6uYb
 dfGMPlvHz9iKWfxq4sg6KlG6ogSAtfMkuwyKtEk8Q6u1I3d9JVTeRREWnjhgoFddgSr5
 cBOHSJLuyHTUpCLTcYYVIIesNf/uQlosFhd+TFCdSR5U6bZShxSnghTfFx7qvMvQYBBT
 99lnRlYI8nH0266rY8tZkG2Zir8ZArir1OMGXUCJuwqeqvxSGsC61syi5aWwo9Tmt55c
 HMFA==
X-Gm-Message-State: AOJu0YxPlsgt1k+VBrCUrW9MJ/rESlgjJnMSKwEMb7UoaRJYAvrwZJ/z
 DCMxRE8bGurKgf131ZinrGJRBiyHK5FiBn+PJmRYiS/FIEywSs4BzZuMmQPZcWMHNdaCgbLcshO
 CzDef
X-Gm-Gg: Acq92OGOHrH+qyBx6YICL5TvwCQ/b0UD9JqWqXdUuLy9UVGCQ26u61SJJ89GxpA6V1p
 KSAN45SbmVjQZA5GtE7jGIyrBMbzRms0Wnf3yYqN3Zh6J9YJRHq2AlsG9VSqK0oYo0Z+Zk/Pw7w
 MFGhhuEi/6FYTM7NFfXgjzznVC6bxShmlBE5FkPCi9Y9pPYKJoA0o+NY04uGh0sz2ueUm2ZcO13
 2NNK3WAqcP71giXMykaeHl4mpSgOR5aANp0TCYSQkfUQXg4Ja5ua/tHKR8G3+ddImmNUda8mdot
 yW8qjS89SdUFygK+cJTWy6O6ywwfci9D83lr5zpxQRPCOj2Ve+lU3G/bbxvPeub41oJxN1UVv/D
 q2nsWfB7f2LdbIkjfs8jzvAK5Sm2AWDjOBLN+7COUpMUul29hmoPzRl6e8Wkm1tkQAUQMofsGe6
 FU5VDzX1C5t0nLkHTRAbFaV71l1GuNmpbhqFyOfGwGEg63o11DXMVkFCcHsw==
X-Received: by 2002:a5d:59ca:0:b0:45e:739b:3e43 with SMTP id
 ffacd0b85a97d-45ef6a90517mr911565f8f.0.1780071507900; 
 Fri, 29 May 2026 09:18:27 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef32fabcasm4810103f8f.0.2026.05.29.09.18.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 09:18:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:18:23 +0200
Message-ID: <20260529161826.517403-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529161826.517403-1-thomas.perale@mind.be>
References: <20260529161826.517403-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780071508; x=1780676308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kt/BRYAsa40dAVSHO64AhMDTIsD8wr7g+NwC+Eu0LN0=;
 b=dI5MmPH+NO8AetgE+9UoNsOrwMgxaVvOZKi7fHRt+6b8+P/SOTV8n8quD/nbYEiwu1
 vcMc04xBPZCVbxpti95DcdPlWPwV10CD0uEwUwWhWysXlKi1PSRIJ0lHLEMr7cJXo65a
 w6nzSVX+hFIBXIb2J9px0gCbf4147xIA16raoSIeBl71AUTnjxHRh0lOv5HoKpPTt2CP
 NCAEKhc3QIO69jwCKjQqHCanW+inW5c6BBvIj7KXuLCIQqRSLHj/Oe8lde6a7AmwTykS
 nWbTPUlwNRaAeATgh0oyDO9+QhT6VW3sdouvLpSdcrdBZJgdsa8fTXLOozQ6kk3RD3zu
 A4Yg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dI5MmPH+
Subject: [Buildroot] [PATCH 2/5] package/busybox: patch CVE-2023-39810
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
index 7e0b3d5766..5b5cdc75e1 100644
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
