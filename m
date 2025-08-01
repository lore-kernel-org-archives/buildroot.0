Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1CDC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 15:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26CA441252;
	Fri,  1 Aug 2025 15:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GI2hIJki9H5N; Fri,  1 Aug 2025 15:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5813141264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5813141264;
	Fri,  1 Aug 2025 15:14:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3973213D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AD6B84261
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vikKeh38H-Po for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 15:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6212884151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6212884151
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6212884151
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 15:13:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-458b2d9dba5so2453615e9.1
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 08:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754061237; x=1754666037;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8V1AukZySR+SNFAgwVVSpea0L24lNFyTJ3HTlwPjwik=;
 b=nDKj1ABgxaMBNOrDrfwQ2aV1pjAUg5B04ZmHZl1Wcm1KDqIcmEsnQ5CdweqXh1DXQX
 a30rmVKXOv81Sn3tCndDqwcyjy5hQreTxDJgj3Rqg6CmmQuRpa2TDJzfXrFqyMKrgNXQ
 oHIlrrtY2O2GVHFPRni43WcFB2/tjXaqX9jm+VE7HhvvBwZAcz+LCMeLw/FBZIzauvLn
 wvOogxdS+9i4Az2mRCWyX6jvnIe8qwuN8uSQShQvxw67upDpVIrCOluX6EEobtjZCg+a
 ptw5f7F2cnKVVY0YpRVppi1zeFImglOGgLtVaO/xLo3pWHuq4QXBAAJv/x1VU3Z4PJ7Q
 jL5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJjGikXTXvii9byODVoR/dexLsHAQeFcA/Gg2Ddh2aQID917RHhsWg+4zwQLTjxk0pnuwdXlzohs=@buildroot.org
X-Gm-Message-State: AOJu0Yzh0uZ9R6pRWmM9aoJtrPS+0aCJKn4dJ0VUAgCJU4X4A26Q5euQ
 cxvV755NvHdXC5Oa6QjryIzdRRKRBe36tCXqiZJhOMqXrjjbAGlkHPSMaM7TBLAjjhQ=
X-Gm-Gg: ASbGncttAzA2zIz4C0FrbuB4TGLEtkk62bYZgJXEsX7mMRw3yc/mVv3TA/T+LaWTPiM
 0rzfojXb+kyJukd3aNWwKgiHjJCTPfTgV0Iqr9VKg4AQtESJpzCZg3iFgHq/JmWgUpS7bbWPAc2
 gdZFnI+z7iix43RpnIycGnRsY4TIZerR6hl0sZzYOzwWLsysSb4BrgZ19f47SXzc7XJtosZuHuE
 jfGLFShMgmYvRnEhbDnndUZtIKvU6rRbbG8xwM/lpy3h4CSY+jmhMOXdY6PAawXpnOtGFpONr1A
 Qu/IPmxF3idzzTwI3k4nwHfVOKTnbG28vMcsrsvQG2u5mbdGjf3WJ85G28xXEdWjWDcJt+LnXv8
 j4OeWAKp68C73rukpLIl+I4D3Xr0SysaYEgvzt1mzVyX8TaH/nm7B4vef2YTbzPE1GXrPzrGEBI
 ngwKM=
X-Google-Smtp-Source: AGHT+IFtfULp2LtOD494aER8ceUmWgMF6+RWj1y8EvfhR9tB84S4Y82Vf82GTSlQBKpETBP+/GNu8w==
X-Received: by 2002:a05:600c:4f82:b0:43d:9d5:474d with SMTP id
 5b1f17b1804b1-458ae4d1df5mr28158715e9.0.1754061237377; 
 Fri, 01 Aug 2025 08:13:57 -0700 (PDT)
Received: from [10.5.0.221] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458af7994d8sm13968445e9.0.2025.08.01.08.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 08:13:57 -0700 (PDT)
Message-ID: <0f5687ee-0714-4878-aa7c-c2bff2bff2e9@mind.be>
Date: Fri, 1 Aug 2025 17:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
Cc: dalang@gmx.at, joseph.kogut@gmail.com, romain.naour@gmail.com,
 valentinkorenblit@gmail.com
