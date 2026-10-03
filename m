Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E4CCA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 632DA412BA;
	Sat,  3 Oct 2026 10:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nglPzSCCwYTa; Sat,  3 Oct 2026 10:14:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 68F3D412BB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022486;
	b=hId14UYFtc65Ri1KArhZQII+RNrFI3GwhUR9v+bVcqQqzRwIJIqd8ZajTPSFvaFCmPuP
	 XjuX40JL72OpCfAMiEvaaHisbKU7RUsnemWb2RaxHFvDeKbvfUAnPWkQvCeaxq6NYqpAE
	 IPnEoDy1rXrEIt26TL0WzD4utNPPWIO4wUJ2+tAbiumTUPYivDo5CsIrzvbVT23H36AJE
	 vck0i6+WJZb6TKZQR7kbcVuMmh8fARJABwMdymvbR396rh3WATKh5Q73rs/lgwTF5kQRf
	 oXV06Gejw0G1WBj57KPJWa3Y+fMZHgFwurGI5h/L3dsUq1MXvcmN3Hr7/+j2A4PjXMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022486;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YQhRU6yRcIiOIFyG9cIPutRpdjC5wAcfjtj+LoQ0ChA=;
	b=dI23nuQ9LPPFo7PYU0bWyqCb4rkH45YZhTTWW1mRabN8ZoxVEZ1o9ebt/e73Tg+1Zkvm
	 qrUnotlnro0qXODav+XvQfzI03wfOFF3egrHdjuHvnM+E6hWb/6mJIhN86nTO1kRbqx5l
	 uhgZUPYB+JtjdizTkuGZQfxCcrvKYK6OsjIEFWZ5Us+l47YzyWIvlOFSpfDN1HCVbZTjC
	 QOV5lumqqzEZILCuIpC7SyomDYxNz0cChAifM4wQF0qGzlcENl5mK3/U1xgL1Lndvq5CJ
	 54NqTYMUmYIyZdrjswmiETZl8HWurhLaqDgL7LJPCubjnftEwHmBWMJPnURSxbwQZtw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022486;
	bh=YQhRU6yRcIiOIFyG9cIPutRpdjC5wAcfjtj+LoQ0ChA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mk8Bn3tqRMqxVwJWk6DM8sVLcddPgXUNUVV1ohgwenHdplUdXsMwU2mXlHZ+IfwPb
	 Btpid1aA6qaZjymwBNhR1qMyXfluPQDd23WfCbX4y54cca7IWJChcd2gn/2Egl25s+
	 IT98bMzH48fbh0tIYOUjxtrPmXj95PUD1bVk4r3qQqi80otbyVa21Yksx5InlfOVy+
	 bOnxDHgrOXKDeDHpP3bwgbSotZFzYl7WWRX8QSQzeP/5zgJFQUoMjSumFSeRIrRbNg
	 YoT017VU6EZjVyFOwp7NJVU7D22UmRDfv+5d83rGX3BIdu29qdWDK5o+eDaBARq1qR
	 r4XO/BMi/4Q8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F3D412BB;
	Sat,  3 Oct 2026 10:14:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D935335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E7B81102
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGoFTCdLoaca for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 00DEA80F6D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022479;
 b=H49x/8oInaY9vrZqJ7+CCLxlKpUX2jRStjS4b+9jnPEc5RmFvH0FhwNCzT2d9quQ2ukf
 FJfln9Ke+fJ2OPTraJyVa6ni0mejxM/9Vff//YEBb+YkeCmJkmZZn3eDxCg+mg0v5JtnV
 Xj9d4HAe/lqOE72q9pg9f6G5AtXKAJ43d/vhnxdIeItZg+/bhxkjru2vtVGKqnUT9KOzT
 1Yi7FXXilerm/8L1jvb3lz8FId21DmT2z/M7oowBebEZEX00gkET8NO8wSbaf2cjMqSMN
 dz0cy70vwQa/nbb188B/017ckcyxQWzZSd5IyHVxMDaBMdGfgqVsYJmEFMDZERCyObg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022479;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=8BmUVwnENmvhHZMg2AqCBGpCZb8HBlM767FtuuJQFS8=;
 b=etzDZzF/36PEOnMe+cjRc+8d1fnK7piK3VXbpw9rurWmtGrx8dfAkRYNGNm0DY4vwi4q
 5+Kb3P3t/CU2H0RSOMOhYy8aYEB9VbfdhwRUB1x3+aGZapdJtARc5o0hFto14xNehCGcx
 +cfyn6oc7I0I2NJEV9+ZBH4BrENMEp4J1pdg1jgccHiRywngBiOTTOaG44fu5PQlwv8eS
 gV9ByhBLeWgiKZblTe2ZrVNwM+p44tSji4JUHSS8qqOL3qQKmIrtMY5EZEOEgOAz03REG
 s0Z56OlZ7MCZWDLZ3mpH3qzHm+uirdEZ+ZW4s/kRl0tnooiZD3hc1yBIwCUD+bXV8Cw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TZpv0pnm; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00DEA80F6D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:14:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhQC-1wrvIW3fPQ-00l1Y7; Sat, 03
 Oct 2026 12:14:37 +0200
Message-ID: <d77e8447-d366-42d0-b474-834ddafd55a4@gmx.de>
Date: Sat, 3 Oct 2026 12:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-61-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003070128.1295458-61-bernd@kuhls.net>
X-Provags-ID: V03:K1:uvXEVEdgQyLz5Zct35ISrX2qWGMyw882ciQbYtca0oQuuEpenWB
 HsOQK1VA7KvMfh1LZ06n2JmJ6JEjiLUTu9OxWn1rR+k02ZixNTNNkFzoNxer+vb4Z7xcrs2
 PFkcGnABDxwILSGLG62MgtZqxqZ4+2uvMfbELl2OSZ3frKZlE/wC1Uk2feMtBZxIMDGt/OO
 TczvqEwl8wCCmp54Wecsg==
UI-OutboundReport: notjunk:1;M01:P0:sZRZVPZeTkM=;EADF7s4b0pekmTcoOHSrePVINpY
 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
 =
Subject: Re: [Buildroot] [PATCH 061/114] package/python-pygments: bump
 version to 2.21.0
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

Am 03.10.26 um 09:00 schrieb Bernd Kuhls:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thank you.

> ---
>   package/python-pygments/python-pygments.hash | 4 ++--
>   package/python-pygments/python-pygments.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
> index 703e0f05d7..ce10f737ab 100644
> --- a/package/python-pygments/python-pygments.hash
> +++ b/package/python-pygments/python-pygments.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pygments/json
> -md5  358297d0a1db8e4beff8eebc0620960e  pygments-2.20.0.tar.gz
> -sha256  6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f  pygments-2.20.0.tar.gz
> +md5  4d661a27d62d2924d4c7b4ab53aa6dcf  pygments-2.21.0.tar.gz
> +sha256  610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c  pygments-2.21.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
> diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
> index 1daf0db176..1b14b56d8c 100644
> --- a/package/python-pygments/python-pygments.mk
> +++ b/package/python-pygments/python-pygments.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYGMENTS_VERSION = 2.20.0
> +PYTHON_PYGMENTS_VERSION = 2.21.0
>   PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
> -PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c
> +PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b
>   PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
>   PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
>   PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
