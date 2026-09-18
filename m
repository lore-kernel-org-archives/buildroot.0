Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312F4C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFF940CFB;
	Fri, 18 Sep 2026 13:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqj0xYVpgRY5; Fri, 18 Sep 2026 13:08:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D651B40C94
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736884;
	b=ii3GD0oZzYhXn1zfOTgkI5t6YZAu8BlWBhuy7P6tLLneZpTh8bZLR7NuMrhiuw1PA8LB
	 /ol69IMIQi1QrFWI5MTQSsC2BDg3jVtqFfphv38VKYySj5Uycdx+QWLocGs8wmXwO9dGv
	 6An6tFfRdVrhnz0JJDaqdko9xqSR7zZl196ir2gm5QSXEVxuGYMjrvBAaBO2WLRmMQxkE
	 x7Sdx+4F9qntvwV5nu2vIPJbsMC9GHHs/kSPcjLH5Rm1lGO75xDOmd76aGOwTs7C9Mfrc
	 aDdk17zerF2qA2K1wHnIjHPJQJZFZioBkVN78pArDFAJ3RBuLZuGYbSMYvgS6itkSTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H8bxquDhtBctpVls362NYeWdY2Tf14flYP6rrFvN8Ks=;
	b=tVxioMJ6M50L4YIMM/+VOl3sUq7xp+k9vHuaZvfsXOVJNnyE7LR/XAKuBq72OUH/vl79
	 9Gcz93Sl7LwtaNbDOHriVb3M7L1jrXbwEsL0kfrs5KkzfEVWBGOSGzmpjIWBT40g69N5c
	 OWfWughDFVT5U26dpBOHEhd2XG8M1vT0clDD3MZFzDcEtx/kcWIxtw+xseqakA1fIb4Eu
	 8o87PNp/0X+ZqayXBNNqfnikjpRqQyLVbB49QeTQ0gS1jh43FNOR3aQ9mRubZHCeZLJPy
	 gfPUhiU3DbqOmZV6zNrZ6OYEy6Da+DLzw1bsTJWRMn9WwANGJh0u6pYSGJK8YxM9HhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736883;
	bh=H8bxquDhtBctpVls362NYeWdY2Tf14flYP6rrFvN8Ks=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k+vNSrUAPgwYHM0P50dRugJfRsUtE1BUgQwC9Tso9zY6Bi/XmORfRBMmRWmCmPkkD
	 wh8DoZW8zFeubIy/hEcD20qxNnCBhHrxEW0JOGjkFn+fSRO0W3rSM5EVajqCqxrMHh
	 oS+jMcdQ0WtM/HNmGCxySO9jzU5R1z/yDtk2wK2spLfQdli6kKx765n6yz/TB+NKCT
	 XE5pWS9kP9FYjR1ltQSOqytrUr5go12OVQqzert7nKxdNnyOZw6qHNIhh77AcVHh5w
	 IDFq663LH2tgt2EYX11SALKNQ+MYZNnLJfdV+as01UZ/ZIL98/ZtWopq/QU47hRP37
	 xOIC+38hhKEYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D651B40C94;
	Fri, 18 Sep 2026 13:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1376313D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0517981183
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEOuF9w5JP28 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:07:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 754248116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736869;
 b=rFiCyqtGy9gR/J+Gb1p5fTW0wR25eqz6pLll2yoQRzpmvF/dmDJbISrdFVGjTOW0sIlN
 1eEs6kf25CfRHh2gA38y6EC8pEEY20eBORFtAe7Vkj1k0Bfq++M/9PbXQxQGpVFrBqszb
 Q7ECcAGJoxsDn1tfoQae9gnLflpUYsmZZ1VYrX9LiDGQzyHs9wrzNmZurwHx4o265jRRC
 Jf36O8C4fKc2p9eRQkByRYV8jCc/se1P39XhvLaRKYB2/+Cq0RHsZJgwaIUXIUZ5wnRmz
 OeAac6Cma9NZC6pLfYt8aMmqJJteZo1YOO4Uj88Y9oKIYnFU8G8TC+5ZdQolOvz1uAQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736869;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=F6i/h2X+guQoXmslgKoBQIK1F4utqI8StCKApQn1mCA=;
 b=OcAiSsx9+QZB1vHoRmPHm3+WYUwvWgVRD0NZcVLYlxYPPYaRsb04Pc+uoBVpnNduxCp9
 HB06tWEVEW+zMlgYTgKPPerVpSFIeEAA4KpWEQGRdblV7D3NNOOylz5FoTnZoZmLUfBZ2
 LY8QLRTI76PGHvGlK5JxuMeF31hMzfh402fZJtM+gbRz++L2wrD96ieh8B3LEoqSpegNx
 YDfqqZp4tkLQTEWHg1BH6Dckd16qhX+KY2OWssXsNFskDFEJuqwdsdjV+YSV2dnf/BFha
 vxwTbvG2GhbuR5DTzCeln68gxaTQv0pYuZCDQKBs4ntJzbT0Z1GC35apR6ZcVqYPdGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="g3Ohb9/6"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 754248116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:07:49 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so4276365e9.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736867; x=1790341667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=F6i/h2X+guQoXmslgKoBQIK1F4utqI8StCKApQn1mCA=;
 b=0VQCIoXZrN+JVmhuSPwRbRFyYVAIeoiTzGb0i53yhX44f+wcImV0eM1Hjf5PwdlUcZ
 5bH/e0Y+0W+9+dxht4pW/pYZ6hV7rb/IRh5iMm+7z6KLQ19JDOvYvS5SstrGLymXtkls
 Enf7jSM/lvL7sxccnE1OV2ea38flR8xWNLWnuOE4L8NmkIC8vvx4DWE+YMif79OXoeir
 4EQrrq/arF+mpKMnxg37Ksw50Q80nNX2kkIu58FrsC10rdRpISjortOnCC63gThlAPcA
 GwK7B3hWvJc1JHpuTEkjOHLNKU7PPf5OxkzC6IE6i++KKATo6A/2y1EG6Y9G3J4GSSPT
 OAHg==
