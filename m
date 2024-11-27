Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C6CD66BA3
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 01:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB8B6071A;
	Wed, 27 Nov 2024 01:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0njeoKEH0SQ; Wed, 27 Nov 2024 01:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85AC76076B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85AC76076B;
	Wed, 27 Nov 2024 01:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95F2F1DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 841FD84CDE
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4BAYti1HXhy for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 01:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 794AB84C3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794AB84C3A
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 794AB84C3A
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:01:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ffa12ad18cso72329731fa.2
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 17:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732669293; x=1733274093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+s4OyQDxB+HU5lo6AFydpxVfm9szriwc4GZ+mfRG2I=;
 b=OO2D6NwLkZBDN6dKrMVNrCdtpgUis+ym+KQuoeGrh08yo2BwEMR+2gNPYlsqjlhBpo
 zSdDmH7puwWlm0/X02wg6mKpXNNOShgMPI33VQIK7RU2ivHLjSOgCCdp3iOfHIbno3NX
 bplJhfl6rL4wfGAeT0QWMaY/eEZTlM3yuNb1iSnR6BpAWq6UN+RiRIXyyHEkkFSK5HDw
 IzaDjYsrR9uQUJ5smxzpYlTG2/kotpvIQYOxSKq0kZhuPajFwKJRIyNDrVd4X5HlIbZh
 34ixepaJVhCd7nvW6uSZ/v8D5Sod8WSMqWqxW9xtWq5r7oxlWHS88Uk0IG2KVW5tn4mL
 MAPQ==
X-Gm-Message-State: AOJu0Yz7AzzNql4Qo1Y+AFmtbrbeaLF2oCVRx/fT+Wz4KuyCXZDyGbqh
 2wpkGsZA0baVcK6zjf0nC3/h0579xzFUhyB+VemkO02vo4XbdV6b9gOrfJppkGQxC/D1JGiyvIQ
 +rRxSzbN3Tcx9kU6RtURdB6wq3/sukAZy
X-Gm-Gg: ASbGncvN2AoMdjheLBNnztFM7rJwOTB3tuv3IVKK4FMkDDPHIF7E7FX28b57JlaoR0f
 zvuYZSKY0tIlRIdxDvzjjaInFg4VTDH8x
X-Google-Smtp-Source: AGHT+IGlT3mWZ5gUtj3k6L/f4VGMUYVN62lmuEovxJMAy2pH5W5y8X1T9f7uKxY/xUhyH3Z/12on54PjCHxpYsNBytk=
X-Received: by 2002:a05:651c:210f:b0:2ff:a8e9:a64a with SMTP id
 38308e7fff4ca-2ffd5feb877mr4748011fa.6.1732669292903; Tue, 26 Nov 2024
 17:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
 <20241124172908.2b4db731@windsurf>
 <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
 <20241126145738.0b2e25cf@windsurf>
 <CAFkzVZbXtKAezUsDyDtYxhwg5CQ0A5tBnrmA9JPmi2OwGOXtXA@mail.gmail.com>
In-Reply-To: <CAFkzVZbXtKAezUsDyDtYxhwg5CQ0A5tBnrmA9JPmi2OwGOXtXA@mail.gmail.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 27 Nov 2024 09:01:21 +0800
Message-ID: <CAFkzVZZ3Y3vesmyAgP2LW-hMty16qhQjURpdXvtMN1u82BiRPg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732669293; x=1733274093; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+s4OyQDxB+HU5lo6AFydpxVfm9szriwc4GZ+mfRG2I=;
 b=hPcJQTtaM/mIkxmMzddMZl4NkIrVgoOXUmPyDXC5mZb9IOvfZsJHSIN3N+dI5T+ajy
 0O39tA0AmMdn2g/cMLvxPW9suK1HK+TndHvkSsu5w3YIgoBcbPTWujszkhjp7TkkMmmi
 SJvx9ikYKNSbmtbP3doS7+MRyCtDXfvXrNWGf+qHarM+Kz/U6OW/BnbEFMOXg4Byj1Hy
 hSpN1bQNdq+k0Sl/djQaUPAykMO/ElRLNXEE5H9PwvZgVeLDyB8SvsE8YoMExpg2Wvpm
 fytd0qaOAtnlg1SA6J9lKurlh+J0LvP3Ae7iSRLgWcjWDK2JcNplcYwxw4ZgXqd4vkXj
 wccA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hPcJQTta
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

