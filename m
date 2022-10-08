Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E5AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Oct 2022 13:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20E6B4109F;
	Sat,  8 Oct 2022 13:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20E6B4109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1W0Ktx3q1Zu; Sat,  8 Oct 2022 13:44:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA732410A7;
	Sat,  8 Oct 2022 13:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA732410A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3E9E1BF3AE
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 13:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D0D9410A7
 for <buildroot@lists.busybox.net>; Sat,  8 Oct 2022 13:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D0D9410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Sw2mUXLfOvL for <buildroot@lists.busybox.net>;
 Sat,  8 Oct 2022 13:44:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5584109F
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE5584109F
 for <buildroot@buildroot.org>; Sat,  8 Oct 2022 13:44:18 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id a2so3743276iln.13
 for <buildroot@buildroot.org>; Sat, 08 Oct 2022 06:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZVxIJs9eZ5ZqsDTrJwbZms0b5LMPtvXRexL1vY42ZIY=;
 b=bohwZXfE98m/N9paxDhM1N22ySwqSkzx2thTwLyajy29LbIUhdh54IsueZHi62Twkn
 fA90OnFwPDIXNqBbzKaIpmvszVOpDwpuvMGRKy8wAzECjIxxcmm5blhq6YTbZe3AVUsP
 BwYYQhTLjgmj4mxmoFzy87F8DXnyvNePVkjj2GZyUa19w/+DwYxNpcIH33b/Hz2MitUu
 p6P6iMPe2deYcfZ+W9HW/i3shPg/nG4vVCnU0hzNuL6Vs7DD86ccc5T4oZ1eGVpgyhh2
 wvcjlCzw8AwN/FTB5EltBtx72TJizSW4jHp3CFrp+l5G6CUJAdhvoT4dvmOfzbasNUth
 Oy7g==
X-Gm-Message-State: ACrzQf0HLkL8oM5WGxRAUp6CNgzsaUmaQcQMFdp6Bbew+ZJVO6ugjup+
 Sb1SkAx7+DRdWAaZyGq/J/e7MF5u1munVQ==
X-Google-Smtp-Source: AMsMyM5zfKpakelqCLUkZ7y28q+DwhwvbH/I+afV0wCDHV9q7URayvYYVD2Q0olhvWASofC70A1b7A==
X-Received: by 2002:a92:c24e:0:b0:2f8:13b3:9f3 with SMTP id
 k14-20020a92c24e000000b002f813b309f3mr4983080ilo.189.1665236657258; 
 Sat, 08 Oct 2022 06:44:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a5-20020a027345000000b003636b73cf29sm2004756jae.8.2022.10.08.06.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 06:44:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Oct 2022 07:44:14 -0600
Message-Id: <20221008134414.1305025-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVxIJs9eZ5ZqsDTrJwbZms0b5LMPtvXRexL1vY42ZIY=;
 b=BrIN9pL9I7nr+kX6JqauoT2Qbb5EuzEpDOaul+EMykdMMrTn0rt/Wm9wIvFZF14Pjo
 W2f+DzVTcjqs8U1N0iTUkirESsIh4g2Z2fcKey1BNgYRN1I3kuuAVCSsEzeCoVDlrzcJ
 oJIgIUEI60dXaCnWsYQ+J/4e9/ErwAu8y8kj0+QU7UalFHgt2JWujepp+8+YOYYSVYKg
 fg2wQb8/J8Px+Wrr2C61y3Pp5/EMaFhbW5CXX+pTbvrZsAS2Dt3k3i2SL2w8EzU6JNC+
 b895ALGMb9tY7XsVvNJoESywaMKT4eTH1rLbQgHjVJnUpXQe5WOVaWUOiSiDiToWRizA
 XeUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BrIN9pL9
Subject: [Buildroot] [PATCH 1/1] package/ocf-linux: fix build with kernels
 up to version 4.14
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

Add patches fixing build on kernels up to version 4.14.

