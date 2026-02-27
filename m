Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4A7FEFB6A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 17:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C9D40C29;
	Fri, 27 Feb 2026 17:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEYDPySosgCN; Fri, 27 Feb 2026 17:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD61440BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772212362;
	bh=ijB99pDO/UIA4iicBoqjQpJi8JYYkK4yyq4TR2na4HU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a0bISNVaweRL7owjNKlJJpJl3ZaLLlwjgBeitS2NvD6nagZls1bvNDf0Xiz+n7MHS
	 d8R/PqKk9hZ42XadTiqZnU6ltUYUKis3LDB11MFRykvDr+yXZ6tVIOC+JHYqDoU2fB
	 H4B1WTHTVE3/6HDwH3saTPn2G+WtFVnuVjapcExkS3bUh5lOa8I0KzPD+BBmIxWTMv
	 cMhGtbtVs4LiLRXk6qr0tki75hASelhzN8vSr11on57Di18obeHOagAgSny+7YFRfo
	 1UKEZypxDJ07R4CfPHSODT7ZDLwpmrNhDv+PiZijXSXnUgUfiM1XyVOilwLsj87riR
	 Y7oSpyE3Vg8bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD61440BCB;
	Fri, 27 Feb 2026 17:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AE9D131
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E440860B5B
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qa7N8I9FaGaO for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 17:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79BA260B59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BA260B59
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79BA260B59
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 17:12:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso1634088f8f.3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 09:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772212358; x=1772817158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=F1Hqjjqt+c7BR/hbOfzS+9H5cFeU0F+7eC3EErtbIf4=;
 b=rxH+D6r1FBDvK35v5VyPElfi3tPO53dJ6TuTkMubMFiPLnFVCw7k9a8SD8DtBNe5PL
 UFzQoMZniuFcX6UHQtLFGA7ruFcMkDVvkDAXWkTXR4sKTWtFYUhZL3MC9epm80BNLVOZ
 5fEDdswmjmkBeeSzIhsoIogEwOZEyHUT1WPxqKaDCplYW8ZgS8BWM4DZ1ocO6BR/575+
 AyeaYv4u7D2sl3VB+IjsVdzuwCiugAI9GpWwJPIXix0rMhNZUq/wKS8YxUWEH/elqqpp
 E4CoiPswk7/DZqg9v8WyM6RkqUKE8rXRRF2RxlqCuZptPt0tQy8a0/TduqN+vWOdUb1b
 8u5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfMBIN2M4QgX0G/NxsaCehXnT/K+6cnDTGnkYaF9v0f/vk3WIt1ao/Ckuge1KoizYbfPPn2ZzTfwA=@buildroot.org
X-Gm-Message-State: AOJu0YzX2Eq9qDO5jC1390fD9RYImpRG9Q0Y6/XKXj8I6k0sWcBdfv/y
 ud3xip3LY7Wa/dXEF5jENA53wUNwN4KFUDWWUpos6++qx6tZGyr/Q2m8LetolJuYX77z5aEnuPe
 fLegB
X-Gm-Gg: ATEYQzyRDRUdqptwPxAmVD/4hnS/apn13ha7F5j1OJN4s6sOqiIB5+Keb9hxjn1aPJH
 CaDnV1a0VkZl1TtRUABFzZOJlFcd2VEFTKsdUi8J5FkMK6AR0WVmpDrhosQIRgrj+wp5OkMCv/B
 Ijc7nAoxGMEis/URXUDpCXn5g3DdeMdkUJpOGRG3vYf9jIEeYxG+rgbx/sYIwJh1LQH/SnMF3dp
 Lj4dsWwIDNNxr990o9wjrIi68OyJUgaJ6PdlfKCg1lCkwPl/57+5cqLk8JdL9YqMLOLan7StFyJ
 zJkN61SXgo2jp/U0z5kH4zYGw+u4RtdzwqdJ2Qx/vd1WNmH/5Zh9Xq3tZ3Zb089aoi4msCwVSxR
 +5L5ZmW8Q2zIALMqyWH2AOlAp1QbsQMUUTiiCBwBMcstQI2i8DmClRzDmsANQQtDiuuVWFUdaDs
 b7psSq7JxLI4oMHRMRafUregwdJA==
X-Received: by 2002:a05:6000:2c0c:b0:436:1872:63d0 with SMTP id
 ffacd0b85a97d-4399dde158dmr6176909f8f.2.1772212358295; 
 Fri, 27 Feb 2026 09:12:38 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c7657c7sm8650407f8f.28.2026.02.27.09.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 09:12:38 -0800 (PST)
