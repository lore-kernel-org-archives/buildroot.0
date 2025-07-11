Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FA2C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D94F831DE;
	Fri, 11 Jul 2025 10:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mr2nfzXtSbh4; Fri, 11 Jul 2025 10:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929E183C50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929E183C50;
	Fri, 11 Jul 2025 10:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F1431E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A75B614B0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4pOiCSh22S3 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EDE861443
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDE861443
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EDE861443
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4530921461aso12768275e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230693; x=1752835493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sI/Jh50SwU1H9FHA2YZwVMF6qF/k1CfLJP3RIs4f7vk=;
 b=owni5BpdpX3nYg0C1IBXGSeq6uacxLNugqcx+/+asIqEkqQrrxdjdfxmbWILG5JnOu
 6/N1HIeMA1cbK7kitxlTSTVjrlKMSO56mGq/0l4eue4ntDRsL4xD+LduVzab6f2tGQ3/
 9/IGCxnB1Q052xcZ72O0BGaYRETJ+SpH4xhLb0eLSOb3wN8Bx+d3s6dB0nrZ3XA1n7S+
 FDvl5r8cBz9W5AsR2oK+QVaX7TQWTin7S8GLkBQe4JA7zlUYcNzrrSMQOnMDf2WE5e3u
 vP0jNsMyc8wpY+XRrtl48yobEZexkuFTzURWp1nw0QXK5Oxoqtt3rI9cRTAayp4r7NwV
 wmaQ==
X-Gm-Message-State: AOJu0YzOcu7aBnQ7UPe5vavRZ4VkXojuCxvxmvyllXDjUlGvl02wMbwP
 99OyUyjQ/8VMql4NHueikZ+zPxiNR7SU1BwEvxl6hGeaEigNFdvkRk4q94XadekSj8VtUiYbnqp
 iq4Ss
X-Gm-Gg: ASbGnct089skB8CJRj7VcEFgq7/wNGgUC3wGTnfvS0GMj/HAR3d3U28YHmiPj88Zytw
 r8Xi2BD7jM37uJAcZGkBZ7SmsQA638pWDa/R1sBCtuUrFQrs04BLQcG3TISLCKR5YiPIGwTzCIc
 OmQszY8gP2j3RgDI5lBoURg9HY6iiAL30k7MuLz8+jik0wGojAF/jL3pcKWc3y+A06cRtTA+ZyS
 FvnEltQitkBhdrDHTbz3BIqcmxZBVmTKMJegKefeNRtOkI+1ScwiQTYbqeYnA8kq0n4n+DJn+Dy
 2/hfes7SZn/1zvCZQKNpUnQcreUFRtxYbLiu2gFmmyPCbjZLYmjmpGGe/eBc1bAcQtknsGMdD3j
 1jQdLJcu1gQZJZw==
X-Google-Smtp-Source: AGHT+IEnrNxhNRQeMyBCPf/RjnH1etbXijiMDz68rXSuO2Ss9Zt6RlumHHpA1ma6w7f7qFMCJCNSZQ==
X-Received: by 2002:a05:600c:1d9c:b0:453:7bd:2e30 with SMTP id
 5b1f17b1804b1-45565edcd42mr17783425e9.29.1752230693181; 
 Fri, 11 Jul 2025 03:44:53 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd466154sm42976075e9.12.2025.07.11.03.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:52 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:52 +0200
Message-ID: <20250711104452.823993-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250703182831.4027280-1-thomas.perale@mind.be>
References: <20250703182831.4027280-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230693; x=1752835493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sI/Jh50SwU1H9FHA2YZwVMF6qF/k1CfLJP3RIs4f7vk=;
 b=OavulXwxqlAGBQblfU1v4bf9yesrd12JiX9CHgEejEeVnbTDCgt5ndBk+xuuNMLMtG
 AtF0ZiLxCGia4RYT/aCflfHvzABsivJhT5kNiakQtRMIxlFVHC3OlPPwxfeVx3ZKJ+LI
 CUWJM8ev+v1Ft6VrlpYNeijixUKHLvB+9tth1DPlvIHrkfPKgn8VS5mBXnAcOQCkcvxK
 CxhcQpxjcTvD+tRqC6XSwR1GGz+rRUaLIqbx/lxaqmtuL29hNkpOniHXvO1waVu9gNDY
 wqOzPtbq81Q0fhOXsxwZbDSAYrlSGE8tUuYsmlhLqVOAJ/kb1AXO8RCyJ+kl8NV9OQEx
 PBUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OavulXwx
Subject: Re: [Buildroot] [PATCH] package/cpp-httplib: add CPE identifier
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The cpe:2.3:a:cpp-httplib_project:cpp-httplib:*:*:*:*:*:*:*:* is valid
> for this package.
> 
> See https://nvd.nist.gov/products/cpe/detail/955012E0-158A-4637-99DE-37520A12BB7D
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> 

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
> See associated CVEs such as https://nvd.nist.gov/vuln/detail/CVE-2023-26130
> ---
>  package/cpp-httplib/cpp-httplib.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> index f3a8710d20..712c3f7293 100644
> --- a/package/cpp-httplib/cpp-httplib.mk
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -8,6 +8,7 @@ CPP_HTTPLIB_VERSION = 0.19.0
>  CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
>  CPP_HTTPLIB_LICENSE = MIT
>  CPP_HTTPLIB_LICENSE_FILES = LICENSE
> +CPP_HTTPLIB_CPE_ID_VALID = YES
>  CPP_HTTPLIB_INSTALL_STAGING = YES
>  CPP_HTTPLIB_CONF_OPTS = \
>  	-Dcpp-httplib_test=false
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
