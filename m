Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235B8C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D673360D5F;
	Fri,  4 Sep 2026 12:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9Tl2bQ0XZWi; Fri,  4 Sep 2026 12:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C241660E59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524372;
	b=IcIW8ea70C7l+sJrxUn8akM7Bfrpk2zLpO5dlYF2cBJRRdnHDasaoGtVfKKviETOCVb5
	 zeTgkKY9U9sqT0Rn4u4ONe2RWGDuBS4skpMjUMtg7YVqJFJ20PjmCxKx307bf9M9ypqiZ
	 8YOmLz8k0s3PuZnarY1QIG8ci28X0sXkiFb8XqsL1Vn50xowhkLRVeDkaIhQYgTmQ/LVe
	 TuimSEcq05+nl74r4I87IrshzIRxHYMGHyrfKNXyMXkWoOOT04OzG/dPjKjU9N0u8j9AS
	 kobtkIktaOo2sDOvXcfgPYMapWXIsWkdGTPkS4e/XMoXzb98MMJkVH3x5ridBL/UVMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524372;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RMNiXzmUkiSDEVTaEYA7iNOFFlpKhN4QLp6HpHRk5RQ=;
	b=gVgFxOjH61i8aXCXHYfaQoWJ28QtcDp0LGS7HOMcUWmBb/C8XVwduKG5yMH3sJ+b0j/p
	 NcNjXb5sh0GiRpDfb+LiHqDu3uuKtI1mYwLHlcxwojpcpE91qt/JEy/5X0LDj4Vu/lepe
	 KG6W3bo3Ws2TF4RtO0rAbXLv8dez2EIvLaToSyciMOnZaF9v2l77bgNMSjKUfdBQh1jbJ
	 1Q3IZANR3wsRa54ZJeSoJjNmADzMaGBpd8rwVFme407rI4gjnFclVI+qQTsyDUEnMOZtd
	 RnC/ZLc9JlUR8WqHnV1bN7KZhlBrcR2UqoWmNHScbHslQvM3vzRUAnkjeTvpdSqYkLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524371;
	bh=RMNiXzmUkiSDEVTaEYA7iNOFFlpKhN4QLp6HpHRk5RQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eyO6jPEjmXz2XfPeW/KJ/pweSLHyH3//jbpd/dqHdEJcFf6xcDtZ1BRpc+AjGfKYZ
	 W1CRSs+ddJYCO1OdAWArE2mTkP0lOpfqRpePAsKlrkotzlgZmgJ4RemvQ6GKDJQ+R3
	 Sao3zsaBEqdSQIMgS4O+ZYcpEUsIPGYusemwca3icOREvhoTeIbmQlsKE/JPqBl4NS
	 vSSTau2R2GQ0S7Sm6wL0TY4Y48UKMdXt4uc8Po3dTprmzlIFQoPRjBNOvwWwHlG8ws
	 QCOuq7PB0NN6ErTCcXxxqLSgP6P1CVFaEtoNz57CzUsUM1JvZmrfcBGUx9FH/cLnVf
	 5mytVq8rWVtMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C241660E59;
	Fri,  4 Sep 2026 12:19:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAD9E10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB56581174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtC7hClHQ10Z for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AA1A981172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524357;
 b=GcyWHPdSGRxjPQEAKfvU/0j8lU5zNvyaBSAQVpxWZalJIGXUTpH4dBPBDiVSKGANIvUu
 L1kIcUMWU17gAnh9LHVkXBdQUSMY2pmpalday2hrTFGzX3iKT4HkIYM9xDG+dpmYa7fhd
 4E2OQAiOaZgm2yX92vmQYLD4WjhKb2vFb2NXHXitc9jPkq4JUpAFPpMRDyY0wWqpgexA6
 gcanKmWjKmlx0iMuC65FcISddtfZXKJrzw0c7bpJNhwykmtJqMz6GnFWduzNE6BkKukiN
 ADZXsC9ZEaowz2dk+IpxGe6wrbnAwHnxQFwCkF8tW+cyl5QfeeXhD+8IFVRfTp3FD7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524357;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=WQvAnKr+Dd44m44JDT9w2ENdklwPmUS7/DXA1eRWhxg=;
 b=svb2lQ2HCttaJNNDxR/+T35TIA4uMt7tG+c5aP+IWjAfqnhVmv8uPK28ATdORsmXWlGD
 x5u6Hkmj1Azg8WV9gU5lQVUkNDn5bVeRroQUcIdB+G7P+um2XIU+Ydn2BN5caG+5CsICh
 pY1AysQx91cMPTC7uxmHSpwJ7451WpJnXcI98Yi0JqFLtwAQ3n22fDrJaKSvmKejvIGbZ
 uXbfdrrf4tnMpeEi4DfqHF+M2xMoE/ofAwNtrcaBrfWZ8JH27GmgS7dDfM9hkQeWttWWW
 q9hyxBE+hnwg/R8cvZeM2jg15zY0XoqjRLtCQNfb7hmJyR5zTueh+OFic7h1t1kii/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YR+XVnme; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA1A981172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so9907465e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524354; x=1789129154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WQvAnKr+Dd44m44JDT9w2ENdklwPmUS7/DXA1eRWhxg=;
 b=DBj+acD8SQG/2Ze2J2Tf53xPOZ5L/gpezBw5nup5vlt3g+pN38VUwvGHmfYW4Y9Gft
 kW8d9IufghSP6nZeUa0bBkrJ1vq6BwH8i9nCvZ3O8bH7R3qLKPQ+55tNmr+2pw84nrT+
 Gsj3BFTlTyh5iAA9piUzwUlypfaeLXSs0dViRCE44uXx10HBCPY8w1sdRNdtXsQR7H+O
 rC0Cha+PlYJVZ5ZcYuwGaxN8nJVa5aAxihMkZC9YxuluMPILW7VgzU7as0H+unVU5SQ8
 qZXSYqf6RaybcZm3Xfh+itTW9LsJCnLZDcB6lwirmKFYDUPV7Qx26UK5GbnYQ00J7JnJ
 Ap/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0hD3fLpQnhOWHp1nMoympk3smikrxlI8SqMyhwxrqYdyxHeSi7SqyqAtH3+jQ2LuRCVN2iD0Y6mA=@buildroot.org
