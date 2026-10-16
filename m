Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B48CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2105740ABC;
	Fri, 16 Oct 2026 15:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IngFwWKp7R3K; Fri, 16 Oct 2026 15:03:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E138B40A7B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163005;
	b=P+k5Guu2exgPcosd+KGvOSeVVDE8gNC+TRlzqUEjzsR/xULSioXR+hV8swy5yDjnigRS
	 9Q4jSyeT1/JqpbcIPsIcKfrSilP+NmOhu+CErYhtVRnxgGP5FFCvFKyryeaORlY5ugw4P
	 K+XuxAcRYxkl/l6YZqS+w3KjETng7/uVHSEtF33vqVnnmJqljxcBVuKic9kwlmNDmzeDd
	 uU6Z+NIdbjD0d+LLK/SY7xOTzKC1cIq01PXdF8OKW2lVmxjNcI8UF4x0LSWUTFuYWmCOz
	 ER5MUyvcTkD6EeoPxsMR4CETJCSpzKcb2cX7lWsXPG9tEN2o5zBtJnrbdc1RaZDyb2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163005;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lncQHuPKJa8cd2lXqqzVUI86sRyXPvqQSiFamfuOI18=;
	b=QsUjIatmj2yKVDZfDpzfigrEsNZB5Wbin8LK8hGqFkOtdIjDIdTKApw/QzYW8P9bWwZt
	 mSZ3bSeAL7KrYLOhifUvBdmo7w4xKjkF94TEOVp8kzpx7f35GhkIAd03crWHxjOzyYgWo
	 /c2bNIQD7wQxmsfNV5xmyDp2ManceADBCsX6ZuYCL15Mpd5a4WYU6Jip5/XOvOXDfdrj5
	 v+VLchCkeKJF4RFia9Ene6uJ+wvBoUEC/ysEXjm/Kqa3GjBguUe4xV8UuHjWD6yFXUL+C
	 f9zEZPiu/FBYwjMJu0UUREDIJfTlRIU6uPejLmJ+GNrZFRK7v5qdjcBtSl49dVBK4zg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163005;
	bh=lncQHuPKJa8cd2lXqqzVUI86sRyXPvqQSiFamfuOI18=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Z9Osvwo4VE2ezXTppNWkH5J4uV99frF7Mmu/7FsPPSxRjOxN/WJQL3c8yqaj8r/zo
	 VSBO7AXOvYTxLwb0X1uNtMOaOw6Fy64LOBjOiX1XEykRORqxztxWqppVdS4TChUVCY
	 w9ntaJfoFIdv4MfwcCxM8rBTGyLfvSFSHw37AQxSoumxPCc6vdGUkvG0BqXq/FRJYQ
	 xbxRDHV85zd6/6X6QagWpdCXZcHHM5rrReKcnfeldkaFWSUe0CDfBUwRXw/FcyMHD1
	 4Y9q7POG0n8NIyOrMsFjqSdqc/AMrAI1DstC5shyQ5bOrg/9OhpFyG0hNddM0WbP0t
	 WOQhOW/UUazHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E138B40A7B;
	Fri, 16 Oct 2026 15:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1EB3255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97FC960B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaW-jVsEtIeX for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8A6460B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163003;
 b=nB63yiL+DNlzdbr9gpLXEoVMT/HK4AfcBlLz66vv41egiZu6T5nQtW19p2v6L8AMrGtu
 Me3uqScqHp6B6kbpdwH8fsZD70fWGsa0YLbBp7QWMP4+eGOmWxLKRrsmLVPZGs2Py8S+I
 p1Qo9NPKJ13QkSx4ta8jqw6n6E/8cLXaMuTRLQG1xV0sCZH6TP+9MSSsW7c7wR23klfdv
 h9XhKSJuaIKQBOvoUaOJwASZQxpuo1vSp1+h9E06MdiC7LMTdqmp7gQ8Oy+13Nz0oLbXa
 SuN5XlNEmNT6iBj1AiZRAFQhiVPoBv+meyZ60U+Lh53KCJ87d7kzwmXGWCJBKna0/PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163003;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=2UGtdGVxRgeK4XkKspr7YraoGLqFI8fHpSz+ccpUAH4=;
 b=JsG5zxq59YDK22qLY07fpTGtm+09iqsZhsEFybjSC3lf8gr0/0c+tLxXycTLTq+/dj6w
 a2rVkZ02wQVMSxe8/16TIcbBFFLiXgCaNe3TWerd1NZyeC7GyYsufNyZEhjOnyqyI/8v5
 SqEQNTHT/PzBfwztGWXB11OXWL/b6+EAMFtIQvfUC6fhkhADsYZyOrqH3aoOlT9pl7GuG
 trwWdLJrl+DXbsbc42tvj5eLDbTuXCCen4eBI07rFjqjQmcMTe678EeegdaKp84EeLxXv
 0ZJjx/h/nFnhSAJ/lkIztWziCdwkeSfPiOdaO5cRCjRU3WLtz+jXRerZUBKNMIyGqAw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YMYCE4tx; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8A6460B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:22 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48afbd2c386so3913702f8f.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163001; x=1792767801;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2UGtdGVxRgeK4XkKspr7YraoGLqFI8fHpSz+ccpUAH4=;
 b=sNRU0K4eGLgdZQ/sZgw4M+gxX5RUdeeKAWz6ELbK2zTIAT0Tkp8fasuqIwH616S8IK
 6FQWm2GhMQzS00VhH6Mkpz25AvHJQlxPQWXGfyFJHr84MzeD+7ZjqX04baOXL3CnNAVi
 YGBM2K5rU/+RiG63WLePfzlSwd8dGNL24Oguyuui0Of/5093mhd4UULIfDIJApGmK31p
 AN7JPziDOPEISAk79z4SJVpJ/F9j3nqsDb6YvY55remg9aGqPinPNKht6oBawhsvtLo3
 45MSfI6tgWbmNpFgx+zDjeTjviUqsmnFt2Oxw0Jq68H8O4o4u4KH1frkfnCeo01j3U4O
 XxAw==
