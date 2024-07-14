Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABB5C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75CA940054;
	Sun, 14 Jul 2024 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFXIqhiKbu5a; Sun, 14 Jul 2024 20:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F6B4005E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F6B4005E;
	Sun, 14 Jul 2024 20:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228E21BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE3D8110A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gG_RFKgSqoTY for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:27:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B543C81100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B543C81100
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B543C81100
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:27:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3678fbf4a91so1894020f8f.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 13:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720988874; x=1721593674;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bz+VEBEd7TOXSIE8u8NX+n0NsAafaDgmk7alfpoeN0M=;
 b=YXTZ/TfHy9PwpI1HV21Vy9ZysQwSML10n7Fu4pDBD1UzkJHgtXZ579vOUD2jnZIkGc
 dOzh4euaTdMiioH8vaeAJeEruvxtm+6/wbkKV7xd6T1NlIfHWwKHsDsaJU3WarBqyiEq
 Kn70Yp8zkAFsJtl8psAmOgxjHh2yHMKj8hAUxIwjvQGd6CoFdVCbWVg9JD4Xlu44SVnG
 +fJANMUWSp5a/w8hXfjZq6eknYfnz+NttLLj57AJpGEXqp72ye3fCruHMWBJBUXg7pxw
 VKkNynPw7qv0WBxzQJsFt+PgvSMuLtlY7GKRqC8xS/Uhe0I7wnYqvDReJD+Hzd/HIjZt
 OKUg==
X-Gm-Message-State: AOJu0YycR5Z77taEfwoZvU1XX4BP1aNuxzFDPT/EF8t20GXeVEqQy3Nv
 hnvPvrkphRvH5WJQH+9+sXKO937KsHcP6flDTlxMX6GBagE7RW4Se9EsinmVSbQ=
X-Google-Smtp-Source: AGHT+IFGcd7iZfkGCqp4OBJYdvUa1zefMjhz5pLMZHt27xUin+DDKPs05Ylegd1bs7lIahSPQDhfKQ==
X-Received: by 2002:adf:a31c:0:b0:367:8383:62f3 with SMTP id
 ffacd0b85a97d-367cea73e8emr12148231f8f.28.1720988873523; 
 Sun, 14 Jul 2024 13:27:53 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cb0sm4565783f8f.10.2024.07.14.13.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 13:27:53 -0700 (PDT)
Message-ID: <036a5f0b-49c7-492b-9eed-dc936029ee70@smile.fr>
Date: Sun, 14 Jul 2024 22:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jan Kraval <jan.kraval@gmail.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
 <20240513233014.3b09e56e@windsurf>
 <12ae846b-1fc5-49ca-a996-485eb8283405@gmail.com>
 <20240530112514.1843a3a7@windsurf>
 <09155f65-8222-4a08-9fde-88141ba61501@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <09155f65-8222-4a08-9fde-88141ba61501@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720988874; x=1721593674; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bz+VEBEd7TOXSIE8u8NX+n0NsAafaDgmk7alfpoeN0M=;
 b=NffGTH8fDHzYE/F4+dSUi+tDD56GCkSwGvAiGrXqCbIGysu36LtISRF4tMZVlsIEZx
 0Qrv6ArGZXEuMAn3eXAcTzYkJB+4A/Vhdtu6q1NX7tArjPFAOxSSO+11u4DF7CiB1Cvt
 RAYemKiwvGW/1OQR0/EBWsNaesdr8Vh+ykbaI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=NffGTH8f
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxNC8wNy8yMDI0IMOgIDIxOjQ2LCBSb21haW4gTmFvdXIgYSDDqWNyaXTCoDoK
PiBIZWxsbyBKYW4sIEFsbCwKPiAKPiBMZSAzMC8wNS8yMDI0IMOgIDExOjI1LCBUaG9tYXMgUGV0
YXp6b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4gSGVsbG8gSmFuLAo+Pgo+PiBPbiBX
ZWQsIDIyIE1heSAyMDI0IDA2OjM3OjI5ICswMjAwCj4+IEphbiBLcmF2YWwgPGphbi5rcmF2YWxA
Z21haWwuY29tPiB3cm90ZToKPj4KPj4+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlUSE9OMz15
wqB3YXMgcmVtb3ZlZCBieSBtYWtlIHNhdmVkZWZjb25maWcuIEFjdHVhbAo+Pj4gdmFsdWUgZGlk
IG5vdCBjaGFuZ2UsIGl0IGlzIGVuYWJsZWQgYXV0b21hdGljYWxseSBieXxCUjJfVEFSR0VUX1VC
T09UX05FRURTX1BZTElCRkRULCB3aGljaCByZW1haW5lZCB1bmNoYW5nZWQgaW4gdGhlIAo+Pj4g
ZGVmY29uZmlnLiBJZiB0aGVyZSBpcyBzb21lIHJlYXNvbiB0byBrZWVwIHRoZSBsaW5lIGluIHRo
ZSBkZWZjb25maWcsIAo+Pj4gcGxlYXNlIGxldCBtZSBrbm93LCBJJ2xsIHNlbmQgcGF0Y2ggdjIg
UmVnYXJkcywgSmFuIHwKPj4KPj4gTWFrZXMgc2Vuc2UsIG5vIG5lZWQgdG8gc2VuZCBhIHYyIHRo
ZW4hCj4gCj4gQXBwbGllZCB0byBtYXN0ZXIgYWZ0ZXIgYWRkaW5nIEJSMl9ET1dOTE9BRF9GT1JD
RV9DSEVDS19IQVNIRVMgYW5kIGhhc2ggZmlsZXMsCj4gdGhhbmtzLgoKSSBhZGRlZCBhIGZvbGxv
d3VwIGNvbW1pdCB0byBhZGQgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkgc2luY2Ug
dWJvb3QKd2FzIGZhaWxpbmcgdXNpbmcgZG9ja2VyLXJ1bi4KCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8xNDE5MmQ3MjJjMDljYTUzNTU1NjYzMDNl
ODgwOGQ5ZjJjODNhZDMxCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRz
LAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+Cj4+IFRob21hcwo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
