Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E02C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 08:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5EC74066A;
	Sun, 14 Jul 2024 08:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPvWwgJ43w7L; Sun, 14 Jul 2024 08:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C15C40661
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C15C40661;
	Sun, 14 Jul 2024 08:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1561BF20F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0954E401AE
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 08:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBZOIMtYKWZY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 08:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47F6340186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F6340186
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47F6340186
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:59:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42679f33fefso22155375e9.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720947565; x=1721552365;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DkWTNdVeU84hh2RVaNrb0kaG2xzLlfbw9Phi6pJr6uY=;
 b=ErsQiy7+18gLdaapIos5GddRpkNu6VzK75BmB4Kvi2PmZzf4RNjUnUXcjvKHR6Ia/7
 kHOtXLl1Wm5znzyO22H6k346XKBfV8ETWTHxzL3Jvrm7DhWLgd46XnRSX+IlV998tj3i
 RY/wWnwArKRfGbvOxkza/YmJ5MEyS2jRiDNl5gtKvPP7xLIMuzEf+7rEDQ7xP1RLjFqu
 u6Yk631wt0GTSpV592YrBeKJspDBdtrd4hEp3ViP1wMwgZroicPMNZ42JBTW68l6oa9G
 zOVi3k+RbA7tM87lHhWaQZnOI5Xi+BXzxBe+ZhQo9kjeK7cvJuGc8LgRVM+rgblBZGXW
 UTrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxen3IsevoHgFwGArt5FXZx1hlmKbPsBO1LtkOVvi6UZAZN8dd2bEfWK6UWa7u97cu9nr5Ns1MN5N0hzFU0VbfbXut6QMpzQ==
X-Gm-Message-State: AOJu0Yy860FQJd+l/EUxcZ5H7pEzNBSi1Qzdv04M0lOIoOeDXVYoz5Vy
 D/7rJ0hF4mJXPLgyhnekeNMraLBOPkLwQrqRRXU3o0QXPfqYf6uUv6EeKVE2MYk=
X-Google-Smtp-Source: AGHT+IFOJh+vi1EfJOAb5IL/GzFNbaX7ZizDJhE2/sTB7WUtCJeC6G1W0syr9la/vDEznEtl1abKmw==
X-Received: by 2002:a05:600c:63c7:b0:426:5f0b:a49b with SMTP id
 5b1f17b1804b1-426707e360fmr105427765e9.23.1720947564836; 
 Sun, 14 Jul 2024 01:59:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef550asm44794465e9.46.2024.07.14.01.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 01:59:24 -0700 (PDT)
Message-ID: <0ffecdb8-da64-42ea-a4ed-210e661a4e1b@mind.be>
Date: Sun, 14 Jul 2024 10:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717779951.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720947565; x=1721552365; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DkWTNdVeU84hh2RVaNrb0kaG2xzLlfbw9Phi6pJr6uY=;
 b=SjRBfB82yrp8PRajx9gK4JzIZazozAoG1mNI9CQZvKMe4fhjVbPIMR795egc2Zf7nY
 iYWkyyXYK4OtqDak+Ro702NgWtBqXsev7OvQ122EDPwdOjxF9cHwYFFLBfLBPdpbXC46
 b6LrEHb8qud/eaQwgkwJNHHbJh52f/0spjGRDyGXP7/BgdGpFZiu7KYKtYsnv8arg3CR
 6bjZE8s1vPauhYB9Y74+cCADhHRkDJGvcAXNk/IY/iN3vksOURNU2m1fKw5UT0j5FozE
 3W0BO6uhD4QfS6c+50LFMOhdUVPuqYRXU5OvIbjxafSHavPr4RREkgbVZmu2kr4CL4Wv
 opew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SjRBfB82
Subject: Re: [Buildroot] [PATCH 00/20 v2] support/download: allow
 downloading unlocked cargo packages (branch yem/cargo-unchained)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Yann, all,

