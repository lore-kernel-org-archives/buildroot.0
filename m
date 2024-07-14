Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ADCC3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 026F7811B2;
	Mon, 15 Jul 2024 07:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR2quG7PTFn0; Mon, 15 Jul 2024 07:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 073A881174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 073A881174;
	Mon, 15 Jul 2024 07:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00A811BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E35CC80E74
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CACOTfs1PImT for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82CDD80E07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82CDD80E07
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82CDD80E07
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:38 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4267345e746so26341385e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029476; x=1721634276;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E4YlGEIDS0KYxzqZlTlcMsSp3YsxLqS0oUz/7PGwRFE=;
 b=Z9PaMbFhxNxFvFtVTYn60aZkLyEOA1a7KpbhVlUcvYM+F1LMocyh8r47QTubDPUKYm
 fNCn98lVEwg4+bCjBb0zjzdXss7JStT6I/5Zgzk5jHOUI0mQnoEHRy1e0aX0FOBaDrBg
 oY9oV1zUvTYIbe8LeQSyl1Rj8LqrRKCIXLlH3YzBSm9pWGDbtIzmbMEwoUfDsiFbcGX6
 132FGRowcv1zU0B1tZbdwZIXCYHCuJaOM22tniqKMw4V6BxdljO50o6ahACOyrvTZv9D
 EuYKqsfpjVP5ZU454a9g6PmdATi34/55yEr3h6Lhqn1nB2CBGEbf6/Hhb0uee/3aKGTM
 78FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxKJnuW0TcATtVtwNqTkyyq9fIAEZ388JtEuz7ONz3Q9fpE0b4y/e01wumNo1iNa23MsQec+rVKqa9qerE8278TxviXquiTQ==
X-Gm-Message-State: AOJu0YzXovzzZ/hHHJnHAZ/cLTD6gcUzErfRuncKmS5YfSdQdMzgqf5H
 jz0aaVxzipbL2osOzHrPvjrc3RLDzdoI/g04pLw3P14sXkyjYZvfP2XLSloWtfQ3z+NDj9CIxO8
 I8aw=
X-Google-Smtp-Source: AGHT+IEynmh18/aSZkpSkdSf1xhjNZufGXxQvRPkLou6Q2hqycgDvPFlRlBLz9L+66vBpzVxRczvag==
X-Received: by 2002:a05:600c:4d0d:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-426708f1fb7mr125569555e9.32.1721029476196; 
 Mon, 15 Jul 2024 00:44:36 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:35 -0700 (PDT)
Message-ID: <d51c2399-7c7b-411e-b951-4bb20d37652e@mind.be>
Date: Sun, 14 Jul 2024 22:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1710027863.git.yann.morin.1998@free.fr>
 <7c4ef882367896d7d522301f04c742bc26df47aa.1710027863.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <7c4ef882367896d7d522301f04c742bc26df47aa.1710027863.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029476; x=1721634276; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E4YlGEIDS0KYxzqZlTlcMsSp3YsxLqS0oUz/7PGwRFE=;
 b=Ai6uurVcGa9uivKkFfEgfn5ATYmMxRgJrlgvhMoQHdwHepIlewUOm6sNrB3Hvapldd
 /WuvGHISx9bqPxvJvaWWAovimspwEgaHnQqb1lOvUIBizfR2E+/8LuJuBKCpTDkLruix
 WIpQxPLS6HRTvJNgVD2ZRFRXOH8dAnCXQ/FAlqODzGX5kcmxOmZjXea9JncIMbwhx9np
 muomWe4ho+HNe7+jbMJdP5Rw11I1QlrNjGse3anzA6H/jgsEPs1ug9OV0xNTQDZZ83I3
 ijx+NpLecQV+nQow0Ir7xBLUxoWc9h01oimMhwcKKW9czP7rvqrLEjcUNYCZG488K1qv
 GaOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ai6uurVc
Subject: Re: [Buildroot] [PATCH 5/5] support/download/check-hash: accept
 hash files without terminating \n
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
Cc: masonwardle@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/03/2024 00:44, Yann E. MORIN wrote:
> Lots of people are using broken text editors that 1. do not naturally
> terminate text files with a final \n as is customary in UNIX text files,
> and 2. do not respect our .editorconfig settings, which explicitly
> require adding that final newline. See this nice summary of what a text
> file is (with references to applicable standards):
> 
>      https://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line/12916758#12916758
> 
> So, it is not surprising that read does not read the last "line" of a
> file, when said "line" does not end with a newline, because it is thus
> not really a line.
> 
> Even though we do mandate actual text files, let's be a little bit lax
> in this respect, because people may write packages, and their hash
> files, in a br2-external tree, and they may not have our .editorconfig
> in the directory heierarchy (e.g. if buildroot is a submodule of their
> br2-external tree, or whatever).
> 
> mapfile does not suffer from this limitation, though, and correctly
> reads all lines from a file, even the final line-that-is-not-a-line.
> 
> mapfile was introduced in bash 4.0, released on 2009-01-20, more than
> 15 years ago. Debian squeeze, released in 2011 already had bash 4.1.
> Those are really ancient. So, it means we can indeed expect bash
> version 4.0 or later; which means mapfile is available.
> 
> "It should be fine!"
> 
> Fixes: #15976
> 
> Reported-by: masonwardle@gmail.com
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/download/check-hash | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/support/download/check-hash b/support/download/check-hash
> index 9db647885a..d18ec8b134 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -78,8 +78,10 @@ nb_checks=0
>   for h_file in "${h_files[@]}"; do
>       [ -f "${h_file}" ] || continue
>       : $((nb_h_files++))
> -    # shellcheck disable=SC2094  # we're really reading it only once
> -    while read -r t h f; do
> +    # mapfile reads all lines, even the last one if it is missing a \n
> +    mapfile -t hash_lines <"${h_file}"
> +    for hash_line in "${hash_lines[@]}"; do
> +        read -r t h f <<<"${hash_line}"
>           case "${t}" in
>               ''|'#'*)
>                   # Skip comments and empty lines
> @@ -87,13 +89,12 @@ for h_file in "${h_files[@]}"; do
>                   ;;
>               *)
>                   if [ "${f}" = "${base}" ]; then
> -                    # shellcheck disable=SC2094  # we're only printing the h_file filename
>                       check_one_hash "${t}" "${h}" "${file}" "${h_file}"
>                       : $((nb_checks++))
>                   fi
>                   ;;
>           esac
> -    done <"${h_file}"
> +    done
>   done
>   
>   # shellcheck disable=SC2086  # nb_h_files is a non-empty int
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
