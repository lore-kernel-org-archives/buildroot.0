Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25FEC0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 21:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1591F41695;
	Wed, 29 Jan 2025 21:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk_BvWc84DuL; Wed, 29 Jan 2025 21:42:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D56041691
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D56041691;
	Wed, 29 Jan 2025 21:42:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0B53942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D29D408EA
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUE_eLZK1dhB for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 21:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 34C0941610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34C0941610
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34C0941610
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 21:42:24 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so87134f8f.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 13:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738186942; x=1738791742;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rr8sxsKiF/lU9vsbhVl5SmziNEiI8NAifs0lNyPeKH4=;
 b=bJj6DlDFgT3nuYB0zQ6CO/oCm0SUwLTLXw4iuxIuh0eGv2KUkdnu56NypvIxZcx9uJ
 qHYI7YJNSKEWgvZTdQHRyhyjQBj7R0L6VltP6EDwtr36DgEHUE6/Mlu1+AWQ6HcQp6mj
 sBAx3mZNjnHKTnE5lTn9yXdx6Ed7be5weRnZnB6XcArxoZnsPZULJFw3CiqcvGm1dZZR
 x1pWk9Cnjh1rJVvYQjMHu+lHypg6MnWG2OC1Di+uj4mfETm4HMwvLR/J1e8FIfNIwxI4
 EK3/vSQByNKJFAAu7EJ7sjKGpZqZVnZk+OcKfUyltAuN5c0R0WuexYN9dR/w/6cdxZpe
 Wfkg==
X-Gm-Message-State: AOJu0YytXoeRCk1r/fSXI4rmlAIeNCIdbIv2ndPF8W/d7BeZwyNvGXQL
 5ypBQkCNK6O+igNcfuzFCuA0z8bZy6YuMEGA2o18y41+eJfjKl61w7sdqw==
X-Gm-Gg: ASbGncuOcQ+P7R7L5oUclahRZ8b4txuj7qq91Ymt2sH5BiMBgKMhC326eBBVh1jNRcM
 ncFy6ho4ZkuQms03YxyAGdgv4WPyMFdOGMOL3ibA0/ZYrGUs9eq2dTTAkevVYDjtt4yoLqJi9w6
 8+hCWUp5QPntmkTE3GpeGkVx6As3HEeP1Tsug9KIzhN0N/VDnL3JMYrf2xXVUCKKvz7BzwY2phZ
 nJqs70pdbVPEk5/ZA8fFV9wXcEfjHSfBx8xFCKhDPRebwVHoZePs0O3nFqO1Xca/KIsiNp9SIlJ
 uMdmnvv1JJweeOJGng8j
X-Google-Smtp-Source: AGHT+IFoSi4pQyWa540ZMOoVaZElt7UULsPNO8T5++ktbSr6E6fWptQOWZVXTTTpG3iQKBnwCrQDqw==
X-Received: by 2002:a5d:6489:0:b0:38c:246f:b0b3 with SMTP id
 ffacd0b85a97d-38c52097871mr4094679f8f.51.1738186941922; 
 Wed, 29 Jan 2025 13:42:21 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0eccc3sm3189f8f.18.2025.01.29.13.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 13:42:21 -0800 (PST)
Date: Wed, 29 Jan 2025 22:42:19 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>,
 Martin Doucha <martin.doucha@suse.com>, sparclinux@vger.kernel.org,
 Mike Gilbert <floppym@gentoo.org>, Andreas Larsson <andreas@gaisler.com>,
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20250129214219.GA447474@pevik>
References: <20240226155137.25523-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240226155137.25523-1-mdoucha@suse.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738186942; x=1738791742; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rr8sxsKiF/lU9vsbhVl5SmziNEiI8NAifs0lNyPeKH4=;
 b=PJ5oYWvinRf5MFxGl74/SnIwS8jhgM1LM+VyBKlDWjXk7dPLuHA9JDM6txAuiWDsRh
 qdr3j+CcGI/Vvo3KjJMJP2WKoB1TnYObIr1Sk8VdRA6R+NZKHZ37JHQ4RrYNmau7u9UH
 1NHeH5tlfLCTsNQN1p0MP8NIYWhKNCJJtPhYvUemgPUB6TvOOTC90jEWQOEKJZrE74OP
 AU6GuCDUnvGNCc1fOEVp/m79AFmKj5hXMpGjc+6n4+2vo67o7Y6GrqJZ3X8J8Uvz4JLi
 MQdCWpgYP0HypkagqrodOUGpPJbnL0/lSfOoAz67cogUKsroybuQpUHxeONvGQEF9g6p
 0n3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PJ5oYWvi
