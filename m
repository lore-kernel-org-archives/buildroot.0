Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F182C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF5E8130B;
	Wed,  3 Jul 2024 21:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPzD2VW1djj1; Wed,  3 Jul 2024 21:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60466812EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60466812EE;
	Wed,  3 Jul 2024 21:38:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B92741BF2C3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE07241B07
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4YiU7E1FVtQ for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 21:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18D2241A74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D2241A74
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18D2241A74
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 21:38:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42567ddf099so41110065e9.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 14:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720042696; x=1720647496;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kJRpucDcuKuwien4J3A++QkG6OHxuiAPwNzCKxqkWRw=;
 b=HpFH6mmt4K492rRnUOOr6UwspLc4oK/bh0llFFfDDDsXOfv4Zl+5Gtmc8TYyZB8kUe
 MgBfQtZOWdpK7G7KSzG5YNgb4w1BsSuCkWsQJ7pAOhNHmSnyxwoY/tJCwvGnfc1cUPE4
 RaCz55GUIAO8uA4nAJMrjCDFUgBqtHV4teqKnJf5agu4P1r2SBwZShYLGaMbb7N5Z6OL
 CK4Ya6UM4j0WcY6ctIlYzs+gocG4pjkulAnRG0PCdf9gGX+6xovN6IY0V156SPC+5zxi
 px4dHvv5GpWjUG3pXwLvanQ4w9XXSNrVhskCkgHLaPbrsZah8t9MKvzJxS1tZI0fd+mE
 JVXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFF1HPUk8if/drW0PLpBAXpIQl+e8IR+sd399C0YFrIuPJzOJkdOrlckpSRYAXYw7dgBIoJhNZZ3DaM6gGg3bvT23lt64RnQ==
X-Gm-Message-State: AOJu0Ywx/+IT9s+qnAT/QQK0sZzBH+z5sSwuqBwylsEnlCmgiwvq7N5O
 G6lF87wcg795ogag47LKW15qxAbQHO7YzXS+3ZQr6dzjeWH6V3Cw13pGxs+YsIU=
X-Google-Smtp-Source: AGHT+IFfdOVFac4gJcPLQNE+payh40WLOz55PXuKqVSQ5aD5nDkEj1uuvoUG/ohqCMy1p5vDB/c04A==
X-Received: by 2002:a05:600c:5251:b0:424:a3d7:2a7b with SMTP id
 5b1f17b1804b1-4257a00ac8dmr78617545e9.5.1720042695884; 
 Wed, 03 Jul 2024 14:38:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3d004sm253955595e9.4.2024.07.03.14.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 14:38:15 -0700 (PDT)
Message-ID: <f084e7c0-3d05-4e79-986f-fc6a9cc1098a@smile.fr>
Date: Wed, 3 Jul 2024 23:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240701145708.2886402-3-raphael.melotte@mind.be>
Content-Language: fr, en-US
In-Reply-To: <20240701145708.2886402-3-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720042696; x=1720647496; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kJRpucDcuKuwien4J3A++QkG6OHxuiAPwNzCKxqkWRw=;
 b=ossdE0KCJ6MhnBVOjOv6bh1qZGy4jiUgKkWP4Ci55vKWjbwnVU+/8D5TkXJr4HH+SC
 YgdjKZwrC7PtD7WddprWoh2L+mhOvaZV/HuV/q/7wnsxr0w1yEWVTiv3sNv8Cqi2CxY6
 wjuiudyRJ4/T2Npg45l2gPzkYcjvQn2biog84=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ossdE0KC
Subject: Re: [Buildroot] [PATCH 3/4] package/python-sdbus-networkmanager:
 new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGHDq2wsCgpMZSAwMS8wNy8yMDI0IMOgIDE2OjU3LCBSYXBoYcOrbCBNw6lsb3R0
ZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOp
bG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgo+IC0tLQo+ICBERVZFTE9QRVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2Uv
cHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyL0NvbmZpZy5pbiAgICAgIHwgIDggKysrKysrKysK
PiAgLi4uL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci5oYXNoICAgICAgICAgICAgICAgfCAg
NSArKysrKwo+ICAuLi4vcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLm1rICAgICAgICAgICAg
ICAgICB8IDE0ICsrKysrKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21h
bmFnZXIvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1zZGJ1
cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIuaGFzaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvcHl0aG9u
LXNkYnVzLW5ldHdvcmttYW5hZ2VyLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9E
RVZFTE9QRVJTCj4gaW5kZXggMTQ2YzZmZmVhNS4uOWFiZjJkNDkwYiAxMDA2NDQKPiAtLS0gYS9E
RVZFTE9QRVJTCj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yNjY5LDYgKzI2NjksNyBAQCBGOglw
YWNrYWdlL3B5dGhvbi1weW11cGRmLwo+ICBGOglwYWNrYWdlL3B5dGhvbi1yc2EvCj4gIEY6CXBh
Y2thZ2UvcHl0aG9uLXMzdHJhbnNmZXIvCj4gIEY6CXBhY2thZ2UvcHl0aG9uLXNkYnVzLwo+ICtG
OglwYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci8KPiAgRjoJc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9qbWVzcGF0aC5weQo+ICBGOglzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3JzYS5weQo+ICBGOglzdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3MzdHJhbnNmZXIucHkKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDQ1
ZDhhOGM3ZWMuLjE2YTA4NzQ1Y2YgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC0xMzM1LDYgKzEzMzUsNyBAQCBtZW51ICJFeHRl
cm5hbCBweXRob24gbW9kdWxlcyIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24tc2NoZWR1bGUv
Q29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1zY2lweS9Db25maWcuaW4iCj4g
IAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXNkYnVzL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFj
a2FnZS9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIvQ29uZmlnLmluIgo+ICAJc291cmNlICJw
YWNrYWdlL3B5dGhvbi1zZG5vdGlmeS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLXNlY3JldHN0b3JhZ2UvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1z
ZWUvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3Jr
bWFuYWdlci9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9D
b25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmNlNzEz
NzM2NGUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc2RidXMtbmV0d29y
a21hbmFnZXIvQ29uZmlnLmluCj4gQEAgLTAsMCArMSw4IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FH
RV9QWVRIT05fU0RCVVNfTkVUV09SS01BTkFHRVIKPiArCWJvb2wgInB5dGhvbi1zZGJ1cy1uZXR3
b3JrbWFuYWdlciIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTkVUV09SS19NQU5BR0VSICMg
cnVudGltZQo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9TREJVUyAjIHJ1bnRpbWUKPiAr
CWhlbHAKPiArCSAgTmV0d29ya01hbmFnZXIgYmluZHMgZm9yIHNkYnVzLgo+ICsKPiArCSAgaHR0
cHM6Ly9naXRodWIuY29tL2lnbzk1ODYyL3B5dGhvbi1zZGJ1cwoKUGxlYXNlLCBhZGQgYSBjb21t
ZW50IHdoZW4gbmV0d29ya21hbmFnZXIgaXMgZGlzYWJsZWQ6Cgpjb21tZW50ICJweXRob24tc2Ri
dXMtbmV0d29ya21hbmFnZXIgbmVlZHMgbmV0d29ya21hbmFnZXIiCglkZXBlbmRzIG9uICFCUjJf
UEFDS0FHRV9ORVRXT1JLX01BTkFHRVIKCihPayBpdCdzIHJlYWxseSBvYnZpb3VzIHRoYW5rcyB0
byB0aGUgcGFja2FnZSBuYW1lKQoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2RidXMt
bmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLmhhc2ggYi9wYWNrYWdl
L3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIu
aGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZGE2NWUzY2Rh
NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFu
YWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFnZXIuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+
ICsjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3NkYnVzLW5ldHdvcmtt
YW5hZ2VyL2pzb24KPiArbWQ1ICBjZTI3OTA4NTU5ZjIwMDIxOWEwOTBiNjE1MDNjMmVmNiAgc2Ri
dXMtbmV0d29ya21hbmFnZXItMi4wLjAudGFyLmd6Cj4gK3NoYTI1NiAgMzU3MmFjM2E4MTg5YzY4
M2VjMDQxNmFjYjE0ODc2MTc3M2E4ZjA4ODFhZDNkNzhiNmQ2ZjY4NjRlZmY5YzUwYiAgc2RidXMt
bmV0d29ya21hbmFnZXItMi4wLjAudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYg
Y2hlY2tzdW1zCj4gK3NoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1
YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMtbmV0d29ya21hbmFn
ZXIubWsgYi9wYWNrYWdlL3B5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlci9weXRob24tc2RidXMt
bmV0d29ya21hbmFnZXIubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLjgzM2MwODA0MzQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc2Ri
dXMtbmV0d29ya21hbmFnZXIvcHl0aG9uLXNkYnVzLW5ldHdvcmttYW5hZ2VyLm1rCj4gQEAgLTAs
MCArMSwxNCBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcHl0aG9uLXNk
YnVzLW5ldHdvcmttYW5hZ2VyCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4g
K1BZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9WRVJTSU9OID0gMi4wLjAKPiArUFlUSE9OX1NE
QlVTX05FVFdPUktNQU5BR0VSX1NPVVJDRSA9IHNkYnVzLW5ldHdvcmttYW5hZ2VyLSQoUFlUSE9O
X1NEQlVTX05FVFdPUktNQU5BR0VSX1ZFUlNJT04pLnRhci5nego+ICtQWVRIT05fU0RCVVNfTkVU
V09SS01BTkFHRVJfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdl
cy8zMS9hYi9lODY0YzZjMmViNzc4YzE5NGNmYjU2Y2Q5ZDk4YjU1OTRkYzAwNTczMjEwZmRmNmI0
NDkwNDc0NWEwYmYKPiArUFlUSE9OX1NEQlVTX05FVFdPUktNQU5BR0VSX1NFVFVQX1RZUEUgPSBz
ZXR1cHRvb2xzCj4gK1BZVEhPTl9TREJVU19ORVRXT1JLTUFOQUdFUl9MSUNFTlNFID0gR05VIExl
c3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHYyIG9yIGxhdGVyIChMR1BMdjIrKQoKVXNlIFNQ
RFggbGljZW5zZSBmb3JtYXQ6IExHUEwtMi4wKwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICtQ
WVRIT05fU0RCVVNfTkVUV09SS01BTkFHRVJfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArCj4g
KyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