X-Gm-Message-State: AFuF++nAzVbujUIBW0XDO5pafo+8oz+r4b8ZciWMsD8SZg6LeFIlQOPy
 /xa5BzmF//1O1shvVxkTfTURwZ52mtD8KzlIYiZIDeLYV3IPxqifaCEi/egOfbtrMyY=
X-Gm-Gg: AYBFou2CUJpao4FelXFapfwuXYCV4PBCnuvwjAqCf6gPQetGvqSzaP7MQRp3+qhjVMO
 2xXbm2soC2+idA06RSnPPUjYXKzQOsppFjuJJ6CkIiCuPBwrmp3WtYTlt+SUJ0nBf5xbUjkbkZh
 w3J5rxa32SV8ig4Wfk6gc3zH/W7vmDCrL/zsNJ4jFTGCZv3kqpdTJQt+7ChgjtCgA+fzufkYaYF
 hI6pokWtJcoOwuqoUU3nbJWJHYM+PBN5YskP/ibWeCNabRUeV8dHE1q8bQBPH1wefYAz+FrM4HE
 q8VnD64ruOj1MoMjWnBYeHtbCYWndRLH8wPodSXL4QwdULCxyxYQ7z3G377MdjsKMI1POelLoC1
 1mcUPtcCYyj6Y3HUsTBJP1s+8cKbp6U25WGvXRehfOVrdfKON3zZI9lO0KcJlwMOJO1s65CRfJs
 EQfCXXCgE5T1JdjtE2s+wW7WIIgiB809HrzxTq0xlVGhByjwvp0NrBsw==
X-Received: by 2002:a05:600d:849b:20b0:499:900c:9c69 with SMTP id
 5b1f17b1804b1-49cf825d8c0mr46327985e9.9.1788524354027; 
 Fri, 04 Sep 2026 05:19:14 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff81c9b5sm3643115e9.4.2026.09.04.05.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:13 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:12 +0200
Message-ID: <20260904121912.406829-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831140530.443610-1-titouan.christophe@mind.be>
References: <20260831140530.443610-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/vim: fix hash for README.txt
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
> Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
> However README.txt (used as part of the license hash check) has been updated
> upstream in [1], without any corresponding hash change in Buildroot, leading
> to build failure.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189
> 
> NB: This also affects 2025.02.x & 2026.05.x, so this patch
>     should be applied there too.
> 
> [1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/vim/vim.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 57aa3dd49d..ec3e92aaa0 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -2,4 +2,4 @@
>  
>  sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
>  sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
> -sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
> +sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
