Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C36C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A34E60C4A
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A34E60C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D73CC4026F;
	Sun, 14 Nov 2021 14:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vkjp9iK7WipG; Sun, 14 Nov 2021 14:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 269924023B;
	Sun, 14 Nov 2021 14:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1EB1BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25D4080B05
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tYoWcj1Jzzm for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:28:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D802E80A07
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:28:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k37so36072278lfv.3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UfgDkwux5n0pfZefBkpxeA/xNAt9iL14u7HEmBia6K4=;
 b=VRaCgQFT+qFanEs9mtWCX8epfX1mAV261vSS5ng1+n3m/HHcPnmv9vJKpFnhLX7z+B
 lYouSIFVJ8kllG0V8QnuDN+q1EVUPSGtaCrCYTT/IkohyNyyfYt6SdqNPOLxVpTThE2o
 IBmW+4dexBlU0rDd0Ke7WX0+pg/7FRWVw99bWnBUc2oAc4i4IQvRdpdYhVWqvDh4jJ3F
 JMhzu2N/N7ql+z2WxFVkOUmbtKk9n6Xkf9YkrDrJ9ATfwpoa0rJNlbAcyAEKF77jeHVm
 Flv2fKDzj/FFjWHA7PYo3XDdEeQGnzocBG/t7NMzbmEc4aWrE7h7xs8kIyre3nROo1oI
 lHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UfgDkwux5n0pfZefBkpxeA/xNAt9iL14u7HEmBia6K4=;
 b=UKCXjMgR+vNfeawf630UfGCN6r9gbnUSidh5isx2v8fRaQS4+vwdKR5mBbfN1s91KC
 lZE9iyDUWacGB76/VzRggjYHMuqVMjsKfIaMOo7FQr+cEnTFoJwO/b5wEAIDuZosxDYp
 7FFeC1NqiKV4vCu5iY/ZfnNnm2hUIEg0ucYxitZFM4gxjONvjPvh/vjRLfsAGMjd9Gg9
 0BNf0PUjZ+qjfu+elVvS7OUBK+SoHAW92Ez/rTyNsQVrLDSnPMbVAqa7Qav0r2+MZXsw
 C8gVnqEWji0rph5okT2wQSaiZCB4sYnH/GCCfFhBmVrGWFFLtoD0Pwwy/EoHMw5MEiw4
 mtUA==
X-Gm-Message-State: AOAM533cwZIDrJj769J0I4RIhNm9RE7ecZ20sp7p/jT/DSwP4TJCLYYX
 zGbQqNHP5eklGoL6HjsQquWAY/e1Npy1JJvmzbn7p+vBP7w=
X-Google-Smtp-Source: ABdhPJxC2ZD5ZHDbdPjhcReN2d9vPR2d9U8+oVuLSiMINKu24zdA7AwecNgf3qViFPX9hGCcijBAc9oXotR8DDEMTWA=
X-Received: by 2002:a19:c7d2:: with SMTP id
 x201mr28211793lff.684.1636900107596; 
 Sun, 14 Nov 2021 06:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20211113105130.541926-1-fontaine.fabrice@gmail.com>
 <20211114152108.134c11d6@windsurf>
