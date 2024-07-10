Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F7C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E8E60672;
	Wed, 10 Jul 2024 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBe78aaw57Ws; Wed, 10 Jul 2024 21:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69DFB60688
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69DFB60688;
	Wed, 10 Jul 2024 21:17:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5C11BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47477409A0
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92jEiWqi66mb for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:17:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6A5440216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6A5440216
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6A5440216
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:17:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-58c947a6692so309541a12.0
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 14:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720646258; x=1721251058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YzdD5R5tdvPaKc+0OVZpxO1kfDYzC7aK0y3/4nX7vuI=;
 b=JbnmvDFu7azccdZ6l0S8vI+Za2TJPPrHYFMHboA+YEv3/Iv/XzGwuonCLBD5kM+dHO
 x9WfueNyYXWQiyL0stm1qURtVE5ipAVDbz+TqtnxYYNVEd5n9r6a7nRyVGO9EjqP8cb4
 NucW6iy0BCBwa4fTTWnYDflnavyXyPtwgvx2Bluf9zquPrFw7i9EWO6AofM/CzZ5dP7j
 /hfYUw8WxRNoBWjtM+j8//5eHLzeyyaxLMCAWCR+8zBrs0y2Rsp1HDKVOKOD61XyXQ1c
 OmddLikOfxGgm062ClbuS8MUuX4IMzWGtfnfIQBSGtY46czyM/V+sIjOxBsGaU0lrQN9
 0xUw==
X-Gm-Message-State: AOJu0YxwCSsJq+PIP6/Iqe3eNJ8pe8u1fgzEJiTXDuf+xRBCqK4UCs3x
 2PNwakedkc0cfuGns/OkHhrxnh86jHZ7+dRDwon9R1D70wHK4da/il/2Ku/Zr1XC6cilrd095KX
 1U57fYZTYSwAxVy5uAJ7oWv4tttlYkukJ54I=
X-Google-Smtp-Source: AGHT+IG09JhFr/cxdgvjNy+/krz5vBsB852adzumwpno8hy7I/6cNiEu0bEgahCx+VO2P27QMH/iO49K0O3pd11Jhjs=
X-Received: by 2002:a50:ee06:0:b0:58c:7c2f:5c0b with SMTP id
 4fb4d7f45d1cf-594ba78a00amr3970540a12.25.1720646257088; Wed, 10 Jul 2024
 14:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240623205821.3833321-1-james.hilliard1@gmail.com>
 <20240710230616.1f2012ad@windsurf>
In-Reply-To: <20240710230616.1f2012ad@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 10 Jul 2024 15:17:24 -0600
Message-ID: <CADvTj4qZPPNs3z0DAnF0tCtUxJet2nWUguaJ0KSy+AQLLViqNQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720646258; x=1721251058; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzdD5R5tdvPaKc+0OVZpxO1kfDYzC7aK0y3/4nX7vuI=;
 b=KWHAae71Cq61WE5Rej0bgSGMhQ+HRg8sp+ClH9Op/EUeL6HUpZEpPiOR6vi6roTsej
 IQI4A2EqwegPC/NHJlnurcSTZZ6rSqtYdHRXBRByZkkvhn6g7wsUrWNd52GSFxqffvAM
 8ZYOXq0sJCQQGUxlpFTUmv8WwCETHRsSkSMsvNzn30hUm0KARuGTy2EPBkYVV3+8e2Ih
 18AZG85sTR4Bm4qfhYRWhe/XO/DvtZySAwFYefZ2oqTBPGL7FxVKj0TVYwSfXIXeOgZQ
 BRk9A9CuY0RuuowF7aQsKVchMQz7xECSDZisYDO2GTihIUIoquokNDsvjy5DpM9ib7Wh
 f5Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KWHAae71
