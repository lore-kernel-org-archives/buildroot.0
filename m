Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAABC38150
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 02:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBD3881005;
	Mon,  8 Jul 2024 02:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xs3YVQyJUwK4; Mon,  8 Jul 2024 02:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD9680FF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD9680FF9;
	Mon,  8 Jul 2024 02:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4A5B1BF5DF
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 02:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1A2A40196
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 02:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9H0CXDFuJAVR for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 02:13:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6324F40182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6324F40182
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6324F40182
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 02:13:43 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-81065391658so54350241.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 19:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720404822; x=1721009622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBA+AaX4SG88AYb9chu3B2WgazMFXBH1Sb7ETx80pS0=;
 b=sZaJZ/Gus9Db6PK68glL0m2Jtm96N8JWpYKuG7mf+ctMPFVsuAI8SRkGYbuUl+3Xsv
 Id+Vrt7D01kDq9dZueVf1SM3PNpI86Lmv78e/E60y1K+ZEiaqvKJQy7quCYVFDETHCpo
 V0Joou+42lVWnOFW3k0lgHbs8bAWY3saxftbF7aWUEWJztrjCWrz09SBstpf+lPhzMRk
 9P1QCTR5wEU+m4PSC9GcDqsNQfxqEeq2n6ZZPNxsnTxqLoIdzq5MDSGCV9CW+a+Rurfg
 aPclyaVdhHWWSOOXcw8gRtjZiMyq0ltY7GWysvfPV9Q7W/1cug1sO4xbu6Eh643WMyZS
 7jUA==
X-Gm-Message-State: AOJu0YzQn4SmwaJpvKQhXLp3e4dVPPdSpC4Yg4zAMwOLmQsIdlP9L8CZ
 4Z4+LZ2ZphV1p0Vnkzjd6NPlj1SJ0LaKKmA1AWpHi6RaLOpGmMmuDO+vTr2UBh7gNGdmDmofBOP
 OJAAAsGDme/nTgq6iHu9FOQQMg2k=
X-Google-Smtp-Source: AGHT+IHfx+Ztm2frYfNetEhADX9gjaCFMmT5FG+YgVUxTztuIsHfI1iqS5/FOq5zixhdvGDyMYsog84NtWRA3VXfBd4=
X-Received: by 2002:a05:6102:34e7:b0:48f:df12:fb97 with SMTP id
 ada2fe7eead31-48fee6a49cfmr7000001137.9.1720404821603; Sun, 07 Jul 2024
 19:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240708013718.19051-1-zhangdongdong@eswincomputing.com>
 <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
In-Reply-To: <20240708013718.19051-2-zhangdongdong@eswincomputing.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 7 Jul 2024 20:13:30 -0600
Message-ID: <CADvTj4r-1xVwmr+W=Lyj2Ff4KZMR8znZyuAgguCt24Y46oYhkg@mail.gmail.com>
To: zhangdongdong@eswincomputing.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720404822; x=1721009622; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBA+AaX4SG88AYb9chu3B2WgazMFXBH1Sb7ETx80pS0=;
 b=FyhJV2U2PbZPHEJ2gfh1vSeCJ4Xf65PRnfO9EQHxd7g72DJvOBS+WU7HUJGeQ4uJf2
 x/lgr4nsJ7Gq3kC6PBVCm1oJ75WKt8r/V3XVd3HkKp6rOZKvzwxDB9TcBakZjLvLxue9
 eyrSbviZSib0WUNbHFjoYbdLmEp0vk6GU4r3XBwQ2rRf0uv4NbSjg07vC/JHytLYiBV/
 a1CBIwAZNHLYEUDVBIJgngAJe3bmZIvr+ySxZYgoXbUdhHg6jBK03vy2bYeXiUViWggg
 1pL8olm1RdX4J+1z3stDCLQFHxkZLMJB/g41lHzlrL+Ap0vZFNJeePjRUvEqaocGiPac
 sFEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FyhJV2U2
