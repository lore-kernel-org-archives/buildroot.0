Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B800ECE585
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 18:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B9C580E4B;
	Mon,  9 Sep 2024 18:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkEqJab6P0vO; Mon,  9 Sep 2024 18:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A7CD80E66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A7CD80E66;
	Mon,  9 Sep 2024 18:39:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE8231BF33E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99C5E4030C
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPPwqP7wcttK for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 18:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 307F640316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307F640316
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 307F640316
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 18:39:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-374c7d14191so3177145f8f.0
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 11:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725907168; x=1726511968;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AcdlTpH1E70MC++dAIjTfIYRPeVUpMkGxVEWlqo+4hU=;
 b=Ma9kXwiTifhejm7TeV1lD30mD7Ycper2af7gBm2DW2QMRPHaQhErYM1jvdw4Vcyphg
 6yvWSQ+tSEtRMEVTFnSKuENjLjqBI0d9WQwZpCz4zruRVXpCn7oW3tbMIRGLoDa709Im
 ZtC0Tw+MmW/XgDY7xAlDt3NEioE8S0Xi6Iz+HAC/7gBJTzKljiptGmx2hGsouv4ejBwl
 uiys/gbar3LoLkDCFKJw6Fh89j4hr3HHrkiwlR0LUhLT4M+4qjmNODHRoumJNPNCsS9v
 of7JkxtO1ozwDx2mn5Whzi3S+FG4H1L/JGctZ8IqB6pZRHuQ2pvEEzYyNGBf0nPgdHs2
 y1Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFZ2a0enwTQZwdy1CVa7g6m6pYbZ9vY8Ccil4UeTIwZrvFXTr74520akO0K3YHAw8wG2NFK+agSBk=@buildroot.org
X-Gm-Message-State: AOJu0YxhSX5ZNWVq05yCg5rIKv1/cu1LOcmXoKwohWy8v/yUT+YBngOu
 I74QXCnkfW6Q8D6WxiQDIg0fPz9FrYAFdacB8H3AZioqQBIJYhTtycsjJ0x0SLXoqZjVs8W3EqE
 Y
X-Google-Smtp-Source: AGHT+IG1fqEwNx7QjDWvulJC33BnNULJaeS38qAYj1fOmD20C9BK6hdS9DwhZkBTA/dzhnqTZlVGQQ==
X-Received: by 2002:adf:e5d1:0:b0:374:d130:a43b with SMTP id
 ffacd0b85a97d-378a89fd5b5mr364044f8f.4.1725907167531; 
 Mon, 09 Sep 2024 11:39:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3941sm6685680f8f.84.2024.09.09.11.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 11:39:27 -0700 (PDT)
Message-ID: <953fb6ae-0313-4160-915a-cae5367da531@mind.be>
Date: Mon, 9 Sep 2024 20:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240908181505.403963-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240908181505.403963-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1725907168; x=1726511968; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AcdlTpH1E70MC++dAIjTfIYRPeVUpMkGxVEWlqo+4hU=;
 b=TbgDXzvOn2bCOnm3okSuPS/bHgO0N3R+XtelHvQv+FPzs/za4FwFZRWb77l45k6Ubb
 pfbV3NOyP2rzR2/ziBUaG+HVNfsNEisOiCGdDSun3Z35jjEuASyUyuzZGCBtFDSecTU5
 PtUpYYJ2tv28bmudjGvZSjoItOIHdCo74uKCOtHBobCboVWkRhJTk/xadfP5zDPlReFa
 LFhPI1VYmXPe5X0p6IvJ6MOHFrKswv+dGR/hyXYn8lacu5QtJ99Ir0CYJTQuGMJ+GE7A
 yuw9lvrDB26btHXFDhnMaZBpEZm1juekE4o+V6RyRTNkSYFFitgwq5ujz3vSdadKwF9U
 pmUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TbgDXzvO
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: fixup download URL
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



On 08/09/2024 20:15, Dario Binacchi wrote:
> As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
> guaranteed from the download section of the project.
> As suggested by Dianne, the maintainer, for now we "can grab the tarball
> from archive.org and then figure out a way to make it available to
> buildroot users".

  There's a mirror on https://downloads.uls.co.za/rp-pppoe/ that still has the 
3.15 tarball. Perhaps we should use that one?

  Regards,
  Arnout

> 
> The idea is to later submit a patch to bump the version to 4.0 using the
> official repository, which is https://salsa.debian.org/dskoll/rp-pppoe.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769
> 
> [1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   package/rp-pppoe/rp-pppoe.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index f50f1e5a1fd1..fae66894c103 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   RP_PPPOE_VERSION = 3.15
> -RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
> +RP_PPPOE_SITE = http://web.archive.org/web/20220523050110/https://dianne.skoll.ca/projects/rp-pppoe/download
>   RP_PPPOE_LICENSE = GPL-2.0
>   RP_PPPOE_LICENSE_FILES = doc/LICENSE
>   RP_PPPOE_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
