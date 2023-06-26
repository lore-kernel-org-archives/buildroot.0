Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E9DEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 13:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A10D40978;
	Mon, 26 Jun 2023 13:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A10D40978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xovs5oUR440r; Mon, 26 Jun 2023 13:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A8F40918;
	Mon, 26 Jun 2023 13:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A8F40918
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14FE21BF384
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 13:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF9D341175
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 13:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF9D341175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXGOLFgqnIG3 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 13:19:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D883740BF9
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D883740BF9
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 13:19:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso1956346e87.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687785594; x=1690377594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQeq/VssAJomuXQM9kZJLpNGtaqOEIVxxyooPi1F3pk=;
 b=VhDdg+q/GX/cmjPdnl0Ga5IZXbngRZdlf1PbDN9EmV4Em2eqqG13hbt+kNRhP8Znj5
 cpRalwNLgB7q1g6zwrXHpPVj7xJIlHiKXmHvQ9/c7Vhecl1noeu2C19ZzpRDsyYlsmke
 CaJMc4o+LLeXd09eHSs87eiEY6Wx/MXXlZfrIrFllAxmoFC5VtMxu2dmmURdhZpU2FcZ
 hSyZTnzVFObnxJFXxqjcR+0OZBjCfunkyU3AOYYtvN3/grVaG7IWJpOss7hkiE/5caym
 zTD2YZk0KsCY8qGJ451HH/jJCwXL9qcsI2+UI2UJHC31Zo4F0qy34iQaJgmdk0qoKGQT
 TOeQ==
X-Gm-Message-State: AC+VfDwv4XpI2I0Ou7tjTPtxqTyx8QucnftGw9YGv29FSJkxWLlX+MHy
 RsxoOU6HbNw2zGLQTc8ONJM1z1RlvgWGtQ==
X-Google-Smtp-Source: ACHHUZ6QgC0yKbl3o+EI1kJHkVKvAvd2STgsw1bTWgk+HOCRxK+dI7egghk/UtPYjxsZGtpvkMZAzA==
X-Received: by 2002:a19:911b:0:b0:4f9:557e:35ae with SMTP id
 t27-20020a19911b000000b004f9557e35aemr10209281lfd.19.1687785593937; 
 Mon, 26 Jun 2023 06:19:53 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 d27-20020ac244db000000b004f27471e0aesm1111298lfm.79.2023.06.26.06.19.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 06:19:53 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso1956289e87.3
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:19:53 -0700 (PDT)
X-Received: by 2002:a05:6512:3f1e:b0:4f9:5ac3:4133 with SMTP id
 y30-20020a0565123f1e00b004f95ac34133mr10828209lfa.25.1687785593134; Mon, 26
 Jun 2023 06:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADXxVSKVs-LQ7we1DPQ3oN46ONQ-d56Cza8zRZ=2HyTGZ-bTow@mail.gmail.com>
 <20230624152713.GY24952@scaer>
