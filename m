Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF0BFA3722
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09ABA60749;
	Thu,  1 Jan 2026 22:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YWdJnFl13Py8; Thu,  1 Jan 2026 22:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2E960762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306617;
	bh=o8+SUaNQ89sTMIYNMz3k4InaxT+VmAm7sMQXCueuLto=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NC4853Xbme9+7Ro7Fs6oGPO5tJPYFBxVOtsqAlReALQNS6tv2MY+w7k7kwRVh7NKF
	 IyFg11Ayn4uRR9U1xZaPKH9ToDIUolSbDAtVzCEof6BuK3VwYYLOrYIaf3Mzw5ZGjv
	 xhIvTfV9qfGelw6zAODazBxMqZt6iOWT9M9hDrt7Bb6ASEWkcu2wP1TYVKQsRJQNkK
	 CFPP/WgXWKEnRikrJzCljy9fSsdS//Y2ZIWRBGyuNjn8KSzGsZoqUI68DzyjIaYZ7a
	 pAlMdytOWUmyNipjCxbtJ1gE3co/deogbonzE5c1xceCW6kG6HbxtXtlpKRQc2jz14
	 tr1+lvEGkO9ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E2E960762;
	Thu,  1 Jan 2026 22:30:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 676A4206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DD95405ED
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkcoJbv-49Lo for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2ECC40510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2ECC40510
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2ECC40510
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:30:13 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-55b26461e78so3003582e0c.3
 for <buildroot@buildroot.org>; Thu, 01 Jan 2026 14:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767306612; x=1767911412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6d4HG/1lsjz2cxAcKc8XE07Jpwf8ehwuuhu0Lom94P4=;
 b=IwllNWsr8GAVAHLnGVASugfpgPR1VjZfyoAtr7lIZ+0dWKCJgSToBsdCan/Hl/n8VE
 Uo95SQjpsWcGAeV13mpcJjuLwnnvggmXFHRW8T6J3gCiYUT3485BBPEmQ8NRFZzGyoqw
 N6jo038MPYNAf1vD7WgT0cLgOhEKWtJxS58tDhycKjf400A8WeYZ6xS8ipqLEPzdsmzt
 UtGR8a9MoM7hzwqSrefa+2D7L2Faw8gXA0KYURh5MJeAtAa+n+fDlV05kuMi9QRRVjCH
 v0usVyTPtg8GRDRVHErmVOEtjfjrngKWACSpbzqaEJ3txlyAIH+WCB16adJGNXTX1VHr
 9Maw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI2eVW7HCpV8O7A7P4/OGr2dGtR0Xu8AOQplkH3Kk2Ou/f3q32oO44w8iJUIJ5OX8Xa4LMfetE01M=@buildroot.org
X-Gm-Message-State: AOJu0Yxahcw0J/b7gAKdcczpvyLNn12lkTYrKXsp0Ys6gBVVKdELwRui
 sHAL2cWYP4RwgfPhHPvFXdk8BnBT1poKyERicWzYICkOyelr73eN7ZkRppa+3eTfzmkemFBPNrI
 LEKg88KXNYFeur036sAXnx2dC4tmmq5g=
X-Gm-Gg: AY/fxX5GYEnca4Re9qaHs/+WPqKiWy2O0w7YicTTxsq+YNUu66x2vOmchTNaYNqKme8
 ooa3746bx+i7WncrZo6qFQVTGKWHQ4/eQoZvH2QL58DWjRyySY2asrnQ+t1VBk0ZQjnjbSp1H+b
 3lmWnfLEf7HSKpqCITzt9MJOHqSTWBe5d32x8uhhS+eH1Jb6hlbkvxyRGyVWvHQ6M50JAaHF1u/
 QFFvLXpQGsS4BMDI7qnOs/OVFay5r2JBlCCl/6QZMCUOao6WY851mYhGTd7146Y7OoGGyqG2yHr
 hR2Tdw5DTD467meDfVx2jkWMJKWQHzeDZkjqjnHvVEYCank282x0yJs=
X-Google-Smtp-Source: AGHT+IE9QBsmjiotFlYZoyHK9iuhrC8zY4m19dDZDZbB/B0NB6eTHKvjXJI1jD7ps0wReINn7WqGQqqcdvAiKmFOp2o=
X-Received: by 2002:a05:6102:3589:b0:5df:b4c8:b9cf with SMTP id
 ada2fe7eead31-5eb1a7c4683mr11039292137.24.1767306612251; Thu, 01 Jan 2026
 14:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <20260101230904.6d78e9f5@windsurf>
