Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E0DCC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CC53408F4;
	Thu, 15 Oct 2026 20:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YskBwKlPsbfr; Thu, 15 Oct 2026 20:26:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9900F408BE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792096018;
	b=pVIrdKC5jpXiUhEC366AfvoNu8ZHOycTrZgKdxpiKBowzL+MB+K4Sye0M74dK66b0JO0
	 Hc5zVk9y3REukW2KlanlHW2M0VEvboP/FfFIg9TOIQrGUEArVifdplnPxoqzyCbHsVlY2
	 by8FYqSjBMcLzAl7T7WSMsPyWexeK5oq5pebFMx0MrmhXQ9zn8dp3bRt80ds5JOF+7U/c
	 r10zgcSlNf/bjU96JxgWLZtgPc5K4+oj0M+vdWkR2DsQeQANJV3zLXdttAELVxiVvHiPG
	 QRhB/HtvsGpySMg3X3y1biR3eI9XWBrB+JWeEQyDwyhPzRhvSupyUvog/rPI7tHDGsA==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792096018;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Pc6rTEIe2HTjO1eih4eQgA5FmdbqAkjCSoVOtGHYSeg=;
	b=kuCepVNg8+vowsmjd73O6g7OyWbv0uu/T66EGP3wN8RbZMfOeFp6UVgrDCAbMmyqvItg
	 cJVF46KCLGWrIZJ1g8Nt8WN2L2jp+BbGN4I21Dm4gNOPWqvEZ0eyJyoK+BCv+xWW4oR1K
	 raQw23NGI7swWy+H6lLPjTWRzGPCgmtEvysHQS++YWUHzEOUcl2HpwlBwHYuEutAe8NQ1
	 G3+Q0OiOxkK3w81NhIWWJ9++FI8yBibgqU4WmO8K8nosihSekYZgIwvZnKF6H4/nXoNDa
	 tmJJwjmPC8DtqoSGsFmfw/q/gQjCbyck9MMGAEaGWaFU9ocmFcAs8D1r6QQjYSBgBgg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792096018;
	bh=Pc6rTEIe2HTjO1eih4eQgA5FmdbqAkjCSoVOtGHYSeg=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XST6AhwI8TwMTAtqjccdJKJZ3g3T2z1QysPKzqS79dGbpG645CBb55H+4Sd1tTqiX
	 ZcFTcODvDTVCIFIjmvprb+bMOBlIc/pGO3FCmwP3vriEHrOAFJ/ozr2gOYPHlaVHYJ
	 ZWGYj8raLyEieedCBsx4/bpgvmD1Nv4ifGO2WWXChzfLJDstdmA+zz/2wWMf5djdRM
	 JR52Km+brIUzQgB0mXMJ1oAS/GHcQN1ktUXyJiz5kd/o3q4TZsokGia5hTxs4hG98F
	 T7q0Z7u5o59hnX3b+X13B+ZhvwWXa7lt713xX8seylBUg//GSZatVDjrTCvmzP7xOQ
	 jwY08SdCAV56g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9900F408BE;
	Thu, 15 Oct 2026 20:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC7D920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C1C40452
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rX656yYGu1Dx for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:26:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C572040087
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::92a"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792096016;
 b=fX6CzWdReUGE0SMScsh2QvcfcDEP9Dq2QpS5wh04EUfQOj3BDozCgbDQ9CLCRUCIzI2e
 x6MiBBXdVx9I1gnQJzUtRz+av/eSkpf2aJOWQ2B0e1IYYB0Z6h8I3Me/cpAgBaSzXe02N
 Zh4I3XKmJkqsSSQQcykSb5s/fxYX658mg1nAvdCI9h6Rx/HVhLViE7jU5Ds74kjilCQVN
 yujIQTSwaYEGCwQCStjw0QHJw3cUwj1Tw8vCRgBeS6djSGJZR+XomGWG22oTx7QCuWEpP
 nYV6AHZJDMTEjjpaEsQzOuxkb52aiXldkAQaaBaL4H+8PEvnNC7AnhycyhJLJ4xl2Yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792096016;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=vFWdYKbxQwEb7NlhOY7y4XRfv9aYOUdEogEb/ge9ul8=;
 b=oOCdoarMrip1kY6E9epBG9yHpCtnIshnrzCcbvuQ/s2HboinR8Vn0piDRnARf4O5vX7z
 Ozv7/bp1sR8GhW4i8m1/QBuJNJHi1xMAnI5i1ciIUo5ztTwkVyzV2p4KvfUYt7L4Ba0LX
 hc3R4hElFpDIoenMt04u/Bu75YmUeEat9z7oUId49dZl9dUtj+SXcq9t5IT8MD/kdOage
 sqJuoNZ6SD9JOlfQpdOG/nkbx6cMCyN4tyIg+H6iSu/iGhC3nmyrivfGoSjgB61ouMXMf
 StKjB+nRTipAqpudwGszI/t4TBOV0OnjaLuLfQp+j88bl5jF3YqMOY7xbg0GKoOd6iA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PCL+ykx+; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::92a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PCL+ykx+
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C572040087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:26:55 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-98c7353395fso1671155241.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 13:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792096014; cv=none;
 d=google.com; s=arc-20260327;
 b=c/lwLuPUNtGOUMoEF/AKp1377G13Vr7ZYPfN1rUVf8aBeGQt5NVSBpPTsUUEQuDyoM
 nwbolrhzhkxHcbo1D47QnJ/m6cvQbisndr3RCWt5C7E4lR3tvNDsBgUM/T6EVOsvacx6
 p0DlItiToYmWGjXjlknf+gRStL52mdY/xxDSbOa6GvoGU04EV75hqi7u3aioMunHAClM
 MfsVkqT1uqPU8WVZ2qTHY/kpvxa6SfMEtfm9HHPo86FVPutl8WC5+VHoV0drgoxdYBl1
 q5rHKZwIJ7vetxF7DLOwzwRCU3dpNLiZaZZBssRS6WKJowVfR0NkUhgbRo5y7M5U+N0F
 eNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vFWdYKbxQwEb7NlhOY7y4XRfv9aYOUdEogEb/ge9ul8=;
 fh=xbOgN+LnOToYmtBzYOVUsFBlo9mXVTr3nMHfWsIwCLk=;
 b=oBc85i+CVj/q2pMz6xuhysNh7fJgyWnCjIjuwRzMlI8Yfiph4E3qmGyvfeIB4+YsXR
 7KDe58mS6RvkrbRyqtsNQnxGf5bvdmugz1H4Z0a56hF7VOIA+OdZvb76fQQP+cQbqZWW
 Wj/j5LoJPiIL03Ird7geAG2DeeBtk7u9XxfLgGzk9ro7xP1bwh8TYaIws5mYJXFx7jdL
 bBZ5UOEyujnVj+1vDM0dEEcr0Lc93eacGLa2uCXPMWIM0Uh4J/OeZ4giHnZToQIZ5Cop
 RKNa6+XMNLwzc7P+Zahqubr75JgEriGhlqi10JI2UzkSIcrwsNeoUowKWic8NfPmpxRK
 AMCQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792096014; x=1792700814; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vFWdYKbxQwEb7NlhOY7y4XRfv9aYOUdEogEb/ge9ul8=;
 b=PCL+ykx+XF4W9bug/w35UZ2LYPNRTnObla5vaiGW0MyeIrcoTeZOYEE1JKcPU+GeS7
 wMPT+cge3g49W3Q4TfmHvH/9DDE6it/NyZyh97v7Wu/hVHsFrk8PUR/gFBq2ZOfKXCXm
 3BfXkP9MXg5V1q84M5Zehx229YWVywdhsRwkeBtjtzkF4ATgT50sIANjCUSK/Q7kSmU7
 jyfm71JonANMZT5qpdaSXNWNIVxSlLwjHRfY7Eq+hdozeDziBgVJAhzPuJScrW8/HgmL
 itunqEajPXh6ZX6gDBrO9DRDo3yU99BNaHr5CrqvWxnjOFdAWpZHbpSxTNRrHOhFQ+Dt
 21JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792096014; x=1792700814;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vFWdYKbxQwEb7NlhOY7y4XRfv9aYOUdEogEb/ge9ul8=;
 b=bKx3XYvBYzZAMvstDvtExIrXPbZFhYnys7B1fuj1+EZgX/dBSQhxPIOEnUaxHjkxcU
 8An3kUGRohaFSa7bErjgqNH52rhR2JRySpmTp95cxjNPNhqA6Hrx26P/57oOsZNc5Gbn
 oNESnFLPEszaaVepcuLfLJ79q0yPsgMZ0SCBU2thGFvaugmUESZgvJX8iHTObeMTFoXk
 +qOcyql9NjcAtDGV8+NvQUd2LdFrlUwAT2r1xr4Ai5vn1KTF9rqmvx2vP+NNlOF+UO+C
 RqHDyW8yXmRWfapjKwCXuKB9JVhXCPVHwDajE3IBGCJsPdO0ZKhsWCdbP3hBE8DOrBbm
 IpGw==
