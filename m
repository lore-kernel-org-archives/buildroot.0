Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F93BC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08524607DA;
	Wed, 17 Jul 2024 15:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVaTiQeNUMh6; Wed, 17 Jul 2024 15:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A1B607ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A1B607ED;
	Wed, 17 Jul 2024 15:13:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 158481BF3ED
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E1DB40330
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYa2odpwb-Da for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 15:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E7DB4032A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7DB4032A
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7DB4032A
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 15:12:58 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7EB773521187; Wed, 17 Jul 2024 17:12:56 +0200 (CEST)
Date: Wed, 17 Jul 2024 17:12:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zpffdv/lWI4det+1@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1721229176; bh=b0LwytmnXkJUQNQSr1FQvk24GpPJ633+D9F0KqrpvhA=;
 h=Date:From:To:Subject:From;
 b=fW/ImJXo7HMHx/dlNrACG2Q3W017SvjQVPhyNAo+j0fT0awszPVWKP/rIPBivCuiz
 /FIafqj3wJxahSQB1nKhRNSLSwa76+BC2I9/j4nfaTwi4v0E73cArMKNxnXzU+2wl5
 Xq/NsosJvifnieka7Zw9HHTV39VMa+5lnGGbc2kKiBb+5VmkrZKWh3rnhpzatW0dZT
 BAQD0iztxpYa7z/64ZSISXNbAEpvOE9or+oVCGig9Qfl11TB2NSPrxiIXIVHkQlU0p
 eIwjLdpnvZyO8bqBQ1Wp3Z5AhAhztpLypitJTXQofYtozdJzXBZeXKeqMiF7RiHSHF
 mRYubEqKJu4hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=fW/ImJXo
Subject: [Buildroot] [PATCH] package/uclibc: add patch for libucontext usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

*ucontext functions are only implemented for a subset of
uClibc supported architectures. To allow the external library
libucontext to be used this small patch is required.
Tested for riscv64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0001-allow-to-use-sys-ucontext.h.patch    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/uclibc/0001-allow-to-use-sys-ucontext.h.patch

diff --git a/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch b/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
new file mode 100644
index 0000000000..b6bd5602d9
--- /dev/null
+++ b/package/uclibc/0001-allow-to-use-sys-ucontext.h.patch
@@ -0,0 +1,35 @@
+From 903da45dde43836e35a295226c5b1efccd413c08 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 17 Jul 2024 15:41:40 +0200
+Subject: [PATCH] allow to use <sys/ucontext.h>
+
+For architectures without ucontext implementation it is possible
+to use libucontext with this small adaptation.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/MZCPGG56TL7SVOZY2L3AGHLREJ76BYZE/
+---
+ include/ucontext.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/ucontext.h b/include/ucontext.h
+index 4ce114ef1..76b4f375e 100644
+--- a/include/ucontext.h
++++ b/include/ucontext.h
+@@ -23,11 +23,11 @@
+ 
+ #include <features.h>
+ 
+-#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
+-
+ /* Get machine dependent definition of data structures.  */
+ #include <sys/ucontext.h>
+ 
++#ifdef __UCLIBC_HAS_CONTEXT_FUNCS__
++
+ __BEGIN_DECLS
+ 
+ /* Get user context and store it in variable pointed to by UCP.  */
+-- 
+2.30.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
