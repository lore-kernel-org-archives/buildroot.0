Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD9FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 803B784EC9;
	Fri, 24 Apr 2026 16:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rqw8BxzSFTzH; Fri, 24 Apr 2026 16:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F92984EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048056;
	bh=RV3m9dxZdJoSi+pIlBFSrMV2XaZiPhKGB8pByx3Tp9k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LDRBIAsVE5oy/HaDaj1M8amuB8xmecAEx+X6BJ6w5dRjJLY60EH1zdTereWaSdtQk
	 uxTOYJx015aYCi65wWyPbnsGxaXdDk9q1Y1hEtWWFX9VgFAI6aumFkZETMSjMPLKHL
	 ayUdGrrvWRJp/eyPfAh8I8dwlW8XBbQf16qYKihly+jSaubh2N8h64N6SipLvcaAe1
	 F2guca4yf6hQtMERuDoQ+PHKSby63QB9kjnj6/KDEvszUAZvpkuPw97+JhkbvMPCUp
	 AKTivuizUdF6xFUlJOkzdftWAS50lG8mLLvgLZR05tWEjXMSguFI46a2yuWfVczH0Y
	 FG80k12ufKGsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F92984EC6;
	Fri, 24 Apr 2026 16:27:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9171194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8CE429C5
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7h_4iGmUOnn for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 910E84298A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 910E84298A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 910E84298A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso55653835e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048047; x=1777652847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wjWov9DXxaEV0wyI8nkbkVDAwJY7/xIQ57C5CxWnSwQ=;
 b=NVUs8S6gZivZknnZJwsINmgDQL7WQJzQUyLhxmufO+h6Th/ylXwZ7qE3G50MzQNXtq
 j2V8+xX/Fr0q6DlbWuk9pWeD+IHjVd8fHFiOkNYvnj8EvzJYiosdg6EMekbPcR3afNxt
 fs0yf8o+97IQBQkM9U+4y2PhJwYQN2Gr4YM3GNcxjABZ59Pd/AkNxCsgGq/Zug16HRL8
 /wvKSVukG3KO+pjvSEg81Uh9L7oyaV2khHGgT/s3xRZ3q4BxFkjM0wSGqjHThG3FaW3c
 aqt3uVqZ+ID/f0ztgZUuFNz7zMWrx4pegYWZVeUj8iGVGMnIYQYMzQXdbQeSGk64xms1
 217Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LeHj0Ek8rodMelImz/qMmQ+Jnubw7f7/xYxgC7aw+7BIrsfr5TI9mqkk/HSEXhUILUdd8564N0NM=@buildroot.org
X-Gm-Message-State: AOJu0YykdGdR7/Vf6YdY2zkS18jE9+A6zjBkLREjRV003L0FPtQkdfQ+
 n/u/ftIiWj9/0XUe9gKHXq22ec4lHAJeuMsDorUKaoeynz8khK2rMMYtKOhZ5yE4I5uBRoDjjdT
 bYasn
X-Gm-Gg: AeBDievCU7PhcGQI7/RfWXRNE0Cf8p1cKyG3s95eGbSAJUUE71YFDaQJAjKdi5t6jMO
 Rnr0bLL3aKGbSHO4nTU2viRaxhmwJ5mA95ct+P4OlpkmhUz9/CbWt6iyqy4I4BVL4cjZCKA3Ow+
 KvGm74ek3YkLJxvsRpwSjAxyFc3GKiHJgJrOcNJa8GCLACwmeDdQV4SsERs64CKYoKo9JI84CEv
 ZJyW3gY2jaoCfo6qvDxIpds8tAmXT2M2GteouIcnxGqK64m1Ec+x76abLJkzRt6yGpjmyiQ5sP8
 Ui8KBCrPTfIBxvXtu5aTynVdJIEW5M9ajeAogvo2IJxyiy9EGW/keVdg3Qvev7Ul+Y7pGfv2p7k
 gfSnChErU5PZctD8yXPjkrHcVcFKVaASkb0H4jxyVnKxUZep1x/J/1rNIQEsx02dn28Iia/o1iR
 nr3RSFtwBBTKLl5NVTd5ElXYxS+me6jdfgAUxy
X-Received: by 2002:a05:600c:3110:b0:487:243f:dc3e with SMTP id
 5b1f17b1804b1-488fb739cf6mr474693305e9.6.1777048046654; 
 Fri, 24 Apr 2026 09:27:26 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-489207ebd3asm182624635e9.6.2026.04.24.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:26 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:25 +0200
Message-ID: <20260424162725.162230-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417105529.4147375-1-bernd@kuhls.net>
References: <20260417105529.4147375-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048047; x=1777652847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjWov9DXxaEV0wyI8nkbkVDAwJY7/xIQ57C5CxWnSwQ=;
 b=BRNIZifiGGSRMmN9ns9pEHiBrlKJo6rCFgE2s+u3erozVoaigL68T1bsmlOkTue0NW
 07o/HN9tQLY5rrht5lj2sri5DOjWGlOzodBWFrvEDF69FdujNE36Vy99ug6FNeS1W1/f
 HNx5uK3IemVfBhpngCUZLPpUFoRLBw0D6AXz/YpkpWYfS21ecXC9uCi5R+LRVjLMpOHc
 fJ5p9K8tm0L3xLdoDXXpNoT5lXcQyUVcUhAcF6g3aGQPqkl3Vycarn/dtu9D9090fL36
 50JdBuNseXMwWTw2Kj5Q7b7Ng5F5qNHbRk57Rxn1yKHJr1aiP+ea8KLwmnlR8JaWIW0X
 m+fQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BRNIZifi
Subject: Re: [Buildroot] [PATCH 1/2] package/ghostscript: Fix brotli build
 failure on ARMv7
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
> Fixes:
> https://autobuild.buildroot.net/results/9e3/9e3435752d50ed3db55b0ff03e412bf42728f73a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/ghostscript/0002-brotli.patch | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/ghostscript/0002-brotli.patch
> 
> diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0002-brotli.patch
> new file mode 100644
> index 0000000000..55915cfef3
> --- /dev/null
> +++ b/package/ghostscript/0002-brotli.patch
> @@ -0,0 +1,29 @@
> +Fix brotli build failure in ghostscript 10.06.0 on ARMv7
> +
> +Downloaded from https://bugs.ghostscript.com/show_bug.cgi?id=708831
> +
> +Upstream: https://github.com/google/brotli/issues/1415
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +
> +diff --git a/brotli/c/dec/decode.c b/brotli/c/dec/decode.c
> +index f8d550cf4c..07da1fb44e 100644
> +--- a/brotli/c/dec/decode.c
> ++++ b/brotli/c/dec/decode.c
> +@@ -436,11 +436,12 @@ static BROTLI_INLINE void PreloadSymbol(int safe,
> +                                         brotli_reg_t* value) {
> +   if (safe) {
> +     return;
> ++  } else {
> ++    BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
> ++    BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
> ++    *bits = BROTLI_HC_FAST_LOAD_BITS(table);
> ++    *value = BROTLI_HC_FAST_LOAD_VALUE(table);
> +   }
> +-  BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
> +-  BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
> +-  *bits = BROTLI_HC_FAST_LOAD_BITS(table);
> +-  *value = BROTLI_HC_FAST_LOAD_VALUE(table);
> + }
> + 
> + /* Decodes the next Huffman code using data prepared by PreloadSymbol.
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