X-Gm-Message-State: AFq9FYKGFGKu2qYus34tzFsVVjN+tfU5clEwceg6a57nSnZJ9mTt4MQG
 ko2PWkVlYMMi04nKRmxhVAMpgPJHlE3pxi8/hKMq3dFc2PhnCoo64N58UY6GJKysBs1gGpBFRaA
 p4pLiiGV8PR/QFEDASq1HTax8+6WS5GiMHA==
X-Gm-Gg: AYBFou2Njl2XXa0d5ucx3fTxkxlRSruL8azLbmzcxNh4EAB02ae/eknuCGtn15ZMfHY
 l0KL6PhFAD8Vc+fozpsv6QRE8dBH/Uf5ue7Vk+FLRGuZIkHooagNz2YI3G2FH6xAYKj3W15xCYI
 oDtCeKbrbR2ojrxsL++NbxQMzG7I5rRTzF5WCpe3sVOhSb5AGkh2OLr02SKcwyjUHGTIJInWRlk
 n/KgpW0hV9CLtCDYCsfqKkijeJlueUy5T80GQeYgBaMGqGrBJE5hkV4V/CZUIjZzaUuTCIavZ0R
 aRY7ke0mWeXa78r+N6TOrIxpfUNmGIvyxVINyamSnoSr46DXbsmTNfynA1H+t0GFyUaGDZqZB61
 pOKHWWmZ/bI/DqDdupbkjVFmEWq6c2qk9xLNP4C12hjzHR4FyAp9b81JtiG2LzaNWKMnh3YpK70
 P3G3naeO8RoFPiSzt3ZayP1uiItehZHaBHP/FYRrlTJ0XB
