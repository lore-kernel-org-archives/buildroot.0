Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD2CCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 15:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B7A4118A;
	Wed, 13 May 2026 15:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaaXUIB4HvGX; Wed, 13 May 2026 15:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F2341065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778686516;
	bh=nponN3fLAu/t564dKiWtxP+ViIr4tHxc7vrSZXPcQNQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tl6SIFSrUwcYtBrYWibu5vcA3oKEZe8xYqK9kPY+M4NsCTadMwJ8uT4pGc5flt2xy
	 isKIrU/1Wdr4ituweAldShx+2M93VQxGOPU6ztH5TW+UhRtX7lHwz6fIrMVltjjqPA
	 vZZt583RkIyVah0Ba8ZO2GwVOPtbkFM3T7wH9hZQhG+Zty3t3Fja52FgipEfZRAXTJ
	 z16zM2G0TyX9sUcA/sI3/wpxVFUVfNgObjOPvJDNWb0cuQS+F8YhmILsseq1iQ7lCJ
	 hm78p7jVXKRIE855bYdz50qYyxm9QyifiT0MKRzyAQ0srC/5F7MzKCQo0c5ZhfTRKM
	 R+WMLkm8s0EjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F2341065;
	Wed, 13 May 2026 15:35:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43538223
 for <buildroot@buildroot.org>; Wed, 13 May 2026 15:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3517F611B6
 for <buildroot@buildroot.org>; Wed, 13 May 2026 15:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u08zYdi5Ol8t for <buildroot@buildroot.org>;
 Wed, 13 May 2026 15:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBC1461007
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC1461007
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBC1461007
 for <buildroot@buildroot.org>; Wed, 13 May 2026 15:35:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488ad135063so56178805e9.0
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686512; x=1779291312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUIZipi+1XHaVmQUu6H36riX0YlBfMeuf4U5nd/bVOU=;
 b=AIfeJV0IN1+o+B058FUBKbsz4NlMJ/d8bBk5IV9Mab64HzKWwWH5WTxxRdytEGlh7n
 BG0/crGLeHcl9ldQpXVArIIeYWSev3+4yheA/FsbmCe+5ruSZZhmxDnDPhqYttLKy2rZ
 kOVUuWCPBoG/+7fBK9usQobKTk98LHLYzHSNRlJXYFMh35Tinsod6oMJBJ7wgagJlpMJ
 5uTgEjUlDYTk6BWeXenIgee05OnaTjgDE8XLuItHbyZYldWohqx4XHQQ3JOlgqtPtEuy
 ROrkIhyKAYLDCWNJuG93AeXTHPKhG4NmiE5EZK4ti7hz3TkjSdUqa8NjRTMd/CPfWOZu
 tpjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tmqa7pVyFGjkCsv7OC8AARH9+Zdwg5gfdOu538V0oMGs1GS8SjkitJDQeRfX/QdJS70g43Q7OIUk=@buildroot.org
X-Gm-Message-State: AOJu0Yw0WrTKB16Mp2zu6dXOpU2KDdpqRZKXiUnTOqVU3GdTmkyjDNiX
 LcPB96RLgY1Dos8woW8ObMp+WkwvWE8/j7qJVY1uz/JUNw4I/C1wvDzDDdxOwAHtoOA=
X-Gm-Gg: Acq92OEQyqiPHFsR/HFjZVLGwlCfnfVUMtO/wnP5Hf6PHnvoBDCeyD1VsijfD1yqoY8
 nyNKfwSk4Z7I7rNfV8LcRiXOLS+lo/2oqaF0MrhjgOB9jBwdasdjVtVXLk3e7Olw4qqb35sJFz+
 7Q4vRSa+s310/Tw1umvu9RuaJb3DLynOOXFEooGYm93KqMvVYX1rAzRKW4Pp1tZRIxjb9XvemAN
 oRZ/Qls2taKXbrsel/hEj9Ii8Nd3PAOwW5xypp/s8TpXNSWa6Qxdu9RZYwzR+pF2/ateF2vMoYb
 KKRuaR6m02YL9fP8MC1SbiUk/lKXJ4AMVwULn+T7/VunyP44/M04EWjBFz4BTjYUaMlRo1aukNR
 zT3Y+K8Bp7FvZu00PAy8CHuPubW3SXtuJA+TMqqXFMPyVBDhBaLs494nMa0ZMoGCcnh9aoba5M0
 1wJvrBqziPOVVcd6FYj1ELzFe8EDW2ufNu2DsAg+jdlpY+yfGNdN6pzDj0L9IvgfrxYipLCElWh
 LDD4dhtXu7JSemBjU13Uhajh2mt8PDTF1jJ+I+c5AhDWdePzdxX/iLEVHY0jY7a0g==
