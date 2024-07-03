Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDAC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 22:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3279884134;
	Wed,  3 Jul 2024 22:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4miF7UG0jsLo; Wed,  3 Jul 2024 22:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31BF1844FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31BF1844FA;
	Wed,  3 Jul 2024 22:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E91311BF2F6
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 22:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5B14417D1
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 22:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNet6RTh8bo5 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 22:02:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 378AB40CF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 378AB40CF7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 378AB40CF7
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 22:02:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42562a984d3so41790135e9.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 15:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720044136; x=1720648936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHImOh6ytGdpdTj/Kn0FO9h04z7mge7cPgL2YsRiyHE=;
 b=XTbTxOSPYpGfD4ZzqsTLyyUALUVrJct/LE23SG/FSnm14rf1ErmR6zGyGJUUv9Twvx
 aSiJDYGCoOl6lQtB4vrs5gf3mzvrYVjBqckL2Chv1NhxT9W93oWxef5EcmT0EI4MJBXG
 lMOfNjSPDJ5xaOJOC7GisZPLwuTQ1Vejau/hKP4whX/RNq4Vl37joLBQ+MCgJQZmZoIX
 m38k10M7iKQwZE1IF+MvVzY4wgyjdZx0ibY7irTTfMFoFZGuhYPbk014ZjoLAHieW71x
 zZVsLr/+iRViIMwj0ckN/zzhQk1To+jmXeOJeKwBeJU09mY/1Le8BCvh+vSSYb8kf7KP
 9W2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7gHwOgpz4Z8BvXp93ZCF82SOhJ1n6G8VAvXo0MqWQ/bJcaxkLatNvV8n8Gvduslk6g/VYwBmGWI5wUGpM0C7LSlDsuGVJ5Q==
X-Gm-Message-State: AOJu0YzEi9ssWm4/W1djFOtXjemFUVmYAEmeo9F5uN1DI2LBwYhQWkU5
 dp4ZEW4CjxgAR7cPpUxF/17M8ODBUhQg819aFOMwxnkWRrCbHGuh1Jf3HYa8Yvc=
X-Google-Smtp-Source: AGHT+IFtixKuCSv+Q73d1UwA5tilCz+I4OIuXcciHLbCEGinRIUQGlEwnhQ5qUYFp+papKok6zUqqw==
X-Received: by 2002:a7b:c458:0:b0:424:a655:c8b with SMTP id
 5b1f17b1804b1-4257a010ab5mr85916115e9.19.1720044136205; 
 Wed, 03 Jul 2024 15:02:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a283551sm179655e9.42.2024.07.03.15.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 15:02:15 -0700 (PDT)
Message-ID: <aa5d66c7-625f-49c0-a5ae-dd4be92a11cd@smile.fr>
Date: Thu, 4 Jul 2024 00:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240702131925.248165-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20240702131925.248165-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720044136; x=1720648936; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tHImOh6ytGdpdTj/Kn0FO9h04z7mge7cPgL2YsRiyHE=;
 b=S5pMSE58HdHLxGIHlV3DNm4P5IrxIdfzlmvXM94KNm0kpK6cMo/omYXZR+BrqPYKei
 g/GLaK+hrK6V6gZ2JdroJCPugn+MIliVMbed3CT6/7iKf0Zw2lLqZMzBlB1EvD2KmOJo
 chy1CDs7qpucl9vJK+tbqlwZuiDmRaPKWLxeQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=S5pMSE58
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new rt-tests runtime
 test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMDIvMDcvMjAyNCDDoCAxNToxOSwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+
