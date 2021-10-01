Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27DBC433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CE461A8B
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 11:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73CE461A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44138605F9;
	Fri,  1 Oct 2021 11:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhKwqovXdB9N; Fri,  1 Oct 2021 11:30:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842F5607E0;
	Fri,  1 Oct 2021 11:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29BEB1BF5A7
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BA540221
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 11:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3InLGFOf3Uwg for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 11:30:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B91F40218
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 11:30:43 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id z11so11099053oih.1
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nxc5HpgoGiOP7r4TFSGrIeKIjl+UqPQxJMYSJRr4Eh8=;
 b=k0iDX6wRt7Dn1ysCaYNIlgFgjtDmIm2cCiB5Huc7+Fn3OYSOXR5l5uJ5s4cpVaBMtC
 YZWu8lTwr4IUDy43zqg+Xdvs5l2E5ToNZFXeccagOnrtc5aW18w/qrZyoiAgJ9HsoNv9
 SRc+LZlValolVtFrCeykyBkKyWRwDcluRbA20nMCpHxWjiYC13CwUWMndTM3PTfYjQUx
 oiEsu1oXXesBHtcmZnK7D006D68AGo15mQxjsgUfK70i6dpVfYiruqjhkEC5QKFKjhfu
 YC0pIpg6jm/JY6DKU11gyogkvvE4YAGvgdveUOtwqc8W5IQunRh3aZEatOJAfs4qoZ4j
 ZQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nxc5HpgoGiOP7r4TFSGrIeKIjl+UqPQxJMYSJRr4Eh8=;
 b=PidLHrILuLaZQUhoyZ3CKQE4qp1RBGMtRioUC89VizmlHFE9q3c4WOR8dO1mJN0uEw
 N0gA2XgjnczT66jMPLjFRtDmYHMQLO+dSf3Gu2Z0MpjOirUuy5lyEpvy37Td3iXKcISr
 N12LU3D5VF6LXe6AXBQAtsEwxrTJJy7q2sMeX5411UcUlysyNCXNdVu0aoh0lLRmCmID
 ARuZRovXgf5BAJ4iEjyii55l3NBnWkKNcx/lufHblRIwUzjhGrB4G03JLyxu4PkO3A2g
 Pf23xa7f4XtwTbN8NHD1y4cs7/KIQbVEfYjXgFrExKRWBNaHh/uJOYiD7VeE/n8gFsVM
 R6JQ==
X-Gm-Message-State: AOAM530SSnW/RmmI4mF4qjsq/B8AiNJULmTawiL8nypowewE0BNCS31H
 SBtC6kdfK0A99hA4IlDhjGTbRhxihiNsoLmpgwQ=
X-Google-Smtp-Source: ABdhPJziQfLfLZxmr84pJN3/hnFk6VheHxqa6ms95uoVd2vpCoXBc+J/K5uvhaG22d8R4PieMkJNU9B/VbPw6O2tUW8=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr3416734oib.67.1633087842081; 
 Fri, 01 Oct 2021 04:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210924105340.3514180-1-james.hilliard1@gmail.com>
 <20211001135841.GB1082333@momiji>