References: <20250501133002.1408454-1-raphael.melotte@mind.be>
 <20250617071612.1043959-1-elmehdi.younes@smile.fr>
Content-Language: en-US
Autocrypt: addr=raphael.melotte@mind.be; keydata=
 xsBNBF9jhjsBCACmkrLRBR22D1FiSlmQGKiSPPLY0lAYe6/DnBT7OsgiGIOWqmQL1ryGJmxI
 9PDMDGEBngJ6RyrsVlREt7ugoBEg75CrtYwXdTCB40fEPweceHtWwAQoOS3MDgFhdvd6uZvl
 YWenR6RcbCo/LZaV/novslE1eCnADNChMOkp8jTAA0K2jIlEYexrzO+G3CcrKmo6naVxn56r
 dn0kLnff4f/wvj+1l+J7m6GVL/8ckQ8fVQagLxQ5LHoxhIcOxKH1IEzf+gri/e+16gka7bWE
 4QUCEeGo/pBYysLinUP/6ArAmWoZXfGH3S0HiLBc/Yf4klnJ1nd6vZmxYKppOmy814+tABEB
 AAHNK1JhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT7CwJQEEwEI
 AD4CGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUC
 Z4ZBYQUJCgPupgAKCRDDTCsxdUfmrC80B/0Y4VeyvIBoHgN2l5Jv9SvAAvPdtDNQBe66aG3X
 5J8wGOao7jGQQQwd52A/eRRHKf7DaVK8m1aMb82KSwaGp5YAM2TgUg72DvqPb2Nv/NKTjQ41
 mTBKOr0A1JJlhF0fOhOCvi4A4eQFnNt/Awn1id1ZKv7CVErH/AiXfdqF0nwXJ+SgTb7FtQ/R
 sCekSRrrnMiGqFA3W0zeYyZ6liehOCqqmYDwdqbnjjdaYfwEwPMRJCobdt9gpQsFxOWGNPTc
 EtPX6LyDEtF0gbQEdRDiYZ24YBeAydRwycmOiyKiVNnQFkKBw6jas5+7WeoKwnhZ7EEHhIEL
 6xRlP+ACT4YWIdkCzsBNBF9jhjsBCACcBqvoGcSgHH5io/UF+ouPP3tkr68kp6Ww2Gtnf7gu
 cL9vr9ixKbuobOCs2/1JhQD1fjmrs/Nb7wYUoA+QECkoZbdRLoqaldX0Uf+7no3EtwwSMROV
 EJKBOoRyuW7nH7PzoRmMYDGHqCYTuTfBH8byoh29tjPezyli5n4Zr3JIjmgjgG6jT31uqeDn
 eirLtWta2c2n4o5cPKoVNsZJmbVtuzAz5XHUPHDaLaFnQlaPlGQ1RDvuKVzkZ1maXloa9lND
 TL7dkWoQvq7LtYxRALEhSUU8My2Bxb3B+rRMGS8W+IGAdSvtxiGqDP6W7Ac2mrg13wXf8+fq
 XiYblnHp02PtABEBAAHCwHwEGAEIACYCGwwWIQSjAZBvHnwkHJEj52rDTCsxdUfmrAUCZ4ZB
 9QUJCgPvOgAKCRDDTCsxdUfmrDrzB/9w+0pSSeHdd+mgOgtjoab23OfHbwkQa86WgdSpx5hR
 U+QdtB9zJErJBA8q5Kq4vBSu+h9V9HaETg1nnpaREbiEo4mX5kiTHCwr51JArBLFMQXGMTqE
 pENpJdaHBZDJqktvcLFBfIzIo2avLMOjAznZBeFimEcKgwouAo9DK5qb61th9hjUBvNvzFjh
 h+mjryTGqe4l0eIRxwPi7uh1d3PCql/InUhXDii3oisu75ss+2aKyRtx1RMLxcj+pD1oheZs
 ib86j6501oe6jZ+FsoUBf6EXcSij4nZlVYtEWsr7vKpPEUdNYCeeAAOuabDWsYRU/Rfl8Myc
 7ZS5078ic8ic
