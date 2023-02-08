Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E707C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DB4610F2;
	Wed,  8 Feb 2023 14:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DB4610F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RApbSZ8QfqBW; Wed,  8 Feb 2023 14:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16ED1610EE;
	Wed,  8 Feb 2023 14:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16ED1610EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC6FC1BF395
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9665A610EE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9665A610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8m35TXS2NYF2 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 593E460E60
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 593E460E60
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:09:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bu23so1028844wrb.8
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 06:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gs8MjFn9V5AGc9aAvZREW3OLGtdNrGxRvTy7nyrmvgI=;
 b=YnxANIDAw1mX0mK8yYLsn+/8xF0tr1/ciSRpod1+O7ct/F1SFLDnF/TbQD6SJi29ML
 rpBbvlhfDtqbcEcCAnTGoaNhCmh/WIh8UhTpR/wKX6/LVnwJdO/Z2cWrF0DKu6krpMpy
 9rsXk6J8WbadGYdW07gCGHOO/I7sFmf7mcLX1e6XdHNkPVEemyZ25HyBApAXIUEtvyFy
 Wz5o/glfTaoOZdTbo6kTTC73MhECrKXdEWkaPJp0njLyAbcQyIW0kif/VWUZnOfwExiJ
 86bvRzdMVyFauJERGLqqcdVVhwtfq6oT88jnyJzZif6D+AY6bgEzePsCwv706UiqosEW
 YyOA==
X-Gm-Message-State: AO0yUKWgziZClEoYwPmB4tbzRDvGZK+5InyDqLfAnFmn09AoKXRO9E0X
 /BJ+dSGYT7w7yzQFRVtB5TsHAlS7kWgkFXiL
X-Google-Smtp-Source: AK7set9rBwmfLs2tBFBFq9r4COivCoTbEjfckW+aGbFwpwP3HsibYPIXhpi1eew8afRP5XrpKlbjSw==
X-Received: by 2002:a5d:5604:0:b0:2c3:b47c:a0d9 with SMTP id
 l4-20020a5d5604000000b002c3b47ca0d9mr6840033wrv.50.1675865367525; 
 Wed, 08 Feb 2023 06:09:27 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm13641132wrq.51.2023.02.08.06.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:09:27 -0800 (PST)