In-Reply-To: <20230624152713.GY24952@scaer>
From: Bryce Johnson <bryce@redpinelabs.com>
Date: Mon, 26 Jun 2023 07:19:41 -0600
X-Gmail-Original-Message-ID: <CADXxVSLuRouX2pjJkOzZ9s7UGvmvyUnPMM9gJAFm8EHiNnoYxw@mail.gmail.com>
Message-ID: <CADXxVSLuRouX2pjJkOzZ9s7UGvmvyUnPMM9gJAFm8EHiNnoYxw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] Using a go.mod in a subdirectory
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIGZvciB0aGUgaW5mbyBZYW5uLiAgSSdtIG5ldyB0byB1c2luZyBnbywgc28gSSdtIG5v
dCBzdXJlIEknbQp0aGUgYmVzdCBwZXJzb24gdG8gYmUgbWFraW5nIHRoZSBtb2RzLCBidXQgSSds
bCB0YWtlIGEgbG9vay4gIEluIHRoZQpzaG9ydCB0ZXJtIEkgbWlnaHQgdHJ5IGFuZCBnZXQgaXQg
YnVpbGRpbmcgbG9jYWxseSBieSBtYWtpbmcgYSByZXBvCndpdGggb25seSB0aGUgYWdlbnQgKHRo
ZSBzdWJkaXIgcGFja2FnZSkgYW5kIHNlZSBpZiBJIGNhbiBnZXQgdGhhdApidWlsZGluZy4KCkJy
eWNlCgpPbiBTYXQsIEp1biAyNCwgMjAyMyBhdCA5OjI34oCvQU0gWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gQnJ5Y2UsIEFsbCwKPgo+IE9uIDIwMjMt
MDYtMjMgMTA6NTkgLTA2MDAsIEJyeWNlIEpvaG5zb24gc3Bha2UgdGh1c2x5Ogo+ID4gSGkgQWxs
LAo+ID4gSSB3YXMgbG9va2luZyBhdCBhZGRpbmcgYSBwYWNrYWdlIGZvciBzaGVsbGh1YiBpbiBi
dWlsZHJvb3QuICBUd28KPiA+IGlzc3VlcywgZmlyc3Qgb25lIGlzIHRoYXQgdGhlIGxhdGVzdCBu
ZWVkcyBnbyAxLjIwLiAgSSBhcHBsaWVkIHRoaXMKPiA+IHBhdGNoIChodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zNTg0NTEpCj4gPiB0
byBnZXQgYXJvdW5kIHRoYXQgd2hpY2ggc2VlbXMgdG8gd29yayBzbyBmYXIuICAgQ0M6IENocmlz
dGlhbiBzaW5jZQo+ID4gSSdtIHRlc3Rpbmcgd2l0aCBoaXMgcGF0Y2ggc2V0Lgo+ID4KPiA+IFRo
ZSAybmQgaXNzdWUgaXMgdGhlIGFnZW50IGlzIGluIGEgc3ViZGlyZWN0b3J5IHdpdGggaXRzIG93
biBnby5tb2QKPiA+IHRoYXQgaXMgZGlmZmVyZW50IGZyb20gb25lIHRoZSBvbiB0aGUgcm9vdCBk
aXJlY3RvcnkuCj4gPgo+ID4gSXMgdGhlcmUgYSB3YXkgdG8gZG8gdGhpcyBiZXR0ZXI/ICBPciBp
cyB0aGUgZ28ubW9kIHJlcXVpcmVkIHRvIGJlIGluCj4gPiB0aGUgcm9vdCBvZiB0aGUgcmVwbz8K
Pgo+IFdoZW4gd2UgaW50cm9kdWNlZCB0aGUgZ28tcGFja2FnZSBpbmZyYSwgd2UgbWFkZSB0aGUg
YXNzdW1wdGlvbiB0aGF0IGdvCj4gd291bGQgYmUgZmluZWx5LWdyYWluZWQgcGFja2FnZWQsIHdp
dGggb25lIHNpbmdsZSAiZ28gcGFja2FnZSIgcGVyCj4gc291cmNlIHRyZWUsIGFuZCB0aGF0IGl0
IHdvdWxkIGJlIGF0IHRoZSByb290IG9mIHRoZSBzb3VyY2UgdHJlZS4KPgo+IFRoZSByZXN1bHQg
b2YgdGhlc2UgYXNzdW1wdGlvbnMgYXJlIGNsZWFybHkgdmlzaWJsZSBpbiB0d28gbG9jYXRpb246
Cj4KPiAgIC0gc3VwcG9ydC9kb3dubG9hZC9nby1wb3N0LXByb2Nlc3MgZXhwZWN0cyB0aGF0IHRo
ZSB2ZW5kb3JpbmcgYW5kIHRoZQo+ICAgICBnby5tb2QgYXJlIGJvdGggYXQgdGhlIHJvb3Qgb2Yg
dGhlIHNvdXJjZSB0cmVlOyBzZWUgbGluZXMgMTggYW5kIDI3Owo+Cj4gICAtIHBhY2thZ2UvcGtn
LWdvbGFuZy5tayBhbHNvIGV4cGVjdHMgdGhhdCB0aGUgZ28gcGFja2FnZSBsaWVzIGF0IHRoZQo+
ICAgICByb290OyBzZWUgbGluZXMgMTExLCAxMjMsIDEzOSwgYW5kIDE0OC4KPgo+IFRoaXMgcmVz
dHJpY3Rpb24gY291bGQgY2VydGFpbmx5IGJlIGxpZnRlZCBpZiBzdXBwb3J0IGZvciBGT09fU1VC
X0RJUgo+IHdhcyB0byBiZSBhZGRlZCB0byB0aGUgZ28tcGFja2FnZSBpbmZyYSwgYnV0IGl0IGlz
IG5vdCBzdHJhaWdodGZvcndhcmQuCj4KPiBXaGVuIHRoYXQgaXMgZG9uZSwgeW91J2QgbmVlZCBh
IGJ1aWxkcm9vdCBwYWNrYWdlIGZvciBlYWNoIHN1Yi1wYXJ0IG9mCj4gc2hlbGxodWIgeW91IG5l
ZWQuIE9mIGNvdXJzZSwgaW4gc3VjaCBhIGNhc2UsIGV2ZW4gdGhvdWdoIHRoZSBkaWZmZXJlbnQK
PiBwYXJ0cyB3b3VsZCBjb21lIGZyb20gdGhlIHNhbWUgc291cmNlIHRyZWUsIHdlIGNvdWxkIG5v
dCBzaGFyZSB0aGUKPiBnZW5lcmF0ZWQgc291cmNlIGFyY2hpdmUgd2l0aCBfRExfU1VCRElSLCBi
ZWNhc3VlIHRoZSBkaWZmZXJlbnQgcGFydHMKPiB3b3VsZCBub3QgYmUgdmVuZG9yZWQgc2ltaWxh
cmx5KS4KPgo+ID4gU0hFTExIVUJfVkVSU0lPTiA9IHYwLjEyLjMKPiA+IFNIRUxMSFVCX1NJVEUg
PSAkKGNhbGwgZ2l0aHViLHNoZWxsaHViLWlvLHNoZWxsaHViLCQoU0hFTExIVUJfVkVSU0lPTikp
Cj4KPiBXZSB0cnkgdG8ga2VlcCBhICJjbGVhbiIgdmVyc2lvbiBzdHJpbmcgd2l0aG91dCB0aGUg
ZGVjb3J1bSB1c2VkIHRvIG1ha2UKPiBpdCBhIGdpdCB0YWcsIGFuZCBtYWtlIHRoYXQgcGFydCBv
ZiB0aGUgc2l0ZSBVUkwsIGUuZy46Cj4KPiAgICAgU0hFTExIVUJfVkVSU0lPTiA9IDAuMTIuMwo+
ICAgICBTSEVMTEhVQl9TSVRFID0gJChjYWxsIGdpdGh1YixzaGVsbGh1Yi1pbyxzaGVsbGh1Yix2
JChTSEVMTEhVQl9WRVJTSU9OKSkKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4g
U0hFTExIVUJfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiA+IFNIRUxMSFVCX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFLm1kCj4gPiBTSEVMTEhVQl9ERVBFTkRFTkNJRVMgPSBsaWJ4Y3J5cHQKPiA+Cj4g
PiBTSEVMTEhVQl9HT01PRCA9IGdpdGh1Yi5jb20vc2hlbGxodWItaW8vc2hlbGxodWIvYWdlbnQK
PiA+IFNIRUxMSFVCX0xERkxBR1MgPSAgLVggbWFpbi5BZ2VudFZlcnNpb249JHtTSEVMTEhVQl9W
RVJTSU9OfQo+ID4KPiA+ICMgU0hFTExIVUJfQlVJTERfVEFSR0VUUyA9IGFnZW50Cj4gPiAjIFNI
RUxMSFVCX0lOU1RBTExfQklOUyA9ICQobm90ZGlyICQoU0hFTExIVUJfQlVJTERfVEFSR0VUUykp
Cj4gPgo+ID4gICQoZXZhbCAkKGdvbGFuZy1wYWNrYWdlKSkKPiA+Cj4gPgo+ID4gSSBjYW4gZXhw
b3J0IG15IG91dHB1dC9ob3N0L3Vzci9iaW4gYW5kIGRvIGdvIGJ1aWxkIC1sZGZsYWdzICItWAo+
ID4gbWFpbi5BZ2VudFZlcnNpb249djAuMTIuMyIgYW5kIGl0IGlzIGFibGUgdG8gYnVpbGQgaW4g
dGhhdCB3YXksIHNvIGl0Cj4gPiBzZWVtcyB0aGUgaG9zdC1nbyAxLjIwIHBhdGNoIGlzIHdvcmtp
bmcuCj4gPgo+ID4gQnJ5Y2UKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8
IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
