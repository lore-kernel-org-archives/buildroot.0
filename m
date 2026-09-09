Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DEC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D8A40846;
	Wed,  9 Sep 2026 18:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBazOagdNBCX; Wed,  9 Sep 2026 18:22:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 72BA140A71
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788978143;
	b=fQ4etmZw3OcMCGmnwXwIs1c56f6xf5SFxr9jBqxhDVEvqXSwqr+h/ndnD68nYlwad6Mt
	 F87buqgDZ4rqhCMgIBS+zQ6H2Z+GVu9aR68SIe6ZjRpOyceolSiq0hQelF6MnNUj2Oawo
	 UaXji+Pf3JoD7clKP4Dn0hP37yXVjlwUUxqXbwRfalJC23uh98gUUGWGO3NmO7tdK1oDK
	 GLZLs9CZS/qq4jmDUysjgWHh6DgdhYJ5qWU4oCjZlQaxAr/MO1NJW6F5O+ec9D3GYYhrH
	 4Rezq6vkMvrIVumcszVesIbqIpovxmwAPakMsFV/BsDIcLZToH6hF/Mkc1etyHdndyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788978143;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WwZJzb2vm2QWNdYolFoujLSQnSoI+Jgh/WtM25EDau8=;
	b=N6Ecm2Qa6I/LxJQTWQSzc3Va5jytz6e4YexbMtPFI33I+NZ3quMV1M5cNhO3qsKo3yxW
	 r0Qo2H+w8g9kNKkmMDpHk21STMEZzijPKAg6lK/pparp4HrDgyURXddGEeIXypJjBSQIv
	 nYylrjBok5ey5G3RLRTP4wiFFNxfKcRD3epBIHR43D6P6TBDLTR8hLmATO7PbSNyL6YZh
	 w4RybJhGewwm/1OGIyjh5GG86tOtVv3dy3clgBjehw6hx5jRWxDOgUGkZDJS175gFQWfZ
	 X8TueNrCQBI/sfLZXj88Eek0ZwRJPff55dbeazt/HpSJkXp883EQQpEpTiPDmICUyAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=gAoXw50b;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788978143;
	bh=WwZJzb2vm2QWNdYolFoujLSQnSoI+Jgh/WtM25EDau8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TSpwPQ0I+Hf0mPb+BDd9/CaV6GWPunoQiOTo1gwiV544X2iID3vRD1VL+bUioFvae
	 5e3sQXvne5YTdomQG59PX/UCK1VdTUfRtY0RHHUaExRe/luDDpzFEpj4H2iIfiwlbM
	 amaREakzMYMNoJ++bS6ifcGpxpzsdyqTJrNxQBUS/8b9miUBMh3yyo2u3483Qyna1/
	 H0jxosO3HyuTpvYH1hLBCanauwp+vxQS/u3O2+BORlmp6/LSLHTy90ScaSJv+6Ka1e
	 +lE4ySfgD5iuAtiMohsuLooFdjh8nrmm1uFK3zcLQp/0rsei3jncGtP6oZnoxXZ/II
	 wemgU4anA68TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72BA140A71;
	Wed,  9 Sep 2026 18:22:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A31DD528
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94C8540A71
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yY8NRo326Ptw for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 18:22:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 37D8740846
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788978141;
 b=ayJJLjAdW/yEYUTkEgPY7QCAjr62qqQ4nfocgrxU/tsiVkKj8tVsknyIC5ltPy4N+blf
 dMMRVWfENikOfRxivCJ9DEFKXB1qgYqbafgTQrvXUUDOBFm1LxQpv4Sn19M/L51aBkgOQ
 BI/VHgGT2H5MeJFLxSoi20Ue6kCgK+RMZf7SwHLXhIfHPYoKf9TLEfjm0K6p+/tT+0E5D
 aX4YZr0OZWADlW0m/aruTPhi8pSQbzDch/xUhp7ISA476XMicDLCPWdzxy7mx8eWibJtp
 JsJ7FudvU+0y0Jvzd0gki5XPKKnoOQwBXcdPWkBD8WCt155JFqIroTCPzrck6PClt6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788978141;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qM4RBotSh2jEycVmmEMQJhtuUK7PGPKCad3QYEFMlO4=;
 b=MSHdI6UgXouUDQKNcxdUry4pQ4XwgP5zE0DxZKHpmmsN0pI72aUYpk72DAOFLJ0xaa/m
 tHuW308yCaiy1TAJaIjpGIgWYFZjOz9gtm4ZQEK7Bf75MCrpLZSsI0hWi60G6jBxVLhsN
 kuLebU2l3xJhkUDn3n/AdRuOsst8SkLs32urj1qlILyXfsxGG/lxLOqCm47gHHv5FvTeM
 EKhPs7P/VM38K/ihn3j8vY99xfXmAAX/at+HvAlUnGEzP8s+do+eyNzGG+aHHtA4hHVxV
 v7b7uR2dEWEsSZOHID8V/0m3vXv0UDvw1JXs+S8o60QtxmouKVJpF73/ZiPUyWMleWw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gAoXw50b; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gAoXw50b
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D8740846
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788978134;
 bh=qM4RBotSh2jEycVmmEMQJhtuUK7PGPKCad3QYEFMlO4=;
 h=From:To:Cc:Subject:Date:From;
 b=gAoXw50b2ATAroSZjmS0h/ZbV2fs0wvth2QZ1KvC7xce3HhYTiGO1/CGimjp6cJTm
 KG7rOlkafofINb13aNfvG/EiqMO38H9/HbqmzGxpTAfR8VAtH4baPdf2j07UDgARYf
 7ZyGTsc9vr+YiimKIwFj+N9RglwrX44N60EBB7sjwulAGtJW+MWIR2FBZIkIicHDP9
 0lhy5bEYo82jENaMT47XCqm8HMpkHKGCzPaS3b0dff72rhD5icjan1Sq1LmmtE9pbl
 8Vp5GQfen6B+9FQxumdzZF/KhuyWXRqTLeGCfBYGSUVhUh60invLHuw/ZUiBSO7OSz
 tHJ2IctSBbMiA==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1176A4C338B;
 Wed,  9 Sep 2026 20:22:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46540)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4Mw2-0000000035R-2Eiz;
 Wed, 09 Sep 2026 18:22:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  9 Sep 2026 20:22:13 +0200
