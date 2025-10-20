Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A5CCD19F
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 23:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A39406C4;
	Mon, 20 Oct 2025 23:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jf-okPnJEneG; Mon, 20 Oct 2025 23:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA3B3406C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA3B3406C7;
	Mon, 20 Oct 2025 23:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2E7C43F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 23:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8E1D81286
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 23:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4meHFis1UjH for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 23:43:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EEA881281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EEA881281
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EEA881281
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 23:43:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-57f0aa38aadso6429969e87.2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761003818; x=1761608618;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5/ciKGDU+ZVD6i0u+Q62bmpdCIKYpxHygX3Cjf7VUc=;
 b=TiYtgJGKZQmaagrKMciIGmciCUSrt1/RcefVMDske53SHqflKHSMwj/NnHjPSnzAMv
 Z/ELaZ8LLLyo87v7zgYoG+I+fzXo6xIV5waj+IRB7k0jlAg9roWzEX55pfudQ4NI+gdB
 OALi6cXurJY0ERkFFlkAkCdCCx5x4wwfyFrRqFIEF9Hku+T2VeJe7MvZ1orpLkadH4xS
 MPteWw8hxr+O/sDElodYYp5CmnYNgDTY1IfEosntiPFtOWZ4OWc59HL3LtycdnuDSFAG
 TF28XWGbHbydNE2pUg8Kre8A0lKqWTotZ1rM0IJKO1JKLG4h2+8BP9PLOxGHGQApiXKs
 vofA==
X-Gm-Message-State: AOJu0YwsbI5XrqFT/O/nCIY0JL/+1NMm/WTfE30ZlYCPbZpMpAiMsR6F
 +AfHYsgOQAtAROTvq5O8uPm1x4N6750O/bi1WqWUcrkRkuzxF4TM1tlS/0kuWSXiFKYlT7cl/xQ
 SloXS6V281Q==
X-Gm-Gg: ASbGncvQfFqLiaKxUFCDm1GaTJ418jxItZbTXvb7sO3Zda2lEixyc7fJ3SX2UDK+q4W
 DquTY0X0f6UhnkXiIyiPnSS8odewVTOkKDZhdrZWuiPhiJLGpULMU2gPHkjBxgYcPGT4bBvqDff
 UXSsofY7+LjNmwMKYFF3Jd25huedJROAshnXeXWiAG6QBSE8FayTtDiY8KEvRznp7aQuJ3c/DSQ
 5hzckd79mIjs6CaBHu084ntcLu5z2WacWOLwxeo30ftUrYX9EhDiWrvQ6qe4PBaXkdMG675Z62B
 M4O3lFChhm3Qt00+kwQBALvk7oJ6dpnsKIrH/t9ehVGyzWCFxIEVg5E8KkNFNHIqv02CwkYMrte
 mTx6O3J8zKl5f8iylf0guO1E4zRsXwmime2BqHq1uQ3wwGDhbWYuGoOuxgj6Cw4k9YYmfHNoVRG
 RhMRTha4LdIIrV6OyFcKIvq23Pr8ujU1IbQH0YvJU=
X-Google-Smtp-Source: AGHT+IGC0QXfqascAgybxFIXXM4b32G8OXKX6BmKG+OMkHFgnhtS30PxnY6FzNbux8vp/egEYjI25g==
X-Received: by 2002:a05:6512:3195:b0:55f:7c3a:1176 with SMTP id
 2adb3069b0e04-591d8577448mr4946201e87.55.1761003817719; 
 Mon, 20 Oct 2025 16:43:37 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def160dbsm2969692e87.62.2025.10.20.16.43.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 16:43:36 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-57f0aa38aadso6429941e87.2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:43:36 -0700 (PDT)
X-Received: by 2002:a05:6512:118f:b0:591:c745:3024 with SMTP id
 2adb3069b0e04-591d85665d6mr4707234e87.43.1761003816007; Mon, 20 Oct 2025
 16:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