SGVsbG8gVGhvbWFzLAoKVGhpcyBpc3N1ZSBkb2VzIG5vdCBuZWVkIHRvIGJlIGFkZHJlc3NlZCBp
bW1lZGlhdGVseSBiZWNhdXNlIGFub3RoZXIKbWVyZ2UgcmVxdWVzdCBpcyBiZWluZyBkaXNjdXNz
ZWQgdXBzdHJlYW0uCmh0dHBzOi8vZ2l0bGFiLmNvbS9wcm9jcHMtbmcvcHJvY3BzLy0vbWVyZ2Vf
cmVxdWVzdHMvMjQwCgpUaGF0IGZpeCB3aWxsIGxpa2VseSBiZSBhcHByb3ZlZCBieSB0aGUgcHJv
amVjdCBtYWludGFpbmVyLCBsZXQncyB3YWl0CmEgZmV3IGRheXMgYW5kIHNlZSB3aGF0IGhhcHBl
bnMuCgpTY290dCBGYW4KCk9uIFdlZCwgTm92IDI3LCAyMDI0IGF0IDg6MzXigK9BTSBTY290dCBG
YW4gPGZhbmNwMjAwN0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMjYsIDIwMjQg
YXQgOTo1N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCAyNiBOb3YgMjAyNCAwOTo1MDoxMiArMDgwMAo+
ID4gU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiA+IE1heWJl
IGl0IHNob3VsZCBiZSBhcyBmb2xsb3dzOgo+ID4gPgo+ID4gPiBpZmVxICgkKEJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF81XzMpLHkpCj4gPiA+IFBST0NQU19OR19DT05GX09QVFMgKz0g
LS1kaXNhYmxlLXBpZHdhaXQKPiA+ID4gZW5kaWYKPiA+Cj4gPiBJZiB5b3Ugd3JpdGUgaXQgdGhp
cyB3YXksIGl0IHdpbGwgZGlzYWJsZSBwaWR3YWl0IG9uIGFsbCBjb25maWd1cmF0aW9ucwo+ID4g
d2l0aCBoZWFkZXJzID49IDUuMy4gRG9uJ3QgeW91IHdhbnQgdG8gZG8gZXhhY3RseSB0aGUgb3Bw
b3NpdGU/Cj4gPgo+Cj4gU29ycnksIEkgbWFkZSBhIG1pc3Rha2UsIGl0IHNob3VsZCBiZToKPgo+
IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMyksKQo+IFBST0NQU19O
R19DT05GX09QVFMgKz0gLS1kaXNhYmxlLXBpZHdhaXQKPiBlbmRpZgo+Cj4gQnV0IGFub3RoZXIg
cHJvYmxlbSBpcyB0aGF0IHRoZSAtLWRpc2FibGUtcGlkd2FpdCBvcHRpb24gZG9lcyBub3QKPiBl
eGlzdCBpbiB0aGUgdjQuMC40IHZlcnNpb24gdW5sZXNzIHRoZSBmb2xsb3dpbmcgcGF0Y2ggaXMg
YXBwbGllZC4KPiBodHRwczovL2dpdGxhYi5jb20vcHJvY3BzLW5nL3Byb2Nwcy8tL2NvbW1pdC8y
NTA3YmM0NzU3ODJmZjVlMDU0MWQzN2M3ODBkZmYxZTI5M2M5NTUzCj4KPiBTY290dCBGYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
