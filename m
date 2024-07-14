Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373DC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 07:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201E74042F;
	Sun, 14 Jul 2024 07:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkBE1kf-nomw; Sun, 14 Jul 2024 07:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB89D4043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB89D4043A;
	Sun, 14 Jul 2024 07:37:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B554F1BF3E5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A04418138E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCoF-RdLJVKJ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 07:37:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3B0D8137A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3B0D8137A
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3B0D8137A
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:37:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e976208f8so3701753e87.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 00:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720942628; x=1721547428;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQhLGsB54WjqG9IQ41+Pn0uaSiCHy0QFtvyIuRZcn5c=;
 b=uXjQOaj6WNrirNJ6aAvYcxFnHPoelo7g2HnQghCtqsisEUOHMQvBTW64i59j0X+0EI
 i974Q1jWKGlkLXL8gMmti7MR7TzRuKDC64veIBkiAjXBklP9aQVplx99nlM6QDsUDf93
 AFkrnqXVBKbVoSN4abVxyfB/Ab61sI28EtY6lLSbvKNdH5Y4u3oPIBNGwkwWqFTmO27H
 Os+DOSWktJ/IbxVIrXAcSLBnvH5fZSvUwSiqQ0LbXlIZzE08LqKGD6gGeO6ExFD4gEUz
 PMqyzyhSNgAtkNMjFJkDyVMCRTkEgL+DvmYFPpUm1eEwGGDcf+ehzO+paBzX0GX3MZIk
 QTOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ17BgIkMV26dkBoet+gvDwm8GHY1TA1uzM7L4xYvXAFaSeYelAnnsDYUd561gET2N9n7Kcq3LfEht80ShFNcbOjxY+z0fmw==
X-Gm-Message-State: AOJu0YxKhHxiBpwfBNgNY3tKNmliLN96OcB6bQF+sxhkkzh+4uIOz39D
 bqCWIHu/C636rd9ysLGcURpAslFlGFbVDbRCMSh1For8ElubCcXflpz56zTDw3c=
X-Google-Smtp-Source: AGHT+IEfCiE2Otb4aBImMLzSQW1Tk3/a8vHGxRFNRyYynti6VBaW9EmQBO85rgZt941s9WeGvNhWEQ==
X-Received: by 2002:a19:f509:0:b0:52c:e4bf:d55d with SMTP id
 2adb3069b0e04-52eb9990d3dmr10772827e87.8.1720942628472; 
 Sun, 14 Jul 2024 00:37:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db046e2sm3180031f8f.105.2024.07.14.00.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 00:37:07 -0700 (PDT)
Message-ID: <7d84ad52-7b9d-4f6e-bdea-8ed20fcc6139@mind.be>
Date: Sun, 14 Jul 2024 09:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
 <6bf853bc8b61fed824a99148786105fc038a5894.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <6bf853bc8b61fed824a99148786105fc038a5894.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720942628; x=1721547428; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OQhLGsB54WjqG9IQ41+Pn0uaSiCHy0QFtvyIuRZcn5c=;
 b=d7HrWpu92HSBtPMdgdfAQ9gt2H6m5soG0Jn62VALIwmH9jpGYjSvdIxNti++EEfMUR
 bSbKlWKrCX78CftIgj7Y6vnwN6V6Wf/qHBwqy4GwVPmhSJS/8RtxOOvgeQDksV6wt5Tz
 u4HgvPLQfTltXyCmajGAq8/XMaSFiSBRigXrm59Kf7fz5JB5cCcZjBN/y04g5GXrN3KD
 8RlmKibb8Hva5OmTt8q52/XCUo9Mpprq1Rgax3kcL3ZSK6BaqDMEt3JAzzbvlIDWdMVW
 RFMaTlzmSL0yZNOO9qd7hff/f/B9nofEN5dBnPr3dxKUes+cDbVhJHgJ/ICxR7kO2xhU
 VEpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d7HrWpu9
Subject: Re: [Buildroot] [PATCH 03/20 v2] utils/check-package: add option to
 run the test-suite
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2024 19:05, Yann E. MORIN wrote:
> Currently, how to run the check-package test-suite is thoroughly under-
> documented. There is one hint in the commit log for commit fc254881e6df
> (utils/checkpackagelib: add unit tests), and another in commit
> 242e9d72e7d2 (utils/docker-run: new script); the former is hard to find,
> and the latter is about an unrelated script, so harder yet to find...
> 
> Add a new option to check-package, that will make it run its test-suite.
> Since pytest is only needed for the test-suite, only import it in that
> case.
> 
> pytest will be default create a cache of the tests (not sure what it is
> about, though), so instruct it not to (esp. since the tree can be
> read-only).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>   utils/check-package              | 10 ++++++++++
>   utils/checkpackagelib/readme.txt |  1 +
>   2 files changed, 11 insertions(+)
> 
> diff --git a/utils/check-package b/utils/check-package
> index cbb3613e19..f759d88a89 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -85,6 +85,9 @@ def parse_args():
>       parser.add_argument("--failed-only", action="store_true", help="print only"
>                           " the name of the functions that failed (debug)")
>   
> +    parser.add_argument("--test-suite", action="store_true", help="Run the"
> +                        " test-suite")
> +
>       flags = parser.parse_args()
>   
>       flags.ignore_list = get_ignored_parsers_per_file(flags.intree_only, flags.ignore_filename)
> @@ -287,6 +290,13 @@ def __main__():
>       global flags
>       flags = parse_args()
>   
> +    if flags.test_suite:
> +        import pytest
> +        return pytest.main(
> +            # Disable writing/loading a cache with: -p no:cacheprovider
> +            ["-v", "-p", "no:cacheprovider", os.path.dirname(__file__)]

  This will run all the tests in the utils/ directory, so also the ones from 
checksymbols. I've moved this code to checkpackagelib.base instead.

  Regards,
  Arnout

> +        )
> +
>       if flags.intree_only:
>           # change all paths received to be relative to the base dir
>           base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
> diff --git a/utils/checkpackagelib/readme.txt b/utils/checkpackagelib/readme.txt
> index 3bfe289607..b3e8c67100 100644
> --- a/utils/checkpackagelib/readme.txt
> +++ b/utils/checkpackagelib/readme.txt
> @@ -23,6 +23,7 @@ How the scripts are structured:
>   - lib_type.py contains check functions specific to files of this type.
>   
>   Some hints when changing this code:
> +- test your changes: utils/check-package --test-suite
>   - prefer O(n) algorithms, where n is the total number of lines in the files
>     processed.
>   - when there is no other reason for ordering, use alphabetical order (e.g. keep
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
