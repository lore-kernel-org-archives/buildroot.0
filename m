Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE877CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB55B412BE;
	Sat,  3 Oct 2026 10:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDU8Bc51U4KI; Sat,  3 Oct 2026 10:15:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BDD12412C0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022513;
	b=UOkIuRFgSKnTY5g5b7cOf8c5xvk+w8sre/J0DvaFl+pVgF5qHe8V6dLxjuFnVuhzmodO
	 0sRReFDli/Jicdgys19nU/DCLVFU2Np1hGfdFIHxqXuy2Fhcz40vDhj8TXNimfR1svIII
	 5CryoKYdqPFp3G1BP0YGPU1NnX4xVg1HLwfyiyWiToZzATHnq2K97EpTL3z0IP4lIBthU
	 UPlT5sSayGI25YMvCqysvoFVSMYhh637YI6pPKh13S91Wt8woIahhg9i+Nkf00e8ek8Z5
	 /YrQxgnNJJp8xq5UJNFvVtCDNkN5SGZf07T6yxa7m13aOfCOff0LUo6xKbubyxwxndg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Wg9VnuLKcqDg2qFBOL4b+yj0D4DI2vw/sebGQ2YOYMs=;
	b=Je9uXBSkx8Q6KxDMncxKhLgeo7qwUFEUwN4GC1VSxeBSlmfQlNSfo5E1HpByAAN4P6pE
	 Gpic+9gnOaAk1wtFIK00whdp65qSHU4tPTaS2CaW3Gq+iXUnpugVWgRL+ZAD5zPjyCoHm
	 DHf0Cs2pWDHR2otkswxihWGKVznTvNW8qHLVHVjA/oxvUr9bRdRGeLy+6xYKcQh42U8ND
	 2+jq/5uXr9k6l+RpCBdDovxaQP3Q1oH+erW3t2wtsh6vX3SM/mi2fdEj09iXBRASK3wqE
	 /3NdUC5j0h6BMhDSp1ahSvaLIt3ZEdAhWGdTOkI9FAUD0Kp3G83PbjrrPgMqX+FDJcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022513;
	bh=Wg9VnuLKcqDg2qFBOL4b+yj0D4DI2vw/sebGQ2YOYMs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DSspZisNDsJIq2c2VvgGxroPnqzbfnJE7MrajtxkeSzSZOzZlRwkfq9i/AeAHNBlC
	 65AYDqWlA0dCXuzjeaijMx+e78THIkzCqsA/iKt7UVvHJzcQSeros4+YlVIEm2jTZB
	 Uv/zeRIVfhvcb8C8kG1ZTfeIjeGUI8CO0TWhR4IDJwPvWGOvMTdHbebIj8cnhIwXiR
	 b2K9/709kNw1Pcl+IXUQeVMcP/EW0j9AP87b2lqjreRtmU/ce9RNRzvQNp2a89w4eK
	 Ow9Fcxd5woU9v9iQC8OXPdJLKZyxEGYuNYBySsCV1q9QraqvyETgYYlppsnT3fzbTa
	 GCon8KT3JCd2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDD12412C0;
	Sat,  3 Oct 2026 10:15:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5D134E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C0A181102
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc8VfSkyt7X8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 618B380F6D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022509;
 b=eVyNt4GiLM9vWO7PFITHUQ+F6+VEhTPXziZym543LGti+yHBfSdAd3tNyLna+8WWPSRb
 zcV8izZjnjQP8XgCCcWeWISvMtlx0Ai+gOvAvFLfEyiRr170d/vSjBqjCa8/jloorKsLV
 TSBjIbJHdi69h+W04+3XNHLVZrX8+JkIloUB/Mly+ExTVmRdmCMSjqrySGNR5Uy/GQq95
 sf6VHgcILN3piz13n/zzmihqikdwV4cOgRyC8rIB7SwZsj3Fb+9TsW+biGuZ6s6q1wkZ2
 ClULScIK7vaZ+PgYPIZ/NZ5tJ2El6vxJ8kRGVH/4iqURettuoTlfBjenrlLK8F2/AdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022509;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=ZfOm8wlIB+dWBveO3BsHSPU66QbB6jX46NcahrGG5XI=;
 b=qp+rG4SNmQVFJTS7E2S2h84O98Jz3uSk2ALpbIuwD2rrUX791Y9uXEVCmWjlsK8qrL2Z
 H2LdXcoWmk8xa4FVCyEZu/y4av8mqUftDRr38Loe9ta9ieAlXrjOTIus4ILbSmmbvcBvZ
 Rg5bjRv8bi5pcqHxg7TwkF/c9JTqO3B3ph+cOo3eI2GGXUKI3n1sYEg+JqtqguMGWqWqI
 CEYsPM5KqBwRSuF6tltvgIwncfCts0jSU4qumLSGjuxCU5i7d2xADLG7i2dm9cdWXRINX
 mepsqVGzXrMbXfDze7H2J6/xStk+MvPwAmvTQ+MuPsm35G4vSoanAFsaShYu69hKabA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=kQMXGJDm; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 618B380F6D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:15:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1wqpMP1m40-00m7jG; Sat, 03
 Oct 2026 12:15:05 +0200
Message-ID: <8da08f7b-a6e2-4a61-a115-ea8f47becc2b@gmx.de>
Date: Sat, 3 Oct 2026 12:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-39-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003070128.1295458-39-bernd@kuhls.net>
X-Provags-ID: V03:K1:kiG66fh5bhkNlEyDehwEIoSY4JwHhsRL1v/EimbWPklc7QG92AJ
 cBu13v/aCLxaNcANGTXtiTm+ul4bZnz5CQA9wIWo0U3CBmmkPxbFJrwyO9/y3HWIpgoOfeh
 tkp8uNJ62R9Wo0W9PEGd1jIAW/h2lbeTJMsNV5yAmytKH8wx0ufJtARnSoNQw6anqCQPEFX
 RomqAH1WUsCLO10cMnLSw==
UI-OutboundReport: notjunk:1;M01:P0:6cs74qodAvc=;90BfJ1cnANAG1Kz1A7SNEbwnRon
 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
 p7YExH4NhY4MDXMt2TljpZMFAP2rJ/bjPqR9F0=
Subject: Re: [Buildroot] [PATCH 039/114] package/python-markdown-it-py: bump
 version to 4.2.0
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
> Cc: Fiona Klute <fiona.klute@gmx.de>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thank you.

> ---
>   package/python-markdown-it-py/python-markdown-it-py.hash | 4 ++--
>   package/python-markdown-it-py/python-markdown-it-py.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
> index c1c6881ee1..c9d6197cf6 100644
> --- a/package/python-markdown-it-py/python-markdown-it-py.hash
> +++ b/package/python-markdown-it-py/python-markdown-it-py.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
> -md5  175fe39a7fbec21878606db1947bc9ea  markdown_it_py-4.0.0.tar.gz
> -sha256  cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3  markdown_it_py-4.0.0.tar.gz
> +md5  1b83a25193ec6c26c3ed83002419b51a  markdown_it_py-4.2.0.tar.gz
> +sha256  04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49  markdown_it_py-4.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
>   sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
> diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
> index 0b2666cc03..35ea875ab3 100644
> --- a/package/python-markdown-it-py/python-markdown-it-py.mk
> +++ b/package/python-markdown-it-py/python-markdown-it-py.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
> +PYTHON_MARKDOWN_IT_PY_VERSION = 4.2.0
>   PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
> -PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
> +PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134
>   PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
>   PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
>   PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
