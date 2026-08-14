Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DECC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 14:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6A29406C0;
	Fri, 14 Aug 2026 14:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOh0U-zisvZE; Fri, 14 Aug 2026 14:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E514940E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786716876;
	bh=sqetA/r5TgvBy6QzNMVfejHVtJWJFihD+0PnUFsEKbg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WG5VGsN/4B7Lv8Wvt7HJMy+DaotOkOwzRQuVIIA31HRM/NfuJpy76uhGmTpn9N32L
	 CFhp5cuKLLjMhqoSIFCwPffB+lfoHHH+vRxHKHRPUfh34LklDG5WJPiTvbliAtIJ23
	 nCQh4nAJWZ2Z+WG4xsPRYNw5kEAknx0lJM/Y+Tt2B1mbgEgMlf0LgZVQ4fDOOCnjlM
	 I2rpxyLIdmbv/X8XXMe/BCQdbH6HRNm7Ak7GSxuF7n0pT+oCcyegTqLqUmOza1aSEB
	 XRPvgZSpL4En9xum4ZeA/oKlZHCoia6hwCsW5tuAuiPkKQFvzIL0Qr5keC0uWm0DU3
	 TAPqVDSBZyOcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E514940E48;
	Fri, 14 Aug 2026 14:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91F633DF
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7827C80C79
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otKfT1Z3s9DZ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 14:14:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67F8C80C6F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67F8C80C6F
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67F8C80C6F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 14:14:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so10915045e9.2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 07:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786716870; x=1787321670;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UMt9cChQrOM05u1S6AYiGZSxgpiYqBZoftowPxF6X/g=;
 b=DYNNXw2YBMNVjXfX1CMEBa532f/0ttGS4Gl38ZN+ehqCtqOhUv4HTN6DwjbRmAE+n3
 A2CTwATxd8OFF8LSxeNVQpkz8m96Jl4LcKdDZ1iud8jBP+QTb/NqQn2V+jmutP3/rKGd
 hRiqgxQWZyTTzhYr08AXTL6W0wxH2P/8lfPLCCwApZrSRFZlnuuaIANLotnikGQG1F+T
 3Z16RTTzwwMP4hBh7Fcwlfyu0rrqrrc5GFk6a4ikDEKBFFaYi9ob4eLKDPeXVL6yvZ1P
 BH9ADjCV1vbXqaClxVac3obHb7NTRaKCFhlSJxrAbZjzEGaEy39Es1s3cNy+HrG6Kfxc
 bTkw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPGc+vrytVq1S9bU+jkOhb15FxknmJut1ZiW8q1UJ0ejZRxWqHl++MzuI1SFbxgRIIGEf8cFs93sg=@buildroot.org
X-Gm-Message-State: AOJu0YxqbnFtBDF431Ol7b65rftWMR4tx+jGLfJ6Ew3LUX70OQFicF+y
 /R0P8G9O76fPjiUdyVfQdzKiGZgD8/GhLQMoQNlHGpCXaWH52niBb5C/Fzg/9yTGgVGUHB+u+SU
 bcC2jKPc=
X-Gm-Gg: AR+sD13+GDteANpLag95cYvnGMJ4U/5kHNzm92qnaj9nR9iAI+FZwSZCHlqtE0yMiNJ
 uAFK72iffflc2HkA9bGckdykdILqpQPUZAsDmGC3wOi95OIBrXkTuq9lAY2CJJL+taZpe6WyasA
 VDW1QhHgHsFMtBS6HY4oJ4P/ASc4IR/1dMcL+JLLQL3rReC/382DsBJelp1Ll1cAvH0nUNSDXdN
 OWh1a2HJnE8pyJQWlgXL9u6EYBmBWCQSDKFs8GXWMP2U+3z/qBFlvBVYC0fQzpuklMV/rR2Vaj0
 cDt1o8phQcJBvmpk1sVDIBbSUmqLDKFrQHdJfHINEntlTBRZwWy6479pex9d1b7EOjFFkNmf4Vu
 XrwmREAH7im/kgmLP/VjAuAqfpKTOIZDIULwnHybYqLHvc9LtwaMXjy1rELX8XqgQ0IuunS6t2A
 A7pQCI1Xzl9YphYlVsvrppcmi4r7pbtM5eiuYVLeqFMh/6mDToqPlQnIDsPcn6kN8M8A98qACqC
 5yQrj5o4NoxOG+eaU1d8daXhdUmeii6MMcvY7lC3bXCCqlQ
