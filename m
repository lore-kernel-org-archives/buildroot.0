Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D976DCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4FC940D3C;
	Mon, 19 Jan 2026 10:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9E_VYK_MEsmc; Mon, 19 Jan 2026 10:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D918F40D54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817352;
	bh=kgTX3uTr9SF2/OAAhVthye/iLusyp6489Yq233RYHAU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h6xVgjTMgDqBRFDUw8Ap8fcudiS8Eh07+qWJwAnYxScBU7uuhoTTf6xZY593bIsRC
	 1Cr6ScZ/xXbF5sPnOhsbWi86LVHiET68m0Tq8ljYFz8fkwjnkKJ3plxMrPwyITyip5
	 r9JjXEIDCURD9RUZrOdZTQFffAb18jjTCaWNr0vTWdRoSFz8oZ7r/MuQlxuCeFP91E
	 2x/vC8NtKsVdvTACXou9sWdkzQhFSXiNR0XY8lstPIuaQteo/l5o5lV+VVRmago5aI
	 xPKdpbjrasZwWX6c7k+5yH8yLgW2bWQBnVJUphsIBwuKvbBnYeUyoC1BUKwDcH0LwY
	 bdxhyrd1uBKnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D918F40D54;
	Mon, 19 Jan 2026 10:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B81DA2CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7ED381D18
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyga0t3z0DsC for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11BE081D16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11BE081D16
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11BE081D16
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 218DEB97A961; Mon, 19 Jan 2026 11:09:08 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:07 +0100
Message-ID: <20260119100907.12503-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103190259.1904724-1-bernd@kuhls.net>
References: <20260103190259.1904724-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kwef6je1ZAgbrCiHL/il5sLtln+Cp9ouEEvTnqEBCE0=;
 b=nG5IHMGG7Z3k/0w85BjziZ33uVGk2M+j0Y16Snqx8o2h4AhBHPkEmgc9b2122dy9uafKf/
 ohf6CY+pdFCx0GP5Y0ZQQ4aVkBe/ECcgkT4wQBv8W9b+9wkC+0RiX730lMdsEYvS4oDnOJ
 rx8RZ/UHPmMWvUSXQQcZje+c2B16w02MZ3hUxvTppOO6WifA4XS1NpgcSRxDnzxI+GRel8
 GgwbKm2VSnhgRQnKvyGbrNs9pCJEmB0hfMvsE7zQDE9HaudMSEo82FukTmu9WdPBjRmTUK
 ZzTwdFHyfHD9W+yeWmcQL6e1YQwq5uLn95jYQDyk2ggAi02wXwFjP7KjFFSnXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nG5IHMGG
Subject: Re: [Buildroot] [PATCH 1/2] package/bitcoin: broken on m68k
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQnVpbGRyb290IGNvbW1pdCBhM2E4OGZmMWM4NWJhMDA2N2FmMTAyOGJj
MjMyZjhmNjFiNjI4OTc5IGJ1bXBlZCBiaXRjb2luCj4gdG8gdmVyc2lvbiAyNi4wIHdoaWNoIGlu
Y2x1ZGVzIHVwc3RyZWFtIGNvbW1pdAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9iaXRjb2luL2JpdGNv
aW4vY29tbWl0L2I4NDAxYzMyODE5NzhiZWVkNjE5OGIyZjk3ODJiNmE4ZGQzNWNiZDcKPiBjYXVz
aW5nIGFuIGFzc2VydGlvbiBvbiBtNjhrOgo+IAo+IC9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5z
dGFuY2UtNy9vdXRwdXQtMS9idWlsZC9iaXRjb2luLTMwLjAvc3JjL3N1cHBvcnQvYWxsb2NhdG9y
cy9wb29sLmg6OTI6MzY6Cj4gIGVycm9yOiBzdGF0aWMgYXNzZXJ0aW9uIGZhaWxlZDogVW5pdHMg
b2Ygc2l6ZSBFTEVNX1NJWkVfQUxJR04gbmVlZCB0bwo+ICBiZSBhYmxlIHRvIHN0b3JlIGEgTGlz
dE5vZGUKPiAgICA5MiB8ICAgICBzdGF0aWNfYXNzZXJ0KHNpemVvZihMaXN0Tm9kZSkgPD0gRUxF
TV9BTElHTl9CWVRFUywgIlVuaXRzCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICB+fn5+fn5+
fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgb2Ygc2l6ZSBFTEVNX1NJWkVfQUxJR04g
bmVlZCB0byBiZSBhYmxlIHRvIHN0b3JlIGEgTGlzdE5vZGUiKTsKPiAKPiAvaG9tZS90aG9tYXMv
YXV0b2J1aWxkL2luc3RhbmNlLTcvb3V0cHV0LTEvYnVpbGQvYml0Y29pbi0zMC4wL3NyYy9zdXBw
b3J0L2FsbG9jYXRvcnMvcG9vbC5oOjkyOjM2Ogo+ICBub3RlOiB0aGUgY29tcGFyaXNvbiByZWR1
Y2VzIHRvICcoNCA8PSAyKScKPiAKPiBUbyBmaXggdGhlIHByb2JsZW0gd2UgZGlzYWJsZSBiaXRj
b2luIG9uIG02OGsuCj4gCj4gRml4ZXM6Cj4gMzAuMDogaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm5ldC9yZXN1bHRzLzI2OC8yNjg4ZTRhMmFhOGRjMzQzNDNmMDIxOGZkNjcyN2QwYWUzYWRi
MTMyLwo+IDI2LjA6IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9mYjAv
ZmIwNTQwMWM3ZGUyODllMGY4N2Y1YzllM2E3ZjkyZjU1ODliNTkwYi8KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgoKQXBwbGllZCB0byAyMDI1LjAyLngg
YW5kIDIwMjUuMTEueC4gVGhhbmtzCgo+IC0tLQo+ICBwYWNrYWdlL2JpdGNvaW4vQ29uZmlnLmlu
IHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9iaXRjb2luL0NvbmZpZy5pbiBiL3BhY2thZ2UvYml0Y29pbi9Db25maWcu
aW4KPiBpbmRleCAzMjQwNDYyZjU2Li5lZWRiMDg5N2E1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Yml0Y29pbi9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2JpdGNvaW4vQ29uZmlnLmluCj4gQEAg
LTYsNiArNiwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQklUQ09JTl9BUkNIX1NVUFBPUlRTCj4g
IAkjIHN1cHBvcnQuIEJSMl9UT09MQ0hBSU5fSEFTX0FUT01JQyBkb2VzIG5vdCBwcm92aWRlIGEK
PiAgCSMgc2l6ZS1sZXZlbCBncmFudWxhcml0eSB0byBleHByZXNzIHRoaXMgZGVwZW5kZW5jeS4K
PiAgCWRlcGVuZHMgb24gIShCUjJfYXJtIHx8IEJSMl9hcm1lYikgfHwgQlIyX1VTRV9NTVUKPiAr
CSMgZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24gZmFpbGVkOiBVbml0cyBvZiBzaXplIEVMRU1fU0la
RV9BTElHTgo+ICsJIyBuZWVkIHRvIGJlIGFibGUgdG8gc3RvcmUgYSBMaXN0Tm9kZQo+ICsJIyBu
b3RlOiB0aGUgY29tcGFyaXNvbiByZWR1Y2VzIHRvIOKAmCg0IDw9IDIp4oCZCj4gKwlkZXBlbmRz
IG9uICFCUjJfbTY4awo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0JJVENPSU4KPiAgCWJvb2wg
ImJpdGNvaW4iCj4gLS0gCj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
