Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C5C88E64
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 08:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8FA40437;
	Mon, 14 Sep 2026 08:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ODD4KaVRQ0k; Mon, 14 Sep 2026 08:39:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECDBD40515
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789375162;
	b=feeMonbX46+TYhTlQLi7tHOkyt+UYicG80+Qc62AJ+0WyE3nOjLTJtbXKfEOOCtSn+Mq
	 yocVr8oMmQOntLA/x0ZWg5QXjs6WXKAFlp3pyUq4x+Nz0DzWUaC36lU302R6/rliSvNPF
	 3mNVl0XCUISLwziBCJgQYWZZNg/CajwoxKMVF7+dbuPQ8Imh0Pwiska9TW/rOPphpoG6I
	 thJEk5yWPtypZLcfEpw//mxifyGEfLRWNmWz7pHz1qsoqb0fviNzxp1emBEIx9CWZvPpV
	 tBz3rW2CPZhOc6heI0gflYxxOaL7jqvQELzemikl7gXswftvGLg0wzaAv8kf6kprFnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789375162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:From:To:Cc:Date:In-Reply-To:References:
	 User-Agent:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ZlK26NmljW4g9ycP7W4OUeJkMKgmGH4153XXrK3nEA4=;
	b=cnyFa0fXYH+ZdA+62zhaMUEDSEvfCwKcTGIcel7Usd0EgzLGvuTwRPEbqp8kzZjMLTrr
	 BdHnDJKvyON+bsuwXkr9fQLvEa+7fIOrt3+rslS02GWa2yjl06B588xYdUqKTK5nAkrpA
	 HimDQUdsbFkfHpTLnuWdGvIqgBXpmbIMjEbpcHAHMk0RmehTJ5TwOJfcolTOIBFCNxJOR
	 93EnlWFngxMhwr/WEbacWS3gxaZaOjE+rsd8eoVGdGiCPLQcdTWZjiZFCf/LxU+4ncIdv
	 LQ3fh53Cjdu3fa2jDtuCeeEfzGc6LlQOsEdCeVhFQlag7T/ye5Ayh/7aqUZpiYhJ2UA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789375162;
	bh=ZlK26NmljW4g9ycP7W4OUeJkMKgmGH4153XXrK3nEA4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFIN1URTfb1tDZvw+M9/WFY1N4rse/1CVSqJassBT41AjAl0bWd7IfnUU/ci/yOrQ
	 h1qiHZPywRDNmm/4m1IH20uvWIh6CUbIAqlr3PJHMQa+5zlo48cSfTwOs/YPwpscex
	 yZ1WBAMXe5RLFQsa6apzCtTRs3yoKKM+wKV6I/0EKB0ot1dU9w36UWhmq81I3SYUFo
	 OMQ1nVEgc3xaqBxa1yIzNe2xZ91ZxxKfr+KnRz+CVZ7Z2gRJIhqMDZcO6ag8J/wZyI
	 zW1HI5gD5tunYuv3duH8B9k9SxymlsAcp0+WGHtMbqhegU7SU/ZDLooRBjd9vjpZaE
	 fOedd0V94x/1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECDBD40515;
	Mon, 14 Sep 2026 08:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95248362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A13980C3B
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF-KEX3tC59i for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 08:39:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 76BD180C1E
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789375159;
 b=iyRqa1MPcySoAn+IbkAuqmgCIEPTLVHShdWDldTa1Ugk7UBRtvldJAydvqIW8D21p4VI
 DQnstDcp2gKTEAUcYZnw5b2mzfGK5mYeLE+NY0mvfy22/5NOpXcbAxtdo45UWaLogNycN
 AD6x2CCZadSCPAckv0/vqXccWuc0TkviEHMxkInhTlHZk4KTd0Ok4HA2FYLoDZwaYGQEb
 Rgf2OkH9ndvlc0k+6dCLf3yxUU5a19Dib15kxIIEwzP8WwEihn+cJQpmvCsF0k7cJv7nY
 db8F8cj65hBYrcx7JDk6go9sWohCPSXXe2LJ0jNg+3hk30Odze3KdOZtvl7vlfI7TQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789375159;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
 From:To:Cc:Date:In-Reply-To:References:Content-Type:
 Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=5Mt82FWG/DSAeoz/zf4jSnE1od3gkRZTJCRpPVH+W7s=;
 b=RVS/FRnvZ/XOfz5TtKOmsRXzP5xEOIIPvsdLn4I2mz9zYKG1yc1FJ+Grc/AL3APPyv8n
 YeFdYV1DqPfjNFxzUf7nFloKz7dV5g6AgELoGzajzwv7dDJmortHPcyt9joeA8jBNqyG+
 qpFn6I8UzOeNnBMl3ptbKt9XnonQsLYcoqz5jj5gj+FxoB8piJJ28mRTQYkHQtBDSxohK
 34t2Zgpm09oVmzj4Atpwd60s5J074i+iIyc3Gv2ZklzTMjeLI3I53eeAKE8/vFDpDRhye
 VG2/NZA6EEOjT+HxBIroisBkiBOac+D61rEj8SlRxiYmCoI9OwZmgLPUwNH9XUYwwoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Xf5ZhsDT; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Xf5ZhsDT
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76BD180C1E
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:39:18 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-48583cc7ab1so726298f8f.2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 01:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789375157; x=1789979957; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=5Mt82FWG/DSAeoz/zf4jSnE1od3gkRZTJCRpPVH+W7s=;
 b=Xf5ZhsDT2OhtYdYu820zxZtHrtjPkmo6lwRruWHbei77z39K7g1Bxf5pnMg++DuJMY
 LWu51pL8BV2ZzQgVspA54lmu441PcIvVXEbWDpBupSKFD/S4sxh1AsUFszkn+Qt77PNL
 65NB3QleBqxMDSMSD6cqQM5Aef+Lrq6xdTJ5OjJEaoshqtinSESbGM57K9Rb3rfsJTeC
 tqIrgaJTJ62Bo9dAxhkjvHiMG/6zED7kH/VLY0uSmZwwfdV3gRjeDBUYz5L/HoMQC6+J
 mTTAjupZ32Ar6LApBZ+mH1a9RhkVM4+XIsihyIsDp3iKaFX/0m5hRJILG++FpjqhO3V2
 nPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789375157; x=1789979957;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5Mt82FWG/DSAeoz/zf4jSnE1od3gkRZTJCRpPVH+W7s=;
 b=QPYPLXFYsSIfnuqEL56x5RVj53VvuWU8J5mZ2J6LoRR1Bj627nGrv0RfRarXEbmI8h
 smSaH+rlRn98O6TkuFp3NMvieOvp5kAbdfSHoP+onBpuunsQvKajHaVEZcqmhyxOP+9M
 7AC3cSUpJTqFZfJAlVv8/kuCQq95u19GuLY/7ImVFelgLaHUod2+hyXna0d1jWY/gON7
 kfwK06f49gUFsHamhSoNILd5NJj3jgoUl4BIJ8hLvEuv7loizYVkCPCgzKb4yJjV4umd
 qdx8Rtr5D46/kAwkR+YeUEyAG1LOBIxJZiuLT1lBOMCu7ppwykcfDkbPQKx39CIZA/es
 hCJg==
