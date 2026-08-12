Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362CEC5B572
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 12:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C92CC81066;
	Wed, 12 Aug 2026 12:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgccDWn4yrpn; Wed, 12 Aug 2026 12:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79F2580FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786538096;
	bh=GLvXgeYC/+JEOmuvWeP6Md0DkzGPVlWZqhVz/4wmriw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Eg3gRVx1iFZI5hnIKnYxnKP4bfRAl+7NoHAYnHSaqGmwy+W1IggA6Jhd6jHILyxH7
	 QNJchQmxsZsXGUTO2lgbDBLgcJswjOnObUJUHY5n/H84X5yopEIJNTZ/f/Dxg8pZX8
	 FxBUvp3k+HzDFg6xzs1FJv1tMyN46EcO9MRXL5WsLf+/lue4/70n8vWNslGNJ18YYv
	 Ly8k/p4gr+WpfVFUg/VpOgRpN306hsHlD9gCAROM9xDUNT2QdGwbxaGsO+30TMQJp4
	 FqpN5vuXY8y7dY2emkOfE0nftc3SiKVyUPfkOjiBeKBkPiCJUd6VtcSti0SRhIwQmZ
	 zI99byLk5FH5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79F2580FF3;
	Wed, 12 Aug 2026 12:34:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F8DE1B8
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0606360A42
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoxYN1kpfhIY for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 12:34:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6332F608F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6332F608F4
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6332F608F4
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 12:34:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so6365895e9.2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786538091; x=1787142891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YfD5LulpM5MRbpS7twYVpBPvyVKkgHJSFWqEhkMQZL8=;
 b=dafzE5aVVlHenIgn6DksYXSfkeFWeD2Ys0iUSXjq7QkWtqUWHNsmhyogi24xmx/bTc
 LvsC6fCZJZ8EfJ4yFeEykaimNiMY34XZxA1KgHlojU2TBL0oJXX5SWWLUWwaxmwxfmEp
 Y6lRflOz2sfuJ2rnkskR+OF4ihXfXCp2u83EisDy6NljttVxvTmaYPtuC5gRr4kMNAK8
 BWI3X9juKOD++2ubfZtH28z4FgIHwdM+VLF2Tg7JyD3KT2FYKTsTxXeE8Ns6dBZdK7E9
 BOzf2LUMyJI7S4r8MeukcH8rtrsLZTU7ivqAPwQemGEr+vLGnqgXaLTs+io+W8BlLtNr
 Sxzw==
X-Gm-Message-State: AOJu0YyghazIdmwwq7OFEMLxE5Nsu/r1jMRJJNPqqTup0KQEc1QCfUaU
 e5CRBJB+hjvEwYMFhq0x12CvHrglez0AwKR3n5L8eHPN0GJ9/OeZREIG+H0cMDem5o+hsxiNQZ8
 tlXmU
X-Gm-Gg: AR+sD11IEeGHn3oYUWMvq9g3ZlN0uqUSjZXeM/ecSPpRXFgnmGnHUi7uVvUukBDDGrW
 eJhqdpd5SsSBQiEtcPd58fmR/MdN69r2KT+FEmOAOKlVgxzr7Xxlk98iSgHrC+/4EfbgES873VJ
 /QFUaJEgb/nM4o0Uop+GO4dlRqIjTJ6dooflFVda/wK+0SC8uE0/2shu5j65p5+BpeOgTvf9I5i
 zBjCz4W2aBUOBqgTJNtiGX1bONmz/nz4YxJejnAVPkiQ6zKAcPyyANe9lNK+29LECx6TcPMHHdz
 CnHU9uP/M+9wrK4FsK9CSSufCKDl+4qqp3FXg7EBFId9hNkQmZA48GHqFLw21EN/42B1fZF3XVR
 Wpo9DNebOoPYUshg6Z5SeS1m3OOMKFwHAZF0HTyRPNnPgktgthjZvC7oT7NPBXy1etcVC8eIIhp
 vKiKg6r0FUdlFJzFVbbaXwcXITRWFkUw+WPim44t5ilddhgLVHeJyy
X-Received: by 2002:a05:600c:4fc5:b0:499:49f3:77b1 with SMTP id
 5b1f17b1804b1-4997c0b8977mr49861145e9.3.1786538090741; 
 Wed, 12 Aug 2026 05:34:50 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c98d264sm51104445e9.9.2026.08.12.05.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 05:34:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 12 Aug 2026 14:34:48 +0200
