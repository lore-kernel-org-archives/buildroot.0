Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33647C433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 20:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A938A40106;
	Sat, 20 Nov 2021 20:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4qCf9plL8khp; Sat, 20 Nov 2021 20:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92BA3401DE;
	Sat, 20 Nov 2021 20:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7F301BF3E3
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 972276076F
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HLn1ZzTF-orE for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 20:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A72460639
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 20:18:07 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k37so60338563lfv.3
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 12:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lSjFI4KTUQTAxB9e6zgKXCY+LAqIETaGDeXiunm8rag=;
 b=GDDkCqo8eXtonPAXh9pTupkT0+j1u8d2TtPgzTCtjPzl+mKmt0u12oAkjd5Poiq4Np
 2B7xh6GLNhlKnHx2pQp9HtZtbNVzAqQFJ8THXUpfG0C2q7stKWYHyGJa8PiXsP9U8AR0
 bJJfnM5yPzsk1wW7U7x8T8oxWaoGf/FQE1UBYNZ1sWwJjBrG8IO/zIEBUOEriG7+YyIS
 u9yZ/KVR5uAsO+yV8DGXZGLUvGPH0eMUevxr8WangJSvNRZ3Wb+qClQC5z+jg2e40aRy
 SiXesD7U66/ur1h9gyTsjKcL5PifZpwjfreW2ROO8jbkbQKfmjc9FCwTyDx1vr626ZME
 xK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lSjFI4KTUQTAxB9e6zgKXCY+LAqIETaGDeXiunm8rag=;
 b=cazL/fjEVOZgIKb/s5X6fdOfMgRZO+7C6NVHD+TwXRYY480w30h02/Si5hxw+nHqzD
 PvIA/fWuDMbpArF6bavFXSZvrGgF1RMvLf2Qu38hvx5ix0QwA1ArwMzY1XA5WwEHJFHs
 XHrCTRtg5y+r0N1zvlK/yx1b1r0tky68ZeBEWpB4aBwloeXCJ0rW+Pa14OMJz0WEk/SV
 gzrfLZ0ho8NVLWIh3iQpGo8dioikLEcPL7za5u2HidHKd4G/NSeLy7sspU4AKLpiap4/
 F7/ymPQh4yZTTVuGx/ZsloAqNpY16mdLysTVcIF6oKXrHEyGplKppXQXFpsmPfuA76ZS
 xGYw==
X-Gm-Message-State: AOAM533UjfMQI+g516mol83R9S6G19kazxv+F2a8RxZI+WCA73mB2MwU
 3JfQlhXEnzIVDbv+UzAZ9EryMhIs41LvUYz9SOM=
X-Google-Smtp-Source: ABdhPJwptGO0tbZbm7SE8pobGeZv3zXTlTbyWMrDr+0HZfNXQfRhJKzenxLspAtkq2QkqemWn3+pbaVZJaZGwQz19Fw=
X-Received: by 2002:a05:6512:3404:: with SMTP id
 i4mr43613012lfr.689.1637439485058; 
 Sat, 20 Nov 2021 12:18:05 -0800 (PST)
MIME-Version: 1.0
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
 <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
 <20211120205359.0213edde@gmx.net>
