Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1452C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53694607D0;
	Tue, 26 Jul 2022 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53694607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVE3q4Zuyn4s; Tue, 26 Jul 2022 22:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F297B607A8;
	Tue, 26 Jul 2022 22:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F297B607A8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1C01BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7885E812B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7885E812B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYNywPYJehhZ for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0A1812AE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C0A1812AE
 for <buildroot@busybox.net>; Tue, 26 Jul 2022 22:01:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id a11so9507763wmq.3
 for <buildroot@busybox.net>; Tue, 26 Jul 2022 15:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+YRbeFkDBQhqBrk8W5DLj2rDfbBM6eN3Zhz0NYfKwGU=;
 b=nQjR7ePabHBL44cpaYTAwstBcoz8PqKIDR5S2HSKjy/KZnWhEMrrzE9AJrWmBVT+EV
 nTZ+37vaXhcahJON7TiBjJ55VF9QSSUGkLMpEtf1F/YZMM6G7UUAlEgyKYwIbgcTwJ0/
 h7P4+DYd4tqL7O7qxN00+AbRy6cfSFUWLyPpEc6ExgDSE0r5m6s2zGbR1+6xTDS35Bwh
 NClYvg0z94mh5cFeh0XeenlElf/mdczOiCo2RZyPB/RAnpONQX5nILlRiNY0DKviFR0+
 ww1mWHGyoXLhkgh3VayX0KALNgWIt6dXTjMVf9Hx7hc8f+deVlDIj18JYNQiLSKCrXM+
 LnZQ==
X-Gm-Message-State: AJIora+iFc1alxNoGjRzXVW8Tra45wcuDG2CO5wq1ipAJVRFNmMelmAf
 cRN+K0APSXEqs+wKZ+M8gNDujg==
X-Google-Smtp-Source: AGRyM1uwLKM7y68D/o5gwaPGW28fJqV6fcIWyhGZOWqFUefq5CYzs3OqJv6RnZ7SAd9Bir66r7Jjiw==
X-Received: by 2002:a05:600c:a18e:b0:3a3:10ef:672a with SMTP id
 id14-20020a05600ca18e00b003a310ef672amr762676wmb.14.1658872862069; 
 Tue, 26 Jul 2022 15:01:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c4f1000b003a2e27fc275sm223612wmq.12.2022.07.26.15.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 15:01:01 -0700 (PDT)
Message-ID: <57bbeaff-9600-cc1d-5baa-4ed1919c35c5@smile.fr>
Date: Wed, 27 Jul 2022 00:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>, buildroot@busybox.net
References: <20220206101134.30291-1-guillaume.bressaix@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220206101134.30291-1-guillaume.bressaix@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=+YRbeFkDBQhqBrk8W5DLj2rDfbBM6eN3Zhz0NYfKwGU=;
 b=WldVU5J1h3TMsd63PDeBhc+IZnUdG84J/iANwrJQe1WoUslw5+ohxcLaEjue1ATmLz
 gCZv1zgBeBlmAiwiiEnCZAoF5JxKjSPZT8Dg0SCz1Wi0VDc+GgrR7vCddCo34gKsRepl
 0l3IAfli84JboBPdjJkfcgMmZOFcdPLSquUnYgBFS6/K6DUMYzBXa8MRnZDL/9mG9aC6
 Sb8VFGzrV0FzvzfTqVVin1KwWSXyQbdo+Wvoy+31A5Tvvx7wOqq7MMYZ8QN4YWdM5FfR
 OrIKa/DQdeYeh88bgKF3q93fUIvBzQUGoQsPyjmXeoNEPRgaP2TmnlhpvGjX0fIoc8h8
 YMmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=WldVU5J1