Subject: Re: [Buildroot] [PATCH v2 1/1] .github: add github action to
 automate PR handling
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
Cc: bonet@grenoble.cnrs.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdWwgNywgMjAyNCBhdCA3OjM44oCvUE0gPHpoYW5nZG9uZ2RvbmdAZXN3aW5jb21w
dXRpbmcuY29tPiB3cm90ZToKPgo+IEZyb206IERvbmdkb25nIFpoYW5nIDx6aGFuZ2Rvbmdkb25n
QGVzd2luY29tcHV0aW5nLmNvbT4KPgo+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgQnVpbGRyb290
IHJlcG9zaXRvcnkncyBHaXRIdWIgY29uZmlndXJhdGlvbiB0byBiZXR0ZXIKPiBtYW5hZ2UgaW5j
b21pbmcgcHVsbCByZXF1ZXN0cy4KPgo+IC0gQWRkZWQgYSBuZXcgR2l0SHViIEFjdGlvbnMgd29y
a2Zsb3cgKGByZXBvLWxvY2tkb3duLnltbGApIHRvIGF1dG9tYXRpY2FsbHkKPiAgIGhhbmRsZSBu
ZXcgcHVsbCByZXF1ZXN0cy4KPgo+IFRoZSBuZXcgd29ya2Zsb3c6Cj4gLSBUcmlnZ2VycyBvbiBu
ZXcgcHVsbCByZXF1ZXN0cy4KPiAtIFVzZXMgdGhlIGBkZXNzYW50L3JlcG8tbG9ja2Rvd25gIGFj
dGlvbiB0bzoKPiAgIC0gQ29tbWVudCBvbiB0aGUgcHVsbCByZXF1ZXN0LCBndWlkaW5nIGNvbnRy
aWJ1dG9ycyB0byB1c2UgdGhlIG1haWxpbmcgbGlzdAo+ICAgICBmb3IgcGF0Y2ggc3VibWlzc2lv
bi4KPiAgIC0gTG9jayB0aGUgcHVsbCByZXF1ZXN0IHRvIHByZXZlbnQgZnVydGhlciBkaXNjdXNz
aW9uLgo+ICAgLSBDbG9zZSB0aGUgcHVsbCByZXF1ZXN0Lgo+Cj4gVGhpcyBjaGFuZ2UgZW5zdXJl
cyB0aGF0IGNvbnRyaWJ1dG9ycyBhcmUgcHJvcGVybHkgZGlyZWN0ZWQgdG8gdGhlIHByZWZlcnJl
ZAo+IG1ldGhvZCBvZiBwYXRjaCBzdWJtaXNzaW9uIHZpYSB0aGUgbWFpbGluZyBsaXN0LCBtYWlu
dGFpbmluZyBjb25zaXN0ZW5jeSBhbmQKPiBzdHJlYW1saW5pbmcgdGhlIHJldmlldyBwcm9jZXNz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRG9uZ2RvbmcgWmhhbmcgPHpoYW5nZG9uZ2RvbmdAZXN3aW5j
b21wdXRpbmcuY29tPgo+IC0tLQo+ICAuZ2l0aHViL3dvcmtmbG93cy9yZXBvLWxvY2tkb3duLnlt
bCB8IDIzICsrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCAuZ2l0aHViL3dvcmtmbG93cy9yZXBvLWxv
Y2tkb3duLnltbAo+Cj4gZGlmZiAtLWdpdCBhLy5naXRodWIvd29ya2Zsb3dzL3JlcG8tbG9ja2Rv
d24ueW1sIGIvLmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55bWwKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmE1ZjhiZDZhOTMKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvLmdpdGh1Yi93b3JrZmxvd3MvcmVwby1sb2NrZG93bi55bWwKPiBAQCAtMCwwICsx
LDIzIEBACj4gK25hbWU6ICdSZXBvIExvY2tkb3duJwo+ICsKPiArb246Cj4gKyAgcHVsbF9yZXF1
ZXN0X3RhcmdldDoKPiArICAgIHR5cGVzOiBvcGVuZWQKPiArCj4gK3Blcm1pc3Npb25zOgo+ICsg
IHB1bGwtcmVxdWVzdHM6IHdyaXRlCj4gKwo+ICtqb2JzOgo+ICsgIGFjdGlvbjoKPiArICAgIHJ1
bnMtb246IHVidW50dS1sYXRlc3QKPiArICAgIHN0ZXBzOgo+ICsgICAgICAtIHVzZXM6IGRlc3Nh
bnQvcmVwby1sb2NrZG93bkB2NAoKQ2FuIHByb2JhYmx5IGp1c3QgdXNlIGEgZ2l0aHViIHNjcmlw
dCBhbG9uZyB0aGVzZSBsaW5lcyBvciBzb21ldGhpbmc6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYmFi
aWMvc3d1cGRhdGUvYmxvYi8yMDI0LjA1LjIvLmdpdGh1Yi93b3JrZmxvd3MvY29udHJpYnV0aW5n
LnltbAoKcHJvYmFibHkgYWxzbyBuZWVkcyBhIGNvbmRpdGlvbmFsIHNvIGl0IG9ubHkgcnVucyBv
biB0aGUgb25lIGdpdGh1YiByZXBvOgppZjogZ2l0aHViLnJlcG9zaXRvcnkgPT0g4oCYYnVpbGRy
b290L2J1aWxkcm9vdOKAmQoKPiArICAgICAgICB3aXRoOgo+ICsgICAgICAgICAgcHItY29tbWVu
dDogfAo+ICsgICAgICAgICAgICBQbGVhc2UgZG8gbm90IHN1Ym1pdCBhIFB1bGwgUmVxdWVzdCB2
aWEgR2l0SHViLiBCdWlsZHJvb3QgbWFrZXMgdXNlIG9mIGEKPiArICAgICAgICAgICAgW21haWxp
bmcgbGlzdF0oaHR0cDovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QpIGZvciBwYXRjaCBzdWJtaXNzaW9uIGFuZCByZXZpZXcuCj4gKyAgICAgICAgICAgIFNl
ZSBbc3VibWl0dGluZyB5b3VyIG93biBwYXRjaGVzXShodHRwOi8vYnVpbGRyb290Lm9yZy9tYW51
YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMpIGZvciBtb3JlIGluZm8uCj4gKwo+ICsgICAgICAg
ICAgICBUaGFua3MgZm9yIHlvdXIgaGVscCEKPiArICAgICAgICAgIGxvY2stcHI6IHRydWUKPiAr
ICAgICAgICAgIGNsb3NlLXByOiB0cnVlCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4g
LS0KPiAyLjE3LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