Subject: Re: [Buildroot] [PATCH 1/1] utils/update-rust: use pathlib with
 relative paths
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMzowNuKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBT
dW4sIDIzIEp1biAyMDI0IDE0OjU4OjIxIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBUaGlzIGF2b2lkcyB0aGUgcmVxdWlyZW1l
bnQgb2YgcnVubmluZyB1cGRhdGUtcnVzdCBmcm9tIFRPUERJUiBhbmQKPiA+IGlzIHNsaWdodGx5
IGNsZWFuZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+Cj4KPiBBcHBsaWVkIGFmdGVyIGZpeGluZyBhIGZldyBmbGFrZTgg
aXNzdWVzOgo+Cj4gLi91dGlscy91cGRhdGUtcnVzdDo1OjE6IEY0MDEgJ3N5cycgaW1wb3J0ZWQg
YnV0IHVudXNlZAo+IC4vdXRpbHMvdXBkYXRlLXJ1c3Q6ODY6MTg6IEY1NDEgZi1zdHJpbmcgaXMg
bWlzc2luZyBwbGFjZWhvbGRlcnMKPiAuL3V0aWxzL3VwZGF0ZS1ydXN0OjEwMzoxODogRjU0MSBm
LXN0cmluZyBpcyBtaXNzaW5nIHBsYWNlaG9sZGVycwo+Cj4gU29tZSBjb21tZW50cyBiZWxvdy4K
Pgo+ID4gKyAgICBUT1BESVIgPSBwYXRobGliLlBhdGgoX19maWxlX18pLnBhcmVudC5wYXJlbnQK
PiA+ICsgICAgdXBkYXRlX21rX2ZpbGUoVE9QRElSIC8gInBhY2thZ2UvcnVzdC9ydXN0Lm1rIiwg
YXJncy52ZXJzaW9uKQo+ID4gKyAgICB1cGRhdGVfbWtfZmlsZShUT1BESVIgLyAicGFja2FnZS9y
dXN0LWJpbi9ydXN0LWJpbi5tayIsIGFyZ3MudmVyc2lvbikKPiA+ICsgICAgZ2VuX2hhc2hfZmls
ZV9zcmMoVE9QRElSIC8gInBhY2thZ2UvcnVzdC9ydXN0Lmhhc2giLCBhcmdzLnZlcnNpb24pCj4g
PiArICAgIGdlbl9oYXNoX2ZpbGVfYmluKFRPUERJUiAvICJwYWNrYWdlL3J1c3QtYmluL3J1c3Qt
YmluLmhhc2giLCBhcmdzLnZlcnNpb24pCj4KPiBJIHJlYWxseSBkaWRuJ3Qga25vdyBhYm91dCBw
YXRobGliLlBhdGgoKSwgc28gdmVyeSBpbnRlcmVzdGluZy4gTXkKPiB1bmRlcnN0YW5kaW5nIGlz
IHRoYXQgVE9QRElSIC8gInBhY2thZ2UiIC8gInJ1c3QtYmluIiAvICJydXN0LWJpbi5oYXNoIgo+
IHdvdWxkIGJlIG1vcmUgY29ycmVjdCwgYnV0IEkgZmluZCBpdCBhbm5veWluZyB0byByZWFkLgoK
WWVhaCwgdGhlcmUncyBhIGJ1bmNoIG9mIGRpZmZlcmVudCB3YXlzIG9uZSBjYW4gZG8gdGhpcyB3
aXRoIHBhdGhsaWIsIG5vdApzdXJlIG9uZSBpcyBtb3JlIGNvcnJlY3QgdGhhbiB0aGUgb3RoZXIu
Cgo+Cj4gV2UgaGF2ZSBvdGhlciBQeXRob24gc2NyaXB0cyBpbiBCdWlsZHJvb3QgdGhhdCBhbHNv
IG5lZWQgdG8gZ2V0IHRoZQo+IFRPUERJUiwgYW5kIHRoZXkgZG8gaXQgaW4gZGlmZmVyZW50IHdh
eXMuCj4KPiBUd28gdGltZXMgb3MucGF0aC5kaXJuYW1lKCk6Cj4KPiB1dGlscy9jaGVjay1wYWNr
YWdlOiAgICAgICAgYmFzZV9kaXIgPSBvcy5wYXRoLmRpcm5hbWUob3MucGF0aC5kaXJuYW1lKG9z
LnBhdGgucmVhbHBhdGgoX19maWxlX18pKSkKPiB1dGlscy9jaGVjay1zeW1ib2xzOiAgICBiYXNl
X2RpciA9IG9zLnBhdGguZGlybmFtZShvcy5wYXRoLmRpcm5hbWUob3MucGF0aC5yZWFscGF0aChf
X2ZpbGVfXykpKQo+Cj4gT3Igb3MucGF0aC5qb2luKCkgd2l0aCB0aGUgcGF0aCB0byB0aGUgcm9v
dDoKPgo+IHN1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHM6YnJwYXRoID0gb3MucGF0aC5ub3JtcGF0
aChvcy5wYXRoLmpvaW4ob3MucGF0aC5kaXJuYW1lKF9fZmlsZV9fKSwgIi4uIiwgIi4uIikpCj4g
c3VwcG9ydC90ZXN0aW5nL2luZnJhL19faW5pdF9fLnB5OkJBU0VfRElSID0gb3MucGF0aC5yZWFs
cGF0aChvcy5wYXRoLmpvaW4ob3MucGF0aC5kaXJuYW1lKF9fZmlsZV9fKSwgIi4uLy4uLy4uIikp
Cj4KPiB3ZSdyZSBub3QgdmVyeSBjb25zaXN0ZW50IDotKQoKWWVhaCwgdGhlcmUncyBhIHRhYmxl
IGhlcmUgb2Ygb3MgcGF0aCBvcGVyYXRpb25zIHRvIHBhdGhsaWI6Cmh0dHBzOi8vZG9jcy5weXRo
b24ub3JnLzMvbGlicmFyeS9wYXRobGliLmh0bWwjY29ycmVzcG9uZGVuY2UtdG8tdG9vbHMtaW4t
dGhlLW9zLW1vZHVsZQoKSW4gZ2VuZXJhbCBwYXRobGliIGlzIHRoZSBwcmVmZXJyZWQgbWV0aG9k
IGZvciBoYW5kbGluZyBwYXRocyBBRkFJVSBhcwppdCdzIG9iamVjdCBvcmllbnRlZCBhbmQgY2xl
YW5lciB0aGFuIG9zLnBhdGguCgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBj
by1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
