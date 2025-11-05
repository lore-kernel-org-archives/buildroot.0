Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73015CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F09A840EF;
	Wed,  5 Nov 2025 22:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmDYrxhpOwXo; Wed,  5 Nov 2025 22:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21A08841ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21A08841ED;
	Wed,  5 Nov 2025 22:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 546DB462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 460A54104C
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uundrX4MGY1P for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28BEA408C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BEA408C9
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28BEA408C9
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:31:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-429b72691b4so273028f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Nov 2025 14:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762381907; x=1762986707;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X4HnfZegZFJpvVNeFWgxmURC5+5VF5QcCBbK18sANVY=;
 b=ZYvngKw9Q+Q02An0Awqd2b8N7oXILJnpXEuGC9OWKy33CA6Gj1bMIqlVtcavx60pyR
 IPiS0ulh6X6ZPtHEW6RvHCFqgHr3Sm5N75cyuWRvfFVZf6jFbgwFc1Ayny2T1gP5CM/t
 Y6L9mQ0prnfsHhL1EmL2QIqqYvpeku15DxBAmp9SDQClvjbosS+JIus4jwx/n8a9SM6v
 wlA5KX7FqThi3ids56MYuRtO+MBPmPE8fRqQKPNK6xeOIjrjgvcDdljaltR5OZ5HmG3B
 5bVKhic0Q93fnQCXpZP8PtEFpva4Y+TmwL5nXtAgFaE2JZlGH0CHv+iipdd8k10dDLbC
 QLXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW38gHnFcZdAwyPhdOTEzAdes6HnReTBBeyGsZ4cMP+PCVz3X5tRqsmGaY/jeD6DJtpTGCyJ2yK5GU=@buildroot.org
X-Gm-Message-State: AOJu0YwS9dUBESS2U2xZMI/6qdXGqMDsEuxwonfStqt/TNSIrh1Wvwv7
 8M2YLbXX4W744Wc/Oea//Eb4oScnUGSXTH3+WxyTOP7ppISbjseuA6wx6t5zV+UNcGNE/lUIpcJ
 g2qGU5sw1gw==
X-Gm-Gg: ASbGncs5DHP7RTMoqyXvTwk+7N4yJXOqKP0/QcfaJ/6u4+u3/Fn2jDFmrJdcbbPkp+w
 TGODr0iGU/Zt8pruQGH24PJJ48oA17uRUzVvkw9fQnQlCMaBl4G/eWCP36wvX+HkvNTGggWBbku
 ONKbrrBQJ/dVnPpMPv606+F7Vyw6G8KgMwxgpO+gOC+kZa+QQ3xepC3xH6U5h47AD50pQRBPbPw
 8Jasd4dCQZrsHrOIKIkqssWqg3Pn8rJe1Hi/RZJX6nP085i/okkfaIrOkDUGyEGGLTGwmnMPDHx
 A+rSu1LRnZGcwlTxh1ZN1ny7KeCI9PvsZ3jqIfcZdtnoxHCO3ePNFhlxXknC3gjbRwpr0TKXqEn
 VfNlEKS4HlOuck57DK8K6OPUkGmZM+vQTqKu4PgsscYhFvmGtRM6wSyUm35c1ywyDEnFT11lQba
 UbaU+HxsjJj002xpnmGLmt1DxjeLtGaYibvZr5U6XgFw+BnoTSBm6aS7Oc+OSpTFS3Mt5kW5uA2
 W7cCgnzRgdE1naJz7wwAc9d8CFpWIbRtRHgMEWCLJT1+y/i90+iEg==
X-Google-Smtp-Source: AGHT+IH70KOHGq1OIPcWDHg/DtOp6uYqBd58FfFwHT6cEy59bZAM224hVk4cADCyUyBGyES0qKvFSQ==
X-Received: by 2002:a05:6000:2890:b0:427:697:c2db with SMTP id
 ffacd0b85a97d-429e32e5186mr4512660f8f.20.1762381906971; 
 Wed, 05 Nov 2025 14:31:46 -0800 (PST)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb403747sm1099786f8f.4.2025.11.05.14.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 14:31:46 -0800 (PST)
