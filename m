Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50708CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 20:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2990F84817;
	Wed,  3 Jun 2026 20:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdxloudXR4Sw; Wed,  3 Jun 2026 20:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FB68483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780518064;
	bh=S8Exwz4wMsN3Fcu/NY8CJ98s0TAuHN3jowjJu2Myg38=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcQEiRfX9MSNldFDg0KqZYXoxMKhe9toeSUv4jTpn0sJIkng5BvQwaWtLix44GJpM
	 +6QqgQpILyUoE83Nt7pGazp1fwmPmkBEEMaj7KBeD7s4jLWK5dC1D3FupLIu2wsDVB
	 lvGxVZO11kMIIRFXmgjt0mhROU/irlY/LzAbKxYpkPQItwhNUuc+e6T6kS0yUJfPy/
	 K+H9MdjM2zGwYdVt4fWs5aWugLOG7afcL0qsMHCpPkhekdYVYlaOZI5kGlZ9ciPiWQ
	 vthrDuV9SaPE6PT0TWb0qqnPFlUhYhbtaSINC/E99DxGnHRP2udf4Ydqytk/GW/QnZ
	 wqI6gJbqYDEzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52FB68483A;
	Wed,  3 Jun 2026 20:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43BF4192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63A6405AE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExlWBnpfW9WY for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 20:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCB3E428B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCB3E428B6
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCB3E428B6
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 20:21:00 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-963a997dea4so4622963241.2
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 13:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780518059; cv=none;
 d=google.com; s=arc-20240605;
 b=aJjHXavggr6uXgau6tYBXNnAs3NNY8dYbo/CEvvGI7Vxsck2m/8lPQ59p6jLB2IIWM
 i9q84q5U0+Xtz8FWD3Hcdse0fehcQUWXvAeEe96vHw209ohu9LL3TlfU3kJfCut0JYsE
 6RU6CC/NsDcRdDmu0CNWsfkM29/IynJD78Ck2ilVK2eKcmnPfzWviDPYBCSsMND2+J2N
 CYJBrhBvvVoJqAiy+WVNqlMDuxttxS2s84EgHYu3pyU2JAe4O7DNnJIZsc6qkOOylAL1
 RT/8bTbs+afGedEtNrkWu2KD8SsJvG12TgIFdbB2MHqhfVqLjk7V5DMzTdUSFcjJMdBy
 6i9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=c9fio16feszHzRsaNai3nkS+QAV9QOiWjNwMfmCPsdM=;
 fh=I+mOYOnLdzA1SYRTNVXm+YRwUdS8QJ2zSEKZRnrMGJw=;
 b=hQeEzZG16pcJDig77XGBD6uyOiw4DSiuqWL3aY2H17hS5HSV4DKS40GchEPcE0bDQ5
 ndLAOeGOi/ft1sj7MyX3gmvFLQpEWXvhjbF1aAJVjF8KzhyX2LnmVEb5GkHTRbn9BfES
 6772jZtSZEkBwm8exTU0OLkloGEfv0Q1IcOodAQBugfR8CXe9Lf5cHsEi5ADqO2MGxam
 TMawrgc8jwqDSjLwII4b6u0P1ER5XOc6ZSFlh+xPHnmCBmItkVkPLsGLeqhOE43t1sdq
 uMXwhxgGM9rFX3J+8krsG8bCpt5BRGB2D9KOC+DIBJYzhfTeg4do7PCb0pR5xj0p+IXs
 XaZw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780518059; x=1781122859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c9fio16feszHzRsaNai3nkS+QAV9QOiWjNwMfmCPsdM=;
 b=eIK2sbj+Adb+e8oTO02uS1HJevMDQdnnNRuLJda6EGpqvbKOd+HmJI1gv3eSmhVEc+
 Gf77uOaSWceJQCX5OCJdPxPE/c08BwtIEcX2Mic/SRYJZm+pKwDSd7MCs0rcfVHZmvV/
 wyuAvFMzIQJdWtTEDP1Z7RrJUsud6QqkuXFxNTcqDurcNNIaifcSHeM4VkjCoMFjKMa0
 VwIjpD5gygd9XKjuHOw69/u3MHfgboL8k/WtivP+YWu3XyoNR5qHXNxH+IK8IfdyCidU
 btUb+mvpLWgPxfqnqvBnEDg9u//PYQBrTzd4KYEcbNCOm8BiMZ2lQckiI2+6E6Ndmi7Z
 zDnQ==
X-Gm-Message-State: AOJu0YwmL3TkZZqwNeJR8dqiStw1XzZ5Txn+8oQgM1ZFmXF5NFRW4wnJ
 qsNAqpcwRHwKPceGvAvu/ZhKzEFS3dOO3MzNdRdYFzrC7c0CaLkH3vnEzu5SrWLLZl1Q7jIMjcc
 gSa0GRLHPeF6fgm9CLZS+H/xmLvxVPO8=
