Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F70CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 965A86104A;
	Fri, 12 Jun 2026 11:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iL6Yfs79p0L; Fri, 12 Jun 2026 11:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A621A61329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264361;
	bh=QshB2VZxxALDPRTXkEMCKGVfBXst1hX+zWsG2BQ0ScQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LckWHXMW8wVK8fv8pUa946Ppzyj2aXK58qM8b2ZH2nt00VSskyPKU97y2blDgdsQG
	 PAngZVOkDVzgujgITthnxpkVT5HcqGyA+bfkskR6pFHIj7s+qVtCUh8XyO9yW+1wI4
	 Q1PbJKaP09O9vUrFd3wIFUPF6hqsCtZko1O3y53xOwq+3s8P7QNZycpIb7oliXUnV8
	 1WfmM5iJZSbVIU7LCiA15rYpFAKw4wEQNZLvBV6vWOIJOa3ey8WYHV0t9pZDeW6upM
	 2msQfft7m8jldP69Rsd+G0w77JUY6/CvWaa10FqVVEO3e+bXoS/7BJd/W+8imV+DhS
	 fYK/QKzDXoFCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A621A61329;
	Fri, 12 Jun 2026 11:39:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7258A237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58D144066F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze2psyPfSlRV for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F8E140664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F8E140664
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F8E140664
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:39:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso6427385e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264357; x=1781869157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=y9cavZ31in6SUDZj/oK/iK4YpLqdy/xPdQ5lE8+r39w=;
 b=cj5jPu9DnApjiSqshdL8/4Z21eAUgHPtpsgz3dLWYjiDymt6l9RD7M6gckJLYp8aqi
 8N24IKbAyZvRYD5OjSq3zlj6HZno2ThBFj2bPpTCqdROuyhO6ar2fE6vF3j+kr5ieYDr
 Vof38RgAfi7ZXQ87U1Jrv08wZ5Ji4pI3FW7RIuPcmDyn7xYgHAPUKpJJ/OAROQdlYxWR
 tYQvG+cbUKLbTTXWP9JbOzHE+XL1KPKl1gALc4AoFoniEVhXxk+ViYRbHTMqctwunhGz
 czwPV74e4MHCU9nml/r2sCIrdPR51mCgK5HRm4sQvFdjNTai4INmWG6p9hVTpkIQ7Gvz
 4VGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IyLrpgJcR+OMcDAe6LLjmPLADk8NqAkugaaX7pAjxzgr0Ak888wOElJ5rhTys140jV9AmuOXH6wA=@buildroot.org
X-Gm-Message-State: AOJu0Yz/KjOsCJqzVL6kOzsStE2eaAz1u89sHsG8u5zJzDXt56skO9Fl
 SMNdQ07UGXn5dHdc9LkycXZtoIKGfzgdq0l2V7xkiGIjScnvzJAE1N97tZztukulgqI=
X-Gm-Gg: Acq92OGL1/SGMzGNx+ezvyG3OG53Z6z7CLsFg1+5A0dgy/srfZuTAWBaba9UAOvn83O
 ahtOVrD1zOzwo/TJtW1+NQ2lh3vPOqaCsmAtOmeWMbB4oJYqYjoD8F/pL0lghYWThA9V5ilL612
 5lbNRPNLrGcSHIqhOrEftPIQlephARr932X4DShgmzC8y8NjkURfj9JJxEaFZlD8lheNI4YIl4A
 CqWI+QI+jZaqDT2EAMnQhgW37oZTeeb2AR1pMrpcQx6yVkj+SJdGg7kv7W2iueDj2Ni+4i2Y8km
 K7f8ehiY2E6XSOy54J+64TxvpqB5i+Q+fwZ0SH7aosW7jzGAlfXYvvpbvRC8oKS41d1ZoHCoLTK
 Sb4MaSGR0JfoQc3jE4HIC8R2wiLw80uge6e4bmNOzoi8y12zguBhfoPtgXf7ApvtYrFJG7mClzD
 HAShbKX1Yfdjyct+A=
X-Received: by 2002:a05:600c:c3cb:10b0:490:c2a3:3304 with SMTP id
 5b1f17b1804b1-490ec5204e7mr22274115e9.35.1781264357382; 
 Fri, 12 Jun 2026 04:39:17 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm5229568f8f.20.2026.06.12.04.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:39:17 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:34 +0200
