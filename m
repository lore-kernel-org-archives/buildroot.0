Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623DCD98F2
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F06CD86041;
	Fri, 19 Jun 2026 23:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8sh8RrYuyLw; Fri, 19 Jun 2026 23:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ABC886020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910248;
	bh=e8bJYN3E6dp3Jqf7O9seF45fPk6Akds41KT2tcszuxY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sf3rf6x2Xo7ZS0mqEIJ1hkjJDP623t7w8mmNp/L19rkrZfyAgPV9CjSUF0W588h1L
	 vHGPElofy/+THaj/2dsqcbuN/HBe25EO99f51qSY+6d6HH90tsPSqknApB2Bedx8so
	 ngwi8abCmwObzV1yZtmLYIDDaY+HkXegAH6bsH+z6GFkoV2zvJh16z7/oqLR4G/NYD
	 t3ulB3fkrd6Upby6LERBujgoPrPJi/kNgam76lvbSJ2dup1+vZ+7esZJN6kyZfEnSV
	 9lGppn6B9MRv5m/+tThrY1DuqpTNM8uznG6lH3xsFgT5fk79+08yoZJOSEF6ZlyCEj
	 qucEV0eQ2c+ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ABC886020;
	Fri, 19 Jun 2026 23:04:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02AFD367
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC33A4ED22
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAygFCmfK0TS for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:04:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 723774ED1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723774ED1B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 723774ED1B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:04:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1wPTyc0tYX-00EWbY; Sat, 20
 Jun 2026 01:04:03 +0200
Message-ID: <2c40e132-2718-4a36-b37f-a70ea7962f3b@gmx.de>
Date: Sat, 20 Jun 2026 01:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260618195501.2584001-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260618195501.2584001-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:rodAQnZOgRlscTbNgS+xDv9jWdLK7bX00sE9wMn4vFT3e9H9+QT
 MqUPr4z1tY6kMSzbftn77HEF0C6Mt5+ovVdchK00k0SHPSlMDp7Ff4IDw80wIjTzvZ/K6qJ
 gSCcAXAv/VvJBJWHrhJE7Iudbzdv2kZF/20iSM9DqZRA5+umFaTTeUyXbsQcfqA9IbqE+yr
 jMVQMv714rlE1kX9K6AvA==
UI-OutboundReport: notjunk:1;M01:P0:oLJKhlGGlws=;gR0MVXfLLsVPs9ZGN/+9Z0WreuV
 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
 uY5D5atzBEu1P/1EEI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781910243; x=1782515043; i=fiona.klute@gmx.de;
 bh=ohMz0gaYx2NVmEiwzy4e93xIoAiniZJT0woL0NCG7/g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Tfar+VDWn38LYgHGPzqzw0rY8soSAszPpxKd2sMbEtbeoxgLbRmIXlQRRgjY0I8A
 feR9pHFnmQjCrqYN1o9jIW9nRbVj9RwJNksaV5bxvqSF6ImAGOA8V85Q3XyH0woni
 i63V5vGpsvcu6T2Zvx1nXdhyf02B97ZkoxuFQ9XFnvItSLUmHu/tZFKTpIAHsZWeJ
 tM0ixOb7VN8lnhmiJUKBtHYbG+9qrNXIBBoIm08mOeknX8j5wWr70ImPD9LDAZP/s
 1azJsTK+tYMPGeKkv0Ol2IClW4fitkO0YMlwFoJOcW03qurnHjOyVNxZCwxG1V1/N
 GeWNTX3v1RHGPW0r5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Tfar+VDW
Subject: Re: [Buildroot] [PATCH 1/1] package/usbutils: fix comment
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

Am 18.06.26 um 21:55 schrieb Bernd Kuhls:
> Buildroot commit b94ada76083824475e92c51b14042dc8f2a66717 added "wchar,
> dynamic library" to the package comment displayed when the package is not
> available although the package does not depend on these features.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   package/usbutils/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
> index fb37b8a9e3..4a54626991 100644
> --- a/package/usbutils/Config.in
> +++ b/package/usbutils/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_USBUTILS
>   
>   	  http://linux-usb.sourceforge.net/
>   
> -comment "usbutils needs libudev and a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
> +comment "usbutils needs libudev and a toolchain w/ threads, gcc >= 4.9"
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_PACKAGE_HAS_LIBUDEV || \
>   		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
