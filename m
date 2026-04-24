Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65462FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E92B84D6A;
	Fri, 24 Apr 2026 16:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_2-FFQsvYPw; Fri, 24 Apr 2026 16:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F7F84D6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048430;
	bh=JqCLe0Unmo4dpjfuRSXHdjBnPb7BvNEJuzWO1JCNv2g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bTSnctZPxSxp44+OJBUciFFeWiTQPHDNVa4XZftQUX0y69LuONSXGOR7HUtB4L7ss
	 K8uNvdzHpvksmtmMJOl8MykWjcSIr10G4MbfatXeNLJ4A4GppYAZuFb2f94EajGrEH
	 1XU6RPW7rs0qHcKokklzYF2K9AuxZMMtx/myw4to7MrjVev05INdN2B38RRDTaemKe
	 VsQ27tgSevdu0Tt4aBN4uXXJtq7T0VJGh1GbgokbOCZ0ZAZrXOCeAeso+y843bsiog
	 wh659ccYyG9q1OxkNfNyZm1CNsfoXukoHEA2+JCfsZDflT3i8R8u2Z6IljWxDFdfYj
	 bdhz69Zw1ymew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44F7F84D6B;
	Fri, 24 Apr 2026 16:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1AC206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B0C261C33
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXRotFHVZuNx for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06BBA61C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06BBA61C32
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06BBA61C32
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:33:47 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488d2079582so94033265e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048426; x=1777653226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5wKVenRKLQoWOUipgFvma2Ri+aVeaWdiFyuJMZ9fqFo=;
 b=nDtova7JKxnNFIKGh709uyoIVtXhaYxnlZsV1yvBLC7MfAfk9pEy+ZU9m+WRo9Cb0i
 DUwW8x2aAY5lxxDr71xHODzvzdfuLOJuWbcW5qGAsLVC9vLHTeFi0l1w+4bafmF4ULLN
 1v0VvMgYv0EI7xtUTE1uUuUAwIaK0HVh8PtEERPll2i3Q3Fw4MvTetYDXez+z2fo149K
 L/WsWOY+J7gUrjjQnMCjbApzvjCG6oE9Dp/BfxyS7fX1N36zc2wR3B9Ke+0VALBW3TnE
 AppxCB4RqllkwMUltQeIfe4KLkm/nbj3AUGFbqMeYlmpx6tSnd2ds5H2LI+NGX3NqkY3
 7kuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ88bJkUjKuEf+qch0z7aKEKGVEtISBPuJm/uMssApFIG/FyCTaC07b1uRr9YNkBd3qFxy49iBJtXAI=@buildroot.org
X-Gm-Message-State: AOJu0YwjU5cqnR1CiLDf39xhRMbeDW5iJVxHrhHSwBxg/F2Z2+0xLYL1
 XHWL1LzhFXu54Iss9R6D/BNEcfbUiRneB8p/ML3vcsLpW35MAfenanvgFrCuHZhf9oq5AQHPNMJ
 1rDgR
X-Gm-Gg: AeBDiesPbOFqdgmCt0GcPs1dMOKamp2G1v7Eu6hwHtCvEkncqd3z6p3Odgokkl91WfZ
 9RWbwn3tI5uPckKa+Si6sgGihVD7A1qMO/xPzcd/ekNWtXHib5XjIQakVBnfn5sBcs/K17pLNOz
 yVthKayO376m/jb3ZiZ7Xy83yN0OLLG0lppFbszNtobbpyM5lmk3gnSADdwJG29zl/hMyjWi2bS
 1AyOlpfa9H1ms/6WjnszYCh1EEf7RIJnQ316ATYxKDsU1moUFbCK3QJvYUv6q9Y9XDHYg3ngw/s
 XIOkW7Lij9+Bjc1t9NcHiK9WT6E2hMemJXgr8YfjSJxwAJirIVST9x1sbViVB8PgSfGTeusDh+Y
 VZGPHIbvCsEE6szmEfnDOteRxvIGWXoUS3Ilwfi5vNg1Z3Y80zivJSPQ0ILIFFMwUT5NYTbRLZB
 VgkIzhlbQAYRETs191/7ZIBoRy0w==
X-Received: by 2002:a05:600c:c177:b0:488:a82f:bba9 with SMTP id
 5b1f17b1804b1-488fb7804f3mr435811475e9.22.1777048425885; 
 Fri, 24 Apr 2026 09:33:45 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a52d232afsm104772695e9.31.2026.04.24.09.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:33:45 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:33:45 +0200
Message-ID: <20260424163345.172428-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424134443.3420911-1-peter@korsgaard.com>
References: <20260424134443.3420911-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048426; x=1777653226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wKVenRKLQoWOUipgFvma2Ri+aVeaWdiFyuJMZ9fqFo=;
 b=OI+/YfUrCnPMLiJQXvnhlfMPGHZ+wULP9jSe4B/HdWE197rNTPNFrX6PQGz7ZZljFR
 /xCe3qooAP/4Fgt+punyRFMyTXSmnxSnhlrR56Vh9Rpc0OfutU/Vv9JpP5q8HKHIwke1
 6tcLQF4cPCiW3v55Lyaq7QLSatVwnyj9YFwmT6/hOYBuu7MJVfGoSGaEunrAKVbBkqDp
 QUelOWB47XZqmRN1hc5Z0P6JRxtDhH0aUSIQrIzxCnXneGFWk0tne6jSnZ2yI2QFpKjg
 PJOiUq00bfK28Iuq2gHLGr3DXwZcMXeHIYZxpS+0wNAsKfeTyWCZ4xk/GPJvQY3s6det
 l8vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OI+/YfUr
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/xz: add upstream security
 fix for CVE-2026-34743
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

