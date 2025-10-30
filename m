Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75800CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D963811AA;
	Thu, 30 Oct 2025 08:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id js9MDdQKVXCy; Thu, 30 Oct 2025 08:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581398117F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581398117F;
	Thu, 30 Oct 2025 08:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1CFD160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36D041131
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NExfP6qL6tdc for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE20B40FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE20B40FFE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE20B40FFE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4710022571cso8640735e9.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812629; x=1762417429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bpobCUCWnWLvJYpvl69C727N0FIHQY0ASSgvsJ3QmBI=;
 b=D9lt8JJUqR7uv6MWsLte/ZcSkCHxru5UUMzK4HybStTgOLvZqxCpWe0j8+PdQNoY7e
 jkpRPuN+inXPrD3o1Tvv0NXEdX201K0cINLUIgSvzd2g0p0WdEnffb0ImEwYqRE6hzJJ
 P+WV5c71/8xnfLs7hTDjcQ4IOTPAZMxgQMcDnU4IZ6nK8LDOnBiYlfOSDfFWa8RgM/DG
 L4nQ21x7hRuxcvSPllYq9R8fdiSeMoBaZ0x3wACwoVffmuOuXMwGMYE0V9ie7MNnMdQc
 DrOiW+NWfgoXAY8sAEI7IPnsHKdJEQ7lWSTJKAfLSFW60an4xELLQiFXXY7i7eLv/aR+
 MBiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHK5Pg2/ZeWgYhJ6gcGW3cdnRbNOLsKvWjxo0ZVih3rTmLqR/uMmeP0/BIkw69l7OJ3Lktnq8iAQI=@buildroot.org
X-Gm-Message-State: AOJu0Yzao5pPvrq9SrED4LUWQazlr778kP2CoaJLvEDx37BH9MQk0fzG
 6inimmFqb3HYyPTwGgJiGghouBfI0ipq0wWN63cDy6YoFgUPoZIv9NDFuBlpwnID0z7r1YQwddy
 mtMip
X-Gm-Gg: ASbGncsxXtrzym51+NJCs3VeYY5edPCBgVU6VeNl6h4hiHzqRlt6Erej3qiJR+/5rMU
 Re5sgA5Tp1neVfJzKVnb5xUU7wSW0bVuX0kCSrrh0CcfWaCoPRhk6aflMxFgsMQquAhfdQYnotD
 Zw1cml1NVhtxZAHo8pHkyEnZcVaqA18GOqcnTlZ0Of0U+/uR6+FmBOpvb3UN91/MDt/DCJfnC/N
 FUCxDrAHN5ybgf6hP9ARbPsP3myjcDzF1r360PbeDMX5AlIMoySd4hY0PA8ZnFGq1VpFY/q4018
 3DXlKAvXsvgBv4S+2kIE1QjzVQXwa5fX+C6BbmwYBsHfezJkBZJm0oxmryBNqoO8VokTtuYMJM8
 AjZumI8ghqc6r4NXR62mw8huW+bcx0+va0QVRC/PTqcY5in5F3b6LtzJhg6whmtLtIo3dzdr6/l
 1xxgud4pVzEGuuFsJPH3oRxnuS+QNib9foXv+4
X-Google-Smtp-Source: AGHT+IHNJZ621C9nW0CnYUUC03P/u9SLIALGEUIzEcxMAge7FYlmLX4WWru+1Z3eV+qAUalnQDWScQ==
X-Received: by 2002:a05:600c:a42:b0:471:11a3:a6a9 with SMTP id
 5b1f17b1804b1-4772685b67dmr16838965e9.37.1761812628733; 
 Thu, 30 Oct 2025 01:23:48 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d3532sm31465410f8f.20.2025.10.30.01.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:48 -0700 (PDT)
