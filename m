Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3281AC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE44F818E6;
	Tue,  2 Jul 2024 07:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oj0hA0UIw8p7; Tue,  2 Jul 2024 07:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E92BD81B25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92BD81B25;
	Tue,  2 Jul 2024 07:56:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1337B1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFB8040C8B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7exDz-qBsdG for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AC5240D0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC5240D0B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AC5240D0B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:56:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-424ad991cbbso29867075e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906990; x=1720511790;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AedpNvmi7Xo98C0WXNUzLVnyqormepnW6Tt3H4NL17w=;
 b=tm/faJinvBCUO68V10HwTLgxuYQ1TaW0MZRyxfX4p41i7XiIy3AQq9kYOPbvAjZl4k
 47NngQpXVkO00/GQqNxTORJALRdUblcc1exjjkFfyTOvC8I4zWzMKibNvASjpX9E9L4+
 TL9TwuMxhVpfxtJ2abNaWphGLwxiOjrGPXMWKtKzSJgrY17kkRIFnQKvRRUbxsoPhW+L
 Mw0ZkLXIHsGM1D1S3VquNgfoSYQZjitnPbDkUI32gOIsHThIdA1AnBwnkqb+86RE3fqy
 Dgu7vFf0AA0HHzXMq9iVsSctIsYTO4WbChX5gh0ce2+4xY/LcUIPAVdSW48p0C1Z3D4Q
 xPZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYHVhEVY6m5fyNNOIY/BcTaaZHgkcDKF2xdbjG+dXdAoQYHkPKl+zd1U5ZyLTHGLeZre2/GLxTqW33dim8z36llKfcMzcn/Q==
X-Gm-Message-State: AOJu0YwKKI0wKFABEExE3pae1ozlXEJ9aG8OHZdbY3s7Hv05GFPlLiSM
 3wr9uTjz+qWZ4zdjGqkZ/NySZ3A4zutCwyl6SoMhu0GdM2mT3DxBXQdjbBVHT9fVdATIGK0XIgw
 r
X-Google-Smtp-Source: AGHT+IE33LaU/iCy78Ym1IXHQUimELgnC9oa9QTuNYqX/386jeNaUOHm2TDXD0guKwTmvtjxWfs56g==
X-Received: by 2002:a05:600c:524f:b0:425:5fe5:f273 with SMTP id
 5b1f17b1804b1-4258181d852mr40148525e9.26.1719906989810; 
 Tue, 02 Jul 2024 00:56:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a073sm185490375e9.32.2024.07.02.00.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:56:29 -0700 (PDT)
Message-ID: <1252256c-1a0d-4d2b-9a29-b70ee5028de6@mind.be>
Date: Tue, 2 Jul 2024 09:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702073512.2378109-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702073512.2378109-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906990; x=1720511790; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AedpNvmi7Xo98C0WXNUzLVnyqormepnW6Tt3H4NL17w=;
 b=UeLsjyqTjh69jcTTuPtXwrX/wVC8/5ynB5mJymFSX49RnTm65DrJb1KQI1VL8USpYE
 lhdsl+9QlELKPh/24Ejr3eaW10EagNhks/67IerzDVOPh0mtNTxFOpWb7oraIps9rTzu
 S8UBxo6rjGM2HNg3UjTFNuhih101OfKa6YP6D2C4i5EtiUY59hAouc9D4OFUVPfr1bS7
 2euSny7o2UxkHygPMsSleFEx4LFO5/Slo6RAiW5OtDg0uazMR6YWU6wlcUfcZ/8JtcF7
 JZqRTTztMkKmUIJQ2GSDMDrUDcJGqmQo7zqV0ntIUjqby8cxQmz+YrVInxo2xDU3mJoM
 nu/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UeLsjyqT
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: update the patches to be
 applied with fuzz 0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 09:35, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, ficl fails to build with output:
> 
>      Applying 0002-Makefile.linux-pass-LDFLAGS.patch using patch:
>      patching file Makefile.linux
>      Hunk #1 FAILED at 14.
>      1 out of 1 hunk FAILED -- saving rejects to file Makefile.linux.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                                 | 1 -
>   package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch | 7 ++++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 949b7467cfe6..0b613187a7f2 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -615,7 +615,6 @@ package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch li
>   package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
>   package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
>   package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
> -package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch lib_patch.Upstream
>   package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
>   package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
>   package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
> diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> index 2138089b0e9f..dd9e16412c6e 100644
> --- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> +++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
> @@ -12,7 +12,9 @@ Fixes:
>    - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
>   
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: upstream is dead]
> +Upstream: upstream is dead
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   ---
>    Makefile.linux | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> @@ -21,8 +23,7 @@ diff --git a/Makefile.linux b/Makefile.linux
>   index 5f1a41f..df887e6 100644
>   --- a/Makefile.linux
>   +++ b/Makefile.linux
> -@@ -14,7 +14,7 @@ MAJOR = 4
> - MINOR = 0.31
> +@@ -14,6 +14,6 @@ MINOR = 1.0
>    
>    ficl: main.o $(HEADERS) libficl.a
>   -	$(CC) main.o -o ficl -L. -lficl -lm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