In-Reply-To: <20211114152108.134c11d6@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Nov 2021 15:26:16 +0100
Message-ID: <CAPi7W80neO+HadNt9D+EBUMcyExzY2r4PWGh3qD9PGpEEDkuzQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-mysql: don't use
 mysql_config outside static build
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgZGltLiAxNCBub3YuIDIwMjEgw6AgMTU6MjEsIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxv
IEZhYnJpY2UsCj4KPiBPbiBTYXQsIDEzIE5vdiAyMDIxIDExOjUxOjMwICswMTAwCj4gRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiB1Y2xp
YmMgKGFuZCBnbGliYykgaW5zdGFsbHMgdGhlIGZvbGxvd2luZyBsZCBzY3JpcHQgaW4KPiA+ICQo
U1RBR0lOR19ESVIpL3Vzci9saWIvbGliYy5zbyBpbiBhZGRpdGlvbiB0byB0aGUgJ3N0YW5kYXJk
JyBsaWJyYXJ5Cj4gPiBpbnN0YWxsZWQgaW4gJChTVEFHSU5HX0RJUikvbGliOgo+ID4KPiA+IC8q
IEdOVSBsZCBzY3JpcHQKPiA+ICAqIFVzZSB0aGUgc2hhcmVkIGxpYnJhcnksIGJ1dCBzb21lIGZ1
bmN0aW9ucyBhcmUgb25seSBpbgo+ID4gICogdGhlIHN0YXRpYyBsaWJyYXJ5LCBzbyB0cnkgdGhh
dCBzZWNvbmRhcmlseS4gKi8KPiA+IE9VVFBVVF9GT1JNQVQoImVsZjMyLXBvd2VycGMiLCAiZWxm
MzItcG93ZXJwYyIsCj4gPiAgICAgICAgICAgICAiZWxmMzItcG93ZXJwYyIpCj4gPiBHUk9VUCAo
IC9saWIvbGliYy5zby4xIC91c3IvbGliL3VjbGliY19ub25zaGFyZWQuYSBsaWJwdGhyZWFkX25v
bnNoYXJlZC5hIEFTX05FRURFRCAoIC9saWIvbGQtdUNsaWJjLnNvLjEgKSApCj4gPgo+ID4gRm9y
IGFuIHVua25vd24gcmVhc29uLCBpZiB0aGlzIHNjcmlwdCBpcyB1c2VkLCB0aGlzIHdpbGwgcmVz
dWx0IGluCj4gPiB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmU6Cj4gPgo+ID4gY29uZmlndXJl
OjMyODY6IC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0zL291dHB1
dC0xL3Blci1wYWNrYWdlL2xpYm9kYi1teXNxbC9ob3N0L2Jpbi9wb3dlcnBjLWJ1aWxkcm9vdC1s
aW51eC11Y2xpYmMtZ2NjIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNF
IC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIC1PcyAtZzAgIC1EX0xBUkdFRklMRV9TT1VSQ0UgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIGNvbmZ0ZXN0LmMgLXJk
eW5hbWljIC1ML2hvbWUvZ2l1bGlvYmVuZXR0aS9hdXRvYnVpbGQvcnVuL2luc3RhbmNlLTMvb3V0
cHV0LTEvcGVyLXBhY2thZ2UvbGlib2RiLW15c3FsL2hvc3QvcG93ZXJwYy1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2xpYi9teXNxbCAtbG15c3FsY2xpZW50IC1ML2hvbWUvZ2l1
bGlvYmVuZXR0aS9hdXRvYnVpbGQvcnVuL2luc3RhbmNlLTMvb3V0cHV0LTEvcGVyLXBhY2thZ2Uv
b3JhY2xlLW15c3FsL2hvc3QvcG93ZXJwYy1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3Qv
dXNyL2xpYiAtbHogLWxuc2wgLWxtID4mNQo+ID4gL2hvbWUvZ2l1bGlvYmVuZXR0aS9hdXRvYnVp
bGQvcnVuL2luc3RhbmNlLTMvb3V0cHV0LTEvcGVyLXBhY2thZ2UvbGlib2RiLW15c3FsL2hvc3Qv
YmluLy4uL2xpYi9nY2MvcG93ZXJwYy1idWlsZHJvb3QtbGludXgtdWNsaWJjLzEwLjMuMC8uLi8u
Li8uLi8uLi9wb3dlcnBjLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBjYW5ub3QgZmlu
ZCAvbGliL2xpYmMuc28uMQo+ID4gL2hvbWUvZ2l1bGlvYmVuZXR0aS9hdXRvYnVpbGQvcnVuL2lu
c3RhbmNlLTMvb3V0cHV0LTEvcGVyLXBhY2thZ2UvbGlib2RiLW15c3FsL2hvc3QvYmluLy4uL2xp
Yi9nY2MvcG93ZXJwYy1idWlsZHJvb3QtbGludXgtdWNsaWJjLzEwLjMuMC8uLi8uLi8uLi8uLi9w
b3dlcnBjLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOiBjYW5ub3QgZmluZCAvdXNyL2xp
Yi91Y2xpYmNfbm9uc2hhcmVkLmEKPiA+IC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1
bi9pbnN0YW5jZS0zL291dHB1dC0xL3Blci1wYWNrYWdlL2xpYm9kYi1teXNxbC9ob3N0L2Jpbi8u
Li9saWIvZ2NjL3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LXVjbGliYy8xMC4zLjAvLi4vLi4vLi4v
Li4vcG93ZXJwYy1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogY2Fubm90IGZpbmQgL2xp
Yi9sZC11Q2xpYmMuc28uMQo+ID4KPiA+IFRvIGZpeCB0aGlzIGJ1aWxkIGZhaWx1cmUsIGRvbid0
IHVzZSBteXNxbF9jb25maWcgb3V0c2lkZSBvZiBzdGF0aWMKPiA+IGJ1aWxkcy4KPgo+IERvIHlv
dSBoYXZlIGEgbWluaW1hbCBkZWZjb25maWcgdG8gcmVwcm9kdWNlIHRoZSBidWlsZCBmYWlsdXJl
PyBJbmRlZWQsCj4gSSByZW1lbWJlciBhbHJlYWR5IHNlZWluZyBhbmQgZml4aW5nIHNpbWlsYXIg
aXNzdWVzIGFyaXNpbmcgd2hlbgo+IEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUz15ICh3aGlj
aCBpcyBlbmFibGVkIGluIHRoZSBmYWlsaW5nCj4gY29uZmlndXJhdGlvbikuIEFuZCBmb3IgSSBy
ZW1lbWJlciwgdGhpcyB3YXMgZHVlIHRvIGluY29ycmVjdCAtTCBmbGFncy4KPiBJbiB0aGUgZXhh
bXBsZSBoZXJlLCB5b3UgaGF2ZSB0d28gLUw6Cj4KPiAtTC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0
b2J1aWxkL3J1bi9pbnN0YW5jZS0zL291dHB1dC0xL3Blci1wYWNrYWdlL2xpYm9kYi1teXNxbC9o
b3N0L3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LXVjbGliYy9zeXNyb290L3Vzci9saWIvbXlzcWwK
PiAtTC9ob21lL2dpdWxpb2JlbmV0dGkvYXV0b2J1aWxkL3J1bi9pbnN0YW5jZS0zL291dHB1dC0x
L3Blci1wYWNrYWdlL29yYWNsZS1teXNxbC9ob3N0L3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LXVj
bGliYy9zeXNyb290L3Vzci9saWIKPgo+IFRoZSBmb3JtZXIgaXMgY29ycmVjdCwgdGhlIGxhdHRl
ciBpcyBub3QsIGFuZCBpdCBkb2VzIGNhdXNlIHRoaXMga2luZAo+IG9mIGxpbmtlciBpc3N1ZS4g
U28gdGhlIHJlYWwgZml4IChJIHRoaW5rISkgaXMgbm90IHVuZGVyc3RhbmQgd2h5IHdlCj4gaGF2
ZSB0aGlzIGJvZ3VzIHNlY29uZCAtTCBvcHRpb24sIGFuZCBnZXQgcmlkIG9mIGl0LgpUaGUgc2Vj
b25kIC1MIG9wdGlvbiBpcyAiaGFyZC1jb2RlZCIgaW4gbXlzcWxfY29uZmlnIHdoaWNoIGlzIGl0
c2VsZgpnZW5lcmF0ZWQgYnkgb3JhY2xlLW15c3FsLTUuMS43My9zY3JpcHRzL215c3FsX2NvbmZp
Zy5wbC5pbi4KSSdsbCBpbnZlc3RpZ2F0ZSBob3cgdG8gZml4IGl0Lgo+Cj4gWW91IGNhbiByZWFk
IHRoZSBjb21taXQgbG9nIG9mIGExOGM4MjhiZWQ5OWQ3ZTBkYjUxMjgyMjRmZmNkYTQ4OTdjZDhl
ODAKPiB3aGljaCBleHBsYWlucyB3aGF0IGlzIGdvaW5nIG9uLgo+Cj4gQmVzdCByZWdhcmRzLAo+
Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290
bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcK
PiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
