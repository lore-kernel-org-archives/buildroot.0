Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41977C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 22:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A214A6139E
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 22:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A214A6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E2BB80DE5;
	Sun,  7 Nov 2021 22:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8hCCCu0vAK9; Sun,  7 Nov 2021 22:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A749580DE6;
	Sun,  7 Nov 2021 22:12:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 005671BF2E4
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 22:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBFF5401F7
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 22:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5JvS97wsM4M for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 22:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E319400D8
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 22:12:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t30so23559408wra.10
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RvFsccvw+1JE/8WDpe46i4dXcgYBfUAprSMOzukA8mY=;
 b=HEot/yHIabO2qjEZwLwyh83HC7zVM38L/jilSWFAYhgBH+OKpvvQ+gnoBmZfgKZbfm
 mi2B00r16K81jzY8L0vqePW9VtKbTHv5pzDMrBuFhtfclCV4Zs6cqrCaJq5paJUG99Vy
 /hpeq8Hai9JTQth4LIK2TSgTfApOgjgoZLkTiRSH4v2ts6vAnnBAYUQwq5FKNug5362d
 3jYFRILVCN2dasdC0piPXYv2FaTzbKhG6Kh1OWU7sNCKVceJ0c8t4ikrzxdcZLNjW/7c
 BZgr9/wJEyePBzwbYHA8EptvKQ3URFSSRBPFlv0uz8AHdXuUVt9DpCNt9FvvCqKdRtWA
 v7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RvFsccvw+1JE/8WDpe46i4dXcgYBfUAprSMOzukA8mY=;
 b=yP7ZsA0qhCqz10Z1Bw4/LmdJVFyJiqkValrwAxIx1Gk82Qt48Ocj9SpXB5cXDohAwQ
 QhjkQt0IrJDc16Dct/P5ybbHm221jygqJKDG8NYwrjK+aM8cXn8kl2rpYQ3R54DoAycn
 guWlmK8qcsDgrCLa2yJFhVSOEpodYndranUnbmW3e1DJ7bSJngiWQSOOgkd5sM2bWWIr
 etsJvMCAi7u2GrRiPJ4ByL6UC613If7Lt6ShYbEgm5EnHdW/CijfPdwePodFs8JONuFH
 5D93uTqNdnRpQORKRGgaigl6b+wn5Q3jJfTyXSEZB3ImsooEFerNPRoFdgBl2GFzofn3
 611A==
X-Gm-Message-State: AOAM533xgCwb2heVnHkrpCxumlPraEizgTBC2BkzPbMsrPqnvpl+J3Pv
 7wSkYggWLVFsU5165/319t5gSx6LvPM=
X-Google-Smtp-Source: ABdhPJwVM6XnIuAk7+C4ORWJgG/QxhihRKV+QjbJ/uUUTpBUd/tZ06oJ3jzARbZA3S54pzJ/zGXQiw==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr81096598wrx.86.1636323170536; 
 Sun, 07 Nov 2021 14:12:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l8sm19618670wmc.40.2021.11.07.14.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 14:12:50 -0800 (PST)
Message-ID: <fde73ce5-a720-3846-56da-cc53a358fd7b@gmail.com>
Date: Sun, 7 Nov 2021 23:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "D. Olsson" <hi@senzilla.io>
References: <20211107192930.370979-1-romain.naour@gmail.com>
 <53DE106D-44F1-40F5-B364-DA9708EFC032@senzilla.io>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <53DE106D-44F1-40F5-B364-DA9708EFC032@senzilla.io>
