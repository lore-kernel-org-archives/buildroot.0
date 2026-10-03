Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576A8CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B53440E97;
	Sat,  3 Oct 2026 07:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8cNvvh4FpzC; Sat,  3 Oct 2026 07:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2F17240E95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011394;
	b=jqY4cNtiRDyvaqHTd4d52+BJyiVI2946XTJDoUiy6qOIWq++UmKS4UVU3meIG636ST4l
	 eqNYw9RZYpTANZS+dkQmLawctC/AH6gAZsAg+ePDIN1PW0KKcNFHXALEhKKYoA/saYVnX
	 OfneO2mi2T7O8MRUoIkL8Ltp9S+i9BlUF+DKsHhKysEalicGmevhMkWqrVbt+6RJtJuRM
	 oPKe5bfrppQORAp+sMYdvf9UQHApEheQ+8H/PI4FadRSoUKRfC7whKzHw/ONLqnX2KVDk
	 ublA8jsqbMpbryws3WHvcZw9KeVzL5+hxz/5bKdpMoSPwsntSz+TipA8OxAMbGrENhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011394;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tGwgtdT6l6a5d1G79D0uFS9OXPTgGisLOi4pVXnRFxA=;
	b=j+RunyhvsR6nogISyse3TVuU1JShDxVIueh3TWIOMasGC3HW0p9yNrWVCelhJx0p0jvf
	 1cSQ8maDzk0s15T2h3G6NneW7WdxzqP0EQYUCuAvkrDGNcOAYm1QK/Nr7fWEk38h34m3K
	 R87U5CoVfQn4inGZIgnHtGerzz088xzfMxqiO51ordpVLi65jxzXhtO/2/hMifTRteU8+
	 d3VmcxODJZ3mqozVgSCMDWCmTq1T8aVdUc7AYOqm7sCsRRX8tCKp3cSuduVr9gbzbblXB
	 eBgKlvSvBHCZxHIEPyQvChVh7xVsL0QkXTWrIhIz3mpq956OPuSRffdeq6S4tLKQwDw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011394;
	bh=tGwgtdT6l6a5d1G79D0uFS9OXPTgGisLOi4pVXnRFxA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pblBcKCP1zYROBdF4ti+pQrpWWMEHoyeKEora8+Yr924dkHzTuTiRcmkIUo5CJ4xk
	 xDX7bevBAIhHo+g2p/610HB5CBndZY3hk0aOQkR1sDuw4Wo3wpm8AtM9EDMvz3TMQk
	 eOzs8fhpbxCrjNGif3QzaHFr/1vBNkLImLIH/7PvHK+xqAB3VpDer+AHwopQwAUpok
	 MNvz3RKUCcxSPH/bgvX5lZ/ChCN7UKV1qOpZc4B6lAyX3ra8hMu2ammjAklR6ZwUXS
	 zat1kZkm3iivJhYaDJYfiqLAuW+USmdjLC7p+kfZPfhtI/IFglJSnaAyAzHdxXl/3m
	 yi2b7/Qmghc2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F17240E95;
	Sat,  3 Oct 2026 07:09:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5C6263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C31340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id binRgWJRZMiS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B272440050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011392;
 b=NHcLo+LIw/z7josGY6ktXka8WNArmYYv6UevZbm+g+RA4sjVTaw3HTP+ZMbNR1UuVbQI
 MpOoHRra2hsP/cIIwy4zA1VYuOX4gtKdpEV4WvHgBfHwgnes+B/u5Gi6iS+MUBbY8Fe8F
 lCsNo2IT5EgNg7w7iSCTeWnwhR9yvzdpZ5XoarUHIM4ZLulyebqyxmTnsRUh3gMx5w+iB
 iSb/EUt0ll/zK/StGO7wRIncRZEcBNiWHcyAsEJSU16Q7WpBfXXwfMzQOZJTvdLPkhy62
 nPOM4/xdbBuMP8IEOlIG8zWj/ifJG2JT/IdVmBkY38qTzGclHoLVy0ryTkYS22GAnMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011392;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZRTNvRWxhcCbVrQRPD6qzso3OMfcJ2FV4eApE0GjyN8=;
 b=ql7lJBbcIL8p4scQiTEYuwS9owD0wMFFUlCvUzGlDwSmDffvkq9cqiniskMokJv9/cG5
 pqyF6zMDw2Z5sO9mN3mw1OoGzKGMHJTo1Si9V5jRJ+BwE9efggSi3xW6uiZPord+KbiO8
 oxC729vX75AiJVi8ra4f9Vt6fPNeOxGjPmf7zRsGhBIdIkOe8zz0w0GjjNa/5ARIUu0S4
 hr8XFphVXmD0rI9z6BXrsd9UWwpfxhqAKo5y/WrQYdc/iXMnIFlqKFyrsFd/7tf3CbeNL
 +GozU/pIZSfq/bKdloSsCa01zXl++rhlUoA5VFLswf8wdaW7W/QP8/H+eF+WNRuJZzg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ra7YoUOq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ra7YoUOq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B272440050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010929;
 bh=ZRTNvRWxhcCbVrQRPD6qzso3OMfcJ2FV4eApE0GjyN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ra7YoUOqRN3CnLG56uqm+6+qEgEBOAy3gC8aBOinBgN12Y3N+gt9M70cPJ2AjgvOI
 cs8VjyP7eYdGC/zN55+mYFAyfG+JcqZ1AmvP3adFheuAsVo1WRBbyF9elSZhD2IGSa
 GVyjUeWJFZnwS720eY4ZW7MheGPguV3dHM0WdihOCJfBWxxAmz+CEfAdUsFw90ciYL
 L71Z1k3AphQOuKHvRLBkSVP1q5mHIN2e3W2sR5FvB/VGnLsIcLp8I/d2fHFpZEDunh
 Z3jg0B/Yvf5ewQXK9g3J5zPlMHHgb45L6xqCmEYRfwdcx02Oaiqgn4zMHH0HB4NS/Z
 4pCvNjH79FVYQ==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 B5e5pg8agNnVjQlOycJXU6CL7XpJRG+QbwAw2b8XN8KNBYPGv+90irtmwPvjZ6Gz2rduKF+p6aH
 pKKdJGcDqU+2Qg0tve3QcAITWxV74XzqbA1jo+q5WoZ5kSSgE9yGZ4tv86inRiGkDa3XSFOCYi5
 8MgcKiFmsBw3b4bS6HZmt4pSpzYkTJZKTaHt6eLaTgDIrwqA/c38UJYmCsOtS1ahAz4DK+brXMK
 +k/HTctTWbLJXLVc1/2uygM3FyUEWXToBHqxAhStDXeKLcfqN1BNQF3eiUMYt9KBtvMinP3Peij
 vMI/E9s2cVtkHhqGgpx8Ytb1ljiyTcaN4EgFTwV8bsGvWiw7UVk3357xdKdzsGGcS7JtFyvu5Nz
 azjdIzXFAx+cXSOS9vN9uv/OYdqfebGg/pvcEY6T7cckafhSlPSpDfBsWk4YXjmjmzT2hwll0Mh
 beKWRBzBa72SuK7WznY+3vX0s9BzZpBw8VGILbYD3s4Qomurb56LFtFbVg8pBw7Gl1KqDB16y9x
 oPETdVcvWEfMZ9h7fiMZk7bL/Qx65Qu56gFn7rdj75/byYZKDzEgGVZtaEIVCoC9DQi6OmtX4M0
 pNMpI9R0/ILD1MaOLMYV/Ri5drhE64LLJjomLo+Tbp1WAEE/OC5dh6YnXXyowzCU
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52C5CA4C5431;
 Sat,  3 Oct 2026 09:02:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkh-000000007Zo-0en7;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:50 +0200