X-Gm-Gg: Acq92OFtNmqn9N0M7NHI0DODPWYQba5ZWc//O6sQ1gRkGVX7wilkx5HBCgNRUDWzjFr
 sThx5kb4FnNc2KWli0mUb8nZ1+YEtV5BvrpInhwwxQAQTWabKgYf9Ntgq6Lwx3JcGTVINl7vYbI
 mP0dmAN3iwABTGyJfBA1LKLj51PVg0Aanq0ULhw4ZYzBRcm9S83jJ9XwMPCjXlG3L9qFMkZIZ18
 HZPZvEBtSW0Nlx+92HWDmnLE/SJM83OG8UQnYoe4PD24MWKf10XDANGoI7WSX7KpA+jgAGphzoM
 MHyqL/jvIWSY4wibc7kEU/M0odgXhr23d1gnrliOZ34VQUeTyjIx6VjGe0HBBF0trGW2piyuvyz
 a160TU8qgj2xPl7C5G2ljUt0liAczT3VMfhI=
X-Received: by 2002:a05:6122:4f8c:b0:56b:9b7b:83e7 with SMTP id
 71dfb90a1353d-5a6e60c913fmr3874996e0c.7.1780518059386; Wed, 03 Jun 2026
 13:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
In-Reply-To: <20260603201439.3893380-2-ben.wolsieffer@hefring.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Jun 2026 14:20:48 -0600
X-Gm-Features: AVHnY4InxmiIE1cGtH2TBFmwOMFuAxeStD1axXz0kgYVEAErp093keUVqMY5ECE
Message-ID: <CADvTj4rTwnDwHH-wh28nL_Jn+rKgbeoNA=URHgjpVxXuH0prPA@mail.gmail.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780518059; x=1781122859; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9fio16feszHzRsaNai3nkS+QAV9QOiWjNwMfmCPsdM=;
 b=L7hdBejwsHHsL+g9wYFB3KyhaNXvInBRZxwqn5eEYRKNOoUX+KKiHx666lPbYYr3OH
 QC/PC3dYCzCVdif/2o7ROnFmZ1E3j52xlstkRBBc7mKxirCtQrm489L4651rq8dGsAt+
 KqX2p7ux8hjXBfm3Ekg8SITIJr14lJvg8Ly6OPGsoIz8RlKGga/nyut+aStQ88bgDnZv
 aHKzb54SxsztAqU11/C6NZ1HsQdRES2f1SqJ9OVNpiE9CXYCIT5OwwqLlDiJEeiyg/AG
 VIxv9vv1e70T+8eONLIOQouaMLoFiCJCt7hiQkV3oC6fv6CkZtrWZVPT747eb3VJrzpk
 V0Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=L7hdBejw
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: allow installing only
 sftp-server
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

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAyOjE14oCvUE0gQmVuIFdvbHNpZWZmZXIKPGJlbi53b2xz
aWVmZmVyQGhlZnJpbmcuY29tPiB3cm90ZToKPgo+IEl0IGlzIGNvbW1vbiB0byB1c2UgZHJvcGJl
YXIgYXMgYW4gU1NIIHNlcnZlciB3aGlsZSBwdWxsaW5nIGluIE9wZW5TU0gKPiBzZnRwLXNlcnZl
ciBmb3IgU0ZUUCBzdXBwb3J0LiBDdXJyZW50bHksIHRoaXMgcmVxdWlyZXMgaW5zdGFsbGluZyBh
bGwgb2YKPiBzc2hkLiBBZGQgYSBuZXcgQlIyX1BBQ0tBR0VfT1BFTlNTSF9TRlRQX1NFUlZFUiBv
cHRpb24gdG8gYWxsb3cKPiBpbnN0YWxsaW5nIGp1c3Qgc2Z0cC1zZXJ2ZXIuIFRoaXMgaXMgZW5h
YmxlZCBieSBkZWZhdWx0IGJ5Cj4gQlIyX1BBQ0tBR0VfT1BFTlNTSF9TRVJWRVIgdG8gbWFpbnRh
aW4gYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuCgpGWUkgeW91IGNhbiBhbHNvIHVzZSBCUjJfUEFD
S0FHRV9HRVNGVFBTRVJWRVIgd2l0aCBkcm9wYmVhci4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4g
V29sc2llZmZlciA8YmVuLndvbHNpZWZmZXJAaGVmcmluZy5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uv
b3BlbnNzaC9Db25maWcuaW4gIHwgOCArKysrKysrLQo+ICBwYWNrYWdlL29wZW5zc2gvb3BlbnNz
aC5tayB8IDggKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNzaC9Db25maWcuaW4g
Yi9wYWNrYWdlL29wZW5zc2gvQ29uZmlnLmluCj4gaW5kZXggMjU4NDM0NDdhNy4uYmExZDlkMTc4
MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29wZW5zc2gvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9vcGVuc3NoL0NvbmZpZy5pbgo+IEBAIC0yNCw3ICsyNCwxMyBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfT1BFTlNTSF9TRVJWRVIKPiAgICAgICAgIGRlZmF1bHQgeQo+ICAgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQlhDUllQVCBpZiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPiAgICAgICAg
IGhlbHAKPiAtICAgICAgICAgU2VydmVyIHByb2dyYW1zOiBzc2hkLCBzZnRwLXNlcnZlcgo+ICsg
ICAgICAgICBTZXJ2ZXIgcHJvZ3JhbXM6IHNzaGQsIHNzaGQtc2Vzc2lvbiwgc3NoZC1hdXRoCj4g
Kwo+ICtjb25maWcgQlIyX1BBQ0tBR0VfT1BFTlNTSF9TRlRQX1NFUlZFUgo+ICsgICAgICAgYm9v
bCAiU0ZUUCBzZXJ2ZXIiCj4gKyAgICAgICBkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfT1BFTlNT
SF9TRVJWRVIKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgU0ZUUCBzZXJ2ZXIgcHJvZ3JhbXM6
IHNmdHAtc2VydmVyCj4KPiAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TU0hfS0VZX1VUSUxTCj4g
ICAgICAgICBib29sICJrZXkgdXRpbGl0aWVzIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5z
c2gvb3BlbnNzaC5tayBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4gaW5kZXggOGY0NmQ4
ODZkYy4uMTIzMmYxNDBkOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29wZW5zc2gvb3BlbnNzaC5t
awo+ICsrKyBiL3BhY2thZ2Uvb3BlbnNzaC9vcGVuc3NoLm1rCj4gQEAgLTExOSw3ICsxMTksNiBA
QCBpZmVxICgkKEJSMl9QQUNLQUdFX09QRU5TU0hfU0VSVkVSKSx5KQo+ICBkZWZpbmUgT1BFTlNT
SF9JTlNUQUxMX1NFUlZFUl9QUk9HUkFNUwo+ICAgICAgICAgJChJTlNUQUxMKSAtRCAtbSAwNzU1
ICQoQEQpL3NzaGQgJChUQVJHRVRfRElSKS91c3Ivc2Jpbi9zc2hkCj4gICAgICAgICAkKElOU1RB
TEwpIC1EIC1tIDA3NTUgJChARCkvc3NoZC1zZXNzaW9uICQoVEFSR0VUX0RJUikvdXNyL2xpYmV4
ZWMvc3NoZC1zZXNzaW9uCj4gLSAgICAgICAkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChARCkvc2Z0
cC1zZXJ2ZXIgJChUQVJHRVRfRElSKS91c3IvbGliZXhlYy9zZnRwLXNlcnZlcgo+ICAgICAgICAg
JChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQpL3NzaGQtYXV0aCAkKFRBUkdFVF9ESVIpL3Vzci9s
aWJleGVjL3NzaGQtYXV0aAo+ICBlbmRlZgo+ICBPUEVOU1NIX1BPU1RfSU5TVEFMTF9UQVJHRVRf
SE9PS1MgKz0gT1BFTlNTSF9JTlNUQUxMX1NFUlZFUl9QUk9HUkFNUwo+IEBAIC0xMzYsNiArMTM1
LDEzIEBAIGRlZmluZSBPUEVOU1NIX0lOU1RBTExfSU5JVF9TWVNWCj4gIGVuZGVmCj4gIGVuZGlm
Cj4KPiAraWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOU1NIX1NGVFBfU0VSVkVSKSx5KQo+ICtkZWZp
bmUgT1BFTlNTSF9JTlNUQUxMX1NGVFBfU0VSVkVSX1BST0dSQU1TCj4gKyAgICAgICAkKElOU1RB
TEwpIC1EIC1tIDA3NTUgJChARCkvc2Z0cC1zZXJ2ZXIgJChUQVJHRVRfRElSKS91c3IvbGliZXhl
Yy9zZnRwLXNlcnZlcgo+ICtlbmRlZgo+ICtPUEVOU1NIX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9P
S1MgKz0gT1BFTlNTSF9JTlNUQUxMX1NGVFBfU0VSVkVSX1BST0dSQU1TCj4gK2VuZGlmCj4gKwo+
ICBpZmVxICgkKEJSMl9QQUNLQUdFX09QRU5TU0hfS0VZX1VUSUxTKSx5KQo+ICBkZWZpbmUgT1BF
TlNTSF9JTlNUQUxMX0tFWV9VVElMUwo+ICAgICAgICAgJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQo
QEQpL3NzaC1rZXlnZW4gJChUQVJHRVRfRElSKS91c3IvYmluL3NzaC1rZXlnZW4KPiAtLQo+IDIu
NTQuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
