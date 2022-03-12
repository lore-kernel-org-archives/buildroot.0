Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B173C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31CAA4048E;
	Sat, 12 Mar 2022 20:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAKTBo_PiCeZ; Sat, 12 Mar 2022 20:15:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF2C740486;
	Sat, 12 Mar 2022 20:15:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0AC1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B1840486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBfX5h2_XbsS for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:15:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7BFA4000B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:15:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qx21so25952958ejb.13
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9rPMBnee/X1qGHj8CkQOykOYwvZXeGy7oEpb+E7/TP8=;
 b=e9kifvL+Lm4zezx2n4vUbcZpj83sWdJyYErzQkwLXzTLvWa5ekJ0n0UbsEwAmwdYPO
 UMgAKcm38ClpqGiRMNt3TZgq9dOG2/opJLhnyr+Cv/hYWGjf2Rlp5cHYabLD8EZE0haz
 AEdQV3wvQCLbb9oOvWCXyLjb4jXRZX+fXAZ1xR495LGZ7NztNOkeGbjcx1DR0gY/YJwb
 j9cSXqEqozTL2IbWHVw5tThwfygRyRRlgELhoEK4kBVLLqBAnd4EA0Ul2EbaylO9dJ0j
 mwtBPj8ialVyEC4z6VbOHuaEWOK1Tu88SqQXbbCjnELmIdLdsCcsndwbUOot2M0cckNQ
 yZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9rPMBnee/X1qGHj8CkQOykOYwvZXeGy7oEpb+E7/TP8=;
 b=U52Thji4q8SNwwUEsNhfqVu8TaUrf3cpZOV08tOgTteT3SqD/8r2ei87ZD9p89T0Op
 AqZyIRZJErJytbZoT5KQEFKl1IYEzNXlLvGGgOgC5oYTXWE/HH27j8PceU9w9+cT4mBO
 vc9HscXPYqA+29LOv/QiIYiTIqqQHVkPsg/ytUzK7Z3HC5euiiu6GTo4dYvxW3cI6Kx1
 483JoBGI51HcYmMSEHGrJMUvqOIDNO+Hkyox5Mnk3aBloc31229Zs+EIUW6LADL6tAva
 vEY55HzHl45VO1odsxhRQCKt1sbubXOF+ABbdpSmfpGyTR4y9HfRGybmxGpkPthYtWhi
 IcFg==
X-Gm-Message-State: AOAM532nB8PtZia50om7yAKxQhW/+r5Z/reKTAom1tylDPMfhjFmINgJ
 2ZeT5CoGuV6R+FSKILf5+IO7bw==
X-Google-Smtp-Source: ABdhPJzmXdLocQGHEVxTxg3Dsc/vvHJSy3TO533eb+Ve2WampGrQHfK71On4VxcaC5hBsKr8YIycbA==
X-Received: by 2002:a17:907:60d0:b0:6db:9e12:7e9c with SMTP id
 hv16-20020a17090760d000b006db9e127e9cmr8444104ejc.156.1647116114712; 
 Sat, 12 Mar 2022 12:15:14 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z92-20020a509e65000000b00416466dc220sm5209223ede.87.2022.03.12.12.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:15:14 -0800 (PST)
Message-ID: <9b37f529-0a40-482b-15c0-e1a9a977306b@mind.be>
Date: Sat, 12 Mar 2022 21:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220223152040.188210-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220223152040.188210-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/2] package/libva: bump version to
 2.14.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAyLzIwMjIgMTY6MjAsIEJlcm5kIEt1aGxzIHdyb3RlOgo+IFJlbGVhc2Ugbm90ZXM6
IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9saWJ2YS9yZWxlYXNlcy90YWcvMi4xNC4wCj4KPiBT
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CgogwqBB
cHBsaWVkIGJvdGggdG8gbWFzdGVyLCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4g
LS0tCj4gICBwYWNrYWdlL2xpYnZhL2xpYnZhLmhhc2ggfCA2ICsrKy0tLQo+ICAgcGFja2FnZS9s
aWJ2YS9saWJ2YS5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJ2YS9saWJ2YS5o
YXNoIGIvcGFja2FnZS9saWJ2YS9saWJ2YS5oYXNoCj4gaW5kZXggN2I2NmE3NzA5ZC4uNDY0NmE4
MTZiYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYnZhL2xpYnZhLmhhc2gKPiArKysgYi9wYWNr
YWdlL2xpYnZhL2xpYnZhLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAtIyBGcm9tIGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC9saWJ2YS9yZWxlYXNlcy9kb3dubG9hZC8yLjEzLjAvbGlidmEtMi4x
My4wLnRhci5iejIuc2hhMXN1bQo+IC1zaGExICAyYWRiMmMwMjMzNzFkZDY4ZmUwZDIzZTU4YWZj
ZjBiMDcyYjc5ODI4ICBsaWJ2YS0yLjEzLjAudGFyLmJ6Mgo+ICsjIEZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL2ludGVsL2xpYnZhL3JlbGVhc2VzL2Rvd25sb2FkLzIuMTQuMC9saWJ2YS0yLjE0LjAu
dGFyLmJ6Mi5zaGExc3VtCj4gK3NoYTEgIDM2YjQ4MmVjOGMzNjFhNmMzYTYxOThmNDc3NzQwOWIx
MzZmMjcxM2MgIGxpYnZhLTIuMTQuMC50YXIuYnoyCj4gICAjIExvY2FsbHkgY29tcHV0ZWQKPiAt
c2hhMjU2ICBmYWQzODNmMzlmMzYxMTU4MTRiZDBlZGExNDk2YTRjYzAxNzYxNjQzYmQ5NjI2MzU0
MDBkZjJkNDQ3MGFkNDYwICBsaWJ2YS0yLjEzLjAudGFyLmJ6Mgo+ICtzaGEyNTYgIDUxMWU5YTc0
ZDFjY2ZiNTQ4YmMxOTIyOTA2MDMwODJjMTEwNzRhYzU5YjE3YWFkZmQ1ZDU2YTNmOTNlNTg0NTQg
IGxpYnZhLTIuMTQuMC50YXIuYnoyCj4gICBzaGEyNTYgIGM4NmE3ODJlZTg0NWI1MjQ3MmRhZTli
OWQ3OWZiOTE1ZDMzMzYyOGFjMGVmZTQ5Y2RjZTYzNjQ0ODE0OTMxZGUgIENPUFlJTkcKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJ2YS9saWJ2YS5tayBiL3BhY2thZ2UvbGlidmEvbGlidmEubWsK
PiBpbmRleCA2YWM1Mzg2NTQwLi5kYjFjZmQyOWJlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGli
dmEvbGlidmEubWsKPiArKysgYi9wYWNrYWdlL2xpYnZhL2xpYnZhLm1rCj4gQEAgLTQsNyArNCw3
IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4gLUxJQlZBX1ZFUlNJ
T04gPSAyLjEzLjAKPiArTElCVkFfVkVSU0lPTiA9IDIuMTQuMAo+ICAgTElCVkFfU09VUkNFID0g
bGlidmEtJChMSUJWQV9WRVJTSU9OKS50YXIuYnoyCj4gICBMSUJWQV9TSVRFID0gaHR0cHM6Ly9n
aXRodWIuY29tL2ludGVsL2xpYnZhL3JlbGVhc2VzL2Rvd25sb2FkLyQoTElCVkFfVkVSU0lPTikK
PiAgIExJQlZBX0xJQ0VOU0UgPSBNSVQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
