Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A81E7716B
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 14:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C228440B5B;
	Wed,  4 Dec 2024 14:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQQo1lL46N60; Wed,  4 Dec 2024 14:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C55D408B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C55D408B7;
	Wed,  4 Dec 2024 14:36:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D44F51DC8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 14:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF96440D5B
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 14:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aE08-ztKDB_1 for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 14:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6281541310
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6281541310
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6281541310
 for <buildroot@uclibc.org>; Wed,  4 Dec 2024 14:36:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aadb1so8322805a12.0
 for <buildroot@uclibc.org>; Wed, 04 Dec 2024 06:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733322966; x=1733927766;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mjv6ky7Pp4vKVoyhYD0wI9abiOF/KoiQS9DZ1A8UE5o=;
 b=KjLxBVxBf01obJd49WkXaMnYzYZbYwh593Y8fhKbQkqdAAQIeOvBptoQWD8pVMGQ02
 UDSkA6Q67bCc2a+06cYXwj2ZnwQC1D0s0VNh8U/2ezYHec5YgB6bQa/f7OS1+46mMQ+V
 iNJqk6wQK3P/eltOOrLlbWYA+6n711DjUUCqEYeNyPepNoHWnPocZeftdcEHMQoWS7ns
 eUOParT6KiQfU4Z2l2OuxiCvG3exlQZp473H15kCmqWQAy+AK8ACPePw7OyJWWkEVaHC
 JHin6joquBYAPVvsx/KMQwU+Q9ra956lzrVruoxIfMQPwbzDUVpphWkajEb1g6Z7Gm54
 ILow==
X-Gm-Message-State: AOJu0YyHPbKkImp2MggWBheQ2aRCaYSANXLXhKLJIopdLzjPSNYlzozN
 yVzpZORYNmEf1DL8dqHsBNEJQzd8Zv1XmF6evNaRp6GgClltzeEZegyic0s84ok=
X-Gm-Gg: ASbGncuwuYCbvfpFohCeV93x9oxz2hOpqo4JmzE9NNqbzk8GH9QgqtMXpGI4eyGmuLD
 Ctv6HDWZ6wRIIecgpg4D42xWzlfYYxBtP7+pTXQXbpTCFumqUmNm13O1QQh/Q4oe8IcOKFXc8dO
 kBcL72j0j9Os63rYJSuLVbOI7CiKebwv2JbohbwOkm8pJnpImqZCpe9uTwczxy7M1kpCVPScSyM
 kxYWD0SQD/Z14vu+2dKeih4YETwQn67mV72caYshtY1S6Ve
X-Google-Smtp-Source: AGHT+IEAMkvY87y7eCM3I66KsTvMmqYTq+oEbSHsVa1Mhzc1PnzkmRSLsKQfqo2SLjhG0H8N96pjdg==
X-Received: by 2002:a05:6402:27c6:b0:5d0:8e70:cf74 with SMTP id
 4fb4d7f45d1cf-5d10cb5524emr6807629a12.9.1733322964579; 
 Wed, 04 Dec 2024 06:36:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0d5d175ecsm4515099a12.56.2024.12.04.06.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 06:36:04 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4BEFB5F77C;
 Wed,  4 Dec 2024 14:36:03 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$195e7$fd7fefb7$b25efed4$ee4a9dda@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Wed, 04 Dec 2024 08:42:10 +0100")
References: <20241202190647.1211779-1-bernd@kuhls.net>
 <20241202190647.1211779-8-bernd@kuhls.net>
 <c2be6e5c80cb8a212f3c60c7d7414dd1@free.fr>
 <87ldwwbc1j.fsf__10394.9673286238$1733267303$gmane$org@draig.linaro.org>
 <pan$195e7$fd7fefb7$b25efed4$ee4a9dda@ID-313208.user.individual.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Dec 2024 14:36:03 +0000
Message-ID: <87a5dbbjn0.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733322966; x=1733927766; darn=uclibc.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjv6ky7Pp4vKVoyhYD0wI9abiOF/KoiQS9DZ1A8UE5o=;
 b=ZrWjAo9eSRT1jvbp4fXnNWXQSOpEd6EVqAsZuoqg8lcz2axRpfq9clVdPl9LIy2CSi
 ztBWphFPIpBX1gXbN6QFhGVCBNuGbPRHdp072+1LqjcaD1la8R4SMPdswmHQHVXuWB4Z
 TVZN8ty3/GInAPgidEhgz9QSaxoLWDCZyoLpdaMea4+zhzq+7dnVHxSzQcHyUTsq+5jh
 jyx0S1xp0y30l0v32ot0+kUG0SYqJCCibJ2HUyE0HxNDnK95byGVy9IabGDboiarkRI2
 ICamAHqX2exaaFUG7Tx2QIFF97GGpkJujfmvOmBQ3JZ8Z+/WkysvcuRq6GHeGBywG9ok
 tDmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZrWjAo9e
Subject: Re: [Buildroot] [PATCH 8/8] package/vkmark: add vkmark benchmarking
 tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBBbSBUdWUsIDAzIERlYyAy
MDI0IDIzOjA3OjUyICswMDAwIHNjaHJpZWIgQWxleCBCZW5uw6llOgo+Cj4+IFRoaXMgd2FzIGFs
cmVhZHkgZml4ZWQgaW46Cj4+IAo+PiAgIFN1YmplY3Q6IFtQQVRDSCAwLzJdIEVuYWJsZSB2ZW51
cyBhbmQgYWRkIHZrbWFyayBEYXRlOiBNb24sICAyIERlYwo+PiAgIDIwMjQgMTg6MjA6NTkgKzAw
MDAgTWVzc2FnZS1JZDoKPj4gICA8MjAyNDEyMDIxODIxMDEuNDEwMzIwLTEtYWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KPgo+IEhpIEFsZXgsCj4KPiB0aGVzZSBlcnJvcnMgd2VyZSBub3QgZml4ZWQg
YnkgeW91ciB1cGRhdGVkIHBhdGNoOgo+Cj4gICAgICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46
MjY6IGF0dHJpYnV0ZXMgb3JkZXI6IHR5cGUsIGRlZmF1bHQsIAo+IGRlcGVuZHMgb24sIHNlbGVj
dCwgaGVscCAoaHR0cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCj4K
PiAgICAgIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbjoyOTogYXR0cmlidXRlcyBvcmRlcjogdHlw
ZSwgZGVmYXVsdCwgCj4gZGVwZW5kcyBvbiwgc2VsZWN0LCBoZWxwCj4gICAgICAoaHR0cHM6Ly9u
aWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCgpXaGF0IHRlc3QgZGV0ZWN0cyB0
aGVzZT8KCkkgcmFuOgoKICB1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQoKYW5k
IHRoYXQgd2FzIGNsZWFuLgoKPgo+IEFsc28gdGhlIGRlcGVuZGVuY3kKPgo+IAlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAKPgo+IGNhbiBiZSBkcm9wcGVkIGJlY2F1
c2UKPgo+IAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBhc3NpbXAK
Pgo+IGV4aXN0cy4KPgo+IFRoZSBkZXBlbmRlbmN5Cj4KPiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFM
TF9MSUJTVERDUFAKPgo+IGlzIHByZXNlbnQgdHdpY2UuCgpGaXhlZC4KCgo+IFNob3VsZCAhQlIy
X1VTRV9XQ0hBUiBiZSBhZGRlZCB0byB0aGUgY29tbWVudD8KCkhvdyBkbyB5b3UgbWVhbj8gV2Ug
bmVlZCB3Y2hhci4KCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAg
TGluYXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
