Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B3CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3251061BA3;
	Thu, 21 Aug 2025 19:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhXuN6DxCTvr; Thu, 21 Aug 2025 19:21:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17796172B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C17796172B;
	Thu, 21 Aug 2025 19:21:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F12151C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E144C40ACB
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCTywd556kGj for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDDC3409F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDDC3409F2
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDDC3409F2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso11105415e9.3
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804064; x=1756408864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Co2WpVlYDFZ2wCHcNv9h2Uyccoe8yBk9s8UWoSHFdd8=;
 b=wlYmpQX2GdulRMPkGzB/FXuj0ufS+sl0nJNHX9CzAKcgMfbgJd5fM5moSWURmFYr88
 eqWDVoLWsO16egIX/Vlk72Lvw5QEfqp7P9cUqYrJkGp8nPeYSkPyDn3TLaDHPqI5pg2j
 27cbRTM5RVRMNQ7pvepr3mvXZV8CxrrPFR3iIi4TQxVBiEi9Hsbktu9Y+lpQLmFgq9Ed
 r/NTz2s9n74aBd+6/TMMcHf+T3M/oca7WIWzO9UImflwTD5p+bL0BuH23Sei+BWdKXW5
 cMSKfFl+LfJs6jizOWxG5a+Gm4Hyh+Sf1BTLdSkKibt1HfqOl5ulRwOYKCW4VJ0cc3/a
 f/8g==
X-Gm-Message-State: AOJu0Yx+v1qGOD5ALHBhOTZoYq9By5/fsYlOr3ctHdJeHltnXWj5ks9n
 2rLIRUbJbNOS/xtbozFPkV0AXaJqtP1YWlHBCJVSoTghN7V+Le1c/qOqEs+IYOdnei3BjhVkQdT
 V/72TtHg=
X-Gm-Gg: ASbGnctJYaGHF5r9dFuJWRyYEqleOG3RHRNpoK5KF4Nt803uxwxFygIdR8cpqF7mjLj
 UnhZf1Mr8lfMovllfxsJ+oCPlMthaHdFYVuYNUH523r874u8k/AFFXOY+PTVKlAT8E9iD3CaOwn
 kppq0DC9XaQW9NQf+vUx9Qpelmu+U7U0Evk5QtJItZAlu1umwX9UW0UM0tZ/Jzbkm/vWJG/psYv
 GPqcotdSDudbZTPfUGenFOXIfrkgSe5USy2OWcKG4TeOrKz8AuV4JsSRpQeTBUpqk/5GNDWPUm0
 fRDQK+3cb4MF+pjC6uDdGViBh1Rp15bFgAWq1VyY46ahoRSn5ry88XMahMxKeQVAlKvKBcFHcsB
 kbC/ce40kpkDYJg==
X-Google-Smtp-Source: AGHT+IHe9Xsw9Y9EtaXfckDeqQr79eTA6DIm7jk/+6E+g1yFSElsItZwCTLFPsR8EArDhOUtoUlW1Q==
X-Received: by 2002:a5d:5f4b:0:b0:3b7:7563:9d59 with SMTP id
 ffacd0b85a97d-3c5dceff114mr108418f8f.57.1755804063756; 
 Thu, 21 Aug 2025 12:21:03 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077789c92sm12516718f8f.52.2025.08.21.12.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:03 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:20:54 +0200
Message-ID: <20250821192103.23981-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812171825.1942608-2-thomas.perale@mind.be>
References: <20250812171825.1942608-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804064; x=1756408864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Co2WpVlYDFZ2wCHcNv9h2Uyccoe8yBk9s8UWoSHFdd8=;
 b=EjVr2zLEyiqDIHvyJTaZMC0asGcfOUxulWQCPyhoAJkdQRTtfVvdzVLYwF7c5ia2ov
 0nLmfoKNAHZS7qT2+so6wwRduLEoKHlxmsJIiZLMAX5JCbwFFlf0JfSJLn1fdLYdSHpR
 d0VpIdDul/sAlEC1gkMiSBDFxPgkvQVTHp/8JSGiqCBCpntn5Yv6eB0sOKIkrjXqQjSI
 gHmkJBXXT5HyA1R/pgUcXcbrJz0SyMBKRlLWuC0TeJyRj/UFhRoL3aO3bH801S5Gmx7V
 fOkaTum7J2gN1yCgYqIDBDYUnb5W0fRgmGaorDf8FpnK2Kg6s4Vj53bJh8dsPK/xGueG
 jV3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EjVr2zLE
