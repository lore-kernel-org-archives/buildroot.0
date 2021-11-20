Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95933C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 20:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2437160639;
	Sat, 20 Nov 2021 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fU7NKMuhwdj0; Sat, 20 Nov 2021 20:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B679A60595;
	Sat, 20 Nov 2021 20:41:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8D21BF3E3
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34DBB40445
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 20:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZJqi8zkNYWx for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 20:41:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D227840382
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 20:41:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k37so60500971lfv.3
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0f/SsdhYUEKKYEWOMbqjLTXijGaRQjYDGNu+enOfsvM=;
 b=nmCr/IdVzFsxQpPCjwWsVTQ8s+Jj5NfSNIACdB5OlGs0uW0HrzTrHSFkJTC9fKlPXz
 Q7snbl4/w3TV9TvZtcY2YwhOWkroSUNbgPaPtiSwMed46L3ZYnoc6v6Axihp1HsRMStt
 +ss98DXccGjc1LvSko2s/SHv3Kwa+a83JJ3cg+VF61E6KXFYRD5Padaus2LFaOS60evq
 wCJNYvy7FxfZooP7ZyymJpbU+5NE8W+TsQrABmWD3VC+4bVC4BzE2jEfLGmj7oybE8Qr
 +e+j6Y1OThuQsnpXiGHA8TkntRMw1qMG5efyyUBAUC1dXtpEAHhKHZtHe3pT1ALL9OHX
 CgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0f/SsdhYUEKKYEWOMbqjLTXijGaRQjYDGNu+enOfsvM=;
 b=tUWd13iLSIc01ih92Khg6HQovpRSF/nlUDNUwgi77ZXt9B7nI8vCK7I8sJs5uHwSCm
 lzWWIVrQXGgXOeK164QiyhI4RofmyMiI8Q0AqgfS8ZdKVSSu2hjCBdW9rGiMR9Ac5Ffc
 meV3NJr2C9lmpDofBDuJnVzQKe3y96tfLSvyGsSVxPZ3lPfY3zrw4hnGXLb1m7GLwXlo
 dbl8AJBbc4CYmm79Mn64eXv/we/VFvQPKci2plylgsBcVW36qJ3aen1T615v35nVchgM
 BcZhb8JW1fSbvhL1pBJ0Wy/CtH0U6yI62PfAqNwJghTvZzGArl5i2OKW+VyC9npdzziR
 h4sQ==
X-Gm-Message-State: AOAM532CPGtPsHNYYus908Jv0YRvC/ALrbQpl2j2stXFt33dH0ccAqWI
 +inJ+NLftVZ9QcpLz0WHnHx2N5YIhfhuxdPtQRc=
X-Google-Smtp-Source: ABdhPJzx0SstKck91TxLfXyhQoyhYVZGc2FupmY/n3PJlK4CWXZ7CUImaEaIpb9qv77pFe6yQKFEyEXRrQYm/8H1pvs=
X-Received: by 2002:a2e:80c3:: with SMTP id r3mr6856772ljg.8.1637440898653;
 Sat, 20 Nov 2021 12:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
 <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
 <20211120205359.0213edde@gmx.net>
 <CAPi7W82DcY+8QW+c83hR=veNGqGz64geziZFymw4S7Lnz9jUog@mail.gmail.com>
 <20211120212317.12cfaaef@gmx.net>
In-Reply-To: <20211120212317.12cfaaef@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Nov 2021 21:39:13 +0100
Message-ID: <CAPi7W83w2yHWYnNGWv6KVmcC4752vqGfN+OqO34yLd8jga+V1A@mail.gmail.com>
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

