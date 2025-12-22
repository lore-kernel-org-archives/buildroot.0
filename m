Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B27FE677EA
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 16:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9C481224;
	Mon, 22 Dec 2025 16:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVg99TI3fjYr; Mon, 22 Dec 2025 16:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C240B8126C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766420853;
	bh=VEPnIEMWyXAnBcZ6pukQq80zZCQ/Ebvl/YWxeyQK8EA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CKkmmGunc43lKUwm69RiecpwWSSuDuo/n69BFJQsJyma2CRrMzbWtGZT+dauDjUQk
	 0E/YtMF7WvfGHJijHbXMOx2YMt4U6EY5vGhMqP44p/n1KjUpB5ZsyJxV0vfCvuQwtb
	 +mlWCEa/gWd+J7YDNdNtbLYzwoSCipKFMPq89oU2T1eC2OqGkxVMmPt6bpHCe52u4u
	 1EmUUzooPVZhUPOswuNk0HBFeLZOl4WgmCqRFYoTlO9NQWNZkgTbPJg+EdZZVIcbnG
	 iXXFO9cVPPpPE81pPP8adOKJ73JXpOIIGqk+2opdlODFtqivGgn+EeZbQ4m0Ceh+9S
	 0miOw+bvhj3ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C240B8126C;
	Mon, 22 Dec 2025 16:27:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F5CCBC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45883606F1
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l68OWBfoNC_3 for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 16:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9F6E606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F6E606C7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9F6E606C7
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 16:27:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.123.109]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6KUd-1w04Ki0Ry5-00zdOQ; Mon, 22
 Dec 2025 17:27:25 +0100
Message-ID: <49b70deb-7181-4a28-8f1a-7daa4c82b753@gmx.de>
Date: Mon, 22 Dec 2025 17:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20251221223441.185169-1-bernd@kuhls.net>
 <20251221223441.185169-17-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251221223441.185169-17-bernd@kuhls.net>
X-Provags-ID: V03:K1:vKyvLzd6YxCDzmnkiuNCyLaIwX4zPBd0HJ5eWIHMNAUL5IPWCx9
 2sPt9yINsW5KXwikxuF7qpqk732cIj5Wt6pbQMMzwm7LbSR9o7ai8TfPL2NC23JpgXfgNGO
 Q/EWNl864wMmQ75BdK44tVOvDn25s9GEf+Aq6kUHii3o0PQoRS1cu3VNbzVc688MFzNbR0n
 nsU1lteoLxtgaTgt0Cdug==
UI-OutboundReport: notjunk:1;M01:P0:ORUV8ZmyXpY=;22PAxbIbpRX6UlrzMO0GvCKXBXH
 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
 gN0wsGHM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1766420845; x=1767025645; i=fiona.klute@gmx.de;
 bh=RdDw6ZGwnhX0AAb9X4MN5355o8Xy6A+g3W86e+Dqkok=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kf6i2uhb3NiFP3yhqR1n/ckBapEWhg7NAOIAKVy0l6BlcNPqFSlHWmLxim7d1HF6
 BhCeyGoKg3Zmy5qIh0cJH1OJX2zA/788D2Hf4QloiY9qseAFggCN0KyF733MY6ZNA
 6a/W6JjjGSpnBDeEArqEVbKdw4EMV1Ggfr2ZyrVDvUlAG/kDe+H1RxEbfDLSFw5Xz
 W/WBGPzaIF71CYClQPFNNnkXd6QgWqSMOknpdHaWvqnQNFSHMapAW7DXuLCl/s5C1
 cTNaUWs8ng+DfJ212lKW8j58nq5gmGJ0/z7C8ODFxNxS4341zAVVefk8fVd/xOS/F
 zXo2B7a2N1LqPv7YUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kf6i2uhb
Subject: Re: [Buildroot] [PATCH v2 17/23] package/python-pyasyncore: update
 tarball URL
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

Am 21.12.25 um 23:34 schrieb Bernd Kuhls:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Reviewed-by: Fiona Klute <fiona.klute@gmx.de>

Thanks!

> ---
>   package/python-pyasyncore/python-pyasyncore.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pyasyncore/python-pyasyncore.mk b/package/python-pyasyncore/python-pyasyncore.mk
> index 4b1e3c98b6..d86ac2cad8 100644
> --- a/package/python-pyasyncore/python-pyasyncore.mk
> +++ b/package/python-pyasyncore/python-pyasyncore.mk
> @@ -6,7 +6,7 @@
>   
>   PYTHON_PYASYNCORE_VERSION = 1.0.4
>   PYTHON_PYASYNCORE_SOURCE = pyasyncore-$(PYTHON_PYASYNCORE_VERSION).tar.gz
> -PYTHON_PYASYNCORE_SITE = https://github.com/simonrob/pyasyncore/releases/download/v$(PYTHON_PYASYNCORE_VERSION)
> +PYTHON_PYASYNCORE_SITE = https://files.pythonhosted.org/packages/25/6e/956e2bc9b47e3310cd524036f506b779a77788c2a1eb732e544240ad346f
>   PYTHON_PYASYNCORE_SETUP_TYPE = setuptools
>   PYTHON_PYASYNCORE_LICENSE = PSF-2.0
>   PYTHON_PYASYNCORE_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
