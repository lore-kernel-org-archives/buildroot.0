Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D9FCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87954099A;
	Sat, 10 Oct 2026 09:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vZ3LVnVDC9E; Sat, 10 Oct 2026 09:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D9B064093F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624243;
	b=DSOJMcSmtE/BeP+jhwEMs+7+15C6+Pq28pcaJboYGpzlUfhhPxr1h1VRjoruTeUVi+CO
	 VRIEqb/ZY5AqpE+0tlgsUUjJ3QmH3e/b0TS4FTTesEDb9iO48uJAHfSwLB7Uw7wIwlgkk
	 h6Lm5vGqtNPszHBQpkExGhWp/pzn1okybyPHdwHJrVY1utX+Ybc5MWJL4nQ98uObQWKj6
	 Gxq+r0gVeBdDd2x7s9dH7etgT+Tzd1Qd8MaE4/3HhI2WskBnmE+tEAlD08uG0uspt488U
	 KDwW/+S9VfUx8xa5jbNaEAcTuxFiEQEFASYHqrdCjta//kRJE2jKBsFtp8jaG8OYfsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SpLWgHmEn8UT8CmycISto6P4hTqtMS5NEfcKC2+/AZU=;
	b=SNVHkq4pVeDwgCrqhXOU8Ftwmy6MwqqshvljrEdbOVkzo5OO7qC09SMgx7XhfuBJ3xZI
	 wFm1ouxG4reuLTY8cYfj7PUF8OzzKGQKdwmlIr1+5SagAacKnSO4HBinSPc3PnODVALC1
	 vw7XUtdIrN8xINQ1qOFfM1kAWsNYL0rEaOiM8hbgu6ZzhqCDwrf2ubpuT2bG9f+i/C3Jw
	 S6NUTagKbsvBDdChxQikYGF0OOfoNUdwurbdcMq9t86MW7JKoiOBRduANqhyfvE4uIjRn
	 Lmj3w3jbaGJJ59CqAIj2mC1ARu/+u2Ex+wQsvEaJvICk9tiKdADFR091iGdbhMAie0w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624242;
	bh=SpLWgHmEn8UT8CmycISto6P4hTqtMS5NEfcKC2+/AZU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=adJ/wipfvmKkZJZWc2jGzI4JqUqCND5y66mlJPc7h6h8SZCfdWvJjDlppKplTlAXm
	 IzxaDixx0bTpeBrLPVR20mJOWqZB27Rpd1g9PizKGFvrJGFQIAY9yKEcDptQVAcQKE
	 W/9ujoZgsxOkn77aFu5UJQrr11XwZCQHHCquxp6LQ8opftMvrc3oQqyCx3QhA7rs2Y
	 id6ErOj8FJpNmciO6Z46hVWv1Er7zoU23mpYx1HnYbkk0MdLxk60+2bMMMW8nHFzBT
	 otgEx0YYaUY5zPR8+S1uiVMemjpDyOaD5LYIWHvuRC+lTtkasGCiDEj0IXqvqWWBsq
	 3FESk+PTXWVKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B064093F;
	Sat, 10 Oct 2026 09:24:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0A8356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6964093F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lk0aD2LkLzTK for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B92640659
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624240;
 b=cPYJso8MFI7oTFYa+/aMvZiNuGARs6rKFjuEEolTT6AuPd3r8l+Jby/GDnmz5OcF17m2
 IGLKQD4D+CfXxfmHw5mT0PRGcawT2ospuxvXMYaer7lZFaGROiHmFnYHyZqCczgi9iyLp
 OLiwTsbe61NlzOnvUx6Wr1+JB0JjyPYnelqjOpJKO2t1lHIlBVC3EoYI3jcIiLOGtykQw
 HNvh5FKlts8p5jQIGka8rDI4WOyIimAMqRINrJTw4uSQQAzTlKkn5TQQX2uUAUFVG1cX1
 7FegftOIbM7shXWR+eHNHXtkN6+XPuZLHy0w+YsD6gXnEZ51EC7CbuhZEsdB0IvX+vQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624240;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=xe87yfD4VI03tT4yPuM0L5iApqCsCEHHWQjkDeemGX4=;
 b=afdhlUS/Mqf5dsb5HfpD1q5k+MgOU3gQIUqVvd3l7M0rVYnGa+9Ot/H6DXvfyi0TWACc
 CnqIOTPgi5nmoRm0l0UhkSI7bCZuvOCtIc2HGxxrkUY3Xm/Yq39JLifRiwzkmqfobXiZ+
 7LhUDoSdFC5yS6aDHSkFnTjnhFrZdK4WsmO5n+t902/H9AExwtoFHblAjfAL8CLBo6Ra9
 pBSQyJxfSfedyJScEJ5RT6eYzYamQRrBCxjiiuMc9RO/3cqiZv/g0fD6+n/TsGKM/LywV
 W0G+zIstyDMJ3z2FCy8gevGeCHti2rDjH78vBqwv5foM4dxy3LyA0eAwVypVjQiWDDA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QLm1OS1N; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B92640659
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a02718da81so3741545e9.1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624237; x=1792229037;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xe87yfD4VI03tT4yPuM0L5iApqCsCEHHWQjkDeemGX4=;
 b=KrSbvMYpN6XKQZO+euo6twxu32us6kMWHlNNvU1+XGCkNm7INA0OsMEVsCsAAlgj3E
 fzVkEXPLK810nDSERUZrlP2ZImQo83Zh38Vo3FZkTkdT+N4pDDF6iSDGoY1jFrlMxw7l
 VEVj6FtDGwEGruV70EngX9hMaVPYW5EU9Sh07L6kCDn7HD0aodRefItmE2aL9mK1kAuv
 vnQLH1v3c066aGqIT/D0hD4EwHom/90jB1XPioztnv4WHcQJJ+yx8f1jEMItkjCY6FXC
 ZlxkcBuQ9W5jNKCRwLUy8ba1OQcLQj0R2o+/YyH49/qlsvHRI/2/YuaP17FeVIZGsEM1
 INmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAWJ39W+bPt73z70h1KMXxCeK2CerUBLypNaM7cwI8biLesgP+FGArTByPyKBKqPU3ezJkmQby8I4=@buildroot.org
