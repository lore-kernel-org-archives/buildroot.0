Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE843C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27D781279;
	Wed,  7 Feb 2024 09:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dZ4pYnZzzAy; Wed,  7 Feb 2024 09:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D848B80FB8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D848B80FB8;
	Wed,  7 Feb 2024 09:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D17C1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7939F400C1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xI3dzMKk2a9n for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B2E4400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B2E4400B9
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B2E4400B9
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:24:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b4db36eb1so307059f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297887; x=1707902687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtj/Lx/RU/5uI7nCmqVe6iab5tIH+ptbbpUaTxoe61s=;
 b=eu3SesMYhMJOGHP8ukDJj2WDtQsqC0MXpxiRnStXaxgxkk/thtO5FNf0QnwPQKI1Ek
 nspWrSV+eJ2pszqbsfzrxLMg419fZUQoKjSa5Fx53yWI6pFJ1sa69yvv3BC0rGkGKKZ4
 xbF9gdsk/BJzrDp7QAgSPELSKidXU5rR3FLF5DZJCy/RHr2d3wPC/BOWr9f7PyXLgghu
 G9ETnFJb0ydZ4mVsZDWyKehSiMLTCDrsy9ibuIwal3TphDgLLiKjz9F5xSd2dAnYamRu
 uQ4BrZHUAhonxgwjAoBQZSLQPezedDe7zno7TOh7nN3HGlRhXAiofaHQ/F0xcOKee4wq
 woZw==
X-Gm-Message-State: AOJu0YzeBWZF6vUai8DRRT/b1U8VViFnU9YkHYZV39qfsdCNwFMSN39E
 tDf7c2V4xQBIwYTudJ2khe4XQbVlVadbFkhxOg4oCvhq9/H+O9i2Kr8oS95LM/o=
X-Google-Smtp-Source: AGHT+IGgCkrD2N9XsFYOqTFdU7Owz75LI4j79Juz5zQhPqGvtskuQkQX63bU9UWAArXv1r5PK7V5JA==
X-Received: by 2002:a05:6000:3:b0:33b:6f5:617c with SMTP id
 h3-20020a056000000300b0033b06f5617cmr3096448wrx.22.1707297887296; 
 Wed, 07 Feb 2024 01:24:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWARBjqkcFO1SyFDaXPzX+b6CVQ1S1Msv5BgiDXkdSCb7o1RYGv5M26e8xL3xpzpPgoaBoVywWbM9SgsHrcFdnAS3FDUhfdOBRa/7as3eLfzHhPA8FAADFyt8jwGSrCVOVgaRnyP2OAQ8GGWacor6eDPK8a+WoAjbeN9ko0
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a5d494d000000b0033ae7d768b2sm992606wrs.117.2024.02.07.01.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:24:47 -0800 (PST)
Message-ID: <56e14939-d7e3-4cc4-87f1-90c4e3decac1@smile.fr>
Date: Wed, 7 Feb 2024 10:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
 <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <63d87792-b361-4915-b3bb-4bbb192a880d@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707297887; x=1707902687;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xtj/Lx/RU/5uI7nCmqVe6iab5tIH+ptbbpUaTxoe61s=;
 b=FsFSyzFdQmTe8+UvVDNFfexYZ270Wo0TWzoqAkrxmYInQAsy8msaLS9x54fS6T3k/P
 yZW4NNliP7TxO0G4hpy5jKh4Gw5JZk9Iu4f2W7EDG16gd2iBRAG3704fikgFpsJCUUbT
 po4lrqnPJkRpTgtFS1cKN1bppVSwjbq7PK+m+c4j8Q0C4nzdewpzBH3DI2pxOP3R2t5i
 VHLEyfzSiNGNllcoRwSDQSnDWvGPs9Xar0ThQ8E4Yo4Ju/ZNzJTgcBXKno8dOyVBVKGa
 I9MlPwpdsxiSRSQqrnKXJIlOwqQqolLMD+3H8/VeR+ts2XV9YtoyDRwUWmQjyrOZKz0W
 CYcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FsFSyzFd
Subject: Re: [Buildroot] [PATCH 1/2] configs/ti_am62x_sk_defconfig:
 explicitly set the kernel version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sIEFsbCwKCkxlIDA1LzAyLzIwMjQgw6AgMTY6MTMsIEdpdWxpbyBCZW5ldHRp
IGEgw6ljcml0wqA6Cj4gSGkgRGFyaW8sCj4gCj4gT24gMjMvMTEvMjMgMTQ6NDAsIERhcmlvIEJp
bmFjY2hpIHdyb3RlOgo+PiBDb21taXQgNGI4ZmRkYjA2MGZiICgiY29uZmlncy90aV9hbTYyeF9z
azogbmV3IGRlZmNvbmZpZykgZm9yZ290IHRvCj4+IHNwZWNpZnkgdGhlIExpbnV4IGtlcm5lbCB2
ZXJzaW9uLCBzbyBkbyB0aGF0IG5vdy4KPj4KPj4gV2hlbiB0aGUgZGVmY29uZmlnIHdhcyBhZGRl
ZCwgdGhlIGRlZmF1bHQgdmVyc2lvbiB3YXMgNi40LngsIHNvIHVzZQo+PiB2ZXJzaW9uIDYuNC4x
Ni4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPiA+IC0tLQo+PiDCoCBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNv
bmZpZyB8IDMgKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIGIvY29uZmlncy90aV9h
bTYyeF9za19kZWZjb25maWcKPj4gaW5kZXggYjk4YTY4ZmYxNTNmLi42NjEwZTZmY2Y4OTAgMTAw
NjQ0Cj4+IC0tLSBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4+ICsrKyBiL2NvbmZp
Z3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4+IEBAIC0xLDcgKzEsMTAgQEAKPj4gwqAgQlIyX2Fh
cmNoNjQ9eQo+PiArQlIyX0tFUk5FTF9IRUFERVJTXzZfND15Cj4gCj4gaGVyZSBeXl4geW91IG5l
ZWQgdG8gc3BlY2lmeSBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNAo+
IGFuZCBub3QgdGhlIGxpbmUgYWJvdmUsCj4gCj4+IMKgIEJSMl9ST09URlNfUE9TVF9JTUFHRV9T
Q1JJUFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPj4gwqAgQlIyX1JPT1RGU19QT1NU
X1NDUklQVF9BUkdTPSItYyBib2FyZC90aS9hbTYyeC1zay9nZW5pbWFnZS5jZmciCj4+IMKgIEJS
Ml9MSU5VWF9LRVJORUw9eQo+PiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Cj4+
ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjQuMTYiCj4+IMKgIEJS
Ml9MSU5VWF9LRVJORUxfVVNFX0FSQ0hfREVGQVVMVF9DT05GSUc9eQo+PiDCoCBCUjJfTElOVVhf
S0VSTkVMX0RUU19TVVBQT1JUPXkKPj4gwqAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05B
TUU9InRpL2szLWFtNjI1LXNrIgo+IAo+IENhbiB5b3UgcGxlYXNlIGNvcnJlY3QgYW5kIHNlbmQg
VjI/CgpJIGZpeGVkIHRoZSBrZXJuZWwgaGVhZGVyIHN5bWJvbCBiZWZvcmUgcHVzaGluZy4KCkJv
dGggcGF0Y2hlcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21h
aW4KCj4gCj4gVGhhbmsgeW91IQo+IAo+IEJlc3QgcmVnYXJkcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
