Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A4DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47124169C;
	Sat, 23 Jul 2022 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47124169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5aWMjW5PAYJ; Sat, 23 Jul 2022 20:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B9C4019C;
	Sat, 23 Jul 2022 20:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B9C4019C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8741BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5495C4245F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5495C4245F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5gWFc7UhTqZ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FDB741846
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FDB741846
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:29:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k11so10331665wrx.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9QQfjHH7Xk+xMAHPFk4dmMRTKrA1n7hG8MZn7EGBwQ4=;
 b=71Opd2APP4jQllinthFHlRkiQNOkInZ1Vxr8Rx7EnDpxSO3ZYuYjRH7nEf0KlkACwU
 P2TKpuNCB79/M7UNdJJvbj0dZH1bdm51FIx0BJhG7DQFwwU547QVTbT3fqWGBiQmUz/6
 NEZacszNS/Y0BTm5plZj7VzdKRN988fXumZR3pMYooQFVVsZzjQSvFY4HFc+huhmCIqn
 3ihNZafcwC2/H4lQcRa+QrRjgyW92xXe0gIAjDCuvu0pCFKp60qx8rAoB8LOnaM8fzx9
 zxn3lPfKVFtEXI0eXiY1I+sRbLWqdolYku9dsbB4cK3AvNyoDwAE309mHISuxW2ZSecM
 m7lw==
X-Gm-Message-State: AJIora85a5RMRhyglzUS4jtxDpBh8I/JbGs9iFjsGbDkQtiXRU2Jtt4W
 262Cbz7feIhBEiveRVQXT4GPGA==
X-Google-Smtp-Source: AGRyM1vIuzTDZL7NZdPFKRVaF4s2Fraty/sGlZLmXuRRqHlno/aZNgpyJuW69ER47MmIJDO2WWeP3Q==
X-Received: by 2002:a5d:4e82:0:b0:21e:482a:705f with SMTP id
 e2-20020a5d4e82000000b0021e482a705fmr3345173wru.543.1658608137913; 
 Sat, 23 Jul 2022 13:28:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adff845000000b0021dd08ad8d7sm8050902wrq.46.2022.07.23.13.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 13:28:57 -0700 (PDT)
Message-ID: <84e423c7-3d69-9168-00f2-ff0c3b6ef480@smile.fr>
Date: Sat, 23 Jul 2022 22:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
 buildroot@buildroot.org
References: <20210226160937.16082-1-conrad.ratschan@rockwellcollins.com>
 <20210226160937.16082-4-conrad.ratschan@rockwellcollins.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210226160937.16082-4-conrad.ratschan@rockwellcollins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9QQfjHH7Xk+xMAHPFk4dmMRTKrA1n7hG8MZn7EGBwQ4=;
 b=lpX2bCBb0e+jJRWOTzfYqMMF6TKj6OXgHkb9Gdo0VrSFw65jNlMl+fiQuqcBCmUyBe
 qQ3IxVi1F7wlHrHsdo0biX3JXoZfxWVWFZyiPlgFhun8J7hA88NIKfD6zULKPzMoZA7A
 rJpGGlJ6UDcv5MJCFeVVEwxCtYllHShx0MLx5idx+h2LRqTHVe/0OPaSQMLKkGHoCqzE
 fuzs8SSHVQJAgb5CGZmB10+lTgPu7UceZ2T9h3lJ1lRwMTRljdhe2MRh64xPmh6TG5Sa
 yDq0rx/FaZXiLV2AhPuJX7EyNeyOhOW7JPcP5ldcuh0lHext1oCmZss6h1tqY0iMAuC8
 euaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=lpX2bCBb
