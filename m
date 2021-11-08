Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D9DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:03:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBE061054
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CBE061054
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2406085D;
	Mon,  8 Nov 2021 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykFTPAw5dsJO; Mon,  8 Nov 2021 22:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933A060858;
	Mon,  8 Nov 2021 22:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B00811BF2FC
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C5C1401CB
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mim_IZfSL17N for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E642401C0
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:02:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id ee33so68761496edb.8
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 14:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bpGEd++k6Nix503r0ajlOHAyUU5d6TgyNx3aU5j1ALw=;
 b=TWXfAQluVI8z2DvCcJFvXf1zfQHyLWHD/hE5GwVS81R6hP/v4UpOEsFfy8TvAlQ9df
 BBDO/cL+zOJFEvk8S81IzVjAQ48v6z57x4TbUqXUzKVVAZguMxNd1g7x2+7c0owwVAo7
 0bFNdymsKzWxfQZ3MmvoncOJJnGlsr7SYndLEONbhqHVLEMSf7uV4/TjffgWN65gj/vW
 4HiAFTWDsyHjdZDVEEVQZ5NaISt05blSZXpoEOkQ9CBUpe31jayudqm2AvkETvQZgooa
 +Ieed6N0L6aTKNFLJkjFCVeeAjxh9uxjuJ699vWOwTWYYwVWTunAFVLHjRU8zXPwZ8iY
 Sp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bpGEd++k6Nix503r0ajlOHAyUU5d6TgyNx3aU5j1ALw=;
 b=eFSf4hekJBShkjJjCktsYmWKMDMF4u89MpGz2WUK4mXCMM9nmLXXlsenDJ7+ewxGcY
 FPye800EM3mWKrxMslpLwYR1ORnvd+MSYbimvXeGoy5ua/V4NOpRqSxkARTd/t6f8ezb
 K3/VrAJ8OHIr4S/sDYKvMkOWVd6Smi6pUNzXzeWFl52dDbZt9KYbzWNFQfdoaxgkQyZX
 Ak6XNifKxFndH4+qm6YLyKvZZ/381h/UWW8Fauj03xqanvRFcb8Rdjxc0/QiH9Hf2OdH
 LO4XTg7EzS1aw+GKuuPOk4uae6fHMjfiLyWmA/zYC1wqSX5bp8+7cugX0pAa6ai+I/vT
 BtKQ==
X-Gm-Message-State: AOAM5324lPNJvSdmJiGiwzXPucsYwtInCM+1QyXHfz5t48KbslHvmoIF
 c7R2O8bsmhNRFlUnuFT9/HV0e+mvo5oX8w==
X-Google-Smtp-Source: ABdhPJyuc3vC3l4svm2oqylqcfXf53vcbTp446N0Va39KWxl49xoSgUEO3xwv1hYEghfw7E8SmX4hw==
X-Received: by 2002:a17:906:6089:: with SMTP id
 t9mr3148219ejj.323.1636408974609; 
 Mon, 08 Nov 2021 14:02:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y15sm7314283eda.35.2021.11.08.14.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 14:02:54 -0800 (PST)
Message-ID: <de0870fd-2afe-b5f8-d245-fe8c8e6599ca@mind.be>
Date: Mon, 8 Nov 2021 23:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211107020336.3056910-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211107020336.3056910-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 016/102]
 board/bananapi/bananapi-m64/genimage.cfg: beautify file
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



On 07/11/2021 03:03, Giulio Benetti wrote:
> Beatify this genimage .cfg file to have consistency with all genimage .cfg
> files in Buildroot.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/bananapi/bananapi-m64/genimage.cfg | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/board/bananapi/bananapi-m64/genimage.cfg b/board/bananapi/bananapi-m64/genimage.cfg
> index 9730d8faac..52127167ce 100644
> --- a/board/bananapi/bananapi-m64/genimage.cfg
> +++ b/board/bananapi/bananapi-m64/genimage.cfg
> @@ -6,6 +6,7 @@ image boot.vfat {
>   			"boot.scr"
>   		}
>   	}
> +
>   	size = 64M
>   }
>   
> @@ -16,14 +17,14 @@ image sdcard.img {
>   	partition spl {
>   		in-partition-table = "no"
>   		image = "sunxi-spl.bin"
> -		offset = 8192
> +		offset = 8K
>   	}
>   
>   	partition u-boot {
>   		in-partition-table = "no"
>   		image = "u-boot.itb"
>   		offset = 40K
> -		size = 1M # 1MB - 40K
> +		size = 984K # 1MB - 40KB

  Since there's no way you actually tested this on a board, and there's a slight 
risk that one of these defconfigs actually needs the full 1MB rather than 984K, 
I've reverted all of those to 1M.


  Regards,
  Arnout

>   	}
>   
>   	partition boot {
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
