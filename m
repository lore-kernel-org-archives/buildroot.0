Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A973CC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 14:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4622441107;
	Mon, 24 Mar 2025 14:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6XFsM-pIr0Y; Mon, 24 Mar 2025 14:25:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78D6B410FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78D6B410FF;
	Mon, 24 Mar 2025 14:25:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EAE6C0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 137DF40E29
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uqkm8k6vww8r for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 14:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAB0940E1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB0940E1A
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAB0940E1A
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 14:25:32 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e61375c108so5836213a12.1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 07:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742826331; x=1743431131;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aGXy206kXbc+DcdbI6i2OkbvsfbLHj10Yff14ZeZPcU=;
 b=kKYg5QCp3EVrajeT5bAw58dfyR4B6XsZabAnQfuJWMGF5o0FjcNrAiTAii05ZhApuX
 PXEKiEmJHxjmYaZ6x5lVtbDnCeA5p9uLZNMEfAFIGPTYULRAzuPcwfIr6rx2jWN49gWY
 bjdl2FomNP0KzEHJodFhhxRTA3XEKE6/sZ4FC7MCigaFRDGCNm5JH37/8aoodhInj/Gf
 ItiVjRo1DHbYgqaG3n4Wt2wR9Urwk64jtzJ+mdBOC1MkeEKIA32+aT1kl0FVpuZ6ZEJ6
 bR/4WwfpC1pwJrC+9mviH8xiqJM9RtWj03mqmldLEpiNmtgy6NJ8ZQxCdEyrdO87/1q6
 Pezg==
X-Gm-Message-State: AOJu0YwkOi6SoOkwerQC900MweV7S6ZV3Q7mwATmxsLChAq4I1jqnzwe
 43AJptufzC+ewMwvwQts3i5R/UZ7VjV9vl5UzZISNEVqiE2oUNPy6mi0QwxEPBqgkYsxFyOu+U3
 L
X-Gm-Gg: ASbGncs9zbFTPMtAPajTOcxO9AIzWe+3+p1IETRG03AIZrYSitpOXA7mRnzj7ovVB5B
 NIAMVn9ahl4y2TBDoLDQsR8iqNf/gd9+f1OXDxrSrpKMIGYmOrs0cz2W5bxXIgCn3WXKvW2y8CQ
 RmGWImKDeqJT4ZdDgfh8TGnV4+oGiDXUW0DPLFz6NQsvVhRmLTufrvCOClwftR3DviSVM8dkrGq
 KjL7h3pzvqke+EJGgHc1l0kuObrPjf6WrXgKanXqjq0lPK14jdhRHSHQx78mfMsYEdB63WzUXCx
 4erwylikavyD7ZXEGn9XQFwDlQDn/A4Ejk3rY4/pjnho73a7X4rwlFti0w==
X-Google-Smtp-Source: AGHT+IFLyZLabThL+Rak1V47xHF5b+iHvV1m9A7eFJ2hGb9ZmL8jW2RJPKbBD/nlhxeW+Tt+f+7+9Q==
X-Received: by 2002:a05:6402:3214:b0:5ec:da2e:6f4d with SMTP id
 4fb4d7f45d1cf-5ecda2e7003mr1996130a12.18.1742826330684; 
 Mon, 24 Mar 2025 07:25:30 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf89240sm6124364a12.31.2025.03.24.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 07:25:30 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 50D2D5F906;
 Mon, 24 Mar 2025 14:25:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adam Duskett
 <adam.duskett@amarulasolutions.com>,  Daniel Lang <dalang@gmx.at>,  Eric
 Le Bihan <eric.le.bihan.dev@free.fr>,  Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@gmail.com>,  Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20250321173447.71453-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 21 Mar 2025 18:34:47 +0100")
References: <20250321173447.71453-1-bernd@kuhls.net>
 <20250321173447.71453-5-bernd@kuhls.net>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 24 Mar 2025 14:25:29 +0000
Message-ID: <871pum4iau.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742826331; x=1743431131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGXy206kXbc+DcdbI6i2OkbvsfbLHj10Yff14ZeZPcU=;
 b=Kf0fp56dwGA97gctGPGa6zv7wr2g+XVkl87E17mRTqfYAR1KRfyc57zEonrQimiC8z
 OORbMqp3Y0mPKDdDG0VSlsI5OVPnt045Q6lrD7xCMBPndvrzddNZWkVvO4+UZqlaREpK
 T8mlbUyV6/UyHXeyikN/k2TRKJrX0uFA6YCW6sdt8lwVKF9X+S092twZxL/OELjgEIHt
 ENWXjIA4F8r4CfRreGyNCuSK8jzwKP7NIeNiVemGy82GVzXhQZHih2ou5oBg3ISxtFCA
 h/AxdnEC4KLsfk2m6JaYDbIGlJtbdwcaQD18EuGO7NW9hz5WXYhdwLgPybD2lND/MP4s
 mc+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Kf0fp56d
Subject: Re: [Buildroot] [PATCH v10 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.0.2
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

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPHNuaXA+Cj4gQ2hhbmdlcyBu
ZWVkZWQgZm9yIHRoZSBidW1wIHRvIDI1LjAueDoKPgo+IFJlYmFzZWQgcGF0Y2ggMDAwMSwgYWRk
ZWQgbGljZW5zZSBmaWxlcyBhbmQgdXBkYXRlZCBsaWNlbnNlIGhhc2gKPiBkdWUgdG8gdXBzdHJl
YW0gY29tbWl0cyB3aGljaCByZXN0cnVjdHVyZWQgdGhlIGxpY2Vuc2UgZmlsZXM6Cj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC82OTg0OWJjNGQxZGQz
Y2I5ZTlkZDVkODNiMmZmNjNiOGI0ZWRjZTliI2U2NzIyMDgzNDBiMzBmOTczY2RhYjExNDIxZjFj
OTFiMzlkNWMwMmUKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
Y29tbWl0L2MyMmQ2NDBmZTk0ZjYzOTAwNjhmNzk0NzVmYjZiMmM0NWJiMjU1N2IKPgo+IFJlbW92
ZWQgY29uZmlndXJlIG9wdGlvbiBvcGVuY2wtc3BpcnYgZHVlIHRvIHVwc3RyZWFtIGNvbW1pdDoK
PiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzgwYzRm
ZmI2MWE5MWVkMjUyZDQ1ZTM4YTk2ZTg5M2NlYzA3NzE5NDAKPgo+IFVwZGF0ZWQgY29uZmlndXJl
IG9wdGlvbnMgZm9yIGhvc3QtYnVpbGQgY2xjIHdoaWNoIHdhcyBhbHNvIHJlbmFtZWQgZnJvbQo+
IGludGVsX2NsYyB0byBtZXNhX2NsYywgYWRkZWQgaG9zdCB2ZXJzaW9uIG9mIHZ0bl9iaW5kZ2Vu
Ogo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1
ZXN0cy8zMjcxOQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9j
b21taXQvMTNmZTVhNTk3YmI4ZWRlZGFhN2MxYzgzZjNiNjRjNGU5MDMxNTYxOAo+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvNWRkZWVhOWE2MmY3MjBl
OWZkM2E2ZTVjNzZmNzRlZjZlOGIxZmRmOAo+Cj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMg
PGJlcm5kQGt1aGxzLm5ldD4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+ClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
