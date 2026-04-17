Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4C2F43687
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF51F60D71;
	Fri, 17 Apr 2026 09:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNbAHzbiwyyN; Fri, 17 Apr 2026 09:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C852760D61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776417501;
	bh=7R+wDjCVcoqB2kw2k0eZqM/BvfWtY3lcvmji0H3gi70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=W6hB4zULGt3VWsa2LLB1uDryF1f/avUiefDuu0l8Pg2CR3AlRFwWfm1rdoWmcSgWF
	 qjuYtvSBA/FCyxTGl2GLuTB9AR40CAd5rpPmaQisEpyo6tVu4iQQccbHgquFuetBca
	 qcnyzhQMaElKzQgUnZ5IkkfV0r0fM/0e2y0xifrWRP+wL493FphcwsRYHO+tVkfd4g
	 bonDaCtec8cwryMoDZPgGykZS7fAQ2szOnoq573Wl8mJr8zEejfEcMBSTkiUXXGXDT
	 T1AMwP/g6TCYlL9WvRoFfP1xkfOn/8pzJ7TR0wKeZgef8IA15XwkYpT4vpjJMzKvcB
	 WxhmNTVStNSdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C852760D61;
	Fri, 17 Apr 2026 09:18:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1942C259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 099EA60D61
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKmOvXc_mxFR for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 09:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D02CB60D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D02CB60D4D
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D02CB60D4D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 09:18:18 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so86467466b.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 02:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776417496; x=1777022296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euuDkA+3jIX9z16MqYQuW+CqMec5yrEASzW/8njZ3/g=;
 b=JMj9yrLOCmz1Mq9ZrMPJdSVgLQrO0Rqm4jtVxA/q/+5UNFdDP1uTxaqiPVJO4o6fHt
 6VAVlbOOtwlfowCXmu+6u/HT6dc8R0bTsqMatPaGVVjZy/YYpMWPyFuCKr4OkoarZoqi
 ImGKtU39zFw+LFpVqZwmu3ZZAYYb7S8k1rXGqZtiJ6rmHQMYBntUP2gA6pYMSLIsXiDA
 +J/ixVOATBZZcmWhTTRvYXRW2Jzf90nWPLc9I/8Gg6B24XZq9a35deEuzEE+NEfb+aNY
 UBihyGOp5VMNzrgk8eroIKzLbl4nTs1mRElpLNptXgmhoa7BJYSo144YKvPl643PTvAV
 1jDg==
X-Gm-Message-State: AOJu0YwchYwJcpnj0F+ZVrcoUx5ji2F2JY5EYlQg2tdjqnLeYe2ouvsj
 s2qnSbRa1vNcBGcMZ6zjvZBgI0gE3dbcymx/t489rNMA168hUPcrmzGCRONMX0cJcjnvcEOhatv
 fi5MNtxg=
X-Gm-Gg: AeBDietL1qA6DUolF8Sg4Tu020IjiFpvG8EgKHqW4jLoQWLsBv7yIFiSe8J87KfsN15
 sFoJpRjBNxQIJLKRiMa7fvBemD9AylNsd/OtKH56ch0LEZSFFNbJ4Jaw2fls8N+TDiDb88wb1Ok
 VpBYpJryDLEmxe8+AGMrLTLjfrqCn2NjrqPF/bKSYyyatotC9EAzp/Sxe/KX7PzaSFM/ZUBc8iY
 bExzqwcPtgtN/QLpMlaZApjoaDLv1YhGhZK5/3TI9L0JCm+q8N9yYVfEPxOXZVVvis8qBtPuX57
 u+Qxf4KI57Z/na1A2Y6+ikNh/pWs6FRkyIDtTWZljeTyukQ8cv+QNur0+uc24j8oAt3JaQJ8tcn
 4nE0MID3s8BPg0a5ltiGyfT6Y5kUlwHQ0tjxS312W3omAzZU5TRn/pJNHTNu70mCVKdtjoeEOe8
 cVfPwkBCCEhQi714UhXsYzLolQce9TwMdOfCPodKGffY571kCZVUnEpw==
X-Received: by 2002:a17:907:960b:b0:b9d:68c5:81cc with SMTP id
 a640c23a62f3a-ba41adfa30bmr107031466b.33.1776417496114; 
 Fri, 17 Apr 2026 02:18:16 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba455045898sm35055366b.48.2026.04.17.02.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 02:18:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 11:18:00 +0200
Message-ID: <20260417091800.2374733-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776417496; x=1777022296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=euuDkA+3jIX9z16MqYQuW+CqMec5yrEASzW/8njZ3/g=;
 b=WvgIImiFTxpI+Q08Y7TFMA0AFsknzPBb3Pld3eVCCBeMXnisCnT1OpJSIzQffvEEBF
 K0Hs8dPrcW+b2iRl9hzd1gKuk4pHv61ox6D06RtP1pS8QH99uXD9q3tLfYxZfss31/EZ
 D3J8VXbY+u4QoFgENonRg8DiWn6V3tTdXcImj14ZhhL1e3K8WQksQu0EaYBE6CxHuEYt
 3Lsw6pzLwNHpmIf/CfWDL0JT+76/qgJv59VzVjXNXcwCz3Lh4EcS5XaZXPCVXhNBTjnh
 fsHVmE0RHYB2Rfzrtn1Qb24ohktfspVCxgycUGhP0auomvt6kPhu0bX01Vu1Y2ibPTgt
 SaYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=WvgIImiF
