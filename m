Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF0EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A1760669;
	Sat,  8 Jan 2022 19:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDpVj2eOHFGj; Sat,  8 Jan 2022 19:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8DB60784;
	Sat,  8 Jan 2022 19:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7781BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9483400E3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWMyQ8diNhEA for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3014400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:00:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id l4so6125352wmq.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=tsNDbc3qicURQOCoaVaMaShGpdZ+ADq8fWN9QmRG76c=;
 b=X9NK6N2HYc6USjMUZb4ma1adFfqEq8N+plyXhQ4tziOK3lxndMDB4Us90Pw3kyd6Ib
 j/Y9fX50J6ymsTBIDRlti1wG1uMviUA3s7Zk7REnz3m3yMbMK9rZCfxykh+EZ6dOtwwG
 UojXRTTWqE0w6ShMeHFz9tB5/GcnAVxokzo2hnHOEU6Vv8TdgJe/d3FTJ0Qhl7i3p5ma
 v30Rgfw2eTPiPR20IltgL/Ejm8XiLfzDhzhk1R5pbqzZosyNqUqHSc8ZZVYMe9YbMK6n
 pK0e7TCGssHie2nxnYsz5UGsOw78DqBIX7RJ1f+s4dTc8Q3l6eRYomYEq08lQgHxnqDp
 hQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tsNDbc3qicURQOCoaVaMaShGpdZ+ADq8fWN9QmRG76c=;
 b=olHi/tkIdVgD1k8JiOBedIqM3eenFLptPukVZ5lDm+fRipz1ThjUxOUmch+YtAXvFZ
 Nf7rRLIPKDDluwHOEALMCbP3rBlVh6Dg+rUPBHk/BgsYLiaz3sBHdQkjjot0/hxcvm0k
 HWLfUodgwu4x5PFlbVDLTioCTm10wG3t1RH6o/SbTKRSzcnsSO/5yq3+9Yx3eSdwQp0Y
 oYXu7x5/1Fj4ko33OCO4l6h5jnVgsBjVrLb/fIEqiiqvhTi37uTZpE0tNWSApwylJ4C1
 WuiUI7BSe2T+bSk9CVfAq0vzZYHkxdoBUf+6JDdAVxzBnOmnfxkfZUqeqiK924mSTnxa
 qR8Q==
X-Gm-Message-State: AOAM532csqEYwSkYJfeYSsFC2+gyhFZOp39JsJ9eL35PhOLA81mNKqd7
 /Z67f8EHgHUEXI0gzBE2YpiPkM0TkJuX5+2S
X-Google-Smtp-Source: ABdhPJzqGRYAvEr72Fwqc8UiN+o97RAKBvd8IRcyHcugNLFDYf9zYwgU38Pnox1ymOTZ01R4DQ/ScQ==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr15501207wmg.112.1641668413910; 
 Sat, 08 Jan 2022 11:00:13 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id p1sm2489989wrr.75.2022.01.08.11.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:00:13 -0800 (PST)
Message-ID: <22056f35-a7a1-a900-b8e5-4cb5735a9eb7@mind.be>
Date: Sat, 8 Jan 2022 20:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108183241.3051683-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108183241.3051683-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: bump to version 5.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 19:32, Fabrice Fontaine wrote:
> 5.x is the latest stable version, 4.x is provided for archival purpose
> only and is not intended for general use in new installations.
> 
> http://www.squid-cache.org/Versions/v5/squid-5.3-RELEASENOTES.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/squid/squid.hash | 8 ++++----
>   package/squid/squid.mk   | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index b1a8feb78e..e18ed8961e 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,6 +1,6 @@
> -# From http://www.squid-cache.org/Versions/v4/squid-4.17.tar.xz.asc
> -md5  47b94b2d27516f1764c9d5dc1b9645e5  squid-4.17.tar.xz
> -sha1  f6bd15fabbd67b53a831fe9f67de3279868036c1  squid-4.17.tar.xz
> +# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
> +md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
> +sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
>   # Locally calculated
> -sha256  cb928ac08c7c86b151b1c8f827abe1a84d83181a2a86e0d512286163e1e31418  squid-4.17.tar.xz
> +sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index a30a87e20d..3847fb49dc 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -SQUID_VERSION = 4.17
> +SQUID_VERSION = 5.3
>   SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
> -SQUID_SITE = http://www.squid-cache.org/Versions/v4
> +SQUID_SITE = http://www.squid-cache.org/Versions/v5
>   SQUID_LICENSE = GPL-2.0+
>   SQUID_LICENSE_FILES = COPYING
>   SQUID_CPE_ID_VENDOR = squid-cache
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
