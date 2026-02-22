Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECA5C636B3
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 18:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E45360FA6;
	Sun, 22 Feb 2026 18:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlIAgyrAcUFg; Sun, 22 Feb 2026 18:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A5860F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771784304;
	bh=GtUw2srRF+G4792LV5ds9O1jK15Aits7ZxsMyYbzf8U=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KyhlaLOyhL7fhEdKol/ZJqBDkT2Kbh3FYitKl02WN4Pth42xboKuXrL1UVnuAljpC
	 itahY+54UVNYAM8A6iVj9ureYiGF4uE49aicmLaYjnExKhhtrvl7AivPYB33KD1uNb
	 IJ7nBcJ2npANSHoomyLySMkurEWYndM7YMjPM0OHIhpWNwDst2JguYcjhroU0Wsjs4
	 GdcOGL2jjLGbfKOXeGIwvbKtUKzOY5ANXhIjL6zVTW4VARWqvMBacCSx3XBU1OmqVi
	 BmS8+R5a4OGNUI3qZu3IwFZXSKWbLQ4keELPHtOKfE2pEBV4j0U3vFRicQtCJfRawM
	 Ar9IrZlzPvYNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26A5860F28;
	Sun, 22 Feb 2026 18:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 959041CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7460B82EB5
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkKdHxwU0rOH for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 18:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D59C8289B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D59C8289B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D59C8289B
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 18:18:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D1A2B0053D;
 Sun, 22 Feb 2026 19:18:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 19:18:17 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 19:18:17 +0100
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260220-llama-cpp-b8117-v1-1-20e68ea57055@gmail.com>
References: <20260220-llama-cpp-b8117-v1-1-20e68ea57055@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <5a727d873b79b960dd824272ab5b4270@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771784298;
 bh=PWO0k5LKmY04asUtpLy04wbrB9HuFTpg/IQN+wtBYAA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Do3Ysq6bzj//Fs/3+be+ii8UTBd7M3tHjrXiLNm5Lr1qURQ3pz7EjA1Q+UqJntHIx
 G9rB4GmwpWzAVnD35I7Xw2pr8A6p71EQosTttjhOniRIFwNfSVi41cFRynK/oAwnDl
 KX2Hzc/IO2lTY7sHDJhtOnGXdonrGcrESRVBhwEZLN6jdnNlfVGsOrSfQZzdhcQuxo
 7G9T9Ev+A4fYltwtdDmGOpnXnN47Hjc2mmr6NM8mHuwPCe/eSVLtkm5+yu+71PcHXm
 CpKqJEt0AAN45YNFXP4bttwIDfiPCEqBC2mRKEkSvMKLCSyDD6WDpeuLoUxVdG8Ct7
 GjmCemQvmu7Qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Do3Ysq6b
Subject: Re: [Buildroot] [PATCH] package/llama.cpp: bump to version b8117
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joseph,

Thanks for the patch. I have few comments, see below.

On 21/02/2026 00:01, Joseph Kogut wrote:
> Release notes: https://github.com/ggml-org/llama.cpp/releases
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/llama-cpp/llama-cpp.hash | 2 +-
>  package/llama-cpp/llama-cpp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/llama-cpp/llama-cpp.hash 
> b/package/llama-cpp/llama-cpp.hash
> index 765025f180..d929d40ed9 100644
> --- a/package/llama-cpp/llama-cpp.hash
> +++ b/package/llama-cpp/llama-cpp.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  
> b7271.tar.gz
> +sha256  
> 4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  
> b8117.tar.gz
>  # License
>  sha256  
> e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  
> LICENSE

The license hash is failing, due to year update in:
https://github.com/ggml-org/llama.cpp/commit/7a4ca3cbd905907ac4d12bc14b878fdfbe4fd1d6
Could you send an updated patch fixing the license hash, please?

> diff --git a/package/llama-cpp/llama-cpp.mk 
> b/package/llama-cpp/llama-cpp.mk
> index 5112022656..f104766403 100644
> --- a/package/llama-cpp/llama-cpp.mk
> +++ b/package/llama-cpp/llama-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LLAMA_CPP_VERSION = b7271
> +LLAMA_CPP_VERSION = b8117

Also, due to upstream commit:
https://github.com/ggml-org/llama.cpp/commit/a180ba78c710f52af7c7edee562fbe98c36d6ddd
the command llama-cli is no longer available in the runtime test,
which is failing with this patch. Could you update the Config.in
comments to reflect that change, and update the runtime test, if
necessary?

You can test with the command:

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_llama_cpp

>  LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
>  LLAMA_CPP_SITE = 
> https://github.com/ggml-org/llama.cpp/archive/refs/tags
>  LLAMA_CPP_LICENSE = MIT
> 
> ---
> base-commit: 6c83a0b8e5658b901dd35ae23217075f035af998
> change-id: 20260220-llama-cpp-b8117-e23d56923b35
> 
> Best regards,
> --
> Joseph Kogut <joseph.kogut@gmail.com>

Could you send an updated patch addressing those comments, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
