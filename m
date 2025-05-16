Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1FBC54754
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E1241772;
	Fri, 16 May 2025 17:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0uNXj_Et0fE; Fri, 16 May 2025 17:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BABC41742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BABC41742;
	Fri, 16 May 2025 17:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59E2013D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5372640853
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK4aaHWCHedS for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91297407D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91297407D0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91297407D0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F8BE1C0E0E; Fri, 16 May 2025 19:59:26 +0200 (CEST)
Message-ID: <bfbcec39-2131-4257-8da6-874a687007cd@rnout.be>
Date: Fri, 16 May 2025 13:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250509191040.253049-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509191040.253049-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418366; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Gd8pnQ+7L+QAsMDVspXx8cwHIXIGLvpL7qbY2krTKDM=;
 b=jHWhTG/V7sc0DqYkIuvRFB5FphoiSHVCQ9IwL0kw+D2qVfrWkXLXsPP88cQLvmi+VEbGXm
 3WzVpRafoYhDpkvvRoMD0prHxMxD5MWvLdrDDSJbtUPMQg2PuvbwFtJNKHnF6DidMopJjT
 gk6ti7PWIwml4zVnM5Zje3xzl4ly+tpA6QCQQmCf+Y8rzdJqBxH1vELxsIwthkiV25/qya
 Gd5/3fPkCInvZQLfYYiyaDwZSw2Wqby/mfNIznP14Q9t1yDQAuu+4r60XKa5vTetWOGuNh
 vsB/oz9qcvJvRPc8Wmnhhvn9PI9O/f/YcWbsjmkuyb88zd2cLIY98Pxm6yRdeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=jHWhTG/V
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: add security patches fixing
 CVE-2025-31115
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2025 21:10, Julien Olivain wrote:
> This commit adds four upstream patches fixing the CVE-2025-31115
> vulnerability. The reason there is four patches instead of one is to
> exactly follow the advisory recommendation [1], which proposes the
> patch [2]. This patch is in fact a concatenation of four commits. In
> Buildroot, we track package patches as formatted by git, with extra
> "Upstream:" headers. The patch [2] was split here in four for a
> clearer traceability.
> 
> With the addition of those patches, the XZ_IGNORE_CVES is set
> accordingly.
> 
> Fixes:
> https://www.cve.org/CVERecord?id=CVE-2025-31115
> 
> [1] https://github.com/tukaani-project/xz/security/advisories/GHSA-6cc8-p5mm-29w2
> [2] https://tukaani.org/xz/xz-cve-2025-31115.patch
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9989403875
> 
> Note: I am aware that another security bump was proposed in:
> https://patchwork.ozlabs.org/project/buildroot/patch/20250501092633.84651-1-kadambini.nema@gmail.com/
> This proposal is including both the major version bump (from 5.6.4 to
> 5.8.1) and the CVE-2025-31115 security fix. This makes LTS branch
> maintenance harder.
> 
> I propose this patch instead to help the LTS branches. The 5.8.1
> bump can be applied right after.
> ---
>   .../0001-liblzma-mt-dec-Fix-a-comment.patch   |  29 ++++
>   ...implify-by-removing-the-THR_STOP-sta.patch | 152 ++++++++++++++++++
>   ...on-t-free-the-input-buffer-too-early.patch |  98 +++++++++++
>   ...on-t-modify-thr-in_size-in-the-worke.patch |  56 +++++++
>   package/xz/xz.mk                              |   6 +
>   5 files changed, 341 insertions(+)
>   create mode 100644 package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
>   create mode 100644 package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
>   create mode 100644 package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
>   create mode 100644 package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> 
> diff --git a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
> new file mode 100644
> index 0000000000..2424fb0d13
> --- /dev/null
> +++ b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
> @@ -0,0 +1,29 @@
> +From 9f508dead050cd51f53aff3807c7319e2e6773cf Mon Sep 17 00:00:00 2001
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Thu, 3 Apr 2025 14:34:42 +0300
> +Subject: [PATCH] liblzma: mt dec: Fix a comment
> +
> +Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +Thanks-to: Sam James <sam@gentoo.org>
> +Upstream: https://github.com/tukaani-project/xz/commit/831b55b971cf579ee16a854f177c36b20d3c6999
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + src/liblzma/common/stream_decoder_mt.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
> +index 244624a4..6f06f1d1 100644
> +--- a/src/liblzma/common/stream_decoder_mt.c
> ++++ b/src/liblzma/common/stream_decoder_mt.c
> +@@ -347,7 +347,7 @@ worker_enable_partial_update(void *thr_ptr)
> +
> +
> + /// Things do to at THR_STOP or when finishing a Block.
> +-/// This is called with thr->mutex locked.
> ++/// This is called with thr->coder->mutex locked.
> + static void
> + worker_stop(struct worker_thread *thr)
> + {
> +--
> +2.49.0
> +
> diff --git a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> new file mode 100644
> index 0000000000..7845380a8c
> --- /dev/null
> +++ b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> @@ -0,0 +1,152 @@
> +From b336944f3a6af4cbd5cf57aa00ef16d30c4ff773 Mon Sep 17 00:00:00 2001
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Thu, 3 Apr 2025 14:34:42 +0300
> +Subject: [PATCH] liblzma: mt dec: Simplify by removing the THR_STOP state
> +
> +The main thread can directly set THR_IDLE in threads_stop() which is
> +called when errors are detected. threads_stop() won't return the stopped
> +threads to the pool or free the memory pointed by thr->in anymore, but
> +it doesn't matter because the existing workers won't be reused after
> +an error. The resources will be cleaned up when threads_end() is
> +called (reinitializing the decoder always calls threads_end()).
> +
> +Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +Thanks-to: Sam James <sam@gentoo.org>
> +Upstream: https://github.com/tukaani-project/xz/commit/c0c835964dfaeb2513a3c0bdb642105152fe9f34
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + src/liblzma/common/stream_decoder_mt.c | 75 ++++++++++----------------
> + 1 file changed, 29 insertions(+), 46 deletions(-)
> +
> +diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
> +index 6f06f1d1..e1d07007 100644
> +--- a/src/liblzma/common/stream_decoder_mt.c
> ++++ b/src/liblzma/common/stream_decoder_mt.c
> +@@ -23,15 +23,10 @@ typedef enum {
> + 	THR_IDLE,
> +
> + 	/// Decoding is in progress.
> +-	/// Main thread may change this to THR_STOP or THR_EXIT.
> ++	/// Main thread may change this to THR_IDLE or THR_EXIT.
> + 	/// The worker thread may change this to THR_IDLE.
> + 	THR_RUN,
> +
> +-	/// The main thread wants the thread to stop whatever it was doing
> +-	/// but not exit. Main thread may change this to THR_EXIT.
> +-	/// The worker thread may change this to THR_IDLE.
> +-	THR_STOP,
> +-
> + 	/// The main thread wants the thread to exit.
> + 	THR_EXIT,
> +
> +@@ -346,27 +341,6 @@ worker_enable_partial_update(void *thr_ptr)
> + }
> +
> +
> +-/// Things do to at THR_STOP or when finishing a Block.
> +-/// This is called with thr->coder->mutex locked.
> +-static void
> +-worker_stop(struct worker_thread *thr)
> +-{
> +-	// Update memory usage counters.
> +-	thr->coder->mem_in_use -= thr->in_size;
> +-	thr->in_size = 0; // thr->in was freed above.
> +-
> +-	thr->coder->mem_in_use -= thr->mem_filters;
> +-	thr->coder->mem_cached += thr->mem_filters;
> +-
> +-	// Put this thread to the stack of free threads.
> +-	thr->next = thr->coder->threads_free;
> +-	thr->coder->threads_free = thr;
> +-
> +-	mythread_cond_signal(&thr->coder->cond);
> +-	return;
> +-}
> +-
> +-
> + static MYTHREAD_RET_TYPE
> + worker_decoder(void *thr_ptr)
> + {
> +@@ -397,17 +371,6 @@ next_loop_unlocked:
> + 		return MYTHREAD_RET_VALUE;
> + 	}
> +
> +-	if (thr->state == THR_STOP) {
> +-		thr->state = THR_IDLE;
> +-		mythread_mutex_unlock(&thr->mutex);
> +-
> +-		mythread_sync(thr->coder->mutex) {
> +-			worker_stop(thr);
> +-		}
> +-
> +-		goto next_loop_lock;
> +-	}
> +-
> + 	assert(thr->state == THR_RUN);
> +
> + 	// Update progress info for get_progress().
> +@@ -510,7 +473,22 @@ next_loop_unlocked:
> + 				&& thr->coder->thread_error == LZMA_OK)
> + 			thr->coder->thread_error = ret;
> +
> +-		worker_stop(thr);
> ++		// Return the worker thread to the stack of available
> ++		// threads.
> ++		{
> ++			// Update memory usage counters.
> ++			thr->coder->mem_in_use -= thr->in_size;
> ++			thr->in_size = 0; // thr->in was freed above.
> ++
> ++			thr->coder->mem_in_use -= thr->mem_filters;
> ++			thr->coder->mem_cached += thr->mem_filters;
> ++
> ++			// Put this thread to the stack of free threads.
> ++			thr->next = thr->coder->threads_free;
> ++			thr->coder->threads_free = thr;
> ++		}
> ++
> ++		mythread_cond_signal(&thr->coder->cond);
> + 	}
> +
> + 	goto next_loop_lock;
> +@@ -544,17 +522,22 @@ threads_end(struct lzma_stream_coder *coder, const lzma_allocator *allocator)
> + }
> +
> +
> ++/// Tell worker threads to stop without doing any cleaning up.
> ++/// The clean up will be done when threads_exit() is called;
> ++/// it's not possible to reuse the threads after threads_stop().
> ++///
> ++/// This is called before returning an unrecoverable error code
> ++/// to the application. It would be waste of processor time
> ++/// to keep the threads running in such a situation.
> + static void
> + threads_stop(struct lzma_stream_coder *coder)
> + {
> + 	for (uint32_t i = 0; i < coder->threads_initialized; ++i) {
> ++		// The threads that are in the THR_RUN state will stop
> ++		// when they check the state the next time. There's no
> ++		// need to signal coder->threads[i].cond.
> + 		mythread_sync(coder->threads[i].mutex) {
> +-			// The state must be changed conditionally because
> +-			// THR_IDLE -> THR_STOP is not a valid state change.
> +-			if (coder->threads[i].state != THR_IDLE) {
> +-				coder->threads[i].state = THR_STOP;
> +-				mythread_cond_signal(&coder->threads[i].cond);
> +-			}
> ++			coder->threads[i].state = THR_IDLE;
> + 		}
> + 	}
> +
> +@@ -1948,7 +1931,7 @@ stream_decoder_mt_init(lzma_next_coder *next, const lzma_allocator *allocator,
> + 	// accounting from scratch, too. Changes in filter and block sizes may
> + 	// affect number of threads.
> + 	//
> +-	// FIXME? Reusing should be easy but unlike the single-threaded
> ++	// Reusing threads doesn't seem worth it. Unlike the single-threaded
> + 	// decoder, with some types of input file combinations reusing
> + 	// could leave quite a lot of memory allocated but unused (first
> + 	// file could allocate a lot, the next files could use fewer
> +--
> +2.49.0
> +
> diff --git a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> new file mode 100644
> index 0000000000..9915e6b275
> --- /dev/null
> +++ b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> @@ -0,0 +1,98 @@
> +From fb6110f90e28c43261cc8c290f99b19c9f01a15c Mon Sep 17 00:00:00 2001
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Thu, 3 Apr 2025 14:34:42 +0300
> +Subject: [PATCH] liblzma: mt dec: Don't free the input buffer too early
> + (CVE-2025-31115)
> +
> +The input buffer must be valid as long as the main thread is writing
> +to the worker-specific input buffer. Fix it by making the worker
> +thread not free the buffer on errors and not return the worker thread to
> +the pool. The input buffer will be freed when threads_end() is called.
> +
> +With invalid input, the bug could at least result in a crash. The
> +effects include heap use after free and writing to an address based
> +on the null pointer plus an offset.
> +
> +The bug has been there since the first committed version of the threaded
> +decoder and thus affects versions from 5.3.3alpha to 5.8.0.
> +
> +As the commit message in 4cce3e27f529 says, I had made significant
> +changes on top of Sebastian's patch. This bug was indeed introduced
> +by my changes; it wasn't in Sebastian's version.
> +
> +Thanks to Harri K. Koskinen for discovering and reporting this issue.
> +
> +Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
> +Reported-by: Harri K. Koskinen <x64nop@nannu.org>
> +Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +Thanks-to: Sam James <sam@gentoo.org>
> +Upstream: https://github.com/tukaani-project/xz/commit/d5a2ffe41bb77b918a8c96084885d4dbe4bf6480
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + src/liblzma/common/stream_decoder_mt.c | 31 ++++++++++++++++++--------
> + 1 file changed, 22 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
> +index e1d07007..ce5e54ac 100644
> +--- a/src/liblzma/common/stream_decoder_mt.c
> ++++ b/src/liblzma/common/stream_decoder_mt.c
> +@@ -435,8 +435,7 @@ next_loop_unlocked:
> + 	}
> +
> + 	// Either we finished successfully (LZMA_STREAM_END) or an error
> +-	// occurred. Both cases are handled almost identically. The error
> +-	// case requires updating thr->coder->thread_error.
> ++	// occurred.
> + 	//
> + 	// The sizes are in the Block Header and the Block decoder
> + 	// checks that they match, thus we know these:
> +@@ -444,16 +443,30 @@ next_loop_unlocked:
> + 	assert(ret != LZMA_STREAM_END
> + 		|| thr->out_pos == thr->block_options.uncompressed_size);
> +
> +-	// Free the input buffer. Don't update in_size as we need
> +-	// it later to update thr->coder->mem_in_use.
> +-	lzma_free(thr->in, thr->allocator);
> +-	thr->in = NULL;
> +-
> + 	mythread_sync(thr->mutex) {
> ++		// Block decoder ensures this, but do a sanity check anyway
> ++		// because thr->in_filled < thr->in_size means that the main
> ++		// thread is still writing to thr->in.
> ++		if (ret == LZMA_STREAM_END && thr->in_filled != thr->in_size) {
> ++			assert(0);
> ++			ret = LZMA_PROG_ERROR;
> ++		}
> ++
> + 		if (thr->state != THR_EXIT)
> + 			thr->state = THR_IDLE;
> + 	}
> +
> ++	// Free the input buffer. Don't update in_size as we need
> ++	// it later to update thr->coder->mem_in_use.
> ++	//
> ++	// This step is skipped if an error occurred because the main thread
> ++	// might still be writing to thr->in. The memory will be freed after
> ++	// threads_end() sets thr->state = THR_EXIT.
> ++	if (ret == LZMA_STREAM_END) {
> ++		lzma_free(thr->in, thr->allocator);
> ++		thr->in = NULL;
> ++	}
> ++
> + 	mythread_sync(thr->coder->mutex) {
> + 		// Move our progress info to the main thread.
> + 		thr->coder->progress_in += thr->in_pos;
> +@@ -474,8 +487,8 @@ next_loop_unlocked:
> + 			thr->coder->thread_error = ret;
> +
> + 		// Return the worker thread to the stack of available
> +-		// threads.
> +-		{
> ++		// threads only if no errors occurred.
> ++		if (ret == LZMA_STREAM_END) {
> + 			// Update memory usage counters.
> + 			thr->coder->mem_in_use -= thr->in_size;
> + 			thr->in_size = 0; // thr->in was freed above.
> +--
> +2.49.0
> +
> diff --git a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> new file mode 100644
> index 0000000000..1a914e08db
> --- /dev/null
> +++ b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> @@ -0,0 +1,56 @@
> +From c5c6a429bf3df0558ab88704eee7eb08287406dd Mon Sep 17 00:00:00 2001
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Thu, 3 Apr 2025 14:34:42 +0300
> +Subject: [PATCH] liblzma: mt dec: Don't modify thr->in_size in the worker
> + thread
> +
> +Don't set thr->in_size = 0 when returning the thread to the stack of
> +available threads. Not only is it useless, but the main thread may
> +read the value in SEQ_BLOCK_THR_RUN. With valid inputs, it made
> +no difference if the main thread saw the original value or 0. With
> +invalid inputs (when worker thread stops early), thr->in_size was
> +no longer modified after the previous commit with the security fix
> +("Don't free the input buffer too early").
> +
> +So while the bug appears harmless now, it's important to fix it because
> +the variable was being modified without proper locking. It's trivial
> +to fix because there is no need to change the value. Only main thread
> +needs to set the value in (in SEQ_BLOCK_THR_INIT) when starting a new
> +Block before the worker thread is activated.
> +
> +Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
> +Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +Thanks-to: Sam James <sam@gentoo.org>
> +Upstream: https://github.com/tukaani-project/xz/commit/8188048854e8d11071b8a50d093c74f4c030acc9
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
> +---
> + src/liblzma/common/stream_decoder_mt.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/liblzma/common/stream_decoder_mt.c b/src/liblzma/common/stream_decoder_mt.c
> +index ce5e54ac..0cdb47d3 100644
> +--- a/src/liblzma/common/stream_decoder_mt.c
> ++++ b/src/liblzma/common/stream_decoder_mt.c
> +@@ -491,8 +491,6 @@ next_loop_unlocked:
> + 		if (ret == LZMA_STREAM_END) {
> + 			// Update memory usage counters.
> + 			thr->coder->mem_in_use -= thr->in_size;
> +-			thr->in_size = 0; // thr->in was freed above.
> +-
> + 			thr->coder->mem_in_use -= thr->mem_filters;
> + 			thr->coder->mem_cached += thr->mem_filters;
> +
> +@@ -1557,6 +1555,10 @@ stream_decode_mt(void *coder_ptr, const lzma_allocator *allocator,
> + 		}
> +
> + 		// Return if the input didn't contain the whole Block.
> ++		//
> ++		// NOTE: When we updated coder->thr->in_filled a few lines
> ++		// above, the worker thread might by now have finished its
> ++		// work and returned itself back to the stack of free threads.
> + 		if (coder->thr->in_filled < coder->thr->in_size) {
> + 			assert(*in_pos == in_size);
> + 			return LZMA_OK;
> +--
> +2.49.0
> +
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 4a54f93a76..60c2df70ee 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -18,6 +18,12 @@ XZ_AUTORECONF = YES
>   # The package is a dependency to ccache so ccache cannot be a dependency
>   HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
>   
> +# 0001-liblzma-mt-dec-Fix-a-comment.patch
> +# 0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> +# 0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> +# 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> +XZ_IGNORE_CVES = CVE-2025-31115
> +
>   XZ_CONF_OPTS = \
>   	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
>   	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