X-Received: by 2002:a05:6102:1624:b0:790:c7bb:43fd with SMTP id
 ada2fe7eead31-7cb372554admr5336047137.8.1792096014059; Thu, 15 Oct 2026
 13:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
 <20261015193243.3299884-9-james.hilliard1@gmail.com>
 <538fe6fa-3195-44db-82e1-7dba9f48fb7a@gmx.de>
In-Reply-To: <538fe6fa-3195-44db-82e1-7dba9f48fb7a@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 14:26:43 -0600
X-Gm-Features: AclHuK9hfDtPpwTAOq3o0c9A65LH9otcRcOZgmnC9cFS7oc8QciWjbMywlp_efc
Message-ID: <CADvTj4qvKJqrs=zQufpe2TzoEm+ZQsvxBNj3nfEq-bLGCjF7pA@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 9/9] boot/uboot: add
 host-python-pkg-resources dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgMjoyM+KAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gQW0gMTUuMTAuMjYgdW0gMjE6MzIgc2NocmllYiBKYW1lcyBI
aWxsaWFyZDoKPiA+IFUtQm9vdCBjb25maWd1cmF0aW9ucyBzZWxlY3RpbmcgQlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19QWVRIT04zIGFscmVhZHkKPiA+IGRlcGVuZCBvbiBob3N0LXB5dGhvbi1zZXR1
cHRvb2xzLCB3aGljaCBwcm92aWRlZCBwa2dfcmVzb3VyY2VzIGJlZm9yZQo+ID4gaXRzIHJlbW92
YWwgaW4gc2V0dXB0b29scyA4Mi4KPiA+Cj4gPiBBZGQgdGhlIHN0YW5kYWxvbmUgaG9zdCBwYWNr
YWdlIHVuZGVyIHRoZSBzYW1lIGNvbmRpdGlvbiB0byBwcmVzZXJ2ZQo+ID4gcGtnX3Jlc291cmNl
cyBhdmFpbGFiaWxpdHkgZm9yIG9sZGVyIFUtQm9vdCByZWxlYXNlcyBhbmQgdmVuZG9yIHRyZWVz
LAo+ID4gaW5jbHVkaW5nIHZlcnNpb25zIHdob3NlIEJpbm1hbiBzdGlsbCBpbXBvcnRzIGl0Lgo+
Cj4gSSdkIHN0aWxsIGxpa2UgYSBzZXBhcmF0ZSBvcHRpb24uIFdlIG5lZWQgcGtnX3Jlc291cmNl
cyBhcyBhICJsZWFzdCBiYWQiCj4gc29sdXRpb24gc28gb2xkIFUtQm9vdCB2ZXJzaW9ucyBidWls
ZCB3aXRob3V0IEJ1aWxkcm9vdCBnZXR0aW5nIHN0dWNrIG9uCj4gb2xkIHNldHVwdG9vbHMsIGJ1
dCBvdGhlcndpc2UgaXQgc2hvdWxkIG5vdCBiZSB1c2VkIGF0IGFsbC4gSSBrbm93IHRoYXQKPiBt
ZWFucyBkZWZjb25maWdzIHdpbGwgYnJlYWsgdW50aWwgdXBkYXRlZCB0byB1c2UgdGhhdCBvcHRp
b24gKG9yCj4gaG9wZWZ1bGx5IGEgY3VycmVudCBVLUJvb3QgdmVyc2lvbiksIGJ1dCB0aGF0IHNl
ZW1zIGJldHRlciB0byBtZSB0aGFuCj4gZHJhZ2dpbmcgaXQgaW50byBldmVyeSBVLUJvb3QgYnVp
bGQgdGhhdCB1c2VzIFB5dGhvbi4KClllYWgsIEknbSB0aGlua2luZyBpdCBwcm9iYWJseSBtYWtl
cyBtb3JlIHNlbnNlIHRvIHNwbGl0IGl0IG91dCBhcyBhCnNlcGFyYXRlIGZvbGxvdyB1cCBob3dl
dmVyLgoKPgo+IEJlc3QgcmVnYXJkcywKPiBGaW9uYQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1l
cyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+Cj4gPiAtLS0KPiA+IENo
YW5nZXMgdjEgLT4gdjI6Cj4gPiAgICAtIFRpZSBob3N0LXB5dGhvbi1wa2ctcmVzb3VyY2VzIHRv
IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlUSE9OMwo+ID4gICAgICBpbnN0ZWFkIG9mIEJSMl9U
QVJHRVRfVUJPT1RfVVNFX0JJTk1BTi4KPiA+IC0tLQo+ID4gICBib290L3Vib290L3Vib290Lm1r
IHwgNSArKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vi
b290L3Vib290Lm1rCj4gPiBpbmRleCA5NmI4Y2QwZDJlLi5kYWE4NDEzMDljIDEwMDY0NAo+ID4g
LS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ID4gKysrIGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+
ID4gQEAgLTI2OCw3ICsyNjgsMTAgQEAgVUJPT1RfTUFLRV9PUFRTICs9IERUQz0kKEhPU1RfRElS
KS9iaW4vZHRjCj4gPiAgIGVuZGlmCj4gPgo+ID4gICBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1Rf
TkVFRFNfUFlUSE9OMykseSkKPiA+IC1VQk9PVF9ERVBFTkRFTkNJRVMgKz0gaG9zdC1weXRob24z
IGhvc3QtcHl0aG9uLXNldHVwdG9vbHMKPiA+ICtVQk9PVF9ERVBFTkRFTkNJRVMgKz0gXAo+ID4g
KyAgICAgaG9zdC1weXRob24zIFwKPiA+ICsgICAgIGhvc3QtcHl0aG9uLXBrZy1yZXNvdXJjZXMg
XAo+ID4gKyAgICAgaG9zdC1weXRob24tc2V0dXB0b29scwo+ID4gICBlbmRpZgo+ID4KPiA+ICAg
aWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1BZTElCRkRUKSx5KQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
