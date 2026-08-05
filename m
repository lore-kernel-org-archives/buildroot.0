Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED88C55ABA
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468CC4058C;
	Wed,  5 Aug 2026 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjfJ7-mrsyaD; Wed,  5 Aug 2026 14:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E9BB4057A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785941438;
	bh=R9r8kA0+elTZwjR0/rKlsJHqKUuE87JUgiXM3LR01+Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rEdC2bE3d/sc7ldECLWSQ/jHPA1Cyehcve/SvmIxFgHiXFctv1PnLEy37nDFvk3IC
	 PVmfFpnvHEz/pieiOB7j2Jd2j258wdVTZnTB3UwmwT5uKA5HruSy2SCyJOxerD3x/D
	 HPhxEo+I8rPkklWrOrSkUh0FKtSQppZscJq1ptzAobm8QN6uxFxri7ld6MXqHczI3Y
	 oH/2JABlHRuYaCgHEo66fSxhRUmEnsEBPbP9E4yfi+NhyBlW7U2IfYE5NXxsHbMcPy
	 X0THpnEr1vyy/Ly4KcWi3GfSmPS7b3x5MG0r2BJIsS/dX7NUYM6D+VV9l4heKMT4FZ
	 Y+SO3Fgvm/AYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E9BB4057A;
	Wed,  5 Aug 2026 14:50:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AEB22DE
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF73400AE
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxm5bzU6XCd4 for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 14:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AF5440061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AF5440061
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AF5440061
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 14:50:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c1676648c1eso8877666b.0
 for <buildroot@buildroot.org>; Wed, 05 Aug 2026 07:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785941433; x=1786546233;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=z7P5pnIUkXnsxPycB7fBIFsJ+m0r4Hae4BypXswZ9Dg=;
 b=PH2nDJqCzj7IfEcybQSoDWhuTx83ync5RExOxZ7GwcqJXCr4wckIixBZu2yovPPpP9
 AG7MTkLVDHTYSvAc+z3nleFdCrgMDxHqRWGsNWigmzDJhdeW7Vcz15loxO0pFQ1DJxWb
 NBc+cxfuWcrKlVhUgO2sJtrhe5CZnQjvZPL22Yohf90UV1iG+76sBDHgMBKZ1pR9mv5C
 xExKmf9D+1baOuoYYJjtIUllSzrEblKy9tdyf9DYvtMzy3s2TP2Qr65TrTzVlsjiSvdm
 wwujJAJItee5IhEwytRZYDNaWwpvM4L64lgJTXl0HE3t4wkzlS30HX37DGl1MX/FXWeP
 i58A==
X-Gm-Message-State: AOJu0YxQNbUsVX2txTg8VkkdW25h+3qjUdC0ZdPOxRXXsrmc0zEUHhq1
 xR2kJCq4jZBmBfNtHB8wm9/TBIUTd/xxMsgBbSf7DnItpggiDk4fFdW9nTyY/8Wlco9f0XbDLLx
 WgRic
X-Gm-Gg: AR+sD132lJ5+AflVzr1Oxv3my8qPLbPskFV2hWi/xHlgCgw/aKx+gR652BDtdt60UR4
 ZP7kadXy6aZMjrmawn2SPwfc/J0NhoEggM0se/IyNXg5vATEl2q29C8lvVDgyk99w3ohTno3haq
 8F8Vh5pFySFensrMdsC7cJwnujrQvFU3TMWoyKJplPlE7KWhYB0sG1ko2VRJNtde+c7gizFx+Uf
 njzjNG4JtSIlZPjJG8mI4EsMRpemXdBv4AC51xrWyHUePBJy+eb7mdcK0B7cJAKeg8zyLCfQqW5
 B6z1rIgQ1qqwNDmlYaBxwNQvv2eIgVhZbMMcg4K+3r8l+esvhmUZpzjvVkVUGpunweslCrSFFMY
 e4JzxmNy/J+0PYibmAgR4R33ex2p7qHMgydBi4fJCe4dBnnivMEuiwwlAqwvZNCypYmAQv4Mepe
 +5pmO63YaG9IyVTaoJLkSwflSSNnhBdiOB66i8NKxx3NzOYIeHO21kmUJjdl48T9HLEWBZZuLyf
 s6tguHzMxR927oStOQMxQTtDNOUwsJZgukHh/Xyvr/7Ibhzd+9Sf+nY64OTptxHah2y+x+w4/kU
 ZP2UbNMae8JQ63Y9yCPcJw0+oV5EsNZuXygtb7rvNSl54Oh1072Lkc1KNPxrUVmdoTOymw==
