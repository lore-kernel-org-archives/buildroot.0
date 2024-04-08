Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC13C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC87140490;
	Mon,  8 Apr 2024 21:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIBDKzuN3b6a; Mon,  8 Apr 2024 21:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBEC24118A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBEC24118A;
	Mon,  8 Apr 2024 21:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05B9C1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6A8860825
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qUzJnQ_PyamE for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C45D56067C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45D56067C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C45D56067C
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:11:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-516d1c8dc79so5219425e87.1
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 14:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712610685; x=1713215485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDQtiCxCCSSpHP1CKld+l6D4OQ/zXRN5RVtksCvkhdE=;
 b=Im8aBgQL3l310sxLRe2zlkCCV3toAx1q2FNRfSfgjHZQZ0aXdl3Layf15j/JBCL+ya
 ibgs2k+/kEe9dsaKI2T96EUnLhf0F9TPAT6iKfbFzUgQ8TjCEUhSusS35S3nHzeJ2DeM
 QIpjvnBOSBALpz8f9ciblTRecXmW+kU0qula4iFpl/Vunu7VcR+ZZYh/5IXjsBwzGhND
 kEb1HhoDfFkFwkBZlRmycaD0XzWWL4YP9V/p0OwrtqZuYiaVQHWf3gci8R0KSvOUJE8y
 3sou19i3GfyKLEZ7PGGPYGkCgf93H6pCANjzFfCSlZX88pVhqgfs+MKuVxjBvFxemyZc
 N1OQ==
X-Gm-Message-State: AOJu0YyUFDTTqecQpxLW3BfnTjxcS8iQk6pFyca9QXSgROp/wq/1gmTh
 D8y5SL/6sxelONl9sWB8BsHuii9yjLTPHl5Rfe430+Izp1aTFlCWY4DEywPxZuuzt9WOp19Bhmy
 s4A4qCsqxN6tj4bxXeWoj6cRXBVU=
X-Google-Smtp-Source: AGHT+IHGh8I3ZmyWKgcad2MoYAe49GvH/IHuZzrkQh7wrofQOFW4so95iz28FJwlTT3c8A8VkAXtGm23BQpo9YOsynM=
X-Received: by 2002:ac2:4649:0:b0:513:952d:ac62 with SMTP id
 s9-20020ac24649000000b00513952dac62mr6899471lfo.52.1712610684884; Mon, 08 Apr
 2024 14:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240404194723.1346001-1-fontaine.fabrice@gmail.com>
 <20240408230806.5ca01f62@windsurf>
In-Reply-To: <20240408230806.5ca01f62@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 8 Apr 2024 23:11:13 +0200
Message-ID: <CAPi7W825bRBjsWKYt3c5oL4QyoEc1umm7rcmVE5Ce99XLiugbQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712610685; x=1713215485; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDQtiCxCCSSpHP1CKld+l6D4OQ/zXRN5RVtksCvkhdE=;
 b=iS79FLSrEAQbFZYEpMhVP6J/jbo85lknHL8/rVLQQTLPTYLFAyJ6iywopO39oomEMs
 y3CI2Z/mMWf3bDU4nNlIrzIRN/0qluB/hxyNEZsbQbZffVoqq5ywGrCnKOzduZzinvnO
 0qXcUtCxjt97fRRUwyN8/gSKvjY3fKsm01gT2yS7Cqg5ywmEBJyEAS1eWuPoMsS+YH6s
 68QJP99aFdDRG1PzBur5gG1W+c8Tz+0s2ww+/mi3XW52hgv6dZbIUyCPJ8T+TX/wpom1
 qvfS89C27hqSZEULI3WKNSGt+BI0F47qq2mZlOXVC5arF+fyRX+aE+bgtnM6WKZGYomS
 bm9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iS79FLSr
Subject: Re: [Buildroot] [PATCH 1/1] package/privoxy: fix build with root
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBsdW4uIDggYXZyLiAyMDI0IMOgIDIzOjA4LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUaHUsICA0IEFwciAy
MDI0IDIxOjQ3OjIzICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTZXQgR1JPVVBfVCB3aGVuIGluc3RhbGxpbmcgY29uZmln
dXJhdGlvbiBmaWxlcyBhcyByb290IHRvIGF2b2lkIHRoZQo+ID4gZm9sbG93aW5nIGJ1aWxkIGZh
aWx1cmUgcmFpc2VkIHNpbmNlIGNvbW1pdAo+ID4gYjY4MTYwMzRlYmRkZDUyMmE4ZmVmOWRhYTQ1
NGMyOGZhMTIzMGRkNjoKPiA+Cj4gPiAvdXNyL2Jpbi9pbnN0YWxsOiBtaXNzaW5nIGRlc3RpbmF0
aW9uIGZpbGUgb3BlcmFuZCBhZnRlciAnL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0
LTEvdGFyZ2V0L2V0YycKPiA+Cj4gPiBGaXhlczogYjY4MTYwMzRlYmRkZDUyMmE4ZmVmOWRhYTQ1
NGMyOGZhMTIzMGRkNgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvZWI0Y2NmMjQ4YzljNTA0OGU5YjcxMDU4YmIwMzExYjFlMDc2Mzg4Mwo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+
ID4gLS0tCj4gPiAgLi4uMDAwMi1HTlVNYWtlZmlsZS5pbi1maXgtcm9vdC1pbnN0YWxsLnBhdGNo
IHwgMzUgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRp
b25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHJpdm94eS8wMDAyLUdOVU1h
a2VmaWxlLmluLWZpeC1yb290LWluc3RhbGwucGF0Y2gKPgo+IEknbSBjb25mdXNlZCBiZWNhdXNl
IHRoZSBCdWlsZHJvb3QgYnVpbGQgZG9lcyBub3QgcnVuIGFzIHJvb3QuIFNvIHdoeQo+IGRvZXMg
dGhpcyBoYXBwZW4/CgpUaGlzIG9ubHkgaGFwcGVucyB3aXRoIGFybWFidWlsZGVyIGZyb20gU8Op
YmFzdGllbiBTenltYW5za2kgYW5kIEkKYXNzdW1lIHRoYXQgdGhlIGJ1aWxkcm9vdCBidWlsZCBv
biB0aGlzIGF1dG9idWlsZGVyIHJlYWxseSBydW5zIGFzCnJvb3QuCgo+Cj4gVGhvbWFzCj4gLS0K
PiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFi
cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
