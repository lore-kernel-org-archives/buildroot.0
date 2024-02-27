Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34279C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 12:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B596960B67;
	Tue, 27 Feb 2024 12:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vGKABd_uLrl; Tue, 27 Feb 2024 12:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC11060B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC11060B71;
	Tue, 27 Feb 2024 12:59:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72A8C1BF2BB
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 12:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6017F408EE
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 12:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJBOBBl580uS for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 12:59:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C25A4408EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25A4408EA
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25A4408EA
 for <buildroot@uclibc.org>; Tue, 27 Feb 2024 12:59:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512f89250d6so2560221e87.2
 for <buildroot@uclibc.org>; Tue, 27 Feb 2024 04:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709038746; x=1709643546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfI9cOyolvUL9SpemorsZbrfNf+t2ipbVZSYu7l3CQE=;
 b=NNPm3Bxnmf9Q4DbR1X5lds1V/fq1Hl2xChMxWkhP2kRBnhIJnVxfqGik8XkfR1YRak
 EGL3EdLZkdXw9CA0aTUX1g2hRSZVa8rzFMdYQtUhQEonqIGnT692MGXe3s0RcKPlmuuB
 neLrhB0cgDN7yvS1jKtLRpj0RASGBh9U3W2AXzXKLcZi+bkYiEpyOG+pbGPZRbQ/KuEb
 fjsiRxdv9uf3tE7manw9dIECReLD/1/OSyT8Sab5nIug/t4s6SQEwTxYqsPvT5WRBHHq
 +ggQRNSRzVQB/rvqVrwMh1woC2+CzItOaZiNn+jmJ2VUqybVfUy00Smc5eX+l5r9BJHa
 LiCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWrUxkoKm1AuP7BOVQRhLuaSh6ELNRke0XU3CySOhtDma6NJfpd77XRtyNvJgKA5dwsIqfmeiVeNHtlTQ+fY9oiNBWOw==
X-Gm-Message-State: AOJu0Yxz1d7vffVd7E6SOCMA0mhJwwFTOOBPy5c2oBJtAwrBWd00yVXB
 Hs8SJ4T24Lyea2uUE/YjzRGdRdngQxcNzjhm0b6HSbRC9UTvdbGIjtR9YeDfjlY=
X-Google-Smtp-Source: AGHT+IFWUDjCDA6/b8vhSmFx5vlHWg1n9TW2x+NfQ67Cc1Fyb+n4qj6dNLMTcXiPUj8F0UiLuF8n6Q==
X-Received: by 2002:a05:6512:243:b0:512:9ece:e5a7 with SMTP id
 b3-20020a056512024300b005129ecee5a7mr6092852lfo.18.1709038746029; 
 Tue, 27 Feb 2024 04:59:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jr10-20020a05622a800a00b0042e22fa1b22sm3538496qtb.16.2024.02.27.04.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 04:59:05 -0800 (PST)
Message-ID: <d9e46b02-e299-46b7-9fd9-bbe43ecd9afe@smile.fr>
Date: Tue, 27 Feb 2024 13:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org,
 Julien Olivain <ju.o@free.fr>
References: <20240211214935.1603160-1-ju.o__4871.99223586998$1707688208$gmane$org@free.fr>
 <pan$8ffb8$216c5e07$61fb4f0$f3d6d79f@ID-313208.user.individual.net>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <pan$8ffb8$216c5e07$61fb4f0$f3d6d79f@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709038746; x=1709643546;
 darn=uclibc.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OfI9cOyolvUL9SpemorsZbrfNf+t2ipbVZSYu7l3CQE=;
 b=dCw2xXZ2ig/on/GYQmY4igrPg+ZQ+/mSEDeQNSGgKqMKzU0wvoQN0Lu6vhutIFe7gu
 N6p4Iz5lzZXLjXKlDvABViNSb0BBFQcmRWvvSuj/AW3wabLQrWCRgtocUJz4Vhr9Ob3s
 CCxb6S9OLaSXBJgyr0s4fzbWROFM35GAEtTXH9zPvOgnL6aWxALLe+tXRQtOYzb1fSDQ
 ZuesOLBgOTevS7isHJBPxa64CYiE0/pn17bmFJQucf1Z1TUNQKZ/sj9S0cH3RwLcAl73
 BWzXgJUIWMJbAOTR0Q1JaxQTkESrKc8RbViHRI1+43ACAjhnV77YL6kNm8bFMpBGFQ53
 fjQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dCw2xXZ2
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.17
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBCZXJuZCwgQWxsLAoKTGUgMTkvMDIvMjAyNCDDoCAyMTowNCwgQmVybmQg
S3VobHMgYSDDqWNyaXTCoDoKPiBBbSBTdW4sIDExIEZlYiAyMDI0IDIyOjQ5OjM1ICswMTAwIHNj
aHJpZWIgSnVsaWVuIE9saXZhaW46Cj4gCj4+IEZvciBjb21taXQgbG9ncywgc2VlOgo+PiBodHRw
czovL3NvdXJjZWZvcmdlLm5ldC9wL2dudS1lZmkvY29kZS9jaS8zLjAuMTcvbG9nLwo+IAo+IEhp
IEp1bGllbiwKPiAKPiB0aGlzIGJ1bXAgYnJlYWtzIGJ1aWxkaW5nIHN5c2xpbnV4IChub3QgeWV0
IGNhdWdodCBieSB0aGUgYXV0b2J1aWxkZXJzKToKPiBodHRwczovL2J1Z3MuZ2VudG9vLm9yZy85
MjE1OTcKCk5vdCBieSBhdXRvYnVpbGRlcnMgYnV0IGJ5IHRoZSBnaXRsYWItY2k6CgpodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYyNTY4ODA5MzcKaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTQ5
CgpUaGUgaXNzdWUgd2FzIGludHJvZHVjZWQgaW4gZ251LWVmaSAzLjAuMTYgWzFdIHRoYXQgc2Vl
bXMgd3JvbmcvaW5jb21wbGV0ZSBpZiB3ZQpjb21wYXJlIHdpdGggaW50dHlwZXMuaCBoZWFkZXIg
ZnJvbSBnbGliYyBbMl0uCgpKdWxpZW4sIGNhbiB5b3UgaGF2ZSBhIGxvb2s/ClRoYW5rcyEKClsx
XQpodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL2dudS1lZmkvY29kZS9jaS8xODkyMDBkMGIwZjZm
ZmY0NzNkMzAyODgwZDk1NjlmNDVkNGQ4YzRkClsyXQpodHRwczovL3NvdXJjZXdhcmUub3JnL2dp
dC8/cD1nbGliYy5naXQ7YT1ibG9iO2Y9c3RkbGliL2ludHR5cGVzLmg7aD1jZmRhMTQ2YWE5Yjk1
NmRjOWY0NjJiZDY1ZmI4MjhlNTkyOWJjOTBiO2hiPUhFQUQjbDI5CgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4gUmVnYXJkcywgQmVybmQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
