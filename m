Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A11FED3F2
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D6BB84DD5;
	Fri, 24 Apr 2026 16:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt-LC6kPhJh3; Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B5084E35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048010;
	bh=s1cOlcpmlgKi/oSzZgZ26Zkt+0knirv0kop5+fh5C2I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Iw4Wrs35OwmUMnTwsIeoJvZJ3Gq6Xx+R3goGGUTuoS7WM1JiwqtcbMmrMnwba6K7O
	 Zggq6S3ZqGW/ELtUwr7hWcAMI6sM22lSXsvD+ERWc+QTlGxXh5yWFdceSkGEz+CgTY
	 Kd5wdIDbCJb2BF81FY8DrY9BmI/hhAPw7xLSMo1sM48HnlvGfGFJnJK5Wsw0gFLNEK
	 hcfB1gXPti3Vq/A0UVh/+rYAFy/VP2OxREcm7GcIJ0chjZG3JP/rVGRhHh2LQilGcK
	 5/1IMds1mKJRbeLHAc7VUegfY7NupNDb76btOzf5Hbmu168mCnadOJS94kJMqZIdXv
	 Mlo7NN/cRkzlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24B5084E35;
	Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EACDB206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC08E61C33
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aULxvR1yq1Ty for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D224461C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D224461C31
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D224461C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488b0046078so73101845e9.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048003; x=1777652803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mAA0HNtGTcUjbhWPFBilmH3xErEQC6dB4hNsku4ET2A=;
 b=ULzUnZnFpBeo0ZSoGN4dTEBZw6OJnLV9w0K+kBAAeF1M3JOu2Aa+YT5T9kEIyhOn4+
 W8s7MFBrUWFu4+/WIWSv1nw7nFVz6d9vU7hPECBrG3iUI1HMT38rQJb3sNhlg8k/5PYZ
 okpkm+OBMdIb8tEegK6mAyuWh/J21pF4tF8Hkbh7F4TVSUOqCgc0Ac8DlOXg5XA6rmzf
 gROgUOiy5eTWlX892QxNJOV+eE7iQvolqMYFoiATwULu3L/TLFPUSTwkecnDlU4fEXYE
 6ib7hVdogXtOh35fDTp7OvPFCKxRn4XnMsfdK/vH889dmYSO72hvwAYG5xyxHJcfCBuS
 UJjg==
X-Gm-Message-State: AOJu0YxPKynXMlOhK/44xGwkG1B5b+p4TmiFJGWJfKu7CrIhAEER80rw
 enEgq3L2PyjlZjoEU0Bm2hWSpJgVdJmUp02i53BTKNL5dhkYlcd7RF6eHKmsYW1/hTc=
X-Gm-Gg: AeBDiestQEzywhFjd3f5v63JyzX0vEYR13bDeWz3f1qm167tlffa6bNX7H1CK6ZDcNl
 TvxiXfCylvdMBzYl0OMWZCsKS3iorcP8XxBz8rmQpXVK4nsUS1+TItmM1/HQjIBXByEoa3RJ+61
 MIREsvYo9WvA7K6gs+S4XJ+KdtCVnVSeGF7eofJdYcM3EaaWf3YWLW7fpaesTgkZ55iGONob7VH
 wHs60koG37gY9pbSVxRu264dsBHbTOPp4wLOfFMgW7iL29WH6HNVbfNYzK5Z4v5vWrlNYqmRfj4
 4IncqBXae4NbREpJITsSTeZLbC4ChwKy5RU3txA1dbsZ81mCV5EikX81kEAiRTbRbAeZgo6qdH0
 DfuTzKvqgrGi72XI3GcgOClng6UVt0HTyL3TK0OZvP0VWhNErUpakFFRjyj3u5p9C1Usx2YJY2i
 jV34K8yquQWjBgaMdlajf6ovSJBQ==
X-Received: by 2002:a05:600c:5294:b0:486:fa35:aef2 with SMTP id
 5b1f17b1804b1-488fb73d53bmr429359655e9.4.1777048002862; 
 Fri, 24 Apr 2026 09:26:42 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm626610475e9.10.2026.04.24.09.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:42 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:41 +0200
Message-ID: <20260424162641.161067-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417120641.174060-2-thomas.perale@mind.be>
References: <20260417120641.174060-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048003; x=1777652803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAA0HNtGTcUjbhWPFBilmH3xErEQC6dB4hNsku4ET2A=;
 b=H0p8nLhIZOeu3wvPwXPOOnVCWR6zrpOUpQ2kwSHRFmAjuMtDmEuElo0VPGxwtYZFWT
 vzVPzJvZIIiJo1CFMupa8/YlUcabe38qYAI2LK0FHhNILTFqVPmp+CRSjnQsSM3u46DI
 lzTSmWx+LmtFWN6QEgvx4e6ZWdU2ml2i/I5NnpVpwWp/8+FPCrCO0MlcXiecewnT0bJ0
 KTh7gUtMOyXnNGiREqjPYpaqagu9QXKaD0UdK93bcfLJ4HZVCuIuuOenAqD9eLtRxJYO
 nZNWmlQYBCxKCjPTkMJj8xhcSNQiMp8Pc9IdsCtWGncANevvuJwKfs3sQ1v4JsJFFotd
 4kuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H0p8nLhI
Subject: Re: [Buildroot] [PATCH 2/2 2025.02.x] package/xz: patch
 CVE-2026-34743
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

In reply of:
> - CVE-2026-34743:
>     XZ Utils provide a general-purpose data-compression library plus
>     command-line tools. Prior to version 5.8.3, if lzma_index_decoder()
>     was used to decode an Index that contained no Records, the resulting
>     lzma_index was left in a state where where a subsequent
>     lzma_index_append() would allocate too little memory, and a buffer
>     overflow would occur. This issue has been patched in version 5.8.3.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-34743
>   - https://security-tracker.debian.org/tracker/CVE-2026-34743
>   - https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
> 
> (cherry picked from commit 724635227314010518372c5bad4d37d7c58950c1)
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...buffer-overflow-in-lzma-index-append.patch | 62 +++++++++++++++++++
>  package/xz/xz.mk                              |  5 +-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
> 
> diff --git a/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
> new file mode 100644
> index 0000000000..034122d4f7
> --- /dev/null
> +++ b/package/xz/0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
> @@ -0,0 +1,62 @@
> +From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
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
> +CVE: CVE-2026-34743
> +Upstream: https://github.com/tukaani-project/xz/commit/c8c22869e780ff57c96b46939c3d79ff99395f87
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/liblzma/common/index.c | 21 +++++++++++++++++++++
> + 1 file changed, 21 insertions(+)
> +
> +diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
> +index 6add6a683..c4aadb9b0 100644
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
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index 60c2df70ee..205ab928a7 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -22,7 +22,10 @@ HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
>  # 0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
>  # 0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
>  # 0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> -XZ_IGNORE_CVES = CVE-2025-31115
> +XZ_IGNORE_CVES += CVE-2025-31115
> +
> +# 0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
> +XZ_IGNORE_CVES += CVE-2026-34743
>  
>  XZ_CONF_OPTS = \
>  	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