X-Received: by 2002:a05:600c:3508:b0:48d:112c:f582 with SMTP id
 5b1f17b1804b1-48fce9bd691mr43830605e9.11.1778686511643; 
 Wed, 13 May 2026 08:35:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d19854sm88197945e9.1.2026.05.13.08.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 08:35:11 -0700 (PDT)
Message-ID: <90f566b2-c146-4f37-b5b2-838bccce48ef@smile.fr>
Date: Wed, 13 May 2026 17:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20260512-virglrenderer-v5-0-1806e588eb59@gmail.com>
 <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20260512-virglrenderer-v5-1-1806e588eb59@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778686512; x=1779291312; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUIZipi+1XHaVmQUu6H36riX0YlBfMeuf4U5nd/bVOU=;
 b=MgKZ4HOWS/tnuRoic/iuBhB9u61HxcrkWpfP1U2u8TLPBIZvKsY1LtzM2o7nie39G0
 Yj55TNVnpjwJAaRZm+fmHS99dnqRpm0jwBcdPyE13pZGXS1SSODeQTPm85Ye4dB2UO/A
 PY2q3xyxC5A1v0RU0V+S1y5h3hT0jhN6/kNQY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=MgKZ4HOW
Subject: Re: [Buildroot] [PATCH RESEND v5 1/5] package/libepoxy: remove
 gl/egl dependency
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSm9zZXBoLCBBbGwsCgpMZSAxMi8wNS8yMDI2IMOgIDIxOjM2LCBKb3NlcGggS29ndXQg
YSDDqWNyaXTCoDoKPiBMaWJlcG94eSBpcyBhIGxpYnJhcnkgZm9yIGhhbmRsaW5nIE9wZW5HTCBm
dW5jdGlvbiBwb2ludGVyIG1hbmFnZW1lbnQuCj4gCj4gSXQgaGFzIGJhY2tlbmRzIGZvciBlZ2wv
Z2x4LCB3aGljaCBtYXkgYXQgb25lIHBvaW50IGhhdmUgYmVlbiBtYW5kYXRvcnkKPiB0byBlbmFi
bGUsIGJ1dCB0aGUgbGlicmFyeSBub3cgYnVpbGRzIHdpdGggbm9uZSBvZiB0aGUgYWJvdmUgZW5h
YmxlZAo+IGZlYXR1cmVzLCBhcyBzZWVuIGJlbG93Lgo+IAo+ICAgbGliZXBveHkgMS41LjEwCj4g
Cj4gICAgIFVzZXIgZGVmaW5lZCBvcHRpb25zCj4gICAgICAgQ3Jvc3MgZmlsZXMgICAgICAgICAg
ICA6IC9ob21lL2pvc2VwaC9ici10ZXN0LXBrZy9hcm0tYWFyY2g2NC9idWlsZC9saWJlcG94eS0x
LjUuMTAvL2J1aWxkcm9vdC1idWlsZC9jcm9zcy1jb21waWxhdGlvbi5jb25mCj4gICAgICAgYl9w
aWUgICAgICAgICAgICAgICAgICA6IGZhbHNlCj4gICAgICAgYl9zdGF0aWNwaWMgICAgICAgICAg
ICA6IHRydWUKPiAgICAgICBidWlsZHR5cGUgICAgICAgICAgICAgIDogcmVsZWFzZQo+ICAgICAg
IGJ1aWxkLmNtYWtlX3ByZWZpeF9wYXRoOiAvaG9tZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFh
cmNoNjQvaG9zdC9saWIvY21ha2UKPiAgICAgICBkZWZhdWx0X2xpYnJhcnkgICAgICAgIDogc2hh
cmVkCj4gICAgICAgZG9jcyAgICAgICAgICAgICAgICAgICA6IGZhbHNlCj4gICAgICAgZWdsICAg
ICAgICAgICAgICAgICAgICA6IG5vCj4gICAgICAgZ2x4ICAgICAgICAgICAgICAgICAgICA6IG5v
Cj4gICAgICAgbGliZGlyICAgICAgICAgICAgICAgICA6IGxpYgo+ICAgICAgIGJ1aWxkLnBrZ19j
b25maWdfcGF0aCAgOiAvaG9tZS9qb3NlcGgvYnItdGVzdC1wa2cvYXJtLWFhcmNoNjQvaG9zdC9s
aWIvcGtnY29uZmlnCj4gICAgICAgcHJlZml4ICAgICAgICAgICAgICAgICA6IC91c3IKPiAgICAg
ICBzdHJpcCAgICAgICAgICAgICAgICAgIDogZmFsc2UKPiAgICAgICB0ZXN0cyAgICAgICAgICAg
ICAgICAgIDogZmFsc2UKPiAgICAgICB4MTEgICAgICAgICAgICAgICAgICAgIDogZmFsc2UKPiAK
PiBSZW1vdmluZyB0aGVzZSBkZXBlbmRlbmNpZXMgYWxsb3dzIGZvciBzb21lIGFwcGxpY2F0aW9u
cyB0aGF0IHJlcXVpcmUgaXQKPiBhcyBhIGJ1aWxkIGRlcGVuZGVuY3ksIGJ1dCBvdGhlcndpc2Ug
Y2FuIHJ1biBoZWFkbGVzcyBvciB3aXRob3V0IEdMLCB0bwo+IGJ1aWxkIGFuZCBmdW5jdGlvbi4K
CkknbSBub3Qgc3VyZSBhYm91dCB0aGlzIGNoYW5nZS4gSGF2aW5nIGVnbCBvciBnbHggYmFja2Vu
ZCBzdGlsbCBzZWVtcyBoaWdobHkKcmVjb21tZW5kZWQuIE9rIGl0IGJ1aWxkcyBidXQgd2h5IHVz
aW5nIGxpYmVwb3h5IGluIHRoaXMgY2FzZSAoaGVhZGxlc3MpPwoKSXQgd291bGQgY3JlYXRlIGEg
bGlicmFyeSB0aGF0IHJlcGx5IGZhbHNlIG9yIDAgdG8gdGhlIGZvbGxvd2luZyBmdW5jdGlvbnM6
CgplcG94eV9oYXNfZ2xfZXh0ZW5zaW9uKCkKZXBveHlfaXNfZGVza3RvcF9nbCgpCmVwb3h5X2ds
X3ZlcnNpb24oKQplcG94eV9nbHNsX3ZlcnNpb24oKQoKTm90ZTogVGhlIGdpdGh1YiBDSSB3b3Jr
ZmxvdyBvZiBsaWJlcG94eSBkaXNhYmxlIGFsbCBiYWNrZW5kIGJ1dCBwcm9iYWJseSB0bwpwZXJm
b3JtIGEgYnVpbGQgdGVzdCBvbmx5OgpodHRwczovL2dpdGh1Yi5jb20vYW5ob2x0L2xpYmVwb3h5
L2Jsb2IvbWFzdGVyLy5naXRodWIvd29ya2Zsb3dzL2xpbnV4LnltbCNMMTYKCllvY3RvJ3MgbGli
ZXBveHkgcmVjaXBlIGVuYWJsZSBhdCBsZWFzdCBlZ2wgYmFja2VuZCBieSBkZWZhdWx0IChub3Qg
c3VyZSBpZgphbnlvbmUgZGlzYWJsZSBlZ2wgd2l0aG91dCBlbmFibGluZyB4MTEpLgoKaHR0cHM6
Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQtY29yZS9ibG9iLzM3MjRiOTM1
MzhkM2FjYmVjOWY0OGQ0YzUyNGI1MWQxNjYwNzE3MDgvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YmVwb3h5L2xpYmVwb3h5XzEuNS4xMC5iYiNMMjEKCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiAt
LS0KPiAgcGFja2FnZS9saWJlcG94eS9Db25maWcuaW4gfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZXBveHkvQ29u
ZmlnLmluIGIvcGFja2FnZS9saWJlcG94eS9Db25maWcuaW4KPiBpbmRleCA5ZGExOTBiODk1Li4y
N2QyYjk2OGQyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZXBveHkvQ29uZmlnLmluCj4gKysr
IGIvcGFja2FnZS9saWJlcG94eS9Db25maWcuaW4KPiBAQCAtMSwxMiArMSw4IEBACj4gIGNvbmZp
ZyBCUjJfUEFDS0FHRV9MSUJFUE9YWQo+ICAJYm9vbCAibGliZXBveHkiCj4gLQlkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX0hBU19MSUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMCj4gIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfWFVUSUxfVVRJTF9NQUNST1MKPiAgCWhlbHAKPiAgCSAgRXBveHkgaXMg
YSBsaWJyYXJ5IGZvciBoYW5kbGluZyBPcGVuR0wgZnVuY3Rpb24gcG9pbnRlcgo+ICAJICBtYW5h
Z2VtZW50IGZvciB5b3UuCj4gIAo+ICAJICBodHRwczovL2dpdGh1Yi5jb20vYW5ob2x0L2xpYmVw
b3h5Cj4gLQo+IC1jb21tZW50ICJsaWJlcG94eSBuZWVkcyBhbiBPcGVuR0wgYW5kL29yIE9wZW5H
TCBFR0wgYmFja2VuZCIKPiAtCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0hBU19MSUJFR0wgJiYg
IUJSMl9QQUNLQUdFX0hBU19MSUJHTAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