Depend on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 as builds fail on 4.15
and newer currently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cryptodev/Config.in                   |   1 +
 ...gnal.h-include-on-linux-below-4.11.0.patch |  36 +++
 ...functions-on-kernels-4.6.0-and-newer.patch | 222 ++++++++++++++++++
 ...ssing-crypto_alloc_ablkcipher-symbol.patch |  35 +++
 4 files changed, 294 insertions(+)
 create mode 100644 package/ocf-linux/0001-Fix-signal.h-include-on-linux-below-4.11.0.patch
 create mode 100644 package/ocf-linux/0002-Fix-crypto_hash-functions-on-kernels-4.6.0-and-newer.patch
 create mode 100644 package/ocf-linux/0003-Fix-missing-crypto_alloc_ablkcipher-symbol.patch

diff --git a/package/cryptodev/Config.in b/package/cryptodev/Config.in
index d1e64498a8..e243cab6f0 100644
--- a/package/cryptodev/Config.in
+++ b/package/cryptodev/Config.in
@@ -28,6 +28,7 @@ config BR2_PACKAGE_CRYPTODEV_LINUX
 
 config BR2_PACKAGE_OCF_LINUX
 	bool "ocf-linux"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	select BR2_PACKAGE_HAS_CRYPTODEV
 	help
 	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