X-Forwarded-Encrypted: i=1;
 AKwUvByxFk2qJbx9D7PoBk9MzsvGWzJTJ4RkKrJmrEIdapaUMLOF3I3r1VWhB3PYc3wxtAUYRaPGhf5s10g=@buildroot.org
X-Gm-Message-State: AFuF++kUMOKTW7TIJmUN5j7pQOhCu5vE+qAHv+gr/pI6juOZyuCefskP
 OCgi2h0RlHQASs6R0TE/IrPkvJBX6n6Zn8vnyBYcV8KTZymCVm0HPz89wKUDu9S49Ks=
X-Gm-Gg: AYBFou3le+bNjetllilPJp3tp/qIX8Vp/HeEg+xtHzo9P6Au05tv6bRMxFpmSf7veMe
 YnzmTggaCREwYBCqEHugteA43+aWj/6Qr39gFofuja9RaNtsm+JucfZQGmYZ7jxUlig0yQ/g6dZ
 EZzpuZibUzGLu31Kx2DiIH0Zoc7O4cL7+19e9c0xN5T3BudPMAiI1Xlo1OhymMSaGwTVCoOonR8
 wAlrW155EgOJxqQo5HeJMIK8QX6/25ENLme/ZIfuiufA4TbrtXEOrbne5ofKzhFIDUhRU47t9Pw
 EVXqcc+rrcroNtkD6sQ7pyYheIXIyGSOIb6OCQakfmgzUpvKoP4Rvq/qCGQwSnsGLqeiAxqOwh9
 soz+/8/BNkL6VopvrvjNxIycwsQPFtz32jErYM9p8WDYlxQ9bE+uNW1qlhS58jMXggucq70TiDo
 mNExlai7ewpKuw9RaLjKAoTNIfRMhofzb7eSQ+pBOrZAd4UOTUgQDBYBdXd+mfQx+u
X-Received: by 2002:a05:600c:3586:b0:49e:7d69:83b7 with SMTP id
 5b1f17b1804b1-49fc56f7376mr39180705e9.13.1789736867023; 
 Fri, 18 Sep 2026 06:07:47 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc52a5b6esm28014425e9.4.2026.09.18.06.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:07:46 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:07:16 +0200