Subject: Re: [Buildroot] [PATCH 4/4] package/python-diffoscope: Add as new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ29ucmFkLAoKTGUgMjYvMDIvMjAyMSDDoCAxNzowOSwgQ29ucmFkIFJhdHNjaGFuIGEgw6lj
cml0wqA6Cj4gQWRkIGEgbmV3IGhvc3QgcHl0aG9uIHBhY2thZ2UgZm9yIHB5dGhvbi1kaWZmb3Nj
b3BlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENvbnJhZCBSYXRzY2hhbiA8Y29ucmFkLnJhdHNjaGFu
QHJvY2t3ZWxsY29sbGlucy5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluLmhvc3QgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9weXRob24tZGlmZm9zY29w
ZS9Db25maWcuaW4uaG9zdCAgICAgICAgIHwgMTAgKysrKysrKysrKwo+ICBwYWNrYWdlL3B5dGhv
bi1kaWZmb3Njb3BlL3B5dGhvbi1kaWZmb3Njb3BlLmhhc2ggfCAgMiArKwo+ICBwYWNrYWdlL3B5
dGhvbi1kaWZmb3Njb3BlL3B5dGhvbi1kaWZmb3Njb3BlLm1rICAgfCAxNiArKysrKysrKysrKysr
KysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tZGlmZm9zY29wZS9Db25maWcuaW4uaG9zdAo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZGlmZm9zY29wZS9weXRob24tZGlmZm9zY29wZS5o
YXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1kaWZmb3Njb3BlL3B5dGhv
bi1kaWZmb3Njb3BlLm1rCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3Qg
Yi9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggNGVkZmI5Y2ZhNC4uNWE5ZTYwNmE0YiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2FnZS9Db25m
aWcuaW4uaG9zdAo+IEBAIC02NSw2ICs2NSw3IEBAIG1lbnUgIkhvc3QgdXRpbGl0aWVzIgo+ICAJ
c291cmNlICJwYWNrYWdlL3B3Z2VuL0NvbmZpZy5pbi5ob3N0Igo+ICAJc291cmNlICJwYWNrYWdl
L3B5dGhvbi9Db25maWcuaW4uaG9zdCIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tY3l0aG9u
L0NvbmZpZy5pbi5ob3N0Igo+ICsJc291cmNlICJwYWNrYWdlL3B5dGhvbi1kaWZmb3Njb3BlL0Nv
bmZpZy5pbi5ob3N0Igo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1saWJhcmNoaXZlLWMvQ29u
ZmlnLmluLmhvc3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWx4bWwvQ29uZmlnLmluLmhv
c3QiCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLW1hZ2ljL0NvbmZpZy5pbi5ob3N0Igo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kaWZmb3Njb3BlL0NvbmZpZy5pbi5ob3N0IGIvcGFj
a2FnZS9weXRob24tZGlmZm9zY29wZS9Db25maWcuaW4uaG9zdAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNTIwNjA3ZThhNgo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL3B5dGhvbi1kaWZmb3Njb3BlL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTAsMCArMSwx
MCBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9QWVRIT05fRElGRk9TQ09QRQo+ICsJYm9v
bCAiaG9zdC1weXRob24tZGlmZm9zY29wZSIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9QWVRIT04zCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9QWVRIT05fTUFHSUMKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9IT1NUX1BZVEhPTl9MSUJBUkNISVZFX0MKPiArCXNlbGVjdCBCUjJf
UEFDS0FHRV9IT1NUX1BZVEhPTjNfQ1VSU0VTCj4gKwloZWxwCj4gKwkgIFRvb2wgdG8gcmVjdXJz
aXZlbHkgZGlmZiB2YXJ5aW5nIGZpbGUgdHlwZXMuCj4gKwo+ICsJICBodHRwczovL2RpZmZvc2Nv
cGUub3JnLwoKRXZlbiBpZiBpdCdzIGEgcHl0aG9uIGJhc2VkIGFwcGxpY2F0aW9uLCB0aGUgbmFt
ZSBvZiB0aGUgcGFja2FnZSBzaG91bGQgYmUKZGlmZm9zY29wZSBub3QgcHl0aG9uLWRpZmZvc2Nv
cGUuCgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGlmZm9zY29wZS9weXRob24tZGlm
Zm9zY29wZS5oYXNoIGIvcGFja2FnZS9weXRob24tZGlmZm9zY29wZS9weXRob24tZGlmZm9zY29w
ZS5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5lYTZkNzNh
YTYwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRpZmZvc2NvcGUvcHl0
aG9uLWRpZmZvc2NvcGUuaGFzaAo+IEBAIC0wLDAgKzEsMiBAQAo+ICsjIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9kaWZmb3Njb3BlL2pzb24KPiArc2hhMjU2ICBkOTVjZWY1YjNl
ZWY0OWZhMWM4MTFjMWFjMTAzZjdmN2NjYTRhMGViYWJjNjc0ZTQyODNiNTFmMjgzMDlkMjQyICBk
aWZmb3Njb3BlLTE2Ny50YXIuZ3oKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGlmZm9z
Y29wZS9weXRob24tZGlmZm9zY29wZS5tayBiL3BhY2thZ2UvcHl0aG9uLWRpZmZvc2NvcGUvcHl0
aG9uLWRpZmZvc2NvcGUubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmFkNWE3YzYyNTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tZGlm
Zm9zY29wZS9weXRob24tZGlmZm9zY29wZS5tawo+IEBAIC0wLDAgKzEsMTYgQEAKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHB5dGhvbi1kaWZmb3Njb3BlCj4gKyMKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK1BZVEhPTl9ESUZGT1NDT1BFX1ZFUlNJT04gPSAx
NjcKClNvcnJ5IGZvciB0aGUgZGVsYXksIHdoZW4geW91IHBvc3RlZCBiYWNrIGluIDIwMjEgaXQg
d2FzIHRoZSBsYXRlc3QgdmVyc2lvbi4uLgp0b2RheSB0aGUgbGF0ZXN0IHZlcnNpb24gaXMgMjE5
LgoKPiArUFlUSE9OX0RJRkZPU0NPUEVfU09VUkNFID0gZGlmZm9zY29wZS0kKFBZVEhPTl9ESUZG
T1NDT1BFX1ZFUlNJT04pLnRhci5nego+ICtQWVRIT05fRElGRk9TQ09QRV9TSVRFID0gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY5L2Q4LzNjZDdlZmQ5MDRkNGRiOTAz
OWYzMTExOTM4NTk4ZjYwOTNkMTQwODdmNDBmNDM1OWVmMTUxNGU3ZDVlYgo+ICtQWVRIT05fRElG
Rk9TQ09QRV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICtQWVRIT05fRElGRk9TQ09QRV9MSUNF
TlNFID0gR1BMLTMuMCsKPiArSE9TVF9QWVRIT05fRElGRk9TQ09QRV9ETF9TVUJESVIgPSBweXRo
b24tZGlmZm9zY29wZQo+ICtIT1NUX1BZVEhPTl9ESUZGT1NDT1BFX05FRURTX0hPU1RfUFlUSE9O
ID0gcHl0aG9uMwo+ICtIT1NUX1BZVEhPTl9ESUZGT1NDT1BFX0RFUEVOREVOQ0lFUyA9IGhvc3Qt
cHl0aG9uLWxpYmFyY2hpdmUtYyBob3N0LXB5dGhvbi1tYWdpYwoKU3RpbGwsIHRoZSBkZXBlbmRl
bmN5IHNlZW1zIHNob3J0IGhlcmUuCgpUbyBlYXNlIEJ1aWxkcm9vdCBwYWNrYWdpbmcsIHlvdSBj
YW4gZ2V0IHNvbWUgaGludCBmcm9tIG90aGVyIExpbnV4IERpc3RyaWJ1dGlvbgpwYWNrYWdpbmcg
KERlYmlhbiBbMV0sIEZlZG9yYSBbMl0sIEFyY2hsaW51eCBbM10gb3IgZXZlbiBZb2N0byBbNF0p
LgoKVGhlIGxpc3Qgb2Ygb3B0aW9uYWwgZGVwZW5kZW5jeSBvZiBkaWZmb3Njb3BlIGlzIGh1Z2Ug
YW5kIGlmIHdlIGNvbXBhcmUgd2l0aCB0aGUKWW9jdG8gcGFja2FnaW5nIHNvbWUgcnVudGltZSBk
ZXBlbmRlbmNpZXMgYXJlIG1pc3NpbmcgKGJpbnV0aWxzIHZpbQpzcXVhc2hmcy10b29scyBweXRo
b24zLXJwbSkKClNvIGF0IGxlYXN0IHdlIGNhbiBidWlsZCBkaWZmb3Njb3BlIGJ1dCBhIGxpbWl0
ZWQgKGxpZ2h0KSB2ZXJzaW9uIHdpdGgKQnVpbGRyb290LiBGb3IgYSBmdWxsIHZlcnNpb24sIHlv
dSBoYXZlIHRvIHVzZSB0aGUgb25lIGZyb20geW91ciBidWlsZCBtYWNoaW5lLgoKRm9yIGV4YW1w
bGUsIG9ubHkgdGhlIGF1dG9idWlsZGVyIHNjcmlwdCB1c2UgZGlmZm9zY29wZSBidXQgdGhlIG9u
ZSBpbnN0YWxsZWQgb24KdGhlIGJ1aWxkIG1hY2hpbmUuCgpJdCB3b3VsZCBiZSBncmVhdCBpZiB3
ZSBjYW4gaGF2ZSBhIHRlc3QgY2FzZSBmb3IgdGhpcyBwYWNrYWdlLgoKWzFdCmh0dHBzOi8vc2Fs
c2EuZGViaWFuLm9yZy9yZXByb2R1Y2libGUtYnVpbGRzL2RpZmZvc2NvcGUvLS9ibG9iL21hc3Rl
ci9kZWJpYW4vY29udHJvbAoKWzJdIGh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3JwbXMv
ZGlmZm9zY29wZS9ibG9iL3Jhd2hpZGUvZi9kaWZmb3Njb3BlLnNwZWMKClszXQpodHRwczovL2dp
dGh1Yi5jb20vYXJjaGxpbnV4L3N2bnRvZ2l0LWNvbW11bml0eS9ibG9iL3BhY2thZ2VzL2RpZmZv
c2NvcGUvdHJ1bmsvUEtHQlVJTEQKCls0XQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVk
L29wZW5lbWJlZGRlZC1jb3JlL2Jsb2IvYzJjZjk1Njg4MWMzYjY5MTY5MWY1MGIwMGIwZDY5MzBk
OGFiZWE2Zi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjE4LmJi
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNr
YWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