To: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin@orange.com>
Date: Fri, 27 Feb 2026 18:12:36 +0100
Message-ID: <20260227171237.161561-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227160842.2905924-1-lazzer@gmail.com>
References: <20260227160842.2905924-1-lazzer@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772212358; x=1772817158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1Hqjjqt+c7BR/hbOfzS+9H5cFeU0F+7eC3EErtbIf4=;
 b=Lb+aqW0vxEeoNEvKKKg2m44oUxXOyWQDJtPlr0awVD/bGSXTlEYa+iizgeWmHOFhn8
 NoZc+B5FCY+qEGdVqVepR+uUI+S5v19qf9AgsCnAS8t/7STbsLmulEwKpFXtekU6oP9U
 zdYG2VoJiK6yg+CltNUcd9aBLvbqXU/xLhcpWnDhM84jZWC6H540IDGOApisEXECXdmp
 /pS1a02co2QLmbONSIxkefckK596GC7ORMOe/kdAMklRBhcjfNgshzGgjyC6FV9XUb+0
 SflvrUY39VQXqoruXrT8Te1dL7668M9VlAHt1I8g29+btNfjiubrJYAaPfQzSx55GYh2
 yutQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Lb+aqW0v
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: Bump version to 3.27.5
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

SGkgTWF0dGlhcywKCkkganVzdCBoYXBwZW4gdG8gc2VuZCBhIHBhdGNoIGZvciBncHNkIGZvciB0
aGUgMjAyNS4wMi54IGJyYW5jaCBhdCB0aGUgc2FtZSB0aW1lIDotKSBbMV1bMl0KCklmIHlvdSBh
cmUgYSB1c2VyIG9mIGdwc2QsIG1heSBJIGFzayB5b3UgdG8gZ2l2ZSBpdCBhIHRyeSB0byB2YWxp
ZGF0ZSBpdCA/CgpUaGFua3MgYSBsb3QgIQpQRVJBTEUgVGhvbWFzCgpbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci88MjAyNjAyMjcxNzAwMTMuMTU5MTc2LTEtdGhvbWFzLnBlcmFsZUBtaW5k
LmJlPgpbMl0gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDI2MDIyNzE3MDAxMy4xNTkxNzYtMS10aG9tYXMucGVyYWxlQG1pbmQuYmUvCgpJbiBy
ZXBseSBvZjoKPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWls
LmNvbT4KCj4gLS0tCj4gIHBhY2thZ2UvZ3BzZC9ncHNkLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uv
Z3BzZC9ncHNkLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dwc2QvZ3BzZC5oYXNo
IGIvcGFja2FnZS9ncHNkL2dwc2QuaGFzaAo+IGluZGV4IGE3Yjc2YWZiYzYuLjM4NjA0YzcyYjgg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ncHNkL2dwc2QuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZ3Bz
ZC9ncHNkLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAt
c2hhMjU2ICBlYmI2NmVkOTIwMThiNzljZWM4OGVmYjYwZTM1YTU5NjkyNWVlZjQ2NTAyY2YwM2Q2
ZmYwYWVhNjM2ZWU3NDYxICBncHNkLTMuMjcuMi50YXIuZ3oKPiArc2hhMjU2ICA0MDk4NzNmNTA0
ODQ2MmVmMWFjNDEzYTUxYWIzNWNhYThiNTBiMzFiZTYyYjMzNDdiZWUxY2MyOTk0ZTdjNjQ5ICBn
cHNkLTMuMjcuNS50YXIuZ3oKPiAgc2hhMjU2ICBmZGYzMzk5OTdiYmNhOWVhZjUwNzQ3NmI4MmZi
Y2FjNjA4ZmMzOWEzZDg5Yjg2YjUxZTE2ZGI0YzlmOTMzNzE2ICBDT1BZSU5HCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZ3BzZC9ncHNkLm1rIGIvcGFja2FnZS9ncHNkL2dwc2QubWsKPiBpbmRleCA2
ZGMwMTI1M2E1Li4yN2EwMmMxNzU0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ3BzZC9ncHNkLm1r
Cj4gKysrIGIvcGFja2FnZS9ncHNkL2dwc2QubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtR1BTRF9WRVJTSU9OID0gMy4yNy4yCj4gK0dQ
U0RfVkVSU0lPTiA9IDMuMjcuNQo+ICBHUFNEX1NJVEUgPSBodHRwOi8vZG93bmxvYWQtbWlycm9y
LnNhdmFubmFoLmdudS5vcmcvcmVsZWFzZXMvZ3BzZAo+ICBHUFNEX0xJQ0VOU0UgPSBCU0QtMi1D
bGF1c2UKPiAgR1BTRF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+IC0tIAo+IDIuNDMuMAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
