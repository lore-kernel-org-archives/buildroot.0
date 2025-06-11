Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9FDC71136
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 16:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B23A81951;
	Wed, 11 Jun 2025 16:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DkW5B5xu1eo; Wed, 11 Jun 2025 16:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F461816DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F461816DF;
	Wed, 11 Jun 2025 16:39:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB3BF237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 16:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D155640425
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 16:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4O09SaTD8W6D for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 16:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D63F3400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D63F3400BF
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D63F3400BF
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 16:39:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6077d0b9bbeso163779a12.3
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 09:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749659983; x=1750264783;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3o5wex+g86vgdKs4XX+rRpnBOBJCh31ReNCOGGvC+tk=;
 b=HKGkZyqbypWdKVNHZ/g/38/7siCKE3mXYyBDQBKyxCZGNwfhGau7qWCo0S7rGNMYQN
 h7liQ8SOrLy8uC5lKFzAOX//0x3XlEViWp7QKNUI/W5pnWsN6/FIvnwOLkPCvT2S/e2m
 ouNEpNDv653bCjJlMA90EyYMjIM+hrE4NM7LdAT0bm/QkPWRB0d1OxZvCjouhIs2FFuX
 yEwDGPlPJP6rJJYrn0oHTrHKJJjCaBf3czXiNalt7XbcEDNmkKdkhQ1Zbs+zNpxv3fvN
 bFlgRzlYt05y86rg94F5eSIzJwM11T1AzjvHG332VxJvXN6luJeqGGDEfjgLzzNr411w
 ttlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXooEWpOYFU8IXCqHiKGgnSVrVBmjihmidBNrNCZ0j49Ykw+p7/UcTxcCQtzPN20nt1QyiBgZVwrEE=@buildroot.org
X-Gm-Message-State: AOJu0YyS7t8edOlLC16UQylXs/dQVWnsJhcGEQmFAk4EAutdjj24+NyC
 e7fLImGiBkkW1sDYGrwZEFanYB/s3kM6CUHIONMB6aLmkZ+uvfPC8gvsOfI2ITidkJHOO3d/flr
 gqeYD
X-Gm-Gg: ASbGncu586fYUxF1MquJwaWtwbm5f89rMjb2d5CQpkvLCx1cPbk6cyyk6d5MCdj/gX9
 ppk10dfAyFIEQV3NKFolZlfaQEzmMnGiYOwtCybr/qhr4SrAbuCrpm523GFHH4XCiFR8S40uIJS
 UhHsZap9QymTGH1Oa5HB1CB5ZCz3EHKddDl8PRV8Ld4FHGRroKSIRBlbFM4WjC/jSfH48kS6BkX
 nqwuG34CL2VRudNj1EzBBO3cvYtVAzhC0BFBygtheZUfkvrUzm+5TnhMPnPoq+wzQLzSD0SIRGq
 2mA+KxklB0BAkfdKEvnn1zbLV9PD1vE7cpoFXkNOgfKit+jkaKaHcrpFwDjwyoA=