TGUgc2FtLiAyMCBub3YuIDIwMjEgw6AgMjE6MjMsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRA
Z214Lm5ldD4gYSDDqWNyaXQgOgo+Cj4gSGVsbG8gRmFyYnJpY2UsCj4KPiBPbiBTYXQsIDIwIE5v
diAyMDIxIDIxOjE1OjQwICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+IExlIHNhbS4gMjAgbm92LiAyMDIxIMOgIDIwOjU0LCBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IGEgw6ljcml0IDoKPiA+ID4KPiA+ID4g
SGVsbG8gRmFicmljZSwKPiA+ID4KPiA+ID4gT24gU2F0LCAyMCBOb3YgMjAyMSAxMDoyMzoxMSAr
MDEwMCwgRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiA+IEhlbGxvIFBldGVyLAo+ID4gPiA+Cj4gPiA+ID4gTGUgc2FtLiAyMCBu
b3YuIDIwMjEgw6AgMDA6MzMsIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gYSDD
qWNyaXQgOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhlbGxvIEZhYnJpY2UsCj4gPiA+ID4gPgo+ID4g
PiA+ID4gT24gVGh1LCAxOCBOb3YgMjAyMSAyMjowNjoyMyArMDEwMCwgRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gRm9yIGFuIHVua25vd24gcmVhc29uLCB0aGUgYnVpbGQgZmFpbHMgc2luY2UgYnVtcCB0byB2
ZXJzaW9uIDEuNC42MCBpbgo+ID4gPiA+ID4gPiBjb21taXQgZDYyYjdmNTRmMDAyOTFhNTAyNzQ0
MDlmYjU1MTA1MjdmZDcyNWZmZSBvbjoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gYXJyYXkuYzox
NDA6MjogZXJyb3I6ICdmb3InIGxvb3AgaW5pdGlhbCBkZWNsYXJhdGlvbnMgYXJlIG9ubHkgYWxs
b3dlZCBpbiBDOTkgbW9kZQo+ID4gPiA+ID4gPiAgIGZvciAodWludDMyX3QgaSA9IDA7IGkgPCBz
ejsgKytpKSB7Cj4gPiA+ID4gPiA+ICAgXgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBSdW5uaW5n
IGF1dG9yZWNvbmYgZml4ZXMgdGhlIGJ1aWxkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBkaWZm
ZXJlbmNlIGlzIGR1cmluZyB0aGUgY29uZmlndXJlIHN0ZXA6Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
LSBjaGVja2luZyBmb3IgLi4uL2hvc3QvYmluL2FybS1ub25lLWxpbnV4LWdudWVhYmktZ2NjIG9w
dGlvbiB0byBhY2NlcHQgSVNPIEM4OS4uLiBub25lIG5lZWRlZAo+ID4gPiA+ID4gKyBjaGVja2lu
ZyBmb3IgLi4uL2hvc3QvYmluL2FybS1ub25lLWxpbnV4LWdudWVhYmktZ2NjIG9wdGlvbiB0byBl
bmFibGUgQzExIGZlYXR1cmVzLi4uIC1zdGQ9Z251MTEKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBbmQg
dGhlIHVzZSBvZiB0aGUgJy1zdGQ9Z251MTEnIGZsYWcgZm9yIHRoZSBjb21waWxlIHN0ZXBzLi4u
LCBhbnkgbW9yZQo+ID4gPiA+ID4gbGlnaHR3ZWlnaHQgb3B0aW9uIHRvIGVuYWJsZSBDMTE/Cj4g
PiA+ID4gVGhlbiwgSSBhc3N1bWUgdGhhdCB1cHN0cmVhbSBmb3Jnb3QgdG8gcmVnZW5lcmF0ZSB0
aGUgY29uZmlndXJlIHNjcmlwdCBhZnRlcgo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9saWdo
dHRwZC9saWdodHRwZDEuNC9jb21taXQvNzM4NjUwMjU3Mjk4OTdkMTE0OTRkZTU2YTI5Yzc3YzRm
YzhlNTcwMgo+ID4gPiA+IEkgb3BlbmVkIGFuIGlzc3VlIGhlcmU6IGh0dHBzOi8vcmVkbWluZS5s
aWdodHRwZC5uZXQvaXNzdWVzLzMxMTYKPiA+ID4KPiA+ID4KPiA+ID4gVGhhbmtzIGZvciBlZmZv
cnQsIGJ1dCB1cHN0cmVhbSBzZWVtcyB2ZXJ5IGNvbnZpbmNlZCBvZiBkb2luZyBub3RoaW5nIHdy
b25nIChhbmQKPiA+ID4gbm90IHJlYWR5IHRvIGludmVzdGlnYXRlIGZ1cnRoZXIpLi4uLiwgZGVz
cGl0ZSB1c2luZyBhdXRvY29uZi0yLjY5IChmcm9tIDIwMTIsCj4gPiA+IHNlZSBsaWdodHRwZC0x
LjQuNjEvY29uZmlndXJlKSBhbmQ6Cj4gPiA+Cj4gPiA+ICAgICAgICAgJCBkaWZmIC11IGxpZ2h0
dHBkLTEuNC41OS9jb25maWd1cmUgbGlnaHR0cGQtMS40LjYxL2NvbmZpZ3VyZQo+ID4gPiBbLi4u
XQo+ID4gPiBAQCAtNDQ0MCwyOTggKzQ0NjAsNiBAQAo+ID4gPiAgZmkKPiA+ID4KPiA+ID4KPiA+
ID4gLSAgIGNhc2UgJGFjX2N2X3Byb2dfY2Nfc3RkYyBpbiAjKAo+ID4gPiAtICBubykgOgo+ID4g
PiAtICAgIGFjX2N2X3Byb2dfY2NfYzk5PW5vOyBhY19jdl9wcm9nX2NjX2M4OT1ubyA7OyAjKAo+
ID4gPiAtICAqKSA6Cj4gPiA+IC0gICAgeyAkYXNfZWNobyAiJGFzX21lOiR7YXNfbGluZW5vLSRM
SU5FTk99OiBjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQgSVNPIEM5OSIgPiY1Cj4g
PiA+IC0kYXNfZWNob19uICJjaGVja2luZyBmb3IgJENDIG9wdGlvbiB0byBhY2NlcHQgSVNPIEM5
OS4uLiAiID4mNjsgfQo+ID4gPiAtaWYgJHthY19jdl9wcm9nX2NjX2M5OSs6fSBmYWxzZTsgdGhl
biA6Cj4gPiA+IC0gICRhc19lY2hvX24gIihjYWNoZWQpICIgPiY2Cj4gPiA+IC1lbHNlCj4gPiA+
IC0gIGFjX2N2X3Byb2dfY2NfYzk5PW5vCj4gPiA+IC1hY19zYXZlX0NDPSRDQwo+ID4gPiBbLi4u
XQo+ID4gPgo+ID4gPgo+ID4gPiBUaGUgd2hvbGUgYzk5IGNoZWNrIHZhbmlzaGVkLi4uLiwgYW5k
Ogo+ID4gPgo+ID4gPiAgICAgICAgICQgZGlmZiAtdSBsaWdodHRwZC0xLjQuNTkvY29uZmlndXJl
LmFjIGxpZ2h0dHBkLTEuNC42MS9jb25maWd1cmUuYWMKPiA+ID4gWy4uLl0KPiA+ID4gQEAgLTYx
LDcgKzYxLDYgQEAKPiA+ID4KPiA+ID4gIGRubCBDaGVja3MgZm9yIHByb2dyYW1zLgo+ID4gPiAg
QUNfUFJPR19DQwo+ID4gPiAtQUNfUFJPR19DQ19TVERDCj4gPiA+ICBBWF9QUk9HX0NDX0ZPUl9C
VUlMRAo+ID4gPiAgTFRfUEFUSF9MRAo+ID4gPiAgQUNfUFJPR19JTlNUQUxMCj4gPiA+Cj4gPiA+
Cj4gPiA+IEJ1dCB0aGVyZSBpcyBhbHRob3VnaCBzdXBwb3J0IGZvciB0aGUgbWVzb24gYnVpbGQg
c3lzdGVtIGluIHRoZSBzb3VyY2VzLi4uLAo+ID4gPiBtYXliZSB0aW1lIHRvIGNoYW5nZSB0byBp
dD8KPiA+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGEgZ29vZCBpZGVhIHRvIGNoYW5nZSBpdCBi
ZWZvcmUgdGhlIDIwMjEuMTEKPiA+IHJlbGVhc2UgYXMgbWVzb24gd2lsbCBwcm9iYWJseSByYWlz
ZSBpdHMgb3duIGJ1aWxkIGZhaWx1cmVzLgo+Cj4gR29vZCBwb2ludCBmb3IgdGhlIGF1dG9yZWNv
bmYgc29sdXRpb24gKGFuZCBtZXNvbiBmb3IgbmV4dCA7LSkpLi4uClN1cmUsICBpZiB5b3UgYWdy
ZWUsIEknbGwgbGV0IHlvdSBoYW5kbGUgdGhlIG1lc29uIHBhcnQgOy0pCj4KPiBSZWdhcmRzLAo+
IFBldGVyCj4KPiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gUGV0ZXIKPiA+ID4KPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4gPiBQZXRlcgo+ID4gPiA+ID4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gRml4ZXM6Cj4gPiA+ID4gPiA+ICAtIGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzAzNDlkOGZlZDM1YjA3NjY3OTZkZDliYTNiOGRlNmZm
OGJkNjhmZTcKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiA+ID4gPiA+IC0tLQo+ID4g
PiA+ID4gPiAgcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tayB8IDIgKysKPiA+ID4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsgYi9wYWNrYWdlL2xpZ2h0
dHBkL2xpZ2h0dHBkLm1rCj4gPiA+ID4gPiA+IGluZGV4IDljMThhNjAzOGUuLmMzOWE1ZGIyMGYg
MTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL3BhY2thZ2UvbGlnaHR0cGQvbGlnaHR0cGQubWsKPiA+
ID4gPiA+ID4gKysrIGIvcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tawo+ID4gPiA+ID4gPiBA
QCAtMTIsNiArMTIsOCBAQCBMSUdIVFRQRF9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gPiA+ID4g
PiA+ICBMSUdIVFRQRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gPiA+ID4gPiAgTElHSFRU
UERfQ1BFX0lEX1ZFTkRPUiA9IGxpZ2h0dHBkCj4gPiA+ID4gPiA+ICBMSUdIVFRQRF9ERVBFTkRF
TkNJRVMgPSBob3N0LXBrZ2NvbmYKPiA+ID4gPiA+ID4gKyMgSXNzdWUgaW4gY29uZmlndXJlIHNj
cmlwdCBwcm92aWRlZCBpbiB0YXJiYWxsCj4gPiA+ID4gPiA+ICtMSUdIVFRQRF9BVVRPUkVDT05G
ID0gWUVTCj4gPiA+ID4gPiA+ICBMSUdIVFRQRF9DT05GX09QVFMgPSBcCj4gPiA+ID4gPiA+ICAg
ICAgIC0td2l0aG91dC13b2xmc3NsIFwKPiA+ID4gPiA+ID4gICAgICAgLS1saWJkaXI9L3Vzci9s
aWIvbGlnaHR0cGQgXAo+ID4gPiA+ID4KPiA+ID4gPiBCZXN0IFJlZ2FyZHMsCj4gPiA+ID4KPiA+
ID4gPiBGYWJyaWNlCj4gPiA+Cj4gPiBCZXN0IFJlZ2FyZHMsCj4gPgo+ID4gRmFicmljZQo+CkJl
c3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
