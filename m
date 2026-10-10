Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3EACA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A91B40835;
	Sat, 10 Oct 2026 12:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2-9iVexomfR; Sat, 10 Oct 2026 12:38:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7497E40968
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791635925;
	b=AAV/mqARhnf3YsVU6PlDuvGHXa5O74QpogZNXVhdTuPtXxzPWUDl1idtbYA30Fu0wWXz
	 vqHXnfzK/ZnBWfcWLvRUVSsqrrQZ2KCNjcBqnCh8W7lN5GSPiXKFtnJK4aqx8YtHJWncT
	 eX2ypK3vojlEyTasDS+0LTwcRKuYcEi/44Z8mauZ4gjdQuYyT/FEp2+REceW0vzPE23bo
	 6yPl26xczCIH6RfbeiXaqrZ3K/3h8SNaNGJHaY8nnT3btbpF6reYteeze2Eh44eZ1PIB0
	 VF/ay9h4P/gNhlEdG//uRVmVzjcdMNEFc5ZdwfdCIj/ZKCxdsS84F6DgtxFA2ZBqPFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791635925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=BCCyt0CbIPV+/mb1ePN0hpq4gB8MRI6d5nrPHvFgD4s=;
	b=tHRa5JI3U0HRLeAOf+v4UbHhZgGViKNV9XFG5QLyCA9oGpBPNtVtu3TgccncRUdzPtJu
	 pF4ZeUBoHDAMyZnsl8zdL/48EIoi/sSWBGxsK1z8dDDGQhH26Zh5jqF6maDVDOES05ZAU
	 La3Fwc1rQ7g6xJwkK1jfZUvCpzaaV21zi+A5nIp/dgF0b7tiqHPCa13OsqQOHBpa21Hc5
	 diLG2/HM7cay3mfQOGNPwkkhVbwrDoqPXRoqMJ0Xf8S5k8pgwozIzBOEP2CWcpYbdmzEq
	 ym95FITkQH5TxvHlySL+DiVz9v9v8HAVTqkzXZZL0fC+qGm7AsrvUVOEPJ6GI6ThmMA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791635925;
	bh=BCCyt0CbIPV+/mb1ePN0hpq4gB8MRI6d5nrPHvFgD4s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sOzxzWT8/tVjgcnnG6W0+5XKpzv6gaz7HAMrmAS+VVhGtNh1OAvYjjbQBHO8eGEbp
	 AEGxPQvrDIEjxG4msdaaqY5gP6bPyh9+2UyXLcSRaWxtlmK8Ld52djx6YdXr1s5ilv
	 pEkO7j93YV3bWQxxFNDCxZG9vc/YfnGZqQqw0t5DplqbHJg0tlGanks6EPxsIwQgEr
	 rg91ZHwy4qG5GAMt1mzS7eHU1It8v1kg0Dkg5f0xiXNrkeOfCfR+UlkzX4lngheG3c
	 /4R4Ff11Qc7FX+agxhfLQi9JaUpWkpZh1AT1Jupf5cB9ntmwdVu6SLqyaUfFzmcKv7
	 8ZDLLs/DKV7uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7497E40968;
	Sat, 10 Oct 2026 12:38:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6C08317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D446960697
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGJCVMGQRrmX for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDBE960672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791635923;
 b=SZpfr6PVgii6P31yPCXzrpG2CPtmXioM+pPCbTd+e9m3qLpbZx08SYmRn7EQnnIrCyLa
 0v7wUaUvpwUgp+qu2AlBn12Gf1gQNxn4G8IKRa8h7+IEd4eers4aLx3BZZsZvdghVFTN6
 0xHphW0qoU5nFLUcp9bFyqin/GVORQwOf52UKfrBTkLQJyU5fFVn891zjWnzjKmrXeZ4n
 Hnm+njmrxY5+sCSqbkddoUOKhR3cKibwyBfpg/gsmM7+zpUu/TZeRaffXHHVPFdR36Q56
 Ea+2vyXaWabH+nL0YAt4GUKkh2sHwawNTZgREWZzFJM1i7ljHTu1qNL+Uvk18DvdIYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791635923;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=n8GVG3Q7r/XrUsI52OC8PkAq78yX4ZoMOdmqOCmNuF0=;
 b=UqoQeHr1/BqzOvTX4e8inkxrniihNnXA9PGceb2bweI9jt+e3OoLFuz8/2PLlHg4Xboh
 WkFaBsUK8kNHtsf7HYn6vo5/INEBIm0Gk6rp/pjWazhsp6jALfnFwVZ6wVNoV/1zigb/p
 M4zDQ+c5lkx1w7/V6K0D1ixlWuoAscT1LSYczfUtThmKaJ1Nyu5DC987JVyT6LU3hnccT
 wPJboduFuIk/3z6ejb31CeMjRmrxXWLOFt+AVg2N3wirIIMnghzOYgtgOX3/dk+iwmROT
 e11PoQpmUwRyiTfurxH9inlfyop+IuD9FpNjZDwKUbp03+a27kZCHvJ58Hav67vwAhg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=FtsGmeZJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CDBE960672
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:38:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a168355946so1822245e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791635920; x=1792240720;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n8GVG3Q7r/XrUsI52OC8PkAq78yX4ZoMOdmqOCmNuF0=;
 b=XFCEhgLAxm4KlpBpCqWvgsJeHqXmEdMlt9zJ8qdYUBUisbWNhKvRjOB4Btud1EY0YH
 ckRitXjD4MIqP0fovVNy06kX8q4tCoBx3ZTSEGOnBNlWWyHD7oQ8rmMOFBSQwHi66aEF
 KQ/Zo9lXN0/dBThHDVAeNKR7RhV94KDTs5sepOZezDily/neG8OV7E83n4ExZuf0qjrw
 o4AITgxdNFcZyaLlqjctsarhDvCwuxTGypC0Fy8HydVomoVfgTvYsCtE19GhsZoajZuH
 p6aXZ2CEjJ3Q/JbOpzJ43tG9mqRU1xg1yQDVdkn+q7N/7vd7kom0DvpoN9qN8X++GXV3
 DN0A==
