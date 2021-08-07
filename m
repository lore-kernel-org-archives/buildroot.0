Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B9C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:08:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4725660249
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 15:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4725660249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78CE60656;
	Sat,  7 Aug 2021 15:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_bYFSjGYdJh; Sat,  7 Aug 2021 15:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240D36064A;
	Sat,  7 Aug 2021 15:08:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33031BF2A2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE3983942
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 15:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3o067ShCugaU for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 15:08:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0992583938
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 15:08:21 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l4so1917367ljq.4
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uhqFrAXx+Yq5MHwOE0le3r34Ujikdn1rbT4vtamFfVo=;
 b=dkjn2nVMylTR2D2QhmghtpmT5er3vdwejry1JpsC35WYXmHdlmqXMmLDQxpafGYQpQ
 e+7yDNYyM93iSr74slZ2u6Q+gnEZjh1TX04764ZjWKH3kTjTWl03Lxxz4yFqfEzeqdAw
 uaS8UiBNPO6xRkjXmAwsxe1F+QgIjVHrUS0h8A8QDAJLHoNBSGcPHHGJmEgnjHXgCkEF
 mwjg0x6KPx36kuLrqPjTs13ebrodfEyguReQ79W8hMXE7gXBkBpbFEVOAIBuA3ZmOpHY
 8zVyh/1GxxE3EwqJQfUfWJFirx8HBoi5D5LwqwmmyYSCE7NK5ARLOn9H0w/r5GeHDwRC
 K1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uhqFrAXx+Yq5MHwOE0le3r34Ujikdn1rbT4vtamFfVo=;
 b=AzNuJNrIp7sNDU4cjoQUwwQhDdNEn+izNAB3uu7BhFaY5jxX7/TNOfpF5d84RkYX0V
 52DZEDC7/iBHO1615R4Lrl+txT/WTwQwwwmD5vi1MK8by6xJd0k1ryZBW/LCJoE+gcXc
 zjVU7E8OI51v45oYHde6czpVCtJrSNliK0db3mPkyIbojaDKIoQZPwzBT4N5gYWOGV1n
 aJcBOriF5DmgIz3/MBZRaSv3VwvbSaxjg/8+4XgbHEdFxUgDME6qaJwojyoOevsLS/hw
 9FM7gXCqLI0turNmhNFPs+HmyQFenyeDvcivy6lYhnD0ycdU7GOLC6oHSfAeAB5eo4TL
 b0qQ==
X-Gm-Message-State: AOAM533jFKHfBAQBrcSUwLCILsX3doSifUntu/EvvoR5Z6VUc29hiDI1
 tJPyumZDVOiUxqXT5jTbJiyT1Yue/1Scyi7Dhtg=
X-Google-Smtp-Source: ABdhPJy7e3ShJe1psUPgfqroYf3AcyYnU6+3rIy2k8sf8mvT0i3FXaxUoq6B57af8aRZ8skLOPmYTYmbLxNYCbQG2+s=
X-Received: by 2002:a2e:a606:: with SMTP id v6mr9777037ljp.366.1628348899813; 
 Sat, 07 Aug 2021 08:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
 <20210807085303.GU27036@scaer>
