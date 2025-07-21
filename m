Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A65C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 08:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14E761CC1;
	Mon, 21 Jul 2025 08:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51go-MMSeoQP; Mon, 21 Jul 2025 08:29:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CB8361CB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB8361CB7;
	Mon, 21 Jul 2025 08:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C75A3DA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADB9440070
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcvdfI65oJuC for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 08:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97A4740010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97A4740010
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97A4740010
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:29:44 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so44544715e9.1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 01:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753086582; x=1753691382;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NWcHRLuo+jsf3lMAmKI4nyMiwmOWbwTqrTlRi4SuGvc=;
 b=dazp9tAzI/MY0HI2UfxA9Gc3gtpoLaq0UG59TQXTKpo6n1N1nk4h4bpRyqbh7ZTDWE
 TjZfFKb1d3SAzT8eH5k4XD2j/zaarNWyQwH3U7K0br/kPGhQM3ulqwaehVSGvBrZ1A6p
 5dDRPdmQS98+IJs3GiCBd9hQLjk1VkQrU2m82x+B6v0byEsb5yEKcrS/f70k4w2Izx+w
 HIujFCihDFB4JYbvJhiRqgrvng3SCXYNDU89WwgTOmRzJmLdKSnJc2zKd1PfICtm/Q+t
 Xz9z2aKmt05cdqA2IxvAC77WRl/SVPoNWvhYT91kokD8nIHL7BhKjqu7NLAA6bZW8de1
 /OUg==
X-Gm-Message-State: AOJu0YxPmWVWfHcuqeCdLUqrTnH/wLS4oJN5GobUGZmeB2FRCZT0Q7s9
 URmDnr8junW2npEUw8zPFzbsf+WZir37G/iuelrGtLE5wQ0VssjV/eD3qgSHpGRMMzem4yBnCCW
 KL80C
X-Gm-Gg: ASbGnctrGsxjS7r+XmS4gGB7jK7jc2ldARgVxBcSB+2HKk4gtj1xpDoGDCXoXgV2328
 K754x0mO77Ey9wv/HbC83fwhH4S5D4TGeCVBVniPIbaVaCfSkRgCLrgHQOdEwknhNUDGnx7MxAu
 lYfANaXUrkM+zocgVXUsMpg7JCgG5aMz3IITyDLhizkVZ/SlyqAwhWkyZYajPrfPCukzwbhR7eg
 oB+9gM/MxEdyb2DjsbypU9IZ+FCkvPzocbPIHKxi27EkpHCiTGXMVoZBvQZOfIM/nc3Ulj3cfzY
 rhIOqZFll0R8NsdnN0wQu2eHx6mys1HTvTU0Xkc3kKstshHowQW4LP+xAkq5czNe0qmzdKXIF2w
 NUrSN9GKn3THrQQI728gUQxo=
X-Google-Smtp-Source: AGHT+IGHlkdqVMEqAIKeldCHa2Kq/MFKFr8NWyHOBn0lEg3T+T6GGKDeeRweC+Q1MMjej2/clJ1oNA==
X-Received: by 2002:a05:600c:c4a6:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-45632a45295mr159952855e9.4.1753086582012; 
 Mon, 21 Jul 2025 01:29:42 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b754d0fsm94181625e9.30.2025.07.21.01.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 01:29:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 13B765F80D;
 Mon, 21 Jul 2025 09:29:40 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <huth@tuxfamily.org>
