Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02420EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C88F141FD6;
	Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Mgc2vqG7UQu; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0489F41FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011483;
	bh=X8OUR8cy2jol/rV/gGjP8ST+SfeFpPfLV9euFhU0EE4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s5FDIDJrAs27ngwami72YH7Y+HR470H4rgt2mPT9sbj6r1w5nhmf6mG+yBAz4W1tX
	 CfDbM0RmzZarIk31iyMTmB79od1rHGyOwETKRWQGO+puXhMfmBUWOjVCXsPSBuFWfj
	 P2hdh6xSIhqfgBU1scWsiv2xI3fqqVHC6G7/9zyLtNEQ7w1GmX4Q9WV36mqiQzEuiR
	 krHfcSWjWSf9R8FUSBPgJxaYHCHFQr7K22fYdwgEczYS8eKQdXzPsOc+R0pCshTgRm
	 aLV4ibljFHuO8i5IS8lljyVjZqIx3NmZEpXE7kq/4Z7qoDHfJLxoGPi/QvkCraik6h
	 dTTa0j6rhIUAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0489F41FD0;
	Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D75B4EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B29A8615C6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4ppK3Jwm6xE for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F118A615B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F118A615B8
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F118A615B8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4362507f0feso835629f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011438; x=1771616238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rK6cqog2xln0jLVk/CctL0hBIwlvhMADL5PRsNwfNf0=;
 b=vlx6e3Zcid4COTXR2VwII/JqFoFel5dWLFn0U6niEci6POCcOk0he08t5tRTvYiN4S
 pj8+9vPN9Ci5YSSlv53uKiRm0hXfrDMyyZMLnB8TExXM1Esow8yg1H/Sf7qGAZRj8l/9
 JMJgO9QlWXn+1ZVhmXUHbb2DVCkyTBmxJn7it9VM3Uw45TYUHE82zlWmjM2bLoHgxTvK
 bHla9JuWQYU09yPtMWNkKxxR2LXM1MUwMwtRBcEpLWHnF/BCJdcm88EtxhZpQBRvgm6a
 gH46HfVTUz8MqPLX8DZk8Pa6O586Q4ydmdli19mZ0oTTmjLhXPg7WQ1xZmGsuOS3phle
 xwzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYpx0kw+NOHCdlhomHvOORqZW8PLSQB3PFM4+ZTaoaj3XiFoQTA4f3+tMOpNi4OftK+LEGnsoctl8=@buildroot.org
X-Gm-Message-State: AOJu0YxVo7r4OJtqQV3a/b0XAb6Ot0++4mLFsAL8RhH12fxCQ1cbAPjJ
 xVQQ2icEVfhcHMtIDl0Vh5xrjsPj1x5un1J6geDiYczNNJhRKWtPlmXZzqHDIUwB4zg=
X-Gm-Gg: AZuq6aK0XRw3Mw0xzuHFC2e0DPe4LdpNUDuMfj4LQFPQzW2sJMVVPJaDN+2zu8a1IGE
 sU6goGaHObwkyfVegTkP2A6yhnXR0uZGisYGbwDX6I/l7sCNYy+rvOYW6l4Zpb7NQYswdLr2gA7
 4EG4pOA7PQp/RnoK2ZtX2QiCPVaPMNRhPJ/e2oWrVDi5BmV5/nMBigRguuYEDnVFvprktxwbPEp
 DEG0ZG2XoYd35xo0YcGoTBDZVkZHMW9Kqy6X6Et3tAVjAgsz8ZCrYMkaaL400SXxpRtsBaP0Ocz
 1O4hVXY4UK1PqvIukAEXbPce3MJyFWUUPF2jp/2KeMyuetOiXkQCrQNPsxMB2JCji/YGx/DC8yg
 ygpS5nvvzbDZQscsl0gWxwZ084tKoArrb8K+V+O4of4yDxQ2lKYIidCSe5aFdXEBTJ5KH3SwSbO
 ffjAymdBlIrIX9m2c=
X-Received: by 2002:a05:6000:2005:b0:436:1946:c186 with SMTP id
 ffacd0b85a97d-43796ab19ebmr6898603f8f.10.1771011437938; 
 Fri, 13 Feb 2026 11:37:17 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6b563sm7689156f8f.12.2026.02.13.11.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:17 -0800 (PST)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:16 +0100
Message-ID: <20260213193717.38974-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250801150722.4003476-4-raphael.melotte@mind.be>
References: <20250801150722.4003476-4-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011438; x=1771616238; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rK6cqog2xln0jLVk/CctL0hBIwlvhMADL5PRsNwfNf0=;
 b=YckOe5+IxvlOhI8yH3ppjj8LXGETEU+V4AHWYbPvXIYILLkiaJz+6WgmW3FjX0zjSW
 xOuHiKbdHKKPLwJUJuVkpiO21uiKePOdUDvyNascRF/IjdsHh3dtNULQ38D0NZPAMvj6
 rVvx9sXI4D2qMX2QYHCDZL2ArufIRSnKo6QtHAlSKGVbg/9uT0o7Zcc82FwDscjqxLoC
 7nicSo63WnrmUpNti1O2sAAx28SJq/IuSiTgg6+IwvzeBcGmcu3Nmo4JcYKRM637Rdr2
 Zff6kjvYtqv0DUVVsXTpmkjlLAFodopDyWXR/8FZvwdPbyuEHUSHyLuJL6P04mG0E/8M
 UzHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YckOe5+I
Subject: Re: [Buildroot] [PATCH 3/6] package/mupdf: skip installing docs to
 the target
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

SW4gcmVwbHkgb2Y6Cj4gVGhlIGN1cnJlbnQgJ2luc3RhbGwnIHRhcmdldCBjb21wcmlzZXMgJ2lu
c3RhbGwtbGlicycsICdpbnN0YWxsLWFwcHMnCj4gYW5kICdpbnN0YWxsLWRvY3MnLgo+IAo+IElu
IG91ciBjYXNlIHdlIGRvbid0IHdhbnQgdG8gaW5zdGFsbCBkb2N1bWVudGF0aW9uIHRvIHRoZSB0
YXJnZXQsIHNvCj4ganVzdCBydW4gdGhlIG90aGVyIHR3by4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
YXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgpBcHBsaWVkIHRvIDIw
MjUuMDIueCAmIDIwMjUuMTEueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL211cGRmL211cGRm
Lm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tayBiL3BhY2thZ2UvbXVw
ZGYvbXVwZGYubWsKPiBpbmRleCA2YjY2NjAzM2ViLi42ZmRiZjU5ZjA1IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKPiArKysgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCj4g
QEAgLTY4LDcgKzY4LDcgQEAgZW5kZWYKPiAgCj4gIGRlZmluZSBNVVBERl9JTlNUQUxMX1RBUkdF
VF9DTURTCj4gIAkkKE1VUERGX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpICQoTVVQREZfTUFL
RV9PUFRTKSBcCj4gLQkJREVTVERJUj0iJChUQVJHRVRfRElSKSIgaW5zdGFsbAo+ICsJCURFU1RE
SVI9IiQoVEFSR0VUX0RJUikiIGluc3RhbGwtbGlicyBpbnN0YWxsLWFwcHMKPiAgZW5kZWYKPiAg
Cj4gICQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gLS0gCj4gMi4zNC4xCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