In-Reply-To: <20210807085303.GU27036@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 7 Aug 2021 17:08:08 +0200
Message-ID: <CAPi7W81cMuZYxxLKYW22N6-htbfCaXYkHoJCmnV-izpjCvSMew@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWFubiwKCkxlIHNhbS4gNyBhb8O7dCAyMDIxIMOgIDEwOjUzLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMS0wOC0wNiAyMDo0NCArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIHJpc2N2MzI6Cj4gPgo+ID4gc3lz
dGVtL2Jhc2UvdGFyZ2V0LnNjbToxMzI6MTY6IEluIHByb2NlZHVyZSB0cmlwbGV0LXBvaW50ZXIt
c2l6ZToKPiA+IHVua25vd24gQ1BVIHdvcmQgc2l6ZSAicmlzY3YzMiIKPiA+Cj4gPiBGaXhlczoK
PiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzY3MDU2MzBjMTQ4
NDIzOWVjOGI3M2Q1N2ViYzJlMjU3MGZiZmM4ZjgKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIC4u
LnN0ZW0tYmFzZS10YXJnZXQuc2NtLXN1cHBvcnQtcmlzY3YzMi5wYXRjaCB8IDMzICsrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2d1aWxlLzAwMDQtbW9kdWxlLXN5c3RlbS1iYXNlLXRh
cmdldC5zY20tc3VwcG9ydC1yaXNjdjMyLnBhdGNoCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvZ3VpbGUvMDAwNC1tb2R1bGUtc3lzdGVtLWJhc2UtdGFyZ2V0LnNjbS1zdXBwb3J0LXJpc2N2
MzIucGF0Y2ggYi9wYWNrYWdlL2d1aWxlLzAwMDQtbW9kdWxlLXN5c3RlbS1iYXNlLXRhcmdldC5z
Y20tc3VwcG9ydC1yaXNjdjMyLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5k
ZXggMDAwMDAwMDAwMC4uY2FkZDA0MGYxMgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFj
a2FnZS9ndWlsZS8wMDA0LW1vZHVsZS1zeXN0ZW0tYmFzZS10YXJnZXQuc2NtLXN1cHBvcnQtcmlz
Y3YzMi5wYXRjaAo+ID4gQEAgLTAsMCArMSwzMyBAQAo+ID4gK0Zyb20gOTk1YTVlMWRhNzM1Yjc1
NzMzZjA1OTYxNWM1OTNjMzMwYjUzNGQ4MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ICtG
cm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+ICtE
YXRlOiBGcmksIDYgQXVnIDIwMjEgMTk6NDk6MzcgKzAyMDAKPiA+ICtTdWJqZWN0OiBbUEFUQ0hd
IG1vZHVsZS9zeXN0ZW0vYmFzZS90YXJnZXQuc2NtOiBzdXBwb3J0IHJpc2N2MzIKPiA+ICsKPiA+
ICtGaXggdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIHJpc2N2MzI6Cj4gPiArCj4gPiAr
c3lzdGVtL2Jhc2UvdGFyZ2V0LnNjbToxMzI6MTY6IEluIHByb2NlZHVyZSB0cmlwbGV0LXBvaW50
ZXItc2l6ZToKPiA+ICt1bmtub3duIENQVSB3b3JkIHNpemUgInJpc2N2MzIiCj4gPiArCj4gPiAr
Rml4ZXM6Cj4gPiArIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjcw
NTYzMGMxNDg0MjM5ZWM4YjczZDU3ZWJjMmUyNTcwZmJmYzhmOAo+ID4gKwo+ID4gK1NpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4g
Ky0tLQo+ID4gKyBtb2R1bGUvc3lzdGVtL2Jhc2UvdGFyZ2V0LnNjbSB8IDEgKwo+ID4gKyAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ICsKPiA+ICtkaWZmIC0tZ2l0IGEvbW9kdWxl
L3N5c3RlbS9iYXNlL3RhcmdldC5zY20gYi9tb2R1bGUvc3lzdGVtL2Jhc2UvdGFyZ2V0LnNjbQo+
ID4gK2luZGV4IDIwODhjZDg2Ni4uNTU0NGUyMzRmIDEwMDY0NAo+ID4gKy0tLSBhL21vZHVsZS9z
eXN0ZW0vYmFzZS90YXJnZXQuc2NtCj4gPiArKysrIGIvbW9kdWxlL3N5c3RlbS9iYXNlL3Rhcmdl
dC5zY20KPiA+ICtAQCAtMTIxLDYgKzEyMSw3IEBACj4gPiArICAgICAgICAgICAoKG1lbWJlciBj
cHUgJygic3BhcmMiICJwb3dlcnBjIiAibWlwcyIgIm1pcHNlbCIgIm5pb3MyIiAibTY4ayIgInNo
MyIgInNoNCIpKSA0KQo+ID4gKyAgICAgICAgICAgKChtZW1iZXIgY3B1ICcoInMzOTB4IiAiYWxw
aGEiKSkgOCkKPiA+ICsgICAgICAgICAgICgoc3RyaW5nLW1hdGNoICJeYXJtLioiIGNwdSkgNCkK
PiA+ICsrICAgICAgICAgICgoc3RyaW5nLW1hdGNoICJecmlzY3YuKiIgY3B1KSA4KQo+Cj4gQXJl
IHlvdSBzdXJlIHRoYXQgYSAzMi1iaXQgQ1BVIHdpbGwgaGF2ZSA4LWJ5dGUgd2lkZSB3b3Jkcz8g
SSB3b3VsZAo+IGhhdmUgbmF0dXJyYWxseSBleHBlY3RlZCB0aGVtIHRvIGJlIGp1c3QgNC1ieXRl
IHdpZGUuLi4KQXMgSSdtIG5vdCBhbiBleHBlcnQgaW4gcmlzY3YsIEkgc2VhcmNoZWQgb24gd2lr
aXBlZGlhIGFuZCBoZXJlIGlzIGFuCmV4dHJhY3Qgb2YgaHR0cHM6Ly9lbi53aWtpcGVkaWEub3Jn
L3dpa2kvUklTQy1WOgoiTWVtb3J5IGlzIGFkZHJlc3NlZCBhcyA4LWJpdCBieXRlcywgd2l0aCB3
b3JkcyBiZWluZyBpbiBsaXR0bGUtZW5kaWFuIG9yZGVyIgpJdCB3b3VsZCBiZSBncmVhdCBpZiBh
IHJpc2N2IGV4cGVydCBjb3VsZCBjb25maXJtIG9yIG5vdCB0aGlzIGluZm9ybWF0aW9uLgo+Cj4g
SWYgaHRpcyBpcyBpbmRlZWQgdGhlIGNhc2UsIHRoZW4gcGxlYXNlIGV4cGxhaW4gdGhhdCBpbiB0
aGUgcGF0Y2ggY29tbWl0Cj4gbG9nLi4uCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4K
PiA+ICsgICAgICAgICAgIChlbHNlIChlcnJvciAidW5rbm93biBDUFUgd29yZCBzaXplIiBjcHUp
KSkpKQo+ID4gKwo+ID4gKyAoZGVmaW5lICh0cmlwbGV0LWNwdSB0KQo+ID4gKy0tCj4gPiArMi4z
MC4yCj4gPiArCj4gPiAtLQo+ID4gMi4zMC4yCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+
IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+ID4gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4g
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBE
ZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