On 07/06/2024 19:05, Yann E. MORIN wrote:
> Hello All!
> 
> Some maintainers refuse to commit a Cargo.lock in their repository [0],
> so there are cargo packages that are unlocked.
> 
> However, we currently require that a Cargo.lock be present: we call
> "cargo venodor --locked"; if there is no Cargo.lock, cargo fails.
> 
> This series adds support for downloading unlocked cargo packages; the
> series is articulated in three steps:
> 
>   1. preparatory cleanups (shelcheck, readability...)
> 
>   2. extend the download infra to pass arbitrary options to the
>      post-process helpers; use that to pass the path of the manifest
>      instead of using an environment variable
> 
>   3. add support for unlocked cargo packages by passing a new option to
>      the cargo post-process helper; add documentation and check-package.

  I don't see why we want this in the first place... Why not simply _require_ a 
Cargo.lock file to be present, and just add the option of including our own?

> 
>   4. (off-by-one error) add an RFC-style package to demonstrate the
>      unlocked cargo package.
> 
> Unlocked packages can be handled in two ways: totally unlocked, in which
> case they are not reproducible, or by providing a Cargo.lock in the
> Buildroot package directory, in which case it is reproducible, but there
> is a little bit more complexity to it, so this is implemented separately
> in case it is deemed too heavy-weight.
> 
> Regards,
> Yann E. MORIN.
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (20):
>        package/pkg-download: symplify calling parameters
>        package/pkg-generic: split long, unreadable DOWNLOAD line
>        utils/check-package: add option to run the test-suite
>        utils/checkpackagelib: instruct shellcheck to follow included files
>        support/download/dl-wrapper: fix shellcheck errors
>        support/download/cargo-post-process: fix shellcheck
>        support/download: move tracing functions to helpers
>        support/download: pass post-process options to post-process helper
>        support/download: accept manifest path as a post-process option
>        pakcage/pkg-cargo: use post-process opts to pass manifest path
>        package/pkg-python: use post-process opts to pass Cargo manifest path
>        package/python-bcrypt: use post-process opts to pass Cargo manifest path
>        support/download: no longer support BR_CARGO_MANIFEST_PATH in cargo post-process
>        docs/manual: rephrase end of vendoring section

  Applied these to master, except for python-bcrypt as explained separately.

>        package/pkg-cargo: add support for unlocked packages
>        utils/checkpackagelib: add test for default _CARGO_LOCKED
>        RFC: package/anvil: new package
>        package/pkg-utils: accept pacakge-specific archive format version
>        package/pkg-cargo: allow unlocked packages to provide local Cargo.lock
>        RFC: package/anvil: add local Cargo.lock

  All these are Changes Requested. I'll comment more in some individual patches.

  Regards,
  Arnout

> 
>   .checkpackageignore                    |    2 -
>   docs/manual/adding-packages-cargo.adoc |   34 +-
>   package/Config.in                      |    1 +
>   package/anvil/Cargo.lock               | 3464 ++++++++++++++++++++++++++++++++
>   package/anvil/Config.in                |   20 +
>   package/anvil/anvil.hash               |    2 +
>   package/anvil/anvil.mk                 |   31 +
>   package/pkg-cargo.mk                   |   31 +-
>   package/pkg-download.mk                |   33 +-
>   package/pkg-generic.mk                 |   12 +-
>   package/pkg-python.mk                  |    6 +-
>   package/pkg-utils.mk                   |    3 +-
>   package/python-bcrypt/python-bcrypt.mk |    5 +-
>   support/download/cargo-post-process    |   62 +-
>   support/download/dl-wrapper            |   32 +-
>   support/download/helpers               |    4 +
>   utils/check-package                    |   10 +
>   utils/checkpackagelib/lib_mk.py        |    8 +
>   utils/checkpackagelib/readme.txt       |    1 +
>   utils/checkpackagelib/test_lib_mk.py   |   18 +
>   utils/checkpackagelib/tool.py          |    2 +-
>   21 files changed, 3728 insertions(+), 53 deletions(-)
>   create mode 100644 package/anvil/Cargo.lock
>   create mode 100644 package/anvil/Config.in
>   create mode 100644 package/anvil/anvil.hash
>   create mode 100644 package/anvil/anvil.mk
> 
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
