Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1D5CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323404142A;
	Mon,  1 Sep 2025 09:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9TS7EVB30WU; Mon,  1 Sep 2025 09:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5034141F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5034141F;
	Mon,  1 Sep 2025 09:19:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A272D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35CB80AFC
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_bUHmDNoKsP for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 09:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D545E80A61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D545E80A61
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D545E80A61
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8DAF8B9782D8; Mon,  1 Sep 2025 08:08:39 +0200 (CEST)
Message-ID: <b45cf536-686c-42a5-b59a-737d17afbc88@rnout.be>
Date: Mon, 1 Sep 2025 08:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250816082947.2947807-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250816082947.2947807-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756706919; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VK49V08n0D9jtgSrT7U/NqEB8kyNIgnd94PDljMNmcI=;
 b=WJFo2Cmln0YoVQ0wsAiy09mL/myslCRCUbd85fr7QTVP5/8ejY04lK8Np2eAIoUzPmP0w0
 IhhkDOxP6RcOJya7Ho1dKuIK2XDlmCX/R7qzdFwjdhFM4nc1tU5arJjnAdPnSa1VM2EI4P
 oxPf5KXqUcN4r1vIXJsGs2lCFiXlCBKz+4BFn5QmhqeGtUNxKG6PCd3C8ZMnyY8nZfR8Fk
 j98/xgOucAJbLV7qkpAt2ym1aRVN4/OhQ8pfDhmyQZrPD1iTHX3b292SWG+rXUirYpV5wA
 A8M+GbAXwpoOS4R+srNi6B0uN/squftEUVQ/CPMIBRviPdGIr4V7iqtpAbI30w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=WJFo2Cml
Subject: Re: [Buildroot] [2025.02.x,
 PATCH] package/quickjs: add patch for CVE-2025-46688
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



On 16/08/2025 10:29, Thomas Perale via buildroot wrote:
> Fix the following vulnerability:
> 
> - CVE-2025-46688
> 
>      quickjs-ng through 0.9.0 has an incorrect size calculation in
>      JS_ReadBigInt for a BigInt, leading to a heap-based buffer overflow.
>      QuickJS before 2025-04-26 is also affected.
> 
> For more information, see:
>    - https://www.cve.org/CVERecord?id=CVE-2025-46688
>    - https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a
> 
> The patch is different from upstream since the BigInt implementation has
> been added post 2024-01-13 (see commit [1]). The BigInt fix has been
> stripped out to only keep the buffer overflow in the string
> implementation.
> 
> On master the following CVE has been addressed with commit [2].
> 
> [1] https://github.com/bellard/quickjs/commit/61e8b9442840bf94a2a9b0b872c8b3a197c1eac3
> [2] c5c7c44fa5 package/quickjs: bump to version 2025-04-26
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ow-in-bjson-string-and-bigint-reader.patch | 29 +++++++++++++++++++
>   package/quickjs/quickjs.mk                    |  3 ++
>   2 files changed, 32 insertions(+)
>   create mode 100644 package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
> 
> diff --git a/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
> new file mode 100644
> index 0000000000..ae4d8cf43e
> --- /dev/null
> +++ b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
> @@ -0,0 +1,29 @@
> +From 1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a Mon Sep 17 00:00:00 2001
> +From: Fabrice Bellard <fabrice@bellard.org>
> +Date: Mon, 7 Apr 2025 18:40:49 +0200
> +Subject: [PATCH] fixed buffer overflow in BJSON String and BigInt reader
> + (#399)
> +
> +Upstream: https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a
> +CVE: CVE-2025-46688
> +[thomas: backport JS_ReadBigInt function not present in 2024-01-13]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + quickjs.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/quickjs.c b/quickjs.c
> +index 9be262e50..b2470ba64 100644
> +--- a/quickjs.c
> ++++ b/quickjs.c
> +@@ -35652,6 +35652,10 @@ static JSString *JS_ReadString(BCReaderState *s)
> +         return NULL;
> +     is_wide_char = len & 1;
> +     len >>= 1;
> ++    if (len > JS_STRING_LEN_MAX) {
> ++        JS_ThrowInternalError(s->ctx, "string too long");
> ++        return NULL;
> ++    }
> +     p = js_alloc_string(s->ctx, len, is_wide_char);
> +     if (!p) {
> +         s->error_state = -1;
> diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
> index 2bd9da1392..215deb8137 100644
> --- a/package/quickjs/quickjs.mk
> +++ b/package/quickjs/quickjs.mk
> @@ -12,6 +12,9 @@ QUICKJS_LICENSE_FILES = LICENSE
>   QUICKJS_CPE_ID_VALID = YES
>   QUICKJS_INSTALL_STAGING = YES
>   
> +# 0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
> +QUICKJS_IGNORE_CVES += CVE-2025-46688
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   QUICKJS_EXTRA_LIBS += -latomic
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
