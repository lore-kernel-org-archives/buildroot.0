Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44D1C982E0
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683EB60DA5;
	Fri, 18 Sep 2026 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJqKLpVo3-tC; Fri, 18 Sep 2026 13:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1AE9760DA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736759;
	b=geJhGwCV18WuJOxA27Px5wsm5176pWyPtEdq4gP2421COrWnVA31PCxS7V5dsrAJZlcg
	 DADDoAMQSAyxvquktCAtGP9bYM/valos9/W+9WpXgxLP4LBKW+/vRk7MTyG5ZCY/7nz6w
	 xiNkrjMmn4MJhiLyXKrRZpvSiSTuiH7pl8yN0eteKfk5wc6/+HGwAevuUwoCLPvGMKJWP
	 tj3wRmEVMe5jt2fohqgKiBOsqTN+5ScNlIhyhAmFTgq+vmyCOqrFZy3JTRGasvmfcaETn
	 EIgOqe92trGTDrtbuo1GpRLVvN8ovG7JBeqV6qKk6LQAM1bKRxWOxuDSKFicaIXjFsw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M2lIoOHeOMbNNtn57SHZUvFfXQZegvYZYNDltE+a6Vo=;
	b=KvvrTSx4kKkeliS8LPX8K++XQEDeKe/yEB6qOcLiwgxX+pLlD/vCGHvoZcDu0R79FzFp
	 NagpJ6CzIyRRgl+WADc6CeFm1iEDsrU9cOCYw5H3QbCZe425to5z3hZJDgyrDZ34rUViE
	 boYVunnuN2xiFHxIVfDyNKQVnWtK4HZOg8QYzUAPYKI5nvtaJQgYMum+Ty2lYF7o10El5
	 t7/fbC/lKPAq4VGsSHQYg9vC6J/A2xoQ2vBr8J3F5G/J+TdbnRTu7zWYT7YTH3zgiv2hT
	 8GuQ7edFxYCw/jV+zBFNEJxo2XLJwY7vdaulXLabeJiPDXgZiccY+H6vs8G8p+ZU58g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736759;
	bh=M2lIoOHeOMbNNtn57SHZUvFfXQZegvYZYNDltE+a6Vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G11Mtxfek9S+zJpOSe2eDTOBWdr7KqwzQvWzogBDPxFSuQJhabx5vFg6QNldq+IX7
	 ooEEP/9FQOLJoNxCNVSdwdTlLhqGvrPVKwRiTQIHKye+F9Zn7kS9uGzX+AwoNB96Sb
	 tVtvIeoU+Ohck8+eVcDoBL6M1TscHjLUGLYeN8fEIzSKIiHbIPasH/ptMxg2ghLX9J
	 XffdR5QTRS8iwKiFbOKtZvBFInQ3kPh32n/t1O6akSN6X1e5ibyR1C8FopvNbKaFcg
	 hoYVVBjUtQHIiSF6JmWdLIDO7A93GptkGGz4ztfdk0BU/TJhPxXrP3K3pueUa9sh/z
	 KCNzoRKfxl8HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE9760DA0;
	Fri, 18 Sep 2026 13:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AE8DDC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C8D681283
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KzazRYNPWBMG for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6C94E81293
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=tEU9kVs++twkFDY0a0sR0XH2MA0knepA89ID21FpgYcuqzJjoGQtwADvhdj/kArcbyKM
 wzOw5COiA+LNV6QJJhkYDACThFkSMs1c07TCpjyu4bcZ81h2/vOiexzSu4uDej/n1NkvF
 Wp0Sew2rCdJ6JK41Un35fKScmbUoi0oD6xGyM67Us6GENm1mAMcbHl0uDnTUJckp02fFE
 +MQHhzhiRih+SNJxeMhhcOhsbfV3FRzcBosuhqn8HURgFNXJXeYmY74EHNaAuW1CjOU2y
 051MYfk5LYaVh76AIMad/9vrtBZgQwDbCWtTOy23KwuoQL22SnQO+76Ba0kVI59Mo/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=H80vyD35xZCAlR/lAA4YSurT7yimUss7PRef3XpHzek=;
 b=MIgsdoOrIr3OStGtbgFdwEM5uULk7FAAjQRNiaQVSpwODyt4oAwZPS7DYNq0icSWqjmu
 u7VNIXgRZTms0Y5L3rtX8OrDodLVyb1NJnDhlfBd1+c3Fr4LfPr0NWzWZz7LhTjYIe/6N
 0U3/wKvp05njsKPr+BsQ88x2cskvEDCuPnwH2fPiJCaBkJ/jN7UoatvGL7/lQR1r3QGor
 6hWGM/OmNIWFVal/GT7lALjc6ezCckErNFXjv41BPpl1HWJuDZ+oxu3fMeHcgSvayf7DL
 XaqNevarBRxt0DIwVJaTxfGUlXTC5RmM4KOaX8cYM1zIX/W4tuhszIK5zzeE7BU4IsQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C94E81293
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25A55976A1; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:18:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 110d3ecb810b4a30d8b77ab3936c6de8affa49fe
X-Git-Newrev: 0fe3e2e604c68cc787e5ad8cfa65cfb2664561e4
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.25A55976A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xz: add patch for
 GHSA-5qpq-xqfv-j9pg
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0fe3e2e604c68cc787e5ad8cfa65cfb2664561e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:
XZ Utils: Invalid write if a decoder is reinitialized after allocation failure
See https://github.com/tukaani-project/xz/security/advisories/GHSA-5qpq-xqfv-j9pg

There is still no CVE number assigned to the issue.