In-Reply-To: <20251020225424.98853-1-james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 16:43:24 -0700
X-Gmail-Original-Message-ID: <CA+h8R2oo6XBHDrxkxDZNDoUK_5Ytgrx5G2EiCf2m2RfLZTAa0Q@mail.gmail.com>
X-Gm-Features: AS18NWAqmn6EzgKv3EuFHe6uAEG6WSActWc6m2_l2hK7_rqluGnoKJidx72nx10
Message-ID: <CA+h8R2oo6XBHDrxkxDZNDoUK_5Ytgrx5G2EiCf2m2RfLZTAa0Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1761003818; x=1761608618; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5/ciKGDU+ZVD6i0u+Q62bmpdCIKYpxHygX3Cjf7VUc=;
 b=n9GRXRXCz+PZuAeLouonYimR0APw6NtQjfonKDoxxawR7rRgGD2noClbnc4CYaff30
 3WMXif6XEXHviBiZL6Mi2vfAMnR5lMI2xiADrp7wZdOqtghB8XxAimbIjWHEY/zl3UIV
 7dHw2+IJmziBsjF0tr0pt59i2aY9RV3DPuEm189NKrQIE1py/scJEoflHwy04vYlqB03
 fJJvdeA9UhqLFun010pmlVPl3GLiUMmOrhfcK6RfVHm41WZ1IUkZ6Fk1ki2SZq/i+r6N
 fNOaW0d6NG8TeUf6HprnnVGGQnU9I+/b8tZ6Q5bqT963JvzCXHAXkSS2Nm4QBBu3JhN+
 qErg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=n9GRXRXC
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TEdUTSEKCk9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDM6NTTigK9QTSBKYW1lcyBIaWxsaWFyZAo8
amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBCUjJfR09QUk9YWSBub3cgY29u
ZmlndXJlcyB0aGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25sb2FkIEdvIG1vZHVs
ZXMKPiBzcGVjaWZpZWQgaW4gcHJvamVjdCBnby5tb2QgYW5kIGdvLnN1bSBmaWxlcy4gQnkgZGVm
YXVsdCwgaXQgdXNlcyBHb29nbGUncwo+IG9mZmljaWFsIEdvIG1vZHVsZSBtaXJyb3IgYXQgcHJv
eHkuZ29sYW5nLm9yZywgZmFsbGluZyBiYWNrIHRvIGRpcmVjdCBkb3dubG9hZHMKPiBpZiB0aGUg
bW9kdWxlIGlzIG5vdCBmb3VuZCBpbiB0aGUgbWlycm9yLgo+Cj4gVGhpcyBjaGFuZ2Ugc2V0cyB0
aGUgZGVmYXVsdCBHT1BST1hZIHZhbHVlIHRvIG1hdGNoIEdvJ3MgYnVpbHQtaW4gZGVmYXVsdCBv
Zgo+ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0IiB3aGljaCBwcm92aWRlcyBzZXZl
cmFsIGJlbmVmaXRzOgo+Cj4gLSBBdm9pZCBwYWNrYWdlIGJyZWFrYWdlcyBkdWUgdG8gbWlzc2lu
ZyBtb2R1bGUgc291cmNlcwo+IC0gQmV0dGVyIGFsaWdubWVudCB3aXRoIHVwc3RyZWFtIEdvIHRv
b2xjaGFpbiBkZWZhdWx0cwo+IC0gRmFzdGVyIGRvd25sb2FkcyB2aWEgdGhlIHByb3h5IGNvbXBh
cmVkIHRvIGRpcmVjdCBHaXQgY2xvbmVzCj4gLSBNYWludGFpbnMgcmVwcm9kdWNpYmxlIGJ1aWxk
cyB0aHJvdWdoIEdvJ3MgbW9kdWxlIGNoZWNrc3VtIHZhbGlkYXRpb24KPgo+IFRoZSBkZWZhdWx0
IHZhbHVlIGZyb20gdGhlIHRvb2xjaGFpbiBjYW4gYmUgcmVhZCB3aXRoICJnbyBlbnYgR09QUk9Y
WSIKPgo+IFdlIHJlbHkgb24gcGFja2FnZSBkZXZlbG9wZXJzIHRvIGF1ZGl0IHRoZWlyIGRlcGVu
ZGVuY2llcyBpbiBnby5tb2QgYW5kIGdvLnN1bS4KPgo+IFRoZSB2YWx1ZSBjYW4gYmUgY29uZmln
dXJlZCB0bzoKPiAtIEEgY29tbWEtc2VwYXJhdGVkIGxpc3Qgb2YgcHJveHkgVVJMcwo+IC0gIm9m
ZiIgdG8gZGlzYWJsZSBhbGwgZG93bmxvYWRzCj4gLSAiZGlyZWN0IiB0byBkb3dubG9hZCBkaXJl
Y3RseSBmcm9tIHNvdXJjZSByZXBvc2l0b3JpZXMKPgo+IEZvciBtb3JlIGRldGFpbHMgb24gR28g
bW9kdWxlIHByb3hpZXM6Cj4gaHR0cHM6Ly9nby5kZXYvcmVmL21vZCNtb2R1bGUtcHJveHkKPgo+
IERpc2N1c3Npb246Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBRHZUajRwWE8ycndK
OG9DenpHTlkrT3hMdW8zdUpuRFQyUEF4YnlxdXcwTDZkaGZpQUBtYWlsLmdtYWlsLmNvbS9ULyN0
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0
dXJlLnVzPgo+IC0tLQo+IHYxIC0+IHYyOgo+Cj4gIC0gYWRkZWQgbW9yZSBjb250ZXh0IGFuZCBs
aW5rcwo+ICAtIHJlbmFtZWQgdG8gR09QUk9YWSBpbnN0ZWFkIG9mIEdPUFJPWFlfTElTVAo+ICAt
IG1vdmVkIGludG8gdGhlICFCUjJfUFJJTUFSWV9TSVRFX09OTFkgc2VjdGlvbgo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiAtLS0K
PiAgQ29uZmlnLmluICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdl
L3BrZy1nb2xhbmcubWsgfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4K
PiBpbmRleCBkNzMwZjIwMzRiLi4yMzcxN2YzZjk3IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbgo+
ICsrKyBiL0NvbmZpZy5pbgo+IEBAIC0zMzUsNiArMzM1LDIyIEBAIGNvbmZpZyBCUjJfTFVBUk9D
S1NfTUlSUk9SCj4KPiAgICAgICAgICAgU2VlIGh0dHA6Ly9sdWFyb2Nrcy5vcmcKPgo+ICtjb25m
aWcgQlIyX0dPUFJPWFkKPiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+ICsgICAg
ICAgZGVmYXVsdCAiaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdCIKPiArICAgICAgIGRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICsgICAg
ICAgaGVscAo+ICsgICAgICAgICBUaGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25s
b2FkIEdvIG1vZHVsZXMuIEJ5Cj4gKyAgICAgICAgIGRlZmF1bHQsIGl0IHVzZXMgdGhlIG9mZmlj
aWFsIEdvIG1vZHVsZSBtaXJyb3IsIGZhbGxpbmcgYmFjawo+ICsgICAgICAgICB0byBkaXJlY3Qg
ZG93bmxvYWRzIGlmIHRoZSBtb2R1bGUgaXMgbm90IGZvdW5kIGluIHRoZSBtaXJyb3IuCj4gKwo+
ICsgICAgICAgICBUaGUgdmFsdWUgY2FuIGJlIG9uZSBvZjoKPiArICAgICAgICAgICAtIENvbW1h
LXNlcGFyYXRlZCBsaXN0IG9mIHByb3h5IFVSTHMKPiArICAgICAgICAgICAtICJvZmYiIHRvIGRp
c2FibGUgYWxsIGRvd25sb2Fkcwo+ICsgICAgICAgICAgIC0gImRpcmVjdCIgdG8gZG93bmxvYWQg
ZGlyZWN0bHkgZnJvbSBzb3VyY2UgcmVwb3NpdG9yaWVzCj4gKwo+ICsgICAgICAgICBTZWUgaHR0
cHM6Ly9nby5kZXYvcmVmL21vZCNtb2R1bGUtcHJveHkKPiArCj4gIGNvbmZpZyBCUjJfQ1BBTl9N
SVJST1IKPiAgICAgICAgIHN0cmluZyAiQ1BBTiBtaXJyb3IgKFBlcmwgcGFja2FnZXMpIgo+ICAg
ICAgICAgZGVmYXVsdCAiaHR0cHM6Ly9jcGFuLm1ldGFjcGFuLm9yZyIKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9wa2ctZ29sYW5nLm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gaW5kZXggZmZk
NTBhZGVjYy4uM2UzODhjYjI1NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsK
PiArKysgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiBAQCAtMTAxLDcgKzEwMSw3IEBAICQoMilf
UE9TVF9QQVRDSF9IT09LUyArPSAkKDIpX0dFTl9HT01PRAo+ICAkKDIpX0RPV05MT0FEX1BPU1Rf
UFJPQ0VTUyA9IGdvCj4gICQoMilfRExfRU5WICs9IFwKPiAgICAgICAgICQkKEhPU1RfR09fQ09N
TU9OX0VOVikgXAo+IC0gICAgICAgR09QUk9YWT1kaXJlY3QgXAo+ICsgICAgICAgR09QUk9YWT0k
JChjYWxsIHFzdHJpcCwkJChCUjJfR09QUk9YWSkpIFwKPiAgICAgICAgICQkKCQoMilfR09fRU5W
KQo+Cj4gICMgSWYgYnVpbGRpbmcgaW4gYSBzdWIgZGlyZWN0b3J5LCBkbyB0aGUgdmVuZG9yaW5n
IGluIHRoZXJlCj4gLS0KPiAyLjQzLjAKPgoKdjIKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBTdGV3
YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
