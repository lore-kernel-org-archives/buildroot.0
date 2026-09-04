Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA01C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E417160BD8;
	Fri,  4 Sep 2026 12:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBT2moiYmhHC; Fri,  4 Sep 2026 12:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8966B60BE6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524304;
	b=rTSbhSxX4m92TD0TzyqLkTZQQf0aPrF70YFq41eKd6kKh55cA5kGkYWJ6C7CQhOXejaB
	 HY1kpJN+z1toJxJSptvnqECkL31+YHeWcIy9r+Mk7zFnG0qPXlwVAMGOOb4wTJgri+E1l
	 dks+VcRxecslK1LvkvPTjyjVnd3OVxmt8S9nTMrWaffss8nuQBMK1yrdoVkyOaTZ+7Xay
	 Yh1eTAKG9e8cZpppqBfDCzx1YFQtl/7sC8VR0XAc0juD9eeGWZOEnmeoDZfchys08NQs9
	 NL5kyHHl3FWWZHxF+3yGbuX9Lz0hfuQRQcJm7k3UOeF2Kmdc3p2Y3GCJYPbvaJZwWiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W6I8bizoViVpntzzCwQL5DZghT0XXySmLkLZAywmjqA=;
	b=NRN3CkPT0lR1P33UXSivv3dNJlfgkJ78rAG2q9XLY3hcv07Oqna6lpq3tbPqDEImohl0
	 vl0juUB762PSOWdiDPtQnFhhm4lHtME2mdO3b3x5i0niKerjDlCAEe+yISKqIibp8wix9
	 JgRN/HC16QeUZQn7xzRT2wc/qefWilevaJIk14M9u9vvWKpHIKsFUueNxh39HT0dBbcZ9
	 8mq+xcpeQamlMxVnXPvhAf+g9sM0i4Rv00bTmKANOvU9FrvG41Hyp54fYjO2B0y1fBHHw
	 R5e98AKLZDcaGnI9gtyhJRm36hLyMFeZ+ZNxtiBjHjPaVoleh1P7sQrenTf1C9ByvFw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524304;
	bh=W6I8bizoViVpntzzCwQL5DZghT0XXySmLkLZAywmjqA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FAwvkD9y9rYoYv6evNjlVtzbRZQcdTKHKraNbBHUaVnyHE6w8UNvHB+PDDdtaKK6k
	 hYPAA+x15HEc9GwTrXkCr5ePy59hSoSB0PQO1zUsC+83mzeU+CU0xWvG43hhrMh/s0
	 sufoERJz2QkVPMTmn6Vfyh1gtKbLCrTEAn0AKZMo4B6b2zJQ3+AstNEoxtlzHuuRTc
	 5bPKNyyqcWvJzOJ0ygd3zwPIOsfQYBFCBKqfLBaih4bmsDh8i91JuIaWq8yXW1U6sZ
	 ZPAi8CG3uwBgF4D8RcP49WVWl6m8zacTUL2loaAq72bkzHPiYQq4irq60ZYTLI7pea
	 9XM4HDAN8ToqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8966B60BE6;
	Fri,  4 Sep 2026 12:18:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5837F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EE240B92
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxbKsIIRObod for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 588C540B87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524302;
 b=kJnX13qqN3R0bbOQjTEjVo+kcnHGdm5mQ8aBn5qKMnTgUov7OuDaJ/bnHrslYjy1f8pa
 LXWBSpUwA4A82jxeOrKylanaecj3q0G+YPwWdIzmwH4g7zxE441tSrUdKsSx61Csr5nY9
 qKdqid6fVslZD5X99W5LVyhfV9wnIOp4zqwTU1WhLY5F6KJZnFDE/IvfU5Qbstd6mlS6u
 LRX5qUyoTn9AI4rmqsRejOP0IMytMG19QVVp4iee/ww9GVfOqe+3ecqbj4YiT4vh/UDje
 hW2RIoBzZ8St0WHiWAnJ8yi8K6e3jPvaoiUPEXfh3bzj06Vf/hXYtjTamsbW6suw1XA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524302;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=k8l/LA8qn2ZpIrn2bPYLuSVC51lncK1yzJYSpnqfe+w=;
 b=IPO4W9A/+WKlHqXnmDQWYWUmioMYLh/YVHtlO1Fw4jjuJug7Wd0ZXfjEfiMFCle08N1P
 gTMfbFRjC6MAP1yk+wVdAOEa+A/d7oZWjE73U4/EC/yPldCatsRng4yumCJD2/F6nZflo
 JvzbqsobFOuK8UXKjYgwQzDybcp7e7hSYKepXRcjcUG2rLF6Ahmx2XNUX9HEl2MYVMxe8
 qGh3TnHJ1Rm3nFjuH7Er93eFVFC1VO4kcRXRXtG/zwIyOwIWlbfE6g+6PVH26qhgxCjQ1
 U39dnbsfD/CnMWAye7pbOa6yJJSQLu/+pObOrF5B6+X39qe21keAX7SIubi+9g3aVpA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SwdXTvh3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 588C540B87
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so996682f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524299; x=1789129099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k8l/LA8qn2ZpIrn2bPYLuSVC51lncK1yzJYSpnqfe+w=;
 b=p9M7yKiL7CinLpnMsfLITh+UM7shLHuy0MBj3LDuwWTA7nq6pzTRk3w2q598Mhnzsy
 DzorOOmjoY/UHKIizcmJNTXVHlEHZAlLLiEOai1MawzQZz0EQUhDc+V7eyCCLMijeU2d
 6cCidTRkFJm/QHLswQJik4vOuNxTT8a38o7m1+jISKjaxHZCr0U9TND6TolKjqZYelqB
 YHZUWR1BRx/TsnFQydb/GX7SPp99qBLgzQvgR+/KAVojFF0Lnm5Rg1R0/CIfqXnrBMvY
 jgZb5NKfghgXrk1iqFBhsp1fQ+7G5SyuZsV0l24HSV9Ag9o93QoHaqB8F65p6wmUTd1c
 arcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwzhPDTCiKN+4CCIZKMxRlvHTk20pZ5sG8vatO88hV08gF2bGK1YLHpKkiJLB7ab2OjibOgEVTgJls=@buildroot.org
