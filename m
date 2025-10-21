Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2D8CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD2960638;
	Tue, 21 Oct 2025 05:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQ2MN1CzFBT5; Tue, 21 Oct 2025 05:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67B516063B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B516063B;
	Tue, 21 Oct 2025 05:31:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6229277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF68E6063B
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBX9ha3WtaoC for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:31:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BEB660638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEB660638
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BEB660638
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:31:39 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-54bc6f33513so3837572e0c.2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761024698; x=1761629498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0M+I9vXCHFXzDltiHX51eGSclbOYBnaVwUhESZniG4=;
 b=YwIhxVe41pQR/XTw8JQYlg6NTHA6edSxZ9ApNxbMtoYoeji3atjMzxlumSNdVJDiMF
 ywErTeKMuiIStDe4hcaN+y3AJjWbh4mgP6b8YHY4xHtOEfPNmilZun9JMlWJE3jm36hP
 uCXsZnnwY8uJ2IjJytFLmJbH3UaT8lgClCSmvVLrv1g7Lg8bIC7/SCteuEFhNoN8zzXz
 Ro/9Gg8qxBchqoQ+CM65m6QtJ7OOnyPwghJxLhG5mfZ8KhmuoqOf3dfUsnF19cWdt7wR
 wXMzv8JZWIQ3Yr9AWt+PW+HXy+XHW4w+gpmn3umDOa5ToE/S0iGbFCp3O+WWpiSBzcRa
 hltA==
X-Gm-Message-State: AOJu0YzZn+eQBkpmtzDQGncmUoEWM2c3z3+86YY0h6Nf75ciYPJosAod
 qChI2DZpY+YZtyCUBYViDJKtL6SmUktt5DgRsmjMUQWgTFkdpiex7tBexTVcRh+PnEPnzcuCKLA
 qldGAeasKztJwXUM73VlJeGjph3wcP6g=
X-Gm-Gg: ASbGnctVLJ3esuWu5CFOij8gAxWm307D0MdMAzGdkLnHrMR7f8ZoZbP4E7g+T8rA+4Z
 1AyfbeBCiSjBVZAvaZtvh0chUePPuhZDEVpYBomfpV7HJ6eN8niPmwidBCAS8M9RaRTAqfDKK4n
 1tQ0Qt0coH2QEJdd0X5Xn2WHy5TAiynCAH0yNI8Z8XFiLMuRtYwb3bLnGksYWwqthqial4lUVUw
 lP/Mf+kl3uWAXXHWVMunwS9POYx1/4dFcXUzr9ogDrYz0IJdxyDiPBK08uDdn2FPwNXwhX/
X-Google-Smtp-Source: AGHT+IHClot6g78rauaVOuENuqOF13ZzKrvkrWXjvysYCWE9rTMDQDg5oSP8MFPQN5f2rF4VUWZgeNrVDn9h43y2qrE=
X-Received: by 2002:a05:6122:d09:b0:54a:9927:7a99 with SMTP id
 71dfb90a1353d-5564ef51257mr5030674e0c.13.1761024698054; Mon, 20 Oct 2025
 22:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
 <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