Subject: Re: [Buildroot] [PATCH] package/mbw: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR3VpbGxhdW1lLAoKTGUgMDYvMDIvMjAyMiDDoCAxMToxMSwgR3VpbGxhdW1lIFcuIEJy
ZXMgYSDDqWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgVy4gQnJlcyA8Z3VpbGxh
dW1lLmJyZXNzYWl4QGdtYWlsLmNvbT4KPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgIHwg
IDEgKwo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgfCAgMSArCj4gIHBhY2thZ2UvbWJ3L0NvbmZp
Zy5pbiB8ICA3ICsrKysrKysKPiAgcGFja2FnZS9tYncvbWJ3Lmhhc2ggIHwgIDMgKysrCj4gIHBh
Y2thZ2UvbWJ3L21idy5tayAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9t
YncvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL21idy9tYncuaGFzaAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tYncvbWJ3Lm1rCj4gCj4gZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggYTFlYzlhMDkxZS4uYWNjODdhYTAwNyAx
MDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xMTQ4LDYg
KzExNDgsNyBAQCBOOglHdWlsbGF1bWUgV2lsbGlhbSBCcnMgPGd1aWxsYXVtZS5icmVzc2FpeEBn
bWFpbC5jb20+Cj4gIEY6CXBhY2thZ2UvbGlibmlkcy8KPiAgRjoJcGFja2FnZS9saWJ4Y3J5cHQv
Cj4gIEY6CXBhY2thZ2UvbGlxdWlkLWRzcC8KPiArRjoJcGFja2FnZS9tYncvCj4gIEY6CXBhY2th
Z2UvcGl4aWV3cHMvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXB5YmluZC8KPiAgRjoJcGFja2FnZS9y
ZWF2ZXIvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KPiBpbmRleCBlNGNhMTk1YmViLi44NDQ1MTczNjMzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Q29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTE4LDYgKzExOCw3IEBA
IG1lbnUgIkRlYnVnZ2luZywgcHJvZmlsaW5nIGFuZCBiZW5jaG1hcmsiCj4gIAlzb3VyY2UgInBh
Y2thZ2UvbHR0bmctYmFiZWx0cmFjZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbHR0
bmctbW9kdWxlcy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbHR0bmctdG9vbHMvQ29u
ZmlnLmluIgo+ICsJc291cmNlICJwYWNrYWdlL21idy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvbWNlbG9nL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9tZW1zdGF0L0NvbmZp
Zy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9uZXRwZXJmL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tYncvQ29uZmlnLmluIGIvcGFja2FnZS9tYncvQ29uZmlnLmluCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43YmFmYTM1MzU5Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2UvbWJ3L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsNyBAQAo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfTUJXCgp0ZXN0LXBrZyBzZWVtcyBvazoKCiQgLi91dGlscy90ZXN0
LXBrZyAtYyBkZWZjb25maWcgIC1kIHRlc3QtcGtnIC1wIG1idyAtawogICAgICAgICAgICAgICAg
ICAgIGJvb3RsaW4tYXJtdjUtdWNsaWJjIFsxLzZdOiBPSwogICAgICAgICAgICAgICAgICAgICBi
b290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwogICAgICAgICAgICAgICAgICAgYm9vdGxpbi1h
cm12N20tdWNsaWJjIFszLzZdOiBPSwogICAgICAgICAgICAgICAgICAgICBib290bGluLXg4Ni02
NC1tdXNsIFs0LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgYnItYXJtLWZ1bGwtc3RhdGlj
IFs1LzZdOiBPSwogICAgICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlcnktYXJtIFs2LzZd
OiBPSwo2IGJ1aWxkcywgMCBza2lwcGVkLCAwIGJ1aWxkIGZhaWxlZCwgMCBsZWdhbC1pbmZvIGZh
aWxlZCwgMCBzaG93LWluZm8gZmFpbGVkCgo+ICsJYm9vbCAibWJ3Igo+ICsJaGVscAo+ICsJICBN
QlcgaXMgYSBtZW1vcnkgYmFuZHdpZHRoIGJlbmNobWFya2luZyB0b29sLgo+ICsJICBNQlcgZGV0
ZXJtaW5lcyB0aGUgImNvcHkiIG1lbW9yeSBiYW5kd2lkdGggYXZhaWxhYmxlCj4gKwkgIHRvIHVz
ZXJzcGFjZSBwcm9ncmFtcy4KCldlIG5lZWQgYW4gZW1wdHkgbGluZSBoZXJlLgoKPiArCSAgaHR0
cHM6Ly9naXRodWIuY29tL3JhYXMvbWJ3Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWJ3L21idy5o
YXNoIGIvcGFja2FnZS9tYncvbWJ3Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjk2NmIzYzlkYWUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9t
YncvbWJ3Lmhhc2gKPiBAQCAtMCwwICsxLDMgQEAKPiArIyBMb2NhbGx5IGNvbXB1dGVkCj4gK3No
YTI1NiAgOWY3MzY1Yzc1MmY0ZGZlMGQ3ZDQ2YzU5OWZmMWU0YjQxMjE3OWJlNzY0YjBkNzEyMjY5
ZDdlZTYxZTBjZjcxOCAgbWJ3LTEuNC50YXIuZ3oKPiArc2hhMjU2ICA0M2EyODVlMThhMjE1ODQ5
NGIwOTk2NDVlMWVhMzUxNDQ1MmMwODU5MjdiMzQ4NTZkMzljMWY2OTE3YzdkMDRkICBtYncuc3Bl
Ywo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21idy9tYncubWsgYi9wYWNrYWdlL21idy9tYncubWsK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmZiNTk5ZDBiZmQKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tYncvbWJ3Lm1rCj4gQEAgLTAsMCArMSwyMCBA
QAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbWJ3Cj4gKyMKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK01CV19WRVJTSU9OID0gMS40CgpBIG5ldyB2ZXJzaW9u
IDEuNSBpcyBub3cgYXZhaWxhYmxlLgoKPiArTUJXX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHJhYXMs
bWJ3LHYkKE1CV19WRVJTSU9OKSkKPiArTUJXX0xJQ0VOU0UgPSBMR1BMLTIuMQo+ICtNQldfTElD
RU5TRV9GSUxFUyA9IG1idy5zcGVjCj4gKwo+ICtkZWZpbmUgTUJXX0JVSUxEX0NNRFMKPiArCSQo
VEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1DICQoQEQpCj4gK2VuZGVmCj4gKwo+ICtk
ZWZpbmUgTUJXX0lOU1RBTExfVEFSR0VUX0NNRFMKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAk
KEBEKS9tYncgJChUQVJHRVRfRElSKS91c3Ivc2Jpbgo+ICtlbmRlZgoKVGhlIHZlcnNpb24gMS41
IHByb3ZpZGUgYSBzaW1wbGUgQ01ha2VsaXN0cy50eHQgYnV0IG1idyBpcyBpbnN0YWxsZWQgaW4K
L3Vzci9iaW4uIFdoeSBhcmUgeW91IHVzaW5nIC91c3Ivc2JpbiA/CgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