(alternative to commit 6f125a653038c9460b515b1f0d4c8c4be37d88c3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...r-init-safe-to-reinit-after-alloc-failure.patch | 31 +++++++
 ...after-a-filter-chain-initialization-error.patch | 97 ++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
new file mode 100644
index 0000000000..0fe4c55c2b
--- /dev/null
+++ b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
@@ -0,0 +1,31 @@
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Wed, 9 Sep 2026 14:14:40 +0300
+Subject: liblzma: Make lzma_lz_decoder_init() safe to reinit after alloc failure
+
+If memory allocation fails and the resulting coder state is reused,
+ensure that memory allocation is attempted again. However, coders that
+are initialized via lzma_next_filter_init() shouldn't be reinitialized
+after failure; they should be cleaned up with lzma_next_end().
+
+Reported-by: GitHub user christos-cantina-security (christos-spearbit)
+(cherry picked from commit fe4d763d566a38ad61d4c5022520c25578a3a464)
+
+---
+Upstream: https://github.com/tukaani-project/xz/commit/0917f6d0f03d9add15dda27e0bf2ebfc22aaf67a
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/liblzma/lz/lz_decoder.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/liblzma/lz/lz_decoder.c b/src/liblzma/lz/lz_decoder.c
+index 92913f225..18669300e 100644
+--- a/src/liblzma/lz/lz_decoder.c
++++ b/src/liblzma/lz/lz_decoder.c
+@@ -276,6 +276,7 @@ lzma_lz_decoder_init(lzma_next_coder *next, const lzma_allocator *allocator,
+ 
+ 	// Allocate and initialize the dictionary.
+ 	if (coder->dict.size != alloc_size) {
++		coder->dict.size = 0;
+ 		lzma_free(coder->dict.buf, allocator);
+ 		coder->dict.buf = lzma_alloc(alloc_size, allocator);
+ 		if (coder->dict.buf == NULL)
diff --git a/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
new file mode 100644
index 0000000000..442d219780
--- /dev/null
+++ b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
@@ -0,0 +1,97 @@
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Wed, 9 Sep 2026 14:14:40 +0300
+Subject: liblzma: Clean up after a filter chain initialization error
+
+Filter coders are initialized using lzma_next_filter_init(). If filter
+chain initialization fails, the entire filter chain should be cleaned up
+with lzma_next_end(). lzma_raw_encoder_init() and lzma_raw_decoder_init()
+have always done this via lzma_raw_coder_init() in filter_common.c.
+(Separate cleanup is weird, but it must have made sense to the young me.)
+
+The following decoders initialize LZMA1 filter directly without using the
+raw filter chain API. This avoids needlessly pulling in all other filters
+when a program is linked against static liblzma. These functions didn't
+call lzma_next_end() after an initialization error, which left the state
+available for later reinitialization.
+
+  - lzma_alone_decoder()
+  - lzma_lzip_decoder()
+  - lzma_auto_decoder() [*]
+  - lzma_microlzma_decoder()
+
+[*] lzma_auto_decoder() is only indirectly affected due to the first two
+    functions. lzma_auto_decoder() itself doesn't need a fix.
+
+There are also encoder functions that initialize the LZMA1 encoder
+directly. They don't have this issue because the whole lzma_stream
+is cleaned up when encoder initialization fails.
+
+Reported-by: GitHub user christos-cantina-security (christos-spearbit)
+(cherry picked from commit e5e63d50eac1b4357a5a7a0abd3c5f99a5c47881)
+
+---
+Upstream: https://github.com/tukaani-project/xz/commit/0130b7524227d0bb9f405ecaf0af632a767fa735
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/liblzma/common/alone_decoder.c     | 8 ++++++--
+ src/liblzma/common/lzip_decoder.c      | 8 ++++++--
+ src/liblzma/common/microlzma_decoder.c | 8 ++++++--
+ 3 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/src/liblzma/common/alone_decoder.c b/src/liblzma/common/alone_decoder.c
+index 78af65157..b2b049b5c 100644
+--- a/src/liblzma/common/alone_decoder.c
++++ b/src/liblzma/common/alone_decoder.c
+@@ -151,8 +151,12 @@ alone_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->next,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(&coder->next,
++				allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->next, allocator);
++			return ret;
++		}
+ 
+ 		coder->sequence = SEQ_CODE;
+ 		break;
+diff --git a/src/liblzma/common/lzip_decoder.c b/src/liblzma/common/lzip_decoder.c
+index 651a0ae71..30c50286d 100644
+--- a/src/liblzma/common/lzip_decoder.c
++++ b/src/liblzma/common/lzip_decoder.c
+@@ -238,8 +238,12 @@ lzip_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->lzma_decoder,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(
++				&coder->lzma_decoder, allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->lzma_decoder, allocator);
++			return ret;
++		}
+ 
+ 		coder->crc32 = 0;
+ 		coder->sequence = SEQ_LZMA_STREAM;
+diff --git a/src/liblzma/common/microlzma_decoder.c b/src/liblzma/common/microlzma_decoder.c
+index 882cb2c80..a7720cc2a 100644
+--- a/src/liblzma/common/microlzma_decoder.c
++++ b/src/liblzma/common/microlzma_decoder.c
+@@ -108,8 +108,12 @@ microlzma_decode(void *coder_ptr, const lzma_allocator *allocator,
+ 			}
+ 		};
+ 
+-		return_if_error(lzma_next_filter_init(&coder->lzma,
+-				allocator, filters));
++		const lzma_ret ret = lzma_next_filter_init(&coder->lzma,
++				allocator, filters);
++		if (ret != LZMA_OK) {
++			lzma_next_end(&coder->lzma, allocator);
++			return ret;
++		}
+ 
+ 		// Pass one dummy 0x00 byte to the LZMA decoder since that
+ 		// is what it expects the first byte to be.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