Message-ID: <ed4d6140-c07f-4693-af0d-1d3d309b8ae2@smile.fr>
Date: Wed, 5 Nov 2025 23:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Arnout Vandecappelle
 <arnout@mind.be>, Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
Content-Language: fr
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1762381907; x=1762986707; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X4HnfZegZFJpvVNeFWgxmURC5+5VF5QcCBbK18sANVY=;
 b=ow9/dBd5U8gvvwqLUxYdFAOnxp4NxLLVPzNM7UFOa5x3H0fMrvOQd8dpH9MLyHqdIv
 tny98RntA5zmyKIIcqDeSY/2bj8sWExqQXat6B8WwKmloqc+BlRlB7mK75K9/jriQMgC
 xIMh7PCmkOpk2693yq6eh2WQ/UA/64Qt4mP3I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ow9/dBd5
Subject: Re: [Buildroot] [PATCH 00/18 v3] system: add support for merged-bin
 (branch yem/merged-bin)
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDEvMDkvMjAyNSDDoCAxMTowMSwgWWFubiBFLiBNT1JJTiB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8gQWxsIQo+IAo+IFRoaXMgc2VyaWVzIGlu
dHJvZHVjZXMgc3VwcG9ydCBmb3Igc28tY2FsbGVkIG1lcmdlZC1iaW4sIHdoZXJlIC91c3Ivc2Jp
bgo+IGlzIG1lcmdlZCB3aXRoIC91c3IvYmluLCBhcyBhbiBleHRyYSBzdGVwIGFmdGVyIG1lcmdl
ZC11c3IsIG5vdyBqdXN0Cj4gcmVxdWVzdGVkLCBidXQgaW4gdGhlIGZ1dHVyZSByZXF1aXJlZCwg
Ynkgc3lzdGVtZC4KPiAKPiBUaGUgc2VyaWVzIGlzIG9yZ2FuaXNlZCBpbiBhIGZldyBzdGVwczoK
PiAKPiAgMS4gcGF0Y2hlcyAxLTMgYXJlIGNsZWFudXBzIGluIHRoZSBLY29uZmlnIG1lbnUsIHJl
bGF0ZWQgdG8gdGhlCj4gICAgIG1lcmdlZC11c3IgcHJvbXB0LCB0byB0aGUgZGVmYXVsdHMgZm9y
IFBBVEgsIGFuZCB0byB0aGUgcmF0aW9uYWxlCj4gICAgIGZvciBzZWxlY3RpbmcgbWVyZ2VkLXVz
ciB3aXRoIHN5c3RlbWQ7IHRob3NlIGNhbiBiZSBhcHBsaWVkIHdpdGhvdXQKPiAgICAgY29uc2lk
ZXJpbmcgdGhlIHJlc3Qgb2YgdGhlIHNlcmllczsKPiAKPiAgMi4gdGhlbiBwYXRjaGVzIDQtOSBw
cmVwYXJlIHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQtdXNyLnNoIHRvCj4gICAgIGNoZWNr
IGZvciBtb3JlIHRoYW4gbWVyZ2VkLXVzcjogYSBnb29kIGNsZWFudXAsIGFuZCBiZXR0ZXIgY2hl
Y2sgdGhlCj4gICAgIG1lcmdlZCBzdGF0ZTsgdGhvc2UgcGF0Y2ggY2FuIGFsc28gYmUgYXBwbGll
ZCB3aXRob3V0IGNvbnNpZGVyaW5nCj4gICAgIHRoZSByZXN0IG9mIHRoZSBzZXJpZXM7Cj4gCj4g
IDMuIHdpdGggcGF0Y2hlcyA5LTEyLCBzdXBwb3J0IGZvciBtZXJnZWQtYmluIGlzIGFkZGVkLCBh
bmQgdGhlIG1lcmdlCj4gICAgIGxldmVsIG9mIHNrZWxldG9uIGFuZCBvdmVybGF5cyBwcm9wZXJs
eSBlbmZvcmNlZCB0byBtYXRjaCB0aGUKPiAgICAgY29uZmlndXJlZCBtZXJnZSBzZXR1cDsgdGhv
c2UgcmVxdWlyZSB0aGUgdHdvIHNldCBvZiBwYXRjaGVzIGFib3ZlCj4gICAgIHRvIGJlIGFwcGxp
ZWQgZmlyc3Q7Cj4gCj4gIDQuIHRoZW4sIHBhdGNoZXMgMTMtMTcgaW50cm9kdWNlIHdvcmthcm91
bmRzIGZvciBhIGZldyBwYWNrYWdlcyB0bwo+ICAgICBwcm9wZXJseSBzdXBwb3J0IG1lcmdlZC1i
aW4uIEZvciBlYXNlIG9mIHJldmlldywgdGhvc2UgYXJlIHNlcGFyYXRlCj4gICAgIHBhdGNoZXMs
IGJ1dCB0aGF0IG1lYW5zIHRoZSBzZXJpZXMgX21heV8gYnJlYWsgaWYgdGhlIG1lcmdlZC1iaW4K
PiAgICAgc3VwcG9ydCBpcyBhcHBsaWVkIGJ1dCBub3QgdGhlc2UgcGVyLXBhY2thZ2Ugd29ya2Fy
b3VuZHM7IHRoZXNlCj4gICAgIHJlcXVpcmUgdGhhdCBhbGwgcGF0Y2hlcyBhYm92ZSBiZSBhcHBs
aWVkIGZpcnN0LCBvZiBjb3Vyc2U7CgpUaGVzZXMgd29ya2Fyb3VuZCBhbHJlYWR5IHVzZXMgQlIy
X1JPT1RGU19NRVJHRURfQklOIG9wdGlvbiwgc28gd2UgY2FuJ3QgZWFzaWx5CnJlLW9yZGVyIHRo
ZSBzZXJpZXMgYmVmb3JlIGFkZGluZyBtZXJnZWQtYmluIGNvbW1pdC4KClRoZSBzZXJpZXMgYnJl
YWtzIG9ubHkgd2l0aCB0aGUgbmV3IEJSMl9ST09URlNfTUVSR0VEX0JJTiBvcHRpb24gYWxyZWFk
eQplbmFibGVkLCBzbyBleGlzdGluZyBkZWZjb25maWcgc2hvdWxkIHdvcmtzIGZpbmUgYnkga2Vl
cGluZyBtZXJnZWQtYmluIGRpc2FibGVkLgoKPiAKPiAgNS4gdGhlIGxhc3QgcGF0Y2ggbWFrZXMg
bWVyZ2VkLWJpbiBtYW5kYXRvcnkgZm9yIHN5c3RlbWQgYW5kIGV4dGVuZCB0aGUKPiAgICAgc3lz
dGVtZCBydW50aW1lIHRlc3QgdG8gY2F0Y2ggZnV0dXJlIHRhaW50ZWQgZmxhZzsgYWdhaW4sIHRo
YXQKPiAgICAgcmVxdWlyZXMgdGhhdCBldmVyeXRoaW5nIGJlZm9yZSBpcyBhcHBsaWVkLCB0b28u
CgpDYW4geW91IHNlbmQgYSBmb2xsb3d1cCBwYXRjaCB0byB1cGRhdGUgdGhlIGRvY3VtZW50YXRp
b24gc2luY2Ugd2UgaGF2ZSBzb21lCmV4cGxhbmF0aW9uIGZvciBCUjJfUk9PVEZTX01FUkdFRF9V
U1I6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
ZGM3YzY0ODdjZmYwYTQxOGE2NjA1MDYwNjcwNTcxZWE5MTExMDUwYQoKPiAKPiBUaGUgc2VyaWVz
IHdhcyB0ZXN0ZWQgd2l0aCBhIGxhcmdlIHNldCBvZiBwYWNrYWdlcyBhbmQgYSBsYXJnZSBzZXQg
b2YKPiB0b29sY2hhaW5zLCBhbmQgYWx0aG91Z2ggaXQgaXMgYSBjcml0aWNhbCBjaGFuZ2UsIGl0
IGlzIHN0aWxsIHByZXR0eQo+IHdlbGwgY29uZmluZWQgdG8ganVzdCBhIGZldyBzcG90cy4KClRo
YW5rcyBZYW5uIGZvciB0aGUgaW5pdGlhbCB0ZXN0aW5nIQoKQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBDaGFuZ2VzIHYyIC0+IHYzOwo+ICAg
LSBhZGQgZml4IGZvciBtZXJnZWQtYmluIHRvIG5ldC10b29scwo+IAo+IENoYW5nZXMgdjEgLT4g
djI6Cj4gICAtIGFkZCBBcm5vdXQncyBBY2tlZC1ieSB0YWcgd2hlcmUgYXBwcm9wcmlhdGUKPiAg
IC0gdG90YWxseSByZXdyaXRlIHRoZSB0ZXN0IGZvciBtZXJnZWQgc3RhdHVzCj4gICAtIHJlamVj
dCB1bmV4cGVjdGVkbHkgbWVyZ2VkIHNrZWxldG9ucyBvciBvdmVybGF5cwo+ICAgLSBhZGQgcnVu
dGltZSB0ZXN0IHRvIGNhdGNoIHN5c3RlbWQgdGFpbnRlZCBmbGFncwo+ICAgLSB0eXBvcwo+IAo+
IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gWWFubiBFLiBNT1JJ
TiAoMTgpOgo+ICAgICAgIHN5c3RlbTogcmV3b3JkIG1lcmdlZC11c3IgcHJvbXB0Cj4gICAgICAg
c3lzdGVtOiBkcm9wIHN1cGVyZmx1b3VzIG5lZ2F0aXZlIGNvbmRpdGlvbiBmb3IgZGVmYXVsdCBQ
QVRICj4gICAgICAgcGFja2FnZS9zeXN0ZW1kOiBzZWxlY3QgbWVyZ2VkLXVzciBmcm9tIHBhY2th
Z2UsIG5vdCBpbml0Cj4gICAgICAgc3VwcG9ydC9zY3JpcHRzOiBjb21vbmFsaXNlIGNoZWNraW5n
IG1lcmdlZCBzdGF0dXMKPiAgICAgICBzdXBwb3J0L3NjcmlwdHM6IHByZXBhcmUgZm9yIGEgbW9y
ZSBjb21wbGV4IGNoZWNrIGZvciBtZXJnZWQgZGlyZWN0b3JpZXMKPiAgICAgICBzdXBwb3J0L3Nj
cmlwdHM6IGFsc28gZXhpdCBpbiBlcnJvciBvbiBpbXByb3Blcmx5IG1lcmdlZC11c3IKPiAgICAg
ICBzdXBwb3J0L3NjcmlwdHM6IG1vdmUgbWVyZ2VkLXVzciBlcnJvcnMgbWVzc2FnZSBpbnRvIGNo
ZWNrLW1lcmdlZC11c3Iuc2gKPiAgICAgICBzdXBwb3J0L3NjcmlwdHM6IGZpeCBhbmQgcmVzdHJp
Y3QgY29uZGl0aW9ucyB0byBhY2NlcHQgbWVyZ2VkIGRpcnMKPiAgICAgICBzdXBwb3J0L3Njcmlw
dHM6IHJlbmFtZSBjaGVjay1tZXJnZWQtdXNyLnNoCj4gICAgICAgc3VwcG9ydC9zY3JpcHRzOyB0
ZWFjaCBjaGVjay1tZXJnZWQgd2hhdCB0byBjaGVjawo+ICAgICAgIHN5c3RlbTogYWRkIHN1cHBv
cnQgZm9yIG1lcmdlZCAvdXNyL3NiaW4gKGFrYSBtZXJnZWQtYmluKQo+ICAgICAgIHN1cHBvcnQv
c2NyaXB0czogcmVqZWN0IHNrZWxldG9ucyBvciBvdmVybGF5cyB0aGF0IGFyZSB1bmV4cGVjdGVk
bHkgbWVyZ2VkCj4gICAgICAgcGFja2FnZS9jb3JldXRpbHM6IG5vIG5lZWQgZm9yIGNocm9vdCB3
b3JrYXJvdW5kIHdpdGggbWVyZ2VkLWJpbgo+ICAgICAgIHBhY2thZ2Uva21vZDogYWRqdXN0IHBh
dGhzIGZvciBtZXJnZWQtYmluCj4gICAgICAgcGFja2FnZS91dGlsLWxpbnV4OiBhZGp1c3QgcGF0
aHMgZm9yIG1lcmdlZC1iaW4KPiAgICAgICBwYWNrYWdlL25ldC10b29sczogbm8gbmVlZCBmb3Ig
aWZjb25maWcrcm91dGUgd29ya2Fyb3VuZHMgd2l0aCBtZXJnZWQtYmluCj4gICAgICAgdG9vbGNo
YWluL2V4dGVybmFsOiBzdXBwb3J0IG1lcmdlZC1iaW4KPiAgICAgICBwYWNrYWdlL3N5c3RlbWQ6
IHJlcXVpcmUgbWVyZ2VkLWJpbgo+IAo+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTkgKystLQo+ICBwYWNrYWdlL2NvcmV1dGlscy9jb3JldXRpbHMubWsg
ICAgICAgICAgICAgfCAgIDIgKwo+ICBwYWNrYWdlL2ttb2Qva21vZC5tayAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTIgKystCj4gIHBhY2thZ2UvbmV0LXRvb2xzL25ldC10b29scy5tayAgICAg
ICAgICAgICB8ICAxMCArLQo+ICBwYWNrYWdlL3NrZWxldG9uLWN1c3RvbS9za2VsZXRvbi1jdXN0
b20ubWsgfCAgMjUgKystLS0KPiAgcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgIHwgICAyICsKPiAgcGFja2FnZS91dGlsLWxpbnV4L3V0aWwtbGludXgubWsgICAgICAg
ICAgIHwgICA4ICstCj4gIHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQgICAgICAgICAgICAg
ICB8IDE0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBzdXBwb3J0L3NjcmlwdHMv
Y2hlY2stbWVyZ2VkLXVzci5zaCAgICAgICAgfCAgMzkgLS0tLS0tLS0KPiAgc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL2luaXQvdGVzdF9zeXN0ZW1kLnB5IHwgIDE5ICsrKysKPiAgc3lzdGVtL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIwICsrLS0KPiAgc3lzdGVtL3NrZWxl
dG9uL3Vzci9zYmluLy5lbXB0eSAgICAgICAgICAgIHwgICAwCj4gIHN5c3RlbS9zeXN0ZW0ubWsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxNCArKy0KPiAgdG9vbGNoYWluL2hlbHBlcnMu
bWsgICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICstCj4gIDE0IGZpbGVzIGNoYW5nZWQsIDI0
MCBpbnNlcnRpb25zKCspLCA4NCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNzU1IHN1
cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKPiAgZGVsZXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQv
c2NyaXB0cy9jaGVjay1tZXJnZWQtdXNyLnNoCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBzeXN0ZW0v
c2tlbGV0b24vdXNyL3NiaW4vLmVtcHR5Cj4gCj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
