Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5091EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:32:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0C161074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C0C161074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C679840474;
	Sun, 19 Sep 2021 12:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EyB4Ihd2DYYb; Sun, 19 Sep 2021 12:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94EA40467;
	Sun, 19 Sep 2021 12:32:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121431BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB489606F6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Ju9J3QmrttD for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:32:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0993606EE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:32:27 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id eg28so26546047edb.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nCY2GXwVbEsfGU7T0+/dkeHBf3LQ3NEMYDK6gPpSoDI=;
 b=SoBRJJPQRzzCia77vx65bPomfbqmxY4VlZJAtgnAC6T3GP3JFuTGCSuUJxjgtCMBKt
 MVJLhr1Dw8DBR8/F5yvHqW58PoVF8/lcVJyfGf2Mc7IZxZYerqI3/ucWsyFOq846Hyr+
 EdMrX5CfuPAvr/cMCrnx/7yt63JJ5P6XMECMPbHIqOKgvWzGFFSf8j9OZfLJqqcptzGz
 42RxwGGieksPyBbgDPwGzXXZ52/gb7Q/IyhYacmb344WQUDdraLMqTq7Mudz1P3jYC1z
 SzkmT7Xt3iZuoEbFblDIusOnoRwrR/ODjozYJQdQld8Np0mL8szTa0qTg0nTl+YoBNf6
 sqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nCY2GXwVbEsfGU7T0+/dkeHBf3LQ3NEMYDK6gPpSoDI=;
 b=q3PPWnYx0bQumml/q6N8t1nRaWPB0qnGA7NFkMf9ApA4QRj0KKIfwc01G/L4v7mRSh
 q5qSRY+gf+wmTp4TcLxADQ8pnlNDWXhQqbsIjpz4MCq74yFXWpoMTaLhITggk5UuI5o0
 sCHd4Ky/alyw/8UtnSQ1sEK9sQBTuytdX6oeamhZvP/ddOuTz/J6qCS7JbkImIC9amEX
 3Th4JFYbiBbnczDdSYOFWQf80GacY4Wd8q1vznP5InlbhvDl3QtPypWHztNuAeJo/+1a
 GxIJc5HK6mKW33CjmmCN3+VxmIR31kip3INkBWIQlYl6AqqZ+gaEedTXAq8TgNUWC52f
 CCag==
X-Gm-Message-State: AOAM531hc+kKg4d559+rcG+bvtnii0lcCiuKlpBL583BTmqPM16w1vVD
 bpwU5Ab/w+vxN+UnM614r3Ds6g==
X-Google-Smtp-Source: ABdhPJzO8KrLk+Jqgd9HBlhy46jYcqBBX8wuQAhBEqS59LZU5W/+zlKw/m1rapHnHCPHzZ3PQJS1nQ==
X-Received: by 2002:a17:906:7c4:: with SMTP id
 m4mr23726284ejc.553.1632054745815; 
 Sun, 19 Sep 2021 05:32:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s26sm5647269edt.41.2021.09.19.05.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 05:32:25 -0700 (PDT)
