Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0DEC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 06:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F039B60F38;
	Thu, 13 Jan 2022 06:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJz43Ax5waZ8; Thu, 13 Jan 2022 06:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A59D60DFD;
	Thu, 13 Jan 2022 06:53:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 809051BF860
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B7CE84C02
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 06:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gYLNvqftAVv for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 06:53:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37A0884BF9
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 06:53:47 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id n12so3214669vkc.12
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 22:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yOO5V1z0AcSYTMCwSqJWwYm9jFunmjq9Azk7MVGxbAw=;
 b=UZrOzbjPUp1WQ197IKCHkL/Z9BzrEBDDo/7a6SawXfS6twgVxde/Gjme1QVNTph+BD
 KK1FXX0BojhbfmvtYXuuEEBOpt38hv9zjCtfgyEdoSDBAAa15sT1OSAjKJ7yqdremt70
 rRK+RkVasGCTWmu/qt97fHm95w6vdqNc7D0ENKq4PYCsG1QOIktPTgqcmpvjR+cBGbE4
 wbqJr9mWAk6lZPJHrZwP4yfsBvFjvmkYyL7gZlx67g+DThtpTPcJ1JYJZQJBHUihcqTm
 IdEjtXqWIcQzmlHehnIMeXTwW1i4U6H6Pm/R1ZnrILwaDzN02LlBHfyd7/klWEVKwOtk
 6vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yOO5V1z0AcSYTMCwSqJWwYm9jFunmjq9Azk7MVGxbAw=;
 b=6bw0FctgXh53TY/NGHGYvv7vMX6OwcMKjbwo5yDUK8yfrzxDIQh1e1korCx39VZ583
 uOt66W4HhcfNV7T888B0ak95KuC3TdxCAjw8Qtz4Ca4G506UPVWhfVdgV6S3BqdUNq4t
 kxkflaLMLww2aOR+Fr8bb9K8i4u1dkHHZnwkQSmZxhN/mYfwWd5Ybw7fRXUusaMuzzCF
 lj//4LaVZ7ITWdaj3ynaJrqHZ7h9PsNUf9++1AqTDAZiRjLiQWTHbXcCRq/sgUNwpWTr
 9hEa1PqnV8I+m7IwSFOQ0hzXDe5536/wGzyhlmwEyGNH78ndr1gmuDC7xQbq1gR8NEsS
 gwzQ==
X-Gm-Message-State: AOAM5331C73qYmfrBEsJVD7nCDhrabMwYChYhazAmZ9acMBGZ+dZW0EF
 65EIkS5FTNjXtTNBuKYXno1INvALMJDKgFZzrkw=
X-Google-Smtp-Source: ABdhPJyVhCutyCa+JwjOGKJpRath/aelT3dd73rZcIBfiOMQx7PD0C8+FRKNtf07ALvwQ49d14F9Xuz8Qh/Jcnh+oXM=
X-Received: by 2002:a1f:194e:: with SMTP id 75mr1754827vkz.26.1642056826078;
 Wed, 12 Jan 2022 22:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20220107222613.4124764-1-james.hilliard1@gmail.com>
