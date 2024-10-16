Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7152D206B5
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 14:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C8AD80D6B;
	Wed, 16 Oct 2024 14:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUgz_ORk1dFD; Wed, 16 Oct 2024 14:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A6C180D71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A6C180D71;
	Wed, 16 Oct 2024 14:21:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6321BF2C0
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 14:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5545140201
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 14:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twS9_UdRN_Pc for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 14:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56D4F401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56D4F401CC
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56D4F401CC
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 14:21:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so4322302e87.0
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 07:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729088502; x=1729693302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xb4u+v7q8djwWTjPyYHqLRhPWBROEqW8Mt9KzMENaOQ=;
 b=jghflW8oJuTRdyc08CfZrO2/H7o1W6+3yZ4RCnOGvxqL759CsCkQbnLDrhQLnEMpKb
 NAvBAhNYG2YopQam7Nazj3GcRI7KumenTEdNy86D5/dswq9wXcWj9CSEzB7+SK/a43Z8
 9Hnml4RvWcplvgO9dDW/dPqWRlGCl7TWnAQzkyUmQ61azHhikuM0OJxP9Kd/VcMvImfX
 YHdk83f4l+TowfKuST+7MP6T9HyAv+q/OhB5+Ha0Ai6uo6+siF6Jv6PjVtLMVlowFv/R
 jfAjbWVkGmCA4IG/zeGERmdMHOe2x9PO+zU4lnMu71nZ4O7N4cQh8SNArfW+DC+8Qzw0
 F/qA==
X-Gm-Message-State: AOJu0YwRdePFyVk9kDOye/Au8DEhNqYSmVqW5yE1jJ+/PbY9vBh4mmyx
 G1co39z10ijKK4xwh1GvsvZc9MuI9p6Lp59rmyQGByBgkcDtF3B+0thKRRTXQ0Xk8U3lufYUhDz
 G0/+p4Tv307Z76Lyncsbvky/ED4m0qg==
X-Google-Smtp-Source: AGHT+IHDI9DJrVn3NQKXzYArHIBNBmaEe1XttFQsnw3l/A3kC8YjWABwiG+GvtSHjXMd7a1bNzkh3SPLLP2xsxnErE4=
X-Received: by 2002:a05:6512:228b:b0:539:e12c:bba7 with SMTP id
 2adb3069b0e04-539e12cbe5dmr8944485e87.12.1729088501109; Wed, 16 Oct 2024
 07:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
 <20241016124537.2645119-3-ludwig.kormann@ict42.de>
In-Reply-To: <20241016124537.2645119-3-ludwig.kormann@ict42.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Oct 2024 11:21:28 -0300
Message-ID: <CAOMZO5Bw4WEUL9692jEd1bS6e_NRugNzaAxd96neyGiBsamxCQ@mail.gmail.com>
To: Ludwig Kormann <ludwig.kormann@ict42.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729088502; x=1729693302; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xb4u+v7q8djwWTjPyYHqLRhPWBROEqW8Mt9KzMENaOQ=;
 b=OwcV96MA+pc3PCm+k/AmusVwGI4YjG19AcdzcLx/bADmXwQ0pWCVqiHznilVTc5jXx
 HQnEWkQzF+cPm6/r/3to76mdGVFHOsUkSvmLcVGQ9Uz0N5ZRDtWkj3W7eF1hBZ5iQm4+
 iPgIZmIGw9fd6PQiuwWmRyYTnpmPzw3WwmTwqrxo9Xmr5Ojy4sScaqTnOERoBFGDKx0y
 iv56Mg90fqBcefndoKVqRnfCZJeoXdpXiOfmapzbp+coITrZRrUWj8J3H4niISfcz8JM
 trf6cAOr67U9YBkO1UMHMHvAlrjEb8v3OdmRg6UCDMg8l1m8aV7ypx88paC5csIIkGLT
 rHRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OwcV96MA
