Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA1C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6262460E34;
	Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru003vgADi93; Fri, 11 Jul 2025 10:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8177E60BBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8177E60BBD;
	Fri, 11 Jul 2025 10:44:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3FB2199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA81740DBA
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh-CbhA-6hPH for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9B9040DA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B9040DA2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9B9040DA2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so3478125e9.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230667; x=1752835467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7SZpWkT5mCP07f8gYPzD0SmPoj7W0ZXFWepWkI+GXM=;
 b=i8/v+Zzoxj2yqPp66i2DFcpF9kNeERnGOmyUo8OQn94ncjJqpI2LD0CjmaOHDckZv+
 82j3V26+IA+aE2fz73cY/S9AKIOOzHovxn47PiVuysigerZVpZPQfQfrLfWO0JVwvBc+
 mJXCCqOtr0iHBjic5Ez7wa55n+UCix5GO9h8gOVm1P+GdlJA2Aad+KPbTFxJ7Cgw/Q0L
 D845WZrq9jxARDNBVy2cmieHcOStsha8Er1eDBSdHCum+uUKFYaQwVNLU8VOLtYGP61G
 8r6e15LX9owbDGE6z/54N96xaBfjttp4Bb5fzR555lu4lH+7KrIcti5+E5LRuC7VT0Cc
 Vl5Q==
X-Gm-Message-State: AOJu0Yyrj+zxy/lRvdXpt3lDZdW2b18Id+mGY6dp26G47HWDnolZJg9s
 XpWRWXT2mZmqho721k/veHp0pR5UG6AB6fCdP5bk0AV8Splpu2CfYPnWXHt2ZxkzjlwVyXd26Se
 g6Wga
X-Gm-Gg: ASbGncurFA206DoGzOthKLiRyIx9B0n4/7Kj8CKBE/hpcz0PL9zIb3mgA8+eoR+1FdQ
 v31AfR2dlySeZUPcLvC+mCbUpfn5TVKL0NeIrlrgqQ/2veQqbGesKQyg+MBxP7so15Dfg3Tf/XJ
 w0hcyjFdGNPpI04EQzCIyYr9uAx1+ti/BIgVEccb2u1ean4BRfQ/jCC50rUPiHUzpMNmErk0mAo
 wbgwMcFiSWHDeGzHZUDI6d8kE856GAliLpZDHDws3zobODtJ62bQqRIxr1WIMJ2Irr3gZp3abCh
 oK3tc2aenWW3Y6bcbwryeGddwNScHt5yW8moU7qDI7WVPQpoM6FtpLcOiUv3/yaHNZyozLk1Nvi
 pE+nR3uQQNROfFg==
X-Google-Smtp-Source: AGHT+IEVBPeYvPXcPIxt1868hpr7QEZmoqc4tYB5eealD96UC4UIbawfGflrf+nTjsklSOlSF6gZRw==
X-Received: by 2002:a05:600c:3b05:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-454ec16cc0fmr26097365e9.13.1752230667133; 
 Fri, 11 Jul 2025 03:44:27 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-455f6794a00sm516505e9.37.2025.07.11.03.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:26 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:15 +0200
Message-ID: <20250711104425.822880-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250629200944.889177-1-thomas.perale@mind.be>
References: <20250629200944.889177-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230667; x=1752835467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7SZpWkT5mCP07f8gYPzD0SmPoj7W0ZXFWepWkI+GXM=;
 b=SOoFhqQRzb++JD/GGC6mVqhcRJ2wPR1CG4iR/GAjrkq5xZY/b6rGkSdu3c7NSwN18x
 J798HQUmC6chCbxhRqaY3o671HXL9p4VUmfPYCGZf/wVthepIsZLIu/vWwOmWUHbAFeo
 uV19gj9dlG0hPj60Vz9ZCPHsqlCFhcYtnXzdwzvi7n+qLiCVA5kjakhCKXkplYj6doDL
 MvNmylevuXdUqKnlIztNDj4tCTe4049STv4fwSc3RbMmFf3bnGALAbeWC5EZlxDX5rs5
 EtsE2CUCufo+PqwHt0PpC8ERo4e4A7kzLEW/sQGX6DddiED1JOLkBWZQbRabEk8OY+YN
 ckug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SOoFhqQR