To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:46 +0100
Message-ID: <20251030082347.35031-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021165126.168606-1-vincent.stehle@arm.com>
References: <20251021165126.168606-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812629; x=1762417429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpobCUCWnWLvJYpvl69C727N0FIHQY0ASSgvsJ3QmBI=;
 b=NuvicK4dkX3ORNT3DOEYAek2hTFRkm4aWMJ2Icc2Hp0GqQoJi9f+DjV8UdyVemRwmP
 rKhGen1uzRM6jyNKz1kxslbg1k1A+5XXP/hPipQNhVRTiY2f/9sPbZ6ZeBufyL8eHHSV
 sEDhrVYbv/OvQIfRAvFLrpE8rml7WoHw6+3mz82XsYaHoAnk71Wa73aV3lLRwpM7GfDY
 boZGdkYgF09j9QbkqM+i85n6O9HLtbD7l/n+x5JEYsRyYXpmJrorYRK2SHBM+Rkx5/1f
 rnk7DcPz0/JNASEXed3lLXO9N1mm4EwzNYKCFEgePlqgzxd+g/7n68/qRInmNg54ykPQ
 IFog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuvicK4d
Subject: Re: [Buildroot] [PATCH v2] utils/brmake: filter output for parallel
 build
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

SW4gcmVwbHkgb2Y6Cj4gV2hlbiBidWlsZGluZyBpbiBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdl
IGRpcmVjdG9yaWVzCj4gKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUz15KSwgYnJtYWtlIG91
dHB1dCBpcyBvZnRlbiBnYXJibGVkOgo+IAo+ICAgMjAyNS0xMC0wOFQxODozOToxMCA+Pj4gaG9z
dC1kdGMgMS43LjIgQnVpbGRpbmcKPiAgIDIwMjUtMTAtMDhUMTg6Mzk6MTEgY2hlY2tpbmcgZm9y
IHN0ZGludC5oLi4uID4+PiBob3N0LWR0YyAxLjcuMiBJbnN0YWxsaW5nIHRvIGhvc3QgZGlyZWN0
b3J5Cj4gICAyMDI1LTEwLTA4VDE4OjM5OjEyIGNoZWNraW5nIGZvciBsaW1pdHMuaC4uLiA+Pj4g
aG9zdC1nbXAgNi4zLjAgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQo+IAo+IFJlbW92ZSB0
aGUgc3B1cmlvdXMgc3RyaW5nIGJldHdlZW4gdGhlIHRpbWVzdGFtcCBhbmQgdGhlICI+Pj4iIG1h
cmtlciB0bwo+IGZpeCB0aGlzLgo+IFdlIG5lZWQgc29tZSBleHRyYSBjYXJlIHRvIHByZXNlcnZl
IHRoZSBwcmVjZWRpbmcgInRlcm0gYm9sZCIgc3BlY2lhbAo+IGNoYXJhY3RlcnMgc2VxdWVuY2Uu
Cj4gCj4gV2UgYWxzbyBwcmV2ZW50IGdyZXAgYW5kIHNlZCB0byBidWZmZXIgdGhlaXIgb3V0cHV0
IHRvbyBtdWNoLiBUaGlzIGxlYWRzIHRvCj4gbW9yZSBmcmVxdWVudCBvdXRwdXQgZXZlbiB3aGVu
IHdlIG1pZ2h0IG5vdCBiZSBjb25uZWN0ZWQgdG8gYSB0ZXJtaW5hbDsgZm9yCj4gZXhhbXBsZTog
d2hlbiBicm1ha2UncyBvdXRwdXQgaXMgcGlwZWQgdG8gYW5vdGhlciBwcm9ncmFtIG9yIHdoZW4g
cnVubmluZwo+IGluIENJLgo+IAo+IFJldmlld2VkLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxk
cm9vdEBidWJ1MS5ldT4KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQu
c3RlaGxlQGFybS5jb20+Cj4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjA4LnguIFRoYW5rcwoKPiAtLS0KPiAK
PiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBBZGQgdGhlIGAtLXVuYnVmZmVyZWQnIG9wdGlvbiB0
byBzZWQgIChzdWdnZXN0ZWQgYnkgTWFyY3VzKQo+ICAgLSBFeHBsYWluIGJ1ZmZlcmluZyBhIGJp
dCBtb3JlIGluIHRoZSBjb21taXQgbWVzc2FnZSAgKHN1Z2dlc3RlZCBieSBNYXJjdXMpCj4gCj4g
SGkgTWFyY3VzLAo+IAo+IFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBpbnRlcmVzdCBpbiB0aGlzIHBh
dGNoLgo+IEkgaGF2ZSBhZGRlZCB5b3VyIHJldmlld2VkLWJ5OyBwbGVhc2UgbGV0IHVzIGtub3cg
aWYgeW91ciB0ZXN0ZWQtYnkgY291bGQKPiBiZSBhZGRlZCB0byB0aGlzIHYyIGFzIHdlbGwuCj4g
Cj4gRGVhciBZYW5uLAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBpbnRlcmVzdCBhbmQgZm9yIHNo
YXJpbmcgeW91ciBicm1ha2UgcmV3cml0ZS4KPiBUbyBiZSBob25lc3QsIEkgZmVlbCBtb3JlIGNv
bWZvcnRhYmxlIHdpdGgganVzdCB0aGlzIGNvdXBsZSBvZiBtb2RpZmllZAo+IGxpbmVzLCB3aGlj
aCBJIHRoaW5rIGFyZSB3ZWxsIHVuZGVyc3Rvb2Qgbm93IGFmdGVyIHRoZSBkaXNjdXNzaW9uIHdp
dGgKPiBNYXJjdXMsIHRoYW4gd2l0aCB0aGUgbG9uZ2VyIGJhc2ggdmVyc2lvbiB1c2luZyBtb3Jl
ICJhZHZhbmNlZCIgbWVjaGFuaXNtcywKPiBsaWtlIHNpZ25hbHMgYW5kIGNvcHJvY2Vzc2VzLiBJ
IHRoaW5rIEkgd2lsbCBub3QgZGFyZSB0byBzdWJtaXQgdGhpcyBtb3JlCj4gY29tcGxleCB2ZXJz
aW9uLi4uCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFZpbmNlbnQuCj4gCj4gCj4gIHV0aWxzL2Jy
bWFrZSB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvYnJtYWtlIGIvdXRpbHMvYnJtYWtlCj4gaW5k
ZXggYTRiOWU3ZmE3MS4uYzI5ZTU2YTliYyAxMDA3NTUKPiAtLS0gYS91dGlscy9icm1ha2UKPiAr
KysgYi91dGlscy9icm1ha2UKPiBAQCAtMTIsNyArMTIsOCBAQCBtYWluKCkgewo+ICAgICAgICAg
ICAgICAgcHJpbnRmICIlKCVZLSVtLSVkVCVIOiVNOiVTKVQgJXNcbiIgLTEgIiR7bGluZX0iCj4g
ICAgICAgICAgIGRvbmUgXAo+ICAgICAgICAgICB8dGVlIC1hIGJyLmxvZyBcCj4gLSAgICAgICAg
IHxncmVwIC0tY29sb3VyPW5ldmVyIC1FICc+Pj4nCj4gKyAgICAgICAgIHxncmVwIC0tbGluZS1i
dWZmZXJlZCAtLWNvbG91cj1uZXZlciAtRSAnPj4+JyBcCj4gKyAgICAgICAgIHxzZWQgLS11bmJ1
ZmZlcmVkIC1FICdzL14oWzAtOVQ6LV17MTl9KSBbWzpwcmludDpdXSooLio+Pj4gKS9cMSBcMi8n
Cj4gICAgICAgICApCj4gICAgICByZXQ9JHs/fQo+ICAKPiAtLSAKPiAyLjUxLjAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
