Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4BBC02194
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 12:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68A4180CEB;
	Thu,  6 Feb 2025 12:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW8Cw7jA_-Nk; Thu,  6 Feb 2025 12:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6789480D21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6789480D21;
	Thu,  6 Feb 2025 12:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EFC71B4
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EBFB42660
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 12:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXXbM_13bbYc for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 12:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D5D44265F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D5D44265F
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D5D44265F
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 12:55:10 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-866f0d696e0so249855241.2
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 04:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738846509; x=1739451309;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abLGc4/c5QqRP9fSnkZ2C8zIRgjoTcN2BVtQuBuaAIw=;
 b=Yk8E6LWfdZg3LkfUZVVOnTYer7MZi4NHDVtbLYGOEEyXuQZ/eRV3hzfa+fL0tRWVE/
 WucQuec06jBHCLIOrdDWoXHDHBRY/lAnMTacvSzUT3aFcvAJlV/MvbaZfqo7luhys7ct
 GX9QcaiskbpLVnyRdy2CIQY7JA2RHFdXPDHr3QExlCcWwC6dD9oxYFeNF73DZLcQHXE8
 6Z6Hs0vXTtLbVpy5L1/9znONQRjo8N85hXj+ifYykPCnUn092qv99VG5sh8GsxXzRUoy
 DilWslxWHFJywxJwbRzpNkwWLMyab2yfmBK3Vxt7lEeefKCEMup7znjNpPlKi/aTh99b
 S2Yg==
X-Gm-Message-State: AOJu0YwzLgNUE7CGy4wo6O2RCDZ6EDkRCIlAuRum1vOCkd93BvmrRrYA
 qmEke83dfvQaIWjNKhd1jKwcZv2lzHFEhUE+WaBO44ucciP9vN10h2UhAcBF6858Djk5gmNXDHc
 zivjBT3AUgxUwfqcS+FBfpBK1lgPW/nke
X-Gm-Gg: ASbGncs0YUutJhrb1d9PLjFdcyKKQngq67GRhqi9iZekadIytkBvRddxkZKIXFe+fZ4
 HsuFbZ3YjcLPtvDQ6MgQ3o+lFwnFN5+rk38i0GOo986dZH2qOfAjTJ3H4BLm/qnX3HTSVYq1Vqg
 ==
X-Google-Smtp-Source: AGHT+IEOG/PRHVbcZ9uPRieedfPUFfWrXkx9K3oOCp7D3YxG3288lYe1wRJhqbZ4g3ReemaSMyNyzyA5j6FBcl4KiXo=
X-Received: by 2002:a05:6102:d94:b0:4b1:8b53:2987 with SMTP id
 ada2fe7eead31-4ba46fb5a4emr4055491137.1.1738846509046; Thu, 06 Feb 2025
 04:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20250108105155.147046-1-buildroot@bubu1.eu>
In-Reply-To: <20250108105155.147046-1-buildroot@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Feb 2025 14:54:57 +0200
X-Gm-Features: AWEUYZnQZx2Jr6HdXJAylpOGEIcvmnVxlh8cxAHPvPT_VKPD2oP_v7zEFgueUC0
Message-ID: <CADvTj4r1LBxJNPRydsu6dmSEieTYXBkY-HBV2Lh3UDWNkCAAPg@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738846509; x=1739451309; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abLGc4/c5QqRP9fSnkZ2C8zIRgjoTcN2BVtQuBuaAIw=;
 b=VlChrMjb72nQUVwWPc8vorPNTb7iZTTrXlNT6CJzz74egon7eA6NuUOyNTNqyPtOi5
 DcI7w1YFDfFoPAQaryP4Zf08c7zkdoixwYYAGZzbptwfO/KcbjGcFaa8jCNW+O6QJss7
 cvPiE94zzuDUDkDsPFvGKOo3VOqAH7z5NH7ajHwmc7/SLH2c3hY+JGW5ObkZJcOR11jj
 2JTWFdpfFYrO8Jeg95WX3YORZx4QO/uEHt6CwikAE6QMuJjLgMZlWSWlRfhfaiq+HK00
 O/G+6trpVNjz1kbOBCerWmPVUFqDna6nUz/oaunUw9U/m56ubsHxCBtpGjCiHXPSLmuc
 0eVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VlChrMjb
Subject: Re: [Buildroot] [PATCH] docs/manual/adding-packages-python.doc:
 clarify how _BUILD_OPTS work
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

