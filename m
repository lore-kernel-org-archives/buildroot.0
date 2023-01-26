Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466D6C54EAA
	for <buildroot@archiver.kernel.org>; Thu, 26 Jan 2023 22:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DB648254A;
	Thu, 26 Jan 2023 22:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB648254A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRkGVQ1E3XWR; Thu, 26 Jan 2023 22:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D65582560;
	Thu, 26 Jan 2023 22:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D65582560
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F18521BF34C
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 22:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CABDE82560
 for <buildroot@lists.busybox.net>; Thu, 26 Jan 2023 22:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABDE82560
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQ2WkISP8r_E for <buildroot@lists.busybox.net>;
 Thu, 26 Jan 2023 22:22:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBFC78254A
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBFC78254A
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 22:22:15 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 88so2854489pjo.3
 for <buildroot@buildroot.org>; Thu, 26 Jan 2023 14:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsL7zfW/aZH+7LI6RCp1QZN+KDK4n4YmkCGC0T3uwW0=;
 b=w6xBbW/EcTSz2CrnCFyngM28XwPOc7hKYf704vsI0jnfjhP/cJSAuqEkhNgsRKRrPP
 SuPXpX33/8OfxHTe3nohkRAeWBuJXLRETEjWH3PiqqwDVnfjikC9Ec8six89fLj6zu9f
 i+H5I4c0B41aAPmEPYtyUt/iZcI1iF15+8cWZ1yAvy+W5iEdwIbdwiIVbwn5Uzhq3ImZ
 UK/rrdbOzpyFiIY9W4xb65ikC32Gkt6ku6s72ZGnJ6uHfgYwmQdBTNkwq6Hp4+38t9sU
 nc6dp5FzvOE8iMWyJsM5jn0+D1GAYZWn996boEG1ZQkxKaW0s6FETuHCA2a22G4K+Tnm
 xvAQ==
X-Gm-Message-State: AFqh2krJzmEQwOiBCASXyvZa/3yBBAEp9HaDZKQ5EUox6+cPPGcU0s7r
 /CI7uplBq6jBfx78c2rAE2c=
X-Google-Smtp-Source: AMrXdXu4WUWPRaPvvC+CiKMuuNau4rgPtqH1CZpK19QXkOT0pNEI1w7qa6+eTAReDsQtIs+42+OSsg==
X-Received: by 2002:a05:6a20:4f01:b0:b9:5fd9:efc9 with SMTP id
 gi1-20020a056a204f0100b000b95fd9efc9mr23191444pzb.20.1674771734872; 
 Thu, 26 Jan 2023 14:22:14 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a639311000000b00478c48cf73csm1162371pge.82.2023.01.26.14.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 14:22:14 -0800 (PST)
Message-ID: <7c025ff4-0e4f-111a-18c9-54441d322f93@gmail.com>
Date: Thu, 26 Jan 2023 14:22:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230126185049.3600233-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wsL7zfW/aZH+7LI6RCp1QZN+KDK4n4YmkCGC0T3uwW0=;
 b=cOBEadd9jmB3taVmgYZ2lEljDu2zeSs+3NUqWD+oCAEv38I+xOCqlko4LhqOEK7ucV
 vD7Rn+34N9K8Dur1iMFtkagIYsb7kNWn3LT6VvXjH8KGqIFDXDZSs2nlji9L4C88BhqM
 3rcKPJI8tqzUg+U8mnKCZj8V75sIGUTwxmNHRaFTq3d12fuBPd3We4U1sPK7i5QWCttr
 rGe2Ibjqt1N6SpS/7UeP/VwUzH942tnr0GC3hvG/Q2jLVEq3rvsTaEn9a9cJYoDKkMc9
 5LCOboLtRur6NuKFQBm04TSHFkfUsM5risTdN97ruB3ZXFAZYhjfy++zRoPgY/leHb83
 x94Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cOBEadd9
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: fix builds for older
 toolchains
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 1/26/2023 10:50 AM, Vincent Fazio wrote:
> Upstream commit 1fa60003a8b8 made a change to headers that broke
> compiles with toolchains using kernel headers prior to 4.11.
> 
> Apply the patch slated to address the issue.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/e69886deb6ff466db96043388b5dac7271a5ec58
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Why not also take patch #3 so we fix build issues with musl C libraries? 
Thanks for doing this.
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
