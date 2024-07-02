Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5CC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC9AD81F3E;
	Tue,  2 Jul 2024 06:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-LYZtyMsBb3; Tue,  2 Jul 2024 06:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDECA81F44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDECA81F44;
	Tue,  2 Jul 2024 06:51:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1901BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78CA540CD7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1wuCtJY6Xk2 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 233F740CCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 233F740CCB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 233F740CCB
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:19 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42565670e20so28489675e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903077; x=1720507877;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IRf/+/cUp5Z/Js785QNojIB3Wlf4dvoPZ/zZt0sNEL8=;
 b=Hv1WpdAGtsCnoE55vfq2bp+zyiuX2o9Zauzr1XU5sXoAIjxQnlIKFjafn/oaEongHk
 2q0sCbcHciKPt/NCcDaRNoyAG79AhYr2tNUGDtxAjUvonfd1647a67BeMITAhUXIuVv6
 zHYZ5ZlGoyxUgJO6Lt77WCeqqaQ7W/j7JLr5ES9xwA49RZfI/AIpUawvMd0DbW6Un+yt
 sRW//qMjxfUMVwtrO4uzqCfp+HaIK0pQpVO7HLW93+lej8FxVbolfpVprYSV6hJKMYUk
 yq1cSHy60hnsaiH0P1i2RE+RSHursFpToTT3AoHflPZ8RtWOwz/cXCmmaylAvOXFXkcX
 Zglg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX97zhMUZIoOTJ5ht0KIz9tN5TdQ6gUphIWSOfl92cGeZPZRAQPIeFVV7zeT9dTAO+9rjYjN0vBoZHxKSg0LaqKa5Nq2CKFkQ==
X-Gm-Message-State: AOJu0YwXOXjEoBeptMeUT8V1M1BOK0IVVGOekF4k+1iwqVmmjiwAB8UB
 wyGRWxKwzrmW2Ic3ydWVtpvAw+cvynwYSWvry2xZf2THjZuwZYynsU0NNiHm76k=
X-Google-Smtp-Source: AGHT+IF5JUOKbJdP2sDcBJGpaUfA9D5Gk2QV04L5MhlmrNTAYHEWmYPtn4FCUmIdNt7oD13gJsXY1w==
X-Received: by 2002:a05:600c:4f43:b0:424:8a34:9890 with SMTP id
 5b1f17b1804b1-4256d4d3138mr117805595e9.7.1719903077559; 
 Mon, 01 Jul 2024 23:51:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09abbfsm183360735e9.35.2024.07.01.23.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:51:17 -0700 (PDT)
Message-ID: <1b9e91bb-4ab9-4aec-8f6b-5aa4cc09ad6e@mind.be>
Date: Tue, 2 Jul 2024 08:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>, buildroot@buildroot.org
References: <886d3fd3b90b4f92d332f1eeadbb499996b1bdc0.1719900556.git.baruch@tkos.co.il>
Content-Language: en-GB
In-Reply-To: <886d3fd3b90b4f92d332f1eeadbb499996b1bdc0.1719900556.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903077; x=1720507877; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRf/+/cUp5Z/Js785QNojIB3Wlf4dvoPZ/zZt0sNEL8=;
 b=DKCXk9f2uzpr9oxbBN1hbuFiSaFLEH3+VJnoHVaknwjBZ+1oI3EUE1d54+khXMHI7+
 RYcX8EzXAF5fQVZgFx8XA96T1Vgu8vxqXWsG8OtrJNHFS0rLcPECoCEnTki979oChC/l
 hApIBodxaC+aGvpHr3JYAm3hGR/bWekQCOsXbMPq78SBFvwKV83SJBYYrdzU9wr8VEXC
 Cr8UOLtUKG1ClzPu1bgLfb9xxrvVK4mXZLosj5D3v/1Bk/rr5GEPHZ3erWi9kmDDPhaq
 83Sp2jOBQIvtA+JZ/X5VkIrrjcYD2SKg3tUFl1q244uMeTpcsVtAA6szLJKICbvNlsyD
 a44Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DKCXk9f2
Subject: Re: [Buildroot] [PATCH] package/empty: fix patch fuzz
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 08:09, Baruch Siach via buildroot wrote:
> Update patch to apply with fuzz 0.
> 
> Modify upstream status information to match current practice.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dc119fed6ae341bc4b581e64148be414eedf4ef4/
> http://autobuild.buildroot.net/results/3daba0971f422f2085bb152c0e97859ab980a9e3/
> http://autobuild.buildroot.net/results/8353079e7b8ee8e2d431f99026c93ec3b0bcc239/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                      | 1 -
>   package/empty/0001-respect-LDFLAGS.patch | 7 +++----
>   2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index a122f74bb8ce..949b7467cfe6 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -571,7 +571,6 @@ package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
>   package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
>   package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
>   package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_patch.Upstream
> -package/empty/0001-respect-LDFLAGS.patch lib_patch.Upstream
>   package/erlang-p1-sip/0001-correct-include.patch lib_patch.Upstream
>   package/erlang-p1-xmpp/0001-fix-includes.patch lib_patch.Upstream
>   package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
> diff --git a/package/empty/0001-respect-LDFLAGS.patch b/package/empty/0001-respect-LDFLAGS.patch
> index b98af07eac84..64e8b5ca30a2 100644
> --- a/package/empty/0001-respect-LDFLAGS.patch
> +++ b/package/empty/0001-respect-LDFLAGS.patch
> @@ -4,15 +4,14 @@ http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-misc/empty/files/emp
>   Reported on the Gentoo bug tracker
>   https://bugs.gentoo.org/show_bug.cgi?id=429664
>   
> -and reported upstream
> -https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
> +Upstream: https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
>   
>   Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   
>   --- empty-0.6.18b/Makefile
>   +++ empty-0.6.18b/Makefile
> -@@ -16,7 +16,7 @@
> - PREFIX = /usr/local
> +@@ -22,7 +22,7 @@
> + UnixWare-gcc OpenUNIX-gcc HP-UX-gcc SunOS-gcc
>    
>    all:
>   -	${CC} ${CFLAGS} -Wall ${LIBS} -o empty empty.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
