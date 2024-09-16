Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF68C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 12:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19904404C8;
	Mon, 16 Sep 2024 12:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWwYUt4JqRYg; Mon, 16 Sep 2024 12:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A15C240689
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A15C240689;
	Mon, 16 Sep 2024 12:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9801BF21A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CAA5804BD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 12:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxIWRFb1U6JW for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 12:51:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E84B804AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E84B804AC
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E84B804AC
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 12:51:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-374c6af9b17so375813f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 05:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726491083; x=1727095883;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZdn0LWgH80RGLf8K7KYNvuutv3JvmtPITcHIePhmKU=;
 b=OUpJH4SfWVLNmhcJag/5RYFQsxnX4eypHmcLzAmykPv4F3izR70oG73yAV1rsD5Nlg
 y0HMPPyRo+Z5K9IhSYp6xoNysgeMHxAiu0xBO+OEC2Eo3nYdAxuJrlF/6TiQu4YF3y/Z
 Y0TBef1JATSLB053MOFja9FdGJ5ehIjHX1Bnr4NxFbPt1mU304B47MEFnrsvV/RFeC7Q
 0lnXFi4Mzql44vewE/NSETGZx2tixMwJxdmsj72O+10gwYfgxrli06pQ2DAjocNPR+AZ
 JNaukB5N1zM96bwWS+conRcaZJvdq7DZZpYgYKY9UQYwYSuH5Tm/UTf4MSJ2KAX6l4bL
 sT/w==
X-Gm-Message-State: AOJu0YyCfab6XrGOogL9ujySPeCZ+iVFB/7vLnLTzX9Ng9PmQLalqqVy
 tk5JM/3x1BrrVxXDbiGq9dKIZ6LouMtqAzghSCS+E49U1XHsLzLTnYnfw7JKFUOfVXoKBzxym8A
 2kU89qDomojI05AFrigoK8l68DCrYxubaU92XUA==
X-Google-Smtp-Source: AGHT+IFfgtBKtieGeRLkBZlX1apd/l7KuSRRyjDrZyZVY/MHWsb1NZDSq9tbbvWJ6RuwFRED7GdywQ2DhozIyVkrTWo=
X-Received: by 2002:a5d:5f90:0:b0:374:cd3e:7d86 with SMTP id
 ffacd0b85a97d-378c2cfc280mr4749084f8f.3.1726491082228; Mon, 16 Sep 2024
 05:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
 <Zuf8SEGiJzIZRcsx@landeda>
