Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D638CDB46F
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 00:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC40880835;
	Tue, 23 Jun 2026 00:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sg-RFYCeXZIt; Tue, 23 Jun 2026 00:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB8DF80EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782173085;
	bh=QCabLwfjdJYWV4gDt3SCbveNY2k3v4ig/jBkC5CUoqo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kjnMKyHUljcCEQWdB4Kxw7t2BHGAH/WkM9Gqy0JK80Rm9dFkB43QF5vL+2yiq6Yer
	 Jokkt1TM8Sq1w1ZB7ogl1T278Oie2NnaPZzwaQ/My6oLeHqS2VcDQp8Srn4eJChEn3
	 rJUtRfniV04fjhY7gTTpf7FhDhQYudys+VWh0RIHPMw6JUWhFl5kQx1IwnbxTizKCf
	 9TXIKD/KjghY2Qt5MBjgU9twkYxkEif86qDpftSl/AWvSN8HSLCk5Yr7enCCFQnUTr
	 cbJx4mRdvwZ6AyqmSWs4etf01smFTJ2Q4F5ZlZiJGWIT7gnQlQ9iHPZHCOx5Dd0eDb
	 yibiAYhRQnN0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB8DF80EA5;
	Tue, 23 Jun 2026 00:04:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB554157
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC9DC60717
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEuOPTh8M5v2 for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 00:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C21A60715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C21A60715
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C21A60715
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:04:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsHs0-1xQkWb2g4w-00slPY; Tue, 23
 Jun 2026 02:04:39 +0200
Message-ID: <b87e8e5a-4917-44c3-b87a-95c98d4efd1f@gmx.de>
Date: Tue, 23 Jun 2026 02:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr
References: <20260621164634.2423931-1-romain.naour@smile.fr>
 <20260621164634.2423931-3-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260621164634.2423931-3-romain.naour@smile.fr>
X-Provags-ID: V03:K1:YZtzGk9ZbXCibrxUsVGQ7mO9nnpeXJlarSAqCPJ7nN35FTsE8JK
 RyycAJz0nDzKunuvLpFDoRl4pxjUZXn/RuzZpgg0ZnNSUTbFUC7KjdDlqML1rnD81nGUjmy
 qcmBsV4+elG+lZmn/mAMlpXORaEAIm+2mR2D4eqdFy8b2wF0B/U6GCbjsxUJf4O0NsQ6+0R
 DvllTr8N8UWql39CcxQdw==
UI-OutboundReport: notjunk:1;M01:P0:E1M2lyJ17H4=;jGMq0+PPV2E0RolNa+uX4oHmHK/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782173079; x=1782777879; i=fiona.klute@gmx.de;
 bh=dfBdO4QoSiiLpBS4bNUZNcICADLcPjdBWpJs888ewvQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KowYdNz2VuU8Yz3CPWKSoGVT6PsuAIpSTlT2w+zrbqCpshIudp6PrcnwYs/Xt2aS
 J3wP95k4ihWWiulBdz6690AvMhC8EfNAT3cxzhFuAtP0y13hcwEmqUHc9MlrQ1npB
 dP3XzfCCLPZboZOr8f4Z6qaDOKUdqFXDvD1Uzt03KwTjd7ibx0J5GV+cWNWNQJgIq
 JRJQY6ljnuOoY1v7YGdHtbfqQCLIrouZ8f+dqhKcF//0BBtOiJZdyAVL9CjsFICWk
 J8zIlvNBs5lylBZWjdU4TENrkHtxxeBHcJgw/LPg8Q47AsFWfgrih8Tu13aoQJv3v
 z1xIFc61dsGoqLndQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KowYdNz2
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: TestIptables: bump
 kernel to 6.18 LTS
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 21.06.26 um 18:46 schrieb Romain Naour via buildroot:
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   support/testing/tests/package/test_iptables.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> index eeb4ccb5dd..a4c5e87d8d 100644
> --- a/support/testing/tests/package/test_iptables.py
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -15,7 +15,7 @@ class TestIptables(infra.basetest.BRTest):
>           BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>           BR2_LINUX_KERNEL=y
>           BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.82"
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"

I'd prefer to use the latest kernel of the series (currently .36), but 
it works.

Tested-by: Fiona Klute <fiona.klute@gmx.de>

>           BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>           BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
>           BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
