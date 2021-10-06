Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509FDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1643611C1
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1643611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5BBC60F28;
	Wed,  6 Oct 2021 19:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rtDXvZS9heYZ; Wed,  6 Oct 2021 19:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1DC60F25;
	Wed,  6 Oct 2021 19:26:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D05D31BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0E98840FD
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id veI-WVgqZnhG for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2472A840FA
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:26:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f4so8754896edr.8
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+uONb2oOGjSiJrGW8OCUnSO21vXaicTAbZ5spnNsjIU=;
 b=ZhxlbT9Cv+Cv8mr1E0i8w73NUOompDwCSefQHJUIDRIgBaRu/6qKvQGLm8YIOYk1o/
 flk5A1XkTlC56+k7DeKdDthRxmDac1OS0lAovu2T+KYe1NCFBEdBPUOfkzngUVPpZJn5
 KIATiF1dR4BM/UP3WVmPyPb18Gn46X4a2HajOMJtyMHWH6O6zPoHxH7UWsW0tcAKly9O
 d2PtnPiWxDWZvAdb20UH0CHirtZ+Xp1/nLmobLmzq2/yuEbzxN0WYm2GU+/mmyxw7RVz
 s+D7/vcyZjCzTgT9Os0lbPB/EETYzp97P7rsulylWf1gmSVPzv0xS+9+YjB5v8kdL6D6
 tWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+uONb2oOGjSiJrGW8OCUnSO21vXaicTAbZ5spnNsjIU=;
 b=w2mo2VgTf55bavRSR223/RPwdG2aML4VumUKx70BcxQRCAQWLuHZ+tWFqDVbjnnSy6
 X1hkIJxzV0DtWZmJJAr/DAZmfu/exZTAtD3t3JeYkn2LG7oSXOsCK9yBh/QIfk42B0nh
 /8CmvsMNJSYqBCrIiDlAl7GOIk4p0tIznoRzT6ZdDlLd+OFaz4/GxaG+3QMIruFRuwkU
 iiwhwS4DVRHMm4nI9naZ3/Grej6MKwmvLZYtFbxEwCiU3kc5ccC4k56dgu1vq9M58VQC
 qGlVTNagkRpUeqqGsBo579MHc2WzHKtql8HU969VPt2UxL75EYEHZvB8MDHibBSQxsIM
 uCwA==
X-Gm-Message-State: AOAM532jR0Dgj2djVwrcHXdmHsxHMRlDMW42WczoADy+Jm6hEQ79GxNL
 5sRYuJaUS6xuZHk0D1i5zePAuQ==
X-Google-Smtp-Source: ABdhPJyibKjUE+11hFO4MBEpmbPMivyYciPGPGbbGRGSVYtwt28BqtahstMauNwcS9kp3JdB93ayKw==
X-Received: by 2002:a50:d8c7:: with SMTP id y7mr24475edj.133.1633548367392;
 Wed, 06 Oct 2021 12:26:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w11sm3905446edl.87.2021.10.06.12.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:26:07 -0700 (PDT)
Message-ID: <9ed998e3-8918-0236-0824-1cdc2f7eec69@mind.be>
Date: Wed, 6 Oct 2021 21:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210923164832.1250360-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210923164832.1250360-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to python-uvloop
 package
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

  Hi Giulio,

  I prefer the subject line to read:

DEVELOPERS: add Giulio Benetti to python-uvloop package

otherwise, if you do `git log --oneline DEVELOPERS` you see a long list of "add 
myself" from different people, which is quite meaningless.

On 23/09/2021 18:48, Giulio Benetti wrote:
> Add myself to python-uvloop package.

  No need to repeat what is already in the subject.


  Applied series to master, thanks.

  Regards,
  Arnout


> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 926c6a27d7..581b5cd7d4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1063,6 +1063,7 @@ F:	package/libnspr/
>   F:	package/libnss/
>   F:	package/minicom/
>   F:	package/nfs-utils/
> +F:	package/python-uvloop/
>   F:	package/sunxi-mali-mainline/
>   F:	package/sunxi-mali-mainline-driver/
>   F:	package/trace-cmd/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
