Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C68C001DF
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 15:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586D3703E3;
	Fri, 20 Oct 2023 15:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 586D3703E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCTWrIvyib77; Fri, 20 Oct 2023 15:07:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7004070534;
	Fri, 20 Oct 2023 15:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7004070534
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E413B1BF34D
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCCA34EC28
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCA34EC28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJQtenfKVjIX for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 15:07:27 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41FBD42139
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 15:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FBD42139
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so7703985e9.0
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 08:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697814445; x=1698419245;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VI4oeSsA/W+lbzzq3LuJyhcbTzTCOu+ODd+6Ym/MAIw=;
 b=hAhWAlLbjDmVADjpgjrDnPnRWQDchZjjDMtQ/AeJvo4HJq0WjdVeXdGbyRfPsgyl78
 YLTbVMdJeq4/yrB79EnS1Fe4uLDiGxK0HofAo55JHHStwgzDn8qzQ523cCL/Oo9lRU9a
 TuHg7+CjsPz1IerNbtWmO6ho6wet/TRhmP4Q0I4whceLzxyU00V/sVONLs6sa+LIYCDK
 EsLRQFywez95yY/gcNlWU961lTQf+ztwh6FehiwpiKTe/y3wf9aJpDlFT91k6b04PkYw
 oKFbzTMke59HswlT8HZQdOOlAXspRkZwltL6JIA5nMri2j4NUizGLUHIqMxfqkduG/oc
 F0gQ==
X-Gm-Message-State: AOJu0Yx0+o5fYvnSEzM6Rdpbw3kZYflhcxFiwatZkv5qZoTh2YYy1Se/
 hHFesyi2STA6KlTjqy3UEQxEzkS0emQ8Al6A4ff24g==
X-Google-Smtp-Source: AGHT+IGvzicRjox3grwF8diyL/lmIN1o7ApNyeLjKM0qlGrmdeRaNjKdXb6xZBrsSDrrEtAfExxljg==
X-Received: by 2002:a05:600c:1ca5:b0:401:b6f6:d8fd with SMTP id
 k37-20020a05600c1ca500b00401b6f6d8fdmr1604338wms.6.1697814445242; 
 Fri, 20 Oct 2023 08:07:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b004064ac107cfsm350752wmq.39.2023.10.20.08.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 08:07:24 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 20 Oct 2023 17:07:24 +0200
Message-Id: <CWDCZO7XJW8Y.2QBONYK1OUXJ@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Andy Yan" <andyshrk@163.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.15.2
References: <20231020120158.2684019-1-andyshrk@163.com>
 <20231020120240.2684127-1-andyshrk@163.com>
In-Reply-To: <20231020120240.2684127-1-andyshrk@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697814445; x=1698419245; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VI4oeSsA/W+lbzzq3LuJyhcbTzTCOu+ODd+6Ym/MAIw=;
 b=SdDWPXh2lAjUP4T7YCVi935pn/3Bt0I25hI38KeR8SGx/r3TOcHmX0nIxMVmcOjMeh
 EOMNvhQtOa31t7XjpsCNI3Tu7R/8MW6xqs0dhOlzvfJh8Q8QN6d5WEJ2EQyVBhzwoRsi
 +aiIT/w+nNhdxY1O69X0vxOvAQD70rMME1RPc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=SdDWPXh2