In-Reply-To: <20211001135841.GB1082333@momiji>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 1 Oct 2021 05:30:31 -0600
Message-ID: <CADvTj4rM6abHVtKbn3DDTpWGeSxjxxjBRUup477soZ+wkJGcdQ@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: add option to enable
 media-stream
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBPY3QgMSwgMjAyMSBhdCA0OjU4IEFNIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFw
ZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPgo+IEhpIEphbWVzLCBhbGwsCj4KPiBPbiBGcmksIDI0
IFNlcCAyMDIxIDA0OjUzOjQwIC0wNjAwIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFA
Z21haWwuY29tPiB3cm90ZToKPiA+IFRoaXMgaGFzIGEgY29tcGlsZSB0aW1lIGRlcGVuZGVuY3kg
b24gZ3N0MS1wbHVnaW5zLWJhZCBkdWUgdG8KPiA+IHRoZSBjb2RlY3BhcnNlcnMgZGVwZW5kZW5j
eS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbiAgICB8
IDYgKysrKysrCj4gPiAgcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rIHwgNyArKysrKysr
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbiBiL3BhY2thZ2Uvd3Bld2Via2l0L0NvbmZp
Zy5pbgo+ID4gaW5kZXggMDRiMmJmM2JlYi4uZGYxYzkwMGQ5ZiAxMDA2NDQKPiA+IC0tLSBhL3Bh
Y2thZ2Uvd3Bld2Via2l0L0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS93cGV3ZWJraXQvQ29u
ZmlnLmluCj4gPiBAQCAtMTA1LDYgKzEwNSwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VC
S0lUX01VTFRJTUVESUEKPiA+ICAgICAgICAgVGhpcyBvcHRpb24gcHVsbHMgaW4gYWxsIG9mIHRo
ZSByZXF1aXJlZCBkZXBlbmRlbmNpZXMKPiA+ICAgICAgICAgdG8gZW5hYmxlIG11bHRpbWVkaWEg
KHZpZGVvL2F1ZGlvKSBzdXBwb3J0Lgo+ID4KPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfV1BFV0VC
S0lUX01FRElBX1NUUkVBTQo+ID4gKyAgICAgYm9vbCAibWVkaWEtc3RyZWFtIHN1cHBvcnQiCj4g
PiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NVUxUSU1FRElBCj4gPiAr
ICAgICBoZWxwCj4gPiArICAgICAgIFRoaXMgb3B0aW9uIGVuYWJsZXMgbWVkaWEtc3RyZWFtIHN1
cHBvcnQuCj4gPiArCj4gPiAgaWYgQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEKPiA+
Cj4gPiAgY29uZmlnIEJSMl9QQUNLQUdFX1dQRVdFQktJVF9VU0VfR1NUUkVBTUVSX0dMCj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rIGIvcGFja2FnZS93cGV3
ZWJraXQvd3Bld2Via2l0Lm1rCj4gPiBpbmRleCA1YzVlNjYyNWY4Li45YWQ1NjlhNDcyIDEwMDY0
NAo+ID4gLS0tIGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rCj4gPiArKysgYi9wYWNr
YWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiA+IEBAIC00Niw2ICs0NiwxMyBAQCBXUEVXRUJL
SVRfQ09ORl9PUFRTICs9IFwKPiA+ICAgICAgIC1ERU5BQkxFX1dFQl9BVURJTz1PRkYKPiA+ICBl
bmRpZgo+ID4KPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1dQRVdFQktJVF9NRURJQV9TVFJFQU0p
LHkpCj4gPiArV1BFV0VCS0lUX0NPTkZfT1BUUyArPSAtREVOQUJMRV9NRURJQV9TVFJFQU09T04K
PiA+ICtXUEVXRUJLSVRfREVQRU5ERU5DSUVTICs9IGdzdDEtcGx1Z2lucy1iYWQKPiA+ICtlbHNl
Cj4gPiArV1BFV0VCS0lUX0NPTkZfT1BUUyArPSAtREVOQUJMRV9NRURJQV9TVFJFQU09T0ZGCj4K
PiBUaGUgcHJvYmxlbSBJIHNlZSBoZXJlIGlzIHRoYXQgd2UgYXJlIGZvcmNpbmcgdG8gZGlzYWJs
ZSBhIGZlYXR1cmUgd2hpY2gKPiB3aWxkbHkgcG9wdWxhciB3ZWIgc2l0ZXMgKGUuZy4gWW91VHVi
ZSkgdXNlIG1vcmUgYW5kIG1vcmUgYW5kIGJlaW5nIGFibGUKPiB0byBkaXNhYmxlIGl0IGlzIGxp
a2VseSB0byBkbyBtb3JlIGhhcm0gdGhhbiBnb29kLiBTaXRlcyB3aWxsIGJyZWFrIGFuZAo+IHBl
b3BsZSB3aWxsIHdyb25nbHkgYmxhbWUgV1BFIFdlYktpdCA6LVwKCkJ1dCB0aGlzIGZlYXR1cmUg
aXMgZWZmZWN0aXZlbHkgdW5jb25kaXRpb25hbGx5IGRpc2FibGVkIHJpZ2h0IG5vdwpzaW5jZSBp
dCBjYW4gbm90IGJlCmJ1aWx0IHdpdGhvdXQgd3Bld2Via2l0IGRlcGVuZGluZyBvbiBnc3QxLXBs
dWdpbnMtYmFkIGF0IGJ1aWxkIHRpbWUsIHNvIGF0IGxlYXN0CnRoaXMgaXMgYW4gaW1wcm92ZW1l
bnQgYXMgaXQgd291bGQgbm93IGJlIHBvc3NpYmxlIHRvIGVuYWJsZSBtZWRpYQpzdHJlYW0gc3Vw
cG9ydC4KCj4KPiBUaGUgcmlnaHQgYXBwcm9hY2ggaGVyZSB3b3VsZCBiZSB0byBicmVhayB0aGUg
Y2lyY3VsYXIgZGVwZW5kZW5jeSBpcyBkb2luZwo+IHR3byBwYXNzZXMgb24gdGhlIGdzdDEtcGx1
Z2lucy1iYWQgYnVpbGQ6IG9uZSBiYXNpYyBidWlsZCB3aGljaCBoYXMgdGhlCj4gdGhpbmdzIHRo
YXQgV2ViS2l0IG5lZWRzIChpLmUuIGNvZGVjcGFyc2VycyksIHRoZW4gdXNlIHRoYXQgdG8gYnVp
bGQgV2ViS2l0LAo+IHRoZW4gcmVidWlsZCB3aXRoIGFsbCB0aGUgb3B0aW9ucyBlbmFibGVkLiBU
aGlzIHNlY29uZCBnc3QxLXBsdWdpbnMtYmFkCj4gYnVpbGQgd291bGQgYmUgdGhlIG9uZSB0byBp
bnN0YWxsIHRvIHRoZSB0YXJnZXQgaW1hZ2UuCj4KPiBVbmZvcnR1bmF0ZWx5LCBJIHRoaW5rIHRo
ZSDigJxnb29k4oCdIHNvbHV0aW9uIGl0IGlzIG5vdCB0cml2aWFsIHRvIGFjaGlldmUKPiB3aXRo
IEJ1aWxkcm9vdC4gV2hhdCBjb21lcyB0byBtaW5kIGlzIGhhdmluZyBhIG5ldyBnc3QxLXBsdWdp
bnMtYmFkLW1pbmltYWwKPiBwYWNrYWdlIHdoaWNoIGlzIHVzZWQgb25seSBhcyBhIHRocm93YXdh
eSBkZXBlbmRlbmN5IHRvIGJ1aWxkIHdwZXdlYmtpdC4KPiBJZiBzb21lYm9keSBoYXMgYSBiZXR0
ZXIgc3VnZ2VzdGlvbiwgSSB3b3VsZCBsb3ZlIHRvIGtub3cgOikKCldlbGwgYXBwYXJlbnRseSBp
ZiB0aGUgd3BlIHBsdWdpbiBpbiAgZ3N0MS1wbHVnaW5zLWJhZCBpcyBtb3ZlZCB0bwpnc3QxLXBs
dWdpbnMtZ29vZAp0aGF0IHdvdWxkIGFsc28gc29sdmUgdGhlIGlzc3VlIHNpbmNlIHdwZXdlYmtp
dCBkb2VzIG5vdCBkZXBlbmQgb24KZ3N0MS1wbHVnaW5zLWdvb2QKYXQgYnVpbGQgdGltZSwgYWx0
aG91Z2ggbm90IHN1cmUgd2hhdCdzIG5lZWRlZCB1cHN0cmVhbSB0byBkbyBzby4KCj4KPiA+ICtl
bmRpZgo+ID4gKwo+ID4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX1VTRV9HU1RSRUFN
RVJfR0wpLHkpCj4gPiAgV1BFV0VCS0lUX0NPTkZfT1BUUyArPSAtRFVTRV9HU1RSRUFNRVJfR0w9
T04KPiA+ICBlbHNlCj4gPiAtLQo+ID4gMi4yNS4xCj4gPgo+Cj4gQ2hlZXJzLAo+IOKAlEFkcmnD
oW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
