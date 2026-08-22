Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E60DC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A3960609;
	Sat, 22 Aug 2026 12:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q__y9nk1H8tI; Sat, 22 Aug 2026 12:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787401827;
	bh=Mwn7mWVtx73nFy0GfD+CuIOMXRYlO1E0HPmh9Jy125Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jFqADisQpw/sw8x+NhaQAMLEMMB028jFZaMXnlLt0kpoS8S69gtCJW6MutlKQCWe6
	 Je+o70Yj9QZ3KT+ZsFEIELms50jsFfwuHW+qDkPADTJrfIqMZ/BiKubH7C/x4crUMu
	 X8BRvfjPZch8r2iGHEeV53v2qgUhL+Uh+CLWJbGwZSp1niCVnvbfKPiKRlwK87NEYK
	 t8h0wBYehpCCbTr98rTqnyWWbRaXvZvhQ/nK0LpcfRi3CO4Na8cIHVoX1rBCqSjds0
	 RGlyw/1w1ncmLMyYx9C8K3lwCgJhJJiO7hxRL8vhrzcbAaitZjqJlyGP9WD8PhZGNI
	 qxNA6h0JVMStw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0BC60608;
	Sat, 22 Aug 2026 12:30:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7EC82B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D0D605FA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YO57n0hPqxf for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D48A60608
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:30:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c207cb16cf5so306952966b.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787401822; x=1788006622;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1xZYVofRLlTg/zRp0oa+FhHbgTuE5m3rGy1tM3byhz4=;
 b=NnN2zILVSuEeXqz2PrEgK3wQLBwS/hAM91FKDbR2fAxOFJyrCmLGRsMNLvLarr5Bqh
 iTVZNPqz2Ucc/axC8JqaR0/8dN38dJu/uPbMUuiMSaznmwlJp66MXGZVMzeS6uALCsLg
 ZAlYfr1rd5wZgtzoJzIUZyBAL0S9AONBJppFRzhZ9wp9dPOyQ/qNCQ1ONaFCZkmR31JI
 THRBKHvrpWv9LNaEAjisgWT65rv0C49GJFmgP7v2z6SBLdxq8QQIv6ogfKHNMKabJ+e7
 HXcGpcP588xBX7YIeAbAvzUXhZpO63XsnNd+6XvTK47CYnnYIFwdUwXZbucn2rlaIt54
 YKtw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvjovQp6Wb2cVBPXQkJIgOyc64SnMpggYt0w3nrhw/XNnYXVm6eZrXZVQdW+rqNcI0vLQRmKkrFGw=@buildroot.org
X-Gm-Message-State: AFuF++nLHQ6zjU93hWiVWN+i53BoFTUHHkd6KNwzjfoNjFsuliw48If4
 b8m0sSnOsM/XxnmzzxO7ZFwFXLLwq/xyPqVINT2L46noWlog5SnqMDbcUecAyIYQU6/PnWJmTmo
 W8jxA
X-Gm-Gg: AR+sD1222iRrnKkqAYYMddRH+dwFw04q3vyJ6URyYLb4fEk/DX8ySEseOfcv0d3UwHu
 WD2OBNRRxFz6dIGuEA8eyD1MCgENPDE2J5iqoE/L4zMIhDzq32UOKv6Ztdi0n1TwxayA3YZd37U
 7T9fSyjMpFTSUYjUwrTmarP+d7inmtVAwd5dhcPOQOG7wcH+uq/2BTcj13MXJbJsbM0o1fknid8
 DPaR8f8/4owZqkTF+UpQEj2l26pVm29cxnTpFM3+sc5rJWHvTv/YhIGc/gJFLdqBN3RTn+2djPb
 xZMZObnjlGoUtrNp4tWj7wrvgDVyK61Y+NdY7cYYg1sn1jW9rNAV4Y1vhiI0Bfbj3nxU/JpsWXW
 fNKZ2Z/vONrkQ4+fh7T24HwzyIvrGu8nr2/RKLnGQau6qe22BW4Eljv4S+QJ4ZZU888hI8SK5G7
 WjMbQC+t1hkwDv7UIj1i2pDHu08dpq8QwKfHNSMwsnCzMybLeQ2rV2qAe+XQiKqaUrCX8K+uIAM
 EuCp7PFgCalscnFghWTjgnMD2KfNrtUaohSXgaqAa8ssvjz
X-Received: by 2002:a17:906:eec4:b0:c20:1bc5:6ff1 with SMTP id
 a640c23a62f3a-c246a2cf049mr1404333566b.5.1787401822560; 
 Sat, 22 Aug 2026 05:30:22 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496866c4csm332264566b.54.2026.08.22.05.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:30:22 -0700 (PDT)
Message-ID: <27751632-bc59-4962-a5f6-f72f7c9af908@mind.be>
Date: Sat, 22 Aug 2026 14:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thierry Bultel <tbultel@free.fr>
References: <20260813143405.2868517-1-fiona.klute@gmx.de>
 <20260813143405.2868517-2-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260813143405.2868517-2-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 2/3] package/dracut: update URLs
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/08/26 16:34, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
>
> The Github repository has been renamed from dracut-ng to dracut. The
> wiki still exists, but the actual documentation has been moved to
> dracut-ng.github.io.
>
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