X-Gm-Message-State: AFq9FYJXUY0ym8fKOcWHpAFYu7pRJwWeSte+vi6t224SOxL7oGkGoaoU
 wVWpCuukWFvAGJ1bOWDC5OsJ+w8CZrsK2fHsEzXeVMEEiEMKCsUiBRS3Gh0iz+1u87A=
X-Gm-Gg: AYBFou02RIZTzVzHXmVOXPAYii18VRaNUbGCH2p3OOOm2FHPE+iVKQa6w5R1ZuySnCg
 cFYBnL1LOD18de+MzWtEJPsaRCxKieBpbtgBziSsyM/Js7Z+RDoH0oUEp5EJiGbqN4YMqXJC5um
 2e/2I2c7qUWZCTqylMckZOuqA0zEuE+Up+qieedeR8jemAdK8iVKt5d9cFn4nquWlyUX1ND1OGc
 CeRVMYKy+PpGnyUQnznPl4x0tKGRXHIaGz4Gsll2BH6oMxwOVp1BNQbIbDR2URZkoM2iBWE/s/x
 Zb5E8OqTGcpVWwaGZMMuRFGFaBTSOMGl+kAdJcIpqvMAXdhpBrWhskr+dij7Azpp2J3mtt+I99u
 KjUMHY2ruttxkaZIGEvxfX8APOqVWopn4ebDD9sakhXapoE7rARyw3l/esJcwH1MgQ3kBgrrsvs
 G/np0EdFE75MD41fW+7Huo8FWxRp7v8kE4d0B1WUTif/8YvPwW+l7UH4+jQeTeNun8IaaduLGUH
 4KVA9VgWTlR3lDsDfbmG563XrfdQjkYvVw9HVoVXnlt+BocR4sdffEi
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id
 5b1f17b1804b1-4a18e4a9862mr85692645e9.15.1791624236895; 
 Sat, 10 Oct 2026 02:23:56 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be964dfsm118797025e9.7.2026.10.10.02.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:56 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:33 +0200
