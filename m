Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45778C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 15:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DDB408C1;
	Tue,  9 Aug 2022 15:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DDB408C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9N9Zy_tx7hR; Tue,  9 Aug 2022 15:21:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8FB4026C;
	Tue,  9 Aug 2022 15:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8FB4026C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 153FA1BF36E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 15:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F128760F48
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 15:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F128760F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aRiD847ugObd for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 15:21:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 750F360EF2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 750F360EF2
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 15:21:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bv3so14685134wrb.5
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6W8wji4LsSkdFlFwnIozbizZdRQvQmlRJFXVvTImWAI=;
 b=C7vEw3lZQsj+OfqKyxgwqi8bc8EJv3mjXsDvI/uN8IL5EcQpVor9V0HyG1wei/w6Jh
 8pNJxnQXVxlRYPqoQNdvdUvahwF7lHP7dHavGO2Rr9HNP/DLdS/HZw/ur8PlwnuQyMUU
 TODIdJK+ITW3jMdGEga9ffvCGWNlRGa7wKcak2tb9KJKuEK56WtvAa0V2Ol8gIhNiP7o
 SihrSj7Cf/tQCYgUFEqdSdwJ/fs+OiREznLvzlenN7ts98HMOOQD08LoYajWY62QOXx8
 Tv6N426u54yn86ubcy9OMRRuiDT82lhTa1zxmPpjOYY+Xzh1HcKzQVkTAvQ4PYn/QZPx
 qAjw==
X-Gm-Message-State: ACgBeo29irH5sykO3+AFTWXcJO3N0M+jt7NZhA/h3R++y1jUAPFPq7LB
 kN+oFJCTaTPzz8xiFm/mRgfQj9EKwk6GOw==
X-Google-Smtp-Source: AA6agR6Sj1jYUmGixyezdH4IIdXQ0TW0r3YLJh4cKJto5CSQ1jCP/wqWgCxeqb/uh9cVoi9IqcO4Tg==
X-Received: by 2002:a5d:6d84:0:b0:220:5dda:a0e8 with SMTP id
 l4-20020a5d6d84000000b002205ddaa0e8mr14546917wrs.493.1660058470654; 
 Tue, 09 Aug 2022 08:21:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c240b00b003a331c6bffdsm17215558wmp.47.2022.08.09.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 08:21:10 -0700 (PDT)
Message-ID: <98640aa0-2a1b-1c17-561f-02645505b0c0@smile.fr>
Date: Tue, 9 Aug 2022 17:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220723151806.27866846A1@busybox.osuosl.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220723151806.27866846A1@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=6W8wji4LsSkdFlFwnIozbizZdRQvQmlRJFXVvTImWAI=;
 b=08z7k/vnUgfN9LZTdq6Vqm6p3yBmMemitx292l3achehCp3m/nJ47gYH+m2crXU5O/
 nBQVolhDO3JiWLVEXWw9K0osf2VB41zEzclxLzNFh2okAxgAJneC6RsJFNufNUN5c4Lt
 xAKVVBbLSdyiWPa7wJqsblPVhXxCaBIt57Gpu5rwrBsm0plvhQl90H89nnjcutvBVNfJ
 2SPquk5NSz/dHaHLNY/0YvD1uR9IXvUs2DNaGjVQPgB57kUyaqWnSUULHH2Cp8UtFrBt
 Eira3/q3M2VxWMlHGRWfV/oo7fr4KGl0HQrzkAS9p7vntW6g4Kp9upaXdNEHpD9I3dxs
 1efA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=08z7k/vn