Message-ID: <20260918130716.160741-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914141416.130674-1-titouan.christophe@mind.be>
References: <20260914141416.130674-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/xz: add patch for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerability:
> XZ Utils: Invalid write if a decoder is reinitialized after allocation failure
> See https://github.com/tukaani-project/xz/security/advisories/GHSA-5qpq-xqfv-j9pg
> 
> There is still no CVE number assigned to the issue.
> 
> (alternative to commit 6f125a653038c9460b515b1f0d4c8c4be37d88c3)
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...t-safe-to-reinit-after-alloc-failure.patch | 32 ++++++
>  ...-a-filter-chain-initialization-error.patch | 98 +++++++++++++++++++
>  package/xz/xz.mk                              |  4 +
>  3 files changed, 134 insertions(+)
>  create mode 100644 package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
>  create mode 100644 package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
> 
> diff --git a/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
> new file mode 100644
> index 0000000000..e948cdee8a
> --- /dev/null
> +++ b/package/xz/0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
> @@ -0,0 +1,32 @@
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Wed, 9 Sep 2026 14:14:40 +0300
> +Subject: liblzma: Make lzma_lz_decoder_init() safe to reinit after alloc failure
> +
> +If memory allocation fails and the resulting coder state is reused,
> +ensure that memory allocation is attempted again. However, coders that
> +are initialized via lzma_next_filter_init() shouldn't be reinitialized
> +after failure; they should be cleaned up with lzma_next_end().
> +
> +Reported-by: GitHub user christos-cantina-security (christos-spearbit)
> +(cherry picked from commit fe4d763d566a38ad61d4c5022520c25578a3a464)
> +
> +---
> +Upstream: https://github.com/tukaani-project/xz/commit/0917f6d0f03d9add15dda27e0bf2ebfc22aaf67a
> +CVE: GHSA-5qpq-xqfv-j9pg
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/liblzma/lz/lz_decoder.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/liblzma/lz/lz_decoder.c b/src/liblzma/lz/lz_decoder.c
> +index 92913f225..18669300e 100644
> +--- a/src/liblzma/lz/lz_decoder.c
> ++++ b/src/liblzma/lz/lz_decoder.c
> +@@ -276,6 +276,7 @@ lzma_lz_decoder_init(lzma_next_coder *next, const lzma_allocator *allocator,
> + 
> + 	// Allocate and initialize the dictionary.
> + 	if (coder->dict.size != alloc_size) {
> ++		coder->dict.size = 0;
> + 		lzma_free(coder->dict.buf, allocator);
> + 		coder->dict.buf = lzma_alloc(alloc_size, allocator);
> + 		if (coder->dict.buf == NULL)
> diff --git a/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
> new file mode 100644
> index 0000000000..97aa9a5541
> --- /dev/null
> +++ b/package/xz/0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
> @@ -0,0 +1,98 @@
> +From: Lasse Collin <lasse.collin@tukaani.org>
> +Date: Wed, 9 Sep 2026 14:14:40 +0300
> +Subject: liblzma: Clean up after a filter chain initialization error
> +
> +Filter coders are initialized using lzma_next_filter_init(). If filter
> +chain initialization fails, the entire filter chain should be cleaned up
> +with lzma_next_end(). lzma_raw_encoder_init() and lzma_raw_decoder_init()
> +have always done this via lzma_raw_coder_init() in filter_common.c.
> +(Separate cleanup is weird, but it must have made sense to the young me.)
> +
> +The following decoders initialize LZMA1 filter directly without using the
> +raw filter chain API. This avoids needlessly pulling in all other filters
> +when a program is linked against static liblzma. These functions didn't
> +call lzma_next_end() after an initialization error, which left the state
> +available for later reinitialization.
> +
> +  - lzma_alone_decoder()
> +  - lzma_lzip_decoder()
> +  - lzma_auto_decoder() [*]
> +  - lzma_microlzma_decoder()
> +
> +[*] lzma_auto_decoder() is only indirectly affected due to the first two
> +    functions. lzma_auto_decoder() itself doesn't need a fix.
> +
> +There are also encoder functions that initialize the LZMA1 encoder
> +directly. They don't have this issue because the whole lzma_stream
> +is cleaned up when encoder initialization fails.
> +
> +Reported-by: GitHub user christos-cantina-security (christos-spearbit)
> +(cherry picked from commit e5e63d50eac1b4357a5a7a0abd3c5f99a5c47881)
> +
> +---
> +Upstream: https://github.com/tukaani-project/xz/commit/0130b7524227d0bb9f405ecaf0af632a767fa735
> +CVE: GHSA-5qpq-xqfv-j9pg
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + src/liblzma/common/alone_decoder.c     | 8 ++++++--
> + src/liblzma/common/lzip_decoder.c      | 8 ++++++--
> + src/liblzma/common/microlzma_decoder.c | 8 ++++++--
> + 3 files changed, 18 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/liblzma/common/alone_decoder.c b/src/liblzma/common/alone_decoder.c
> +index 78af65157..b2b049b5c 100644
> +--- a/src/liblzma/common/alone_decoder.c
> ++++ b/src/liblzma/common/alone_decoder.c
> +@@ -151,8 +151,12 @@ alone_decode(void *coder_ptr, const lzma_allocator *allocator,
> + 			}
> + 		};
> + 
> +-		return_if_error(lzma_next_filter_init(&coder->next,
> +-				allocator, filters));
> ++		const lzma_ret ret = lzma_next_filter_init(&coder->next,
> ++				allocator, filters);
> ++		if (ret != LZMA_OK) {
> ++			lzma_next_end(&coder->next, allocator);
> ++			return ret;
> ++		}
> + 
> + 		coder->sequence = SEQ_CODE;
> + 		break;
> +diff --git a/src/liblzma/common/lzip_decoder.c b/src/liblzma/common/lzip_decoder.c
> +index 651a0ae71..30c50286d 100644
> +--- a/src/liblzma/common/lzip_decoder.c
> ++++ b/src/liblzma/common/lzip_decoder.c
> +@@ -238,8 +238,12 @@ lzip_decode(void *coder_ptr, const lzma_allocator *allocator,
> + 			}
> + 		};
> + 
> +-		return_if_error(lzma_next_filter_init(&coder->lzma_decoder,
> +-				allocator, filters));
> ++		const lzma_ret ret = lzma_next_filter_init(
> ++				&coder->lzma_decoder, allocator, filters);
> ++		if (ret != LZMA_OK) {
> ++			lzma_next_end(&coder->lzma_decoder, allocator);
> ++			return ret;
> ++		}
> + 
> + 		coder->crc32 = 0;
> + 		coder->sequence = SEQ_LZMA_STREAM;
> +diff --git a/src/liblzma/common/microlzma_decoder.c b/src/liblzma/common/microlzma_decoder.c
> +index 882cb2c80..a7720cc2a 100644
> +--- a/src/liblzma/common/microlzma_decoder.c
> ++++ b/src/liblzma/common/microlzma_decoder.c
> +@@ -108,8 +108,12 @@ microlzma_decode(void *coder_ptr, const lzma_allocator *allocator,
> + 			}
> + 		};
> + 
> +-		return_if_error(lzma_next_filter_init(&coder->lzma,
> +-				allocator, filters));
> ++		const lzma_ret ret = lzma_next_filter_init(&coder->lzma,
> ++				allocator, filters);
> ++		if (ret != LZMA_OK) {
> ++			lzma_next_end(&coder->lzma, allocator);
> ++			return ret;
> ++		}
> + 
> + 		// Pass one dummy 0x00 byte to the LZMA decoder since that
> + 		// is what it expects the first byte to be.
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index c07152ad92..5bbcc95e62 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -27,6 +27,10 @@ XZ_IGNORE_CVES += CVE-2025-31115
>  # 0005-liblzma-Fix-a-buffer-overflow-in-lzma-index-append.patch
>  XZ_IGNORE_CVES += CVE-2026-34743
>  
> +# 0006-liblzma-make-lzma-lz-decoder-init-safe-to-reinit-after-alloc-failure.patch
> +# 0007-liblzma-clean-up-after-a-filter-chain-initialization-error.patch
> +XZ_IGNORE_CVES += GHSA-5qpq-xqfv-j9pg
> +
>  XZ_CONF_OPTS = \
>  	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
>  	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