IC0tLQo+IFBhdGNoIHRlc3RlZCBvbiBicmFuY2ggbWFzdGVyIGF0IGNvbW1pdCBiMmMyYzQ4IHdp
dGggY29tbWFuZHM6Cj4gCj4gICAgIHV0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdl
Cj4gICAgIC4uLgo+ICAgICAwIHdhcm5pbmdzIGdlbmVyYXRlZAo+IAo+ICAgICBweXRob24zIC1t
IGZsYWtlOCBcCj4gICAgICAgICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J0
X3Rlc3RzLnB5Cj4gICAgIFtuby1vdXRwdXRdCj4gCj4gICAgIHN1cHBvcnQvdGVzdGluZy9ydW4t
dGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4gICAgICAgICB0ZXN0
cy5wYWNrYWdlLnRlc3RfcnRfdGVzdHMKPiAgICAgLi4uCj4gICAgIE9LCj4gLS0tCj4gIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgLi4uL3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J0X3Rlc3RzLnB5ICAgIHwgMzkgKysrKysrKysrKysr
KysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnRfdGVzdHMucHkK
PiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA2ZDlmY2Q5
N2RmZS4uOTBkMWExMTFhYjQgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVM
T1BFUlMKPiBAQCAtMTg5Myw2ICsxODkzLDcgQEAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9weXRob25fc3Bha2UyLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfcHl0aG9uX3N5bXB5LnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfcmRtYV9jb3JlLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfcmRtYV9jb3JlLwo+ICtGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3J0X3Rlc3RzLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
c2NyZWVuLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc2VkLnB5
Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc29jYXQucHkKPiBkaWZm
IC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9ydF90ZXN0cy5weSBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcnRfdGVzdHMucHkKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwLi4wNzk1ZDdhZmQyZgo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3J0X3Rlc3Rz
LnB5Cj4gQEAgLTAsMCArMSwzOSBAQAo+ICtpbXBvcnQgb3MKPiArCj4gK2ltcG9ydCBpbmZyYS5i
YXNldGVzdAo+ICsKPiArCj4gK2NsYXNzIFRlc3RSdFRlc3RzKGluZnJhLmJhc2V0ZXN0LkJSVGVz
dCk6Cj4gKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklH
ICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9QQUNLQUdFX1JUX1RFU1RTPXkKPiAr
ICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPiArICAgICAgICAjIEJSMl9UQVJHRVRf
Uk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gKyAgICAgICAgIiIiCj4gKwo+ICsgICAgZGVmIHRlc3Rf
cnVuKHNlbGYpOgo+ICsgICAgICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxk
ZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmJv
b3QoYXJjaD0iYXJtdjUiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1
aWx0aW4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIs
IGNwaW9fZmlsZV0pCj4gKyAgICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCj4gKwo+ICsgICAg
ICAgICMgV2UgY2Fubm90IGVhc2lseSB0ZXN0IHJlYWx0aW1lIHByb3BlcnRpZXMgaW4gYSBDSS9l
bXVsYXRvcgo+ICsgICAgICAgICMgZW52aXJvbm1lbnQuIEluc3RlYWQsIHRoaXMgdGVzdCBydW5z
IGZldyBydC10ZXN0cyBwcm9ncmFtcwo+ICsgICAgICAgICMgaW4gc21hbGwgc2NlbmFyaW8gY29u
ZmlndXJhdGlvbnMgKHRvIG1ha2Ugc3VyZSB0aGUgZXhlY3V0aW9uCj4gKyAgICAgICAgIyB3aWxs
IHJlbWFpbiBzaG9ydCkuIEl0IGp1c3QgbWFrZXMgc3VyZSB0aGUgZXhlY3V0aW9uIHJldHVybnMK
PiArICAgICAgICAjIGEgc3VjY2VzcyBjb2RlLiBBbHNvLCB0byBhdm9pZCBtYWtpbmcgdGhlIGxv
Z3MgdG9vIGJpZywgd2UKPiArICAgICAgICAjIGdlbmVyYWxseSBwYXNzIHRoZSAiLS1xdWlldCIg
b3B0aW9uIHRvIGhhdmUgYSBzdW1tYXJ5IGF0IHRoZQo+ICsgICAgICAgICMgZW5kIG9mIHRoZSBl
eGVjdXRpb24uCgpSdW5uaW5nIHJ0LXRlc3RzIHRvb2xzIG9uIHNsb3cgR2l0bGFiLWNpIHJ1bm5l
cnMsIHdoYXQgY2FuIGdvIHdyb25nPyA6KQoKVGVzdGVkIGxvY2FsbHkgKG9uIGEgbGFwdG9wKSBi
ZWZvcmUgYXBwbHlpbmcuCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+ICsgICAgICAgIHRlc3RfY21kcyA9IFsKPiArICAgICAgICAgICAgImN5Y2xp
Y3Rlc3QgLS1xdWlldCAtLWxvb3BzPTIwMCIsCj4gKyAgICAgICAgICAgICJoYWNrYmVuY2ggLS1m
ZHM9MiAtLWdyb3Vwcz0zIC0tbG9vcHM9NSIsCj4gKyAgICAgICAgICAgICJwaV9zdHJlc3MgLS1p
bnZlcnNpb25zPTEwMCIsCj4gKyAgICAgICAgICAgICJwdHNlbWF0ZXN0IC0tcXVpZXQgLS1sb29w
cz0xMDAiLAo+ICsgICAgICAgICAgICAicnQtbWlncmF0ZS10ZXN0IC0tcXVpZXQgLS1sb29wcz01
IiwKPiArICAgICAgICAgICAgInNpZ25hbHRlc3QgLS1xdWlldCAtLWxvb3BzPTIwMCIsCj4gKyAg
ICAgICAgICAgICJzaWd3YWl0dGVzdCAtLXF1aWV0IC0tbG9vcHM9MTAwIgo+ICsgICAgICAgIF0K
PiArCj4gKyAgICAgICAgZm9yIGNtZCBpbiB0ZXN0X2NtZHM6Cj4gKyAgICAgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2soY21kKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
