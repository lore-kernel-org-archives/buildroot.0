Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE441C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 06:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF320612E0;
	Sat, 12 Jul 2025 06:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPzOLkW8H-gr; Sat, 12 Jul 2025 06:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7E961298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA7E961298;
	Sat, 12 Jul 2025 06:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1432D106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10BEC8217F
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QP1Rvy6sdbR for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 06:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.43;
 helo=mail-ed1-f43.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 49D7482186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D7482186
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49D7482186
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:34:52 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-611f74c1837so2162677a12.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 23:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752302090; x=1752906890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/z/WUtN+u3QRaRhKp7KcQLW8xN6E4YRXlpGwBDfRDqs=;
 b=Asw66lx9s3C8o1lDD53mJZGBgj8CT831AuJHublYZTjNFrFfATp14bcAoAJPBbqmNt
 lE8HP9oe8XWG6WZ150gI4XKdJxbOM6FbKIwUXp7+SXKZMetFYJ/+2rnCPqb7M17Yhti1
 dZnjJERH5I9sg6V7U+kjbEFgWeIfGfa8nMsmLWEf7KBHxBsAT/oSHRTyDALK9ZMWDhhp
 KfH6uBsxlilWjDstyY8IdMTxks9mWQjHJq92SOPqB8dZDG4jSwng0JZgZQGK24mHx93m
 6ZBLhiUCHqZoumllVKcpIrfB4QgGm6+Tcn1OuubgNRkOgFDL/P3Q2RvfOHQ66Lkl4idy
 b92w==
X-Gm-Message-State: AOJu0YzXVJvUC/f1nQkDagMpz5IcXtll6fIOf99oy7hSbYsgf/3peno1
 dMFx8e7pB48GpJmdPma0eM9TOjYSFfuYrkLihaDDOjEazA5kNJlC08JK
X-Gm-Gg: ASbGnctTkbHYqz1Ffol/YKS484il4T8Q4grVvdBjYjf4rDrIkMz+YZfY7rnFznxuXWP
 VG91jk0RogUHvPedzbFDC1/qvlj+f83HIlPFW/CEnC7oyRdTOGbEar9A01VmbQDd9fvuDAO0kGG
 /voS2ueRyZ1eXnm9GbmBQdgPy01yCPF2FDewpsPm726FQ0kJIrMG7dgoT6vfnYbesOtOeNtcztV
 DGn3jceccRdYSbP9+IlZ2u/CgzwxcLixnxLIj2YNfYUO4/04k1muNCGV4gigfdRJKcRf8wP2XJB
 1kMDMmfCpTY5n3cvYAryoFS25NJaKamR1wjSrJI3cSXuoCPAjLm7wO2QxGHk41i1E3KiDT0ofiG
 W/JqH6FRRlsjtOa/IV5quENk9RsEaeh2wlErPsG979L4xNyHT5sU7sA==
X-Google-Smtp-Source: AGHT+IFjksLt95VlN/x6lYIASI9i8yokP9OxKPZXrETLVYPBNLGeLkIvp8HiGXVkGQbMK+5DAgaJZA==
X-Received: by 2002:a05:6402:50ca:b0:605:2990:a9e7 with SMTP id
 4fb4d7f45d1cf-611e7c0aa8emr5826371a12.13.1752302089995; 
 Fri, 11 Jul 2025 23:34:49 -0700 (PDT)
Received: from tpx1 (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611e2d35bf8sm2206575a12.68.2025.07.11.23.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 23:34:49 -0700 (PDT)
Date: Sat, 12 Jul 2025 08:34:47 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250712083447.109f690b@tpx1>
In-Reply-To: <20250711164407.799041-4-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-4-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [RFC PATCH v2 3/7] package/kvm-unit-tests: update
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

QW0gRnJpLCAxMSBKdWwgMjAyNSAxNzo0NDowMSArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFRvIHJ1biB0aGUgdGVzdHMgd2UgbmVlZCBhIHN5
c3RlbSBRRU1VLCB0aW1lb3V0LCBnZXRjb25mIGFuZCBubWFwLW5jYXQKPiBzbyB1cGRhdGUgdGhl
IHNlbGVjdC9kZXBlbmRzIGZvciB0aGVtLiBBcyB3ZSBuZWVkIGF0IGxlYXN0IEdDQyA4IHdlCj4g
Y2FuIGRyb3AgdGhlIHNwZWNpZmljIHJlcXVpcmVtZW50IGZvciBvbGQgeDg2LTY0IHRlc3RzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4K
PiAKPiAtLS0KPiB2Mgo+ICAgLSByZW1vdmUgb2xkIGdjYyBub3RlcyBhcyB3ZSBuZWVkIGF0IGxl
YXN0IDggYW55d2F5Cj4gICAtIHNlbGVjdCBRRU1VIGFuZCBvdGhlciBydW50aW1lIGRlcHMKPiAg
IC0gbWVudGlvbiB0aGUgcnVudGltZSBkZXBzCj4gICAtIGFkZCBzdXBwb3J0IGZvciBnZXRjb25m
IGZyb20gZXh0ZXJuYWwgdG9vbGNoYWluCj4gICAtIHVwZGF0ZSBjb21tZW50IGZhbGxiYWNrCj4g
LS0tCj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIHwgMjQgKysrKysrKysrKysr
KysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
biBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gaW5kZXggODdiMDc1YzRiOS4u
Nzc1YjI1MGQ1ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gQEAgLTE0LDEyICsx
NCwxOSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+
ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4gIAlib29sICJrdm0tdW5p
dC10ZXN0cyIKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9T
VVBQT1JUUwo+IC0JIyBvbiBpMzg2IGFuZCB4ODYtNjQsIF9fYnVpbHRpbl9yZWFjaGFibGUgaXMg
dXNlZCwgc28gd2UgbmVlZAo+IC0JIyBnY2MgNC41IGF0IGxlYXN0LiBvbiBpMzg2LCB3ZSB1c2Ug
dGhlIHRhcmdldCBnY2MsIHdoaWxlIG9uCj4gLQkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2Nj
IChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMpCj4gLQlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzRfNSB8fCAhQlIyX2kzODYKPiAgCWRlcGVuZHMgb24gQlIyX0hPU1RBUkNI
ID0gIng4Nl82NCIgfHwgIUJSMl94ODZfNjQKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF84ICMgcWVtdQo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RRU1VX0FSQ0hf
U1VQUE9SVFNfVEFSR0VUCj4gKwlkZXBlbmRzIG9uIChCUjJfUEFDS0FHRV9HTElCQ19VVElMUyB8
fCBcCj4gKwkJICAgIEJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUyB8fCBcCj4gKwkJICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKSAjIHJ1bnRpbWUgZ2V0Y29uZgo+ICsJ
c2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RF
TSAjIHJ1bnRpbWUgZm9yIHFlbXUtc3lzdGVtLSRBUkNICgpBRkFJSyBrdm0tdW5pdC10ZXN0cyBj
YW4gYmUgdXNlZCB3aXRoIGt2bXRvb2wgaW5zdGVhZCBvZiBRRU1VLCB0b28gLi4uIHNvCmhhcmQt
Y29kaW5nIFFFTVUgaGlnaCBtaWdodCBub3QgYmUgdGhlIGJlc3Qgc29sdXRpb24gZm9yIHRoZSB1
c2VyPwoKIFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