Message-ID: <20260812123448.177523-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786538091; x=1787142891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YfD5LulpM5MRbpS7twYVpBPvyVKkgHJSFWqEhkMQZL8=;
 b=cbbMkCDeQgVJGVTIufDs4+ZGS4T5dHniFVUXrVNSg7yIXqNeNOTTEkiSt98s+gideC
 hK2RccodkfhgQ8x8hJ2VmmGwMxBBrKhbMa0jOj1XcQOvE6Uz7r0Tdxx8lxxQbu/fk1kA
 2zhbdCJYuu5ANcHVzyCem4Dzugl2PhNtVXvf0PIIcVrJY/R3Bu1mw0nOZGiIuQK2v1Bx
 Kl8i8vFP2gWLb6/Q2LxR9av4wxV6RMSZDb/xq/YPQtMe1NLNt4qvmr7D6j4cn9X7u0ia
 /s9Ox5wWV8bUD2Mv+XczgdyReUOXugG38k1BGZCYn02z02WdbunijMc23ZRe48MlDtRr
 Fe7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cbbMkCDe
Subject: [Buildroot] [PATCH 2025.02.x] package/util-linux: backport patch
 CVE-2026-13595
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

- CVE-2026-13595:
    A flaw was found in the libblkid library of util-linux. During nested
    partition probing, the BSD, Minix, Solaris x86, and UnixWare partition
    probers cache a raw pointer to a parent partition entry in a
    dynamically allocated array. When subsequent partition additions cause
    the array to be reallocated, this pointer becomes stale, leading to a
    heap use-after-free read. An attacker who can present a crafted block
    device image (for example, via USB insertion or a loop-mounted disk
    image) can trigger this flaw without user interaction, as libblkid is
    invoked automatically by udev/udisks as root on block-device hot-plug
    events. This could lead to limited information disclosure or denial of
    service.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-13595
 - https://github.com/util-linux/util-linux/commit/c0186f14fbdb02f64c8e0ba701ce727ea764ff4c

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/0015-CVE-2026-13595.patch | 145 +++++++++++++++++++
 package/util-linux/util-linux.mk             |   3 +
 2 files changed, 148 insertions(+)
 create mode 100644 package/util-linux/0015-CVE-2026-13595.patch