X-Gm-Message-State: AFuF++niVq41M0o5xMWMU76wq2xfYQL4SScozVppAE4Y/lo1ehuH0Xb3
 FSWoqCIGh2ZEVT9IdI9wuf2/UppBFtjUBe1t4y0RXdyHnetVmDY8NzVDyDZzQpgZF+s=
X-Gm-Gg: AYBFou0VFzuaksRiVc0c7rwoNCChyJnYBB1PmNGPJ72ohueQDr66a+LWiKgbKyJE0RW
 pcbPwN748sGtup/WKr0JYpSthqqPDazxrdJTXLWEpJBTfcr4YW0uIEDNZsnep+JcmmXsNvdQVuB
 JSJok2EuJd9S/mrbzWgsF2jn+bm53s5/xwYBC/c+XgH4bjhCoLfsVa/TjSHwxfniy75cC4KWsnd
 RoCnI1Br7APm7mY2MZptjEQsErU81PJl0ynw2UJzA++R7fTv/6vVdal/jrMEjVTtjKjF7mF2Pwf
 h855uzOxVV2RB8uckc5kSbINBc5/7M8KPM8IB6oSl2pFnPdL2qpXDYLh9VCXt9Bq91BA/z88SnW
 SFfHYt+0pmAnfYlhJKyI0Z9riuyM1wJAYJ5gzEt8cVcL0SteViVVxk4FlwGtB5pWlDw+MM84zVx
 aOyE3Sad+7lVD+ka+hzKbQ+DzKwDbtSQhPK3Vw7qW8htJEE2TzlZTt1g==
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id
 5b1f17b1804b1-49cf81e368emr69555445e9.6.1788524299185; 
 Fri, 04 Sep 2026 05:18:19 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46696e8sm134787655e9.0.2026.09.04.05.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:18 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:17 +0200
Message-ID: <20260904121817.404736-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fdb46336-4f89-29f1-d418-e80fd7f88363@crashcourse.ca>
References: <fdb46336-4f89-29f1-d418-e80fd7f88363@crashcourse.ca>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual: minor aesthetic cleanups in
 "Getting Buildroot"
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
> Minor tweaks including proper capitalization.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> 
> diff --git a/docs/manual/getting.adoc b/docs/manual/getting.adoc
> index b3a451f67d..4b5eae0150 100644
> --- a/docs/manual/getting.adoc
> +++ b/docs/manual/getting.adoc
> @@ -15,14 +15,14 @@ available in `support/misc/Vagrantfile` in the Buildroot source tree
>  to quickly set up a virtual machine with the needed dependencies to
>  get started.
> 
> -If you want to setup an isolated buildroot environment on Linux or Mac
> -Os X, paste this line onto your terminal:
> +If you want to set up an isolated Buildroot environment on Linux or Mac
> +OS X, paste this line into your terminal:
> 
>  ----
>  curl -O https://buildroot.org/downloads/Vagrantfile; vagrant up
>  ----
> 
> -If you are on Windows, paste this into your powershell:
> +If you are on Windows, paste this into your PowerShell:
> 
>  ----
>  (new-object System.Net.WebClient).DownloadFile(
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