X-Gm-Message-State: AFuF++k/Co22GxWaZB4wP4XTF3DjOlgGQf78UfMYUvuxkKMGJzepUUsP
 k1HBEnnYX8fOHM4YHrJTrLJly386Q7arY4IZGG4MbjhAUK8uYUijMjlM
X-Gm-Gg: AYBFou1R4WcCXSQfx4oUMh64xNQeZ5LAXJ2jIlwrOHNSb53FN3X6+BfoUmJZeWKBxHi
 N1+EsP5rUQNuDwPezvMy7OLzMjKKl37MyUX9avuk2WjmKyBE/sio21G/1IXrRxbhG5yd0GO1NlH
 VJUhjs2gVi34qVYk5rRXEOes3E/lJnG/snCNRFhsiUP+DcMkeM4eZHupxFQ3/nFebI0TNbnbTJa
 AEZPOuWL9HnL1irJO1YyzZDrhk+Es9l0wC5mMC7nHtv6ty5qKURXCbryjBxFTFH8YaFL7fRxXc8
 yXZp+KUc9JqQ+Wbx1ilhqNK6R4ZTJyvD6N3FL0gLFQfNsniWC2/g1yuYagKnxZKAwRbeinkt7pM
 bs+W97g5fKiwTF70tLtGY+7hxm5STw4tH0bI/T9RT41mb0V+Vc2/suuRAh37hk8s11KueAS+PCm
 UdL6RNHaWZqx9voEYWqXbSojuA3g0xs87INycNnsdK+OuWTKmga60E9Aq7PA257+9SNrg/gQISL
 QYuO+95d7dAFosv2HhtmSsFarnGedi2G19/kclBCf3KeQ1vR1Ad0Q==
