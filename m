Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0473DCD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C080260720;
	Mon, 18 May 2026 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLMy4_0WuSr6; Mon, 18 May 2026 19:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF06A60784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779131780;
	bh=fg2xmoPoEfn+pD5ZEkifBWDssQBi3dTzcC2QO8atSVc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aVoNlSKWBfpf8pvNGfn33oIzUFPWNn3L6ntxCn1aE+AS2ZX/lGDmaY5NrjDSZdZND
	 k1uBf8cxOvmHhQSWbruWQdMJYqFBzy+dvJzZF8NAmGUdYZDhU0DOGyKc7nL9fEvYk8
	 FMxrkw4nKZRVF/QuIsL7fxnf9mnoo3COJsB1u2IIAJD4DRlGd775GCFGyzR/L33kPV
	 mYokftOTlvKREnQjzhQ5d4psn91kkcy2tV7YKGNFStV3tPMAr91+oF+fya/acF+jcM
	 /gcpHze/nuXvNTO2eB63ZJXBYofH2+6Y9vI1PQvp3NYfmraXSNJ0vfp1VY0ZLTqK4I
	 j3+SVjiTP3oFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF06A60784;
	Mon, 18 May 2026 19:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8D4282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8008060784
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DK7ryJr6avN2 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 19:16:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C49960720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C49960720
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C49960720
 for <buildroot@buildroot.org>; Mon, 18 May 2026 19:16:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9B808B97C0CC; Mon, 18 May 2026 21:16:13 +0200 (CEST)
Message-ID: <bc081175-af79-496b-9cec-925c44691190@rnout.be>
Date: Mon, 18 May 2026 21:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: john.ernberg@actia.se, Daniel Lang <dalang@gmx.at>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-3-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260510193826.2846038-3-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779131774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=nrhY+cJhYTu1uONAlBuHfB/s9H/PRU3tj9OCSpWuIUE=;
 b=PyUiQ7RnM5SlpOnv2hVbj2zw6kr3ppda+5Aq9UNZT9TNDn/Zkcf866xC+Yz94QqlzUwpfu
 7z2cDgq8wFz6cRTaURZL9788M4VE816cBVijD+APdwPd9b95G/3xEmkcirosrkLAVgdW0K
 pIh1NxO7T75bu+VhjRIRdkAZgHzlcwYUjQA2Tja7RGeLRfx55JupojLrV33qlloo/vOiwh
 ehK/9EPFjDsjCykia+VaSCUurF1dPvk+zqtwZBH6FHPeJCKt0DzieFARO4yLr7ZggN9Xux
 g4ArixaBPE6/6xThWaEQbF4LoXi0iOU0ntldeaJsSgX2LZsYq3repKtu6lEpSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PyUiQ7Rn
Subject: Re: [Buildroot] [RESEND PATCH 2/8] package/{clang,
 llvm}: Move removal of opt-viewer to the correct package
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



On 10/05/2026 21:38, John Ernberg wrote:
> The files are installed by llvm but deleted by clang, this causes a
> mismatch in the packaging.
> 
> Remove the files from the correct package.
> 
> Cc: Daniel Lang <dalang@gmx.at>
> Cc: Joseph Kogut <joseph.kogut@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>

  Applied to next, thanks!

  Regards,
  Arnout

> ---
> 
> RESEND:
>   - Forgot to subscribe this e-mail to the list
> 
>   package/llvm-project/clang/clang.mk | 1 -
>   package/llvm-project/llvm/llvm.mk   | 2 ++
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/llvm-project/clang/clang.mk b/package/llvm-project/clang/clang.mk
> index 116389449b..7eae54556c 100644
> --- a/package/llvm-project/clang/clang.mk
> +++ b/package/llvm-project/clang/clang.mk
> @@ -84,7 +84,6 @@ CLANG_FILES_TO_REMOVE = \
>   	/usr/libexec/c++-analyzer \
>   	/usr/libexec/ccc-analyzer \
>   	/usr/share/clang \
> -	/usr/share/opt-viewer \
>   	/usr/share/scan-build \
>   	/usr/share/scan-view \
>   	/usr/share/man/man1/scan-build.1 \
> diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
> index 577128bb1e..fb59aa64e8 100644
> --- a/package/llvm-project/llvm/llvm.mk
> +++ b/package/llvm-project/llvm/llvm.mk
> @@ -316,7 +316,9 @@ endif
>   
>   # By default llvm-tblgen is built and installed on the target but it is
>   # not necessary. Also erase LLVMHello.so from /usr/lib
> +# opt-viewer is not necessary either, remove that too
>   define LLVM_DELETE_LLVM_TBLGEN_TARGET
> +	rm -rf $(TARGET_DIR)/usr/share/opt-viewer
>   	rm -f $(TARGET_DIR)/usr/bin/llvm-tblgen $(TARGET_DIR)/usr/lib/LLVMHello.so
>   endef
>   LLVM_POST_INSTALL_TARGET_HOOKS = LLVM_DELETE_LLVM_TBLGEN_TARGET

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
