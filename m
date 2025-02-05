Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C702DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 19:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55AD641735;
	Wed,  5 Feb 2025 19:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8JvZr2P_PEY; Wed,  5 Feb 2025 19:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7DB0416E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DB0416E0;
	Wed,  5 Feb 2025 19:28:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7714212F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66F0B8387D
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrovZsdSkCOi for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 19:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E338E8386F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E338E8386F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E338E8386F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 19:28:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so1668935e9.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 11:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738783714; x=1739388514;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aKZgaBmb1xmZqhnsnUdD6da5m/om1OCtlsnzjHlo5NI=;
 b=OvyjNieC/hy8Krh3jhwUd4Piujf0pSqLpK+2k/Q2KHBQKqT7o7+QylXEuS2DMoPxMb
 IH7yiHYKF0Gjcw21RHBVSbnv+8t+ooPWfBraCA8kztdyEG5B/tX0TpRuD0PECshGGDlN
 9Hfs14JjRpDvB78NYgCaF5sNmb5el2JiiiL6OirGjFKzHl6ISpwmpQYjyQ/YCqkZAlzV
 GFZg4hT55YLp5VDbkTBbHKx9dyXRWqiwAQG1z+WKh2TOMHAJIRFIOsCgFxg5fvRruIlH
 RNbvKfNyLpgmMPvEZYi9XzzaCdyzOM1yIyxeAI9SyskM1zXhcXxabJ0vhje6IUCpzM17
 ymfw==
X-Gm-Message-State: AOJu0Ywo5FcXWtlcxM/OUbBWpmXW1ETebvlLXK3azMe3DgP2j6eszjoq
 pxB3ASTxeFWr1ajAhedBFCploTPiXSbm3TbyZneC2e9ZuRl24jH2zHggkMHcuWDm+AfZbt8PqmI
 u
X-Gm-Gg: ASbGnct8Aq7qA8+16IidjLjXM8l8epQYlOWgvhix9mt5hje1hxEBXqBrJOOsU+MyeRz
 GEY1N4PRctRG0OGU9mCRx3lYKYUHrmjshN8Gx8syZ+nni7soz5FRwJscDixoc0JXOrUymyTOSyW
 URxOGwI32odPWE7+jdU9vqhN7zzh/ANOFTb7Ao1uwxCXGwdZnetVfMxMvLmXPKu8Oe81CTcOTDO
 xWq2Iy4kIu4d1a5zSBAsf/LtxAGnhyDosjrxjKpeGJ4NLfv3i8VOjJaSCYZuu6yssVsRHwJmj0b
 uPIZjxmXJ5EOLsg/Ay4EHzFGxMEJR/v0Na9jLQN66iBCd/ERKsVDHXH0hpubs1nJQxs8Dq9YKVZ
 KbxdwiJF+5kK9GZ8UTbQ/QCvNdIXcPwKUiN9XdDmCQ2SzhQ==
X-Google-Smtp-Source: AGHT+IGN6pqwcq1arJrPT+euSZmtTrC56RvONxqDVX5BI2jjal6FnJdoy+MLC+txrun7jgUAE0JbHQ==
X-Received: by 2002:adf:e789:0:b0:382:4b9a:f51f with SMTP id
 ffacd0b85a97d-38db4912c55mr3119198f8f.47.1738783713932; 
 Wed, 05 Feb 2025 11:28:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38db4a84dc3sm3002365f8f.50.2025.02.05.11.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 11:28:33 -0800 (PST)
