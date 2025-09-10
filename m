Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F141DCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B686D843FC;
	Wed, 10 Sep 2025 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HmzI-g1A8xg; Wed, 10 Sep 2025 22:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE7E843F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE7E843F9;
	Wed, 10 Sep 2025 22:12:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 099C52BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 066B9614DC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp52izRrbipt for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 22:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C827D6128C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C827D6128C
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C827D6128C
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 22:12:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3e2fdddd01dso19664f8f.2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 15:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757542356; x=1758147156;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eTS+lPZLBIcO8oGzqh2VzGWY/03v7/LpsGi3V20Qbks=;
 b=N7exZtoCdbjpKcEUV/fEj4SC/0PM9wDNltk/tqVdRuGO7ayyw/XVZRL2uHemI9F69u
 iN3sMo6W2wONFx1sgJ6jq2pUme4d6caDCeLLD2c+Oi6xl3ATXmR0oVp85sFflsRzMEaq
 GCRn80B7d0NhxsrOBcwJJfd2lG9q3aRJfaznL7MtdiOA+zHxISF4UjG4Gudg3P70Ngst
 LwKVcjM2FKxdv5JjnTAq31lNaVWlnFkogdutjebtt1SiX71QeWPPbC7tg+2EcXiU8QNA
 z+yDS7vYWVQ2VA+vhgYOjGn2uS60tNtf46XOaSPtbp4/X7NU/6DWAwmZn7soJ9OUwfqj
 hYXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIFsp0dCOVBSoWMCRDNt2LXjLZBlW1Cpl5KERpI4e3LZXn26DimIWpfJ2cgbPQxOiufwcZY8ZZxFk=@buildroot.org
X-Gm-Message-State: AOJu0YxKM3EdZjl6utq2RDFpPY7DihLB+I90F2tIZdNAniE2oQbPTOcZ
 BrvX2BhCbTLLDXcgbGipzOrPM/DvAMHbsm3YswgRxEmP/mhEfliO3VwOqcEd6U8WhYQ=
X-Gm-Gg: ASbGncsPlo4mwpqTLZoiKtNgRbf5SIEy4tGL5gkreSUqWw5MM95Ws4mTOlJPukbWuEc
 B74gPn2nR/KN0E1x1Suw5n3U5ihmh5S6o7DKd85DgCPXSoJ8/CrQMGFJPHvLAUDu2OQ4sHuYjIh
 A15AR1n8sP3u/Bp19bTDMXHayVm8SWQzd2BwEWoUiStFCsRcDnJMJGNLPYfego8DbnLZwM2bIeS
 Ava9BQrlsSzxxzLZTdABvedmT9aUFU/XoW7SIljquOOcnbWGIiAGyzsb1rcIgDncxC7jAq6c2w9
 0k6VpTglV8etA5zfFLmb3YTaYg/x/s31fgIAUKTwggv30sv/9A77QlVr+Zvp6lXEncHLXv2siBs
 D0rR/nBgUFSo3ogf8sQL+Gb2fysZ2jRypy22Mlj4WxPaxEHyqRPcflVn6zjgEa/9WjTrmiRCJOy
 /7hrMfKJacl+yNYQzjJy99aKWkH+usjZHHTo6mQlqXllNetYQA8SyR8v0BgTpzjf+ecfKEwWM=
X-Google-Smtp-Source: AGHT+IFvFUBMmZdZnk6xjIjjiAmdomXAV9Hbc8aVVWqxKVDxfO+xM6KCaHQdcHIE8oC9Ako/7qE62A==
X-Received: by 2002:a05:6000:4107:b0:3e6:f02b:84eb with SMTP id
 ffacd0b85a97d-3e6f02b8e1fmr11577145f8f.22.1757542356498; 
 Wed, 10 Sep 2025 15:12:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0156c64bsm3074905e9.2.2025.09.10.15.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 15:12:36 -0700 (PDT)
