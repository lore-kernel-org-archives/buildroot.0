Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D0FC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 17:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A1A60805;
	Tue, 16 Jul 2024 17:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8860NPspQ2ZB; Tue, 16 Jul 2024 17:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01C2D60AA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C2D60AA6;
	Tue, 16 Jul 2024 17:55:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F04621BF307
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD2F54035C
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXnPWSWRrk31 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 17:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 85D8A40354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D8A40354
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85D8A40354
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 17:55:31 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-48fe86bfde6so14539137.2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 10:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721152530; x=1721757330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5N+WO9X7iCQqmbWXswSWfqYgcG/3RrbqWpgRzkHzrY0=;
 b=FuCqDCuHb++7GYjY0eGvpKI30a3wTWX7Vi6rMfW0DH305Cgx+B+QnB8xePLCebFD3W
 nNgQomWyfvcSoJmZDo+8dyH2Qq+hRPImyxxejsfu0yHizxy2m0HdFywQ7oZr3wqSmAlp
 GkxrFg/yUXJeDYfkGJHYY05xYwMxQcWJS7Wtp8q0qxgqQpS68OmoPgw7GSGdJ21QqTon
 y0fWU+Uls7O1nTMwQw6y+AXLuuF3oiLw+ECQcuwSOJFBs7yWPjJggfc9/fcUBhFD0T2I
 tZXGd7tHLg31Vg1mfl4wE0Zs8r0zYBBthYmzu/xSW7bqYlqG6w/8Rhv4s3et78U1CTD+
 z9Mw==
X-Gm-Message-State: AOJu0YylLQxEZxB95/t1d7Oj+baS4CQViVj4Pa383YUpl3CgzdClyIu6
 yaeGy2sR7BagnvYO5IMgbEreIRbCOoWCNmr28QfSJxg3EvWLUZnhB3JEC976uSyUu7ZsIlpd32V
 5x70jb2sUVanu3BQ/mquEHCB+ksw=
X-Google-Smtp-Source: AGHT+IH5r6txf3eIyrrgpb+Xw/uueoZcKLgz6f/XupmLyZkgoTbkc0QMZ+07nGfQpkklm8Wmh4BkbfG3VMC32jGm7+E=
X-Received: by 2002:a05:6102:4a86:b0:48f:e5a0:3728 with SMTP id
 ada2fe7eead31-4915626158cmr169611137.20.1721152530077; Tue, 16 Jul 2024
 10:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240611152202.951202-1-james.hilliard1@gmail.com>
 <20240611152202.951202-4-james.hilliard1@gmail.com>
 <20240716141755.1bf5473b@windsurf>
In-Reply-To: <20240716141755.1bf5473b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Jul 2024 11:55:18 -0600
Message-ID: <CADvTj4pA9E8H7=S5HKBHwUhgKq8c_+TcRcu1BAMSBxPNTwTX0Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721152530; x=1721757330; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5N+WO9X7iCQqmbWXswSWfqYgcG/3RrbqWpgRzkHzrY0=;
 b=feEXC840Ma3h+Q/bf39N19qKS/FWGK2Mczuvpqo/avwy/jV8MCuUw3bn3CwC6Gl6K3
 xb0iFPto6HxLCDQHMDa+2lOOVHPXgw0rI6z//T0dafkU4sGawP0wkQOQKiXgewoYIbO9
 Y4jjdPIfUtgQOFBiusYvpmlpCbq838xBNWzfQD5h15dI+CiJFm9PJx27gxzoJajWj26Y
 mA7Zu/K0TJBtt+qYVkzdjArnJLeRIl9nHb/9FYzm1yU+y8fwiSdi4ulvYzqRe1NPUICN
 pgfj3l0/gqwieAMF9xlIMPYsDf8Xrx04DGae9pjjUmArotzq1J4Nmbtjsyr9nmmHPaMh
 uQ2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=feEXC840
