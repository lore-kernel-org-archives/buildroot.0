Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EDDCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FF86060B;
	Sun, 18 Oct 2026 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeqcjw72neZF; Sun, 18 Oct 2026 20:51:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DE0C660656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356719;
	b=sjwn37+OKJqnbPePsW0lA2ZMF5sXpXHVuKa1uh8qm+dwJiaN/7sQ6qEVl5yFVUgx2fWX
	 TNu1jmaSedRdgMFJxC0saxHGeMAirIIaLUJ4jua8ax5SY1Z6F8G4MzDLZSOICZr6PA+sC
	 LZot+bneV2+ALaGOu/hyck9p+4Y1RAXcOHQBlr0sTz/qntPujLyMbKayUS3iHlzDREx/3
	 o6jrgbkIfbmhnOwtYs9sJcoglOAJYZ39z2/OXmTmcAgJDhx4eAm04n/neChzJU8T4okYX
	 3+R/frMK9nG3keOpJcmgleHJv9Zh27hhWztV/SDiyM19eb2THyZeCl033IScDujnUlQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qGi2k+RmjlmxxvBKIWkvys/kT1gh1jZ4zd0idA3nLDI=;
	b=FTPcuhaA2hCuB4h95KJEXYaWH+g/xiS1S0rklGW9ekqbQWgdn8n2OH4jdo/UBsBytWT4
	 MKB5g93t2aOOxkKk8R47Bi88A2iUXO2CIDUKEeanC/v4S/sVv7hE6HpBuDJspDTLjMjpS
	 nzVgco2iq9xhzbLlUtJEwEbgxom9Phy3BosfwuuQm96i8db1DYJJNJpK5Uc3zGfmkZrnV
	 /SQrC+HNlG921fC5zxys2JKjJ0Zm7WZJz+OpO6/lvHfJJ1rmRa3/tUb045U8E336u5Aou
	 5BhzzMev5LQcWVTAwa1zQ88JFJIq1Zl4KG1MBGqiEk8HYxJRLhezHC/SvuRaNBIGCLg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356719;
	bh=qGi2k+RmjlmxxvBKIWkvys/kT1gh1jZ4zd0idA3nLDI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=NHBR2WPR0oF7QBILmvPnazcIu2V8BF8HbUc0xtSgHAKoFv1kFhEzTiJdf1P0KOMVt
	 oqD+8Ddf18HaiLl7whjsDMAgt7/hGQowzPYrdeAjbxeZwzcSptlnojIjl8GWAVJvoE
	 ibaZ409ltw7yNQDWyjmNao08nRU7mRFNRvMTjZuAs2y7wCV8pyTe5CpXZD3TyhR3CO
	 g9Ra51S+dKpW4sF/tvciaLK3qflNNt6Rt/JxvxrSBG9SZRF/kOTYXMssZjLq+6FGaj
	 +QBrSqzMLzt7+ebYJ6CN0Jq/Mwhw8dnqcYtzxB9/6HjYVV+TAaUz8yjYLynWOnsi3g
	 3AyxZWUSrmt2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE0C660656;
	Sun, 18 Oct 2026 20:51:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8416D7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C64EF80F91
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYYRa9mNHUwU for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4707980F84
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356716;
 b=OcuqlMIFfRUSc1gF2qoAi6enfcBapov3fBLfyAXX6YpHqGS2vzRkTzdz1gulyhnJok5C
 5tF7Vz3DcfpUtOgMGKUjkN+oHSx/1r7JL73jSHlBUrGC5T+vSXDlES4lWBYK8jYOjd0l8
 hUYQkBLNhFbQQh59gsqLp2erYht9/jvu90vBowOOoOb9+G4hpFuAXz6VSIgn4KS7TTd7s
 r5LQRGbO9V2uhEGNIjcOYNDL4i7qO5XcIkqJ5zjAx4mqJ4jAnFijowjyUw9ANsazVjIl7
 FopEBQUxdRDbFtCCnK7ES0XA/OkQwwzFCyQKmWi9npNg9g3u90DNRXA3cCXm/cTyTSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356716;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ggF8x2Y0soQ2+iaOEDAHmIBNXIEAsKJR59IFVKz7Vao=;
 b=G9LRJtnJKib/fEdbZ4bIrYL52wr6vGT0OiD8TVjDT2p13EJt7zbp2llnnySil59nsJFU
 doz8dvWaapViIycpMExkKTooUvTiTaYemvXI3M9u7gRfGsBczufmtZh3jc5+C496WWHRK
 opQYPPnhIV41mSCxST7uzPKfXUW/CnwSC9QWOKt+KTJl0+KG63aV56Po/c1gY7DVe2quj
 OgJ+qQFagDtqpXwwMEbItDCm098wGDnNiaiLfmPfrHOx5zlKEbAos1xV2x/84b81c+xUL
 xE7AK6SDRMpBA0kpZc4VVb+YvLcuw+DJyOh56Wx8VTPidcGCX/qmorid9wPinCc4Xew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=PZrNoUK+; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4707980F84
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYLQ-1whHEl0V4a-00jroV; Sun, 18
 Oct 2026 22:51:51 +0200
Message-ID: <65dbae62-e3ca-4450-a55d-598e1b67c383@gmx.de>
Date: Sun, 18 Oct 2026 22:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261018182507.536698-10-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261018182507.536698-10-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:r/Rb8lvxO04ceBMZLO3Tzb8OrXbY99VFVP/mBNDZFkoJg/FJsTj
 4qcTQ9xAKXO0gqD2Wz6mJqUn0CrRI6TuZJUubHeAK0VogpL+efiP2GERP6zHj/Jnehm5lhh
 Kd4iOsT1Ij9bvqH9PhXf7CQ6QuL5sijN+TFo9esGdFdrbvowAr5MUfPhCqXwA43uQsT3TaC
 Q7vcXvF+mn6HDmOzDYG7g==
UI-OutboundReport: notjunk:1;M01:P0:2PywLkIJuPM=;BVhbzPxl20jjxafD2fOLCGtvIul
 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
Subject: Re: [Buildroot] [PATCH] package/python-platformdirs: bump to
 version 4.13.4
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

Am 18.10.26 um 20:24 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you!

> ---
>   package/python-platformdirs/python-platformdirs.hash | 4 ++--
>   package/python-platformdirs/python-platformdirs.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
> index b9051298de..4948b75cd2 100644
> --- a/package/python-platformdirs/python-platformdirs.hash
> +++ b/package/python-platformdirs/python-platformdirs.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/platformdirs/json
> -md5  5872f9a2772efb2608f4444b5339f833  platformdirs-4.13.0.tar.gz
> -sha256  1aa0b0d3f224c1f07c295121e312a5a24a180d6ae5a8425ea1784b3e3863e9c0  platformdirs-4.13.0.tar.gz
> +md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
> +sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
>   # Locally computed sha256 checksums
>   sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index dba59abfdd..2e543d68f7 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PLATFORMDIRS_VERSION = 4.13.0
> +PYTHON_PLATFORMDIRS_VERSION = 4.13.4
>   PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
> -PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/80/a8/66d45abadff219e36e2a824181b8f6a67e7ed4572934d6252c71c29d5731
> +PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
>   PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>   PYTHON_PLATFORMDIRS_LICENSE = MIT
>   PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