X-Google-Smtp-Source: AGHT+IGcQiJYBa+G/WmA+3eY7rUYl5zh+eyKHNE+QPbk+CkcO7XgHcE3lZZEMRxi4ChQTNLOFUdxdw==
X-Received: by 2002:a17:907:94c2:b0:ad2:2a5d:b1a2 with SMTP id
 a640c23a62f3a-adea273e1e5mr40248166b.57.1749659983482; 
 Wed, 11 Jun 2025 09:39:43 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc39c29sm908751766b.138.2025.06.11.09.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 09:39:42 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 30ADD5F7CB;
 Wed, 11 Jun 2025 17:39:41 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,  buildroot@buildroot.org,  Julien
 Olivain <ju.o@free.fr>,  Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <274904fe-4703-4571-88db-d2f3e1539d4e@green-communications.fr>
 (Nicolas Cavallari's message of "Wed, 11 Jun 2025 17:39:06 +0200")
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
 <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
 <87jz5ijsbw.fsf@draig.linaro.org>
 <274904fe-4703-4571-88db-d2f3e1539d4e@green-communications.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 11 Jun 2025 17:39:41 +0100
Message-ID: <87tt4mi65u.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749659983; x=1750264783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3o5wex+g86vgdKs4XX+rRpnBOBJCh31ReNCOGGvC+tk=;
 b=Phe8Z3QsHRSYaKyBPlrwJ5T76PLLoDNcAUg/gFCly5DgGQHPgX2RzchLs/GSmEyI2O
 4EbKvKDXzwjxaU14nQ3UhIFCDOux+Ja03TGS9fFVzc4auDiLSPnf4wd32qURN5TRKneE
 Rhq4aH6sGH5hUTCOEYrx1J8K10Ga3cPaa+MJp0cJy5OeJwQFS5ia7K0AEqyWzk/CCxcg
 YRyqYAaZGvWXfqJae4b0hNBMm8wztO71SYrdKlBetY9IFfp5BJQNhmydiYwlPvYBEs05
 Fc2wYsGodjkWktDCFNxiUpY/il38JWl2b8c8WrBOq32vSW5TkncmhPFZDzqjoTtphQOC
 WGMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Phe8Z3Qs
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
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

Tmljb2xhcyBDYXZhbGxhcmkgPG5pY29sYXMuY2F2YWxsYXJpQGdyZWVuLWNvbW11bmljYXRpb25z
LmZyPiB3cml0ZXM6Cgo+IE9uIDExLzA2LzIwMjUgMTU6NTUsIEFsZXggQmVubsOpZSB3cm90ZToK
Pj4gSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPiB3cml0ZXM6Cj4+IAo+Pj4g
SGkgQWxleCwKPj4+Cj4+PiBBbSBNaS4sIDExLiBKdW5pIDIwMjUgdW0gMTM6MTYgVWhyIHNjaHJp
ZWIgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPj4+Cj4+PiAgIFdlIGJ1
aWxkIGZyb20gYSByZWNlbnQgSEVBRCB0byBlbnN1cmUgd2UgaGF2ZSB0aGUgZml4ZXMgdG8gYmV0
dGVyCj4+PiAgIGhhbmRsZSB0aGUgbWlzc2luZyBLSFJfZGlzcGxheSBleHRlbnNpb24uCj4+Pgo+
Pj4gICBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+
Cj4+Pgo+Pj4gSSB0cmllZCB0byBidWlsZCB2a21hcmsgYWdhaW5zdCwgbm93IHdpdGggd2F5bGFu
ZCBlbmFibGVkIGFuZCBJIHNlZSB0aGlzOgo+Pj4KPj4+IFByb2dyYW0gL3Vzci9iaW4vd2F5bGFu
ZC1zY2FubmVyIGZvdW5kOiBOTwo+Pj4KPj4+IC4uL291dC13ZXN0b24vYnVpbGQvdmttYXJrLTM2
ZTdkOWIyZWNmNzIzZTg3NmFkZDY1NTM0ZTk1ZjU1ZWMxYmM3OWQvc3JjL21lc29uLmJ1aWxkOjEx
NjoyMjogRVJST1I6IFByb2dyYW0KPj4+ICcvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXInIG5vdCBm
b3VuZCBvciBub3QgZXhlY3V0YWJsZQo+PiBIbW0gdGhpcyBzZWVtcyBvZGQuIEF0IGxlYXN0IHdh
eWxhbmQtc2Nhbm5lciBoYXMgYSBwa2djb25mIHZhcmlhYmxlOgo+PiAgICDwn5WZMTQ6NTE6MjEg
YWxleEBkcmFpZzpidWlsZHJvb3QuZ2l0L2J1aWxkcy94ODZfNjQgIG9uIO6CoAo+PiBhZGQtdmly
dGlvLXZ1bGthbi12a21hcms6bWFzdGVyIFskIT/ih6FdCj4+ICAgIOKenCAgcGtnLWNvbmZpZyAt
LXZhcmlhYmxlPXdheWxhbmRfc2Nhbm5lciAgd2F5bGFuZC1zY2FubmVyCj4+ICAgIC91c3IvYmlu
L3dheWxhbmQtc2Nhbm5lcgo+PiAgICDwn5WZMTQ6NTI6MTYgYWxleEBkcmFpZzpidWlsZHJvb3Qu
Z2l0L2J1aWxkcy94ODZfNjQgIG9uIO6CoCBhZGQtdmlydGlvLXZ1bGthbi12a21hcms6bWFzdGVy
IFskIT/ih6FdCj4+ICAgIOKenCAgLi9ob3N0L2Jpbi9wa2djb25mIC0tdmFyaWFibGU9d2F5bGFu
ZF9zY2FubmVyICB3YXlsYW5kLXNjYW5uZXIKPj4gICAgL2hvbWUvYWxleC9sc3JjL3Rlc3RzL2J1
aWxkcm9vdC5naXQvYnVpbGRzL3g4Nl82NC9ob3N0L2Jpbi93YXlsYW5kLXNjYW5uZXIKPj4gICAg
8J+VmTE0OjUyOjI5IGFsZXhAZHJhaWc6YnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0ICBvbiDu
gqAgYWRkLXZpcnRpby12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oehXQo+PiAgICDinpwKPj4g
QW5kIHRoZSBtZXNvbiBzaG91bGQgZmluZCBpdCB3aXRoIHRoZSBub3JtYWwgZGVwZW5kZW5jeSBs
b2dpYzoKPj4gICAgICB3YXlsYW5kX3NjYW5uZXIgPQo+PiBmaW5kX3Byb2dyYW0od2F5bGFuZF9z
Y2FubmVyX2RlcC5nZXRfdmFyaWFibGUoJ3dheWxhbmRfc2Nhbm5lcicpKQo+Cj4gd2F5bGFuZF9z
Y2FubmVyX2RlcCBpcyBkZWZpbmVkIGFzOgo+Cj4gd2F5bGFuZF9zY2FubmVyX2RlcCA9IGRlcGVu
ZGVuY3koJ3dheWxhbmQtc2Nhbm5lcicsIHJlcXVpcmVkIDoKPiBnZXRfb3B0aW9uKCd3YXlsYW5k
JykgPT0gJ3RydWUnKQo+Cj4gU28gaXQgaXMgc2VhcmNoaW5nIGZvciBhIHdheWxhbmQtc2Nhbm5l
ciBjb21waWxlZCBmb3IgdGhlIHRhcmdldCwgbm90Cj4gZm9yIG9uZSBvbiB0aGUgaG9zdC4gSXQg
c2hvdWxkIHByb2JhYmx5IGNoYW5nZWQgdG8KPgo+IHdheWxhbmRfc2Nhbm5lcl9kZXAgPSBkZXBl
bmRlbmN5KCd3YXlsYW5kLXNjYW5uZXInLCByZXF1aXJlZCA6Cj4gZ2V0X29wdGlvbignd2F5bGFu
ZCcpID09ICd0cnVlJywgbmF0aXZlOiB0cnVlKQoKVGhhdCB3b3JrczoKCkJ1aWxkLXRpbWUgZGVw
ZW5kZW5jeSB3YXlsYW5kLXNjYW5uZXIgZm91bmQ6IFlFUyAxLjIzLjEgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApSdW4tdGltZSBk
ZXBlbmRlbmN5IGxpYmRybSBmb3VuZDogWUVTIDIuNC4xMjQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKUnVuLXRp
bWUgZGVwZW5kZW5jeSBnYm0gZm91bmQ6IFlFUyAyNS4xLjMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClBy
b2dyYW0gcHl0aG9uMyBmb3VuZDogWUVTICgvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVpbGRyb290
LmdpdC9idWlsZHMvYXJtNjQvaG9zdC9iaW4vcHl0aG9uMykgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IApQcm9ncmFtIC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3QuZ2l0L2J1aWxkcy9hcm02
NC9ob3N0L2Jpbi93YXlsYW5kLXNjYW5uZXIgZm91bmQ6IFlFUyAoL2hvbWUvYWxleC9sc3JjL3Rl
c3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2hvc3QvYmluL3dheWxhbmQtc2Nhbm5lcikg
ICAgCgoKLS04PC0tLS0tLS0tLS0tLS0tLWN1dCBoZXJlLS0tLS0tLS0tLS0tLS0tc3RhcnQtLS0t
LS0tLS0tLS0tPjgtLS0KbW9kaWZpZWQgICBwYWNrYWdlL3ZrbWFyay8wMDAyLW1lc29uLWZpeC1j
cm9zcy1jb21waWxhdGlvbi01MC03NS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZGM5YTBj
MmQ4Njg3NTAxZGRmOTdjOTc1OTlmYTdhNjlkMDdkM2QzZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMGNiMWE2MjdjY2IyZGEzYzBjZmQyODdlNDA3YzNlODVmYjc1MGM5NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9BbGV4PTIwQmVubj1DMz1BOWU/PSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KIERhdGU6IEZyaSwgNiBKdW4gMjAyNSAxNzo0ODo0MCAr
MDEwMAogU3ViamVjdDogW1BBVENIIDIvMl0gbWVzb246IGZpeCBjcm9zcy1jb21waWxhdGlvbiAo
IzUwLCAjNzUpCkBAIC02LDE1ICs2LDMzIEBAIE1JTUUtVmVyc2lvbjogMS4wCiBDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKIENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKIAotTm93IHdlIGhhdmUgdXBkYXRlZCB0aGUgbWluaW11bSBtZXNvbiB2ZXJzaW9uIHdl
IGNhbiBhcHBseSBzeXNfcm9vdCB0bwotdGhlIHByZWZpeCB2YXJpYWJsZSB0byBlbnN1cmUgd2Ug
Y2FuIGZpbmQgdGhlIHJpZ2h0IHZrLnhtbCB3aGVuCi1jcm9zcy1jb21waWxpbmcuCitDdXJyZW50
bHkgdGhlcmUgYXJlIGEgZmV3IHByb2JsZW1zIGdldHRpbmcgaW4gdGhlIHdheSBvZiBjcm9zcwor
Y29tcGlsYXRpb246CisKKyAgLSB3ZSBuZWVkIHRvIGFwcGx5IHN5c19yb290IHRvIHRoZSBwcmVm
aXggdmFyaWFibGUgdG8gZmluZCB0aGUgcmlnaHQgdmsueG1sCisgIC0gd2UgbmVlZCB0byBmb3Jj
ZSB0aGUgbmF0aXZlIHdheWxhbmQtc2Nhbm5lciB0byBnZW5lcmF0ZSBoZWFkZXJzCiAKIFNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KIC0tLQorIG1l
c29uLmJ1aWxkICAgICB8IDQgKysrLQogIHNyYy9tZXNvbi5idWlsZCB8IDQgKysrLQotIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKyAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAorZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKK2luZGV4IDJkMDhkNTMuLjZjYjU2ZjUgMTAwNjQ0CistLS0g
YS9tZXNvbi5idWlsZAorKysrIGIvbWVzb24uYnVpbGQKK0BAIC0yOSw3ICsyOSw5IEBAIHhjYl9p
Y2NjbV9kZXAgPSBkZXBlbmRlbmN5KCd4Y2ItaWNjY20nLCByZXF1aXJlZCA6IGdldF9vcHRpb24o
J3hjYicpID09ICd0cnVlJykKKyB3YXlsYW5kX2NsaWVudF9kZXAgPSBkZXBlbmRlbmN5KCd3YXls
YW5kLWNsaWVudCcsIHJlcXVpcmVkIDogZ2V0X29wdGlvbignd2F5bGFuZCcpID09ICd0cnVlJykK
KyB3YXlsYW5kX3Byb3RvY29sc19kZXAgPSBkZXBlbmRlbmN5KCd3YXlsYW5kLXByb3RvY29scycs
IHZlcnNpb24gOiAnPj0gMS4xMicsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3dheWxhbmQnKSA9PSAndHJ1ZScpCistd2F5bGFuZF9z
Y2FubmVyX2RlcCA9IGRlcGVuZGVuY3koJ3dheWxhbmQtc2Nhbm5lcicsIHJlcXVpcmVkIDogZ2V0
X29wdGlvbignd2F5bGFuZCcpID09ICd0cnVlJykKKyt3YXlsYW5kX3NjYW5uZXJfZGVwID0gZGVw
ZW5kZW5jeSgnd2F5bGFuZC1zY2FubmVyJywKKysgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZXF1aXJlZCA6IGdldF9vcHRpb24oJ3dheWxhbmQnKSA9PSAndHJ1ZScsCisrICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbmF0aXZlOiB0cnVlKQorIGxpYmRybV9kZXAgPSBk
ZXBlbmRlbmN5KCdsaWJkcm0nLCByZXF1aXJlZCA6IGdldF9vcHRpb24oJ2ttcycpID09ICd0cnVl
JykKKyBnYm1fZGVwID0gZGVwZW5kZW5jeSgnZ2JtJywgcmVxdWlyZWQgOiBnZXRfb3B0aW9uKCdr
bXMnKSA9PSAndHJ1ZScpCisgCiBkaWZmIC0tZ2l0IGEvc3JjL21lc29uLmJ1aWxkIGIvc3JjL21l
c29uLmJ1aWxkCiBpbmRleCBhNjY0ZGRjLi5iMGU4YzRhIDEwMDY0NAogLS0tIGEvc3JjL21lc29u
LmJ1aWxkCi0tODwtLS0tLS0tLS0tLS0tLS1jdXQgaGVyZS0tLS0tLS0tLS0tLS0tLWVuZC0tLS0t
LS0tLS0tLS0tLT44LS0tCgoKCi0tIApBbGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBM
ZWFkIEAgTGluYXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