Subject: Re: [Buildroot] [git commit] package/gcc: add support for gcc 12
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRXJpYywKCkxlIDIzLzA3LzIwMjIgw6AgMTc6MzEsIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IGNvbW1pdDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5l
dC9idWlsZHJvb3QvY29tbWl0Lz9pZD0wZjFhZDRmYzkzMjg2YWRhYmE4NTJjOTlkNmUxYzI1NjVi
NWM0MjU4Cj4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21t
aXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4gCj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtMTIv
Y2hhbmdlcy5odG1sCgpUaGUgcmVsZWFzZSBub3RlIGRvZXNuJ3Qgc2F5IGFueXRoaW5nIGFib3V0
IEQgbGFuZ3VhZ2UgY2hhbmdlcyBidXQgaXQgc2VlbXMgdGhhdApvbmUgbWFqb3IgY2hhbmdlIGlu
IGdjYyAxMiBpcyBtaXNzaW5nOgoKIlRoZSBEIGZyb250LWVuZCBpcyBub3cgaXRzZWxmIHdyaXR0
ZW4gaW4gRCwgaW4gb3JkZXIgdG8gYnVpbGQgR0RDLCB5b3UKd2lsbCBuZWVkIGEgd29ya2luZyBH
REMgY29tcGlsZXIgKEdDQyB2ZXJzaW9uIDkuMSBvciBsYXRlcikuIiBbMV0KClNvIHdlIGhhdmUg
dG8gY2hlY2sgaWYgYSBEIGNvbXBpbGVyIGlzIGF2YWlsYWJsZSBvbiB0aGUgaG9zdC4KClNlZToK
aHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzZhLzM2YWEyMmU0NThkNTNh
Yjg2ODdiM2E3OWZmZWI2NWIxOGU4YWM2ZTcvaG9zdC1nY2MtZmluYWwtMTIuMS4wL2J1aWxkL2Nv
bmZpZy5sb2cKClsxXQpodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0
ZGlmZjtoPTVmZWU1ZWMzNjJmN2EyNDNmNDU5ZTYzNzhmZDQ5ZGZjODlkYzlmYjUKCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiBodHRwczovL2djYy5nbnUub3JnL2djYy0xMi9wb3J0aW5nX3RvLmh0
bWwKPiAKPiBUZXN0ZWQgd2l0aCB0b29sY2hhaW4tYnVpbGRlcjoKPiBodHRwczovL2dpdGxhYi5j
b20va3VidTkzL3Rvb2xjaGFpbnMtYnVpbGRlci8tL3BpcGVsaW5lcy81NTA0MDQ5NTcKPiAKPiBB
bGwgdGhyZWUgcGF0Y2hlcyB3ZSBoYWQgb24gZ2NjIDExLnggYXJlIHVwc3RyZWFtLCBzbyB0aGVy
ZSBhcmUgc28gZmFyCj4gbm8ga25vd24gcGF0Y2hlcyBuZWVkZWQgZm9yIGdjYyAxMi54LiBIZXJl
IGFyZSB0aGUgdXBzdHJlYW0gY29tbWl0cyBvZgo+IHRoZSAzIHBhdGNoZXM6Cj4gCj4gaHR0cHM6
Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdpdDthPWNvbW1pdGRpZmY7aD1lZmY4MTEwNjc0ZWYx
OTM0ODFkMzY1NzQ1NmEyNjJiZWViOTk1MWZmCj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9
Z2NjLmdpdDthPWNvbW1pdGRpZmY7aD1kYThhOWQ2OTViM2M0YjkzOTdiNWQ5YTI3NjYwYmZhNDhh
ZjhkNzA3Cj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9naXQvP3A9Z2NjLmdpdDthPWNvbW1pdGRpZmY7
aD1jYWMyZjY5Y2RhZDQzNGFkNWNiNjBmNWZlOTMxZDQ1Y2Q4MmVmNDc2Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IFRlc3RlZC1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9nY2MvQ29uZmlnLmluLmhvc3QgfCAxNCArKysrKysrKysrKysrKwo+ICBwYWNr
YWdlL2djYy9nY2MuaGFzaCAgICAgICB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdCBi
L3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggMmIxMjAzNWM0Yi4uMmQ5ZWFlZjEw
MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdAo+ICsrKyBiL3BhY2th
Z2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTYyLDYgKzYyLDE5IEBAIGNvbmZpZyBCUjJfR0ND
X1ZFUlNJT05fMTFfWAo+ICAJZGVwZW5kcyBvbiAhQlIyX2FyY2hzNHhfcmVsMzEKPiAgCXNlbGVj
dCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMQo+ICAKPiArY29uZmlnIEJSMl9HQ0NfVkVS
U0lPTl8xMl9YCj4gKwlib29sICJnY2MgMTIueCIKPiArCSMgcG93ZXJwYyBzcGUgc3VwcG9ydCBo
YXMgYmVlbiBkZXByZWNhdGVkIHNpbmNlIGdjYyA4LnguCj4gKwkjIGh0dHBzOi8vZ2NjLmdudS5v
cmcvbWwvZ2NjLzIwMTgtMDQvbXNnMDAxMDIuaHRtbAo+ICsJZGVwZW5kcyBvbiAhQlIyX3Bvd2Vy
cGNfU1BFCj4gKwkjIHVDbGliYy1uZyBicm9rZW4gb24gc3BhcmMgZHVlIHRvIHJlY2VudCBnY2Mg
Y2hhbmdlcwo+ICsJIyB0aGF0IG5lZWQgdG8gYmUgcmV2ZXJ0ZWQgc2luY2UgZ2NjIDguNCwgOS4z
IGFuZCAxMC4xLgo+ICsJIyBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNn
aT9pZD05ODc4NAo+ICsJZGVwZW5kcyBvbiAhQlIyX3NwYXJjCj4gKwkjIEFSQyBIUzQ4IHJlbCAz
MSBvbmx5IHN1cHBvcnRlZCBieSBnY2MgYXJjIGZvcmsuCj4gKwlkZXBlbmRzIG9uICFCUjJfYXJj
aHM0eF9yZWwzMQo+ICsJc2VsZWN0IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEyCj4gKwo+
ICBlbmRjaG9pY2UKPiAgCj4gICMgbGliY2lsa3J0cyB3YXMgaW50cm9kdWNlZCBpbiBnY2MgNC45
IGFuZCByZW1vdmVkIGluIGdjYyA4LngKPiBAQCAtODgsNiArMTAxLDcgQEAgY29uZmlnIEJSMl9H
Q0NfVkVSU0lPTgo+ICAJZGVmYXVsdCAiOS40LjAiICAgICBpZiBCUjJfR0NDX1ZFUlNJT05fOV9Y
Cj4gIAlkZWZhdWx0ICIxMC4zLjAiICAgIGlmIEJSMl9HQ0NfVkVSU0lPTl8xMF9YCj4gIAlkZWZh
dWx0ICIxMS4zLjAiICAgIGlmIEJSMl9HQ0NfVkVSU0lPTl8xMV9YCj4gKwlkZWZhdWx0ICIxMi4x
LjAiICAgIGlmIEJSMl9HQ0NfVkVSU0lPTl8xMl9YCj4gIAlkZWZhdWx0ICJhcmMtMjAyMC4wOS1y
ZWxlYXNlIiBpZiBCUjJfR0NDX1ZFUlNJT05fQVJDCj4gIAo+ICBjb25maWcgQlIyX0VYVFJBX0dD
Q19DT05GSUdfT1BUSU9OUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9nY2MuaGFzaCBiL3Bh
Y2thZ2UvZ2NjL2djYy5oYXNoCj4gaW5kZXggZTM2NGJlMGEwNi4uZGMxOWMyODJjMiAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2djYy9nY2MuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZ2NjL2djYy5oYXNo
Cj4gQEAgLTYsNiArNiw4IEBAIHNoYTUxMiAgZGZkMzUwMGJmMjE3ODRiODM1MWE1MjJkNTM0NjNj
ZjM2MmVkZTY2YjBiYzMwMmVkZjM1MGJiNDRlOTQ0MTg0OTdhOGI0Yjc5Cj4gIHNoYTUxMiAgMmIy
ZGQ3NDUzZDQ4YTM5OGMyOWVhZWJkMTQyMmI3MDM0MTAwMWI4YzkwYTYyYWVlNTFlODMzNDRlN2Zk
ZDhhOGU0NWY4MmE0YTkxNjViZDdlZGM3NmRhZGE5MTJjOTMyZjRiNjYzMmM1NjM2NzYwZmVjNGM1
ZDdlNDAyYjNmODYgIGdjYy0xMC4zLjAudGFyLnh6Cj4gICMgRnJvbSBodHRwczovL2djYy5nbnUu
b3JnL3B1Yi9nY2MvcmVsZWFzZXMvZ2NjLTExLjMuMC9zaGE1MTIuc3VtCj4gIHNoYTUxMiAgZjBi
ZTVhZDcwNWM3M2I4NDQ3NzEyOGE2OWMwNDdmNTdkZDQ3MDAyZjM3NWViNjBlMWU4NDJlMDhjZjIw
MDlhNTA5ZTkyMTUyYmNhMzQ1ODIzOTI2ZDU1MGI3Mzk1YWU2ZDRkZTdkYjUxZDFlZTM3MWMyZGMz
NzMxMzg4MWZjYTcgIGdjYy0xMS4zLjAudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2djYy5nbnUu
b3JnL3B1Yi9nY2MvcmVsZWFzZXMvZ2NjLTEyLjEuMC9zaGE1MTIuc3VtCj4gK3NoYTUxMiAgMjEy
MWQyOTUyOTI4MTRhNjc2MWVkZjFmYmEwOGM1ZjYzM2ViZTE2ZjUyYjgwZTdiNzNhOTEwNTBlNzFl
MWQyZWQ5OGJmMTdlZWJhZDI2M2UxOTE4Nzk1NjFjMDJiNDg5MDZjNTNmYWE0YzQ2NzBjNDg2YTI2
ZmM3NWRmMjM5MDAgIGdjYy0xMi4xLjAudGFyLnh6Cj4gIAo+ICAjIExvY2FsbHkgY2FsY3VsYXRl
ZCAoZmV0Y2hlZCBmcm9tIEdpdGh1YikKPiAgc2hhNTEyICBiMDg1M2UyYjFjNTk5ODA0NDM5MjAy
M2ZhNjUzZTM5OWU3NDExOGM0NmU2MTY1MDRhYzU5ZTFhMmNmMjc2MjBmOTQ0MzQ3NjdjZTA2YjZj
ZjRjYTNkZmI1N2Y4MWQ2ZWRhOTI3NTJiZWZhZjA5NWVhNWU1NjRhOTE4MWI0NjU5YyAgZ2NjLWFy
Yy0yMDIwLjA5LXJlbGVhc2UudGFyLmd6Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