In-Reply-To: <20211120205359.0213edde@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Nov 2021 21:15:40 +0100
Message-ID: <CAPi7W82DcY+8QW+c83hR=veNGqGz64geziZFymw4S7Lnz9jUog@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiAyMCBub3YuIDIwMjEgw6AgMjA6NTQsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRA
Z214Lm5ldD4gYSDDqWNyaXQgOgo+Cj4gSGVsbG8gRmFicmljZSwKPgo+IE9uIFNhdCwgMjAgTm92
IDIwMjEgMTA6MjM6MTEgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPiB3cm90ZToKPgo+ID4gSGVsbG8gUGV0ZXIsCj4gPgo+ID4gTGUgc2FtLiAyMCBu
b3YuIDIwMjEgw6AgMDA6MzMsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gYSDD
qWNyaXQgOgo+ID4gPgo+ID4gPiBIZWxsbyBGYWJyaWNlLAo+ID4gPgo+ID4gPiBPbiBUaHUsIDE4
IE5vdiAyMDIxIDIyOjA2OjIzICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJy
aWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gRm9yIGFuIHVua25vd24gcmVhc29u
LCB0aGUgYnVpbGQgZmFpbHMgc2luY2UgYnVtcCB0byB2ZXJzaW9uIDEuNC42MCBpbgo+ID4gPiA+
IGNvbW1pdCBkNjJiN2Y1NGYwMDI5MWE1MDI3NDQwOWZiNTUxMDUyN2ZkNzI1ZmZlIG9uOgo+ID4g
PiA+Cj4gPiA+ID4gYXJyYXkuYzoxNDA6MjogZXJyb3I6ICdmb3InIGxvb3AgaW5pdGlhbCBkZWNs
YXJhdGlvbnMgYXJlIG9ubHkgYWxsb3dlZCBpbiBDOTkgbW9kZQo+ID4gPiA+ICAgZm9yICh1aW50
MzJfdCBpID0gMDsgaSA8IHN6OyArK2kpIHsKPiA+ID4gPiAgIF4KPiA+ID4gPgo+ID4gPiA+IFJ1
bm5pbmcgYXV0b3JlY29uZiBmaXhlcyB0aGUgYnVpbGQuCj4gPiA+Cj4gPiA+IFRoZSBkaWZmZXJl
bmNlIGlzIGR1cmluZyB0aGUgY29uZmlndXJlIHN0ZXA6Cj4gPiA+Cj4gPiA+IC0gY2hlY2tpbmcg
Zm9yIC4uLi9ob3N0L2Jpbi9hcm0tbm9uZS1saW51eC1nbnVlYWJpLWdjYyBvcHRpb24gdG8gYWNj
ZXB0IElTTyBDODkuLi4gbm9uZSBuZWVkZWQKPiA+ID4gKyBjaGVja2luZyBmb3IgLi4uL2hvc3Qv
YmluL2FybS1ub25lLWxpbnV4LWdudWVhYmktZ2NjIG9wdGlvbiB0byBlbmFibGUgQzExIGZlYXR1
cmVzLi4uIC1zdGQ9Z251MTEKPiA+ID4KPiA+ID4gQW5kIHRoZSB1c2Ugb2YgdGhlICctc3RkPWdu
dTExJyBmbGFnIGZvciB0aGUgY29tcGlsZSBzdGVwcy4uLiwgYW55IG1vcmUKPiA+ID4gbGlnaHR3
ZWlnaHQgb3B0aW9uIHRvIGVuYWJsZSBDMTE/Cj4gPiBUaGVuLCBJIGFzc3VtZSB0aGF0IHVwc3Ry
ZWFtIGZvcmdvdCB0byByZWdlbmVyYXRlIHRoZSBjb25maWd1cmUgc2NyaXB0IGFmdGVyCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vbGlnaHR0cGQvbGlnaHR0cGQxLjQvY29tbWl0LzczODY1MDI1NzI5
ODk3ZDExNDk0ZGU1NmEyOWM3N2M0ZmM4ZTU3MDIKPiA+IEkgb3BlbmVkIGFuIGlzc3VlIGhlcmU6
IGh0dHBzOi8vcmVkbWluZS5saWdodHRwZC5uZXQvaXNzdWVzLzMxMTYKPgo+Cj4gVGhhbmtzIGZv
ciBlZmZvcnQsIGJ1dCB1cHN0cmVhbSBzZWVtcyB2ZXJ5IGNvbnZpbmNlZCBvZiBkb2luZyBub3Ro
aW5nIHdyb25nIChhbmQKPiBub3QgcmVhZHkgdG8gaW52ZXN0aWdhdGUgZnVydGhlcikuLi4uLCBk
ZXNwaXRlIHVzaW5nIGF1dG9jb25mLTIuNjkgKGZyb20gMjAxMiwKPiBzZWUgbGlnaHR0cGQtMS40
LjYxL2NvbmZpZ3VyZSkgYW5kOgo+Cj4gICAgICAgICAkIGRpZmYgLXUgbGlnaHR0cGQtMS40LjU5
L2NvbmZpZ3VyZSBsaWdodHRwZC0xLjQuNjEvY29uZmlndXJlCj4gWy4uLl0KPiBAQCAtNDQ0MCwy
OTggKzQ0NjAsNiBAQAo+ICBmaQo+Cj4KPiAtICAgY2FzZSAkYWNfY3ZfcHJvZ19jY19zdGRjIGlu
ICMoCj4gLSAgbm8pIDoKPiAtICAgIGFjX2N2X3Byb2dfY2NfYzk5PW5vOyBhY19jdl9wcm9nX2Nj
X2M4OT1ubyA7OyAjKAo+IC0gICopIDoKPiAtICAgIHsgJGFzX2VjaG8gIiRhc19tZToke2FzX2xp
bmVuby0kTElORU5PfTogY2hlY2tpbmcgZm9yICRDQyBvcHRpb24gdG8gYWNjZXB0IElTTyBDOTki
ID4mNQo+IC0kYXNfZWNob19uICJjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQgSVNP
IEM5OS4uLiAiID4mNjsgfQo+IC1pZiAke2FjX2N2X3Byb2dfY2NfYzk5Kzp9IGZhbHNlOyB0aGVu
IDoKPiAtICAkYXNfZWNob19uICIoY2FjaGVkKSAiID4mNgo+IC1lbHNlCj4gLSAgYWNfY3ZfcHJv
Z19jY19jOTk9bm8KPiAtYWNfc2F2ZV9DQz0kQ0MKPiBbLi4uXQo+Cj4KPiBUaGUgd2hvbGUgYzk5
IGNoZWNrIHZhbmlzaGVkLi4uLiwgYW5kOgo+Cj4gICAgICAgICAkIGRpZmYgLXUgbGlnaHR0cGQt
MS40LjU5L2NvbmZpZ3VyZS5hYyBsaWdodHRwZC0xLjQuNjEvY29uZmlndXJlLmFjCj4gWy4uLl0K
PiBAQCAtNjEsNyArNjEsNiBAQAo+Cj4gIGRubCBDaGVja3MgZm9yIHByb2dyYW1zLgo+ICBBQ19Q
Uk9HX0NDCj4gLUFDX1BST0dfQ0NfU1REQwo+ICBBWF9QUk9HX0NDX0ZPUl9CVUlMRAo+ICBMVF9Q
QVRIX0xECj4gIEFDX1BST0dfSU5TVEFMTAo+Cj4KPiBCdXQgdGhlcmUgaXMgYWx0aG91Z2ggc3Vw
cG9ydCBmb3IgdGhlIG1lc29uIGJ1aWxkIHN5c3RlbSBpbiB0aGUgc291cmNlcy4uLiwKPiBtYXli
ZSB0aW1lIHRvIGNoYW5nZSB0byBpdD8KSSBkb24ndCBrbm93IGlmIHRoaXMgaXMgYSBnb29kIGlk
ZWEgdG8gY2hhbmdlIGl0IGJlZm9yZSB0aGUgMjAyMS4xMQpyZWxlYXNlIGFzIG1lc29uIHdpbGwg
cHJvYmFibHkgcmFpc2UgaXRzIG93biBidWlsZCBmYWlsdXJlcy4KPgo+IFJlZ2FyZHMsCj4gUGV0
ZXIKPgo+ID4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gUGV0ZXIKPiA+ID4KPiA+ID4gPgo+
ID4gPiA+IEZpeGVzOgo+ID4gPiA+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9y
ZXN1bHRzLzAzNDlkOGZlZDM1YjA3NjY3OTZkZDliYTNiOGRlNmZmOGJkNjhmZTcKPiA+ID4gPgo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBwYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBk
Lm1rIHwgMiArKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiA+
ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tayBiL3Bh
Y2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsKPiA+ID4gPiBpbmRleCA5YzE4YTYwMzhlLi5jMzlh
NWRiMjBmIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsK
PiA+ID4gPiArKysgYi9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rCj4gPiA+ID4gQEAgLTEy
LDYgKzEyLDggQEAgTElHSFRUUERfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4gPiA+ICBMSUdI
VFRQRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gPiA+ICBMSUdIVFRQRF9DUEVfSURfVkVO
RE9SID0gbGlnaHR0cGQKPiA+ID4gPiAgTElHSFRUUERfREVQRU5ERU5DSUVTID0gaG9zdC1wa2dj
b25mCj4gPiA+ID4gKyMgSXNzdWUgaW4gY29uZmlndXJlIHNjcmlwdCBwcm92aWRlZCBpbiB0YXJi
YWxsCj4gPiA+ID4gK0xJR0hUVFBEX0FVVE9SRUNPTkYgPSBZRVMKPiA+ID4gPiAgTElHSFRUUERf
Q09ORl9PUFRTID0gXAo+ID4gPiA+ICAgICAgIC0td2l0aG91dC13b2xmc3NsIFwKPiA+ID4gPiAg
ICAgICAtLWxpYmRpcj0vdXNyL2xpYi9saWdodHRwZCBcCj4gPiA+Cj4gPiBCZXN0IFJlZ2FyZHMs
Cj4gPgo+ID4gRmFicmljZQo+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