Subject: Re: [Buildroot] [PATCH 1/2] configs/qemu_aarch64_sbsa_defconfig:
 use ARM cortex a57
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGljaywKCkxlIDA3LzExLzIwMjEgw6AgMjI6MjUsIEQuIE9sc3NvbiBhIMOpY3JpdMKgOgo+
IEhpIFJvbWFpbiwKPiAKPiBSZXNlbmRpbmcgbXkgcmV2aWV3IGJlY2F1c2UgSSBkaWRuJ3QgcmVw
bHkgdG8gYWxsIDopCj4gCj4+IE9uIDcgTm92IDIwMjEsIGF0IDIwOjI5LCBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiDvu79XaGVuIGJvb3Rpbmcgd2l0
aCBjb3J0ZXgtYTUzLCBxZW11IHJlZnVzZSB0byBzdGFydCB3aXRoIHRoZSBmb2xsb3dpbmcgbWVz
c2FnZQo+PiBbMV06Cj4+Cj4+IMKgcWVtdS1zeXN0ZW0tYWFyY2g2NDogc2JzYS1yZWY6IENQVSB0
eXBlIG90aGVyIHRoYW4gdGhlIGJ1aWx0LWluIGNvcnRleC1hNTcKPj4gbm90IHN1cHBvcnRlZAo+
IAo+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyEgTG9va3MgbGlrZSByZW1vdmFsIG9mIGE1MyBz
dXBwb3J0IGlzIGEgZmFpcmx5IHJlY2VudAo+IGNoYW5nZSBpbgo+IFFFTVU6wqBodHRwczovL2dp
dGh1Yi5jb20vcWVtdS9xZW11L2NvbW1pdC80ZjMzNWE2MzgxZjgzYmViNWQ2YWMwZDM5OTM1MTQz
Nzk0NTRhOTlkI2RpZmYtOGVmYjczYzNlMGRkOWQ3YTEzYjA1OTdhMDU2YjRjZDhmYTlkOTI1MGM3
ZGU4YjFkM2I1MzhkMDdkOThhOGM1MAo+IDxodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Nv
bW1pdC80ZjMzNWE2MzgxZjgzYmViNWQ2YWMwZDM5OTM1MTQzNzk0NTRhOTlkI2RpZmYtOGVmYjcz
YzNlMGRkOWQ3YTEzYjA1OTdhMDU2YjRjZDhmYTlkOTI1MGM3ZGU4YjFkM2I1MzhkMDdkOThhOGM1
MD4KClRoYW5rcyBmb3IgdGhlIGxpbmshIEluZGVlZCB0aGUgYTUzIHN1cHBvcnQgaGFzIGJlZW4g
cmVtb3ZlZCBzaW5jZSBxZW11IDYuMC4KCkkgd2FzIHN1cnByaXNlZCBieSBoYXZpbmcgdGhpcyBp
c3N1ZSwgSXQncyBhIGdvb2QgcmVhc29uIHRvIGVuYWJsZSB0aGUgZ2l0bGFiCnJ1bnRpbWUgdGVz
dGluZyBpbiB0aGUgZm9sbG93aW5nIHBhdGNoLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+
PiBVc2UgQVJNIGNvcnRleCBhNTcgYXMgcmVxdWVzdGVkIGJ5IFFlbXUuCj4+Cj4+IFsxXQo+PiBo
dHRwczovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWNvbW1pdGRpZmY7aD02NDU4MDkwM2My
YjNhZWUwOGQ3NGQ2NGU2MjQ4YTMxM2IyNDZjYjY5Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gQ2M6IERpY2sgT2xzc29uIDxoaUBz
ZW56aWxsYS5pbz4KPj4gLS0tCj4+IGJvYXJkL3FlbXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQg
wqB8IDIgKy0KPj4gY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcgfCAyICstCj4+
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVhZG1lLnR4dAo+PiBiL2JvYXJk
L3FlbXUvYWFyY2g2NC1zYnNhL3JlYWRtZS50eHQKPj4gaW5kZXggNzkzNTEwOGVmMS4uYjYyOTQ3
ZjU1ZiAxMDA2NDQKPj4gLS0tIGEvYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvcmVhZG1lLnR4dAo+
PiArKysgYi9ib2FyZC9xZW11L2FhcmNoNjQtc2JzYS9yZWFkbWUudHh0Cj4+IEBAIC0xNyw3ICsx
Nyw3IEBAIFJ1biB0aGUgZW11bGF0aW9uIHdpdGg6Cj4+Cj4+IMKgwqBxZW11LXN5c3RlbS1hYXJj
aDY0IFwKPj4gwqDCoMKgwqAtTSBzYnNhLXJlZiBcCj4+IC0gwqDCoMKgLWNwdSBjb3J0ZXgtYTUz
IFwKPj4gKyDCoMKgwqAtY3B1IGNvcnRleC1hNTcgXAo+PiDCoMKgwqDCoC1zbXAgNCBcCj4+IMKg
wqDCoMKgLW0gMTAyNCBcCj4+IMKgwqDCoMKgLW5vZ3JhcGhpYyBcCj4+IGRpZmYgLS1naXQgYS9j
b25maWdzL3FlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwo+PiBiL2NvbmZpZ3MvcWVtdV9hYXJj
aDY0X3Nic2FfZGVmY29uZmlnCj4+IGluZGV4IDBlMWM3OTliNGQuLmQxZTBhZGFkZDEgMTAwNjQ0
Cj4+IC0tLSBhL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4+ICsrKyBiL2Nv
bmZpZ3MvcWVtdV9hYXJjaDY0X3Nic2FfZGVmY29uZmlnCj4+IEBAIC0xLDYgKzEsNiBAQAo+PiAj
IEFyY2hpdGVjdHVyZQo+PiBCUjJfYWFyY2g2ND15Cj4+IC1CUjJfY29ydGV4X2E1Mz15Cj4+ICtC
UjJfY29ydGV4X2E1Nz15Cj4+Cj4+ICMgVG9vbGNoYWluCj4+IEJSMl9UT09MQ0hBSU5fQlVJTERS
T09UX1dDSEFSPXkKPj4gLS0gCj4+IDIuMzEuMQo+IAo+IExvb2tzIGdvb2QhCj4gCj4gUmV2aWV3
ZWQtYnk6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