X-Forwarded-Encrypted: i=1;
 AKwUvByt9RUlFADQLgi9+yEnu5ShRWOGEGlPCNhbC9RnTxVMstxm61NLNImzUndnnotd4cbXO+JqamM9RLc=@buildroot.org
X-Gm-Message-State: AFq9FYIMRp9qLRQb+v8Qe3ilnc7hPa21bVE42MyDmT21uZheGPcyqzX/
 d1XRINeORBjO5kV4Jr6EK5H8D/MSoXq4SfwVKDSVgFvYIKLHbGaKF4RHOknsVw5WDzM=
X-Gm-Gg: AYBFou0y8LlG3uxF393JRVDE3ckJNkuSAm7WjJ8fZkXKFjIFS8jbN2aGVRVV001H9Ef
 57tXtnzT/fQGadvYnByEKTwx7jvmF8XMED4H2gbjJPJQPBPSBWP9WyF5by12LRutIggQbwBwt4W
 6hzCFebgILIoQQD/F7Shke8aZkgNFt94Lm3fxL7BGcpSOGTWfUDqKBxZ7+rTWWQtuc0J+5dPCWY
 um+TEJbSURTohfHIENwEWmvWR8HIyvYuIZOEr8Z+bPQcFNouyIlwSh7msz+xrWXLhoEc1+NN+zA
 rDhCLJ+p3g+WVgzPHeKU6/Rv96fMFnrzYLuZ3b0qqG1SPCQXWlZ+ETONSo2za7XrVu9anMqHbqn
 iZgMc/A7t/cfgqfmE5WJX3enazqkTWbVYjRUVPl4LF7rQb2Nm1ByiLBNbHRUuwi3SUYvDLV1L/n
 /b+yYzQfX70n7r4fOE6gNwdargU7b7Dx9lRQMS9zBv2aKsIQ6EcPfZAPpP3/Oe1T1TnqluDQNC0
 R9WwV+IfTbaNV6LeH+oV6oTj5k+Cjbw7wEkIE1xF5ZfYGtgOGUboAuMzhvLDAw4VA7ZzQbGaMVg
 9V36n8iDwiExo8c+RItx7O/nxCSYH5YJCA==
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id
 5b1f17b1804b1-4a18e4e0a33mr89086625e9.27.1791635919588; 
 Sat, 10 Oct 2026 05:38:39 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18dcd7dd3sm80916195e9.2.2026.10.10.05.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 05:38:39 -0700 (PDT)
Message-ID: <51681316-f171-4a10-9a2d-4c12e890a9a5@mind.be>
Date: Sat, 10 Oct 2026 14:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260918091142.62239-1-thomas.perale@mind.be>
 <20260918091142.62239-2-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260918091142.62239-2-thomas.perale@mind.be>
Subject: Re: [Buildroot] [PATCH 2/3] utils/checkpackagelib: support other
 identifiers than CVE
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