In-Reply-To: <20260101230904.6d78e9f5@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 1 Jan 2026 15:30:01 -0700
X-Gm-Features: AQt7F2oNemcAYfy691lBfnyIiU33wxftAsoEC2wjvRz6U7Pyl5W4L1dFl6WA2ZQ
Message-ID: <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org, 
 Sen Hastings <sen@hastings.org>, Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767306612; x=1767911412; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d4HG/1lsjz2cxAcKc8XE07Jpwf8ehwuuhu0Lom94P4=;
 b=PpwiFyAB8whrKgoX9uYISNnt8JDx2hDZ5W+eD32oNK+YiEME4MAJxpEWYC/7tB11ku
 yP4uZcAjff28DWPkL1fgdkyHP+vDAfutohHAnb2tsnn0h4g748HGOMvxCz93XZRcBUOj
 9jXKRIaNXex6oT4KYdN6kf+NP3Qbedrn7+pqNp6naSE/uVQ+FHvQKuvhZ8+pgmn+VpBQ
 U5CTP4APKgvDuWUqmWHuRCyPZNQpB8aceWY26BpVsM7T3hNwTtGg5iBJjgKYjyN/qKtb
 Gj6PEZfIrpWJQwl/mpuKViqyg16WxzDBqTEyHV9VQSQM2QpVthXNjWdAJ75KRgGfvHiW
 /0TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PpwiFyAB
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