Message-ID: <765c2509-4af3-fb71-d9d7-8612e8f62b7e@mind.be>
Date: Sun, 19 Sep 2021 14:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20210907120933.31647-1-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210907120933.31647-1-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] package/mupdf: fix building with some
 toolchains
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAwNy8wOS8yMDIxIDE0OjA5LCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBXaXRoIHNv
bWUgdG9vbGNoYWlucyAoZS5nLiBtaXBzNjRlbCksIHBhcnRpYWwgbGlua2luZyBmYWlscyBpbiB0
aGUKPiBmb2xsb3dpbmcgd2F5Ogo+IC90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29wdC9l
eHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11Y2xp
YmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9iaW4v
bGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubyk6IEFCSSBpcyBpbmNv
bXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3RlZCBlbXVsYXRpb24KPiAvdG1wL2luc3Rh
bmNlLTEvb3V0cHV0LTEvaG9zdC9vcHQvZXh0LXRvb2xjaGFpbi9iaW4vLi4vbGliL2djYy9taXBz
NjRlbC1idWlsZHJvb3QtbGludXgtdWNsaWJjLzguNC4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNp
ZmljIGRhdGEgb2YgZmlsZSBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoRGluZ2JhdHMuY2ZmLm8p
Cj4gCj4gVGFraW5nIGluc3BpcmF0aW9uIGZyb20gY29tbWl0Cj4gOWVjYTRiOWY4NGZlMjUzNWQ4
Y2FlZTZlZWIwNjJjZTMzNzMzYmRmMSwgZml4IGl0IGJ5IHVzaW5nIEdDQyBpbnN0ZWFkCj4gb2Yg
TEQgZm9yIHBhcnRpYWwgbGlua2luZy4KPiAKPiAnbm9zdGRsaWInIGhhcyB0byBiZSBhZGRlZCwg
b3IgaXQgd2lsbCB0cnkgdG8gdXNlIEdDQyBsaWJyYXJpZXMgZm9yCj4gcGFydGlhbCBsaW5raW5n
IGFuZCBmYWlsIHdpdGggJ2Nhbm5vdCBmaW5kIC1sZ2NjX3MnLgo+IAo+IE5vdGUgdGhhdCBvbiBt
aXBzIHRoZSBidWlsZCB3aWxsIG5vdyBwcm9kdWNlIHdhcm5pbmdzIHNpbWlsYXIgdG8gdGhpcwo+
IG9uZToKPiAvaG9tZS9ybWUvRG9jdW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2Nj
L21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL21pcHM2NGVs
LWJ1aWxkcm9vdC1saW51eC1nbnUvYmluL2xkOiBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoTm90
b1NhbnNUYWlUaGFtLVJlZ3VsYXIudHRmLm8pOiB3YXJuaW5nOiBsaW5raW5nIGFiaWNhbGxzIGZp
bGVzIHdpdGggbm9uLWFiaWNhbGxzIGZpbGVzCj4gCj4gRHVyaW5nIGEgcnVudGltZSB0ZXN0IG9u
IG1pcHM2NGVsIHVuZGVyIHFlbXUsIG11cGRmLXgxMSB3YXMKPiBub25ldGhlbGVzcyBhYmxlIHRv
IGRpc3BsYXkgYSBzYW1wbGUgUERGIGZpbGUgY29ycmVjdGx5Lgo+IAo+IFRoaXMgZml4ZXMgdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlcyAoYW5kIG1hbnkgc2ltaWxhciBvbmVzKToKPiBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBm
NmM1ZGU1NTYyMzgzYmMyYjc0Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRl
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KPiAgIC4uLi8wMDAxLXVzZS1nY2MtaW5z
dGVhZC1vZi1vYmpjb3B5LnBhdGNoICAgICB8IDI5ICsrKysrKysrKysrKysrKysrKysKPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9tdXBkZi8wMDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpjb3B5LnBhdGNoCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvMDAwMS11c2UtZ2NjLWluc3RlYWQtb2Ytb2JqY29weS5w
YXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwMS11c2UtZ2NjLWluc3RlYWQtb2Ytb2JqY29weS5wYXRj
aAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOWE4ZGFjYmNjYQo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL211cGRmLzAwMDEtdXNlLWdjYy1pbnN0ZWFk
LW9mLW9iamNvcHkucGF0Y2gKPiBAQCAtMCwwICsxLDI5IEBACj4gK0Zyb20gZGUyN2RhZWRmOGNi
MWQyMTBiMGIxZmFjZDg3NjM0YzZhYWFmMWE3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogPT9VVEYtOD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KPiArRGF0ZTogVGh1LCAyIFNlcCAyMDIxIDIwOjE3OjI2ICswMjAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gdXNlIGdjYyBpbnN0ZWFkIG9mIG9iamNvcHkKPiArTUlNRS1WZXJz
aW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0Nv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiArCj4gK1NpZ25lZC1vZmYtYnk6IFJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCiAgV2hhdCdzIHRoZSB1cHN0
cmVhbSBzdGF0dXMgb2YgdGhpcyBwYXRjaD8gV2Ugd2FudCB0byBoYXZlIGEgbGluayB0byB0aGUg
CnVwc3RyZWFtIE1SIG9yIHBhdGNod29yayBvciBtYWlsaW5nIGxpc3QgYXJjaGl2ZSBvciB3aGF0
ZXZlciBpbiB0aGUgcGF0Y2guIE9yLCAKaWYgdGhhdCdzIG5vdCBwb3NzaWJsZSAoZS5nLiB1cHN0
cmVhbSBpcyBkZWFkKSwgc29tZXRoaW5nIGxpa2U6CgpVcHN0cmVhbS1TdGF0dXM6IGRlYWQgKG5v
IGFjdGl2aXR5IHNpbmNlIDIwMDMpCgoKICBSZWdhcmRzLAogIEFybm91dAoKPiArLS0tCj4gKyBN
YWtlZmlsZSB8IDIgKy0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ICsKPiArZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiAraW5kZXgg
YjBmYjYxN2UyLi4wYTg3OTVlMGUgMTAwNjQ0Cj4gKy0tLSBhL01ha2VmaWxlCj4gKysrKyBiL01h
a2VmaWxlCj4gK0BAIC02NCw3ICs2NCw3IEBAIGVuZGlmCj4gKyBMSU5LX0NNRCA9ICQoUVVJRVRf
TElOSykgJChNS1RHVERJUikgOyAkKENDKSAkKExERkxBR1MpIC1vICRAICReICQoTElCUykKPiAr
IFRBR1NfQ01EID0gJChRVUlFVF9UQUdTKSBjdGFncyAtUiAtLWMta2luZHM9K3AKPiArIFdJTkRS
RVNfQ01EID0gJChRVUlFVF9XSU5EUkVTKSAkKE1LVEdURElSKSA7ICQoV0lORFJFUykgJDwgJEAK
PiArLU9CSkNPUFlfQ01EID0gJChRVUlFVF9PQkpDT1BZKSAkKE1LVEdURElSKSA7ICQoTEQpIC1y
IC1iIGJpbmFyeSAteiBub2V4ZWNzdGFjayAtbyAkQCAkPAo+ICsrT0JKQ09QWV9DTUQgPSAkKFFV
SUVUX09CSkNPUFkpICQoTUtUR1RESVIpIDsgJChDQykgLVdsLC1yIC1XbCwtYiAtV2wsYmluYXJ5
IC1XbCwteiAtV2wsbm9leGVjc3RhY2sgLW5vc3RkbGliIC1vICRAICQ8Cj4gKwo+ICsgIyAtLS0g
UnVsZXMgLS0tCj4gKwo+ICstLQo+ICsyLjMyLjAKPiArCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