Message-ID: <08db6cfd-03eb-9515-87ea-17a114805fe2@smile.fr>
Date: Wed, 8 Feb 2023 15:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230208110551.187828-1-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230208110551.187828-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gs8MjFn9V5AGc9aAvZREW3OLGtdNrGxRvTy7nyrmvgI=;
 b=gDNCmpo+Rua3xmOlPA1zr0hEAgfC2zNFlUkAPBJvvuanNAaFvnDVLizbHgIdmUzi0o
 9MlhBCl98WroVlFzWREzvN0yiMLKg2QgfF92weoC6iRguVXEG44clu07BNapNge4XnyW
 QipynIPMwJZvLY9SP5wDLooQ0+XIPEF4Xj5UGMz/6UdOxdt6ep2mp5JwGJx3OvkDpfqw
 dPHPUBOAgG86e/ANuRsDwzTJiUsiXdLFdPV8iNsGmtDJGXr1UWNLGVTrPCe9+s15uRlg
 mqbRdXmJPCUc7miZDM4ZkibvJm3AK37F5dXH/JXytaQfRUdC7YRWlfrVweYSfJ5nPITB
 g6ZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gDNCmpo+
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: fix boostrap build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU2ViYXN0aWFuLAoKTGUgMDgvMDIvMjAyMyDDoCAxMjowNSwgU2ViYXN0aWFuIFdleWVy
IGEgw6ljcml0wqA6Cj4gVGhlIHVwZGF0ZSB0byB2MS42Ny4wIG9mIHJ1c3QgYnJva2UgdGhlIGJv
b3N0cmFwIGJ1aWxkLiBUaGlzIHBhdGNoCj4gYXBwbGllcyBhbiB1cHN0cmVhbSBwYXRjaCB0byBm
aXggdGhpczoKPiBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL3J1c3QvY29tbWl0LzNmZTY0
ZWJiY2UyMWU3OWFkYjY0MDk5OTg0ZTk2ZGZiNzliZGQwZjkKPiAKPiBGaXhlczoKPiBodHRwOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yMTQvMjE0ZmNiYjM0NTg4OTM3ODRiN2Y4
NWI2MGY3ZWUxZWRiNDI4Yzc3Zi9idWlsZC1lbmQubG9nCgpSZXZpZXdlZC1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4K
PiBDYzogRXJpYyBMZSBCaWhhbiA8ZXJpYy5sZS5iaWhhbi5kZXZAZnJlZS5mcj4KPiBDYzogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gSSBwcmV2aW91
c2x5IGp1c3QgdGVzdGVkIFRlc3RSdXN0QmluIHNpbmNlIFRlc3RSdXN0IHRha2VzIGZvcmV2ZXIu
IFRoaXMKPiB0aW1lIEkgcmFuIFRlc3RSdXN0IGFuZCBpdCBidWlsZHMgZmluZSA6KQo+IC0tLQo+
ICAuLi4tdW5zb3VuZG5lc3MtaW4tYm9vdHN0cmFwLWNhY2hlLWNvZGUucGF0Y2ggfCA0MyArKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J1c3QvMDAwMS1maXgtdW5zb3VuZG5lc3MtaW4tYm9v
dHN0cmFwLWNhY2hlLWNvZGUucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0LzAw
MDEtZml4LXVuc291bmRuZXNzLWluLWJvb3RzdHJhcC1jYWNoZS1jb2RlLnBhdGNoIGIvcGFja2Fn
ZS9ydXN0LzAwMDEtZml4LXVuc291bmRuZXNzLWluLWJvb3RzdHJhcC1jYWNoZS1jb2RlLnBhdGNo
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4zZWFlMzQ2NDJmCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcnVzdC8wMDAxLWZpeC11bnNvdW5kbmVzcy1p
bi1ib290c3RyYXAtY2FjaGUtY29kZS5wYXRjaAo+IEBAIC0wLDAgKzEsNDMgQEAKPiArRnJvbSA2
YmYzNzc4MGVkNDk4NDZjNzhkNjcwNzM1NWYxY2Y0NDc5MGM0MzAxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICtGcm9tOiBNaWNoYWVsIEdvdWxldCA8bWljaGFlbEBlcnJzLmlvPgo+ICtEYXRl
OiBNb24sIDEyIERlYyAyMDIyIDE4OjI5OjMzICswMDAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gPT9V
VEYtOD9xPz1GMD05Rj05QT1BOD0yMGZpeD0yMHVuc291bmRuZXNzPTIwaW49MjBib290c3RyPz0K
PiArID0/VVRGLTg/cT9hcD0yMGNhY2hlPTIwY29kZT89Cj4gK01JTUUtVmVyc2lvbjogMS4wCj4g
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICsoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAzZmU2
NGViYmNlMjFlNzlhZGI2NDA5OTk4NGU5NmRmYjc5YmRkMGY5KQo+ICtTaWduZWQtb2ZmLWJ5OiBT
ZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53ZXllckBzbWlsZS5mcj4KPiArLS0tCj4gKyBzcmMv
Ym9vdHN0cmFwL2NhY2hlLnJzIHwgOCArKysrLS0tLQo+ICsgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9zcmMvYm9vdHN0
cmFwL2NhY2hlLnJzIGIvc3JjL2Jvb3RzdHJhcC9jYWNoZS5ycwo+ICtpbmRleCBiZTVjOWJiMDc4
OC4uMDVmMjVhZjY4ZWEgMTAwNjQ0Cj4gKy0tLSBhL3NyYy9ib290c3RyYXAvY2FjaGUucnMKPiAr
KysrIGIvc3JjL2Jvb3RzdHJhcC9jYWNoZS5ycwo+ICtAQCAtODksMTYgKzg5LDE2IEBAIGZuIGhh
c2g8SDogSGFzaGVyPigmc2VsZiwgc3RhdGU6ICZtdXQgSCkgewo+ICsgCj4gKyBpbXBsPFQ6IElu
dGVybmFibGUgKyBEZXJlZj4gRGVyZWYgZm9yIEludGVybmVkPFQ+IHsKPiArICAgICB0eXBlIFRh
cmdldCA9IFQ6OlRhcmdldDsKPiArLSAgICBmbiBkZXJlZigmc2VsZikgLT4gJidzdGF0aWMgU2Vs
Zjo6VGFyZ2V0IHsKPiArKyAgICBmbiBkZXJlZigmc2VsZikgLT4gJlNlbGY6OlRhcmdldCB7Cj4g
KyAgICAgICAgIGxldCBsID0gVDo6aW50ZXJuX2NhY2hlKCkubG9jaygpLnVud3JhcCgpOwo+ICst
ICAgICAgICB1bnNhZmUgeyBtZW06OnRyYW5zbXV0ZTo6PCZTZWxmOjpUYXJnZXQsICYnc3RhdGlj
IFNlbGY6OlRhcmdldD4obC5nZXQoKnNlbGYpKSB9Cj4gKysgICAgICAgIHVuc2FmZSB7IG1lbTo6
dHJhbnNtdXRlOjo8JlNlbGY6OlRhcmdldCwgJlNlbGY6OlRhcmdldD4obC5nZXQoKnNlbGYpKSB9
Cj4gKyAgICAgfQo+ICsgfQo+ICsgCj4gKyBpbXBsPFQ6IEludGVybmFibGUgKyBBc1JlZjxVPiwg
VTogP1NpemVkPiBBc1JlZjxVPiBmb3IgSW50ZXJuZWQ8VD4gewo+ICstICAgIGZuIGFzX3JlZigm
c2VsZikgLT4gJidzdGF0aWMgVSB7Cj4gKysgICAgZm4gYXNfcmVmKCZzZWxmKSAtPiAmVSB7Cj4g
KyAgICAgICAgIGxldCBsID0gVDo6aW50ZXJuX2NhY2hlKCkubG9jaygpLnVud3JhcCgpOwo+ICst
ICAgICAgICB1bnNhZmUgeyBtZW06OnRyYW5zbXV0ZTo6PCZVLCAmJ3N0YXRpYyBVPihsLmdldCgq
c2VsZikuYXNfcmVmKCkpIH0KPiArKyAgICAgICAgdW5zYWZlIHsgbWVtOjp0cmFuc211dGU6Ojwm
VSwgJlU+KGwuZ2V0KCpzZWxmKS5hc19yZWYoKSkgfQo+ICsgICAgIH0KPiArIH0KPiArIAo+ICst
LSAKPiArMi4yNS4xCj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