Message-ID: <20260909182214.935730-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine-chromium: fix
 build with glibc >= 2.43
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

Tm8gYXV0b2J1aWxkZXIgZXJyb3JzIHdlcmUgcmVjb3JkZWQsIHRoZSBidWlsZCBlcnJvciBjYW4g
YmUgcmVwcm9kdWNlZAp3aXRoIHRoaXMgZGVmY29uZmlnOgoKQlIyX3g4Nl82ND15CkJSMl9UT09M
Q0hBSU5fRVhURVJOQUw9eQpCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVW
PXkKQlIyX1BBQ0tBR0VfTUVTQTNEPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVS
X1NPRlRQSVBFPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9HTFg9eQpCUjJfUEFDS0FHRV9N
RVNBM0RfT1BFTkdMX0VHTD15CkJSMl9QQUNLQUdFX1FUNT15CkJSMl9QQUNLQUdFX1FUNVdFQkVO
R0lORT15CkJSMl9QQUNLQUdFX1hPUkc3PXkKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+Ci0tLQogLi4uLUZpeC1idWlsZC13aXRoLWdsaWJjLTIuNDMtYW5kLWFi
b3ZlLnBhdGNoIHwgNDEgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQxIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3F0NS9xdDV3ZWJlbmdpbmUt
Y2hyb21pdW0vMDAxMC1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQzLWFuZC1hYm92ZS5wYXRjaAoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS8wMDEwLUZpeC1i
dWlsZC13aXRoLWdsaWJjLTIuNDMtYW5kLWFib3ZlLnBhdGNoIGIvcGFja2FnZS9xdDUvcXQ1d2Vi
ZW5naW5lLWNocm9taXVtLzAwMTAtRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi40My1hbmQtYWJvdmUu
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uM2MzYTIwMmFkMQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcXQ1L3F0NXdlYmVuZ2luZS1jaHJvbWl1bS8wMDEw
LUZpeC1idWlsZC13aXRoLWdsaWJjLTIuNDMtYW5kLWFib3ZlLnBhdGNoCkBAIC0wLDAgKzEsNDEg
QEAKK0Zyb20gYmY4YmQ1NTEyOTIwYjI4NDY4ZDk5YjljZTU1MGYwNjE3ZTU3ZDdmNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFBldGVyIFZhcmdhIDxwdmFyZ2FAaW5mLnUtc3plZ2Vk
Lmh1PgorRGF0ZTogTW9uLCAxNiBGZWIgMjAyNiAxNjoxMjo1OCArMDEwMAorU3ViamVjdDogW1BB
VENIXSBbc2FuZGJveF0gRml4IGJ1aWxkIHdpdGggZ2xpYmMtMi40MyBhbmQgYWJvdmUKK01JTUUt
VmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0Nv
bnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworRml4ZXMgZXJyb3I6CisvL3NhbmRib3gv
bGludXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oOjIxODozOTogZXJyb3I6IGV4cGVj
dGVkIGlkZW50aWZpZXIgYmVmb3JlIG51bWVyaWMgY29uc3RhbnQKKyAgMjE4IHwgI2RlZmluZSBT
WVNfU0VDQ09NUCAgICAgICAgICAgICAgICAgICAxCisgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXgorZXJyb3I6IGV4cGVjdGVkIOKAmH3igJkgYmVmb3JlIG51
bWVyaWMgY29uc3RhbnQKKworU2VlIGh0dHBzOi8vY3JidWcuY29tLzQ1NjIxODQwMworCitQaWNr
LXRvOiAxMzQtYmFzZWQgMTMwLWJhc2VkIDEyMi1iYXNlZAorQ2hhbmdlLUlkOiBJNWYyZWE2ODI2
NjUwYjllZmY2YjRkZWZmZjY5NGYyNGUzMDFmNzY2MworUmV2aWV3ZWQtb246IGh0dHBzOi8vY29k
ZXJldmlldy5xdC1wcm9qZWN0Lm9yZy9jL3F0L3F0d2ViZW5naW5lLWNocm9taXVtLysvNzEzMTgx
CitSZXZpZXdlZC1ieTogTW9zcyBIZWltIDxtb3NzLmhlaW1AcXQuaW8+CisKK1Vwc3RyZWFtOiBo
dHRwczovL2dpdGh1Yi5jb20vcXQvcXR3ZWJlbmdpbmUtY2hyb21pdW0vY29tbWl0L2JmOGJkNTUx
MjkyMGIyODQ2OGQ5OWI5Y2U1NTBmMDYxN2U1N2Q3ZjQKKworW0Jlcm5kOiBiYWNrcG9ydGVkIHBh
dGNoXQorU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQor
IGNocm9taXVtL3NhbmRib3gvbGludXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oIHwg
MSArCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCisKK2RpZmYgLS1naXQgYS9jaHJv
bWl1bS9zYW5kYm94L2xpbnV4L3N5c3RlbV9oZWFkZXJzL2xpbnV4X3NlY2NvbXAuaCBiL2Nocm9t
aXVtL3NhbmRib3gvbGludXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oCitpbmRleCA4
NjkwYTk2ZWIwMWIuLjg5ODg4MzY1MDhjNyAxMDA2NDQKKy0tLSBhL2Nocm9taXVtL3NhbmRib3gv
bGludXgvc3lzdGVtX2hlYWRlcnMvbGludXhfc2VjY29tcC5oCisrKysgYi9jaHJvbWl1bS9zYW5k
Ym94L2xpbnV4L3N5c3RlbV9oZWFkZXJzL2xpbnV4X3NlY2NvbXAuaAorQEAgLTYsNiArNiw3IEBA
CisgI2RlZmluZSBTQU5EQk9YX0xJTlVYX1NZU1RFTV9IRUFERVJTX0xJTlVYX1NFQ0NPTVBfSF8K
KyAKKyAjaW5jbHVkZSA8c3RkaW50Lmg+CisrI2luY2x1ZGUgPHNpZ25hbC5oPgorIAorICNpbmNs
dWRlICJidWlsZC9idWlsZF9jb25maWcuaCIKKyAKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