diff --git a/package/ocf-linux/0001-Fix-signal.h-include-on-linux-below-4.11.0.patch b/package/ocf-linux/0001-Fix-signal.h-include-on-linux-below-4.11.0.patch
new file mode 100644
index 0000000000..2517c19547
--- /dev/null
+++ b/package/ocf-linux/0001-Fix-signal.h-include-on-linux-below-4.11.0.patch
@@ -0,0 +1,36 @@
+From 9e361206c6f0c8e0f62449cdec3b277f96277cd6 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 7 Oct 2022 22:25:37 -0400
+Subject: [PATCH] Fix signal.h include on linux below 4.11.0
+
+The linux/signal.h header was moved to linux/sched/signal.h as
+of linux version 4.11.0.
+
+As such linux/sched/signal.h is not available on linux below 4.11.0.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/ocf-linux/mailman/message/37718258/]
+---
+ ocf/crypto.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ocf/crypto.c b/ocf/crypto.c
+index 4e50328..5691b2a 100644
+--- a/ocf/crypto.c
++++ b/ocf/crypto.c
+@@ -73,7 +73,11 @@ __FBSDID("$FreeBSD: src/sys/opencrypto/crypto.c,v 1.16 2005/01/07 02:29:16 imp E
+ #include <linux/slab.h>
+ #include <linux/wait.h>
+ #include <linux/sched.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(4,11,0)
++#include <linux/signal.h>
++#else
+ #include <linux/sched/signal.h>
++#endif
+ #include <linux/spinlock.h>
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,4)
+ #include <linux/kthread.h>
+-- 
+2.37.3
+
diff --git a/package/ocf-linux/0002-Fix-crypto_hash-functions-on-kernels-4.6.0-and-newer.patch b/package/ocf-linux/0002-Fix-crypto_hash-functions-on-kernels-4.6.0-and-newer.patch
new file mode 100644
index 0000000000..c82a878b21
--- /dev/null
+++ b/package/ocf-linux/0002-Fix-crypto_hash-functions-on-kernels-4.6.0-and-newer.patch
@@ -0,0 +1,222 @@
+From 7dd718b7b6132c2e8e1e685b03c7b10c0658609e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 8 Oct 2022 04:25:00 -0400
+Subject: [PATCH] Fix crypto_hash functions on kernels 4.6.0 and newer
+
+The legacy crypto_hash interface was removed as of kernel version
+4.6.0, adapt this interface to be compatible with the replacement
+crypto_shash interface.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/ocf-linux/mailman/message/37718260/]
+---
+ ocf/cryptosoft.c | 185 +++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 185 insertions(+)
+
+diff --git a/ocf/cryptosoft.c b/ocf/cryptosoft.c
+index caf9c06..d903b6e 100644
+--- a/ocf/cryptosoft.c
++++ b/ocf/cryptosoft.c
+@@ -56,6 +56,9 @@
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,29)
+ #include <crypto/hash.h>
+ #endif
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0)
++#include <linux/highmem.h>
++#endif
+ 
+ #include <cryptodev.h>
+ #include <uio.h>
+@@ -184,6 +187,188 @@ static struct kmem_cache *swcr_req_cache;
+ 	#define crypto_alloc_comp(X, Y, Z)		crypto_alloc_tfm(X, mode)
+ 	#define plain(X)	#X , 0
+ #else
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0)
++	#define hash_desc		shash_desc
++	#define crypto_free_hash	crypto_free_shash
++	#define crypto_hash_tfm		crypto_shash_tfm
++	#define crypto_alloc_hash	crypto_alloc_shash
++	#define crypto_hash_digestsize	crypto_shash_digestsize
++	#define crypto_hash_setkey	crypto_shash_setkey
++	#define crypto_has_hash		crypto_has_ahash
++	#define crypto_hash_cast(X)	container_of(X, struct crypto_shash, base)
++
++struct crypto_hash_walk {
++	char *data;
++
++	unsigned int offset;
++	unsigned int alignmask;
++
++	struct page *pg;
++	unsigned int entrylen;
++
++	unsigned int total;
++	struct scatterlist *sg;
++
++	unsigned int flags;
++};
++
++static int hash_walk_next(struct crypto_hash_walk *walk)
++{
++	unsigned int alignmask = walk->alignmask;
++	unsigned int offset = walk->offset;
++	unsigned int nbytes = min(walk->entrylen,
++				  ((unsigned int)(PAGE_SIZE)) - offset);
++
++	if (walk->flags & CRYPTO_ALG_ASYNC)
++		walk->data = kmap(walk->pg);
++	else
++		walk->data = kmap_atomic(walk->pg);
++	walk->data += offset;
++
++	if (offset & alignmask) {
++		unsigned int unaligned = alignmask + 1 - (offset & alignmask);
++
++		if (nbytes > unaligned)
++			nbytes = unaligned;
++	}
++
++	walk->entrylen -= nbytes;
++	return nbytes;
++}
++
++static int hash_walk_new_entry(struct crypto_hash_walk *walk)
++{
++	struct scatterlist *sg;
++
++	sg = walk->sg;
++	walk->offset = sg->offset;
++	walk->pg = sg_page(walk->sg) + (walk->offset >> PAGE_SHIFT);
++	walk->offset = offset_in_page(walk->offset);
++	walk->entrylen = sg->length;
++
++	if (walk->entrylen > walk->total)
++		walk->entrylen = walk->total;
++	walk->total -= walk->entrylen;
++
++	return hash_walk_next(walk);
++}
++
++static int crypto_hash_walk_first_compat(struct shash_desc *sdesc,
++				  struct crypto_hash_walk *walk,
++				  struct scatterlist *sg, unsigned int len)
++{
++	walk->total = len;
++
++	if (!walk->total) {
++		walk->entrylen = 0;
++		return 0;
++	}
++
++	walk->alignmask = crypto_shash_alignmask(sdesc->tfm);
++	walk->sg = sg;
++	walk->flags = sdesc->flags & CRYPTO_TFM_REQ_MASK;
++
++	return hash_walk_new_entry(walk);
++}
++
++static inline void crypto_yield(u32 flags)
++{
++	if (flags & CRYPTO_TFM_REQ_MAY_SLEEP)
++		cond_resched();
++}
++
++static int crypto_hash_walk_done(struct crypto_hash_walk *walk, int err)
++{
++	unsigned int alignmask = walk->alignmask;
++	unsigned int nbytes = walk->entrylen;
++
++	walk->data -= walk->offset;
++
++	if (nbytes && walk->offset & alignmask && !err) {
++		walk->offset = ALIGN(walk->offset, alignmask + 1);
++		walk->data += walk->offset;
++
++		nbytes = min(nbytes,
++			     ((unsigned int)(PAGE_SIZE)) - walk->offset);
++		walk->entrylen -= nbytes;
++
++		return nbytes;
++	}
++
++	if (walk->flags & CRYPTO_ALG_ASYNC)
++		kunmap(walk->pg);
++	else {
++		kunmap_atomic(walk->data);
++		/*
++		 * The may sleep test only makes sense for sync users.
++		 * Async users don't need to sleep here anyway.
++		 */
++		crypto_yield(walk->flags);
++	}
++
++	if (err)
++		return err;
++
++	if (nbytes) {
++		walk->offset = 0;
++		walk->pg++;
++		return hash_walk_next(walk);
++	}
++
++	if (!walk->total)
++		return 0;
++
++	walk->sg = sg_next(walk->sg);
++
++	return hash_walk_new_entry(walk);
++}
++
++static int shash_compat_update(struct shash_desc *desc, struct scatterlist *sg,
++			       unsigned int len)
++{
++	struct crypto_hash_walk walk;
++	int nbytes;
++
++	for (nbytes = crypto_hash_walk_first_compat(desc, &walk, sg, len);
++	     nbytes > 0; nbytes = crypto_hash_walk_done(&walk, nbytes))
++		nbytes = crypto_shash_update(desc, walk.data, nbytes);
++
++	return nbytes;
++}
++
++static int crypto_hash_digest(struct shash_desc *desc, struct scatterlist *sg,
++			       unsigned int nbytes, u8 *out)
++{
++	unsigned int offset = sg->offset;
++	int err;
++
++	if (nbytes < min(sg->length, ((unsigned int)(PAGE_SIZE)) - offset)) {
++		void *data;
++
++		desc->flags = desc->flags;
++
++		data = kmap_atomic(sg_page(sg));
++		err = crypto_shash_digest(desc, data + offset, nbytes, out);
++		kunmap_atomic(data);
++		crypto_yield(desc->flags);
++		goto out;
++	}
++
++	err = crypto_shash_init(desc);
++	if (err)
++		goto out;
++
++	err = shash_compat_update(desc, sg, nbytes);
++	if (err)
++		goto out;
++
++	err = crypto_shash_final(desc, out);
++
++out:
++	return err;
++}
++
++#endif /* if LINUX_VERSION_CODE >= KERNEL_VERSION(4,6,0) */
+ 	#define ecb(X)	"ecb(" #X ")" , 0
+ 	#define cbc(X)	"cbc(" #X ")" , 0
+ 	#define hmac(X)	"hmac(" #X ")" , 0
+-- 
+2.37.3
+
diff --git a/package/ocf-linux/0003-Fix-missing-crypto_alloc_ablkcipher-symbol.patch b/package/ocf-linux/0003-Fix-missing-crypto_alloc_ablkcipher-symbol.patch
new file mode 100644
index 0000000000..7e420f6747
--- /dev/null
+++ b/package/ocf-linux/0003-Fix-missing-crypto_alloc_ablkcipher-symbol.patch
@@ -0,0 +1,35 @@
+From 3a847686f8a18a50149f2f3d4ed8a661ed507154 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 7 Oct 2022 22:44:58 -0400
+Subject: [PATCH] Fix missing crypto_alloc_ablkcipher symbol
+
+The crypto_alloc_ablkcipher symbol was removed as of linux
+version 4.8.0.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/ocf-linux/mailman/message/37718259/]
+---
+ ocf/cryptosoft.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ocf/cryptosoft.c b/ocf/cryptosoft.c
+index caf9c06..841d41e 100644
+--- a/ocf/cryptosoft.c
++++ b/ocf/cryptosoft.c
+@@ -190,9 +190,11 @@ static struct kmem_cache *swcr_req_cache;
+ 	#define plain(X)	#X , 0
+ #endif /* if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19) */
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,22) || LINUX_VERSION_CODE >= KERNEL_VERSION(4,8,0)
++#define crypto_alloc_ablkcipher(a,b,c)		(NULL)
++#endif
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,22)
+ /* no ablkcipher in older kernels */
+-#define crypto_alloc_ablkcipher(a,b,c)		(NULL)
+ #define crypto_ablkcipher_tfm(x)			((struct crypto_tfm *)(x))
+ #define crypto_ablkcipher_set_flags(a, b)	/* nop */
+ #define crypto_ablkcipher_setkey(x, y, z)	(-EINVAL)
+-- 
+2.37.3
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
