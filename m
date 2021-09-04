Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323EC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F5560F3A
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9F5560F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6464605EC;
	Sat,  4 Sep 2021 20:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbGC5Zbr6Ouk; Sat,  4 Sep 2021 20:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1628605D7;
	Sat,  4 Sep 2021 20:19:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EED681BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEDA16071E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRlv8IZhl05j for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2322260658
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:17:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B3E5A8843D; Sat,  4 Sep 2021 20:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 21:53:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8ec21bd179b66cc3ca97c432be593f783607b8bc
X-Git-Newrev: fdfd8f0fe9a6dd43aaf0cef4d9d687d1d52fa434
X-Patchwork-Hint: ignore
Message-Id: <20210904201606.B3E5A8843D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/prelink-cross:
 fix handling of TLS offsets for s390 arch
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fdfd8f0fe9a6dd43aaf0cef4d9d687d1d52fa434
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

/tmp/instance-1/output-1/host/sbin/prelink-rtld: error while loading
shared libraries: /lib64/libc.so.6: cannot handle TLS data
ERROR: can't resolve libraries to shared libraries: glib-2.0, gobject-2.0
ninja: build stopped: subcommand failed.
make: *** [package/pkg-generic.mk:270:
/tmp/instance-1/output-1/build/gobject-introspection-1.68.0/.stamp_built]
Error 1
make: Leaving directory '/tmp/instance-1/buildroot'

Fixes:
- http://autobuild.buildroot.org/results/7614f5928e845331d7295349da891a76f1786b79/

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27b032941ab4b5ea81cee7f9e10e21ffea258616)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-tls.c-Fix-TLS-offsets-computation-for-s3.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
new file mode 100644
index 0000000000..cea1357d1d
--- /dev/null
+++ b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
@@ -0,0 +1,43 @@
+From 4064f77d2f550762cbf220fec7c26a8ce4219ea4 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Sun, 8 Aug 2021 11:19:52 +0200
+Subject: [PATCH] src/rtld/dl-tls.c: Fix TLS offsets computation for s390 arch
+
+rtld_determine_tlsoffsets() didn't handle s390 arch properly by falling
+back to the default case. If TLS_TCB_AT_TP is 1, then set offset to -1.
+
+From glibc's sysdeps/s390/nptl/tls.h:
+-------------------------------------
+/* The TCB can have any size and the memory following the address the
+   thread pointer points to is unspecified.  Allocate the TCB there.  */
+define TLS_TCB_AT_TP	1
+define TLS_DTV_AT_TP	0
+
+This lead to the following error:
+---------------------------------
+prelink-rtld: error while loading shared libraries: /lib64/libc.so.6: cannot handle TLS data
+
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ src/rtld/dl-tls.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rtld/dl-tls.c b/src/rtld/dl-tls.c
+index 280cee45f950..29422dcfd25e 100644
+--- a/src/rtld/dl-tls.c
++++ b/src/rtld/dl-tls.c
+@@ -143,6 +143,11 @@ rtld_determine_tlsoffsets (int e_machine, struct r_scope_elem *search_list)
+       tls_tcb_size = 0;
+       break;
+ 
++    case EM_S390:
++      tls_tcb_at_tp = 1;
++      tls_tcb_size = -1;
++      break;
++
+     default:
+       /* Hope there's no TLS!  */
+       for (i = 0; i < search_list->r_nlist; i++)
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