X-Received: by 2002:a05:6000:2999:20b0:487:370:45d3 with SMTP id
 ffacd0b85a97d-4870370467cmr596684f8f.43.1789375156716; 
 Mon, 14 Sep 2026 01:39:16 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb35bd1esm25022966f8f.31.2026.09.14.01.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 01:39:16 -0700 (PDT)
Message-ID: <991e259b5002c8a0840f1ad536dbcbb6ac2519b6.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>
Date: Mon, 14 Sep 2026 10:39:16 +0200
In-Reply-To: <aqexn8dKpwyI-ISu@l301776.home>
References: <20260913133520.3423773-1-alexander.sverdlin@gmail.com>
 <aqexn8dKpwyI-ISu@l301776.home>
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: support custom DTS with
 CONFIG_OF_UPSTREAM
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

SGkgVmluY2VudCEKCk9uIE1vbiwgMjAyNi0wOS0xNCBhdCAxMDozNCArMDIwMCwgVmluY2VudCBK
YXJkaW4gd3JvdGU6Cj4gPiBTaW5jZSBVLUJvb3QgMjAyNC4wNywgYm9hcmRzIHdpdGggQ09ORklH
X09GX1VQU1RSRUFNIGJ1aWxkIHRoZWlyIGRldmljZQo+ID4gdHJlZXMgZnJvbSBkdHMvdXBzdHJl
YW0vc3JjLzxhcmNoPi88dmVuZG9yPi8gaW5zdGVhZCBvZiBhcmNoLzxhcmNoPi9kdHMvLAo+ID4g
c28gdGhlIGZpbGVzIGNvcGllZCBieSBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9EVFNfUEFUSCB3
ZXJlIGlnbm9yZWQgYW5kCj4gPiB0aGUgYnVpbGQgZmFpbGVkIHdpdGggIk5vIHJ1bGUgdG8gbWFr
ZSB0YXJnZXQiLgo+ID4gCj4gPiBEZXJpdmUgdGhlIGRlc3RpbmF0aW9uIGZyb20gdGhlIFUtQm9v
dCBjb25maWd1cmF0aW9uLCBpbmNsdWRpbmcgdGhlIHZlbmRvcgo+ID4gc3ViLWRpcmVjdG9yeSB0
YWtlbiBmcm9tIENPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFLiBUaGF0IHRyZWUga2VlcHMgdGhl
Cj4gPiBMaW51eCBhcmNoaXRlY3R1cmUgbmFtaW5nLCBzbyBhYXJjaDY0IGhhcyB0byBiZSBtYXBw
ZWQgYmFjayBmcm9tCj4gPiBVQk9PVF9BUkNIICgiYXJtIikgdG8gImFybTY0Ii4KPiA+IAo+IAo+
IMKgIC4uLgo+IAo+ID4gwqDCoAnCoCBTcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBwYXRocyB0byBk
ZXZpY2UgdHJlZSBzb3VyY2UgZmlsZXMKPiA+IC0JwqAgdGhhdCB3aWxsIGJlIGNvcGllZCB0byBh
cmNoL0FSQ0gvZHRzLyBiZWZvcmUgc3RhcnRpbmcgdGhlCj4gPiAtCcKgIGJ1aWxkLgo+ID4gKwnC
oCB0aGF0IHdpbGwgYmUgY29waWVkIGJlZm9yZSBzdGFydGluZyB0aGUgYnVpbGQuCj4gPiArCj4g
PiArCcKgIFRoZXkgYXJlIGNvcGllZCB0byBhcmNoL0FSQ0gvZHRzLywgZXhjZXB0IHRoYXQgYSBj
b25maWd1cmF0aW9uCj4gPiArCcKgIHdpdGggQ09ORklHX09GX1VQU1RSRUFNIChVLUJvb3QgMjAy
NC4wNyBhbmQgbGF0ZXIpIGJ1aWxkcyBpdHMKPiA+ICsJwqAgZGV2aWNlIHRyZWVzIGZyb20gdGhl
IHZlbmRvciBkaXJlY3RvcnkgYmVsb3cgZHRzL3Vwc3RyZWFtL3NyYy8KPiA+ICsJwqAgdGhhdCBD
T05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRSBuYW1lcywgc28gdGhleSBhcmUgY29waWVkCj4gPiAr
CcKgIHRoZXJlIGluc3RlYWQuCj4gPiArCj4gPiArCcKgIFRoZSAqdS1ib290LmR0c2kgZnJhZ21l
bnRzIFUtQm9vdCBpbmNsdWRlcyBvbiBpdHMgb3duIGFyZQo+ID4gKwnCoCBjb3BpZWQgdG8gYXJj
aC9BUkNIL2R0cy8gaW4gZWl0aGVyIGNhc2UsIGFzIHRoYXQgaXMgdGhlIG9ubHkKPiA+ICsJwqAg
cGxhY2UgaXQgbG9va3MgZm9yIHRoZW0uCj4gCj4gLi4uCj4gCj4gPiArIyBXaXRoIENPTkZJR19P
Rl9VUFNUUkVBTSB0aGUgZGV2aWNlIHRyZWVzIGFyZSBidWlsdCBmcm9tIGR0cy91cHN0cmVhbS9z
cmMvCj4gPiArIyBpbnN0ZWFkIG9mIGFyY2gvPGFyY2g+L2R0cy8sIGluIHRoZSB2ZW5kb3Igc3Vi
LWRpcmVjdG9yeSBlbmNvZGVkIGluIHRoZQo+ID4gKyMgZGV2aWNlIHRyZWUgbmFtZS4gVGhhdCB0
cmVlIGtlZXBzIHRoZSBMaW51eCBhcmNoaXRlY3R1cmUgbmFtaW5nLCBzbyBhYXJjaDY0Cj4gPiAr
IyBoYXMgdG8gYmUgbWFwcGVkIGJhY2sgZnJvbSBVQk9PVF9BUkNIICgiYXJtIikgdG8gImFybTY0
Ii4gVGhlIGZyYWdtZW50cwo+ID4gKyMgVS1Cb290IGluY2x1ZGVzIG9uIGl0cyBvd24gYXJlIHNl
YXJjaGVkIGZvciBpbiBhcmNoLzxhcmNoPi9kdHMvIG9ubHksIHNvCj4gPiArIyB0aGV5IHN0YXkg
dGhlcmUgd2hhdGV2ZXIgdGhlIGRldmljZSB0cmVlcyBkby4KPiAKPiBUaG9zZSBjb21tZW50cyBh
cmUgc2ltaWxhciAzIHRpbWVzOiBpbnRvIGNvbmZpZy5pbiwgaW50byB1Ym9vdC5tawo+IGFuZCBp
bnRvIHRoZSBjb21taXQgbG9nLgo+IAo+IEkgd291bGQgcHJlZmVyIHRvIGF2b2lkIHJlYWRpbmcg
dGhlbSAzIHRpbWVzIGFuZCBoYXZpbmcgdGhlbSBvbmx5IGludG8KPiB0aGUgY29tbWl0IGxvZy4K
ClRoYW5rcyBmb3IgdGhlIHF1aWNrIGZlZWRiYWNrISBObyBwcm9ibGVtLCBJJ2xsIHBydW5lIHRo
ZSB0ZXh0cyBuZXh0IHRpbWUuIAoKPiBXaHkgaXMgaXQgc3BlY2lmaWMgdG8gYXJtNjQgPyBXaHkg
aXNuJ3QgdGhpcyBmZWF0dXJlIGdlbmVyaWMgPwoKYXJtNjQgaXMgc3BlY2lhbCBiZWNhdXNlIGl0
IG1hcHMgdG8gImFybSIgQVJDSCBpbiBVLUJvb3QsIHRvZ2V0aGVyCndpdGggYXJtLCB3aGljaCBt
YXBzIHRvICJhcm0iIGFzIHdlbGwuIE90aGVyIEFSQ0hzIHNob3VsZCBiZSAxOjEgbWFwcGluZy4K
Ci0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
