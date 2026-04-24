Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31D4FED3C9
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160F2401E1;
	Fri, 24 Apr 2026 13:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKCqw25ZBIOF; Fri, 24 Apr 2026 13:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 216C640015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777038295;
	bh=sxnrMTG4nwBXD3+tALw8j04mVirGFRsswyWoZi6tjJ4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nPxnHZ3J7gzS9yZBFVonvWgkwVEoV9WUXevWw3O/PoHD7D4OyI9PDEB5v+pE+Wt6E
	 z1YfdDaUAd3cZxuVFgkkvpD70Wd0Is+iUwGe9JRR6h0j0EgIoh/Z58LOXIuuRVupR5
	 8K1cVJHrGFR1jRCzxB3Tlt0qqoqiQETQI2olys2REjYm26rPXul6USfIJXi5nEDKVF
	 9aC8BGYOplELMBt2ZGVPpJIDvJ5NpOF1kZ/m0uASQQ7Z5KPi+xDmjpxrkHZzG5A+pr
	 kmIkpD5nc3/ep1oME1wpGtBB05h24h4tIHqJ+1hiR9cCTwD6340mUtDc8K2wD6jQjx
	 ZTODYjAHMTstw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 216C640015;
	Fri, 24 Apr 2026 13:44:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4B124D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34F561B21
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyIoiAShVh8n for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:44:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4741661B1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4741661B1F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4741661B1F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:44:50 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 457758527; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 24 Apr 2026 13:44:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wGGpo-0000000ELwG-1J3S;
 Fri, 24 Apr 2026 15:44:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:44:42 +0200
Message-ID: <20260424134443.3420911-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=V4LnEv8rIbPBVjO3QwSEKVA/tHZMFNuh3M3AZ+wzEvsacOTzwsJpfwDfz2rLCfAU5bUDw81GW49zobZbqKl2eOboSoPpHDkSgWOK5t0kj+Lj/8T+/9w6FvfmdHK4fxYRk4sGb1oqbgzF9CzdxPuB7OMw0OOgha3CYc9sli1ZAp+FTShwU8vBmh7VBY3AK5sw5OCd0av6nS3mhVnE1NBYMhJ88mZOtbi81lhYg9irzWw2/zve1tIXJl9puDKl/kMGlu3pNaR+Rjbpxolk/9L7sMbw35KU0UeEsCQ4NqaVXEuLzVdhLrMghzDq6MbjWKr/b+JS8rfujoKiwcOu93c5vA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=4xY+fPlPZgexF5dJplzImvQzRHdbDAcWhVEjtPrKx/s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=V4LnEv8r
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH-2025.02.x] package/xz: add upstream security fix
 for CVE-2026-34743
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

CVE-2026-34743: XZ Utils: Buffer overflow in lzma_index_append()

If lzma_index_decoder() was used to decode an Index that contained no
Records, the resulting lzma_index was left in a state where where a
subsequent lzma_index_append() would allocate too little memory, and a
buffer overflow would occur.

The lzma_index functions are rarely used by applications directly.  In the
few applications that do use these functions, the combination of function
calls required to trigger this bug are unlikely to exist, because there
typically is no reason to append Records to a decoded lzma_index.  Thus,
it's likely that this bug cannot be triggered in any real-world application.

This bug is older than xz 5.0.0, so all stable releases are affected.  The
issue has been fixed in XZ Utils 5.8.3 and in the Git repository branch
v5.8.  The fix is also available in the Git repository branches v5.6, v5.4,
and v5.2, but no new releases will be made from these old branches.

https://github.com/tukaani-project/xz/security/advisories/GHSA-x872-m794-cxhv

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 +++++++++++++++++++
 package/xz/xz.mk                              |  3 +
 2 files changed, 69 insertions(+)
 create mode 100644 package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch

diff --git a/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
new file mode 100644
index 0000000000..0555abb3f4
--- /dev/null
+++ b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
@@ -0,0 +1,66 @@
+From 8287299ba858bd7ee767fe6eabcc050574616bf4 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Sun, 29 Mar 2026 19:11:21 +0300
+Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
+
+If lzma_index_decoder() was used to decode an Index that contained no
+Records, the resulting lzma_index had an invalid internal "prealloc"
+value. If lzma_index_append() was called on this lzma_index, too
+little memory would be allocated and a buffer overflow would occur.
+
+While this combination of the API functions is meant to work, in the
+real-world apps this call sequence is rare or might not exist at all.
+
+This bug is older than xz 5.0.0, so all stable releases are affected.
+
+Reported-by: GitHub user christos-spearbit
+(cherry picked from commit c8c22869e780ff57c96b46939c3d79ff99395f87)
+CVE: CVE-2026-34743
+Upstream: https://github.com/tukaani-project/xz/commit/8287299ba858bd7ee767fe6eabcc050574616bf4
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/liblzma/common/index.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
+index 6add6a68..c4aadb9b 100644
+--- a/src/liblzma/common/index.c
++++ b/src/liblzma/common/index.c
+@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
+ 	if (records > PREALLOC_MAX)
+ 		records = PREALLOC_MAX;
+ 
++	// If index_decoder.c calls us with records == 0, it's decoding
++	// an Index that has no Records. In that case the decoder won't call
++	// lzma_index_append() at all, and i->prealloc isn't used during
++	// the Index decoding either.
++	//
++	// Normally the first lzma_index_append() call from the Index decoder
++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
++	// lzma_index_append() isn't called and the resetting of prealloc
++	// won't occur either. Thus, if records == 0, use the default value
++	// INDEX_GROUP_SIZE instead.
++	//
++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
++	// didn't have this check and could set i->prealloc = 0, which would
++	// result in a buffer overflow if the application called
++	// lzma_index_append() after decoding an empty Index. Appending
++	// Records after decoding an Index is a rare thing to do, but
++	// it is supposed to work.
++	if (records == 0)
++		records = INDEX_GROUP_SIZE;
++
+ 	i->prealloc = (size_t)(records);
+ 	return;
+ }
+@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
+ 		++g->last;
+ 	} else {
+ 		// We need to allocate a new group.
++		assert(i->prealloc > 0);
+ 		g = lzma_alloc(sizeof(index_group)
+ 				+ i->prealloc * sizeof(index_record),
+ 				allocator);
+-- 
+2.47.3
+
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 60c2df70ee..d32c6f08f9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -24,6 +24,9 @@ HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
 # 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
 XZ_IGNORE_CVES = CVE-2025-31115
 
+# 0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
+XZ_IGNORE_CVES += CVE-2026-34743
+
 XZ_CONF_OPTS = \
 	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
 	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