Message-ID: <c460648f-77ab-4244-9a1e-4024eeeb7bf3@smile.fr>
Date: Thu, 11 Sep 2025 00:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250910213829.1532317-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250910213829.1532317-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757542356; x=1758147156; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eTS+lPZLBIcO8oGzqh2VzGWY/03v7/LpsGi3V20Qbks=;
 b=plJV8z9lTdfBkoEYCIzV1f9vAIiIcc6MLRAvokUWNDJTHC+NkN+YE4OdJu7Bw+iGQ/
 ZVbIOesGFa1zZ/ZSrBL11obfA1UnqrXIUjIgoGcdkKbrEImuiK+irKzkYH39W5PPq3zP
 ZUFQgGGKA8PLpiLWWorQBbSCKwFoeQo5mSg7w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=plJV8z9l
Subject: Re: [Buildroot] [PATCH] package/gdbm: drop patch
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxMC8wOS8yMDI1IMOgIDIzOjM4LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBQYXRjaCAwMDAxLUMyMy1jb21wYXRpYmls
aXR5LWZpeC5wYXRjaCB3YXMgYWRkZWQgYnkgY29tbWl0Cj4gYmJlYzgwNTcxNzE2NzcxNGVlNmIy
MmI4YzhiMmRkZGRjY2U0N2VhNCwgdGhlbiByZW1vdmVkIGJ5IGNvbW1pdAo+IDJkZDIwMjEyZjJl
ZGIzYTc2M2Q5MjUxZGNlMTU3OTU2MjQ1YmVjMDkgdGhhdCBidW1wZWQgdG8gdmVyc2lvbiAxLjI2
LAo+IGJ1dCBmb3Igc29tZSByZWFzb24gMjU5MThmNDU1YzYxYjQ4N2NjMjllM2NmYjhlY2UwZTM1
ZGI5NmFhMSByZS1hZGRlZAo+IGl0LCBwcm9iYWJseSBkdWUgdG8gc29tZSBpc3N1ZXMgaW4gdGhl
IG5leHQgLT4gbWFzdGVyIG1lcmdlLgo+IAo+IExldCdzIGRyb3AgdGhlIHBhdGNoIHRvIGZpeCBi
dWlsZCBpc3N1ZXMuCj4gCj4gRml4ZXM6Cj4gCj4gICBodHRwczovL2F1dG9idWlsZC5idWlsZHJv
b3QubmV0L3Jlc3VsdHMvMDM0MWQ4Mjg0ZDlhMDY5NTMzYjU1MTAzYzE2NjZiOTA0NjczMDZkNC8K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgoKPiAtLS0KPiAgcGFja2FnZS9nZGJtLzAwMDEtQzIzLWNvbXBhdGliaWxpdHktZml4LnBh
dGNoIHwgMTU4IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTU4IGRlbGV0
aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZGJtLzAwMDEtQzIzLWNvbXBh
dGliaWxpdHktZml4LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2RibS8wMDAxLUMy
My1jb21wYXRpYmlsaXR5LWZpeC5wYXRjaCBiL3BhY2thZ2UvZ2RibS8wMDAxLUMyMy1jb21wYXRp
YmlsaXR5LWZpeC5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDg3ZmQ5
NGUxOTYuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL2dkYm0vMDAwMS1DMjMtY29tcGF0aWJp
bGl0eS1maXgucGF0Y2gKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMTU4ICswLDAgQEAKPiAtRnJv
bSAyMzgzMTVlOWY0ZjU0N2RmZjRmNWI5ZGZmMmY5MDMzODVhODA0OGNiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQo+IC1Gcm9tOiBTZXJnZXkgUG96bnlha29mZiA8Z3JheUBnbnUub3JnPgo+IC1E
YXRlOiBTdW4sIDE3IE5vdiAyMDI0IDIyOjU4OjU0ICswMjAwCj4gLVN1YmplY3Q6IFtQQVRDSF0g
QzIzIGNvbXBhdGliaWxpdHkgZml4Cj4gLQo+IC1UaGlzIGZpeGVzIGh0dHBzOi8vcHVzemN6YS5n
bnUub3JnLnVhL2J1Z3MvPzY0Mgo+IC0KPiAtKiB0b29scy92YXIuYyAodW5pb24gdmFsdWUpOiBS
ZW5hbWUgYm9vbCB0byBiLgo+IC0KPiAtVXBzdHJlYW06IDczNGY2OTQ1MTM5MmZmYjYyODBkOGEz
YWVmNTFlMjY3M2M5Yjg1NTQKPiAtW1Rob21hczogbmVlZGVkIGEgZmV3IGJhY2twb3J0aW5nIGFk
anVzdGVtZW50c10KPiAtU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbT4KPiAtLS0tCj4gLSB0b29scy92YXIuYyB8IDMyICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gLSAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMTYgZGVsZXRpb25zKC0pCj4gLQo+IC1kaWZmIC0tZ2l0IGEvdG9vbHMvdmFyLmMgYi90
b29scy92YXIuYwo+IC1pbmRleCAwZjI4NWYxLi5jNTUzYWU1IDEwMDY0NAo+IC0tLS0gYS90b29s
cy92YXIuYwo+IC0rKysgYi90b29scy92YXIuYwo+IC1AQCAtMjcsNyArMjcsNyBAQAo+IC0gdW5p
b24gdmFsdWUKPiAtIHsKPiAtICAgY2hhciAqc3RyaW5nOwo+IC0tICBpbnQgYm9vbDsKPiAtKyAg
aW50IGI7Cj4gLSAgIGludCBudW07Cj4gLSB9Owo+IC0gCj4gLUBAIC05MCw3ICs5MCw3IEBAIHN0
YXRpYyBzdHJ1Y3QgdmFyaWFibGUgdmFydGFiW10gPSB7Cj4gLSAgICAgLm5hbWUgPSAiY29uZmly
bSIsCj4gLSAgICAgLnR5cGUgPSBWQVJUX0JPT0wsCj4gLSAgICAgLmZsYWdzID0gVkFSRl9JTklU
LAo+IC0tICAgIC5pbml0ID0geyAuYm9vbCA9IDEgfQo+IC0rICAgIC5pbml0ID0geyAuYiA9IDEg
fQo+IC0gICB9LAo+IC0gICB7Cj4gLSAgICAgLm5hbWUgPSAiY2FjaGVzaXplIiwKPiAtQEAgLTEx
NCwzMiArMTE0LDMyIEBAIHN0YXRpYyBzdHJ1Y3QgdmFyaWFibGUgdmFydGFiW10gPSB7Cj4gLSAg
ICAgLm5hbWUgPSAibG9jayIsCj4gLSAgICAgLnR5cGUgPSBWQVJUX0JPT0wsCj4gLSAgICAgLmZs
YWdzID0gVkFSRl9JTklULAo+IC0tICAgIC5pbml0ID0geyAuYm9vbCA9IDEgfQo+IC0rICAgIC5p
bml0ID0geyAuYiA9IDEgfQo+IC0gICB9LAo+IC0gICB7Cj4gLSAgICAgLm5hbWUgPSAibW1hcCIs
Cj4gLSAgICAgLnR5cGUgPSBWQVJUX0JPT0wsCj4gLSAgICAgLmZsYWdzID0gVkFSRl9JTklULAo+
IC0tICAgIC5pbml0ID0geyAuYm9vbCA9IDEgfQo+IC0rICAgIC5pbml0ID0geyAuYiA9IDEgfQo+
IC0gICB9LAo+IC0gICB7Cj4gLSAgICAgLm5hbWUgPSAic3luYyIsCj4gLSAgICAgLnR5cGUgPSBW
QVJUX0JPT0wsCj4gLSAgICAgLmZsYWdzID0gVkFSRl9JTklULAo+IC0tICAgIC5pbml0ID0geyAu
Ym9vbCA9IDAgfQo+IC0rICAgIC5pbml0ID0geyAuYiA9IDAgfQo+IC0gICB9LAo+IC0gICB7Cj4g
LSAgICAgLm5hbWUgPSAiY29hbGVzY2UiLAo+IC0gICAgIC50eXBlID0gVkFSVF9CT09MLAo+IC0g
ICAgIC5mbGFncyA9IFZBUkZfSU5JVCwKPiAtLSAgICAuaW5pdCA9IHsgLmJvb2wgPSAwIH0sCj4g
LSsgICAgLmluaXQgPSB7IC5iID0gMCB9LAo+IC0gICAgIC5zZXRob29rID0gY29hbGVzY2Vfc2V0
aG9vawo+IC0gICB9LAo+IC0gICB7Cj4gLSAgICAgLm5hbWUgPSAiY2VudGZyZWUiLAo+IC0gICAg
IC50eXBlID0gVkFSVF9CT09MLAo+IC0gICAgIC5mbGFncyA9IFZBUkZfSU5JVCwKPiAtLSAgICAu
aW5pdCA9IHsgLmJvb2wgPSAwIH0sCj4gLSsgICAgLmluaXQgPSB7IC5iID0gMCB9LAo+IC0gICAg
IC5zZXRob29rID0gY2VudGZyZWVfc2V0aG9vawo+IC0gICB9LAo+IC0gICB7Cj4gLUBAIC0yNTIs
MjEgKzI1MiwyMSBAQCBzMmIgKHVuaW9uIHZhbHVlICp2cCwgdm9pZCAqdmFsLCBpbnQgZmxhZ3Mp
Cj4gLSAgIGZvciAoaSA9IDA7IHRydWV2YWxbaV07IGkrKykKPiAtICAgICBpZiAoc3RyY2FzZWNt
cCAodHJ1ZXZhbFtpXSwgdmFsKSA9PSAwKQo+IC0gICAgICAgewo+IC0tCXZwLT5ib29sID0gMTsK
PiAtKwl2cC0+YiA9IDE7Cj4gLSAJcmV0dXJuIFZBUl9PSzsKPiAtICAgICAgIH0KPiAtICAgCj4g
LSAgIGZvciAoaSA9IDA7IGZhbHNldmFsW2ldOyBpKyspCj4gLSAgICAgaWYgKHN0cmNhc2VjbXAg
KGZhbHNldmFsW2ldLCB2YWwpID09IDApCj4gLSAgICAgICB7Cj4gLS0JdnAtPmJvb2wgPSAwOwo+
IC0rCXZwLT5iID0gMDsKPiAtIAlyZXR1cm4gVkFSX09LOwo+IC0gICAgICAgfQo+IC0gICAKPiAt
ICAgbiA9IHN0cnRvdWwgKHZhbCwgJnAsIDApOwo+IC0gICBpZiAoKnApCj4gLSAgICAgcmV0dXJu
IFZBUl9FUlJfQkFEVFlQRTsKPiAtLSAgdnAtPmJvb2wgPSAhIW47Cj4gLSsgIHZwLT5iID0gISFu
Owo+IC0gICByZXR1cm4gVkFSX09LOwo+IC0gfQo+IC0gICAKPiAtQEAgLTI4Niw3ICsyODYsNyBA
QCBzMmkgKHVuaW9uIHZhbHVlICp2cCwgdm9pZCAqdmFsLCBpbnQgZmxhZ3MpCj4gLSBzdGF0aWMg
aW50Cj4gLSBiMmIgKHVuaW9uIHZhbHVlICp2cCwgdm9pZCAqdmFsLCBpbnQgZmxhZ3MpCj4gLSB7
Cj4gLS0gIHZwLT5ib29sID0gISEqKGludCopdmFsOwo+IC0rICB2cC0+YiA9ICEhKihpbnQqKXZh
bDsKPiAtICAgcmV0dXJuIFZBUl9PSzsKPiAtIH0KPiAtIAo+IC1AQCAtMzA3LDcgKzMwNyw3IEBA
IGkyaSAodW5pb24gdmFsdWUgKnZwLCB2b2lkICp2YWwsIGludCBmbGFncykKPiAtIHN0YXRpYyBp
bnQKPiAtIGkyYiAodW5pb24gdmFsdWUgKnZwLCB2b2lkICp2YWwsIGludCBmbGFncykKPiAtIHsK
PiAtLSAgdnAtPmJvb2wgPSAqKGludCopdmFsOwo+IC0rICB2cC0+YiA9ICooaW50Kil2YWw7Cj4g
LSAgIHJldHVybiBWQVJfT0s7Cj4gLSB9Cj4gLSAKPiAtQEAgLTQxNCw3ICs0MTQsNyBAQCB2YXJp
YWJsZV9nZXQgKGNvbnN0IGNoYXIgKm5hbWUsIGludCB0eXBlLCB2b2lkICoqdmFsKQo+IC0gICAg
ICAgYnJlYWs7Cj4gLSAKPiAtICAgICBjYXNlIFZBUlRfQk9PTDoKPiAtLSAgICAgICooaW50Kil2
YWwgPSB2cC0+di5ib29sOwo+IC0rICAgICAgKihpbnQqKXZhbCA9IHZwLT52LmI7Cj4gLSAgICAg
ICBicmVhazsKPiAtICAgICAgIAo+IC0gICAgIGNhc2UgVkFSVF9JTlQ6Cj4gLUBAIC00NjEsNyAr
NDYxLDcgQEAgdmFyaWFibGVfcHJpbnRfYWxsIChGSUxFICpmcCkKPiAtIAkgICAgICBicmVhazsK
PiAtIAkgICAgICAKPiAtIAkgICAgY2FzZSBWQVJUX0JPT0w6Cj4gLS0JICAgICAgZnByaW50ZiAo
ZnAsICIlcyVzIiwgdnAtPnYuYm9vbCA/ICIiIDogIm5vIiwgdnAtPm5hbWUpOwo+IC0rCSAgICAg
IGZwcmludGYgKGZwLCAiJXMlcyIsIHZwLT52LmIgPyAiIiA6ICJubyIsIHZwLT5uYW1lKTsKPiAt
IAkgICAgICBicmVhazsKPiAtIAkgICAgICAKPiAtIAkgICAgY2FzZSBWQVJUX1NUUklORzoKPiAt
QEAgLTY0Nyw3ICs2NDcsNyBAQCBjZW50ZnJlZV9zZXRob29rIChzdHJ1Y3QgdmFyaWFibGUgKnZh
ciwgdW5pb24gdmFsdWUgKnYpCj4gLSB7Cj4gLSAgIGlmICghdikKPiAtICAgICByZXR1cm4gVkFS
X09LOwo+IC0tICByZXR1cm4gZ2RibXNoZWxsX3NldG9wdCAoIkdEQk1fU0VUQ0VOVEZSRUUiLCBH
REJNX1NFVENFTlRGUkVFLCB2LT5ib29sKSA9PSAwCj4gLSsgIHJldHVybiBnZGJtc2hlbGxfc2V0
b3B0ICgiR0RCTV9TRVRDRU5URlJFRSIsIEdEQk1fU0VUQ0VOVEZSRUUsIHYtPmIpID09IDAKPiAt
ICAgICAgICAgID8gVkFSX09LIDogVkFSX0VSUl9HREJNOwo+IC0gfQo+IC0gCj4gLUBAIC02NTYs
NyArNjU2LDcgQEAgY29hbGVzY2Vfc2V0aG9vayAoc3RydWN0IHZhcmlhYmxlICp2YXIsIHVuaW9u
IHZhbHVlICp2KQo+IC0gewo+IC0gICBpZiAoIXYpCj4gLSAgICAgcmV0dXJuIFZBUl9PSzsKPiAt
LSAgcmV0dXJuIGdkYm1zaGVsbF9zZXRvcHQgKCJHREJNX1NFVENPQUxFU0NFQkxLUyIsIEdEQk1f
U0VUQ09BTEVTQ0VCTEtTLCB2LT5ib29sKSA9PSAwCj4gLSsgIHJldHVybiBnZGJtc2hlbGxfc2V0
b3B0ICgiR0RCTV9TRVRDT0FMRVNDRUJMS1MiLCBHREJNX1NFVENPQUxFU0NFQkxLUywgdi0+Yikg
PT0gMAo+IC0gICAgICAgICAgPyBWQVJfT0sgOiBWQVJfRVJSX0dEQk07Cj4gLSB9Cj4gLSAMCj4g
LS0tIAo+IC0yLjUwLjEKPiAtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