Subject: Re: [Buildroot] [LTP] [PATCH] ioctl02: Use correct termios structure
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKRllJIHRoaXMgTFRQIGNvbW1pdCBtZXJnZWQgYXMgNjk3YTA2YTgyNyBbMV0gd2hp
Y2ggaXMgbmVlZGVkIHRvIGZpeCBpb2N0bDAyLmMKdGVzdCBvbiBwcGM2NGxlIG9uIGFsbCBrZXJu
ZWwgdmVyc2lvbnMgYnJlYWtzIGNvbXBpbGF0aW9uIG9uIEJ1aWxkcm9vdApib290bGluLXNwYXJj
NjQtZ2xpYmMgdG9vbGNoYWluIChnY2M6IDEzLjMuMCwga2VybmVsIGhlYWRlcnM6IDQuMTkuMjU1
LCBnbGliYzogMi4zOSk6CgoJSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGJyLXRlc3QtcGtnL2Jvb3Rs
aW4tc3BhcmM2NC1nbGliYy9ob3N0L3NwYXJjNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290
L3Vzci9pbmNsdWRlL3N5cy9pb2N0bC5oOjI5LAoJCQkJCSBmcm9tIC4uLy4uLy4uLy4uL2luY2x1
ZGUvbGFwaS9pb2N0bC5oOjExLAoJCQkJCSBmcm9tIGlvY3RsMDIuYzozMToKCWJyLXRlc3QtcGtn
L2Jvb3RsaW4tc3BhcmM2NC1nbGliYy9ob3N0L3NwYXJjNjQtYnVpbGRyb290LWxpbnV4LWdudS9z
eXNyb290L3Vzci9pbmNsdWRlL2JpdHMvaW9jdGwtdHlwZXMuaDozNjo4OiBlcnJvcjogcmVkZWZp
bml0aW9uIG9mIOKAmHN0cnVjdCB0ZXJtaW/igJkKCSAgIDM2IHwgc3RydWN0IHRlcm1pbwoJCSAg
fCAgICAgICAgXn5+fn5+CglJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW9jdGwwMi5jOjI5OgoJYnIt
dGVzdC1wa2cvYm9vdGxpbi1zcGFyYzY0LWdsaWJjL2hvc3Qvc3BhcmM2NC1idWlsZHJvb3QtbGlu
dXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvYXNtL3Rlcm1iaXRzLmg6MTc6ODogbm90ZTogb3Jp
Z2luYWxseSBkZWZpbmVkIGhlcmUKCSAgIDE3IHwgc3RydWN0IHRlcm1pbyB7CgpUaGUgcHJvYmxl
bSBpcyB3aXRoIGtlcm5lbCA8YXNtL3Rlcm1iaXRzLmg+IGluY29tcGF0aWJpbGl0eSB3aXRoIGds
aWJjCjxiaXRzL2lvY3RsLXR5cGVzLmg+IGluY2x1ZGVkIHZpYSA8c3lzL2lvY3RsLmg+IHdoaWNo
IGlzIG5lZWRlZCBieSBpb2N0bDAyLmMKYW5kIGFsc28gYnkgTFRQIGxpYnJhcnkgaW5jbHVkZS9z
YWZlX21hY3Jvc19mbi5oLgoKVGhpcyBwcm9ibGVtIHdhcyBmaXhlZCBhIHllYXIgYWdvIGluIGtl
cm5lbCB2Ni4xMC1yYzEgaW4gY29tbWl0IGMzMmQxOGU3OTQyZAooInNwYXJjOiBtb3ZlIHN0cnVj
dCB0ZXJtaW8gdG8gYXNtL3Rlcm1pb3MuaCIpIFsyXS4KCkJlY2F1c2Ugbm9ib2R5IG5vdGljZWQg
dGhpcyBjaGFuZ2UgSSBzdXBwb3NlIG5vYm9keSB1c2VzIExUUCBvbiBzcGFyYzY0Cm9yIHBlb3Bs
ZSBjb21waWxlIExUUCBvbiBzcGFyYzY0IHdpdGggbmV3IGtlcm5lbCBoZWFkZXJzLgoKQEN5cmls
IEBNYXJ0aW4gRllJIGFub3RoZXIgZXhhbXBsZSBvZiBjb25mbGljdGluZyBnbGliYyBhbmQga2Vy
bmVsIGhlYWRlcnMgKG5vdApsaXN0ZWQgaW4gWzNdKS4gSU1ITyBub3RoaW5nIHRvIGJlIGRvbmUg
b24gTFRQIHNpZGUgdW5sZXNzIHdlIGNhbiBtYWdpY2FsbHkgcHV0CmJhY2sgPHRlcm1pb3MuaD4g
YW5kIGhhdmUgcHBjNjRsZSB3b3JraW5nIHdpdGggaXQuCgpAQnVpbGRyb290IEFzIEkgd3JvdGUs
IGJlY2F1c2UgTFRQIG5lZWRzIHRoaXMgZml4IGZvciBwcGM2NGxlIChhcmNoIGFjdHVhbGx5CnRl
c3RlZCBieSBMVFAgZGV2ZWxvcGVycyksIHRoZSBvbmx5IHNvbHV0aW9uIGZvciBCdWlsZHJvb3Qg
aXMgdG8gcmVxdWlyZQp0b29sY2hhaW4gYmFzZWQgb24gdjYuMTAga2VybmVsIGhlYWRlcnMgZm9y
IHNwYXJjNjQgKHF1aXRlIGEgYmlnIGxpbWl0YXRpb24gZm9yCnNldmVyYWwgY3Jvc3MgY29tcGls
YXRpb24gdG9vbGNoYWluLCBzb21lIGFyZSBiYXNlZCBvbiA0LjE5IGtlcm5lbCBoZWFkZXJzLAo1
LjExIHJlcXVpcmVtZW50IGZvciBtdXNsIGVmZmVjdGl2ZWx5IGRpc2FibGVzIExUUCBvbiBCdWls
ZHJvb3Qgb24gbXVzbCkuCgpLaW5kIHJlZ2FyZHMsClBldHIKClsxXSBodHRwczovL2dpdGh1Yi5j
b20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9jb21taXQvNjk3YTA2YTgyNzk3ODg4N2U0Yzg4NzEw
ZGM3ZDMxZDZmM2VlODE2YQpbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9YzMyZDE4ZTc5NDJkNzU4
OWI2MmUzMDFlYjQyNmIzMjYyMzM2NjU2NQpbM10gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9nbGli
Yy93aWtpL1N5bmNocm9uaXppbmdfSGVhZGVycwoKPiBUaGUgdGVybWlvcyBzdHJ1Y3R1cmUgZGVm
aW5pdGlvbiBpbiA8dGVybWlvcy5oPiBpcyBpbmNvbXBhdGlibGUKPiB3aXRoIGRpcmVjdCBpb2N0
bCgpIGNhbGxzLiBUaGUgY29ycmVjdCBkZWZpbml0aW9uIGlzIGluIDxhc20vdGVybWJpdHMuaD4K
Cj4gU2lnbmVkLW9mZi1ieTogTWFydGluIERvdWNoYSA8bWRvdWNoYUBzdXNlLmN6Pgo+IC0tLQo+
ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsMDIuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgo+IGRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsMDIuYyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvaW9jdGwvaW9jdGwwMi5jCj4gaW5kZXggYWFiODBiMjUxLi5mM2JmYjIz
OWEgMTAwNjQ0Cj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9pb2N0bDAy
LmMKPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lvY3RsL2lvY3RsMDIuYwo+IEBA
IC0yNiw3ICsyNiw3IEBACgo+ICAjaW5jbHVkZSA8c3RkaW8uaD4KPiAgI2luY2x1ZGUgPHN0ZGxp
Yi5oPgo+IC0jaW5jbHVkZSA8dGVybWlvcy5oPgo+ICsjaW5jbHVkZSA8YXNtL3Rlcm1iaXRzLmg+
Cgo+ICAjaW5jbHVkZSAibGFwaS9pb2N0bC5oIgo+ICAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