Cc: buildroot@buildroot.org,  Cyril Bur <cyrilbur@gmail.com>
In-Reply-To: <20250720191413.47715a92@tpx1> (Thomas Huth's message of "Sun, 20
 Jul 2025 19:14:13 +0200")
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-4-alex.bennee@linaro.org>
 <20250712083447.109f690b@tpx1> <8734ax24lx.fsf@draig.linaro.org>
 <20250720191413.47715a92@tpx1>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Mon, 21 Jul 2025 09:29:39 +0100
Message-ID: <87freqvte4.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753086582; x=1753691382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWcHRLuo+jsf3lMAmKI4nyMiwmOWbwTqrTlRi4SuGvc=;
 b=bNrdFhTarfH2sMDrKeHVLhFdSr51bijmhsk4zCZIR5+gVyl8AC9EWpQrIzE9iGyd42
 nZyjsOcf6bbqAAH4GuS8PmFEMjsNlhTNiqcgI6Ill55+PM05V5MQKb/fyUllvjGIcIuq
 qkz89r0HfbYiZ6mOx5/SO7qNplUbd2aRTnH2MGplyHF7KQp28lSneH3/pu4AYYrYDhKj
 yCMEzeD4Sns8nnDtJyyooQtO9EpHuwJt4apRyyb9ds0zMkB0jk97k7l3+867csRGtmVQ
 nIS3doprTQSJbchmlhxFTKrSXiCKFwTOgk84jxNp79nRT3HRv6Nc4qAVyFIHZlr+gdVn
 jicw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bNrdFhTa
Subject: Re: [Buildroot] [RFC PATCH v2 3/7] package/kvm-unit-tests: update
 dependencies
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

VGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4gd3JpdGVzOgoKPiBBbSBUdWUsIDE1IEp1
bCAyMDI1IDEwOjE5OjM4ICswMTAwCj4gc2NocmllYiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+Ogo+Cj4+IFRob21hcyBIdXRoIDxodXRoQHR1eGZhbWlseS5vcmc+IHdyaXRl
czoKPj4gCj4+ID4gQW0gRnJpLCAxMSBKdWwgMjAyNSAxNzo0NDowMSArMDEwMAo+PiA+IHNjaHJp
ZWIgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPj4gPiAgCj4+ID4+IFRv
IHJ1biB0aGUgdGVzdHMgd2UgbmVlZCBhIHN5c3RlbSBRRU1VLCB0aW1lb3V0LCBnZXRjb25mIGFu
ZCBubWFwLW5jYXQKPj4gPj4gc28gdXBkYXRlIHRoZSBzZWxlY3QvZGVwZW5kcyBmb3IgdGhlbS4g
QXMgd2UgbmVlZCBhdCBsZWFzdCBHQ0MgOCB3ZQo+PiA+PiBjYW4gZHJvcCB0aGUgc3BlY2lmaWMg
cmVxdWlyZW1lbnQgZm9yIG9sZCB4ODYtNjQgdGVzdHMuCj4+ID4+IAo+PiA+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+ID4+IAo+PiA+PiAt
LS0KPj4gPj4gdjIKPj4gPj4gICAtIHJlbW92ZSBvbGQgZ2NjIG5vdGVzIGFzIHdlIG5lZWQgYXQg
bGVhc3QgOCBhbnl3YXkKPj4gPj4gICAtIHNlbGVjdCBRRU1VIGFuZCBvdGhlciBydW50aW1lIGRl
cHMKPj4gPj4gICAtIG1lbnRpb24gdGhlIHJ1bnRpbWUgZGVwcwo+PiA+PiAgIC0gYWRkIHN1cHBv
cnQgZm9yIGdldGNvbmYgZnJvbSBleHRlcm5hbCB0b29sY2hhaW4KPj4gPj4gICAtIHVwZGF0ZSBj
b21tZW50IGZhbGxiYWNrCj4+ID4+IC0tLQo+PiA+PiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9D
b25maWcuaW4gfCAyNCArKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+PiA+PiAKPj4gPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIGIvcGFja2FnZS9rdm0tdW5p
dC10ZXN0cy9Db25maWcuaW4KPj4gPj4gaW5kZXggODdiMDc1YzRiOS4uNzc1YjI1MGQ1ZiAxMDA2
NDQKPj4gPj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gPj4gKysr
IGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gPj4gQEAgLTE0LDEyICsxNCwx
OSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQVJDSF9TVVBQT1JUUwo+PiA+
PiAgCj4+ID4+ICBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKPj4gPj4gIAlib29s
ICJrdm0tdW5pdC10ZXN0cyIKPj4gPj4gLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9VTklU
X1RFU1RTX0FSQ0hfU1VQUE9SVFMKPj4gPj4gLQkjIG9uIGkzODYgYW5kIHg4Ni02NCwgX19idWls
dGluX3JlYWNoYWJsZSBpcyB1c2VkLCBzbyB3ZSBuZWVkCj4+ID4+IC0JIyBnY2MgNC41IGF0IGxl
YXN0LiBvbiBpMzg2LCB3ZSB1c2UgdGhlIHRhcmdldCBnY2MsIHdoaWxlIG9uCj4+ID4+IC0JIyB4
ODYtNjQgd2UgdXNlIHRoZSBob3N0IGdjYyAoc2VlIC5tayBmaWxlIGZvciBkZXRhaWxzKQo+PiA+
PiAtCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF81IHx8ICFCUjJfaTM4
Ngo+PiA+PiAgCWRlcGVuZHMgb24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgIUJSMl94ODZf
NjQKPj4gPj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQ
UE9SVFMKPj4gPj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzggIyBx
ZW11Cj4+ID4+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFS
R0VUCj4+ID4+ICsJZGVwZW5kcyBvbiAoQlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgXAo+PiA+
PiArCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPj4gPj4gKwkJICAgIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKSAjIHJ1bnRpbWUgZ2V0Y29uZgo+PiA+
PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4+ID4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1FF
TVVfU1lTVEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0ggIAo+PiA+Cj4+ID4gQUZB
SUsga3ZtLXVuaXQtdGVzdHMgY2FuIGJlIHVzZWQgd2l0aCBrdm10b29sIGluc3RlYWQgb2YgUUVN
VSwgdG9vIC4uLiBzbwo+PiA+IGhhcmQtY29kaW5nIFFFTVUgaGlnaCBtaWdodCBub3QgYmUgdGhl
IGJlc3Qgc29sdXRpb24gZm9yIHRoZSB1c2VyPyAgCj4+IAo+PiBUaGUgY3VycmVudCBidWlsZCBk
b2Vzbid0IHN1cHBvcnQga3ZtdG9vbCBidXQgbWF5YmUgc29tZXRoaW5nIGxpa2UgdGhpcwo+PiBh
cyBhIGZvbGxvdy1vbiBwYXRjaDoKPj4gCj4+IC0tODwtLS0tLS0tLS0tLS0tLS1jdXQgaGVyZS0t
LS0tLS0tLS0tLS0tLXN0YXJ0LS0tLS0tLS0tLS0tLT44LS0tCj4+IG1vZGlmaWVkICAgcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPj4gQEAgLTIxLDggKzIxLDggQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4+ICAJZGVwZW5kcyBvbiAoQlIyX1BBQ0tBR0VfR0xJ
QkNfVVRJTFMgfHwgXAo+PiAgCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPj4g
IAkJICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfTElCQ19VVElMU19DT1BZKSAjIHJ1bnRpbWUg
Z2V0Y29uZgo+PiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4+IC0Jc2VsZWN0IEJSMl9QQUNL
QUdFX1FFTVVfU1lTVEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPj4gKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfUUVNVSBpZiAhQlIyX1BBQ0tBR0VfS1ZNVE9PTAo+PiArCXNlbGVjdCBC
UjJfUEFDS0FHRV9RRU1VX1NZU1RFTSBpZiAhQlIyX1BBQ0tBR0VfS1ZNVE9PTCAjIHJ1bnRpbWUg
Zm9yIHFlbXUtc3lzdGVtLSRBUkNICj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVVVElMUyAj
IHJ1bnRpbWUgZm9yIHRpbWVvdXQKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1bnRp
bWUKPj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUAo+PiBtb2RpZmllZCAgIHBhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPj4gQEAgLTM2LDYgKzM2LDEzIEBAIEtWTV9V
TklUX1RFU1RTX0NPTkZfT1BUUyA9XAo+PiAgCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BV
KSIgXAo+PiAgCS0tZW5kaWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCj4+ICAKPj4gKyMg
VGhlIGRlZmF1bHQgcnVubmVyIGlzIFFFTVUgYnV0IGt2bXRvb2wgY2FuIGJlIHVzZWQKPj4gK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0pLHkpCj4+ICtLVk1fVU5JVF9URVNUU19DT05G
X09QVFMgKz0gLS10YXJnZXQ9cWVtdQo+PiArZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0tWTVRP
T0wpLHkpCj4+ICtLVk1fVU5JVF9URVNUU19DT05GX09QVFMgKz0gLS10YXJnZXQ9a3ZtdG9vbAo+
PiArZW5kaWYKPj4gKwo+PiAgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpFXzRLKSx5KQo+PiAg
S1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTRrCj4+ICBlbHNlIGlmZXEg
KCQoQlIyX0FSTTY0X1BBR0VfU0laRV8xNkspLHkpCj4+IC0tODwtLS0tLS0tLS0tLS0tLS1jdXQg
aGVyZS0tLS0tLS0tLS0tLS0tLWVuZC0tLS0tLS0tLS0tLS0tLT44LS0tCj4+IAo+PiBXaGF0IGRv
IHlvdSB0aGluaz8KPgo+IExvb2tzIGdvb2QhIC4uLiB0aG91Z2gga3ZtdG9vbCBjYW4gb25seSBi
ZSB1c2VkIGZvciBhYXJjaDY0L2FybSBvciByaXNjdgo+IGFzIGZhciBhcyBJIGtub3cuIE5vdCBz
dXJlIHdoZXRoZXIgdGhhdCBhZGRpdGlvbmFsIGRlcGVuZGVuY3kgc2hvdWxkIGJlCj4gcmVmbGVj
dGVkIGhlcmUsIHRvbywgdGhvdWdoLgoKSSB0aGluayBJIG5lZWQgdG8gcmVmbGVjdCB0aGlzIGlu
IENvbmZpZy5pbiBpbnN0ZWFkIGFzIEkgZG9uJ3QgdGhpbmsKQlIyX1BBQ0tBR0VfUUVNVV9TWVNU
RU0vQlIyX1BBQ0tBR0VfS1ZNVE9PTCBpcyBhdmFpbGFibGUgdG8gdGhlCktWTV9VTklUX1RFU1RT
IG1ha2VmaWxlLgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBM
aW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