diff --git a/package/util-linux/0015-CVE-2026-13595.patch b/package/util-linux/0015-CVE-2026-13595.patch
new file mode 100644
index 0000000000..7547a20137
--- /dev/null
+++ b/package/util-linux/0015-CVE-2026-13595.patch
@@ -0,0 +1,145 @@
+From c0186f14fbdb02f64c8e0ba701ce727ea764ff4c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 7 May 2026 12:50:48 +0200
+Subject: [PATCH] libblkid: fix use-after-free in nested partition probing
+
+The partitions list stores partitions in a contiguous array grown by
+reallocarray(). When the array is reallocated to a new address, all
+existing blkid_partition pointers (tab->parent, ls->next_parent, local
+parent variables in nested probers) become dangling.
+
+Fix this by changing the storage from an array of structs to an array
+of pointers, where each partition is individually allocated via
+calloc(). This makes all blkid_partition pointers stable across
+reallocations -- only the pointer array itself may move, which is
+harmless since no code caches pointers into the pointer array.
+
+This eliminates the need for callers to re-fetch parent pointers after
+every blkid_partlist_add_partition() call.
+
+Reported-by: Thai Duong <thaidn@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+CVE: CVE-2026-13595
+Upstream: https://github.com/util-linux/util-linux/commit/c0186f14fbdb02f64c8e0ba701ce727ea764ff4c
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libblkid/src/partitions/partitions.c | 34 +++++++++++++++++-----------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/libblkid/src/partitions/partitions.c b/libblkid/src/partitions/partitions.c
+index f95fe898f33..a428c6d6c16 100644
+--- a/libblkid/src/partitions/partitions.c
++++ b/libblkid/src/partitions/partitions.c
+@@ -197,7 +197,7 @@ struct blkid_struct_partlist {
+ 
+ 	int		nparts;		/* number of partitions */
+ 	int		nparts_max;	/* max.number of partitions */
+-	blkid_partition	parts;		/* array of partitions */
++	blkid_partition	*parts;		/* array of pointers to partitions */
+ 
+ 	struct list_head l_tabs;	/* list of partition tables */
+ };
+@@ -356,13 +356,16 @@ static void reset_partlist(blkid_partlist ls)
+ 	free_parttables(ls);
+ 
+ 	if (ls->next_partno) {
+-		/* already initialized - reset */
+-		int tmp_nparts = ls->nparts_max;
+-		blkid_partition tmp_parts = ls->parts;
++		/* already initialized - free individually allocated partitions */
++		int i, tmp_nparts_max = ls->nparts_max;
++		blkid_partition *tmp_parts = ls->parts;
++
++		for (i = 0; i < ls->nparts; i++)
++			free(ls->parts[i]);
+ 
+ 		memset(ls, 0, sizeof(struct blkid_struct_partlist));
+ 
+-		ls->nparts_max = tmp_nparts;
++		ls->nparts_max = tmp_nparts_max;
+ 		ls->parts = tmp_parts;
+ 	}
+ 
+@@ -397,6 +400,7 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 				 void *data)
+ {
+ 	blkid_partlist ls = (blkid_partlist) data;
++	int i;
+ 
+ 	if (!ls)
+ 		return;
+@@ -404,6 +408,8 @@ static void partitions_free_data(blkid_probe pr __attribute__((__unused__)),
+ 	free_parttables(ls);
+ 
+ 	/* deallocate partitions and partlist */
++	for (i = 0; i < ls->nparts; i++)
++		free(ls->parts[i]);
+ 	free(ls->parts);
+ 	free(ls);
+ }
+@@ -437,15 +443,17 @@ static blkid_partition new_partition(blkid_partlist ls, blkid_parttable tab)
+ 		 * generic Linux machine -- let start with 32 partitions.
+ 		 */
+ 		void *tmp = reallocarray(ls->parts, ls->nparts_max + 32,
+-					 sizeof(struct blkid_struct_partition));
++					 sizeof(blkid_partition));
+ 		if (!tmp)
+ 			return NULL;
+ 		ls->parts = tmp;
+ 		ls->nparts_max += 32;
+ 	}
+ 
+-	par = &ls->parts[ls->nparts++];
+-	memset(par, 0, sizeof(struct blkid_struct_partition));
++	par = calloc(1, sizeof(struct blkid_struct_partition));
++	if (!par)
++		return NULL;
++	ls->parts[ls->nparts++] = par;
+ 
+ 	ref_parttable(tab);
+ 	par->tab = tab;
+@@ -850,7 +858,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the partition table fits into the device */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (par->start + par->size > (pr->size >> 9)) {
+ 			DBG(LOWPROBE, ul_debug("partition #%d overflows "
+@@ -862,7 +870,7 @@ int blkid_probe_is_covered_by_pt(blkid_probe pr,
+ 
+ 	/* check if the requested area is covered by PT */
+ 	for (i = 0; i < nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if (start >= par->start && end <= par->start + par->size) {
+ 			rc = 1;
+@@ -961,7 +969,7 @@ blkid_partition blkid_partlist_get_partition(blkid_partlist ls, int n)
+ 	if (n < 0 || n >= ls->nparts)
+ 		return NULL;
+ 
+-	return &ls->parts[n];
++	return ls->parts[n];
+ }
+ 
+ blkid_partition blkid_partlist_get_partition_by_start(blkid_partlist ls, uint64_t start)
+@@ -1073,7 +1081,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
+ 		 * and an entry in partition table.
+ 		 */
+ 		 for (i = 0; i < ls->nparts; i++) {
+-			 blkid_partition par = &ls->parts[i];
++			 blkid_partition par = ls->parts[i];
+ 
+ 			 if (partno != blkid_partition_get_partno(par))
+ 				 continue;
+@@ -1089,7 +1097,7 @@ blkid_partition blkid_partlist_devno_to_partition(blkid_partlist ls, dev_t devno
+ 	DBG(LOWPROBE, ul_debug("searching by offset/size"));
+ 
+ 	for (i = 0; i < ls->nparts; i++) {
+-		blkid_partition par = &ls->parts[i];
++		blkid_partition par = ls->parts[i];
+ 
+ 		if ((uint64_t)blkid_partition_get_start(par) == start &&
+ 		    (uint64_t)blkid_partition_get_size(par) == size)
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index b5364b710b..9e56894611 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -54,6 +54,9 @@ UTIL_LINUX_IGNORE_CVES += CVE-2026-53613
 # 0013-CVE-2026-53614.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-53614
 
+# 0015-CVE-2026-13595.patch
+UTIL_LINUX_IGNORE_CVES += CVE-2026-13595
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