In-Reply-To: <20220107222613.4124764-1-james.hilliard1@gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 13 Jan 2022 07:51:36 +0100
Message-ID: <CAKcgs2w6ONQ0UZ_-Crd0xcVZjctd0BO5HEJUpfmKw8cFZFSG4w@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/5] package/serd: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbCwKCkxlIHZlbi4gNyBqYW52LiAyMDIyIMOgIDIzOjI2LCBKYW1lcyBIaWxs
aWFyZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4g
IERFVkVMT1BFUlMgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
fCAgMSArCj4gIHBhY2thZ2Uvc2VyZC9Db25maWcuaW4gfCAgOCArKysrKysrKwo+ICBwYWNrYWdl
L3NlcmQvc2VyZC5oYXNoIHwgIDQgKysrKwo+ICBwYWNrYWdlL3NlcmQvc2VyZC5tayAgIHwgMjAg
KysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NlcmQvQ29uZmlnLmluCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3NlcmQvc2VyZC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3NlcmQvc2VyZC5tawo+Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9Q
RVJTCj4gaW5kZXggM2Q1YzAxZjc5NS4uZDk5ZDc3OThkYiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9Q
RVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xMjk5LDYgKzEyOTksNyBAQCBGOiAgICAgICAg
cGFja2FnZS9weXRob24tdGlueWNzczIvCj4gIEY6ICAgICBwYWNrYWdlL3B5dGhvbi13ZWFzeXBy
aW50Lwo+ICBGOiAgICAgcGFja2FnZS9weXRob24teWFybC8KPiAgRjogICAgIHBhY2thZ2UvcHl0
aG9uLXpvcGZsaS8KPiArRjogICAgIHBhY2thZ2Uvc2VyZC8KPiAgRjogICAgIHBhY2thZ2UvemNo
dW5rLwo+Cj4gIE46ICAgICBKYW1lcyBLbmlnaHQgPGphbWVzLmtuaWdodEBjb2xsaW5zLmNvbT4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGlu
ZGV4IGU5ZWU0ZDJlZjEuLjE4YWUyMmYyMjcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xNzA0LDYgKzE3MDQsNyBAQCBtZW51
ICJKU09OL1hNTCIKPiAgICAgICAgIHNvdXJjZSAicGFja2FnZS9yYXBpZGpzb24vQ29uZmlnLmlu
Igo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3JhcGlkeG1sL0NvbmZpZy5pbiIKPiAgICAgICAg
IHNvdXJjZSAicGFja2FnZS9yYXB0b3IvQ29uZmlnLmluIgo+ICsgICAgICAgc291cmNlICJwYWNr
YWdlL3NlcmQvQ29uZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3Rpbnl4bWwvQ29u
ZmlnLmluIgo+ICAgICAgICAgc291cmNlICJwYWNrYWdlL3Rpbnl4bWwyL0NvbmZpZy5pbiIKPiAg
ICAgICAgIHNvdXJjZSAicGFja2FnZS92YWxpanNvbi9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvc2VyZC9Db25maWcuaW4gYi9wYWNrYWdlL3NlcmQvQ29uZmlnLmluCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43NjMzYTk3OWUyCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2Uvc2VyZC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDggQEAKPiAr
Y29uZmlnIEJSMl9QQUNLQUdFX1NFUkQKPiArICAgICAgIGJvb2wgInNlcmQiCj4gKyAgICAgICBo
ZWxwCj4gKyAgICAgICAgIFNlcmQgaXMgYSBsaWdodHdlaWdodCBDIGxpYnJhcnkgZm9yIFJERiBz
eW50YXggd2hpY2gKPiArICAgICAgICAgc3VwcG9ydHMgcmVhZGluZyBhbmQgd3JpdGluZyBUdXJ0
bGUsIFRyaUcsIE5UcmlwbGVzLCBhbmQKPiArICAgICAgICAgTlF1YWRzLgo+ICsKPiArICAgICAg
ICAgaHR0cHM6Ly9kcm9iaWxsYS5uZXQvc29mdHdhcmUvc2VyZC5odG1sCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvc2VyZC9zZXJkLmhhc2ggYi9wYWNrYWdlL3NlcmQvc2VyZC5oYXNoCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kNjRhMmFhMjcxCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2Uvc2VyZC9zZXJkLmhhc2gKPiBAQCAtMCwwICsxLDQgQEAKPiAr
IyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlCj4gKyMgaHR0cDov
L2Rvd25sb2FkLmRyb2JpbGxhLm5ldC9zZXJkLTAuMzAuMTAudGFyLmJ6Mi5zaWcKPiArc2hhMjU2
ICBhZmZhODBkZWVjNzg5MjFmODYzMzVlNmZjM2YxOGI4MGFlZmVjZjQyNGY2YTU3NTVlOWYyZmEw
ZWIwNzEwZWRmICBzZXJkLTAuMzAuMTAudGFyLmJ6Mgo+ICtzaGEyNTYgIGUwNjU2MmQ2YmNmMDM0
MWIyYWMyYWQwZjBjYTM2ODAxZDJlYmYzODhkNWVmMjk3MDExNjI1ZTRjMzZlOTYzZjAgIENPUFlJ
TkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zZXJkL3NlcmQubWsgYi9wYWNrYWdlL3NlcmQvc2Vy
ZC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODViMTZmNjg2
Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3NlcmQvc2VyZC5tawo+IEBAIC0wLDAg
KzEsMjAgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIHNlcmQKPiArIwo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArU0VSRF9WRVJTSU9OID0gMC4zMC4xMAo+
ICtTRVJEX1NJVEUgPSBodHRwczovL2Rvd25sb2FkLmRyb2JpbGxhLm5ldAo+ICtTRVJEX1NPVVJD
RSA9IHNlcmQtJChTRVJEX1ZFUlNJT04pLnRhci5iejIKPiArU0VSRF9MSUNFTlNFID0gSVNDCj4g
K1NFUkRfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArU0VSRF9JTlNUQUxMX1NUQUdJTkcgPSBZ
RVMKPiArCj4gK1NFUkRfQ09ORl9PUFRTICs9IC0tbGFyZ2VmaWxlIC0tbm8tY292ZXJhZ2UKPiAr
Cj4gK2lmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICtTRVJEX0NPTkZfT1BUUyArPSAtLXN0
YXRpYyAtLW5vLXNoYXJlZCAtLXN0YXRpYy1wcm9ncwo+ICtlbmRpZgo+ICsKPiArJChldmFsICQo
d2FmLXBhY2thZ2UpKQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdApSYW4gY29tcGlsYXRpb24gdGVzdCBvbiBhcm02NCB3aXRoIGV4dGVy
bmFsIHRvb2xjaGFpbi4KQWxzbyByYW4gdGhlIHRlc3QtcGtnIHV0aWxpdHkuCgpUZXN0ZWQtYnk6
IEdpbGxlcyBUYWxpcyA8Z2lsbGVzLnRhbGlzQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
