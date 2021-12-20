Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E76C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB035409B1;
	Mon, 20 Dec 2021 22:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8ZTIGnxBmR0; Mon, 20 Dec 2021 22:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA64C409B3;
	Mon, 20 Dec 2021 22:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49F461BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46A3B60E39
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kisrYfJhC-4w for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55836607A1
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:40:46 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id f5so21248429edq.6
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 14:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MkONopLbI4l+ICfAlVy82oBVoufNfh1fXE1zISrwOpQ=;
 b=ckvBYc9doIF/I04URikl5UrH7EiGY/X5pcxAkhuj0nSdILtvf+qHw5Oi2vH3CRICKW
 0vNjJtXvzoE9kE1P28GmaCV7dIgDmGm95Y7zohS7zH43LKGtGPE5twSB258CIrQplCCv
 J80h9pFhRGbxYEmwHiPHPETFiTDXBXqDzOf8MoboTWlshf904ZBHDlF3V47l5kpiXWO1
 f9r6/YifunzPgxL9jpJnKo5ZjBT8Li8OPsdMr11pu41ysqe2rGKG1chiV/BWwHmWxjth
 q3azrPoKQHchAxX7zqd2SqVeN/0H7QkS5KW/AU4Hdi814YrK8bGAiQBznCwmL46PiCgh
 2esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MkONopLbI4l+ICfAlVy82oBVoufNfh1fXE1zISrwOpQ=;
 b=bx/FdTDpVQdNVah0PVi3s/jQ96MWXtd1aEJfviFt70IxogJexceQLbKTT0vDftuM50
 uGHY1RzXJblOdAyizDjTY7hvOs9BikZOBTwThSMNmXQB1gRxqhNepAIsseJ/71gXr5i6
 N/7Yo9f5FCZiCbkSGYcyt9InfW9BN29iX8sC3R2Sz1P18N7HOKGA99DAiM9zXokTA/LU
 p+orgyv0+ccRFJls1DogCkX29KpMFV6cxSexq0qtxjxS3NFE8w+h4+FpiwUMulJ9+Ih8
 HMPTovGkd7cISunvmWngAKlstuWVg1RohG++XZHFcrq8N0JFlPcRK5KDDR5H/8jBZEUJ
 zs+g==
X-Gm-Message-State: AOAM532uy8Hv9iqK4rUj0d1i/x7jD6R+8EDMGNsaoPnQ+CICZt+hp3IF
 vWy3WsqCQdKugmGaBtt8L3tPdA==
X-Google-Smtp-Source: ABdhPJykC6g7cKJ1CvWwvVJ0a5i9czzEDGvxmHD4slrSuhKavaE4yPmuMqVcogKcP7NutQb5K2DmWQ==
X-Received: by 2002:a17:907:6093:: with SMTP id
 ht19mr273440ejc.286.1640040044670; 
 Mon, 20 Dec 2021 14:40:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z18sm289587edc.76.2021.12.20.14.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 14:40:44 -0800 (PST)
Message-ID: <aa0dfcd7-cb92-4125-7f86-80d959cc6fba@mind.be>
Date: Mon, 20 Dec 2021 23:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211219173830.1364434-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211219173830.1364434-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lxml: security bump to
 version 4.6.5
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/12/2021 18:38, Fabrice Fontaine wrote:
> - A vulnerability (GHSL-2021-1038) in the HTML cleaner allowed sneaking
>    script content through SVG images (CVE-2021-43818).
> - A vulnerability (GHSL-2021-1037) in the HTML cleaner allowed sneaking
>    script content through CSS imports and other crafted constructs
>    (CVE-2021-43818).
> 
> https://github.com/lxml/lxml/blob/lxml-4.6.5/CHANGES.txt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-lxml/python-lxml.hash | 2 +-
>   package/python-lxml/python-lxml.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
> index dd6446e6cc..e33a8f8109 100644
> --- a/package/python-lxml/python-lxml.hash
> +++ b/package/python-lxml/python-lxml.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256  39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468  lxml-4.6.3.tar.gz
> +sha256  6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca  lxml-4.6.5.tar.gz
>   sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
>   sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
>   sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
> diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
> index 0d3775a1bd..8c2e965af6 100644
> --- a/package/python-lxml/python-lxml.mk
> +++ b/package/python-lxml/python-lxml.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_LXML_VERSION = 4.6.3
> -PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247
> +PYTHON_LXML_VERSION = 4.6.5
> +PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e6/e1/34b3ab08553fe9a30e15b2bb9d1803a49d7d907dd9f245638839190042f0
>   PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
>   
>   # Not including the GPL, because it is used only for the test scripts.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