Subject: Re: [Buildroot] [PATCH 2/2] package/prboom: fix build w/ gcc-15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBwYXRjaCBmb3JjZSB0aGUgdXNhZ2Ugb2YgYC1zdGQ9Z251MThg
IGZvciBHQ0MxNSB0b29sY2hhaW5zIHRvIGZpeAo+IHRoZSBmb2xsb3dpbmcgaXNzdWVzOgo+IAo+
IC0gVGhlIGJvb2xlYW4gaXNzdWUgd2l0aCBDMjMKPiAKPiBgYGAKPiBJbiBmaWxlIGluY2x1ZGVk
IGZyb20gLi4vLi4vc3JjL2lfc291bmQuaDozOCwKPiAgICAgICAgICAgICAgICAgIGZyb20gaV9z
b3VuZC5jOjU4Ogo+IC4uLy4uL3NyYy9kb29tdHlwZS5oOjQ4OjE1OiBlcnJvcjogY2Fubm90IHVz
ZSBrZXl3b3JkIOKAmGZhbHNl4oCZIGFzIGVudW1lcmF0aW9uIGNvbnN0YW50Cj4gICAgNDggfCB0
eXBlZGVmIGVudW0ge2ZhbHNlLCB0cnVlfSBib29sZWFuOwo+ICAgICAgIHwgICAgICAgICAgICAg
ICBefn5+fgo+IC4uLy4uL3NyYy9kb29tdHlwZS5oOjQ4OjE1OiBub3RlOiDigJhmYWxzZeKAmSBp
cyBhIGtleXdvcmQgd2l0aCDigJgtc3RkPWMyM+KAmSBvbndhcmRzCj4gYGBgCj4gCj4gLSBUaGUg
dXNhZ2Ugb2YgYHVzbGVlcGAgJiBgc3RydWN0IHRpbWV6b25lYCByZXF1aXJlIHVzYWdlIG9mIEdO
VQo+ICAgZXh0ZW5zaW9ucy4KPiAKPiBgYGAKPiBpX3N5c3RlbS5jOjU4OjM6IGVycm9yOiBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh1c2xlZXDigJk7IGRpZCB5b3UgbWVhbiDi
gJhzbGVlcOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgNTggfCAg
IHVzbGVlcCh1c2Vjcyk7Cj4gICAgICAgfCAgIF5+fn5+fgo+ICAgICAgIHwgICBzbGVlcAo+IGlf
c3lzdGVtLmM6IEluIGZ1bmN0aW9uIOKAmElfR2V0VGltZV9SZWFsVGltZeKAmToKPiBpX3N5c3Rl
bS5jOjc4OjE5OiBlcnJvcjogc3RvcmFnZSBzaXplIG9mIOKAmHR64oCZIGlzbuKAmXQga25vd24K
PiAgICA3OCB8ICAgc3RydWN0IHRpbWV6b25lIHR6Owo+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgXn4KPiBpX3N5c3RlbS5jOiBJbiBmdW5jdGlvbiDigJhJX0dldFJhbmRvbVRpbWVTZWVk4oCZ
Ogo+IGlfc3lzdGVtLmM6MTA1OjE5OiBlcnJvcjogc3RvcmFnZSBzaXplIG9mIOKAmHR64oCZIGlz
buKAmXQga25vd24KPiAgIDEwNSB8ICAgc3RydWN0IHRpbWV6b25lIHR6Owo+ICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgXn4KPiBgYGAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxl
IDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjUuMDUu
eC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3ByYm9vbS9wcmJvb20ubWsgfCA0ICsrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3ByYm9vbS9wcmJvb20ubWsgYi9wYWNrYWdlL3ByYm9vbS9wcmJvb20ubWsKPiBpbmRleCBmYzQ0
MGU1Y2Y4Li5hYjlhYjA5OTEzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHJib29tL3ByYm9vbS5t
awo+ICsrKyBiL3BhY2thZ2UvcHJib29tL3ByYm9vbS5tawo+IEBAIC0xOCw2ICsxOCwxMCBAQCBp
ZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfODUxODApLHkpCj4gIFBSQk9PTV9DRkxB
R1MgKz0gLU8wCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xF
QVNUXzE1KSx5KQo+ICtQUkJPT01fQ0ZMQUdTICs9IC1zdGQ9Z251MTgKPiArZW5kaWYKPiArCj4g
IFBSQk9PTV9DT05GX0VOViArPSBDRkxBR1M9IiQoUFJCT09NX0NGTEFHUykiCj4gIAo+ICBpZmVx
ICgkKEJSMl9QQUNLQUdFX0xJQlBORykseSkKPiAtLSAKPiAyLjUwLjEKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
