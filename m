Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B61C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 709E781B23;
	Tue,  2 Jul 2024 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jYtfJoYidqj; Tue,  2 Jul 2024 07:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D46D81B25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D46D81B25;
	Tue,  2 Jul 2024 07:56:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1065E1BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1083409B4
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uluuSx3Hrq4n for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:56:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B67240490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B67240490
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B67240490
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:56:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so3087643f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906976; x=1720511776;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKmHO946Ha2y2gnIxZdqji4yJ4crgdRmo5NmzVA3/mk=;
 b=wsZnhnQZ9kc5pKOaUOqXgHMhmaIHZc2rajop/Ks5Vvq1PigHBNVna/ChPdQUBTxV1X
 HyhkVhMH1uL9JVB2ITEiHhbeBpX1z4IidIcwB+eTAnsKTpZJoQ3uUaOFJ3tCkL5SbjpC
 Cde8AfYTiENCn6SevGpl6IjOyRIQzaSDuO7O4fffjsMY0svJl+8FyMB6l2P9yac31+h5
 i+pLyt433teQ1tFj/gCDpFybkvgpVBAGzkznea3QwasGMI2XfnIh3cmK2rd7GYawxz3t
 m+Ip2FwuXnb0P71Li7lc0+D7U4K/3TGP5sGsbeTRTkY6NT5alVvzZF6FFYGRTfq8EgOC
 Ph6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTi6vE3TdMaaB2CMcIR/DQFJiJ1jZTRIFKHTwmRD/NVIx/wvX2rGjdXKOaCJ5vpjwnHYl0gowYLccekxximU1xzifdlpcEFQ==
X-Gm-Message-State: AOJu0YwTOOCDacpyfZwf/WougIZ+Q+aLswwjwy+oUTE6gg/fpWNocx2A
 QbSzUzbUtpoF9hwD6DGjg7jwYgdZUV0FD+OUPWxUNc4ioKSzTRTLeNBhxp20WkTMWoUNSBheloy
 r
X-Google-Smtp-Source: AGHT+IGwZCi1gGZvLJtXhTCLUZAnQSgfBQAvlW/JvDmg71ZuAIgM1FmbA5hgrBzvb+xMoBBmT21hug==
X-Received: by 2002:a5d:64ed:0:b0:367:47e6:c7d9 with SMTP id
 ffacd0b85a97d-367756bbb34mr6683046f8f.33.1719906976058; 
 Tue, 02 Jul 2024 00:56:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257f44c730sm92570905e9.39.2024.07.02.00.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:56:15 -0700 (PDT)
Message-ID: <36548601-ff91-44a2-b827-e6de235e3c4e@mind.be>
Date: Tue, 2 Jul 2024 09:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240702072024.2375844-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240702072024.2375844-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906976; x=1720511776; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oKmHO946Ha2y2gnIxZdqji4yJ4crgdRmo5NmzVA3/mk=;
 b=cTJsENhfsPoxOFqZGQ5h5UMLSP/AJTFm7EmiY2T2WDbKpHPu9ou848V64TNB8qoeLw
 No5GzWraJ9RsosQg2mVzh5xAifUtiVqWA73s2AVXk5XWHiU84LAhzqBDhdO5aiblhJTU
 /OrtSj2jEFmpSqyItCv/ZUn8HCCI76jKASMSnKTQ8ujB438lBtfBL97BSz8KWyY/qJeR
 Y087tLXu6SbNmbq0IiJ0bdFDTe5HbRB0HCbCNovPFqvWsz7y2YNYjC45dykrilrLQjRh
 Bpbe3TYS4Gx1kZvtT9HeNtS/ox+gbH6YeFbZYSvOkFRYsmtMzNZxIsBUwynnK/QTzEDd
 vBYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cTJsENhf
Subject: Re: [Buildroot] [PATCH 1/1] package/libtheora: update the patches
 to be applied with fuzz 0
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



On 02/07/2024 09:20, Dario Binacchi wrote:
> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, theora fails to build with output:
> 
>      Applying 0002-fix-autoreconf.patch using patch:
>      patching file Makefile.am
>      Hunk #1 FAILED at 4.
>      1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
>      patching file configure.ac
>      Hunk #1 FAILED at 68.
>      1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   .checkpackageignore                         |  1 -
>   package/libtheora/0002-fix-autoreconf.patch | 14 +++++++-------
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 949b7467cfe6..94ed9a19fdd4 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -911,7 +911,6 @@ package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch lib_pa
>   package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
>   package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
>   package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
> -package/libtheora/0002-fix-autoreconf.patch lib_patch.Upstream

  Did you update your patches to fix the Upstream tags as a reaction to the 
change I made to your patch of an hour ago? Wow, you sure move fast!

  In the future, please mention this explicitly in the commit message. I added:

While we're at it, fix the usage of the Upstream: tag and update
.checkpackageignore accordingly.


  Applied to master, thanks.

  Regards,
  Arnout

>   package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
>   package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
>   package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
> diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
> index dd3f47322235..27fc379ad404 100644
> --- a/package/libtheora/0002-fix-autoreconf.patch
> +++ b/package/libtheora/0002-fix-autoreconf.patch
> @@ -1,9 +1,10 @@
>   Fix broken autoreconf
>   
> -Downloaded from upstream git
> -https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
> +Upstream: https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
>   
>   Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Dario: make the patch to be applied with fuzz factor 0]
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   
>   
>   From: Tim Terriberry <tterribe@xiph.org>
> @@ -22,9 +23,8 @@ diff --git a/Makefile.am b/Makefile.am
>   index 89fd753..1783857 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
> -@@ -4,6 +4,8 @@
> - #AUTOMAKE_OPTIONS = foreign 1.7 dist-zip dist-bzip2
> - AUTOMAKE_OPTIONS = foreign 1.11 dist-zip dist-xz
> +@@ -2,5 +2,7 @@
> + AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
>    
>   +ACLOCAL_AMFLAGS=-I m4
>   +
> @@ -35,7 +35,7 @@ diff --git a/configure.ac b/configure.ac
>   index 1cbec1a..456b603 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -68,7 +68,7 @@ AC_LIBTOOL_WIN32_DLL
> +@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
>    AM_PROG_LIBTOOL
>    
>    dnl Add parameters for aclocal
> @@ -43,4 +43,4 @@ index 1cbec1a..456b603 100644
>   +AC_CONFIG_MACRO_DIR([m4])
>    
>    dnl Check for doxygen
> - AC_ARG_ENABLE([doc],
> + AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