Subject: Re: [Buildroot] [PATCH v3 1/1] igt-gpu-tools: add igt-gpu-tools
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
Cc: bernd@kuhls.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW5keSwKCkkgc3RpbGwgaGF2ZSB0aHJlZSBuaXRwaWNrcyBpbiBtaW5kLCBhbmQgSSBhbSBzb3Jy
eSBpZiBJIGFtIHBpY2t5IDopCgpGaXJzdCwgSSBzdWdnZXN0IHRvIHJld29yZCB0aGUgY29tbWl0
IHRpdGxlIHRvOgoKCXBhY2thZ2UvaWd0LWdwdS10b29sczogbmV3IHBhY2thZ2UKCk9uIEZyaSBP
Y3QgMjAsIDIwMjMgYXQgMjowMiBQTSBDRVNULCBBbmR5IFlhbiB3cm90ZToKPiBGcm9tOiBHYcOr
bCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgo+Cj4gSUdUIEdQVSBUb29scyBpcyBhIGNv
bGxlY3Rpb24gb2YgdG9vbHMgZm9yIGRldmVsb3BtZW50IGFuZCB0ZXN0aW5nIG9mCj4gdGhlIERS
TSBkcml2ZXJzCj4KPiBTaWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0
b25lLmZyPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+Cj4g
WzBdaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDE4MTIwNDAyMjcwMS4yODA5NS0xLWdhZWwucG9ydGF5QGNvbGxhYm9yYS5jb20vCj4KClRoZW4s
IHlvdSBjYW4gZHJvcCB0aGF0IGxpbmsgb2ZmOyBhbmQgYXMgZmFyIEkgYW0gY29uY2VybmVkLCB5
b3UgY2FuCnRha2UgdGhlIGF1dGhvcnNoaXAgb2YgdGhlIGNvbW1pdCBhcyBsb25nIGFzIG15IFNp
Z25lZC1vZmYtYnkgcmVtYWlucyBpbgp0aGUgY29tbWl0IG1lc3NhZ2UuCgo+IC0tLQo+Cj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIGZpeCBjaGVjay1wYWNrYWdlIHdhcm5pbmdzCj4gLSByZW1vdmUgZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9PUEVOU1NMCj4gLSBzZWxlY3QgQlIyX1BBQ0tBR19MSUJHTElC
Mi9CUjJfUEFDS0FHRV9FTEZVVElMUwo+IC0gbWFrZSBCUjJfUEFDS0FHRV9MSUJVTldJTkRfQVJD
SF9TVVBQT1JUUyBvcHRpb25hbAo+IC0gdXBkYXRlIGVtYWlsIG9mIEdhw6tsIFBPUlRBWQo+Cj4g
Q2hhbmdlcyBpbiB2MjoKPiAtIGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZyb20gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgaW4gVjFbMF0KPgo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmluICAgICAgICAg
IHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvaWd0LWdwdS10b29scy9p
Z3QtZ3B1LXRvb2xzLmhhc2ggfCAgNSArKysrCj4gIHBhY2thZ2UvaWd0LWdwdS10b29scy9pZ3Qt
Z3B1LXRvb2xzLm1rICAgfCAyMiArKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDY1
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaWd0LWdwdS10b29s
cy9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaWd0LWdwdS10b29scy9p
Z3QtZ3B1LXRvb2xzLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaWd0LWdwdS10
b29scy9pZ3QtZ3B1LXRvb2xzLm1rCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4g
Yi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDgzMTM0ZmI1MmQuLjdkZWM1MzhjYjggMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBA
IC0zMTgsNiArMzE4LDcgQEAgY29tbWVudCAiR3JhcGhpYyBhcHBsaWNhdGlvbnMiCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvZ2xtYXJrMi9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvZ2xzbHNh
bmRib3gtcGxheWVyL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9nbnVwbG90L0NvbmZp
Zy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9pZ3QtZ3B1LXRvb2xzL0NvbmZpZy5pbiIKPiAgCXNv
dXJjZSAicGFja2FnZS9qaGVhZC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uva21zY3Vi
ZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGlidmEtdXRpbHMvQ29uZmlnLmluIgo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lndC1ncHUtdG9vbHMvQ29uZmlnLmluIGIvcGFja2FnZS9p
Z3QtZ3B1LXRvb2xzL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uNWI5ZmUwMzAwZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2lndC1n
cHUtdG9vbHMvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwzNyBAQAo+ICtjb25maWcgQlIyX1BBQ0tB
R0VfSUdUX0dQVV9UT09MUwo+ICsJYm9vbCAiaWd0LWdwdS10b29scyIKPiArCWRlcGVuZHMgb24g
QlIyX1VTRV9NTVUgIyBmb3JrCj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiArCWRl
cGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IQVNfVURFVgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0JVU1lCT1hfU0hPV19PVEhFUlMg
IyBwcm9jcHMtbmcKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9DQUlSTwo+ICsJc2VsZWN0IEJSMl9Q
QUNLQUdFX0NBSVJPX1BORwo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0VMRlVUSUxTCj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfS01PRAo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTQo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0xJQkdMSUIyCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCUENJQUND
RVNTCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCVU5XSU5ECj4gKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfUElYTUFOCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFJPQ1BTX05HCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfWkxJQgo+ICsJaGVscAo+ICsJICBJR1QgR1BVIFRvb2xzIGlzIGEgY29sbGVjdGlv
biBvZiB0b29scyBmb3IgZGV2ZWxvcG1lbnQgYW5kCj4gKwkgIHRlc3Rpbmcgb2YgdGhlIERSTSBk
cml2ZXJzLgo+ICsKPiArCSAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3Qt
Z3B1LXRvb2xzCj4gKwo+ICtjb21tZW50ICJpZ3QtZ3B1LXRvb2xzIG5lZWRzIHVkZXYgL2RldiBt
YW5hZ2VtZW50IGFuZCB0b29sY2hhaW4gdy8gdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5Igo+ICsJ
ZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIHByb2Nwcy1uZwo+ICsJZGVwZW5kcyBvbiAhQlIyX1BB
Q0tBR0VfSEFTX1VERVYgfHwgQlIyX1NUQVRJQ19MSUJTIHx8ICFCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTCj4gKwo+ICtpZiBCUjJfUEFDS0FHRV9JR1RfR1BVX1RPT0xTCj4gKwo+ICtjb25maWcg
QlIyX1BBQ0tBR0VfSUdUX0dQVV9UT09MU19MSUJVTldJTkQKPiArCWJvb2wgImxpYnVud2luZCIK
PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCVU5XSU5EX0FSQ0hfU1VQUE9SVFMgIyBsaWJ1
bndpbmQKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJVTldJTkQKPiArCWhlbHAKPiArCSAgVXNl
IGxpYnVud2luZAoKRmluYWxseSwgeW91IGNhbiBhbiBhbiBlbXB0eSBsaW5lIGJlZm9yZSB0aGUg
ZW5kaWYgc3RhdGVtZW50LgoKPiArZW5kaWYKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9pZ3QtZ3B1
LXRvb2xzL2lndC1ncHUtdG9vbHMuaGFzaCBiL3BhY2thZ2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1
LXRvb2xzLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjk1
Y2MzYTYzOWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2ln
dC1ncHUtdG9vbHMuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIExvY2FsbHkgY2FsY3VsYXRl
ZCBmcm9tIGRvd25sb2FkCj4gK3NoYTI1NiAgNmY4YjJiMTI3MDRjMGIzN2MyMmYzMmEzNzUxNjg4
ZTcxNDRmODUwZmFhNzE1ZTg1YjI2ZWZmZGM1MjA5Y2ZkMSAgaWd0LWdwdS10b29scy12MS4yOC50
YXIuYnoyCj4gKwo+ICsjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZToKPiArc2hhMjU2ICAxYjdlMjY2
ODU3YjA1ODA4NjYwZjQyMzY5YTRhNzk3NDU5ZDdiN2JlYzcyNDVlMzc4YWEyOGE4ZGIyZjIxM2Rh
ICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRv
b2xzLm1rIGIvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMubWsKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmRjOTFlZTUwNDMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvcGFja2FnZS9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHMubWsKPiBAQCAt
MCwwICsxLDIyIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBpZ3QtZ3B1
LXRvb2xzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0lHVF9HUFVfVE9P
TFNfVkVSU0lPTiA9IDEuMjgKPiArSUdUX0dQVV9UT09MU19TT1VSQ0UgPSBpZ3QtZ3B1LXRvb2xz
LXYkKElHVF9HUFVfVE9PTFNfVkVSU0lPTikudGFyLmJ6Mgo+ICtJR1RfR1BVX1RPT0xTX1NJVEUg
PSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLS9hcmNo
aXZlL3YkKElHVF9HUFVfVE9PTFNfVkVSU0lPTikKPiArSUdUX0dQVV9UT09MU19MSUNFTlNFID0g
TUlUCj4gK0lHVF9HUFVfVE9PTFNfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArSUdUX0dQVV9U
T09MU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArSUdUX0dQVV9UT09MU19ERVBFTkRFTkNJRVMg
PSBob3N0LXBrZ2NvbmYgY2Fpcm8ga21vZCBsaWJkcm0gbGliZ2xpYjIgbGliZ2xpYjIgbGlicGNp
YWNjZXNzIHBpeG1hbiBwcm9jcHMtbmcgemxpYiBlbGZ1dGlscwoKQW5kIG9uZSBtb3JlIHRoaW5n
LCBsaWJnbGliMiBhcHBlYXJzIHRvIGJlIGR1cGxpY2F0ZWQsIGFuZCB0aGUgbGlzdCBpcwpub3Qg
YWxwaGFiZXRpY2FsbHkgb3JkZXJlZC4KCglJR1RfR1BVX1RPT0xTX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcGtnY29uZiBjYWlybyBlbGZ1dGlscyBrbW9kIGxpYmRybSBsaWJnbGliMiBsaWJwY2lhY2Nl
c3MgcGl4bWFuIHByb2Nwcy1uZyB6bGliCgo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9JR1Rf
R1BVX1RPT0xTX0xJQlVOV0lORCkseSkKPiArSUdUX0dQVV9UT09MU19ERVBFTkRFTkNJRVMgKz0g
bGlidW53aW5kCj4gK0lHVF9HUFVfVE9PTFNfQ09ORl9PUFRTICs9IC1EbGlidW53aW5kPWVuYWJs
ZWQKPiArZWxzZQo+ICtJR1RfR1BVX1RPT0xTX0NPTkZfT1BUUyArPSAtRGxpYnVud2luZD1kaXNh
YmxlZAo+ICtlbmRpZgo+ICsKPiArJChldmFsICQobWVzb24tcGFja2FnZSkpCgpBZ2FpbiwgdGhh
bmtzIGZvciB5b3UgZWZmb3J0IHRvIG1ha2UgaXQgdXBzdHJlYW0uCgpSZWdhcmRzLApHYcOrbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
