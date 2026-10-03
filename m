Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E59CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5966410A6;
	Sat,  3 Oct 2026 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiI2wTRyCQoK; Sat,  3 Oct 2026 10:13:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED53041291
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022427;
	b=PxysMt0/FKYAF79hZEEBqtnMXLOBsKqwFaA/SAGBtKs3Cgdlqm8x6rJwyyYoDOgaFbkG
	 jd5IP+AhV6kSOsZi5MB6RVcVSrx5TNW3QWlIxslSLPEvQMvbPOM2NMZ8l6tDYjBFdhGOo
	 jPtAfhNq0ZJTxUs4wA8NCizbsFguW46u1Ra7g7MFEWgTM85oGFdP/c8aUoGE7TfK0VaA5
	 A1+ro8r823Ip4a6upfXi6HFPu/ArZKcpCVEG7SByqLQ3SOPoZ041PorQCm5fy89t4oq0e
	 K013ZiB/O7qn6q7U89p6wJV2abEmhuSoRuk6SVOEv5AbSdWxY3ApnjN5hUuaRUEZCYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8+xr1DtVWKjchMqp7k6nzrOsiV+zkJjTzeyeAm/WoOg=;
	b=h9oxbYN+nuN0sgunkJYf1KDEYOAgO8Xm9arRZt/PvcP2i0GZOqzn2UCEpOVe8tML/gZx
	 Ms7e3jXJ9o+HXysahPri/g+VSuC2L6Ez4krPduGSVfXTncfQ1SoAnQ6nfZxlIPyMkrnRf
	 UlYdgCclXuI0J2fc6KDKZOPLEt4FMONfYGQOn4C886VEI4rDqgozKnuNkMzSfG9u6tPe0
	 GQf4VX8ZXwWDPsiPsFGn875eRdlwBcChCeHqXQ8ZgKJr5dzuVm7AYcju/+p5R7XKI/s3/
	 8Q6k5wjXIj/YsC/9zyGDmv6c6BNYKyDQ/FHbj+Ctl/uji2551fHHVun4+rQpb/0AaFA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022427;
	bh=8+xr1DtVWKjchMqp7k6nzrOsiV+zkJjTzeyeAm/WoOg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UFJfv3nFVngI6KA7x5xIlBrGoLqh9rG5RSWPDC3q7jNGriPSSLt2R45e3nwuv+Xtq
	 UT827Yp3pOQqkajVHvigOQ0/YJpoweDcbz4u42GlhNpaqmfwLLMOTewt927zH7HrLd
	 dBLq6NUZoVY/FNEnsr5MKYuNmY1NqUyNxPqXZUt3/Ukc9xFUIKs5MsJbpPo8kmqFQF
	 SahDVjXSlz9my1tnDO5wdo0KtCbXSN/If164Z6cX9xNpDw/Gx8xtf0mE45tDi4IerT
	 pZrvse0tlvcDoS3EbLTDbJDR00wJXSaHdESGDw9glrdFNBfS6zubxyb6CmZB9NObAC
	 R+Uoi/AYQGzdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED53041291;
	Sat,  3 Oct 2026 10:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 369C7179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A266A41294
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5_xecMnHunY for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 443EF410A6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022420;
 b=meOrrKEHp9B0iv0XIteRzaiFL7+yqGYYUuystA6+VdpiiZUdKae+pIJqswyHacT83AtM
 ZSEc1CdktANPRUwvyYMVpPLWcZy+kAnvEtS8oBDwoy8bEWnAAUVS+z1qgVNUd6/Pe3nog
 TEp3rJ3jD0X7yERmlzGFnNsuvQ+JiUt53ajijgWGT5juEPq0GLrq3wGSBtI1rGizpJRNy
 koLU2cYYeIwPDDWWwPhliqg5RhRKncrErKSPcbKOEkbf0o/TQSJEp7K3km8UtHXLp5ASB
 eWaxt3M58PBOb79ON/+0cxUX9JFGnqqMQPCLYupwoDsldEJXBWP0A/s9GoTmdii7Umw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022420;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=VpeLMSgPAH+dJizMTUQqa1ktnNJQwPGcB5qDdKu6efs=;
 b=pw0TDI3DQbDTzEcWO3jfa3Qkv/GWcr9+MgbgUgaMi3VNn7g3tdWY6W4zU64saKxjTLzS
 IFM8yY1Dc93r5j+2Z29kzxWx5e+BpL9JLZqkul9A/bVvmYvunIkuQzN7GytN9LfKntP8A
 HiJ2bSR9ThSk/uvQTUsaB6vWOOfPT8Ttlqf1JJMypa4Qg320MkHoWnoYgl3cwSlw64Qdm
 AAQrLKHhnIGCpXqmcUahImxcN8zAVBTZK//FJuN17E9aRm79PqST738LOBfZrgHS/dLWY
 //jxyovZIhoBsqcVmUCHJmMWeluzZCQDTY+e4Egqwzad9UKEPLy5AW2zSFR9Ae2a/Kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=RF4BxxY0; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 443EF410A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1x5lCh17Q6-00XUnN; Sat, 03
 Oct 2026 12:13:37 +0200
Message-ID: <670e99cd-6fdb-4456-aaac-018a7a88a769@gmx.de>
Date: Sat, 3 Oct 2026 12:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20261003022654.418138-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003022654.418138-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:SLi6EC+upVRvoz424ycbr0/mEekwJsD361nkOz5ESI+wN90gSfe
 F46+SDMt1lEji9T1koq09sEA30BXPZ9Vm8q63ZjndnMHw0rlQjAgqXFkTwpQT38qn3lIyJH
 nL2GG/GJ7v8JfAIPqmqsnPSYi1jwawTRKGEsF6DYfx2FvxWlxfzydo8NdPckbqKQIXTeaup
 rs2JdtK+f1ZRaQgyhLxlA==
UI-OutboundReport: notjunk:1;M01:P0:BbEysCe6QCs=;JrH3SsRfIZ3/4IDqiXVwm824Ljg
 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
 yPhc3kOnE0EOsAL5oJI4grpZDSuG3lQxMJI1Lc=
Subject: Re: [Buildroot] [PATCH 1/2] package/python-typing-extensions: bump
 to version 4.16.0
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

Am 03.10.26 um 04:26 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you.

> ---
>   .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
>   package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
> index c86b6716a8..61c3c92e63 100644
> --- a/package/python-typing-extensions/python-typing-extensions.hash
> +++ b/package/python-typing-extensions/python-typing-extensions.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
> -md5  079e529d0b271647f3ec2720aee8fc65  typing_extensions-4.15.0.tar.gz
> -sha256  0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466  typing_extensions-4.15.0.tar.gz
> +md5  7758284b826ec6ca6b722e7891bbd10d  typing_extensions-4.16.0.tar.gz
> +sha256  dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5  typing_extensions-4.16.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
> diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
> index d181b973a5..d1c0c4f694 100644
> --- a/package/python-typing-extensions/python-typing-extensions.mk
> +++ b/package/python-typing-extensions/python-typing-extensions.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
> +PYTHON_TYPING_EXTENSIONS_VERSION = 4.16.0
>   PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
> -PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
> +PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6
>   PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
>   PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
>   PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