T24gVGh1LCBKYW4gMSwgMjAyNiBhdCAzOjA54oCvUE0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBOb3JiZXJ0LCBKYW1lcywg
TWFyY3VzLAo+Cj4gT24gV2VkLCAxOSBOb3YgMjAyNSAxNjo0ODoxOCArMDEwMAo+IE5vcmJlcnQg
TGFuZ2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBBbGwgdGhvc2UgZmVhdHVy
ZXMgYXJlIG9wdGlvbmFsIGFuZCBwcmV2ZW50IGN1c3RvbWl6YXRpb24gb2YgdGhlIGtlcm5lbC4K
PiA+IEZvcmNpbmcgSVB2NiBpcyBwYXJ0aWN1bGFybHkgbmFzdHkuCj4gPgo+ID4gVGhpcyByZXZl
cnRzIHBhcnRzIG9mICJwYWNrYWdlL3N5c3RlbWQ6IGJ1bXAgdG8gdmVyc2lvbiAyNTYuNCIKPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+
Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2gsIGFuZCB0aGFua3MgZXZlcnlvbmUgZm9yIHBhcnRpY2lw
YXRpbmcgdG8gdGhlCj4gZGlzY3Vzc2lvbi4KPgo+IEJ1aWxkcm9vdCdzICJwaGlsb3NvcGh5IiBo
YXMgYWx3YXlzIGJlZW4gdG8gYmUgcmVhc29uYWJseSBtaW5pbWFsLiBTbyBJCj4gd291bGQgdGVu
ZCB0byBhZ3JlZSB3aXRoIGJvdGggTm9yYmVydCBhbmQgTWFyY3VzIHRoYXQgd2Ugc2hvdWxkIG5v
dAo+IGVuYWJsZSBhbGwgcG9zc2libGUgb3B0aW9ucyB0aGF0IG1heSBiZSBuZWVkZWQgZm9yIGFs
bCBwb3NzaWJsZQo+IHVzZS1jYXNlcy4gV2Ugd2FudCB0byBlbmFibGUgd2hhdCdzIG5lZWRlZCB0
byBnZXQgb3VyIHN5c3RlbWQgcGFja2FnZQo+IHRvICJ3b3JrIiBhcy1pcywgYnV0IG5vdCBuZWNl
c3NhcmlseSBldmVyeSBwb3NzaWJsZSBmZWF0dXJlIHRoYXQgdGhlCj4gdXNlciBtYXkgdXNlIHRo
cm91Z2ggc3lzdGVtZCB1bml0IGZpbGVzIG9yIHNwZWNpZmljIGZlYXR1cmVzLgoKSU1PIHdlIHNo
b3VsZCBnZW5lcmFsbHkgZGVmYXVsdCB0byBlbmFibGluZyB0aGUgcmVjb21tZW5kZWQgb3B0aW9u
cwphcyB0aGVyZSBhcmUgb2Z0ZW4gZ29vZCByZWFzb25zIGZvciBoYXZpbmcgdGhvc2UgZW5hYmxl
ZC4KCkluIGdlbmVyYWwgSSB0aGluayB3ZSB0ZW5kIHRvIGRlZmF1bHQgdG8gZW5hYmxpbmcgcmVj
b21tZW5kZWQgb3B0aW9ucwpmcm9tIHBhY2thZ2VzIHVubGVzcyB0aGVyZSBpcyBhIGdvb2QgcmVh
c29uIG5vdCB0byBpbiBtb3N0IGNhc2VzCmFscmVhZHkuCgpBbHNvIG1hbnkgcGFja2FnZXMgaW5j
bHVkZSBzeXN0ZW1kIHVuaXQgZmlsZXMgYW5kIGl0IHdvdWxkIG9mdGVuCmJlIGRpZmZpY3VsdCB0
byB0cmFjayB3aGljaCBrZXJuZWwgZmVhdHVyZXMgdGhvc2UgdW5pdCBmaWxlcyBkZXBlbmQKb24g
YXMgbW9zdCBwYWNrYWdlcyBhcmUgbGlrZWx5IHRvIGFzc3VtZSB0aGUgc3lzdGVtIGhhcyBhbnkK
cmVjb21tZW5kZWQga2VybmVsIG9wdGlvbnMgZW5hYmxlZC4KCj4gSG93ZXZlciwgaXQgd291bGQg
YmUgZ29vZCB0byBkcmF3IGEgY2xlYXIgbGluZSwgYW5kIHJhdGhlciB0aGFuCj4gYXBwbHlpbmcg
Tm9yYmVydCdzIHBhdGNoIGFzLWlzLCBJJ2QgcHJlZmVyIHRvIHNlZSBhIGNvbW1pdCB0aGF0IGNs
ZWFucwo+IHVwIHRob3NlIG9wdGlvbnMsIHdpdGggYSBjb21tZW50IG9uIHRvcCBvZiBTWVNURU1E
X0xJTlVYX0NPTkZJR19GSVhVUFMKPiB0aGF0IGRvY3VtZW50cyBvdXIgInBvbGljeSIgb24gdGhp
cywgbGlrZSAiRm9sbG93aW5nIHdoYXQncyBkb2N1bWVudGVkCj4gYXQgaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3RlbWQvc3lzdGVtZC9ibG9iL3YyNTcuMTAvUkVBRE1FLCBieSBlbmFibGluZwo+IGFs
bCBtYW5kYXRvcnkgb3B0aW9ucywgbGVhdmluZyBkaXNhYmxlZCBvbmx5ICdyZWNvbW1lbmRlZCcg
b3B0aW9ucywKPiB3aXRoIHRoZSBleGNlcHRpb24gb2YgQSwgQiwgQyBiZWNhdXNlIGJsYWJsYSIu
CgpJIHRoaW5rIHJlbHlpbmcgb24gdXNlcnMgdG8gbWFudWFsbHkgY29uZmlndXJlIHJlY29tbWVu
ZGVkIG9wdGlvbnMKaXMgcHJvYmFibHkgZ29pbmcgdG8gY2F1c2UgYSBsb3QgbW9yZSBpc3N1ZXMu
CgpJTU8gdGhlIGJldHRlciBvcHRpb24gaXMgdG8gaGF2ZSBhIGRlZmF1bHQgZW5hYmxlZCBrY29u
ZmlnIG9wdGlvbgp0aGF0IGNvbnRyb2xzIHRoZSByZWNvbW1lbmRlZCBidXQgbm90IHJlcXVpcmVk
IGZpeHVwcy4KCk9yIG1heWJlIGEgZGVmYXVsdCBkaXNhYmxlZCBrY29uZmlnIG9wdGlvbiB0aGF0
IHdoZW4gc2VsZWN0ZWQKZGlzYWJsZXMgdGhlIHJlY29tbWVuZGVkIGtlcm5lbCBvcHRpb24gZml4
dXBzPwoKUGFydCBvZiB0aGUgaXNzdWUgaXMgdGhhdCBtb3N0IHVzZXJzIHByb2JhYmx5IGFyZW4n
dCBnb2luZyB0byBiZQptYW51YWxseSB0cmFja2luZyBhbGwgdGhlIHN5c3RlbWQgcmVjb21tZW5k
ZWQga2NvbmZpZyBvcHRpb25zCnNvIGhhdmluZyB0aGVtIG1haW50YWluZWQgYXMgcGFydCBvZiB0
aGUgcGFja2FnZSBzaW1wbGlmaWVzIHRoaW5ncwphIGxvdCBpbiBwcmFjdGljZS4KClRoZXJlIG1h
eSBhbHNvIGJlIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBpZiBjZXJ0YWluIHJlY29tbWVuZGVkCmJ1
dCBub3QgcmVxdWlyZWQga2NvbmZpZyBmaXh1cHMgYXJlIGRpc2FibGVkLgoKPiBOb3JiZXJ0LCBv
ciBNYXJjdXMsIGRvIHlvdSB0aGluayB5b3UgY291bGQgcHJvcG9zZSBzb21ldGhpbmcgbGlrZSB0
aGlzPwo+Cj4gVGhhbmtzIGEgbG90IQo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25p
LCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