Message-ID: <20261003070128.1295458-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 078/114] package/python-s3transfer: bump version
 to 0.19.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpDYzogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgpDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3Rz
QGdvb2dsZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMz
dHJhbnNmZXIuaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24t
czN0cmFuc2Zlci5tayAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVy
L3B5dGhvbi1zM3RyYW5zZmVyLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1zM3RyYW5zZmVyL3B5dGhv
bi1zM3RyYW5zZmVyLmhhc2gKaW5kZXggYzdlNjJjZTVjOS4uYzA4OTIwN2IxZiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5oYXNoCisrKyBi
L3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIuaGFzaApAQCAtMSw1
ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvczN0cmFu
c2Zlci9qc29uCi1tZDUgIGU4NWRkNWJkMDAxMjhkOWYxMzhkYjBkNDllYzI0YWNkICBzM3RyYW5z
ZmVyLTAuMTcuMC50YXIuZ3oKLXNoYTI1NiAgOWVkZWI2ZDFjM2MyZjg5ZDYwNTAzNDg1NDg4MzRh
ZDgyODk2MTBkODg2ZTViZjdiNzIwNzcyOGJkNDNjZTMzYSAgczN0cmFuc2Zlci0wLjE3LjAudGFy
Lmd6CittZDUgIGI5N2RiNzUyYjA4ZTFjZWE5NWI3Zjk1ODc4OGQ4M2VkICBzM3RyYW5zZmVyLTAu
MTkuMi50YXIuZ3oKK3NoYTI1NiAgYmEwMzA5ZmQ4NmJlM2MyN2RiZjc4Y2RkODEzYzEzYzVlMWRm
MTZlNTg3NGI5OWQyNTM1ZWJiZGZiOTg5Mjk5MyAgczN0cmFuc2Zlci0wLjE5LjIudGFyLmd6CiAj
IExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYz
YmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBMSUNF
TlNFLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tczN0cmFuc2Zlci9weXRob24tczN0
cmFuc2Zlci5tayBiL3BhY2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvcHl0aG9uLXMzdHJhbnNmZXIu
bWsKaW5kZXggZjA0MTZiYWI5MC4uMTJkNjU0ZGE2MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRo
b24tczN0cmFuc2Zlci9weXRob24tczN0cmFuc2Zlci5taworKysgYi9wYWNrYWdlL3B5dGhvbi1z
M3RyYW5zZmVyL3B5dGhvbi1zM3RyYW5zZmVyLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotUFlUSE9OX1MzVFJBTlNGRVJfVkVSU0lPTiA9IDAuMTcuMAor
UFlUSE9OX1MzVFJBTlNGRVJfVkVSU0lPTiA9IDAuMTkuMgogUFlUSE9OX1MzVFJBTlNGRVJfU09V
UkNFID0gczN0cmFuc2Zlci0kKFBZVEhPTl9TM1RSQU5TRkVSX1ZFUlNJT04pLnRhci5negotUFlU
SE9OX1MzVFJBTlNGRVJfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy85Yi9lYy83YzY5MmNkZTkxMjViNzdlODRiMzA3MzU0ZDRmYjcwNWY5OGI4Y2NhZDU5YTAz
NmQ1OTU3Y2E3NWJmYzMKK1BZVEhPTl9TM1RSQU5TRkVSX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNzYvNDMvMzVlNGQ4YWEzMjBiZmZlODI4N2ZlOGY2NWY1
NzhmYTJkMmRiMGE2NDIxMmYwZTcxMGRjZTU4MjY3ODU0CiBQWVRIT05fUzNUUkFOU0ZFUl9TRVRV
UF9UWVBFID0gc2V0dXB0b29scwogUFlUSE9OX1MzVFJBTlNGRVJfTElDRU5TRSA9IEFwYWNoZS0y
LjAKIFBZVEhPTl9TM1RSQU5TRkVSX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAotLSAKMi40
Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
