Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96275C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5789940586;
	Sun, 17 Mar 2024 21:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fHQOvKfN3MMw; Sun, 17 Mar 2024 21:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EFFB4058F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EFFB4058F;
	Sun, 17 Mar 2024 21:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEB1F1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC0BB60652
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aO5Zk3P3HsFd for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B772E60635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B772E60635
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B772E60635
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:37:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412e784060cso27562785e9.1
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710711432; x=1711316232;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBgZ9N7SyIc+t8v4Y7nEiwvtj32H0V89SrmNC3VULII=;
 b=GNxF3Lpc99kk+JK14mM/aaemrSzddE5luuosDScG/mDU3EivuqtV6FUBO/LbQ3ZStN
 B2fAnVBt453oxb/T57bfnTcPjyC/N4sbPWeCccDOaBFGC8xliJiZEVrx6JFzjLi1syZI
 93HmG1rmEPt0uUaMmq0yD8NfhigE9wr2uIP92YFw6wnJerwMnZLOATX6Hcjo9sZMUQ5y
 CoUmO0lGGSR0mQl5BMijSHa7yWYCJjEPI7CJDQLfFJGGRw7gvnmLCwjHzsb3VSCa2MLt
 2TCf+o/PBKFfIqlBjwGNL80bjxcU0Bi2hxV3IyHwFk/RY51EQaZxOPIjsjly74nCH/CP
 4D6g==
X-Gm-Message-State: AOJu0YzudQAyYiPw/peywVxzmRADXTBWzQh2aKAgaah+MuklbL/XetxB
 Gqs5lbztMBZ33AXYh8Vl/TUwOD8gYZnCldASMhNYCrxVlZ6gdawVamwv+9hK7TS1tGTuPsbg7hw
 1
X-Google-Smtp-Source: AGHT+IG52FJun2KmuommA/rvYwTdvwifRgdJKTEoGNeLL5CD6g1JEUAk65/XQGWOvNChdKdFJgMPqg==
X-Received: by 2002:a05:600c:468f:b0:413:2f9c:f052 with SMTP id
 p15-20020a05600c468f00b004132f9cf052mr11529060wmo.16.1710711432037; 
 Sun, 17 Mar 2024 14:37:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b0041401eb021asm8806285wmb.24.2024.03.17.14.37.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 14:37:11 -0700 (PDT)
Message-ID: <844cc507-afe9-4e45-9825-68a62c36589b@mind.be>
Date: Sun, 17 Mar 2024 22:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20240317213626.4439282847@busybox.osuosl.org>
In-Reply-To: <20240317213626.4439282847@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710711432; x=1711316232; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TBgZ9N7SyIc+t8v4Y7nEiwvtj32H0V89SrmNC3VULII=;
 b=GFfmIoFOYuThGOvZnBzNI959GO1MmQ7/FNW7PxvluctDSpu7IRfC6aDjVB11f50fQp
 ZKxcWLtXxiKuZ9hMu33Gc5eJ/pJoMOEQcMlqbliVfCDdPCmkduX5mbyTP8GR3RWAH6y9
 pO3CkdHaHryt2pPJf9TnmISFSc74XDMx48X8k+gsbJpzAdb+hsp8RxlYokMtQH9gEYy0
 QF519A4vr/MlTzbz/djeGTB7YRCEyk6NsJU1NtxbuFaKbTI/fWCkrVIzqvGGn1MbGc55
 bw1LnJ5Xj8KmLcvLsiE1N28DMnnvqHlkvL12MMplzwNbb2LV0wPFc4Ij37e15+7DBDUE
 E2BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GFfmIoFO
Subject: Re: [Buildroot] [git commit] package/squid: fix build with host gcc
 10
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



On 17/03/2024 22:35, Arnout Vandecappelle via buildroot wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=9347905b95dfe045ee40ae69d9d3f00a2c1b7168
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Pass -std=c++17 to fix the following build failure with host gcc 10
> raised since bump to version 6.6 in commit
> c13199c9326fa2daa574f08ec8fc063a48d0eb06:
> 
> /usr/bin/g++ -O2 -I/home/buildroot/instance-0/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
> ./cf_gen.cc: In function 'int main(int, char**)':
> ./cf_gen.cc:268:63: error: forming reference to void
>    268 |                     auto &newEntry = entries.emplace_back(name);
>        |                                                               ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/613fee008c77f8dbbe04df9a4ce4347e43de9ef9
>   - https://bugs.buildroot.org/show_bug.cgi?id=15997
> 
> Reported-by: Roland Franke
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/squid/squid.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 3a9edac71e..6a2b522336 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -21,7 +21,7 @@ SQUID_CONF_ENV = \
>   	ac_cv_func_strnstr=no \
>   	ac_cv_have_squid=yes \
>   	BUILDCXX="$(HOSTCXX)" \
> -	BUILDCXXFLAGS="$(HOST_CXXFLAGS)"
> +	BUILDCXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
>   SQUID_CONF_OPTS = \
>   	--enable-async-io=8 \
>   	--enable-linux-netfilter \
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