Message-ID: <20260612113916.253638-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607190044.850030-1-romain.naour@smile.fr>
References: <20260607190044.850030-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264357; x=1781869157; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y9cavZ31in6SUDZj/oK/iK4YpLqdy/xPdQ5lE8+r39w=;
 b=DgUeGlJea0deSt/Erh1fp+zpwBogoKHO04RBSAxCb172z/fv4yIb2308tDvh6EIUh2
 rdfvpwIkwNOUrFsgCXUzA3yae5waYv4S5efdMVmkMr2p9A0ASwl4MH1g1BSFY7vejizt
 n+GpWWknH8m6x4j4MawBuw8Nod7ux/grY5TSBp6MhnyDrDjmfMmtMhd/QkzdZKZfdSdN
 dhsu1iZEcX1VErTwpfle2lcdL+9+GC/5lphkgvbX1+SW0bXiGCnauiBHOPWR8MmABRJM
 Nx2gPcg6nGuq+Mh5Xb56UcOU+EoNxG+IS9kQdSYlG35pXSL4fVIdBE4tCbX8nH6qdOOx
 CpFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DgUeGlJe
Subject: Re: [Buildroot] [PATCH] configs/at91sam9x5ek*: remove
 at91bootstrap3 license
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

SW4gcmVwbHkgb2Y6Cj4gV2hlbiB1c2luZyBhIHNwZWNpZmljIGdpdCByZXBvIGFuZCB2ZXJzaW9u
IGZvciBhdDkxYm9vdHN0cmFwMywKPiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VOU0Vf
RklMRVMgZGVmYXVsdHMgdG8gIkxJQ0VOU0VTL01JVC50eHQiLgo+IEhvd2V2ZXIgdGhlIGdpdCB2
ZXJzaW9uIHdlIHVzZSAobmFtZWx5IHYzLjEwLjMpIGRvZXMgbm90IHByb3ZpZGUgdGhpcwo+IGZp
bGUuIEFjdHVhbGx5LCBpdCBkb2VzIG5vdCBwcm92aWRlIGEgbGljZW5zZSBmaWxlIGF0IGFsbC4g
VGhpcyBjYXVzZXMKPiDigJhtYWtlIGxlZ2FsLWluZm/igJkgdG8gZmFpbCB3aXRoOgo+IAo+ICAg
ICA+Pj4gYXQ5MWJvb3RzdHJhcDMgdjMuMTAuMyBDb2xsZWN0aW5nIGxlZ2FsIGluZm8KPiAgICAg
c2hhMjU2c3VtOiAvYnVpbGRzL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L291dHB1dC9idWlsZC9h
dDkxYm9vdHN0cmFwMy12My4xMC4zL0xJQ0VOU0VTL01JVC50eHQ6IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKPiAgICAgRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIGJvb3QvYXQ5
MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMuaGFzaAo+ICAgICBFUlJPUjogTElDRU5TRVMvTUlU
LnR4dCBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gICAgIEVSUk9SOiBleHBlY3RlZDogNWEzODA5
YjFjMmJhMTNiNzI0MjU3MjMyMjk1MTMxMWM1ODQ0MTlmMWY4NTE2ZjY2NWQ2YzA2ZjA2NjhkNzhk
ZQo+ICAgICBFUlJPUjogZ290ICAgICA6Cj4gICAgIEVSUk9SOiBJbmNvbXBsZXRlIGRvd25sb2Fk
LCBvciBtYW4taW4tdGhlLW1pZGRsZSAoTUlUTSkgYXR0YWNrCj4gICAgIG1ha2VbMV06ICoqKiBb
Ym9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9vdHN0cmFwMy5tazoxMTI6IGF0OTFib290c3RyYXAz
LWxlZ2FsLWluZm9dIEVycm9yIDEKPiAKPiBMZXQncyBiZSBleHBsaWNpdCB0aGF0IHRoZXJlIGlz
IG5vIGxpY2Vuc2UgZmlsZSB0byBjaGVjay4KPiAKPiBGaXhlczoKPiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE0NzI4OTEzODIxIChhdDkxc2FtOXg1
ZWtfbW1jX2Rldl9kZWZjb25maWcpCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy8xNDcyODkxMzgyMCAoYXQ5MXNhbTl4NWVrX21tY19kZWZjb25maWcp
Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDcy
ODkxMzgxOSAoYXQ5MXNhbTl4NWVrX2Rldl9kZWZjb25maWcpCj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xNDcyODkxMzgxOCAoYXQ5MXNhbTl4NWVr
X2RlZmNvbmZpZykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNi4wMi54LiBUaGFua3MKCj4g
LS0tCj4gIGNvbmZpZ3MvYXQ5MXNhbTl4NWVrX2RlZmNvbmZpZyAgICAgICAgIHwgMSArCj4gIGNv
bmZpZ3MvYXQ5MXNhbTl4NWVrX2Rldl9kZWZjb25maWcgICAgIHwgMSArCj4gIGNvbmZpZ3MvYXQ5
MXNhbTl4NWVrX21tY19kZWZjb25maWcgICAgIHwgMSArCj4gIGNvbmZpZ3MvYXQ5MXNhbTl4NWVr
X21tY19kZXZfZGVmY29uZmlnIHwgMSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXQ5MXNhbTl4NWVrX2RlZmNvbmZpZyBiL2Nv
bmZpZ3MvYXQ5MXNhbTl4NWVrX2RlZmNvbmZpZwo+IGluZGV4IDc3NWZjY2VhZTMuLjI0NmQzNGVk
ZWYgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfZGVmY29uZmlnCj4gKysrIGIv
Y29uZmlncy9hdDkxc2FtOXg1ZWtfZGVmY29uZmlnCj4gQEAgLTE2LDYgKzE2LDcgQEAgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQMz15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X0dJVD15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRw
czovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0Igo+ICBCUjJfVEFSR0VU
X0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1ZFUlNJT049InYzLjEwLjMiCj4gK0JSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfTElDRU5TRV9GSUxFUz0iIgo+ICBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzX0RFRkNPTkZJRz0iYXQ5MXNhbTl4NWVrbmZfdWJvb3QiCj4gIEJSMl9UQVJHRVRfVUJP
T1Q9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiBkaWZmIC0t
Z2l0IGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfZGV2X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXQ5MXNh
bTl4NWVrX2Rldl9kZWZjb25maWcKPiBpbmRleCAwZjI5MjE2NzM2Li4zNjQ0MWYzOGU3IDEwMDY0
NAo+IC0tLSBhL2NvbmZpZ3MvYXQ5MXNhbTl4NWVrX2Rldl9kZWZjb25maWcKPiArKysgYi9jb25m
aWdzL2F0OTFzYW05eDVla19kZXZfZGVmY29uZmlnCj4gQEAgLTY3LDYgKzY3LDcgQEAgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQMz15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X0dJVD15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRw
czovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0Igo+ICBCUjJfVEFSR0VU
X0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1ZFUlNJT049InYzLjEwLjMiCj4gK0JSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfTElDRU5TRV9GSUxFUz0iIgo+ICBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzX0RFRkNPTkZJRz0iYXQ5MXNhbTl4NWVrbmZfdWJvb3QiCj4gIEJSMl9UQVJHRVRfVUJP
T1Q9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiBkaWZmIC0t
Z2l0IGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfbW1jX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXQ5MXNh
bTl4NWVrX21tY19kZWZjb25maWcKPiBpbmRleCBhNmZkN2UwNWZjLi40YzJhNjI1NWJjIDEwMDY0
NAo+IC0tLSBhL2NvbmZpZ3MvYXQ5MXNhbTl4NWVrX21tY19kZWZjb25maWcKPiArKysgYi9jb25m
aWdzL2F0OTFzYW05eDVla19tbWNfZGVmY29uZmlnCj4gQEAgLTE3LDYgKzE3LDcgQEAgQlIyX1RB
UkdFVF9BVDkxQk9PVFNUUkFQMz15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X0dJVD15Cj4gIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9NX1JFUE9fVVJMPSJodHRw
czovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAuZ2l0Igo+ICBCUjJfVEFSR0VU
X0FUOTFCT09UU1RSQVAzX0NVU1RPTV9SRVBPX1ZFUlNJT049InYzLjEwLjMiCj4gK0JSMl9UQVJH
RVRfQVQ5MUJPT1RTVFJBUDNfTElDRU5TRV9GSUxFUz0iIgo+ICBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzX0RFRkNPTkZJRz0iYXQ5MXNhbTl4NWVrc2RfdWJvb3QiCj4gIEJSMl9UQVJHRVRfVUJP
T1Q9eQo+ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiBkaWZmIC0t
Z2l0IGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfbW1jX2Rldl9kZWZjb25maWcgYi9jb25maWdzL2F0
OTFzYW05eDVla19tbWNfZGV2X2RlZmNvbmZpZwo+IGluZGV4IDM0NGM2YzJlYWUuLjkwODkwN2Fj
ZGEgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hdDkxc2FtOXg1ZWtfbW1jX2Rldl9kZWZjb25maWcK
PiArKysgYi9jb25maWdzL2F0OTFzYW05eDVla19tbWNfZGV2X2RlZmNvbmZpZwo+IEBAIC02OSw2
ICs2OSw3IEBAIEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDM9eQo+ICBCUjJfVEFSR0VUX0FUOTFC
T09UU1RSQVAzX0NVU1RPTV9HSVQ9eQo+ICBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RP
TV9SRVBPX1VSTD0iaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4NHNhbS9hdDkxYm9vdHN0cmFwLmdp
dCIKPiAgQlIyX1RBUkdFVF9BVDkxQk9PVFNUUkFQM19DVVNUT01fUkVQT19WRVJTSU9OPSJ2My4x
MC4zIgo+ICtCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0xJQ0VOU0VfRklMRVM9IiIKPiAgQlIy
X1RBUkdFVF9BVDkxQk9PVFNUUkFQM19ERUZDT05GSUc9ImF0OTFzYW05eDVla3NkX3Vib290Igo+
ICBCUjJfVEFSR0VUX1VCT09UPXkKPiAgQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NP
TkZJRz15Cj4gLS0gCj4gMi41NC4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
