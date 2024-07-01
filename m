Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49D6C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 16:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F28240887;
	Mon,  1 Jul 2024 16:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJIJAZKmk7AR; Mon,  1 Jul 2024 16:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F18407CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75F18407CE;
	Mon,  1 Jul 2024 16:56:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D856D1BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4C8C40252
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NQtGg5FGWyS for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 16:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6729240137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6729240137
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6729240137
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 16:56:25 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3738690172eso15892915ab.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 09:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719852985; x=1720457785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uAHtFepBxsuGbnx1MiO+bm+sCOGox6GWnaho61h2CXc=;
 b=xEwP0H34hYdU9+ggmGohbGGCVF7EixdCTCVgRodhGofSKiQQPeXTuZckYUxMZj1Tm7
 dGCMd5dlCKz/fl7u0YgxgDNgBEkpOn5KVV6ivVKk3Z0Lxx+BbuKoxRtyvIEmUax4i5yt
 e37rDrShEclym9L+YHkv6h0CjbpKWkzcCTSGhUMiej2XyuEVGCpFfKoFWmys09m5w7R5
 1IgQz+64qpEMedKxwXeVoj3ugALInqFgaw/jddgtBx+iHIxLNk75xbI87jccsY4ecf39
 B60WXQvaEmCYgtJO1wOGvo4FqR1hPOpg/gacbxTP3PhL7HmUdV1Vu0ioA3HbFOGaVaDE
 lAZg==
X-Gm-Message-State: AOJu0YybFVKtDg2r8TU93dK1NK7TzDJuSR5cMF7w5sP4KsGVhQrjOBPc
 bGwTgfDZ7OYxrM1MEZWYpwuHrjv5bxC1ILuLNG8tEbK06+B3qxpP8LquvA==
X-Google-Smtp-Source: AGHT+IGvVT7r5HcJyn6ALt5Wtn5LNFqlWpgo9D99GGM9d2LHsupgOq5xf+X6FWX/p/Xd5gAg/sq5/Q==
X-Received: by 2002:a05:6e02:1546:b0:379:2f26:c512 with SMTP id
 e9e14a558f8ab-37cd0aff8a3mr77350665ab.3.1719852984578; 
 Mon, 01 Jul 2024 09:56:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad483c06asm19295975ab.82.2024.07.01.09.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 09:56:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 10:56:16 -0600
Message-Id: <20240701165616.1632323-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719852985; x=1720457785; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uAHtFepBxsuGbnx1MiO+bm+sCOGox6GWnaho61h2CXc=;
 b=j9yKsUPBAotkE/UxcIFv4zOKHX3UE1ifeXh6fRR0GbDxUb5UE0PV6fqDAYwJFOIGIt
 ePpMwmNOI+rZ1eMSWgkkebCPBpWt2jiyswwjoLeA/kypJjlit7V6MxL/O2EPft/T4xfO
 twQTqoxzeIYsTQjO2oGEBftRoUGWGlewStpbATTxwXKyDTFp55bLKyRlLuOYhcaK8UW8
 qldreOySz1GTvJuTtsvBjdVvyIH2yc0pAta39q5dB5iquG81uh5lJQRrDFOpefKpY3+P
 u4KWBhP3n7VCybaf+tHw0GLf69RDRw+ANDnVUccXLzQu3nkLQ9Vn74MJ9ScYsxASlAEQ
 rOsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j9yKsUPB
Subject: [Buildroot] [PATCH 1/1] package/prelink-cross: bump to version
 440c0059a21f06b5577499a80b55482cb99d6d1c
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer relevant patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...c-Fix-TLS-offsets-computation-for-s3.patch | 43 -------------------
 package/prelink-cross/prelink-cross.hash      |  2 +-
 package/prelink-cross/prelink-cross.mk        |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch

diff --git a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
deleted file mode 100644
index cea1357d1d..0000000000
--- a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4064f77d2f550762cbf220fec7c26a8ce4219ea4 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Sun, 8 Aug 2021 11:19:52 +0200
-Subject: [PATCH] src/rtld/dl-tls.c: Fix TLS offsets computation for s390 arch
-
-rtld_determine_tlsoffsets() didn't handle s390 arch properly by falling
-back to the default case. If TLS_TCB_AT_TP is 1, then set offset to -1.
-
-From glibc's sysdeps/s390/nptl/tls.h:
--------------------------------------
-/* The TCB can have any size and the memory following the address the
-   thread pointer points to is unspecified.  Allocate the TCB there.  */
-define TLS_TCB_AT_TP	1
-define TLS_DTV_AT_TP	0
-
-This lead to the following error:
----------------------------------
-prelink-rtld: error while loading shared libraries: /lib64/libc.so.6: cannot handle TLS data
-
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
----
- src/rtld/dl-tls.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/rtld/dl-tls.c b/src/rtld/dl-tls.c
-index 280cee45f950..29422dcfd25e 100644
---- a/src/rtld/dl-tls.c
-+++ b/src/rtld/dl-tls.c
-@@ -143,6 +143,11 @@ rtld_determine_tlsoffsets (int e_machine, struct r_scope_elem *search_list)
-       tls_tcb_size = 0;
-       break;
- 
-+    case EM_S390:
-+      tls_tcb_at_tp = 1;
-+      tls_tcb_size = -1;
-+      break;
-+
-     default:
-       /* Hope there's no TLS!  */
-       for (i = 0; i < search_list->r_nlist; i++)
--- 
-2.31.1
-
diff --git a/package/prelink-cross/prelink-cross.hash b/package/prelink-cross/prelink-cross.hash
index 6776d407b8..4aa3a86c45 100644
--- a/package/prelink-cross/prelink-cross.hash
+++ b/package/prelink-cross/prelink-cross.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  555fd65c1b907f9b78d6d41ec04cb6e242d2ecb0667867e39cdd517b3f182dd3  prelink-cross-a853a5d715d84eec93aa68e8f2df26b7d860f5b2-git4.tar.gz
+sha256  ce0d58b7c60a441fd61c52329e2c767f7888056c491f55627a5304b13fda743f  prelink-cross-440c0059a21f06b5577499a80b55482cb99d6d1c-git4.tar.gz
 sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  COPYING
diff --git a/package/prelink-cross/prelink-cross.mk b/package/prelink-cross/prelink-cross.mk
index 2312ee53e6..c32ea74afd 100644
--- a/package/prelink-cross/prelink-cross.mk
+++ b/package/prelink-cross/prelink-cross.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRELINK_CROSS_VERSION = a853a5d715d84eec93aa68e8f2df26b7d860f5b2
+PRELINK_CROSS_VERSION = 440c0059a21f06b5577499a80b55482cb99d6d1c
 PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
 PRELINK_CROSS_SITE_METHOD = git
 PRELINK_CROSS_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
