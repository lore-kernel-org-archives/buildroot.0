Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E540C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C15F840A8C;
	Mon, 21 Mar 2022 21:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0iH-5knylBI; Mon, 21 Mar 2022 21:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C2E40A8A;
	Mon, 21 Mar 2022 21:18:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60E2E1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50B0E403B4
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5mzSM2xhv9N for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 610D74035B
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qa43so32333630ejc.12
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nwy1AfiXivUh5iaV9q4c6kNolwPONHWQwRqs/QC1AkA=;
 b=V5mWRTJ421lg2zoMXJ5KnwrajlWFr6KlbhIX78eS/wsBsuG4PCGkNj0O3igvi19DRI
 WpTx0L8cYfENARhqMwLt8OVwh3nt+mPmjQoD6GGgV7o0hQBqk0PQoVW/m/7Y5l0nDeqz
 fyvRJXJrVCVBnqU8Y0dphPzcJtLPQODa+itBtDBFI1FRyCZnvXQ+AiyR45K+TZz/UADh
 DH7rJEsmUGrJNDq7H6gGgGpr9baDRZYbCakTArap/Tv1JFuGfjO5hU7Sey5+aihX1D5/
 dl+EWq6BbUO4Aodc8frUdARZOPEznW6i93/QqNJ97c7ZFJTbbhtnHtTozMRpNpWhW3uX
 WbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Nwy1AfiXivUh5iaV9q4c6kNolwPONHWQwRqs/QC1AkA=;
 b=zkl7ga80khCvJBoaufUGEvx3rVqVl7+ZKmCevsVTNGu3NnQ4gyz4YY/4VmD93SGQT0
 bwGu2opIkNAffMWgfR3VwjK+CJ+oPcGr1KHlN8304GBTl2K4hoF5nuAO1o3wL7Tg+UFg
 GcElhW4vEGPcrnM+PXM5JtGZm8P9zJuTcMTTKAElDU2JAFFLc31HEr+o7zIi37b4pEwh
 oIytLaCa3moXY+63MSA6pNLt7gv4aYu/OuwBhE9t/vHvyVcUV+8LnrHGOW40cOxRKMSj
 tHIT4sPJEs8DMXMTKya9+/sI70wnq2cJ5lBg/prw+oG/QNbg1zyaJtvH3R58PKBsMSKI
 rVVA==
X-Gm-Message-State: AOAM531DiBc7A2S+km4sbgNqTkQr6KNvHwDAY1cnJGWOoaqTwENHoXRo
 P3KgkTUciOukXGVpuG74K2V2bA==
X-Google-Smtp-Source: ABdhPJyw5EZ6sJZcqnmNzhLV99onW6Lq/tvuuYnzi2RhmMAcj6vt3rZJoFcPp8IVQSVKbtodqgP3MQ==
X-Received: by 2002:a17:907:1c16:b0:6d7:622b:efea with SMTP id
 nc22-20020a1709071c1600b006d7622befeamr22641116ejc.110.1647897494635; 
 Mon, 21 Mar 2022 14:18:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm7453334ejj.142.2022.03.21.14.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:18:14 -0700 (PDT)
Message-ID: <78b67931-ad98-a385-d250-e259ed045f21@mind.be>
Date: Mon, 21 Mar 2022 22:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313092821.357580-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313092821.357580-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tree: fix build with gcc 4.8
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 10:28, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 4.8 raised since bump to
> version 2.0.2 in commit 11a3989dbf7ac2535fac04b24ab3d959da3686b3:
> 
> color.c: In function 'parse_dir_colors':
> color.c:103:11: error: redeclaration of 'i' with no linkage
>     for(int i=0; i < DOT_EXTENSION; i++) color_code[i] = NULL;
>             ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e05595696727622eaf517944d4ff4414baf66bb2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/tree/tree.mk | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tree/tree.mk b/package/tree/tree.mk
> index 7c111b47d2..da0acbae49 100644
> --- a/package/tree/tree.mk
> +++ b/package/tree/tree.mk
> @@ -11,7 +11,8 @@ TREE_LICENSE = GPL-2.0+
>   TREE_LICENSE_FILES = LICENSE
>   
>   define TREE_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=c99" \
> +		-C $(@D)
>   endef
>   
>   define TREE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