X-Gm-Message-State: AFq9FYKBBjxsw0QVAE3rNGEGJy6jgM09872KlJnagPhweZ+DLHyMlr9p
 XjaBNg1SJacXT4r1BzNZ0/Dmusb/lKuITePZ4dPIzSojptPsqDek62kD1fd0UTOc/qTNAryNlSH
 1CFuNf+A=
X-Gm-Gg: AYBFou235AjR1YiV7Ez0GAKlbTsuot1hz07U0+qj7qt513Wrv2+TYkAPtIK459Q3DvA
 tcwJnIKq+Wtmmszh6pIJDx8zuxjPhLnYyN8BxxBd3CMqlwx3SRJfeRGvWfNvcCDeGL4grf3qD++
 pu9eCzP2ZNtL8yrBXLhRwzocBIy3+t2+tP3KiTSyvup/barf+p3WDSar3/uC6QMnNUIVoSENpY7
 UXvQzoTinlFFWxUQnFLkV4lN1N3WWSwR9trxa3LCG0LrhOa564OH7sBI8oaMIqiQkZc4TP+7v+k
 cxSQarntTjAqpdjUOsMnoW8k6SGyZ1ynROkTcwU9tbvugmRmZj6rBQSlFnkmt0MsXlJD0BMcF3W
 S6yvEsUrkGwP/D0Fp/dw1RssaZ5TJmbSiVkJwA+qOUhRD9GR5UkEsPUFNDlJqm3WT8xp3S9C1GM
 CmHH3RltKM8VOo1aWOodJ+gACEWE/4YQBROIYMLWJIhUveGnSFvb93jmHjJ1DMfhXUXxjW+jrDv
 Clyh4qxt3mU3bRkjc1K3rMZlB9Khic54I95lC72TQ==
X-Received: by 2002:a05:6000:1788:b0:48d:dc6f:219a with SMTP id
 ffacd0b85a97d-48ddc6f2463mr32223256f8f.27.1792162999248; 
 Fri, 16 Oct 2026 08:03:19 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8cfesm5024734f8f.37.2026.10.16.08.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:18 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:16 +0200
Message-ID: <20261016150318.65158-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917091904.2560461-3-raphael.melotte@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 2/2] package/qemu/Config.in.host: fix
 typo in comment dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gVGhlICJob3N0LXFlbXUgbmVlZHMgYSBob3N0IGdjYyA+PSA4IiBjb21t
ZW50IGRlcGVuZHMgb24KPiBCUjJfUEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9BUkNIX1NVUFBPUlQs
IG1pc3NpbmcgdGhlIHRyYWlsaW5nICJTIgo+IG9mIHRoZSBhY3R1YWwgc3ltYm9sIEJSMl9QQUNL
QUdFX0hPU1RfUUVNVV9VU0VSX0FSQ0hfU1VQUE9SVFMsCj4gZGVmaW5lZCBhIGZldyBsaW5lcyBh
Ym92ZSBhbmQgdXNlZCBjb3JyZWN0bHkgZXZlcnl3aGVyZSBlbHNlIGluCj4gdGhpcyBmaWxlLgo+
IAo+IEJlY2F1c2UgdGhpcyB0eXBvJ2Qgc3ltYm9sIGlzIG5ldmVyIGRlZmluZWQgYW55d2hlcmUs
IGl0IGlzIGFsd2F5cwo+IGNvbnNpZGVyZWQgZmFsc2UgYnkgS2NvbmZpZywgc28gdGhlIGNvbW1l
bnQncyAiZGVwZW5kcyBvbiIgY2xhdXNlCj4gc2lsZW50bHkgbG9zZXMgb25lIG9mIGl0cyB0d28g
aW50ZW5kZWQgY29uZGl0aW9ucy4KPiAKPiBBc3Npc3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1i
eTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0
byAyMDI1LjAyLngsIDIwMjYuMDgueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvQ29u
ZmlnLmluLmhvc3QgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3Qg
Yi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiBpbmRleCBjN2RkNTg3NmU1Li42NDRkZmQ0
ZDgyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAo+ICsrKyBiL3Bh
Y2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAo+IEBAIC0zNyw3ICszNyw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9BUkNIX1NVUFBPUlRTCj4gIAo+ICBjb21tZW50ICJob3N0
LXFlbXUgbmVlZHMgYSBob3N0IGdjYyA+PSA4Igo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9I
T1NUX1FFTVVfU1lTVEVNX0FSQ0hfU1VQUE9SVFMgfHwgXAo+IC0JCUJSMl9QQUNLQUdFX0hPU1Rf
UUVNVV9VU0VSX0FSQ0hfU1VQUE9SVAo+ICsJCUJSMl9QQUNLQUdFX0hPU1RfUUVNVV9VU0VSX0FS
Q0hfU1VQUE9SVFMKPiAgCWRlcGVuZHMgb24gIUJSMl9IT1NUX0dDQ19BVF9MRUFTVF84Cj4gIAo+
ICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