SGkgVGhvbWFzIGFuZCBhbGwsCgpPbiAxOC8wOS8yNiAxMToxMSwgVGhvbWFzIFBlcmFsZSB3cm90
ZToKPiBDdXJyZW50bHkgdGhlIE1pc3NpbmdDVkVQYXRjaCBjaGVjayB3aWxsIGNvbXBsYWluIGlm
IGFub3RoZXIKPiBpZGVudGlmaWVycyB0aGFuIGEgQ1ZFLVlZWVktWFhYWCBpcyBwYXNzZWQgYWZ0
ZXIgdGhlICdDVkU6ICcKPiB0cmFpbGVyIGluIHRoZSBwYXRjaCBoZWFkZXIgaW50cm9kdWNlZCBp
biBbMV0uCj4KPiBJZiBhIHBhY2thZ2UgJ2ZvbycgZGVmaW5lcyB0aGUgZm9sbG93aW5nOgo+Cj4g
Rk9PX0lHTk9SRV9DVkVTICs9IEdIU0EtYWJjZC0xMjM0LWVmZ2gKPgo+IEFuZCBjb3JyZWN0bHkg
cmVmZXJlbmNlcyBpdCBpbiBhIHBhdGNoIGhlYWRlcjoKPgo+IENWRTogR0hTQS1hYmNkLTEyMzQt
ZWZnaAo+Cj4gY2hlY2stcGFja2FnZSB3aWxsIHJlcG9ydCB0aGUgZm9sbG93aW5nOgo+Cj4gcGFj
a2FnZS9mb28vZm9vLm1rOiBwYXRjaCBmaWxlICcwMDAxLXNvbWUtcGF0Y2gucGF0Y2gnIGlzIG1p
c3NpbmcgJ0NWRTonIHRhZwo+Cj4gV2hpbGUgd2UgY291bGQgYXJndWUgdGhhdCBHSFNBIGlkZW50
aWZpZXIgc2hvdWxkIG5vdCBiZSBwcmVzZW50IGluIHRoZQo+ICdJR05PUkVfQ1ZFUycgdmFyaWFi
bGUsIGl0J3Mgc3RpbGwgdmFsdWFibGUgZm9yIHVzZXJzIHRvIGhhdmUgYSB3YXkgdG8KPiBjb3Jy
ZWN0bHkgaWdub3JlIGFuZCBsaW5rIGEgcGF0Y2ggZm9yIHRoZWlyIHZ1bG5lcmFiaWxpdHkgcmVw
b3J0Lgo+Cj4gIEZyb20gb3VyIHBvaW50IG9mIHZpZXcgaXQgYWxsb3dzIHVzIHRvIHRyYWNrIEdI
U0EgdnVsbmVyYWJpbGl0aWVzIHRoYXQKPiBjb3VsZCBsYXRlciBiZSBhc3NpZ25lZCBhIENWRSBz
byB3ZSBjYW4gdXBkYXRlIHRoZSBJR05PUkVfQ1ZFUyB2YXJpYWJsZS4KPgo+IFRoaXMgY29tbWl0
IHJlbGF4ZXMgdGhlIGNvbnN0cmFpbnQgb24gdGhlICdDVkUnIHRyYWlsZXIgdG8ganVzdCBjaGVj
awo+IGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIHRyYWlsZXIgaW4gc29tZSBwYXRjaC4KPgo+IFsx
XSAxMTY3ZDBmZjNkIGRvY3MvbWFudWFsOiBtZW50aW9uIENWRSB0cmFpbGVyCj4KPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+ClJldmlld2VkLWJ5
OiBUaXRvdWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgo+IC0tLQo+
ICAgdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5weSAgICAgIHwgOSArKysrKysrLS0KPiAg
IHV0aWxzL2NoZWNrcGFja2FnZWxpYi90ZXN0X2xpYl9tay5weSB8IDUgKysrKysKPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS91dGlscy9jaGVja3BhY2thZ2VsaWIvbGliX21rLnB5IGIvdXRpbHMvY2hlY2twYWNrYWdl
bGliL2xpYl9tay5weQo+IGluZGV4IDA2NTczM2Q0NjQuLmM1Yjg1YmNkYTkgMTAwNjQ0Cj4gLS0t
IGEvdXRpbHMvY2hlY2twYWNrYWdlbGliL2xpYl9tay5weQo+ICsrKyBiL3V0aWxzL2NoZWNrcGFj
a2FnZWxpYi9saWJfbWsucHkKPiBAQCAtMTIxLDcgKzEyMSw3IEBAIGNsYXNzIEluZGVudChfQ2hl
Y2tGdW5jdGlvbik6Cj4gICBjbGFzcyBNaXNzaW5nQ1ZFUGF0Y2goX0NoZWNrRnVuY3Rpb24pOgo+
ICAgICAgIFBBVENIX0NPTU1FTlQgPSByZS5jb21waWxlKHIiXiNccyooXFMrXC5wYXRjaClccyok
IikKPiAgICAgICBJR05PUkVfQ1ZFUyA9IHJlLmNvbXBpbGUociJeW0EtWjAtOV9dK19JR05PUkVf
Q1ZFU1xzKlwrPz0iKQo+IC0gICAgQ1ZFX1RBR19JTl9QQVRDSCA9IHJlLmNvbXBpbGUociJeQ1ZF
OiAqQ1ZFLVxkKy1cZCskIikKPiArICAgIENWRV9UQUdfSU5fUEFUQ0ggPSAiQ1ZFOiAiCj4gICAK
PiAgICAgICBkZWYgYmVmb3JlKHNlbGYpOgo+ICAgICAgICAgICBzZWxmLnBlbmRpbmdfcGF0Y2hl
cyA9IFtdCj4gQEAgLTEzNiw3ICsxMzYsMTIgQEAgY2xhc3MgTWlzc2luZ0NWRVBhdGNoKF9DaGVj
a0Z1bmN0aW9uKToKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIC5mb3JtYXQoc2VsZi5maWxl
bmFtZSwgcGF0Y2hfbGluZW5vLCBwYXRjaF9uYW1lKSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhdGNoX3RleHRdCj4gICAKPiAtICAgICAgICAgICAgaWYgbm90IGFueShtYXAoc2VsZi5D
VkVfVEFHX0lOX1BBVENILm1hdGNoLCBwYXRjaF9maWxlLm9wZW4oKSkpOgo+ICsgICAgICAgICAg
ICB0cmFpbGVycyA9IFsKPiArICAgICAgICAgICAgICAgIGxpbmUucGFydGl0aW9uKHNlbGYuQ1ZF
X1RBR19JTl9QQVRDSClbMl0uc3RyaXAoKQpOaXRwaWNrOiBtaWdodCBiZSBzaW1wbGlmaWVkIHdp
dGgganVzdAoKIMKgIMKgIGxpbmVbbGVuKHNlbGYuQ1ZFX1RBR19JTl9QQVRDSCk6XQoKYmVjYXVz
ZSB3ZSBhbHJlYWR5IGNoZWNrIHRoYXQgdGhlIGxpbmUgc3RhcnRzd2l0aCBpdC4gSSBwZXJzb25h
bGx5IHRoaW5rIAppdCdzIHNsaWdodGx5IGVhc2llciB0byB1bmRlcnN0YW5kLCBhbHRob3VnaCBk
ZWZpbml0ZWx5IG5vdCBhIGJsb2NrZXIuCj4gKyAgICAgICAgICAgICAgICBmb3IgbGluZSBpbiBw
YXRjaF9maWxlLm9wZW4oKQo+ICsgICAgICAgICAgICAgICAgaWYgbGluZS5zdGFydHN3aXRoKHNl
bGYuQ1ZFX1RBR19JTl9QQVRDSCkKPiArICAgICAgICAgICAgXQo+ICsgICAgICAgICAgICBpZiBu
b3QgdHJhaWxlcnM6Cj4gICAgICAgICAgICAgICAgICAgcmV0dXJuIFsie306IHBhdGNoIGZpbGUg
J3t9JyBpcyBtaXNzaW5nICdDVkU6JyB0YWciCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAu
Zm9ybWF0KHNlbGYuZmlsZW5hbWUsIHBhdGNoX25hbWUpLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGF0Y2hfdGV4dF0KPiBkaWZmIC0tZ2l0IGEvdXRpbHMvY2hlY2twYWNrYWdlbGliL3Rl
c3RfbGliX21rLnB5IGIvdXRpbHMvY2hlY2twYWNrYWdlbGliL3Rlc3RfbGliX21rLnB5Cj4gaW5k
ZXggMjFlZmZhOTQ4OS4uYmE5ZGJkNmFlYSAxMDA2NDQKPiAtLS0gYS91dGlscy9jaGVja3BhY2th
Z2VsaWIvdGVzdF9saWJfbWsucHkKPiArKysgYi91dGlscy9jaGVja3BhY2thZ2VsaWIvdGVzdF9s
aWJfbWsucHkKPiBAQCAtMjM5LDYgKzIzOSwxMSBAQCBNaXNzaW5nQ1ZFUGF0Y2ggPSBbCj4gICAg
ICAgIHt9LAo+ICAgICAgICAnRk9PX0lHTk9SRV9DVkVTICs9IENWRS0yMDAwLTEyMzRcbicsCj4g
ICAgICAgIFtdKSwKPiArICAgICgncGF0Y2hlcyBwcmVzZW50IHdpdGggb3RoZXIgaWRlbnRpZmll
cicsCj4gKyAgICAgeycwMDAxLXNvbWUtZml4LnBhdGNoJzogJ0NWRTogR0hTQS1hYmNkLTEyMzQt
ZWZnaCd9LAo+ICsgICAgICcjIDAwMDEtc29tZS1maXgucGF0Y2hcbicKPiArICAgICAnRk9PX0lH
Tk9SRV9DVkVTICs9IEdIU0EtYWJjZC0xMjM0LWVmZ2hcbicsCj4gKyAgICAgW10pLAo+ICAgICAg
IF0KPiAgIAo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