Subject: Re: [Buildroot] [PATCH 1/1] package/kvmtool: fix build failure w/
 musl
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

SW4gcmVwbHkgb2Y6Cj4gVGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnMgb24gdGhlIGF1dG9idWls
ZGVyIGZvciBidWlsZHMgd2l0aCBtdXNsCj4gbGliYy4KPiAKPiBgYGAKPiAgIENDICAgICAgIHV0
aWwvYml0bWFwLm8KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9iaXRtYXAu
aDo3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSB1dGlsL2JpdG1hcC5jOjk6Cj4gaW5jbHVkZS9s
aW51eC9iaXRvcHMuaDo0OjEwOiBmYXRhbCBlcnJvcjogYml0cy93b3Jkc2l6ZS5oOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgIDQgfCAjaW5jbHVkZSA8Yml0cy93b3Jkc2l6ZS5oPgo+
ICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KPiBgYGAKPiAKPiBUaGUgZXJyb3Ig
b2NjdXJzIGJlY2F1c2UgYml0cy93b3Jkc2l6ZS5oIGlzIHNwZWNpZmljIHRvIGdsaWJjLgo+IAo+
IFRoaXMgcGF0Y2ggYXBwbGllcyBhbiB1cHN0cmVhbSBmaXggdGhhdCByZXBsYWNlcyB0aGUgdXNl
IG9mIF9fV09SRFNJWkUKPiB3aXRoIGFuIGludGVybmFsIG1hY3JvLCBtYWtpbmcgdGhlIGNvZGUg
cG9ydGFibGUgYWNyb3NzIGRpZmZlcmVudCBsaWJjLgo+IAo+IEZpeGVzOiBodHRwczovL2F1dG9i
dWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMzBkLzMwZDZlNDA3ZTZhMGZjN2Q4NTA2MmMyZDU2
MDA4NzU1YzcwY2E3MzMvYnVpbGQtZW5kLmxvZwo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJh
bGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNS4w
NS54LiBUaGFua3MKCj4gLS0tCj4gIC4uLmUtaC1pbmNsdXNpb24tZm9yLW11c2wtY29tcGF0aWJp
bGl0eS5wYXRjaCB8IDUyICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUy
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uva3ZtdG9vbC8wMDAx
LXJlbW92ZS13b3Jkc2l6ZS1oLWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNo
Cj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtdG9vbC8wMDAxLXJlbW92ZS13b3Jkc2l6ZS1o
LWluY2x1c2lvbi1mb3ItbXVzbC1jb21wYXRpYmlsaXR5LnBhdGNoIGIvcGFja2FnZS9rdm10b29s
LzAwMDEtcmVtb3ZlLXdvcmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHku
cGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjMxMjhhMjM2
ODkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9rdm10b29sLzAwMDEtcmVtb3ZlLXdv
cmRzaXplLWgtaW5jbHVzaW9uLWZvci1tdXNsLWNvbXBhdGliaWxpdHkucGF0Y2gKPiBAQCAtMCww
ICsxLDUyIEBACj4gK0Zyb20gMDU5MmY4ZjgyOWM4NDNmZjVjYjJkMTA4YzMwOWUzMmY0ZjZmNTM3
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJl
LnByenl3YXJhQGFybS5jb20+Cj4gK0RhdGU6IFRodSwgMSBBdWcgMjAyNCAxMjoxMDo1NCArMDEw
MAo+ICtTdWJqZWN0OiByZW1vdmUgd29yZHNpemUuaCBpbmNsdXNpb24gKGZvciBtdXNsIGNvbXBh
dGliaWxpdHkpCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+
ICtUaGUgd29yZHNpemUuaCBoZWFkZXIgZmlsZSBhbmQgdGhlIF9fV09SRFNJWkUgZGVmaW5pdGlv
biBkbyBub3Qgc2VlbQo+ICt0byBiZSB1bml2ZXJzYWwsIHRoZSBtdXNsIGxpYmMgZm9yIGluc3Rh
bmNlIGhhcyB0aGUgZGVmaW5pdGlvbiBpbiBhCj4gK2RpZmZlcmVudCBoZWFkZXIgZmlsZS4gVGhp
cyBicmVha3MgY29tcGlsYXRpb24gb2Yga3ZtdG9vbCBhZ2FpbnN0IG11c2wuCj4gKwo+ICtUaGUg
dHdvIGxlYWRpbmcgdW5kZXJzY29yZXMgc3VnZ2VzdCBhIGNvbXBpbGVyLWludGVybmFsIHN5bWJv
bCBhbnl3YXksIHNvCj4gK2xldCdzIGp1c3QgcmVtb3ZlIHRoYXQgcGFydGljdWxhciBtYWNybyB1
c2FnZSBlbnRpcmVseSwgYW5kIHJlcGxhY2UgaXQKPiArd2l0aCB0aGUgbnVtYmVyIHdlIHJlYWxs
eSB3YW50OiB0aGUgc2l6ZSBvZiBhICJsb25nIiB0eXBlLgo+ICsKPiArUmVwb3J0ZWQtYnk6IEou
IE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gK1NpZ25lZC1vZmYtYnk6IEFu
ZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPgo+ICtSZXZpZXdlZC1ieTogQWxl
eGFuZHJ1IEVsaXNlaSA8YWxleGFuZHJ1LmVsaXNlaUBhcm0uY29tPgo+ICtMaW5rOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjQwODAxMTExMDU0LjgxODc2NS0xLWFuZHJlLnByenl3YXJh
QGFybS5jb20KPiArU2lnbmVkLW9mZi1ieTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4K
PiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3dpbGwva3ZtdG9vbC5naXQvY29tbWl0Lz9pZD0wNTkyZjhmODI5Yzg0M2ZmNWNiMmQxMDhj
MzA5ZTMyZjRmNmY1Mzc5Cj4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5w
ZXJhbGVAbWluZC5iZT4KPiArLS0tCj4gKyBpbmNsdWRlL2xpbnV4L2JpdG9wcy5oIHwgNiArKy0t
LS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9iaXRvcHMuaCBiL2luY2x1ZGUvbGludXgv
Yml0b3BzLmgKPiAraW5kZXggYWUzMzkyMmYuLmVlOGZkNTYwIDEwMDY0NAo+ICstLS0gYS9pbmNs
dWRlL2xpbnV4L2JpdG9wcy5oCj4gKysrKyBiL2luY2x1ZGUvbGludXgvYml0b3BzLmgKPiArQEAg
LTEsMTUgKzEsMTMgQEAKPiArICNpZm5kZWYgX0tWTV9MSU5VWF9CSVRPUFNfSF8KPiArICNkZWZp
bmUgX0tWTV9MSU5VWF9CSVRPUFNfSF8KPiArIAo+ICstI2luY2x1ZGUgPGJpdHMvd29yZHNpemUu
aD4KPiArLQo+ICsgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsgI2luY2x1ZGUgPGxpbnV4
L2NvbXBpbGVyLmg+Cj4gKyAjaW5jbHVkZSA8YXNtL2h3ZWlnaHQuaD4KPiArIAo+ICstI2RlZmlu
ZSBCSVRTX1BFUl9MT05HIF9fV09SRFNJWkUKPiArICNkZWZpbmUgQklUU19QRVJfQllURSAgICAg
ICAgICAgOAo+ICstI2RlZmluZSBCSVRTX1RPX0xPTkdTKG5yKSAgICAgICBESVZfUk9VTkRfVVAo
bnIsIEJJVFNfUEVSX0JZVEUgKiBzaXplb2YobG9uZykpCj4gKysjZGVmaW5lIEJJVFNfUEVSX0xP
TkcgICAgICAgICAgIChCSVRTX1BFUl9CWVRFICogc2l6ZW9mKGxvbmcpKQo+ICsrI2RlZmluZSBC
SVRTX1RPX0xPTkdTKG5yKSAgICAgICBESVZfUk9VTkRfVVAobnIsIEJJVFNfUEVSX0xPTkcpCj4g
KyAKPiArICNkZWZpbmUgQklUX1dPUkQobnIpCQkoKG5yKSAvIEJJVFNfUEVSX0xPTkcpCj4gKyAK
PiArLS0gCj4gK2NnaXQgMS4yLjMta29yZwo+ICsKPiAtLSAKPiAyLjUwLjAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
