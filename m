Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F4CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 16:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3645F6063D;
	Mon,  2 Sep 2024 16:45:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-2koc3cEgdT; Mon,  2 Sep 2024 16:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C3EF60684
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3EF60684;
	Mon,  2 Sep 2024 16:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD6361BF3FD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5C8380B6B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 16:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVk6qnGdtbvB for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 16:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DC6780A83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC6780A83
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC6780A83
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 16:45:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8679f534c3so461060966b.0
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725295500; x=1725900300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ds+GPDed/EAMJtZCaZUjv6eDL/GHYbsJGvOjSX2GwwQ=;
 b=StWO1NoJ5d0o/qgzjt/0U+lVVnUyDYDOcR1MRsnZ604gD9XErTYDBioiJJ8KmgLKtg
 feMuwtAcHk36gkrCeR7oX8lKRPwjlz1k2w6BVuO1TixrwfI15jYtchlZ3AwVU3saBIYl
 z6O7O4RYcz1UVGaU2zjf+6N55RdLBY5CoRPqZr2IbyO68ZfBNFyp7OUDg/xdDEtnU+EV
 aeVnnigqZfjFEzV5rMU7VNe2Dbpdlhuqmkf4QEobneFzqM+30ot0q44Ft1fsTOwOLq6B
 gqvfSP0Tc4B7Pc5gsV0rfkG4HsIQQ2CHWL0D1RZdesomak7Tu1Lntn4J1BMEMT+Qess1
 wNlg==
X-Gm-Message-State: AOJu0Ywu7BN6XCKv+ETMm0kRYGyqdjV/Ak2vB8xxCuKTGwW0XnaX+5IQ
 QwHL0YqjmE0oI+PsG0RrREwtcdz5d2PiJUQH/0lcQlfBQDZ+ga2WqLigk6jJQYEZUahqFbkTQ+K
 mJPi20zOInuoGp/MQVMjckngNR5I/4F4NBcuLfw==
X-Google-Smtp-Source: AGHT+IGffCsOYjyHIhEvtA/emGHZC3+31UtCo/H1VloNW4AfM15J7tUL4hd9vmVGUhCfT3BOZCxKwF8emrLUlRjJ/Ho=
X-Received: by 2002:a17:907:3ea4:b0:a86:94e2:2a47 with SMTP id
 a640c23a62f3a-a89d8781b18mr522620666b.15.1725295499911; Mon, 02 Sep 2024
 09:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240902074109.50173-1-michael@amarulasolutions.com>
 <20240902074109.50173-2-michael@amarulasolutions.com>
 <ZtXqsMI7fp5F2zmr@landeda>
In-Reply-To: <ZtXqsMI7fp5F2zmr@landeda>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 2 Sep 2024 18:44:49 +0200
Message-ID: <CAOf5uwnUEk1EL05_Em_o+3pj2m86eKbyhkktYV=f9idGWX8yOg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725295500; x=1725900300;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ds+GPDed/EAMJtZCaZUjv6eDL/GHYbsJGvOjSX2GwwQ=;
 b=Eo6UIh6zrVvU6rFlJ6MfAjVC66ORYHwln3VcUpl4C5ltoEhDFZJsclu9CuXdH5cnWF
 HkkcRxjMC2rJ5BDqBbNMKQwXeLEuECyvV4F9uecl6TI+7aTwXTmZurdos7KeCMfm3XG0
 V89X53mYlqiLtdCbmwASkCfSTp/5wzv6YN2Eo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Eo6UIh6z
Subject: Re: [Buildroot] [PATCH 2/2] scripts/cve: Restart the clone if the
 pull generate an exception
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

