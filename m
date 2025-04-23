Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78B3C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 15:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4363F61183;
	Wed, 23 Apr 2025 15:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_LCyHCL1uBK; Wed, 23 Apr 2025 15:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E58F611D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E58F611D7;
	Wed, 23 Apr 2025 15:57:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DF6619F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AF8A61080
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VaL85CGf5I5E for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 15:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 577FF61183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577FF61183
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 577FF61183
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:57:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso3901973f8f.1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745423823; x=1746028623;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQsYa8MVAp7KercWgbFeU87jZKCKqQn6RabFMUVbE+A=;
 b=ipt+CfO46APImezF+E+mBZdVmFkhRw+n8QQ7Cfh06GiUEt3PJSCdpA+/2KvaQvtPkO
 tz/KAThc0Nd52ipZDonCRQosMm/Ckp+h57/hsFboiVumnAJoBlU1Y1W5VOCHfMfPQMND
 yzdgbXVv6RGIWJ5WcI/jb2Qjcf46lEgGUPP0WEERP6BkAiHjGCf19GFmLsJbnL627gEl
 FDS9HksRITOJmBxIf5fFnfNPpCymEbsSRQKknURobm5ZOxjp/HGFglRwkQp8X4SGRI4J
 cukEcEEQDORvAC5Rz3wu6KdBf5tUYgrsGTXcUjWvQZheaqC2V8SaGQAM+8tK4BDzvmn1
 1jqw==
X-Gm-Message-State: AOJu0YzOaiZjKEeQmEb1C6Ni44CTXCK1z69hsrZwbbmW6hSTeGquRiGX
 qMq7f8x+28sRoWdPGtASbfZbeIJNHqMJwr/y4nlVBTwXIno61yOZzzY+yEKLtdc=
X-Gm-Gg: ASbGncuF8ewY0zNIDgUwLslNkMVlk2hVoR15nDYGM/UjbMAWM7ChKhyB7LnW56dDk6b
 s1yeq6JRpOk6QHuskTCFDcXknhqg8CRs82IpXWvUApQhzhRGzAJNYwTyrJAne+E6XplpXzSq+ON
 9Lngiq3tF2YJLo8Gg4t7Mjbazou1znj7Xp6umA2EH9LKBcsl4coRhmZmgXNt6mIJDyxN9PM/YKW
 ai3ejGtOWCwYIqzO0Bl22/ZiAcnynAeXlx6ou3J1NborTJUuEjFc5oNjBsK5KOYDFXpyPOe72dd
 MA1lN/nctn4MyfRtvyvmyuZBf5ejPaefdeolLc9gpiLICwy1xgY4lBsMYxj86oDWa0ATbx8Ryb6
 nthP8Z7vcWCw=
X-Google-Smtp-Source: AGHT+IEZAGtYc8RJQ9dqxIiJ8zt8TSk8zo9oHoHXkfWAHYyImwMCmDpCf5MXq0jTljCJPsNwsFxT7w==
X-Received: by 2002:a05:6000:188d:b0:39c:1424:2827 with SMTP id
 ffacd0b85a97d-39efba4657amr16186950f8f.15.1745423822895; 
 Wed, 23 Apr 2025 08:57:02 -0700 (PDT)
Received: from [10.5.0.102] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4330casm18989967f8f.22.2025.04.23.08.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 08:57:02 -0700 (PDT)
Message-ID: <98a866fa-f001-40c6-a493-7dfd5886a11e@mind.be>
Date: Wed, 23 Apr 2025 17:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250414141150.994811-1-raphael.melotte@mind.be>
 <20250419160559.3ee73fba@windsurf>
 <da0254de-812c-493b-ae1f-e96e399179ed@mind.be>
 <20250423173725.35e2ccba@windsurf>
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
In-Reply-To: <20250423173725.35e2ccba@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745423823; x=1746028623; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OQsYa8MVAp7KercWgbFeU87jZKCKqQn6RabFMUVbE+A=;
 b=H2LGGuvnP2akXs6XRpDmPoQtveDoor+vMsuXJffm7PJG7s1RUU4ybH7Lny4Q+1ScMZ
 Z15ffEcpc+qcA6EP0bWlQaCE2H+xoMHsg2IZDMl8/aCS6rG0EuMPJ6FIJ6JQscJ7prD1
 HTH3qGw4punNw9r5z7NKVpJN0qLRPj1VFBZxUzLyfr9+WiBF9KsST+VO0Su4bvkVEIaH
 tp5ArH012NZqy11e5BMOXJddt5lNg9/141CLzhmYYq/iU955yq3ASnKReKJ2iH0cwO4j
 A5uASS9sMlVgo1aSeabjl7lTvjjcsSspFIkWzAHGYiryXNdrmAzhn8M0udRqvpdvEHLz
 wnww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H2LGGuvn
Subject: Re: [Buildroot] [PATCH 1/1] package/apparmor: ignore CVE-2016-1585
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNC8yMy8yNSAxNzozNywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiAKPiBPbiBteSBzaWRl
LCB0aGV5IGFsd2F5cyByZXBsaWVkLCBidXQgd2l0aCBhIGh1Z2UgZGVsYXkuCj4gCj4gVGhhdCBi
ZWluZyBzYWlkLCBJJ20gc3VyZSB5b3UncmUgYXdhcmUgdGhhdCBmZWRlcmFsIGFnZW5jaWVzIGlu
IHRoZSBVUwo+IGFyZSB0aGVzZSBkYXlzIGhhdmluZyBzb21lIHNvcnQgb2YgdHJvdWJsZXMgaW4g
Z2V0dGluZyB0aGVpciBmdW5kaW5nLAo+IHdoaWNoIG1pZ2h0IGV4cGxhaW4gc29tZSBvZiB0aGUg
c2xvd25lc3MgOi0pCj4gCgpJbmRlZWQuLi4KCj4gCj4gU3VwZXIgbmljZSEgT3V0IG9mIGN1cmlv
c2l0eSwgZG8gd2UgaGF2ZSBzdGFsZSBlbnRyaWVzIGFzIG9mIHRvZGF5Pwo+IAoKSSdtIG5vdCBl
bnRpcmVseSBzdXJlIG15IGNoYW5nZXMgYXJlIHdvcmtpbmcgYXMgZXhwZWN0ZWQgKHdoaWNoIGlz
IGFsc28gd2h5IEkgc2VudCB0aGVtIGFzIGFuIFJGQyksIGJ1dCBpZiBJIHRydXN0IHRoZW0gSSBn
ZXQ6ClBhY2thZ2VzIHdpdGggc3RhbGUgQ1ZFIGlnbm9yZXM6IDEwClRvdGFsIG51bWJlciBvZiBz
dGFsZSBDVkUgaWdub3JlcyBhZmZlY3RpbmcgYWxsIHBhY2thZ2VzOiAyOAoKQ1ZFLTIwMjAtMTU3
MDUgZm9yIGdydWIyICh0aGUgZmlyc3Qgb25lIEkgcmFuZG9tbHkgY2hvc2UgaW4gdGhlIGxpc3Qp
IGluZGVlZCBub3cgaGFzICJVcCB0byAoaW5jbHVkaW5nKSAyLjA0IiBpbiB0aGUgTlZEIChzZWUg
WzFdKSBzbyB0aGVyZSBpcyBhdCBsZWFzdCBvbmUgcmVwb3J0ZWQgY29ycmVjdGx5LgoKCktpbmQg
cmVnYXJkcywKClJhcGhhw6tsCgpbMV06IGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWls
L0NWRS0yMDIwLTE1NzA1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