X-Received: by 2002:a7b:c04e:0:b0:499:518d:ebd6 with SMTP id
 5b1f17b1804b1-49987972ef1mr56505925e9.17.1786716870349; 
 Fri, 14 Aug 2026 07:14:30 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a?
 ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988b25625sm56454075e9.13.2026.08.14.07.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:14:30 -0700 (PDT)
Message-ID: <8d75891c-f7c8-4b3e-a491-780a8ffa6836@mind.be>
Date: Fri, 14 Aug 2026 16:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260813145228.290618-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260813145228.290618-1-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/python3: security bump to
 v3.12.14
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gMTMvMDgvMjYgMTY6NTIsIFRob21hcyBQZXJhbGUgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPiBTZWUgdGhlIHJlbGVhc2Ugbm90ZXM6IGh0dHBzOi8vd3d3LnB5dGhvbi5vcmcv
ZG93bmxvYWRzL3JlbGVhc2UvcHl0aG9uLTMxMjE0Lwo+Cj4gLSBDVkUtMjAyNi03MjEwCj4KPiBo
dHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vaXNzdWVzLzE0OTAxOAo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvZTM3ZGYyYTZhNzFkNjUzODY5OGUyZDMx
ODhhN2MzNDViODI3NjQwYgo+Cj4gLSBDVkUtMjAyNi00NTE5Cj4KPiBodHRwczovL2dpdGh1Yi5j
b20vcHl0aG9uL2NweXRob24vaXNzdWVzLzE0MzkzMAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRo
b24vY3B5dGhvbi9jb21taXQvY2JiYTYxMTkzOTExMTJhYmE5YzVhZWJmN2I5NGFlYTQ0NzkyMmM0
OAo+Cj4gLSBDVkUtMjAyNi0zNjQ0Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRo
b24vaXNzdWVzLzE0NTU5OQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21t
aXQvMzk3NDA5MmIwMzdmOWEzYjAwMGZiMTViNDhlYTYxY2UzYjI1ZDMzMAo+Cj4gLSBDVkUtMjAy
Ni0xNTMwOAo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vaXNzdWVzLzE1
MzAzMAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvNzg1ZGY4Zjc0
MzgwMDY2MTk2MTUyODk3MGY4NTk4ZWRjZDI5MWMxNAo+Cj4gLSBDVkUtMjAyNS0xMzQ2Mgo+Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy8xNDE3MDcKPiBodHRwczov
L2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vY29tbWl0L2QxMDk1MDczOWE3OGY1NGQwNzE4ZDg4
ZmI1YTg2ODM3NDYwM2MwODQKPgo+IC0gQ1ZFLTIwMjYtMjI5Nwo+Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy8xNDU1MDYKPiBodHRwczovL2dpdGh1Yi5jb20vcHl0
aG9uL2NweXRob24vY29tbWl0L2M3MGFkYWQ3OGNhZWVlYTMzZjkyZjU2MGVjYjkzMzMxY2ExMWJm
NjYKPgo+IC0gQ1ZFLTIwMjYtNDIyNAo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0
aG9uL2lzc3Vlcy8xNDU5ODYKPiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vY29t
bWl0LzI0Y2U4OGIyODVmNTZlZTExNjI2Y2Y1ZTQ3MmFmM2NkOGNjN2M2MjEKPgo+IC0gQ1ZF4oCR
MjAyNuKAkTQzNjAKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMv
MTUxOTg3Cj4gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC8wMzY3OTEy
YmUzMzYzNDhiMzA1NzJmODAyOWNlYzRhMjgyNzgyZDkyCj4KPiAtIENWReKAkTIwMjbigJEwODY0
Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vaXNzdWVzLzE0MzkyNwo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9jb21taXQvZGI0YTE1N2M3OTA0Nzk3MTBh
MWE4NDBkNzkzN2M1YzgxNWE2ZjhiNgo+Cj4gLSBDVkXigJEyMDI24oCRMTUwMgo+Cj4gaHR0cHM6
Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC9jMDBjMzg2ZmFhNTc5YWQ3MTE5NmQz
MzQwODY0NDQ3ODQ4OGU0M2VjCj4gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lz
c3Vlcy8xNDYyMTEKPgo+IC0gQ1ZF4oCRMjAyNuKAkTMwODcKPgo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9weXRob24vY3B5dGhvbi9jb21taXQvYTY2NTBhMmNkZjBjNDlmYjhjZTBjOTgyOTAzYWEyYWEy
NzRiZWVmZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMvMTQ2NTgx
Cj4KPiAtIENWReKAkTIwMjbigJE0Nzg2Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2Nw
eXRob24vaXNzdWVzLzE0ODE2OQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9j
b21taXQvYTRkM2VkZjNhNmVjZmRlNTA0ZDAyMTI2NDEwZDJhNjVhODU5Yjc0NAo+Cj4gLSBDVkXi
gJEyMDI24oCRNjEwMAo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vl
cy8xNDgzOTUKPiBodHRwczovL2dpdGh1Yi5jb20vcHl0aG9uL2NweXRob24vY29tbWl0L2VhOGQ3
MzVlYjA4NGNmOGNjMDIxZGYxYTMwZTkwZDEwYThmMDUyZTMKPgo+IC0gQ1ZF4oCRMjAyNuKAkTY4
NzkKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vY3B5dGhvbi9pc3N1ZXMvMTUyNjc0Cj4g
aHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2NvbW1pdC85NjUxMGEzNzU4ZjRhMDc1
ZjQzMjIzYWZkZWUzYjZlZTFhN2E3ZjAyCj4KPiAtIENWReKAkTIwMjbigJExMTk3Mgo+Cj4gaHR0
cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0aG9uL2lzc3Vlcy8xNTE5ODEKPiBodHRwczovL2dp
dGh1Yi5jb20vcHl0aG9uL2NweXRob24vY29tbWl0L2Y1ZTI3NzZmZjAzODNhOTAyYzEyYWNmMmI3
MDNlN2U5NTFmYzg0MzgKPgo+IC0gQ1ZF4oCRMjAyNuKAkTEyMDAzCj4KPiBodHRwczovL2dpdGh1
Yi5jb20vcHl0aG9uL2NweXRob24vaXNzdWVzLzE1MTU0NAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9w
eXRob24vY3B5dGhvbi9jb21taXQvMDNhYjdiNDQ3ODhiZmQ2Yjg5MjdlMTZiY2RiZDAyNWFhMDhk
Y2UwNgo+Cj4gVGhlIENWRS0yMDI2LTMyNzYsIENWRS0yMDI2LTc3NzQsIENWRS0yMDI2LTgzMjgs
IENWRS0yMDI2LTk2NjksCj4gQ1ZFLTIwMjYtMTE5NDAgd2VyZSBhbHJlYWR5IGZpeGVkIHdpdGgg
YSBiYWNrcG9ydCBvbiAyMDI1LjAyLnguCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxl
IDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CkkgYWxyZWFkeSBoYWQgYSBzaW1pbGFyIGNvbW1pdCwg
YnV0IHdpdGggYSBtb3JlIGNvbmNpc2UgbWVzc2FnZS4KSSB1cGRhdGVkIG15IGNvbW1pdCB3aXRo
IHlvdXIgZGV0YWlsZWQgQ1ZFIGxpc3QsIGFuZCBhZGRlZCB5b3UgYXMgCkNvLWF1dGhvcmVkLWJ5
LgoKV2l0aCB0aGlzLApBcHBsaWVkIHRvIDIwMjUuMDIueCwgdGhhbmtzICEKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