In-Reply-To: <20250617071612.1043959-1-elmehdi.younes@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754061237; x=1754666037; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8V1AukZySR+SNFAgwVVSpea0L24lNFyTJ3HTlwPjwik=;
 b=JURsAhbANn5Ey9JutRMYNC0ScGm8GJ49Qo5vSQdh5SBd+U+6787r1jSOxKkmlT6thV
 DSZtyrlngskAu3So7o99tdgM+E2rfHSqjpyUg2nMwvK9C4GzAIHEo3ateRQG6mOWQcIj
 lbHyNskTsTnAikbwT529RqcL1+L54e+NPcQLQE8sWeQiycV5lXrruyVhurFRUT+TItKX
 uJR2fCuga/LaY+wKCTFwr8K8lBThJDB7iiLClq5qAcFUseYc8CKxsfcPAQMQI3dQFJ3f
 P0tm0QH5T0IS4Dvqj+ss6cSrVFbLEjt/bPiTsUccDY/L9G1/6dNNEG1Bl61fcyYewN7g
 Wy8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JURsAhbA
Subject: Re: [Buildroot] [PATCH v2 1/3] package/llvm-project: add support
 for clang python bindings
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWwgTWVoZGksIGFsbCwKCk9uIDYvMTcvMjUgMDk6MTYsIEVsIE1laGRpIFlPVU5FUyB3cm90
ZToKPiAuLi4KPiBGb2xsb3dpbmcgdGhlIExMVk0gcHJvamVjdCB1cGdyYWRlIGluIEJ1aWxkcm9v
dCwgImhvc3QtcHl0aG9uMyIgaXMgbm93Cj4gYSBwZXJtYW5lbnQgZGVwZW5kZW5jeSBvZiAiY2xh
bmciLiBXZSBvbmx5IG5lZWQgdG8gYWRkOgo+IAo+ICJIT1NUX0NMQU5HX0NPTkZfT1BUUyArPSAt
RENMQU5HX1BZVEhPTl9CSU5ESU5HU19WRVJTSU9OUz0kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUiki
Cj4gCj4gVG8gaW5zdGFsbCB0aGUgUHl0aG9uICJsaWJjbGFuZyIgYmluZGluZ3MuIFRoZXJlIGlz
IG5vIG5lZWQgZm9yIGFueQo+IFB5dGhvbi1yZWxhdGVkIGNvbmRpdGlvbiBhbnltb3JlLgo+IAo+
IEkgdGVzdGVkIHRoaXMgd2l0aCB0aGUgbGF0ZXN0IExMVk0gdmVyc2lvbiBpbiBCdWlsZHJvb3Qg
KDIwLjEuNyksCj4gYW5kIHRoZSAiY2luZGV4LnB5IiBmaWxlIGlzIGNvcnJlY3RseSBpbnN0YWxs
ZWQgYXQ6Cj4gCj4gIi4vaG9zdC9saWIvcHl0aG9uMy4xMy9zaXRlLXBhY2thZ2VzL2NsYW5nL2Np
bmRleC5weSIKPiAKPiBBbHNvLCBhZnRlciByZWJhc2luZywgSSBzdWNjZXNzZnVsbHkgcmFuICJU
ZXN0UHl0aG9uUHkzUHlNdVBERiIuCj4gCgpUaGFua3MgYSBsb3QgZm9yIHRoaXMsIGl0IG1hZGUg
aXQgbXVjaCBlYXNpZXIgdG8gcmViYXNlIHRoZSBzZXJpZXMgb24gY3VycmVudCBtYXN0ZXIhCgpU
aGUgbmV3IHNlcmllcyBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0aGUgcHJldmlvdXMgb25lLCBz
byBJIHNlbnQgaXQgYXMgYSBuZXcgc2VyaWVzIGluc3RlYWQgb2Ygc2VuZGluZyBhIHYzOiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz00
Njc1OTMKCgpLaW5kIHJlZ2FyZHMsCgpSYXBoYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