Subject: Re: [Buildroot] [PATCH v2 4/4] package/fwupd: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgNjoxN+KAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMSBKdW4gMjAyNCAw
OToyMjowMiAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgfCAg
IDEgKwo+ID4gIHBhY2thZ2UvZnd1cGQvQ29uZmlnLmluICB8ICAxOSArKysrCj4gPiAgcGFja2Fn
ZS9md3VwZC9md3VwZC5oYXNoIHwgICAzICsKPiA+ICBwYWNrYWdlL2Z3dXBkL2Z3dXBkLm1rICAg
fCAyMDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxl
cyBjaGFuZ2VkLCAyMzEgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2Z3dXBkL0NvbmZpZy5pbgo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Z3dXBk
L2Z3dXBkLmhhc2gKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9md3VwZC9md3VwZC5t
awo+Cj4gRW50cnkgaW4gdGhlIERFVkVMT1BFUlMgaXMgbWlzc2luZyAoSSBoYWQgYWRkZWQgaXQg
bG9jYWxseSwgYnV0Cj4gZW5jb3VudGVyZWQgb3RoZXIgaXNzdWVzKS4KPgo+IFRoZW4sIHVkZXYg
ZGVwZW5kZW5jeSBpcyBtaXNzaW5nOgo+Cj4gb3V0cHV0L2J1aWxkL2Z3dXBkLTEuOS4yMC9tZXNv
bi5idWlsZDoyNzg6MTE6IEVSUk9SOiBEZXBlbmRlbmN5ICJ1ZGV2IiBub3QgZm91bmQsIHRyaWVk
IHBrZ2NvbmZpZyBhbmQgY21ha2UKCkZpeGVkIGluIHYzIGJ5IHNldHRpbmcgLUR1ZGV2ZGlyPS91
c3IvbGliL3VkZXYgd2hpY2ggZWxpbWluYXRlcyB0aGUKdWRldiBkZXBlbmRlbmN5LgoKPgo+IHNv
IEkgYWRkZWQgaXQuIEJ1dCB0aGVuOgo+Cj4gb3V0cHV0L2J1aWxkL2Z3dXBkLTEuOS4yMC9tZXNv
bi5idWlsZDozMjc6MzI6IEVSUk9SOiBGZWF0dXJlIG9mZmxpbmUgY2Fubm90IGJlIGVuYWJsZWQ6
IC1Eb2ZmbGluZT1lbmFibGVkIHJlcXVpcmVzIHN5c3RlbWQKPgo+IHNvIEkgbW92ZWQgLURvZmZs
aW5lPWVuYWJsZWQgaW50byB0aGUgc3lzdGVtZCBjb25kaXRpb24uCgpGaXhlZCBpbiB2My4KCj4K
PiBCdXQgdGhlbjoKPgo+IG91dHB1dC9idWlsZC9md3VwZC0xLjkuMjAvbWVzb24uYnVpbGQ6NTk0
Ojk6IEVSUk9SOiBDb21tYW5kIGAvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0
L2hvc3QvYmluL3B5dGhvbjMgLWMgJ2ltcG9ydCBqaW5qYTI7IHByaW50KGppbmphMi5fX3ZlcnNp
b25fXyknYCBmYWlsZWQgd2l0aCBzdGF0dXMgMS4KPgo+IFdoaWNoIHByb2JhYmx5IHlvdSBoYWQg
bm90IHNlZW4gYmVjYXVzZSB5b3UgaGFkIGppbmphMiBpbnN0YWxsZWQgb24KPiB5b3VyIHN5c3Rl
bS4gQ291bGQgeW91IG1ha2Ugc3VyZSB0byB0ZXN0IGJ1aWxkIHBhY2thZ2VzIHdpdGgKPiAuL3V0
aWxzL2RvY2tlci1ydW4gdG8gY2F0Y2ggc3VjaCAic3B1cmlvdXMiIGhvc3QgZGVwZW5kZW5jaWVz
PwoKSXQgd2FzIG1pc3NlZCBiZWNhdXNlIEkgd2FzIHRlc3Rpbmcgd2l0aCBzeXN0ZW1kIGVuYWJs
ZWQsIHdoaWNoIGhhcyBhCnRyYW5zaXRpdmUgZGVwZW5kZW5jeSBvbiBob3N0LXB5dGhvbi1qaW5q
YTIuCgo+Cj4gSSBxdWlja2x5IGdyZXBwZWQgZm9yIGppbmphMiBpbiB0aGUgdHJlZSwgYnV0IGl0
IHdhc24ndCBpbW1lZGlhdGVseQo+IGNsZWFyIGlmIGl0IHdhcyBhYnNvbHV0ZWx5IG1hbmRhdG9y
eSwgZXhhY3RseSBmb3Igd2hhdCwgZXRjLiBIb3BlZnVsbHkKPiB5b3UnbGwgYmUgYWJsZSB0byBm
aWd1cmUgb3V0LiBJdCB3b3VsZCBiZSBuaWNlIHRvIG5vdCBtYWtlIGl0IGEKPiBtYW5kYXRvcnkg
ZGVwZW5kZW5jeSB0byBidWlsZCBmd3VwZCwgaWYgcG9zc2libGUgb2YgY291cnNlLgoKWWVhaCwg
aXQncyBtYW5kYXRvcnkgZm9yIHNvbWUgc2NyaXB0cywgZml4ZWQgaW4gdjMuCgo+Cj4gQ291bGQg
eW91IGhhdmUgYSBsb29rPwoKdjM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA3MTYxNzUwMzcuMTg0NDkyOS01LWphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20vCgo+Cj4gVGhhbmtzIGEgbG90IQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