Hi Peter,

Thanks for the submission I applied right now the following
https://lore.kernel.org/r/<20260417120641.174060-2-thomas.perale@mind.be>

I think the patch is the same.

I tend to keep a small buffer for people to react to the patches I backport and
apply myself. If you think security backport should be applied faster let me
know.

Best regards,
PERALE Thomas

In reply of:
> Fixes the following vulnerability:
> 
> CVE-2026-34743: XZ Utils: Buffer overflow in lzma_index_append()
> 
> If lzma_index_decoder() was used to decode an Index that contained no
> Records, the resulting lzma_index was left in a state where where a
> subsequent lzma_index_append() would allocate too little memory, and a
> buffer overflow would occur.
> 
> The lzma_index functions are rarely used by applications directly.  In the
> few applications that do use these functions, the combination of function
> calls required to trigger this bug are unlikely to exist, because there
> typically is no reason to append Records to a decoded lzma_index.  Thus,
> it's likely that this bug cannot be triggered in any real-world application.
> 
> This bug is older than xz 5.0.0, so all stable releases are affected.  The
> issue has been fixed in XZ Utils 5.8.3 and in the Git repository branch
> v5.8.  The fix is also available in the Git repository branches v5.6, v5.4,
> and v5.2, but no new releases will be made from these old branches.
> 
> https://github.com/tukaani-project/xz/security/advisories/GHSA-x872-m794-cxhv
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

> ---
>  ...buffer-overflow-in-lzma_index_append.patch | 66 +++++++++++++++++++
>  package/xz/xz.mk                              |  3 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
> 
> diff --git a/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
> new file mode 100644
> index 0000000000..0555abb3f4
> --- /dev/null
> +++ b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
> @@ -0,0 +1,66 @@
> +From 8287299ba858bd7ee767fe6eabcc050574616bf4 Mon Sep 17 00:00:00 2001
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Sun, 29 Mar 2026 19:11:21 +0300
> +Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
> +
> +If lzma_index_decoder() was used to decode an Index that contained no
> +Records, the resulting lzma_index had an invalid internal "prealloc"
> +value. If lzma_index_append() was called on this lzma_index, too
> +little memory would be allocated and a buffer overflow would occur.
> +
> +While this combination of the API functions is meant to work, in the
> +real-world apps this call sequence is rare or might not exist at all.
> +
> +This bug is older than xz 5.0.0, so all stable releases are affected.
> +
> +Reported-by: GitHub user christos-spearbit
> +(cherry picked from commit c8c22869e780ff57c96b46939c3d79ff99395f87)
> +CVE: CVE-2026-34743
> +Upstream: https://github.com/tukaani-project/xz/commit/8287299ba858bd7ee767fe6eabcc050574616bf4
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + src/liblzma/common/index.c | 21 +++++++++++++++++++++
> + 1 file changed, 21 insertions(+)
> +
> +diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
> +index 6add6a68..c4aadb9b 100644
> +--- a/src/liblzma/common/index.c
> ++++ b/src/liblzma/common/index.c
> +@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
> + 	if (records > PREALLOC_MAX)
> + 		records = PREALLOC_MAX;
> + 
> ++	// If index_decoder.c calls us with records == 0, it's decoding
> ++	// an Index that has no Records. In that case the decoder won't call
> ++	// lzma_index_append() at all, and i->prealloc isn't used during
> ++	// the Index decoding either.
> ++	//
> ++	// Normally the first lzma_index_append() call from the Index decoder
> ++	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
> ++	// lzma_index_append() isn't called and the resetting of prealloc
> ++	// won't occur either. Thus, if records == 0, use the default value
> ++	// INDEX_GROUP_SIZE instead.
> ++	//
> ++	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <= 5.8.2
> ++	// didn't have this check and could set i->prealloc = 0, which would
> ++	// result in a buffer overflow if the application called
> ++	// lzma_index_append() after decoding an empty Index. Appending
> ++	// Records after decoding an Index is a rare thing to do, but
> ++	// it is supposed to work.
> ++	if (records == 0)
> ++		records = INDEX_GROUP_SIZE;
> ++
> + 	i->prealloc = (size_t)(records);
> + 	return;
> + }
> +@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator *allocator,
> + 		++g->last;
> + 	} else {
> + 		// We need to allocate a new group.
> ++		assert(i->prealloc > 0);
> + 		g = lzma_alloc(sizeof(index_group)
> + 				+ i->prealloc * sizeof(index_record),
> + 				allocator);
> +-- 
> +2.47.3
> +
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 60c2df70ee..d32c6f08f9 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -24,6 +24,9 @@ HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
>  # 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
>  XZ_IGNORE_CVES = CVE-2025-31115
>  
> +# 0005-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.patch
> +XZ_IGNORE_CVES += CVE-2026-34743
> +
>  XZ_CONF_OPTS = \
>  	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
>  	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
