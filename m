Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB17AEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EFC613EA;
	Fri, 13 Feb 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x9XgxRSdJzL2; Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54F661554
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011437;
	bh=OuDmyoqfZxWe2OVodqi2Xd3M1mhW/0FYFtD0Wv8DK5I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UGSABaIavwtHGmPbkycnh0zgHFKzqkQ0VD/MHTpnaoCj81aoyvz+UndlT99w0G0kT
	 DmXdE6/1mcaAVDz9qvlYObtz/dX3k/zUYQtVIak7pEUMqJFC6AsbWBAAJgc4hcoc7+
	 ex+XzkmYq7OynyFL29D1s/eYmFMvgrA8pQwjaTeG1xfQlF49HT9acYLLgsR5z6e51M
	 xL2OK5vnIMRz3XwLsVbo002cDcZYnyz3YIFgkDAcZfDZvpIsU9pWkoiPv58uj1QRfw
	 rJsAEjEFY5Vf61kYI/SpOGtjumrJGOIMqjvvgKvsau1RpsyM4MlYNGhcP4rChewsa4
	 +b3Dyewxk5xaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A54F661554;
	Fri, 13 Feb 2026 19:37:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9D1B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD9184678
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08tqywG190YI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 748BE845FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 748BE845FA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 748BE845FA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:46 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so999955f8f.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011404; x=1771616204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zfkxdidfG6IU48EyQMwltnifuItATkKXmz74Si1lQCM=;
 b=p0F0a1nGE/mnKfyrlbhgxz1A8In5pW987eG2crd8hitY9g13qXPAPOpCiTvTzp1CSn
 cNe1FMorh+JwHLKGaIV6X55M7GpdvoNZxlZ+p62IGRitj8gbhDe/SCfpXg/ZlNo63Iak
 ZGo82tUmU0hp6eBFtEmUIX7bHTF8VtU/FdlHT+K3FqT4PzyKn2Y9qiaK5Mz6hWvBk0vI
 0mtky26AXmnyjEA7U0vmOhf/dvsG6C1ghtsKZMmyaPFzvjXQTe1CAKEq9dPpnIDz8zU2
 xrOtc3n8AhWGD3+f7ttpOGTUdfJ1kbrrp33IcsjMPC/UPRSS8hkupvkGNU1TlsEPiFaB
 8rmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4OigVjx5sWeBLbd30sl2XdHaUVm4Q9Xn6wP6ZWwjqQyK5vu8s2xO1BUNoYtL+23zN4T3Kb3YNUeE=@buildroot.org
X-Gm-Message-State: AOJu0YxTKbDJIhVJSys0cOpsb9wrdkTGjxejP4lyY5JHxvf0dDc0VSCE
 3lvvjmkQXfBQqkLMdhxOtNaumcvb9bv+bJb4sgITDmGcKv886GMYZp6QCQWub+m+2wU=
X-Gm-Gg: AZuq6aKidrgDnocjnhMg7x27GXnEVJOu6VlkXlP42QAX56SuKTDIYG4t4ttv0/6bfay
 MutGO/DvuT/k/x6s6LcI4fVri2CJ3jGcSrrSc50QexlejPRTUv/Obm7btXLuPLNMmWg0B+OEXvY
 Rs4GgwzNUyQFL/mVAst3oxA7MmhU/RYrqY7zY5CVn76PiyBbJdlRIuIiXFkoexBft5Cw4vw6b4/
 0quZLMX81AlGcQYhARIRNBChnJHak5pYHf3bFbAH087kJitNPjW8qmL9lVrsiqjHh9BCuBNYWst
 OlI2x712pyPvqfuAO/hwjLh8XLzyrvpxg7UNKZrA93lckZgFO4NZgX4HZxLTOP0rFaUu6TFv1tH
 /02xkBuM1rWQGmKMRxTylQpWZNY3lR7/RzbS1Y+l2oF8eJovoSTAd/OIVJtqUSXCg29jmreFwfI
 /gqZj28FTA3r1lxkc=
X-Received: by 2002:a5d:5c8a:0:b0:437:675d:7620 with SMTP id
 ffacd0b85a97d-4379db8cf97mr1068976f8f.35.1771011404252; 
 Fri, 13 Feb 2026 11:36:44 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6ba57sm6257001f8f.15.2026.02.13.11.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:44 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:42 +0100
Message-ID: <20260213193643.37948-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205195851.1945029-1-bernd@kuhls.net>
References: <20251205195851.1945029-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011404; x=1771616204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfkxdidfG6IU48EyQMwltnifuItATkKXmz74Si1lQCM=;
 b=E5Q3AlxiZmgU41CBw9GNGx3Uy02gYvV3D1NPCoeDwAerZEycd4lUnZBLDeNRp5uL/P
 L5EV+U3kFrPdmYGanxZAY49BNw3Tm6OTFeCq81gLpeyORtm1AyK6GjqU8o7C/jWkRTTu
 b0nqp6McnA09vvUIoXvrrjDjr3KmtId5gNc2fmxsBTYzDLoS0RI4cgz0zFkc0mWNHn4e
 yHKgnikyBnRFE31wNuRajpYcI7FuzZHRElinHwheXPkeTU9xpKyEidnKYvJifYw9xgPo
 FJTkWQOosDYpbqZQhpBAaZ/bVGMjfCiEBc820RkLBgHWCLCl5mc09UbCfsTeK15QUdXK
 ITcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=E5Q3Alxi
Subject: Re: [Buildroot] [PATCH 1/1] package/netsniff-ng: fix compilation
 with gcc-15
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

