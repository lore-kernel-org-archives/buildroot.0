Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01E0C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 14:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE6FC60EBD
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 14:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE6FC60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C2F860724;
	Sat,  6 Nov 2021 14:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id raXNBHgPTlph; Sat,  6 Nov 2021 14:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0FC060712;
	Sat,  6 Nov 2021 14:11:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 469051BF82F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 14:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 414644018E
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 14:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9scCuGpvl0C7 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 14:11:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C41A440172
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 14:11:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z19so1891682lfd.8
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pk2y7sonmFxKNv6FPzIlaQzSb++uHAeMFV6fs0ULPFA=;
 b=Yv71/EwLAMkzDbY72FVsIQYXPv4+g8PdQsVFS8Ysr2uDj+chd4OGhlsCzq2wQNe1Op
 1WDLcQ5ZE3be519RAlBQMjbD8GgizmEmQpCuCzO+mxrUmvW1cE6tn3mIPapDWWyZkRWM
 wZKeNELcVwDGEoD9pb3Z0+eioYvruG+C24D0cs75FRzBNg9RUycCn20EgMmEMl5mE5PH
 a4c0SJKEjIkXwDsAZnAGAsFTiLYRxIjRMxOE03Ziay2UieyzrUaACqXUGbpITmsng1+x
 eg3n9oypSU/lU+pP3vEV9G5ygl5FbkT4OPEZnhLAPC3TTynoaEiNrjZ0G6zfJpsofiAE
 CjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pk2y7sonmFxKNv6FPzIlaQzSb++uHAeMFV6fs0ULPFA=;
 b=y9ZhojRo2iQ4BkaDJhzaSk+R0+UmukZ6fHAqH8WYLaAwrtHTS/ttxo+/ofhBK8TfGJ
 JJ1DnBBmUywCT8DTemhfZ9+wK0zRvqVxGJq2QIPySS7IGm1FeMXCsEnHzEidJCOPB+vK
 rP/NhPpIBX2g9fWw4GnT8BffnHyskEsS+l9VxAOb59uMTrgdFoYQIm0jymB4W3sG+Pkb
 4v/0SzarpaLLz4Lky9Uv7UeQxlYdp7+eBukxCSSJaxlM3Qs7HrvdZs6eWreBmqDQk9Z+
 m5VJQtx3+stDQY3u8cdu3sZWyqNX8bKF92+SJ/QqMIOhwZrGMTp2EsZ7bU0B36pyb0Od
 8reQ==
X-Gm-Message-State: AOAM530jR8jAOtqNcphXFC2uqQaa1NyMaPhwH1Wxs0W17sv8bNo9tJh+
 5x7MgcZrodo1G5i7G53s6acvjyjfOHaw0R0Ikpw=
X-Google-Smtp-Source: ABdhPJwFsAykrTT5AVDDODNmH7iqw6Oaj8TWwJxjsifRjOD7W9mbpMAqBBiyjqn85YaZBoS6UcGQTxxhMKUfzzqqNz0=
X-Received: by 2002:ac2:41c6:: with SMTP id d6mr59461395lfi.400.1636207888614; 
 Sat, 06 Nov 2021 07:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211106112805.7076-1-ps.report@gmx.net>
