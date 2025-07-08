Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B61C71130
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 06:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B7D881F4E;
	Tue,  8 Jul 2025 06:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYNORx5EvM3w; Tue,  8 Jul 2025 06:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 481B381F1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 481B381F1E;
	Tue,  8 Jul 2025 06:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCEA912E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 06:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEDF981F1E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 06:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uB2BCEkS10lM for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 06:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EB6F581CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB6F581CBA
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB6F581CBA
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 06:41:18 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c85so5465830a12.2
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 23:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956877; x=1752561677;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tz9M2igPY7jJIIWGjplADwqZ+a+uhNM/ISIA3eSrn8o=;
 b=FOyy4MfDCYXhvb/HEPqkIzwxyqy1+02x+DNocvMfroKWJnSsK3bZmGPbJU6O06bh7U
 M7DMtgFtpLXPEIpXU4qJdgvF5FXI7Xx11W1cAULpJLxnwiHw7NJyjysgv/i3WKLgxLEz
 RsVq0X4J5k4REVHxOTwQXFKTzJ1x/PnmEE/aeUvGXPn48mG7F6l//mtL6/jZTd3kzizh
 mcbVWWtlW6BDe4q0SKrve2NPk4j1BKkQQT7nSx/GjxKksv3eeE8wfaUPKrYqZL4BSrIq
 YlOMxzM5gc5+krAF/hkf0g55SoqqXJdyJzpYIo88RGrbppRvjzLgs5bO/l7+N1UkQ4Au
 mlyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjnt9d3+y8Wvj6xfPceP3cwfHZYxA3L1wRmm17ZNesWfiInXuJ9Qioy8hMQQw0rlXC0rdHiY+SilM=@buildroot.org
X-Gm-Message-State: AOJu0Yxv69Drx5tMMT8tsTxdku6J5wqi4ku6/j4f98cQX0zUuwzzMYsJ
 Hi9lj8IYP7dYg7A8Op8ICcgKZRc4qjjMPM8UpXeYX3VCP7py/iwZHDE7ftcCtg==
X-Gm-Gg: ASbGncvNx2zizPeuz49bnD/l6Q7/kEl1sNo/ICkkfNPL0S3vOcYlzq93mjWIsn0d8A4
 xZs0AHK5fftG/BNhjmjPCktgyltd3UhPwLfQjaeZcFqHhX0QtLYa7CrfRouVcx4RPGvrUwjWeWK
 vkiImUWye7CGTgUIqBsVFb/GuVcL82/wnUUN3+TJ6+pKzEcYKHUCDanh4MY7oosF6hGw30Xq9qZ
 r6sXiwOl+7oBQlDuj8Uqd2xjuuuN6EGp0pD0CWI8baVy9XIQlfjteJYTnbiGUPHq26xZYe8j+Yf
 n/fRES954M9MGV6GYNkPlSp1p0BYn6/lF5NHRCeFw52P4/PJ5tWcc/f3/hwwae5AzPIccAQ+2q+
 haduzsHgs3tcU9TMhQxtIHu28
X-Google-Smtp-Source: AGHT+IHyiUpBvQCbIxPDPPoCSv02EPVEMF9LBC/+1b1F5J4JxEX8+iMsR7V2ou5PJcZ25BoGaRT59w==
X-Received: by 2002:a50:c04b:0:b0:608:156d:f3f with SMTP id
 4fb4d7f45d1cf-6104ae6d85amr992512a12.33.1751956876531; 
 Mon, 07 Jul 2025 23:41:16 -0700 (PDT)
Received: from [172.31.21.208] (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fca9bc54asm6626140a12.33.2025.07.07.23.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 23:41:16 -0700 (PDT)
Message-ID: <fd9b41644a168e19f559bbbe892527bc40d02c78.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
In-Reply-To: <20250707141530.3774427-1-peter@korsgaard.com>
References: <20250707141530.3774427-1-peter@korsgaard.com>
Organization: wires.se
Date: Tue, 08 Jul 2025 08:41:15 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751956877; x=1752561677; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz9M2igPY7jJIIWGjplADwqZ+a+uhNM/ISIA3eSrn8o=;
 b=ecnYC5B7/NFxoVeuyKmqR7MAzSu4YKYGMucUVPzTG8ubedVSrmpEG6b26Dk4gjIJYP
 L7PJ1cXV3+rjh/v2qHL2j03C7ZIeXOYPL67KtEYCOCmu56pTkwkWnLniC7VKWb0+wTms
 ltft8EFivBjV5xAiP0ZAkzFG7oJWWFt9A6fbsBBlK2LGk6sV/liqyhEx8oTsP+4UwfnU
 U6+KbqeWDbkt9IcuYofn9sOrG0sIWmjmdb6fpr7OYnI17lZQNVhpFWPTAiayb+FHrYiZ
 WZRslIlE+hdwiCvWiZAhdmN49D/SDWZG2HmCtzNacuSox5KpBrW0idZyWzpxv3NgI4b2
 DUyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ecnYC5B7
Subject: Re: [Buildroot] [PATCH] package/libconfuse: use current upstream URL
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

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDE2OjE1ICswMjAwLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6
Cj4gaHR0cHM6Ly9naXRodWIuY29tL21hcnRpbmgvbGliY29uZnVzZS/CoG5vdyByZWRpcmVjdHMg
dG8KPiAvbGliY29uZnVzZS9saWJjb25mdXNlLywgc28gdXNlIHRoYXQgaW5zdGVhZCBpbiAubWsg
YW5kIGhlbHAgdGV4dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+CgpBY2tlZC1ieTogSm9hY2hpbSBXaWJlcmcgPHRyb2dsb2JpdEBnbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