SW4gcmVwbHkgb2Y6Cj4gQnVpbGQgZXJyb3Igd2FzIG5vdCB5ZXQgcmVjb3JkZWQgYnkgYXV0b2J1
aWxkZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
CgpBcHBsaWVkIHRvIDIwMjUuMTEueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi5zZXphaG4tZml4ZWQt
Y29tcGlsYXRpb24td2l0aC1nY2MtMTUucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL25ldHNuaWZmLW5nLzAwMDEtbWF1c2V6YWhuLWZpeGVkLWNvbXBpbGF0aW9uLXdpdGgt
Z2NjLTE1LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmV0c25pZmYtbmcvMDAwMS1t
YXVzZXphaG4tZml4ZWQtY29tcGlsYXRpb24td2l0aC1nY2MtMTUucGF0Y2ggYi9wYWNrYWdlL25l
dHNuaWZmLW5nLzAwMDEtbWF1c2V6YWhuLWZpeGVkLWNvbXBpbGF0aW9uLXdpdGgtZ2NjLTE1LnBh
dGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41ZWFhYTkxZjEw
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbmV0c25pZmYtbmcvMDAwMS1tYXVzZXph
aG4tZml4ZWQtY29tcGlsYXRpb24td2l0aC1nY2MtMTUucGF0Y2gKPiBAQCAtMCwwICsxLDM5IEBA
Cj4gK0Zyb20gMWFmN2FlMzNlM2U4MTc4YWI1YzY0OWMzYTUyODM4ZDQzNzVjNDIyOCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9VVEYtOD9xP0phcm9zbGF2PTIwPUM1PUEwa2Fy
dmFkYT89IDxqc2thcnZhZEByZWRoYXQuY29tPgo+ICtEYXRlOiBUdWUsIDEwIEp1biAyMDI1IDE0
OjQ3OjU0ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbWF1c2V6YWhuOiBmaXhlZCBjb21waWxh
dGlvbiB3aXRoIGdjYy0xNQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6IHRl
eHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAo+ICsKPiArZ2NjLTE1IGJ5IGRlZmF1bHQgdXNlcyBDMjMgc3RhbmRhcmQgd2hpY2ggaXMgbW9y
ZSBzdHJpY3Qgb24gZm9yd2FyZAo+ICtkZWNsYXJhdGlvbnMuCj4gKwo+ICtPcmlnaW5hbCByZXBv
cnQ6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjM0MDkyNAo+
ICsKPiArU2lnbmVkLW9mZi1ieTogSmFyb3NsYXYgxaBrYXJ2YWRhIDxqc2thcnZhZEByZWRoYXQu
Y29tPgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRzbmlmZi1uZy9uZXRz
bmlmZi1uZy9jb21taXQvMWFmN2FlMzNlM2U4MTc4YWI1YzY0OWMzYTUyODM4ZDQzNzVjNDIyOAo+
ICsKPiArU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiArLS0t
Cj4gKyBzdGFnaW5nL21vcHMuaCB8IDYgKysrLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3N0YWdpbmcvbW9w
cy5oIGIvc3RhZ2luZy9tb3BzLmgKPiAraW5kZXggY2YxOWYwOTguLmFlMzc2OWE3IDEwMDY0NAo+
ICstLS0gYS9zdGFnaW5nL21vcHMuaAo+ICsrKysgYi9zdGFnaW5nL21vcHMuaAo+ICtAQCAtOTQw
LDkgKzk0MCw5IEBAIGludCBtb3BzX2RpcmVjdChjaGFyKiBkZXYsIGludCBtb3BzX3R5cGUsIGNo
YXIqIGFyZ3N0cmluZyk7Cj4gKyAKPiArIAo+ICsgc3RydWN0IGF1dG9tb3BzICogYXV0b21vcHNf
aW5pdCh2b2lkKTsKPiArLXN0cnVjdCBhdXRvbW9wcyAqIGF1dG9tb3BzX2FsbG9jX3Byb3RvY29s
KCk7Cj4gKy1zdHJ1Y3QgYXV0b21vcHMgKiBhdXRvbW9wc19kZWxldGVfcHJvdG9jb2woKTsKPiAr
LXN0cnVjdCBhdXRvbW9wcyAqIGF1dG9tb3BzX3NlYXJjaF9wcm90b2NvbCgpOwo+ICsrc3RydWN0
IGF1dG9tb3BzICogYXV0b21vcHNfYWxsb2NfcHJvdG9jb2woc3RydWN0IGF1dG9tb3BzICpjdXIp
Owo+ICsrc3RydWN0IGF1dG9tb3BzICogYXV0b21vcHNfZGVsZXRlX3Byb3RvY29sKHN0cnVjdCBh
dXRvbW9wcyAqY3VyKTsKPiArK3N0cnVjdCBhdXRvbW9wcyAqIGF1dG9tb3BzX3NlYXJjaF9wcm90
b2NvbChzdHJ1Y3QgYXV0b21vcHMgKmxpc3QsIGNoYXIgKm5hbWUpOwo+ICsgaW50ICAgICAgICAg
ICAgICAgYXV0b21vcHNfZHVtcF9hbGwgKHN0cnVjdCBhdXRvbW9wcyogbGlzdCk7Cj4gKyB2b2lk
ICAgICAgICAgICAgICBhdXRvbW9wc19zZXRfZGVmYXVsdHMoc3RydWN0IGF1dG9tb3BzICogY3Vy
KTsKPiArIHN0cnVjdCBmaWVsZHMgKiAgIGF1dG9tb3BzX2FkZF9maWVsZCAoc3RydWN0IGF1dG9t
b3BzICphbXApOwo+IC0tIAo+IDIuNDcuMwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