In-Reply-To: <Zuf8SEGiJzIZRcsx@landeda>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 16 Sep 2024 14:51:11 +0200
Message-ID: <CAHDQB6MGStyFBRT+-u5bhQuAZnU6dbtPfPR1METbGzfwzEWD+g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726491083; x=1727095883;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZdn0LWgH80RGLf8K7KYNvuutv3JvmtPITcHIePhmKU=;
 b=q4tiK7Lw09lpFhmb2jQlSLiakF/kyCuhzIOppyqR5C7bvhNukfoDj8emdCgHYF4Dq1
 Vcv7kY5TmeK6rFDtqyQ3Jz+1debUiFGBjfG0JdDdY3/zJ29moNt3UIVQwU5t6DxA9tA4
 rkW81BrwuE8Vixb7M/JT4V2M4lU/FDrDtCOBw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=q4tiK7Lw
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGVzdGVkLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNv
bT4KUmV2aWV3ZWQtYnk6IEFkYW0gRHVza2V0dCA8YWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgoKT24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTE6MzfigK9BTSBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4KPiBBbGwsCj4KPiBPbiAyMDI0LTA5
LTExIDIxOjA5ICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPiA+IENvbW1pdCBh
ODdhYmNmNmRhNjUgKE1ha2VmaWxlOiBydW4gUFBEIGFuZCBSUEFUSCBmaXh1cCBpbiBob3N0LWZp
YWxpemUpCj4gPiAoc2ljKSBtb3ZlZCB0aGUgZml4dXBzIHBldmlvdXNseSBkb25lIGluIHByZXBh
cmUtc2RrLCB0byBob3N0LWZpbmFsaXplLgo+ID4KPiA+IFRoaXMgZXhwb3NlZCBhIGJ1ZyBpbiBm
aXgtcnBhdGgsIHdoZW4gUlBBVEggY29udGFpbnMgbXVsdGlwbGUgZW50cmllcywKPiA+IGxpa2U6
ICAvUFBEL2hvc3QtZm9vL2hvc3QvbGliOi9QUEQvaG9zdC1mb28vaG9zdC9saWIvZm9vCj4gPgo+
ID4gSW4gdGhhdCBzaXR1YXRpb24sIHdlIHdhbnQgdG8gZ2V0IHJpZCBvZiAvUFBEL2hvc3QtZm9v
IGFuZCByZXBsYWNlIGl0Cj4gPiB3aXRoIHRoZSBmaW5hbGUgSE9TVF9ESVIsIHNvIHdlIG1hbmds
ZSB0aGUgUlBBVEggd2l0aCBhIHNlZCBleHByZXNzaW9uLgo+ID4KPiA+IEhvd2V2ZXIsIHRoYXQg
c2VkIGV4cHJlc3Npb24gb25seSBldmVyIHJlcGxhY2VzIHRoZSBmaXJzdCBtYXRjaCwgYXMgaXQK
PiA+IGlzIG1pc3NpbmcgdGhlICdnJyBvcHRpb24uIFRodXMsIHRoZSBzZWNvbmQgKGFuZCBmb2xs
b3dpbmcpIHBhcnRzIG9mCj4gPiBSUEFUSCBhcmUgc3RpbGwgcmVmZXJyaW5nIHRvIHRoZSBQUEQs
IGFuZCB0aHVzIHBhdGNoZWxmIGRvZXMgbm90IGZpbmQgaXQKPiA+IHJlbGF0aXZlIHRvIHRoZSBm
aW5hbCBIT1NUX0RJUiwgYW1kIHJvcHMgaXQuIFRoaXMgZXZlbnR1YWxseSBsZWFkIHRvIGEKPiA+
IGZpbmFsIFJQQVRIIHNldCBhcyAkT1JJR0lOLy4uL2xpYiBpbnN0ZWFkIG9mIHRoZSBleHBlY3Rl
ZAo+ID4gJE9SSUdJTi8uLi9saWI6JE9SSUdJTi8uLi9saWIvZm9vCj4gPgo+ID4gVGhpcyBpcyB0
aGUgY2FzZSBmb3IgaG9zdC1zeXN0ZW1kLCB3aGljaCBpbnN0YWxscyBzb21lIG9mIGl0cyBsaWJy
YXJpZXMKPiA+IGluICRQUkVGSVgvbGliL3N5c3RlbWQvIGFuZCBhZGRzIGFuIFJQQVRIIHNldCBh
cHByb3ByaWF0ZWx5IHRvCj4gPiAvUFBEL2hvc3Qtc3lzdGVtZC9ob3N0L2xpYjovUFBEL2hvc3Qt
c3lzdGVtZC9ob3N0L2xpYi9zeXN0ZW1kIGFuZCB0aGF0Cj4gPiBnZXRzIGluY29ycmVjdGx5IG1h
bmdsZWQuCj4gPgo+ID4gRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2lzc3Vlcy8zOQo+ID4KPiA+IEFsc28gZml4IGEgdHlwbyBpbiB0aGUgY29tbWVu
dCBqdXN0IGFib3ZlLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gQGpsc2FsdmFkb3IKPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPgo+Cj4gSm9zw6kgcHJvdmlkZWQgdGhlaXIgcmV2aWV3IG9uIHRoZSBH
aXRMYWIgaXNzdWU6Cj4gICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2lzc3Vlcy8zOSNub3RlXzIxMDA3OTUwNTEKPgo+IFRlc3RlZC1ieTogSm9zw6kgTHVp
cyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29t
Pgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gPiAtLS0KPiA+ICBzdXBwb3J0L3Nj
cmlwdHMvZml4LXJwYXRoIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRz
L2ZpeC1ycGF0aCBiL3N1cHBvcnQvc2NyaXB0cy9maXgtcnBhdGgKPiA+IGluZGV4IDFlNTg2NDZj
ZWEuLmQzNDIxNTA0YTUgMTAwNzU1Cj4gPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRo
Cj4gPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvZml4LXJwYXRoCj4gPiBAQCAtODQsOSArODQsOSBA
QCBwYXRjaF9maWxlKCkgewo+ID4gICAgICAjIHdvcmsgd2l0aCB0aGUgLS1tYWtlLXJwYXRoLXJl
bGF0aXZlICR7cm9vdGRpcn0gaW52b2NhdGlvbiBhcwo+ID4gICAgICAjIHRoZSBwZXItcGFja2Fn
ZSBob3N0IGRpcmVjdG9yeSBpcyBub3Qgd2l0aGluICR7cm9vdGRpcn0uIFNvLAo+ID4gICAgICAj
IHdlIHJld3JpdGUgYWxsIFJQQVRIcyBwb2ludGluZyB0byBwZXItcGFja2FnZSBkaXJlY3Rvcmll
cyBzbwo+ID4gLSAgICAjIHRoYXQgdGhleSBwb2ludCB0byB0aGUgZ2xvYmFsIGhvc3QgZGlyZWN0
cnkuCj4gPiArICAgICMgdGhhdCB0aGV5IHBvaW50IHRvIHRoZSBnbG9iYWwgaG9zdCBkaXJlY3Rv
cnkuCj4gPiAgICAgICMgc2hlbGxjaGVjayBkaXNhYmxlPVNDMjAwMSAjICR7dmFyLy9zZWFyY2gv
cmVwbGFjZX0gaGFyZCB3aGVuIHNlYXJjaCBvciByZXBsYWNlIGhhdmUgLyBpbiB0aGVtCj4gPiAt
ICAgIGNoYW5nZWRfcnBhdGg9IiQoZWNobyAiJHtycGF0aH0iIHwgc2VkICJzQCR7UEVSX1BBQ0tB
R0VfRElSfS9bXi9dXCsvaG9zdEAke0hPU1RfRElSfUAiKSIKPiA+ICsgICAgY2hhbmdlZF9ycGF0
aD0iJChlY2hvICIke3JwYXRofSIgfCBzZWQgInNAJHtQRVJfUEFDS0FHRV9ESVJ9L1teL11cKy9o
b3N0QCR7SE9TVF9ESVJ9QGciKSIKPiA+ICAgICAgaWYgdGVzdCAiJHtycGF0aH0iICE9ICIke2No
YW5nZWRfcnBhdGh9IiA7IHRoZW4KPiA+ICAgICAgICAgICIke1BBVENIRUxGfSIgLS1zZXQtcnBh
dGggIiR7Y2hhbmdlZF9ycGF0aH0iICIke2ZpbGV9Igo+ID4gICAgICBmaQo+ID4gLS0KPiA+IDIu
NDYuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9y
Zwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAg
fCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJh
Y3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1Q
QUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