Subject: [Buildroot] [PATCH for 2025.02.x] package/python3: security bump to
 v3.12.13
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>, thomas.perale@mind.be,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2VlIHRoZSByZWxlYXNlIG5vdGVzOiBodHRwczovL3d3dy5weXRob24ub3JnL2Rvd25sb2Fkcy9y
ZWxlYXNlL3B5dGhvbi0zMTIxMy8KClRoaXMgZml4ZXMgYSBoYW5kZnVsIG9mIGJ1Z3MgYW5kIHRo
ZSBmb2xsb3dpbmcgdnVsbmVyYWJpbGl0eToKLSBDVkUtMjAyNC02OTIzOgogICAgVGhlcmUgaXMg
YSBNRURJVU0gc2V2ZXJpdHkgdnVsbmVyYWJpbGl0eSBhZmZlY3RpbmcgQ1B5dGhvbi4gIFRoZQog
ICAgZW1haWwgbW9kdWxlIGRpZG7igJl0IHByb3Blcmx5IHF1b3RlIG5ld2xpbmVzIGZvciBlbWFp
bCBoZWFkZXJzIHdoZW4KICAgIHNlcmlhbGl6aW5nIGFuIGVtYWlsIG1lc3NhZ2UgYWxsb3dpbmcg
Zm9yIGhlYWRlciBpbmplY3Rpb24gd2hlbiBhbgogICAgZW1haWwgIGlzIHNlcmlhbGl6ZWQuCiAg
ICBodHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyNC02OTIzCgpUaGlzIGFs
c28gaW5jbHVkZXMgYSBtaXRpZ2F0aW9uIGZvciBhIGxpYmV4cGF0IHZ1bG5lcmFiaWxpdHk6Ci0g
Q1ZFLTIwMjUtNTkzNzU6CiAgICBsaWJleHBhdCBpbiBFeHBhdCBiZWZvcmUgMi43LjIgYWxsb3dz
IGF0dGFja2VycyB0byB0cmlnZ2VyIGxhcmdlCiAgICBkeW5hbWljIG1lbW9yeSBhbGxvY2F0aW9u
cyB2aWEgYSBzbWFsbCBkb2N1bWVudCB0aGF0IGlzIHN1Ym1pdHRlZCBmb3IKICAgIHBhcnNpbmcu
CiAgICBodHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9pZD1DVkUtMjAyNS01OTM3NQoKU2ln
bmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5i
ZT4KLS0tCiBwYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNoIHwgNiArKystLS0KIHBhY2thZ2Uv
cHl0aG9uMy9weXRob24zLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9u
My5oYXNoIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMuaGFzaAppbmRleCBlZDBkODc5ZjExLi41
YjEwZjI0ZjcwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5oYXNoCisrKyBi
L3BhY2thZ2UvcHl0aG9uMy9weXRob24zLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIEZyb20gaHR0
cHM6Ly93d3cucHl0aG9uLm9yZy9kb3dubG9hZHMvcmVsZWFzZS9weXRob24tMzEyMTEvCi1tZDUg
IDA0ZmViMDEzMTZjN2JiMWI0NDgwMDFhZGJjNjNkZDIzICBQeXRob24tMy4xMi4xMi50YXIueHoK
KyMgRnJvbSBodHRwczovL3d3dy5weXRob24ub3JnL2Rvd25sb2Fkcy9yZWxlYXNlL3B5dGhvbi0z
MTIxMy8KK21kNSAgYjY3ZGM1ZDU1YjI3Yzk4YTM2NjE1ZjdkMGRmYTZlNGMgIFB5dGhvbi0zLjEy
LjEzLnRhci54egogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGZiODVhMTM0MTRiMDI4YzQ5
YmExOGJiZDUyM2MyZDA1NWEzMGI1NmIxOGI5MmNlNDU0ZWEyYzUxZWRjNjU2YzQgIFB5dGhvbi0z
LjEyLjEyLnRhci54egorc2hhMjU2ICBjMDhiYzY1YTgxOTcxYzFkZDU3ODMxODI4MjY1MDMzNjk0
NjZjN2U2NzM3NGQxNjQ2NTE5YWRmMDUyMDdiNjg0ICBQeXRob24tMy4xMi4xMy50YXIueHoKIHNo
YTI1NiAgM2IyZjgxZmUyMWQxODFjNDk5YzU5YTI1NmM4ZTE5Njg0NTVkNjY4OWQyNjlhYTg1Mzcz
YmZiNmFmNDFkYTNiZiAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24zL3B5dGhv
bjMubWsgYi9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tawppbmRleCA0YWNlNGQ4NTczLi42MGFi
NWIwY2JjIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5taworKysgYi9wYWNr
YWdlL3B5dGhvbjMvcHl0aG9uMy5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKIFBZVEhPTjNfVkVSU0lPTl9NQUpPUiA9IDMuMTIKLVBZVEhPTjNfVkVSU0lPTiA9
ICQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS4xMgorUFlUSE9OM19WRVJTSU9OID0gJChQWVRIT04z
X1ZFUlNJT05fTUFKT1IpLjEzCiBQWVRIT04zX1NPVVJDRSA9IFB5dGhvbi0kKFBZVEhPTjNfVkVS
U0lPTikudGFyLnh6CiBQWVRIT04zX1NJVEUgPSBodHRwczovL3B5dGhvbi5vcmcvZnRwL3B5dGhv
bi8kKFBZVEhPTjNfVkVSU0lPTikKIFBZVEhPTjNfTElDRU5TRSA9IFB5dGhvbi0yLjAsIG90aGVy
cwotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