X-Received: by 2002:a17:907:5c7:b0:beb:967f:1ca8 with SMTP id
 a640c23a62f3a-c2039c9c6d7mr198289266b.2.1785941433019; 
 Wed, 05 Aug 2026 07:50:33 -0700 (PDT)
Received: from adam.arnhem.chello.nl
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c203645aa73sm128488766b.57.2026.08.05.07.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 07:50:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Aug 2026 16:50:30 +0200
Message-ID: <20260805145031.2015162-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785941433; x=1786546233;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=z7P5pnIUkXnsxPycB7fBIFsJ+m0r4Hae4BypXswZ9Dg=;
 b=YZ5NV9iwmF3XLfnoCFmB6ibBJtOMAbVhbb10SVXsHI/ybRBuEvvhdqHO47jWoqh2E7
 gVu6Q6FJDVArQECy1oQukQX/PQknqAt1WuAwa555072VDVOWKbMES8YC5kdr1X9GRTpb
 R+C2F4YdwfL4hIIqm3ZuIKT0brssPtgqmnpuI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YZ5NV9iw
Subject: [Buildroot] [PATCH 1/1] package/boost: fix asio.hpp compile errors
 with gcc >= 15
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGlsZSBlcnJvciB3aGVuIHBy
b2dyYW1zCmluY2x1ZGUgdGhlIGFzaW8uaHBwIGhlYWRlciB3aXRoIGdjYyB2ZXJzaW9ucyA+PSAx
NS4KCmBgYApJbiBmdW5jdGlvbiDigJh2b2lkKiBtZW1jcHkodm9pZCosIGNvbnN0IHZvaWQqLCBz
aXplX3Qp4oCZLAoKaW5saW5lZCBmcm9tIOKAmHN0YXRpYyBib29zdDo6YXNpbzo6aXA6OmJhc2lj
X3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD4KICAgIGJvb3N0Ojphc2lvOjppcDo6
YmFzaWNfcmVzb2x2ZXJfcmVzdWx0czxJbnRlcm5ldFByb3RvY29sPjo6Y3JlYXRlKGJvb3N0Ojph
c2lvOjpkZXRhaWw6OmFkZHJpbmZvX3R5cGUqLAogICAgY29uc3Qgc3RkOjpzdHJpbmcmLCBjb25z
dCBzdGQ6OnN0cmluZyYpIFt3aXRoIEludGVybmV0UHJvdG9jb2wgPSBib29zdDo6YXNpbzo6aXA6
OnRjcF3igJkKICAgIGF0IC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29sdmVy
X3Jlc3VsdHMuaHBwOjE0NzoxNToKCi91c3IvaW5jbHVkZS9iaXRzL3N0cmluZ19mb3J0aWZpZWQu
aDoyOTozMzoKICAgIGVycm9yOiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1jcHlfY2hrKHZvaWQq
LCBjb25zdCB2b2lkKiwgdW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZCiAgICBmb3JtaW5n
IG9mZnNldCBbMjgsIDEyOF0gaXMgb3V0IG9mIHRoZSBib3VuZHMgWzAsIDI4XSBvZiBvYmplY3Qg
4oCYZW5kcG9pbnTigJkgd2l0aCB0eXBlCiAgICDigJhib29zdDo6YXNpbzo6aXA6OnRjcDo6ZW5k
cG9pbnTigJkge2FrYSDigJhib29zdDo6YXNpbzo6aXA6OmJhc2ljX2VuZHBvaW50PGJvb3N0Ojph
c2lvOjppcDo6dGNwPuKAmX0KICAgIFstV2Vycm9yPWFycmF5LWJvdW5kcz1dCmBgYAoKQmFja3Bv
cnQgVVJMOiBodHRwczovL2dpdGh1Yi5jb20vYm9vc3RvcmcvYXNpby9jb21taXQvYjI0NzhhOWJh
OWVkNzZkN2M4NTg0MTllM2Y2NzdjYzQ1NDU5MWQ0NQoKRml4ZXM6IE5vbmUgcmVwb3J0ZWQKU2ln
bmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1hcnVsYXNvbHV0aW9ucy5j
b20+Ci0tLQogLi4uMDAyLXJlbW92ZS1GT1JUSUZZX1NPVVJDRS13b3JrYXJvdW5kLnBhdGNoIHwg
NzUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Jvb3N0LzAwMDItcmVtb3ZlLUZPUlRJRllfU09V
UkNFLXdvcmthcm91bmQucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2Jvb3N0LzAwMDItcmVt
b3ZlLUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0Y2ggYi9wYWNrYWdlL2Jvb3N0LzAwMDIt
cmVtb3ZlLUZPUlRJRllfU09VUkNFLXdvcmthcm91bmQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMC4uZDA0NGI2MjY3NgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2th
Z2UvYm9vc3QvMDAwMi1yZW1vdmUtRk9SVElGWV9TT1VSQ0Utd29ya2Fyb3VuZC5wYXRjaApAQCAt
MCwwICsxLDc1IEBACitGcm9tIGIzZDg3ZGE1Zjg3ZTI5MDdlZDAwNGVkZjFjNzJhZDM5NDJmZjEx
NjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaHJpc3RvcGhlciBLb2hsaG9mZiA8
Y2hyaXNAa29obGhvZmYuY29tPgorRGF0ZTogV2VkLCA1IEF1ZyAyMDI2IDE2OjA3OjE5ICswMjAw
CitTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBfRk9SVElGWV9TT1VSQ0Ugd29ya2Fyb3VuZC4KKwor
VGhpcyBjb21taXQgdW5pbnRlbnRpb25hbGx5IGZpeGVkIGEgY29tcGlsZSBlcnJvciB3aGVuIHBy
b2dyYW1zCitpbmNsdWRlIHRoZSBhc2lvLmhwcCBoZWFkZXIgd2l0aCBnY2MgdmVyc2lvbnMgPj0g
MTUuCisKK2BgYAorSW4gZnVuY3Rpb24g4oCYdm9pZCogbWVtY3B5KHZvaWQqLCBjb25zdCB2b2lk
Kiwgc2l6ZV90KeKAmSwKKworaW5saW5lZCBmcm9tIOKAmHN0YXRpYyBib29zdDo6YXNpbzo6aXA6
OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD4KKyAgICBib29zdDo6YXNp
bzo6aXA6OmJhc2ljX3Jlc29sdmVyX3Jlc3VsdHM8SW50ZXJuZXRQcm90b2NvbD46OmNyZWF0ZShi
b29zdDo6YXNpbzo6ZGV0YWlsOjphZGRyaW5mb190eXBlKiwKKyAgICBjb25zdCBzdGQ6OnN0cmlu
ZyYsIGNvbnN0IHN0ZDo6c3RyaW5nJikgW3dpdGggSW50ZXJuZXRQcm90b2NvbCA9IGJvb3N0Ojph
c2lvOjppcDo6dGNwXeKAmQorICAgIGF0IC91c3IvaW5jbHVkZS9ib29zdC9hc2lvL2lwL2Jhc2lj
X3Jlc29sdmVyX3Jlc3VsdHMuaHBwOjE0NzoxNToKKworL3Vzci9pbmNsdWRlL2JpdHMvc3RyaW5n
X2ZvcnRpZmllZC5oOjI5OjMzOgorICAgIGVycm9yOiDigJh2b2lkKiBfX2J1aWx0aW5fX19tZW1j
cHlfY2hrKHZvaWQqLCBjb25zdCB2b2lkKiwgdW5zaWduZWQgaW50LCB1bnNpZ25lZCBpbnQp4oCZ
CisgICAgZm9ybWluZyBvZmZzZXQgWzI4LCAxMjhdIGlzIG91dCBvZiB0aGUgYm91bmRzIFswLCAy
OF0gb2Ygb2JqZWN0IOKAmGVuZHBvaW504oCZIHdpdGggdHlwZQorICAgIOKAmGJvb3N0Ojphc2lv
OjppcDo6dGNwOjplbmRwb2ludOKAmSB7YWthIOKAmGJvb3N0Ojphc2lvOjppcDo6YmFzaWNfZW5k
cG9pbnQ8Ym9vc3Q6OmFzaW86OmlwOjp0Y3A+4oCZfQorICAgIFstV2Vycm9yPWFycmF5LWJvdW5k
cz1dCitgYGAKKworCitPcmlnaW5hbCBwYXRjaCBjb21taXQgbWVzc2FnZToKK2BgYAorVGhlIHBy
ZXZpb3VzIHdvcmthcm91bmQgZm9yIF9GT1JUSUZZX1NPVVJDRSB3YXJuaW5ncyBpbmNyZWFzZWQg
dGhlIHNpemUKK29mIGFsbCBJUCBlbmRwb2ludCBvYmplY3RzLiBJbnN0ZWFkLCB0cnkgZml4aW5n
IHRoZSB3YXJuaW5nIGF0IHRoZSBwb2ludAord2hlcmUgaXQgb2NjdXJzLCBieSBsaW1pdGluZyB0
aGUgbGVuZ3RoIG1lbWNweS1lZCB3aGlsZSBwcm9jZXNzaW5nIHRoZQorYWRkcmluZm8gcmVzdWx0
cyBmcm9tIGdldGFkZHJpbmZvLgorYGBgCisKK1Vwc3RyZWFtOiBCYWNrcG9ydCBbaHR0cHM6Ly9n
aXRodWIuY29tL2Jvb3N0b3JnL2FzaW8vY29tbWl0L2IyNDc4YTliYTllZDc2ZDdjODU4NDE5ZTNm
Njc3Y2M0NTQ1OTFkNDVdCitTaWduZWQtb2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0
dEBhbWFydWxhc29sdXRpb25zLmNvbT4KK1NpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIEtvaGxo
b2ZmIDxjaHJpc0Brb2hsaG9mZi5jb20+CistLS0KKyBib29zdC9hc2lvL2lwL2Jhc2ljX3Jlc29s
dmVyX3Jlc3VsdHMuaHBwIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQorIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvYm9v
c3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcCBiL2Jvb3N0L2FzaW8vaXAvYmFz
aWNfcmVzb2x2ZXJfcmVzdWx0cy5ocHAKK2luZGV4IDAxMjc0NzNlMi4uODdmYTNmYWRmIDEwMDY0
NAorLS0tIGEvYm9vc3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcAorKysrIGIv
Ym9vc3QvYXNpby9pcC9iYXNpY19yZXNvbHZlcl9yZXN1bHRzLmhwcAorQEAgLTE0MSwxNCArMTQx
LDIwIEBAIHB1YmxpYzoKKyAgICAgICBpZiAoYWRkcmVzc19pbmZvLT5haV9mYW1pbHkgPT0gQk9P
U1RfQVNJT19PU19ERUYoQUZfSU5FVCkKKyAgICAgICAgICAgfHwgYWRkcmVzc19pbmZvLT5haV9m
YW1pbHkgPT0gQk9PU1RfQVNJT19PU19ERUYoQUZfSU5FVDYpKQorICAgICAgIHsKKy0gICAgICAg
IHVzaW5nIG5hbWVzcGFjZSBzdGQ7IC8vIEZvciBtZW1jcHkuCistICAgICAgICB0eXBlbmFtZSBJ
bnRlcm5ldFByb3RvY29sOjplbmRwb2ludCBlbmRwb2ludDsKKy0gICAgICAgIGVuZHBvaW50LnJl
c2l6ZShzdGF0aWNfY2FzdDxzdGQ6OnNpemVfdD4oYWRkcmVzc19pbmZvLT5haV9hZGRybGVuKSk7
CistICAgICAgICBtZW1jcHkoZW5kcG9pbnQuZGF0YSgpLCBhZGRyZXNzX2luZm8tPmFpX2FkZHIs
CistICAgICAgICAgICAgYWRkcmVzc19pbmZvLT5haV9hZGRybGVuKTsKKy0gICAgICAgIHJlc3Vs
dHMudmFsdWVzXy0+cHVzaF9iYWNrKAorLSAgICAgICAgICAgIGJhc2ljX3Jlc29sdmVyX2VudHJ5
PEludGVybmV0UHJvdG9jb2w+KGVuZHBvaW50LAorLSAgICAgICAgICAgICAgYWN0dWFsX2hvc3Rf
bmFtZSwgc2VydmljZV9uYW1lKSk7CisrICAgICAgICBjb25zdCBzdGQ6OnNpemVfdCBleHBlY3Rl
ZF9zaXplID0KKysgICAgICAgICAgYWRkcmVzc19pbmZvLT5haV9mYW1pbHkgPT0gQk9PU1RfQVNJ
T19PU19ERUYoQUZfSU5FVCkKKysgICAgICAgICAgICA/IHNpemVvZihib29zdDo6YXNpbzo6ZGV0
YWlsOjpzb2NrYWRkcl9pbjRfdHlwZSkKKysgICAgICAgICAgICA6IHNpemVvZihib29zdDo6YXNp
bzo6ZGV0YWlsOjpzb2NrYWRkcl9pbjZfdHlwZSk7CisrICAgICAgICBpZiAoYWRkcmVzc19pbmZv
LT5haV9hZGRybGVuID49IGV4cGVjdGVkX3NpemUpCisrICAgICAgICB7CisrICAgICAgICAgIHVz
aW5nIG5hbWVzcGFjZSBzdGQ7IC8vIEZvciBtZW1jcHkuCisrICAgICAgICAgIHR5cGVuYW1lIElu
dGVybmV0UHJvdG9jb2w6OmVuZHBvaW50IGVuZHBvaW50OworKyAgICAgICAgICBlbmRwb2ludC5y
ZXNpemUoZXhwZWN0ZWRfc2l6ZSk7CisrICAgICAgICAgIG1lbWNweShlbmRwb2ludC5kYXRhKCks
IGFkZHJlc3NfaW5mby0+YWlfYWRkciwgZXhwZWN0ZWRfc2l6ZSk7CisrICAgICAgICAgIHJlc3Vs
dHMudmFsdWVzXy0+cHVzaF9iYWNrKAorKyAgICAgICAgICAgICAgYmFzaWNfcmVzb2x2ZXJfZW50
cnk8SW50ZXJuZXRQcm90b2NvbD4oZW5kcG9pbnQsCisrICAgICAgICAgICAgICAgIGFjdHVhbF9o
b3N0X25hbWUsIHNlcnZpY2VfbmFtZSkpOworKyAgICAgICAgfQorICAgICAgIH0KKyAgICAgICBh
ZGRyZXNzX2luZm8gPSBhZGRyZXNzX2luZm8tPmFpX25leHQ7CisgICAgIH0KKy0tIAorMi41NS4w
CisKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