Subject: Re: [Buildroot] [PATCH v2 3/3] configs/icnova-a20-adb4006: add
 uboot patch for reliable bootclk
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTHVkd2lnLAoKT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgOTo0NeKAr0FNIEx1ZHdpZyBLb3Jt
YW5uIDxsdWR3aWcua29ybWFubkBpY3Q0Mi5kZT4gd3JvdGU6Cgo+ICtGcm9tIDNjZGY4YWEzZmY0
NWUzNWEyMzcyODVjMTA3Nzg1YmMzZDJjNjk3NmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4g
K0Zyb206IEx1ZHdpZyBLb3JtYW5uIDxsdWR3aWcua29ybWFubkBpY3Q0Mi5kZT4KPiArRGF0ZTog
V2VkLCAzMSBKYW4gMjAyNCAxMToyODoxOSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHN1bnhp
OiBzdW40aTogUmVkdWNlIGNwdSBjbG9jayBhdCBTUEwgaW5pdGlhbGl6YXRpb24gdG8gMTQ0Cj4g
KyBNSHoKPiArCj4gK1VwIHVudGlsIG5vdyBjcHUgY2xvY2sgZ2V0cyBpbml0aWFsaXplZCBhdCAz
ODQgTUh6LCB3aGljaCBpcwo+ICt0aGUgaGlnaGVzdCBzdXBwb3J0ZWQgY3B1IGNsb2NrLgo+ICsK
PiArUmVjZW50IEEyMCBiYXRjaGVzIHNob3cgYW4gaW5jcmVhc2VkIHBlcmNlbnRhZ2Ugb2YgbW9k
dWxlcwo+ICtyZWFjdGluZyB2ZXJ5IHNlbnNpdGl2ZSB0byBvcGVyYXRpbmcgY29uZGl0aW9ucyBv
dXRzaWRlIHRoZQo+ICtzcGVjaWZpY2F0aW9ucy4KPiArCj4gK1RoZSBjcHUgZGllcyB2ZXJ5IHNo
b3J0bHkgYWZ0ZXIgUExMcywgY29yZSBmcmVxdWVuY3kgb3IgY3B1Cj4gK3ZvbHRhZ2UgYXJlIG1p
c3Njb25maWd1cmVkLiBFLmcuOgo+ICstIHVib290IFNQTCBzZWxlY3RzIDM4NCBNSHogYXMgY3B1
IGNsb2NrIHdoaWNoIHJlcXVpcmVzIGEgY3B1Cj4gKyAgdm9sdGFnZSBvZiBhdCBsZWFzdCAxLjEg
Vi4KPiArLSBMaW51eCBDUFUgRnJlcXVlbmN5IHNjYWxpbmcgd2l0aCBtb3N0IHN1bjdpIGR0cyB3
aWxsIHJlZHVjZQo+ICsgIGNwdSB2b2x0YWdlIGRvd24gdG8gMS4wIFYuCj4gKy0gV2hlbiBpbnRp
YXRpbmcgYSByZWJvb3Qgb3IgcmVzZXQgZnJvbSBsaW51eCB0aGUgY3B1IHZvbHRhZ2UKPiArICBt
YXkga2VlcCB0aGUgMS4wIFYgY29uZmlndXJhdGlvbiBhbmQgdGhlIGNwdSBkaWVzIGR1cmluZyBT
UEwKPiArICBpbml0aWFsaXphdGlvbi4KPiArCj4gK1RoZXJlZm9yZSByZWR1Y2UgY3B1IGNsb2Nr
IGF0IHVib290IFNQTCBpbml0aWFsaXphdGlvbiBkb3duCj4gK3RvIDE0NCBNSHogZnJvbSAzODQg
TUh6Lgo+ICsKPiArU2lnbmVkLW9mZi1ieTogTHVkd2lnIEtvcm1hbm4gPGx1ZHdpZy5rb3JtYW5u
QGljdDQyLmRlPgo+ICtVcHN0cmVhbTogTm90IEFwcGxpY2FibGUKCldoeSBpcyB0aGlzIG5vdCBh
cHBsaWNhYmxlIHRvIFUtQm9vdCB1cHN0cmVhbT8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