In-Reply-To: <20211106112805.7076-1-ps.report@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 6 Nov 2021 15:09:32 +0100
Message-ID: <CAPi7W83i0YREgz0aSHmnZhtuWBJKBAoGKZR3ebKWhrV1rP51HA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/olsr: add upstream patch to fix
 compile with gpsd-3.23.1
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBzYW0uIDYgbm92LiAyMDIxIMOgIDEyOjI4LCBQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IGEgw6ljcml0IDoKPgo+IC0gYWRkIHVwc3RyZWFtIHBhdGNoIChbMV0pIHRv
IGZpeCBjb21waWxlIHdpdGggZ3BzZC0zLjIzLjEKPgo+IEZpeGVzOgo+Cj4gICAtIGh0dHA6Ly9h
dXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzUzYjA2ZTcyZmIyZDhiNGM4YjZiYTQxYmFm
Nzc1ZmYzMzY1NGNkMTgKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3Vs
dHMvNTRjYWU5MjQ3MTFlMjZmMDQwNDVmODIwOGRiMGQ3NzIyOTJhMzkzMwo+Cj4gICBzcmMvZ3Bz
ZGNsaWVudC5jOiBJbiBmdW5jdGlvbiAnbm1lYUluZm9Gcm9tR3BzZCc6Cj4gICBzcmMvZ3BzZGNs
aWVudC5jOjM3NDozMDogZXJyb3I6ICdTVEFUVVNfTk9fRklYJyB1bmRlY2xhcmVkIChmaXJzdCB1
c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnU1RBVFVTX1BQU19GSVgnPwo+ICAg
ICAzNzQgfCAgIGlmIChncHNkYXRhLT5maXguc3RhdHVzID09IFNUQVRVU19OT19GSVgpIHsKPiAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gICAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RBVFVTX1BQU19GSVgKPgo+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20vT0xTUi9vbHNyZC9jb21taXQvNjlhZTIzYmU5Zjk2YjllN2Rk
NjhhMDI1MmYzYWQwNTk4NmJiMjIyZAo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVyZXIg
PHBzLnJlcG9ydEBnbXgubmV0Pgo+IC0tLQo+IE5vdGVzOgo+Cj4gICAtIEBGYWJyaWNlOiBkaWQg
bm90IGZpbmQgYSBjb3JyZXNwb25kaW5nIGJ1aWxkcm9vdCBwYXRjaCBmcm9tIHlvdSwKPiAgICAg
IGRpZCB5b3Ugc2VudCBvbmUgYW5kIEkgbWlzc2VkIGl0PwpOb3BlLCBJIGRpZG4ndCBzZW5kIGEg
cGF0Y2ggYXMgSSB3YXNuJ3Qgc3VyZSB0aGF0IHRoaXMgY29tbWl0IHdhcwpjb3JyZWN0IGFmdGVy
IGFsbDogaHR0cHM6Ly9naXRodWIuY29tL09MU1Ivb2xzcmQvcHVsbC8xMDcKSW5kZWVkLCBmcm9t
IG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIGdwc2QgbWFpbnRhaW5lciwgdGhpcyBjb21taXQgd2ls
bApmaXggdGhlIGJ1aWxkIGZhaWx1cmUgYnV0IHRoZSBjb2RlIGJlZm9yZSBhbmQgYWZ0ZXIgdGhp
cyBwYXRjaCBpcwpicm9rZW4uCkEgYmV0dGVyIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHVzZSBncHNk
YXRhLT5maXgubW9kZSBpbnN0ZWFkIG9mCmdwc2RhdGEtPmZpeC5zdGF0dXM6Cmh0dHBzOi8vZ2l0
aHViLmNvbS9zd3JpLXJvYm90aWNzL2dwc191bWQvaXNzdWVzLzUwLgpJJ2xsIHNlbmQgYSBQUiB0
byBnZXQgZmVlZGJhY2sgZnJvbSB1cHN0cmVhbS4KPiAtLS0KPiAgLi4uLzAwMDUtcHVkLWZpeC1i
dWlsZC13aXRoLWdwc2QtMy4yMy4xLnBhdGNoIHwgNDQgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9vbHNyLzAwMDUtcHVkLWZpeC1idWlsZC13aXRoLWdwc2QtMy4yMy4xLnBhdGNoCj4KPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9vbHNyLzAwMDUtcHVkLWZpeC1idWlsZC13aXRoLWdwc2QtMy4y
My4xLnBhdGNoIGIvcGFja2FnZS9vbHNyLzAwMDUtcHVkLWZpeC1idWlsZC13aXRoLWdwc2QtMy4y
My4xLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hOGQ1
MzQ4MmI5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvb2xzci8wMDA1LXB1ZC1maXgt
YnVpbGQtd2l0aC1ncHNkLTMuMjMuMS5wYXRjaAo+IEBAIC0wLDAgKzEsNDQgQEAKPiArRnJvbSA2
OWFlMjNiZTlmOTZiOWU3ZGQ2OGEwMjUyZjNhZDA1OTg2YmIyMjJkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICtGcm9tOiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KPiArRGF0ZTogU3VuLCAyNCBPY3QgMjAyMSAyMzoyMjoxMSArMDIwMAo+ICtTdWJqZWN0
OiBbUEFUQ0hdIHB1ZDogZml4IGJ1aWxkIHdpdGggZ3BzZCA+PSAzLjIzLjEKPiArCj4gK0ZpeCB0
aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgcmFpc2VkIHdpdGggZ3BzZCA+PSAzLjIzLjEgYW5k
Cj4gK2h0dHBzOi8vZ2l0bGFiLmNvbS9ncHNkL2dwc2QvLS9jb21taXQvZDRhNGQ4ZDM2MDZmZDUw
ZjEwYmNkMjAwOTZhOGEwY2RiOGIyZDQyNzoKPiArCj4gK3NyYy9ncHNkY2xpZW50LmM6IEluIGZ1
bmN0aW9uICdubWVhSW5mb0Zyb21HcHNkJzoKPiArc3JjL2dwc2RjbGllbnQuYzozNzQ6MzA6IGVy
cm9yOiAnU1RBVFVTX05PX0ZJWCcgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4gJ1NUQVRVU19QUFNfRklYJz8KPiArICAzNzQgfCAgIGlmIChncHNk
YXRhLT5maXguc3RhdHVzID09IFNUQVRVU19OT19GSVgpIHsKPiArICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4KPiArICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNUQVRVU19QUFNfRklYCj4gKwo+ICtGaXhlczoKPiArIC0gaHR0cDov
L2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNTNiMDZlNzJmYjJkOGI0YzhiNmJhNDFi
YWY3NzVmZjMzNjU0Y2QxOAo+ICsKPiArW0ZpeGVkLUNvbW1pdC1NZXNzYWdlIGJ5OiBOaWNrIEhh
aW5rZSA8dmluY2VudEBzeXN0ZW1saS5vcmc+XQo+ICsKPiArU2lnbmVkLW9mZi1ieTogRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gK1tVcHN0cmVhbTogaHR0
cHM6Ly9naXRodWIuY29tL09MU1Ivb2xzcmQvY29tbWl0LzY5YWUyM2JlOWY5NmI5ZTdkZDY4YTAy
NTJmM2FkMDU5ODZiYjIyMmRdCj4gK1NpZ25lZC1vZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5y
ZXBvcnRAZ214Lm5ldD4KPiArLS0tCj4gKyBsaWIvcHVkL3NyYy9ncHNkY2xpZW50LmMgfCA0ICsr
Ky0KPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAr
Cj4gK2RpZmYgLS1naXQgYS9saWIvcHVkL3NyYy9ncHNkY2xpZW50LmMgYi9saWIvcHVkL3NyYy9n
cHNkY2xpZW50LmMKPiAraW5kZXggYTJhOWNlZTAuLjljOThmNGRmIDEwMDY0NAo+ICstLS0gYS9s
aWIvcHVkL3NyYy9ncHNkY2xpZW50LmMKPiArKysrIGIvbGliL3B1ZC9zcmMvZ3BzZGNsaWVudC5j
Cj4gK0BAIC0zNzAsNyArMzcwLDkgQEAgdm9pZCBubWVhSW5mb0Zyb21HcHNkKHN0cnVjdCBncHNf
ZGF0YV90ICpncHNkYXRhLCBObWVhSW5mbyAqaW5mbywgc3RydWN0IEdwc2RDb24KPiArICAgICAg
ICAgICApOwo+ICsKPiArICAgZ3BzZGF0YS0+c2V0ICY9IH5TVEFUVVNfU0VUOyAvKiBhbHdheXMg
dmFsaWQgKi8KPiArLSAgI2lmIEdQU0RfQVBJX01BSk9SX1ZFUlNJT04gPj0gMTAKPiArKyAgI2lm
IEdQU0RfQVBJX01BSk9SX1ZFUlNJT04gPj0gMTIKPiArKyAgaWYgKGdwc2RhdGEtPmZpeC5zdGF0
dXMgPT0gU1RBVFVTX1VOSykgewo+ICsrICAjZWxpZiBHUFNEX0FQSV9NQUpPUl9WRVJTSU9OID49
IDEwCj4gKyAgIGlmIChncHNkYXRhLT5maXguc3RhdHVzID09IFNUQVRVU19OT19GSVgpIHsKPiAr
ICAgI2Vsc2UKPiArICAgaWYgKGdwc2RhdGEtPnN0YXR1cyA9PSBTVEFUVVNfTk9fRklYKSB7Cj4g
Ky0tCj4gKzIuMzMuMQo+ICsKPiAtLQo+IDIuMzMuMQo+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
