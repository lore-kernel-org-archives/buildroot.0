Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9114FC83F22
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 11:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59DC260822;
	Fri, 11 Jul 2025 11:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B88FHvdLtlC2; Fri, 11 Jul 2025 11:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BE9960C14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE9960C14;
	Fri, 11 Jul 2025 11:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B031E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D58D540A8F
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4dRIL56dQ4d for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 11:07:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B449040A8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B449040A8B
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B449040A8B
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 11:07:17 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id A1F0F4408FC;
 Fri, 11 Jul 2025 14:05:39 +0300 (IDT)
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,  Thomas Perale
 <thomas.perale@mind.be>
In-Reply-To: <20250711104446.823713-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Fri, 11 Jul 2025 12:44:43 +0200")
References: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
 <20250711104446.823713-1-thomas.perale@mind.be>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 11 Jul 2025 14:07:13 +0300
Message-ID: <87frf3ouji.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1752231939;
 bh=jNG55cO6ZOUL3dxoXz3TxNl9C1wnJEvzkmsSOtuq5Zw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CeCqimJSgowtCNda9DM2MVMRSvjUXz/zxP7tB0pNfS9/f/TpF7Y1nZcwaYqMXnFVr
 LdgXrdgEwxTANVvjEmU6EmHVbvSyHfY9cwHqUBli1xxPsdCXTVOo5+B61USGpPeJ+J
 SxEj2QHDebYOba4jDbiTgBTOi7yEZTiDcJL1Zq22bPK69BlhEt5BvLp4sHCXPvOANy
 ia5Zrw1tGkPvD7MBOK2PLjPu13LZ/mK54yefRcT2EZtYYSd+9RBESqJSfA8wegcArE
 zn7KPyvkyMEtasdU9fwsBbiWLA1OfEqJkjAcawVh7+7NDKe/yUiQsxPzqSqNOR1QmG
 rlu3vNpqEJIQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=CeCqimJS
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix build with
 host GCC 15
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVG9tYXMsCgpPbiBGcmksIEp1bCAxMSAyMDI1LCBUaG9tYXMgUGVyYWxlIHZpYSBidWlsZHJv
b3Qgd3JvdGU6Cj4gSW4gcmVwbHkgb2Y6Cj4+IEJ1aWxkaW5nIGF0OTFib290c3RyYXAzIHdpdGgg
R0NDMTUgZmFpbHMgd2l0aDoKPj4gCj4+ICAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9y
OiDigJhib29s4oCZIGNhbm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCj4+ICAgICAg
ICAyMyB8IHR5cGVkZWYgdW5zaWduZWQgY2hhciBib29sOwo+PiAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgXn5+fgo+PiAgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDi
gJhib29s4oCZIGlzIGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPj4gCj4+
IFRoaXMgaXMgZHVlIHRvIEdDQyAxNSBkZWZhdWx0aW5nIHRvIHRoZSBDMjMgbGFuZ3VhZ2UgZGlh
bGVjdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5j
bnJzLmZyPgo+Cj4gQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI1LjA1LnguIFRoYW5rcwoKTm90
IGluIDIwMjUuMDIueCBhcyBvZiBjb21taXQgOTQ2YjdmZjIyODBhYQooInN1cHBvcnQvZGVwZW5k
ZW5jaWVzL2NoZWNrLWhvc3QtY21ha2UubWs6IHNldCBob3N0LWNtYWtlIG1heAp2ZXJzaW9uIiku
CgpiYXJ1Y2gKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQogICAt
IGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRr
b3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
