Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D92FC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 15:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21EF611D0;
	Wed, 23 Apr 2025 15:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3vOHGNnCNOc; Wed, 23 Apr 2025 15:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD93960F44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD93960F44;
	Wed, 23 Apr 2025 15:32:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D2C19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B83B81134
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVtX-2tPSf_9 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 15:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1367C81AD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1367C81AD1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1367C81AD1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 15:32:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso4557364f8f.0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 08:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745422369; x=1746027169;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8/+yMWXGFy5o05npW/6rTRefDejxXctrakLPWzbHMk=;
 b=gydGMqNP6HNF7gG2+w3gG3MDEd01dGmdqxtJA6n0cRKnEAEgMT9qQqBoLMYvsR30IK
 Z86i333a3BbeESEdV0cLgM6D0cecojU4DJH4lYg/TXVxsoVd94V+QNIEpimwhltUTFVu
 nXi6+sj+PZnSrxEbp+8HhaxBhEzGeYmnbLWHmZsOisLLqfX1c9QkgsDfFbAos1GJ+QBl
 ZR+81Po532clL9BPE9/Kbh4OLwLzCAZMhFS8kCo3V0cCO0WLK3K1omjoa/1EnsxLDyXf
 IoqLuAKnXDYRIAFwWrqp6ELx1wFD4kCr7733m5QiEnzrQuoq57lxJS4BVn8uTZKdEmLR
 YvLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvKZVG5VVb9ouoJEnfE13FtPirIS9EmKuVmQ2wrRnd5NlV2OtbvJe9pGO5CF5hg11BhjBA3iGMUys=@buildroot.org
X-Gm-Message-State: AOJu0YyyB6+clPfiofx2tf+efr8kmjAOyJjFtb747Of0MMJ7OC76miJs
 weFPoyAtoQgYUHbWlnpu5grQse2SGQPAeVmwhUx1de5e3NITh4W9SH+X+tjVSHU=
X-Gm-Gg: ASbGncvD/ZFcnViiJgPRXhmjIOthBUbN1YaPsRcR8uvbBBy3h536VtjGzOeu/0hqtmY
 xmpi39TKVcI/4dKifGdU1CKS+uYdJP1clrtf/zk7icGYsHadgBncy/9UEmc9BTxKwdb1i6vseJM
 ViGp6erHkyHUT6RZcd2dfTveWa7xYqPGqpv+7Q3r6L9tGOZm5nLsUpKlDOJjdCji+Kwy7I4UQdo
 uoQtdB/7ho5C9MSoFtRNP5smSgLP470lrhvdwwGV4MomfTINpmb0QqxVsrEdNypvk2to2G3MjkX
 0MzceQ9QBLNZwk3vOSK7vDkVcAO5oSNXNEjokGqDlXgyUYgmo2CYMIcKhr5/VDNIQKbbepGF2c3
 O9zYGU9UeDUU=
X-Google-Smtp-Source: AGHT+IFCSylPpZWyXfnAFr4OhoGxBMUR9GClVhhsA2XzZuhCle4MXjDZeDHwwnMe8VCwNZJg/qg2cQ==
X-Received: by 2002:a5d:6d82:0:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-3a06c3442cbmr104600f8f.41.1745422369181; 
 Wed, 23 Apr 2025 08:32:49 -0700 (PDT)
Received: from [10.5.0.102] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d17a41sm30171625e9.6.2025.04.23.08.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 08:32:48 -0700 (PDT)
Message-ID: <da0254de-812c-493b-ae1f-e96e399179ed@mind.be>
Date: Wed, 23 Apr 2025 17:32:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?= <buildroot@buildroot.org>
References: <20250414141150.994811-1-raphael.melotte@mind.be>
 <20250419160559.3ee73fba@windsurf>
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
In-Reply-To: <20250419160559.3ee73fba@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745422369; x=1746027169; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=N8/+yMWXGFy5o05npW/6rTRefDejxXctrakLPWzbHMk=;
 b=IKe+QO+jwRqQ53Na0KkotpiVkzHfCNmzjP+Fov+PZ71Os7+VPs2YGou/iBXt9vRPJu
 Cry8tW6cWOjOmvvK3SmRH7DjK/FV5od4VgcvlLJsSka603PBcim5pxbcVdPYUaes5PjV
 nqqu8OwAPlft/jLgJhoIgB8iGe0Y4tWoVPCms7acPckAdq84HPhNi+oeJX3J/AHv0M56
 JWKvWASSiXz8bSJpyLbB9oER51KT9D8rOJoikzbS4RGZdbILzO29FWAsy5b0Ebs9eXRb
 tJq2r0HTBHQzv8Ep29Y67AngqMcCfFdsolzPFOju7MW1K/hAlx3JVA4g41afFPJHk7vo
 oY1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IKe+QO+j
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gNC8xOS8yNSAxNjowNSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBb
Li4uXQo+IEhhdmUgeW91IGhlYXJkIGJhY2sgZnJvbSB1cHN0cmVhbSBOVkQgYWJvdXQgeW91ciBy
ZXBvcnQ/CgpObywgSSBoYXZlbid0LgpJJ3ZlIG1hZGUgc3VjaCByZXBvcnRzIGluIHRoZSBwYXN0
IGFuZCBJIGdldCB0aGUgaW1wcmVzc2lvbiB0aGF0IHdoaWxlIHRoZXkgc29tZXRpbWVzIGRvIGdl
dCBwcm9jZXNzZWQsIHNvbWV0aW1lcyB0aGV5IGRvbid0IChvciB3aXRoIGEgbG9uZyBkZWxheT8p
LgogIAo+IEluIGZhY3QsIEknbSB3b3JyaWVkIGFib3V0IHRoaXMgQVBQQVJNT1JfSUdOT1JFX0NW
RVMgc3RheWluZyBmb3JldmVyLgo+IERvZXMgb3VyIHBrZy1zdGF0cyBzY3JpcHQgcmVwb3J0IHRo
b3NlIHN0YWxlIENWRSBlbnRyaWVzPyBJZiBpdCBkaWQsCj4gdGhlbiB3ZSBjb3VsZCBjb25zaWRl
ciBtZXJnaW5nIHlvdXIgcGF0Y2gsIGJlY2F1c2Ugd2Uga25vdyB0aGF0IG9uY2UKPiB0aGUgTlZE
IGRhdGFiYXNlIGdldHMgdXBkYXRlZCwgd2UnbGwgZ2V0IGEgd2FybmluZy9ub3RpZmljYXRpb24g
ZnJvbQo+IHBrZy1zdGF0cyB0aGF0IHRoaXMgQVBQQVJNT1JfSUdOT1JFX0NWRVMgZW50cnkgc2hv
dWxkIGJlIGRyb3BwZWQuCgpUaGF0J3MgYSBnb29kIHBvaW50LCBJIGRvbid0IHRoaW5rIHBrZy1z
dGF0cyByZXBvcnRzIHN1Y2ggaXNzdWVzIHdpdGggb3VyIENWRSBlbnRyaWVzIHlldCBzbyB3ZSBo
YXZlIG5vIHdheSB0byBmaW5kIGFuZCByZW1vdmUgdGhvc2UgZW50cmllcy4KCkkgZ2F2ZSBpdCBh
IHF1aWNrIHRyeTogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDI1MDQyMzE1MjkwNi4xMDE3NTIyLTEtcmFwaGFlbC5tZWxvdHRlQG1pbmQuYmUv
CgoKS2luZCByZWdhcmRzLAoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