In-Reply-To: <aPcNRwNOMOrNTLUB@yd-6wlzhs3>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 23:31:26 -0600
X-Gm-Features: AS18NWA1dWHIHxJFQzcDbCwrqwTl1tnITEUhCPPcZmUkzqkH-KYvMMDfSfZDRwU
Message-ID: <CADvTj4rxqvqzzX3VDwNzXC=we3SM_HsSXyuS_42VQVKuq2ht9w@mail.gmail.com>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761024698; x=1761629498; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0M+I9vXCHFXzDltiHX51eGSclbOYBnaVwUhESZniG4=;
 b=KCyUz593VbKHQ7VyhB/9nJOVwlwPcvzahCgPrZZIzXXi+NlRNUovim2c9gN9to/YWn
 h0JheTpT8hGKmlz8pPzwVQet3PEQhOAQY7mvr5z85KZcveWccwX71dJqtsILLYzL+r9F
 4jBdZ40S/Qujuy46+Y7mrXaBj+96bbGiTQAaI1wvCY/Axw9z+Am50jK5sqdoXcmVlHDp
 vxTJdQvM4baWv3p4rnec9pmBbMiIy7Dvs8HDF7fJHgacP6rcXDq/Y+G/2H+F938Okvfi
 rolWYJFc44zEgary8QYKZp3kbvhugmdZFAaQJPFLhQr+zFJyAnlUm/7/3VhdY4nO/McV
 2o3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KCyUz593
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTA6MzTigK9QTSA8eWFubi5tb3JpbkBvcmFuZ2UuY29t
PiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI1LTEwLTIwIDE2OjU0IC0wNjAwLCBK
YW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBCUjJfR09QUk9YWSBub3cgY29uZmlndXJl
cyB0aGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25sb2FkIEdvIG1vZHVsZXMKPiA+
IHNwZWNpZmllZCBpbiBwcm9qZWN0IGdvLm1vZCBhbmQgZ28uc3VtIGZpbGVzLiBCeSBkZWZhdWx0
LCBpdCB1c2VzIEdvb2dsZSdzCj4gPiBvZmZpY2lhbCBHbyBtb2R1bGUgbWlycm9yIGF0IHByb3h5
LmdvbGFuZy5vcmcsIGZhbGxpbmcgYmFjayB0byBkaXJlY3QgZG93bmxvYWRzCj4gPiBpZiB0aGUg
bW9kdWxlIGlzIG5vdCBmb3VuZCBpbiB0aGUgbWlycm9yLgo+ID4KPiA+IFRoaXMgY2hhbmdlIHNl
dHMgdGhlIGRlZmF1bHQgR09QUk9YWSB2YWx1ZSB0byBtYXRjaCBHbydzIGJ1aWx0LWluIGRlZmF1
bHQgb2YKPiA+ICJodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0IiB3aGljaCBwcm92aWRl
cyBzZXZlcmFsIGJlbmVmaXRzOgo+ID4KPiA+IC0gQXZvaWQgcGFja2FnZSBicmVha2FnZXMgZHVl
IHRvIG1pc3NpbmcgbW9kdWxlIHNvdXJjZXMKPgo+IEhvdyBjYW4gc291cmNlcyBiZSBtaXNzaW5n
IHdoZW4gZmV0Y2hlZCAiZGlyZWN0Imx5PwoKQmVjYXVzZSBub24tZGlyZWN0IGlzIHRoZSBnb2xh
bmcgZGVmYXVsdCBhbmQgImRpcmVjdCIgc291cmNlcwpjYW4gZGlzYXBwZWFyIHJhbmRvbWx5LgoK
PiBEbyB5b3UgaGF2ZSBhIG5lc3hhbXBsZSBvZiBhIHBhY2thZ2Ugd2hlcmUgdGhpcyBhY3R1YWxs
eSBmaXhlcyB0aGUKPiBkb3dubG9hZCAoYmFycmluZyB1c2luZyBzLmIuby4pID8KCkZvciBleGFt
cGxlIHRoZSBsYXRlc3QgdGFpbHNjYWxlIGZhaWxzIHdpdGhvdXQgZ29wcm94eSBjdXJyZW50bHku
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NTEwMjAyMjU0MjQuOTg4NTMtMi1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPiA+IC0gQmV0
dGVyIGFsaWdubWVudCB3aXRoIHVwc3RyZWFtIEdvIHRvb2xjaGFpbiBkZWZhdWx0cwo+ID4gLSBG
YXN0ZXIgZG93bmxvYWRzIHZpYSB0aGUgcHJveHkgY29tcGFyZWQgdG8gZGlyZWN0IEdpdCBjbG9u
ZXMKPiA+IC0gTWFpbnRhaW5zIHJlcHJvZHVjaWJsZSBidWlsZHMgdGhyb3VnaCBHbydzIG1vZHVs
ZSBjaGVja3N1bSB2YWxpZGF0aW9uCj4KPiBJbiB0aGUgcGFzdCwgd2Ugb2JzZXJ2ZWQgdGhlIHJl
dmVyc2U6IHRoZSBnb3Byb3h5IGhhZCBhIHN0YWxlIHZlcnNpb24KPiB0aGF0IHdhcyBub3QgbWF0
Y2hpbmcgdGhlIHVwc3RyZWFtIG9uZSwgc28gd2hlbiB3ZSB0cmllZCB0byB2ZW5kb3IgYQo+IHBh
Y2thZ2UsIHRoZSBoYXNoZXMgd291bGQgbm90IG1hdGNoLiBVc2luZyAiZGlyZWN0IiBmaXhlZCB0
aGUgaXNzdWUKPiAoc29ycnksIEkgY2FuJ3QgcmVtZW1iZXIgd2hhdCBwYWNrYWdlIHRoYXQgd2Fz
Li4uKQoKV2VpcmQsIHZpcnR1YWxseSBhbGwgZ28gcHJvamVjdHMgZXhwZWN0IHRoZSB2ZXJzaW9u
cyBmcm9tIGdvcHJveHkgaW4gY2FzZXMKd2hlcmUgdGhlcmUgbWF5IGJlIGEgY29uZmxpY3QsIEkn
dmUgcmVwZWF0ZWRseSBydW4gaW50byB0aGlzIGlzc3VlLCB0aGUKbWFuaWZlc3RzL2hhc2hlcyBp
biB0aGUgcGFja2FnZSBjaGVja3N1bSBmaWxlcyB2aXJ0dWFsbHkgYWx3YXlzIG1hdGNoCmdvcHJv
eHkgdmVyc2lvbnMgYW5kIG5vdCBkaXJlY3QgdmVyc2lvbnMuCgo+Cj4gPiBUaGUgZGVmYXVsdCB2
YWx1ZSBmcm9tIHRoZSB0b29sY2hhaW4gY2FuIGJlIHJlYWQgd2l0aCAiZ28gZW52IEdPUFJPWFki
Cj4KPiBJIGRpc2FncmVlLiBUaGUgZGVmYXVsdCBzaG91bGQgYmUgdGhlIHNhbWUgYXMgdGhlIHBy
ZXZpb3VzIHNldHRpbmcsIHRoYXQKPiBpcyAiZGlyZWN0Ii4gQXQgbGVhc3QgaW4gdGhpcyBwYXRj
aC4KPgo+IElmIHlvdSB3YW50IHRvIHN1Z2dlc3QgYSBjaGFuZ2Ugb2YgdGhlIGRlZmF1bHQsIHBs
ZWFzZSBkbyB0aGF0IGluIGEKPiBzZXBhcmF0ZSBwYXRjaC4KClNvIGdvcHJveHkgYmFzaWNhbGx5
IGhhcyB0byBiZSB0aGUgZGVmYXVsdCwgb3RoZXJ3aXNlIGdvIHBhY2thZ2UKYnVpbGRzIHJlbHlp
bmcgb24gZ29wcm94eSBzZXJ2aW5nIHN0YWxlIHZlcnNpb25zIHdpbGwgZmFpbC4KClVzaW5nIEdP
UFJPWFk9ZGlyZWN0IGlzIGtpbmQgb2YgYSBuaWNoZSB1c2UgY2FzZSBzaW5jZSB0aGUKZ28gZWNv
c3lzdGVtIGF0IGxhcmdlIGV4cGVjdHMgdGhlIGNhY2hpbmcgcHJveHkgdG8gYmUgZW5hYmxlZC4K
CkknbGwgc3BsaXQgb3V0IHRoZSBHT1BST1hZIGRlZmF1bHQgY2hhbmdlLgoKPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFdlIHJlbHkgb24gcGFja2FnZSBkZXZlbG9wZXJzIHRvIGF1
ZGl0IHRoZWlyIGRlcGVuZGVuY2llcyBpbiBnby5tb2QgYW5kIGdvLnN1bS4KPiA+Cj4gPiBUaGUg
dmFsdWUgY2FuIGJlIGNvbmZpZ3VyZWQgdG86Cj4gPiAtIEEgY29tbWEtc2VwYXJhdGVkIGxpc3Qg
b2YgcHJveHkgVVJMcwo+ID4gLSAib2ZmIiB0byBkaXNhYmxlIGFsbCBkb3dubG9hZHMKPiA+IC0g
ImRpcmVjdCIgdG8gZG93bmxvYWQgZGlyZWN0bHkgZnJvbSBzb3VyY2UgcmVwb3NpdG9yaWVzCj4g
Pgo+ID4gRm9yIG1vcmUgZGV0YWlscyBvbiBHbyBtb2R1bGUgcHJveGllczoKPiA+IGh0dHBzOi8v
Z28uZGV2L3JlZi9tb2QjbW9kdWxlLXByb3h5Cj4gPgo+ID4gRGlzY3Vzc2lvbjoKPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUR2VGo0cFhPMnJ3SjhvQ3p6R05ZK094THVvM3VKbkRU
MlBBeGJ5cXV3MEw2ZGhmaUFAbWFpbC5nbWFpbC5jb20vVC8jdAo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiA+IC0t
LQo+ID4gdjEgLT4gdjI6Cj4gPgo+ID4gIC0gYWRkZWQgbW9yZSBjb250ZXh0IGFuZCBsaW5rcwo+
ID4gIC0gcmVuYW1lZCB0byBHT1BST1hZIGluc3RlYWQgb2YgR09QUk9YWV9MSVNUCj4gPiAgLSBt
b3ZlZCBpbnRvIHRoZSAhQlIyX1BSSU1BUllfU0lURV9PTkxZIHNlY3Rpb24KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgo+ID4g
LS0tCj4gPiAgQ29uZmlnLmluICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ID4g
IHBhY2thZ2UvcGtnLWdvbGFuZy5tayB8ICAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0NvbmZpZy5p
biBiL0NvbmZpZy5pbgo+ID4gaW5kZXggZDczMGYyMDM0Yi4uMjM3MTdmM2Y5NyAxMDA2NDQKPiA+
IC0tLSBhL0NvbmZpZy5pbgo+ID4gKysrIGIvQ29uZmlnLmluCj4gPiBAQCAtMzM1LDYgKzMzNSwy
MiBAQCBjb25maWcgQlIyX0xVQVJPQ0tTX01JUlJPUgo+ID4KPiA+ICAgICAgICAgU2VlIGh0dHA6
Ly9sdWFyb2Nrcy5vcmcKPiA+Cj4gPiArY29uZmlnIEJSMl9HT1BST1hZCj4gPiArICAgICBzdHJp
bmcgIkdvIG1vZHVsZSBwcm94eSIKPiA+ICsgICAgIGRlZmF1bHQgImh0dHBzOi8vcHJveHkuZ29s
YW5nLm9yZyxkaXJlY3QiCj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09f
VEFSR0VUX0FSQ0hfU1VQUE9SVFMKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhlIEdvIG1v
ZHVsZSBwcm94eSBVUkwgdXNlZCB0byBkb3dubG9hZCBHbyBtb2R1bGVzLiBCeQo+ID4gKyAgICAg
ICBkZWZhdWx0LCBpdCB1c2VzIHRoZSBvZmZpY2lhbCBHbyBtb2R1bGUgbWlycm9yLCBmYWxsaW5n
IGJhY2sKPiA+ICsgICAgICAgdG8gZGlyZWN0IGRvd25sb2FkcyBpZiB0aGUgbW9kdWxlIGlzIG5v
dCBmb3VuZCBpbiB0aGUgbWlycm9yLgo+ID4gKwo+ID4gKyAgICAgICBUaGUgdmFsdWUgY2FuIGJl
IG9uZSBvZjoKPiA+ICsgICAgICAgICAtIENvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIHByb3h5IFVS
THMKPiA+ICsgICAgICAgICAtICJvZmYiIHRvIGRpc2FibGUgYWxsIGRvd25sb2Fkcwo+ID4gKyAg
ICAgICAgIC0gImRpcmVjdCIgdG8gZG93bmxvYWQgZGlyZWN0bHkgZnJvbSBzb3VyY2UgcmVwb3Np
dG9yaWVzCj4gPiArCj4gPiArICAgICAgIFNlZSBodHRwczovL2dvLmRldi9yZWYvbW9kI21vZHVs
ZS1wcm94eQo+ID4gKwo+ID4gIGNvbmZpZyBCUjJfQ1BBTl9NSVJST1IKPiA+ICAgICAgIHN0cmlu
ZyAiQ1BBTiBtaXJyb3IgKFBlcmwgcGFja2FnZXMpIgo+ID4gICAgICAgZGVmYXVsdCAiaHR0cHM6
Ly9jcGFuLm1ldGFjcGFuLm9yZyIKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcu
bWsgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiA+IGluZGV4IGZmZDUwYWRlY2MuLjNlMzg4Y2Iy
NTcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiA+ICsrKyBiL3BhY2th
Z2UvcGtnLWdvbGFuZy5tawo+ID4gQEAgLTEwMSw3ICsxMDEsNyBAQCAkKDIpX1BPU1RfUEFUQ0hf
SE9PS1MgKz0gJCgyKV9HRU5fR09NT0QKPiA+ICAkKDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9
IGdvCj4gPiAgJCgyKV9ETF9FTlYgKz0gXAo+ID4gICAgICAgJCQoSE9TVF9HT19DT01NT05fRU5W
KSBcCj4gPiAtICAgICBHT1BST1hZPWRpcmVjdCBcCj4gPiArICAgICBHT1BST1hZPSQkKGNhbGwg
cXN0cmlwLCQkKEJSMl9HT1BST1hZKSkgXAo+ID4gICAgICAgJCQoJCgyKV9HT19FTlYpCj4gPgo+
ID4gICMgSWYgYnVpbGRpbmcgaW4gYSBzdWIgZGlyZWN0b3J5LCBkbyB0aGUgdmVuZG9yaW5nIGlu
IHRoZXJlCj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