Message-ID: <20261010092355.139747-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930123851.486520-1-raphael.melotte@mind.be>
References: <20260930123851.486520-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: harfbuzz: new runtime
 test
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

SW4gcmVwbHkgb2Y6Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwu
bWVsb3R0ZUBtaW5kLmJlPgoKQXBwbGllZCB0byAyMDI1LjAyLnggJiAyMDI2LjA4LnguIFRoYW5r
cwoKPiAtLS0KPiAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+ICAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfaGFyZmJ1enoucHkgICAg
fCAzMyArKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9oYXJmYnV6ei5weQo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVS
Uwo+IGluZGV4IGQ2MmJmYWFmYjMuLjdmYTk3ZmIzNmQgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVS
Uwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMjg2MSw2ICsyODYxLDcgQEAgRjoJc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zM3RyYW5zZmVyLnB5Cj4gIEY6CXN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fc2RidXMucHkKPiAgRjoJ
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9zZGJ1c19uZXR3b3Jr
bWFuYWdlci5weQo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0
aG9uX3VybGxpYjMucHkKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9o
YXJmYnV6ei5weQo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54
X21vZHNlY3VyaXR5Lwo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25n
aW54X21vZHNlY3VyaXR5LnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX2ptZXNwYXRoLnB5Cj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfaGFyZmJ1enoucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2hhcmZidXp6LnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi40MjU5YTg3NTE0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfaGFyZmJ1enoucHkKPiBAQCAtMCwwICsxLDMzIEBACj4gK2ltcG9y
dCBvcwo+ICsKPiAraW1wb3J0IGluZnJhLmJhc2V0ZXN0Cj4gKwo+ICsKPiArY2xhc3MgVGVzdEhh
cmZidXp6KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gKyAgICBjb25maWcgPSBpbmZyYS5iYXNl
dGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAg
IEJSMl9QQUNLQUdFX0hBUkZCVVpaPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9MSUJHTElCMj15
Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfREVKQVZVPXkKPiArICAgICAgICBCUjJfVEFSR0VUX1JP
T1RGU19DUElPPXkKPiArICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
Cj4gKyAgICAgICAgIiIiCj4gKwo+ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAgICAg
IGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rm
cy5jcGlvIikKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjUiLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmlsZV0pCj4gKyAgICAg
ICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCj4gKwo+ICsgICAgICAgICMgVGhlIGhiLXNoYXBlIHV0
aWxpdHkgbmVlZHMgYSBmb25kLgo+ICsgICAgICAgIGZvbnQgPSAiL3Vzci9zaGFyZS9mb250cy9k
ZWphdnUvRGVqYVZ1U2Fucy50dGYiCj4gKwo+ICsgICAgICAgICMgVGhlIGxpYnJhcnkgbG9hZHMg
YW5kIHRoZSB1dGlsaXR5IHJ1bnMuCj4gKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiaGItc2hh
cGUgLS12ZXJzaW9uIikKPiArCj4gKyAgICAgICAgIyBCYXNpYyBpbnZvY2F0aW9uIHdpdGggYSBm
b250Lgo+ICsgICAgICAgIGNtZCA9IGYiaGItc2hhcGUgLS1uby1wb3NpdGlvbnMge2ZvbnR9IEEi
Cj4gKyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLmVtdWxhdG9yLnJ1bihjbWQpCj4g
KyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCj4gKyAgICAgICAgc2VsZi5h
c3NlcnRFcXVhbChvdXRwdXRbMF0sICJbQT0wXSIpCj4gLS0gCj4gMi41NC4wCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