SGkgWWFubgoKT24gTW9uLCBTZXAgMiwgMjAyNCBhdCA2OjQx4oCvUE0gWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gTWljaGFlbCwgQWxsLAo+Cj4gT24g
MjAyNC0wOS0wMiAwOTo0MSArMDIwMCwgTWljaGFlbCBUcmltYXJjaGkgc3Bha2UgdGh1c2x5Ogo+
ID4gSWYgd2UgYXJlIG5vdCBhYmxlIHRvIHB1bGwgZnJvbSB0aGUgZGlyZWN0b3J5LCByZXN0YXJ0
IGZyb20gYSBjbGVhbgo+ID4gY2xvbmUKPgo+IEluIHdoYXQgc2l0dWF0aW9ucyB3b3VsZCBzdWNo
IGEgcHJvYmxlbSBhcmlzZT8KPgo+IElzIGl0IGR1ZSB0byBhIHNoYWxsb3cgY2xvbmUgYXMgcHJv
cG9zZWQgaW4gdGhlIGZpcnN0IHBhdGNoPyBJZiBzbywgdGhlbgo+IHRoYXQncyBhIGdvb2QgcmVh
c29uIG5vdCB0byBkbyBhIHNoYWxsb3cgY2xvbmUuCj4KCllvdSB0ZXN0IGlmIHRoZSBkaXIgZXhp
c3RzIGJ1dCBpZiB5b3UgY2FuY2VsIHRoZSBnaXQgY2xvbmUgd2l0aG91dAp0ZXJtaW5hdGluZyBp
dCwgeW91IGNhbiBub3QgY29udGludWUuCkl0J3MgaGFwcGVuIGFsd2F5cyBhbmQgZG9lcyBub3Qg
ZGVwZW5kIG9uIHRoZSBwcmV2aW91cyBwYXRjaAoKTWljaGFlbAoKPiBSZWdhcmRzLAo+IFlhbm4g
RS4gTU9SSU4uCj4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVs
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgc3VwcG9ydC9zY3JpcHRzL2N2ZS5w
eSB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Nj
cmlwdHMvY3ZlLnB5IGIvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weQo+ID4gaW5kZXggN2QxMTVhMjhi
NS4uYjIwNWI3MmU2NSAxMDA3NTUKPiA+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+
ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+IEBAIC0yMSw2ICsyMSw3IEBAIGltcG9y
dCBkYXRldGltZQo+ID4gIGltcG9ydCBvcwo+ID4gIGltcG9ydCBkaXN0dXRpbHMudmVyc2lvbgo+
ID4gIGltcG9ydCBqc29uCj4gPiAraW1wb3J0IHNodXRpbAo+ID4gIGltcG9ydCBzdWJwcm9jZXNz
Cj4gPiAgaW1wb3J0IHN5cwo+ID4gIGltcG9ydCBvcGVyYXRvcgo+ID4gQEAgLTY5LDE1ICs3MCwy
MSBAQCBjbGFzcyBDVkU6Cj4gPgo+ID4gICAgICBAc3RhdGljbWV0aG9kCj4gPiAgICAgIGRlZiBk
b3dubG9hZF9udmQobnZkX2dpdF9kaXIpOgo+ID4gKyAgICAgICAgZG9uZSA9IEZhbHNlCj4gPiAg
ICAgICAgICBwcmludChmIlVwZGF0aW5nIGZyb20ge05WRF9CQVNFX1VSTH0iKQo+ID4gICAgICAg
ICAgaWYgb3MucGF0aC5leGlzdHMobnZkX2dpdF9kaXIpOgo+ID4gLSAgICAgICAgICAgIHN1YnBy
b2Nlc3MuY2hlY2tfY2FsbCgKPiA+IC0gICAgICAgICAgICAgICAgWyJnaXQiLCAicHVsbCJdLAo+
ID4gLSAgICAgICAgICAgICAgICBjd2Q9bnZkX2dpdF9kaXIsCj4gPiAtICAgICAgICAgICAgICAg
IHN0ZG91dD1zdWJwcm9jZXNzLkRFVk5VTEwsCj4gPiAtICAgICAgICAgICAgICAgIHN0ZGVycj1z
dWJwcm9jZXNzLkRFVk5VTEwsCj4gPiAtICAgICAgICAgICAgKQo+ID4gLSAgICAgICAgZWxzZToK
PiA+ICsgICAgICAgICAgICB0cnk6Cj4gPiArICAgICAgICAgICAgICAgIHN1YnByb2Nlc3MuY2hl
Y2tfY2FsbCgKPiA+ICsgICAgICAgICAgICAgICAgICAgIFsiZ2l0IiwgInB1bGwiXSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgIGN3ZD1udmRfZ2l0X2RpciwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgIHN0ZG91dD1zdWJwcm9jZXNzLkRFVk5VTEwsCj4gPiArICAgICAgICAgICAgICAgICAgICBz
dGRlcnI9c3VicHJvY2Vzcy5ERVZOVUxMLAo+ID4gKyAgICAgICAgICAgICAgICApCj4gPiArICAg
ICAgICAgICAgICAgIGRvbmUgPSBUcnVlCj4gPiArICAgICAgICAgICAgZXhjZXB0Ogo+ID4gKyAg
ICAgICAgICAgICAgICBzaHV0aWwucm10cmVlKG52ZF9naXRfZGlyKQo+ID4gKwo+ID4gKyAgICAg
ICAgaWYgKG5vdCBkb25lKToKPiA+ICAgICAgICAgICAgICAjIENyZWF0ZSB0aGUgZGlyZWN0b3J5
IGFuZCBpdHMgcGFyZW50czsgZ2l0Cj4gPiAgICAgICAgICAgICAgIyBoYXBwaWx5IGNsb25lcyBp
bnRvIGFuIGVtcHR5IGRpcmVjdG9yeS4KPiA+ICAgICAgICAgICAgICBvcy5tYWtlZGlycyhudmRf
Z2l0X2RpcikKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Lgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8
ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAg
fCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1G
b3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNo
YWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFt
c3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5j
b20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