Message-ID: <90fb464d-759f-429c-a84d-aade53c898a8@mind.be>
Date: Wed, 5 Feb 2025 20:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Markus Mayer <mmayer@broadcom.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Markus Mayer via buildroot <buildroot@buildroot.org>
References: <20250127215356.3175741-1-mmayer@broadcom.com>
 <20250128220920.535ecc14@windsurf>
 <CAGt4E5sXA0fiKwYyRummys2Mi+p1sQDG9RQzJNM7g5zSBJcyCQ@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAGt4E5sXA0fiKwYyRummys2Mi+p1sQDG9RQzJNM7g5zSBJcyCQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738783714; x=1739388514; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aKZgaBmb1xmZqhnsnUdD6da5m/om1OCtlsnzjHlo5NI=;
 b=YTJIHGOOAdQRop+wmz3qV7TgVJjnekQr4/fdQxA6x/p7ZUUaMM28ffKsRznMXcgDDr
 cSSIsyJlOZ0+GZNjx4DVsjQB/vmRnjnIOSLNOxJG0+SoYLpTPbzvZXhiyDkGxu4m8LTb
 2arFlNJGexM928pxKoqHi0GZN2AZgUPubDnLToDIF5RclPCkjrN4Thi59h9pfHC56W+5
 eRealMjN+QrbO8nXgX9JxsRFPfYFQBSa1HoBOu5VdFmNaU+z58UIHYS6qY0eMAxzziDp
 PIisYLo7B1WCFMEFEAElDfEFDYtdpxmL+D83p5uAU0TY3Hou2DaEfFl0uZHg9n2XFmA4
 yJTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YTJIHGOO
Subject: Re: [Buildroot] [PATCH] support/scripts/apply-patches.sh: introduce
 envvar BR_PATCH_ARGS
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 17:58, Markus Mayer via buildroot wrote:
> Hi Thomas,
> 
> Re-sending, because I just realized the original response (sent on
> January 29) didn't go to the mailing list. That was not intentional.
> 
> Here goes...
> 
> On Tue, 28 Jan 2025 at 13:09, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Markus,
>>
>> On Mon, 27 Jan 2025 13:53:54 -0800
>> Markus Mayer via buildroot <buildroot@buildroot.org> wrote:
>>
>>> Introduce the environment variable BR_PATCH_ARGS as a means for the
>>> caller to pass additional arguments to the patch(1) command. These
>>> arguments can be new arguments not originally used -- or they can
>>> override one of the default arguments.
>>>
>>> In addition, provide a mechanism to add patch parameters on a
>>> per-package basis using the <PACKAGENAME>_PATCH_ARGS makefile variable,
>>> for example "PROCPS_NG_PATCH_ARGS". This allows individual packages to
>>> specify extra arguments or override defaults while not affecting any
>>> other part of the build environment.
>>
>> Thanks for the proposed patch. Do you have some details on the actual
>> (not theoretical) use-case(s) ?
>>
>> Thanks a lot!
> 
> When we are building our root file systems, we sometimes have to
> bundle older versions of certain packages or we want to apply patches
> that are being reviewed upstream without having been accepted and we
> want to use the same patch for different versions of a package, say
> procps-ng or xfsprogs. Under such circumstances, life becomes a lot
> easier if you can tell "patch" to use more fuzz when applying a patch
> as it'll apply over a wider range of versions while allowing you to
> only track a single patch file.

  That's exactly what you *don't* want. With fuzz, the risk is too great that 
the patch _seems_ to apply while it actually doesn't.

  The proper way is to put patches in version directories for each specific 
version you want to support. Yes, it means you have to "manually" rebase the 
patches for each version (but you can script that). But you're anyway _somehow_ 
going to have to check that the patches really apply to that version.


> So I can say
>      PROCPS_NG_PATCH_ARGS = -F2
> and then it'll use "-F2" while applying these patches, but it is
> limited to procps-ng and won't cause any side-effects elsewhere.

  Why would you want to support multiple versions of procps-ng?

  Regards,
  Arnout

> 
> This is a fairly specific application of this feature that others may
> not need quite in this manner, but it can be used in a very generic
> way to address different issues. I figured a facility like this might
> be helpful to other users as well for this reason.
> 
> It can also come in handy for Buildroot as a whole if a version
> upgrade or the introduction of a new patch for one of the existing
> packages were to suddenly require more fine-tuned parameters for
> applying patches.
> 
> Regards,
> -Markus
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