T24gV2VkLCBKYW4gOCwgMjAyNSBhdCAxMjo1OOKAr1BNIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBQWVRIT05fRk9PX0JV
SUxEX09QVFMgYXJlIHBhc3NlZCB0byB0aGUgYnVpbGQgbW9kdWxlIGNhbGwgb2YgdGhlIHBhY2th
Z2UKPiBidWlsZCwgdGhpcyBhbGxvd3MgcGFzc2luZyBvcHRpb25zIHRvIHRoZSBweXRob24gYnVp
bGQgKmJhY2tlbmQqIGJ5Cj4gdXNpbmcgdGhlIC0tY29uZmlnLXNldHRpbmc9IG9wdGlvbi4gc2V0
dXAucHkgaXMgbm8gbG9uZ2VyIGludm9sdmVkIHNpbmNlCj4gZXZlbiB0aGUgc2V0dXB0b29scyBi
YWNrZW5kIG5vdyB1c2VkIHRoZSBwZXA1MTcgYnVpbGQgbWV0aG9kLgo+Cj4gVGhlIG5vdGUgYWJv
dXQgdGhlIG9wdGlvbnMgYmVpbmcgcGFzc2VkIHRvCj4gc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFs
bGVyLnB5IHNlZW1zIHRvIGJlIG5vIGxvbmdlciBhY2N1cmF0ZS4KPiAtLS0KPiAgZG9jcy9tYW51
YWwvYWRkaW5nLXBhY2thZ2VzLXB5dGhvbi5hZG9jIHwgNiArKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kb2Nz
L21hbnVhbC9hZGRpbmctcGFja2FnZXMtcHl0aG9uLmFkb2MgYi9kb2NzL21hbnVhbC9hZGRpbmct
cGFja2FnZXMtcHl0aG9uLmFkb2MKPiBpbmRleCBiNDJjMDZlNTRjLi40M2NmMGJhZWQ0IDEwMDY0
NAo+IC0tLSBhL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYwo+ICsrKyBi
L2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1weXRob24uYWRvYwo+IEBAIC0xMjgsMTAgKzEy
OCw4IEBAIHRoZXJlZm9yZSBvbmx5IHVzZSBhIGZldyBvZiB0aGVtLCBvciBub25lLgo+ICAgIGFu
ZCArSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19FTlYrIChmb3IgZmxpdC9wZXA1MTcgaG9zdCBwYWNr
YWdlcykuCj4KPiAgKiArUFlUSE9OX0ZPT19CVUlMRF9PUFRTKywgdG8gc3BlY2lmeSBhZGRpdGlv
bmFsIG9wdGlvbnMgdG8gcGFzcyB0bwo+IC0gIHRoZSBQeXRob24gK3NldHVwLnB5KyBzY3JpcHQg
ZHVyaW5nIHRoZSBidWlsZCBzdGVwLCB0aGlzIGdlbmVyYWxseQo+IC0gIG9ubHkgbWFrZXMgc2Vu
c2UgdG8gdXNlIGZvciBzZXR1cHRvb2xzIGJhc2VkIHBhY2thZ2VzIGFzIGZsaXQvcGVwNTE3Cj4g
LSAgYmFzZWQgcGFja2FnZXMgZG8gbm90IHBhc3MgdGhlc2Ugb3B0aW9ucyB0byBhICtzZXR1cC5w
eSsgc2NyaXB0IGJ1dAo+IC0gIGluc3RlYWQgcGFzcyB0aGVtIHRvICtzdXBwb3J0L3NjcmlwdHMv
cHlpbnN0YWxsZXIucHkrLgo+ICsgIHRoZSBQeXRob24gK3B5dGhvbiAtbSBidWlsZCsgY2FsbC4g
VG8gcGFzcyBhZGRpdGlvbmFsIG9wdGlvbnMgdG8gdGhlCj4gKyAgYnVpbGQgYmFja2VuZCB1c2Ug
dGhlICstLWNvbmZpZy1zZXR0aW5nPSsgZmxhZyBvZiB0aGUgK2J1aWxkKyBtb2R1bGUuCgpXZSBu
b3JtYWxseSB1c2UgdGhlIHNob3J0IG9wdGlvbiB2YXJpYW50IC1DIGluc3RlYWQgb2YgLS1jb25m
aWctc2V0dGluZy4KCj4KPiAgKiArUFlUSE9OX0ZPT19JTlNUQUxMX1RBUkdFVF9PUFRTKywgK1BZ
VEhPTl9GT09fSU5TVEFMTF9TVEFHSU5HX09QVFMrLAo+ICAgICtIT1NUX1BZVEhPTl9GT09fSU5T
VEFMTF9PUFRTKyB0byBzcGVjaWZ5IGFkZGl0aW9uYWwgb3B0aW9ucyB0byBwYXNzCj4gLS0KPiAy
LjQzLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
