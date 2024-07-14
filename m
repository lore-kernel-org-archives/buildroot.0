Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6FEC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C990605D2;
	Sun, 14 Jul 2024 15:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMdO4DAhqv2M; Sun, 14 Jul 2024 15:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE7A60616
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE7A60616;
	Sun, 14 Jul 2024 15:40:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37A7E1BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3025E405C9
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5aPOgWeCyh3 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92C7F405C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92C7F405C8
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92C7F405C8
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:40:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso4541973e87.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 08:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720971638; x=1721576438;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LWbpXY33ib/qs0g8QEEjZj0VlbrNetLcSjZGKWZf6w8=;
 b=rQhNda7VLE0qF/t6KZlFB9YalJ7VMFZeBxl2IeK46JS8366nw4cY/rvop+itUE5Nq/
 qCaNyA4pNLxeTRcfjAuna+OzVW7kvRFkOuWgRQe3ocSapWSSnjI9g6HNkaPa2yxYxYpT
 1ckcUont2qTU5uGmE9BrjTdi+FuUl9r2J4mgwmCu3dlelmHW7gsYgUd/VGSDcKW6dBwG
 urcefkIPT/vvlpupRe+pyixoFn85YznBxvtEKnkA0MdWDcvw4qltg1fjrfp6fEzup+xM
 Q8v16e/1nB6VdmwHp7XD7Uo9mewSmQHkD7iu9N+oyh8cOgq661f+iSW2EysFqmBRrRgR
 L1fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwVNEHlV0zwLB1+eF0ACnq52HWOFoEJyG5mwFY7j1WY8X8uWQNDjjnWaB/qgFfbdd4hH9+eJ3z9vqx7q+LaEcTL1/2bkOq4w==
X-Gm-Message-State: AOJu0YxRT4/nmLPp7w+OKffPWlNcEa23e81MXknRyYF5s8CMwp31Zh74
 bk5OBh8OfVYWJkx/P1SOPsUHvvmhO18CwSEIWTgLu0A/2b4LZtZ+MSESUMAuGyiPTULP2uWcjf5
 Fz3k=
X-Google-Smtp-Source: AGHT+IF9blmNV9Fo6iaIiE57q8+rori2u82YE1xq6ZlVMaGiRmlZzADOawdaur3eLqiStsRhBMbk9g==
X-Received: by 2002:a05:6512:3985:b0:52c:cc46:d59 with SMTP id
 2adb3069b0e04-52eb9999d90mr12929891e87.18.1720971637759; 
 Sun, 14 Jul 2024 08:40:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e8e2ecsm55679165e9.21.2024.07.14.08.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jul 2024 08:40:37 -0700 (PDT)
Message-ID: <f03e25fc-2cba-4a25-8f8d-0230ff85b8b8@mind.be>
Date: Sun, 14 Jul 2024 17:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
References: <20221127202319.11124-1-wdouglass@carnegierobotics.com>
 <20230118122840.19885-1-wdouglass@carnegierobotics.com>
Content-Language: en-GB
In-Reply-To: <20230118122840.19885-1-wdouglass@carnegierobotics.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720971638; x=1721576438; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LWbpXY33ib/qs0g8QEEjZj0VlbrNetLcSjZGKWZf6w8=;
 b=HG51PKAm7m3X0j5YDgAros5vKXQh1UsabQHyRch1LcUyzhwqFonnkh+tV8IwHbTl4p
 0+ctP+A29Z1M4Ck4Rge8DGBI9sTCTj/2u+vMFnR7XYHz/5WcM8UxyuhZEmcdddMne9zl
 PE7RNHIjgJQ07bEWlsRoFgqU11sIJYe/8F+z6eQHwPBrF9Qu2ALKc6m6uz/W6vyThPh6
 pCfCr5IMQVTpfUY6sQPS6bsnregwZOjIWj/6zGOa6YV4ZQupAgmDDbTksfPCxlcG9KkM
 Sdw1aDBJ5gnrt2xFPhdth05TyHpqZdf8vjG49OtX4VitKrPacnwFgowFx2uc/fLVc9AQ
 rzng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HG51PKAm
Subject: Re: [Buildroot] [PATCH] package/libchicken: the chicken scheme
 programming environment
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wMS8yMDIzIDEzOjI4LCBXb29kcm93IERvdWdsYXNzIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gVGhpcyBwYWNrYWdlIGluY2x1ZGVzIHRoZSBydW50aW1lIGxpYnJhcnkgYW5kIGludGVy
cHJldGVyLiBJbiB0aGUKPiBmdXR1cmUgSSBwbGFuIG9uIHBhY2thZ2luZyBhIGNyb3NzLWNvbXBp
bGVyIGZvciB0aGUgaG9zdCBhcyB3ZWxsCj4gCj4gU2lnbmVkLW9mZi1ieTogV29vZHJvdyBEb3Vn
bGFzcyA8d2RvdWdsYXNzQGNhcm5lZ2llcm9ib3RpY3MuY29tPgoKICBBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLCB3aXRoIHF1aXRlIGEgZmV3IGNoYW5nZXM6CiAgICAgIC0gUmVuYW1lIHRvICJj
aGlja2VuIiBpbnN0ZWFkIG9mICJsaWJjaGlja2VuIi4KICAgICAgLSBGaXggYWxwaGFiZXRpY2Fs
IG9yZGVyaW5nIGluIHBhY2thZ2UvQ29uZmlnLmluLgogICAgICAtIEZpeCBjaGVjay1wYWNrYWdl
IHdhcm5pbmdzLgogICAgICAtIERyb3AgQlIyX0NISUNLRU5fSU5TVEFMTF9JTlRFUlBSRVRFUiwg
YWx3YXlzIGluc3RhbGwgZXZlcnl0aGluZyB0bwogICAgICAgIHRhcmdldC4KICAgICAgLSBTZXQg
QVJDSD11bnVzZWQgb3RoZXJ3aXNlIGF1dG9kaXNjb3ZlcnkgaXMgdHJpZ2dlcmVkLgogICAgICAt
IERyb3AgJy1mZWF0dXJlJyBhcmd1bWVudCwgaXQgaXMgb25seSB1c2VkIGZvciBleHRlcm5hbCBj
b2RlIGFuZCB3ZQogICAgICAgIGNhbid0IGtub3cgd2hhdCBraW5kIG9mICJmZWF0dXJlIiB2YWx1
ZXMgdGhhdCB0aGF0IGNvZGUgZXhwZWN0cy4KICAgICAgLSBNYWtlIHN0YWdpbmcgYW5kIHRhcmdl
dCBpbnN0YWxsIGlkZW50aWNhbC4KICAgICAgLSBfTUFLRV9BUkdVTUVOVFMgLT4gX01BS0VfT1BU
Uy4KICAgICAgLSBNb3ZlIERFU1RESVIgdG8gaW5zdGFsbCBjb21tYW5kcyBvbmx5LgogICAgICAt
IFVzZSBNQUtFMSBvbmx5IHdoZW4gaW5zdGFsbGluZyBhbmQgZG9uJ3QgYWRkIHZhcmlhYmxlIGZv
ciBpdC4KICAgICAgLSBBZGQgaGFzaCBmaWxlLgoKCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0t
Cj4gICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrCj4gICBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvbGliY2hpY2tlbi9D
b25maWcuaW4gICAgIHwgMTIgKysrKysrCj4gICBwYWNrYWdlL2xpYmNoaWNrZW4vbGliY2hpY2tl
bi5tayB8IDcxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICA0IGZpbGVzIGNo
YW5nZWQsIDg3IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xp
YmNoaWNrZW4vQ29uZmlnLmluCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJjaGlj
a2VuL2xpYmNoaWNrZW4ubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKPiBpbmRleCBlOGUwZGZmY2QzLi42NGQyMWNlMmM1IDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BF
UlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTMwMTUsNiArMzAxNSw5IEBAIEY6CXBhY2thZ2Uv
cHl0aG9uLXB5dXNiLwo+ICAgTjoJV29qY2llY2ggTml6acWEc2tpIDxuaXppYWtAc3BveC5vcmc+
Cj4gICBGOglwYWNrYWdlL2Z3dXAvCj4gICAKPiArTjoJV29vZHJvdyBEb3VnbGFzcyA8d2RvdWds
YXNzQGNhcm5lZ2llcm9ib3RpY3MuY29tPgo+ICtGOglwYWNrYWdlL2xpYmNoaWNrZW4KPiArCj4g
ICBOOglYdWFuaGFvIFNoaSA8WDE1MDAwMTc3QGdtYWlsLmNvbT4KPiAgIEY6CWJvb3QvdGktazMt
cjUtbG9hZGVyLwo+ICAgCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2Fn
ZS9Db25maWcuaW4KPiBpbmRleCA5OTVkYWUyYzU3Li5jNjA1YWJiNmJlIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtNjQxLDYg
KzY0MSw3IEBAIG1lbnUgIkludGVycHJldGVyIGxhbmd1YWdlcyBhbmQgc2NyaXB0aW5nIgo+ICAg
CXNvdXJjZSAicGFja2FnZS80dGgvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9lbnNj
cmlwdC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2VybGFuZy9Db25maWcuaW4iCj4g
Kwlzb3VyY2UgInBhY2thZ2UvbGliY2hpY2tlbi9Db25maWcuaW4iCj4gICBpZiBCUjJfUEFDS0FH
RV9FUkxBTkcKPiAgIG1lbnUgIkVybGFuZyBsaWJyYXJpZXMvbW9kdWxlcyIKPiAgIAlzb3VyY2Ug
InBhY2thZ2UvZXJsYW5nLWJhc2U2NHVybC9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGliY2hpY2tlbi9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmNoaWNrZW4vQ29uZmlnLmluCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xNzMyMTVjYmVmCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGliY2hpY2tlbi9Db25maWcuaW4KPiBAQCAtMCww
ICsxLDEyIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJDSElDS0VOCj4gKwlib29sICJjaGlj
a2VuLXNjaGVtZS1ydW50aW1lIgo+ICsJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICsJaGVscAo+
ICsJICBsaWJjaGlja2VuIGlzIHRoZSBydW50aW1lIGxpYnJhcnkgZm9yIGNoaWNrZW4KPiArCSAg
c2NoZW1lLiBodHRwczovL2NhbGwtY2Mub3JnCj4gKwo+ICtjb25maWcgQlIyX0xJQkNISUNLRU5f
SU5TVEFMTF9JTlRFUlBSRVRFUgo+ICsgICAgICAgYm9vbCAiY2hpY2tlbi1zY2hlbWUtaW50ZXJw
cmV0ZXIiCj4gKyAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkNISUNLRU4KPiArICAg
ICAgIGhlbHAKPiArICAgICAgICAgY3NpIGlzIGFuIGludGVycHJldGVyIGZvciB0aGUgQ2hpY2tl
biBTY2hlbWUgZGlhbGVjdAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNoaWNrZW4vbGliY2hp
Y2tlbi5tayBiL3BhY2thZ2UvbGliY2hpY2tlbi9saWJjaGlja2VuLm1rCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hNDAyNzA2YzczCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2UvbGliY2hpY2tlbi9saWJjaGlja2VuLm1rCj4gQEAgLTAsMCArMSw3MSBA
QAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbGliY2hpY2tlbgo+ICsjCj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtMSUJDSElDS0VOX1ZFUlNJT04gPSA1LjMu
MAo+ICtMSUJDSElDS0VOX1NJVEUgPSBodHRwczovL2NvZGUuY2FsbC1jYy5vcmcvcmVsZWFzZXMv
JChMSUJDSElDS0VOX1ZFUlNJT04pCj4gK0xJQkNISUNLRU5fU09VUkNFID0gY2hpY2tlbi0kKExJ
QkNISUNLRU5fVkVSU0lPTikudGFyLmd6Cj4gK0xJQkNISUNLRU5fTElDRU5TRSA9IEJTRAo+ICtM
SUJDSElDS0VOX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gK0xJQkNISUNLRU5fSU5TVEFMTF9T
VEFHSU5HID0gWUVTCj4gK0xJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVQgPSBZRVMKPiArCj4gK0xJ
QkNISUNLRU5fTUFLRV9BUkdVTUVOVFM9QVJDSD0gXAo+ICsJUFJFRklYPS91c3IgXAo+ICsJUExB
VEZPUk09bGludXggXAo+ICsJQ19DT01QSUxFUj0ke1RBUkdFVF9DQ30gXAo+ICsJQ1hYX0NPTVBJ
TEVSPSR7VEFSR0VUX0NYWH0gXAo+ICsJTElCUkFSSUFOPSR7VEFSR0VUX0FSfSBcCj4gKwlERVNU
RElSPSQoU1RBR0lOR19ESVIpCj4gKwo+ICsjIE1BS0UxIGlzIHVzZWQgaGVyZSBiZWNhdXNlIHRo
ZSBpbnN0YWxsIHN0ZXAgd2lsbCBmYWlsIHdpdGhvdXQgaXQuIFBlcmhhcHMgdGhpcydsbCBiZSBm
aXhlZCB1cHN0cmVhbSBzb21lZGF5Li4uCj4gK0xJQkNISUNLRU5fTUFLRSA9ICQoTUFLRTEpCj4g
Kwo+ICtpZm5lcSAoJChCUjJfQVJDSCkseDg2KQo+ICsJTElCQ0hJQ0tFTl9NQUtFX0FSR1VNRU5U
UyArPSBUQVJHRVRfRkVBVFVSRVM9Ii1uby1mZWF0dXJlIHg4NiAtZmVhdHVyZSAke0JSMl9BUkNI
fSIKPiArZW5kaWYKPiArCj4gK2lmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICsJTElCQ0hJ
Q0tFTl9NQUtFX0FSR1VNRU5UUyArPSBTVEFUSUNCVUlMRD0xCj4gK2VuZGlmCj4gKwo+ICsKPiAr
ZGVmaW5lIExJQkNISUNLRU5fQlVJTERfQ01EUwo+ICsJJChUQVJHRVRfTUFLRV9FTlYpICQoTElC
Q0hJQ0tFTl9NQUtFKSAtQyAkKEBEKSAke0xJQkNISUNLRU5fTUFLRV9BUkdVTUVOVFN9IGFsbAo+
ICtlbmRlZgo+ICsKPiArZGVmaW5lIExJQkNISUNLRU5fSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAr
CSQoVEFSR0VUX01BS0VfRU5WKSAkKExJQkNISUNLRU5fTUFLRSkgLUMgJChARCkgJHtMSUJDSElD
S0VOX01BS0VfQVJHVU1FTlRTfSBpbnN0YWxsCj4gK2VuZGVmCj4gKwo+ICtkZWZpbmUgTElCQ0hJ
Q0tFTl9JTlNUQUxMX1RBUkdFVF9MSUJTX0NNRFMKPiArCSQoSU5TVEFMTCkgLUQgLW0gMDc1NSAk
KEBEKS9saWJjaGlja2VuLnNvLjExICQoVEFSR0VUX0RJUikvdXNyL2xpYgo+ICsJbG4gLXNyVCAk
KFRBUkdFVF9ESVIpL3Vzci9saWIvbGliY2hpY2tlbi5zby4xMSAkKFRBUkdFVF9ESVIpL3Vzci9s
aWIvbGliY2hpY2tlbi5zbwo+ICtlbmRlZgo+ICsKPiArZGVmaW5lIExJQkNISUNLRU5fSU5TVEFM
TF9UQVJHRVRfSU5URVJQUkVURVJfQ01EUwo+ICsJJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoQEQp
L2NzaSAkKFRBUkdFVF9ESVIpL3Vzci9iaW4KPiArZW5kZWYKPiArCj4gK2lmZXEgKCQoQlIyX0xJ
QkNISUNLRU5fSU5TVEFMTF9JTlRFUlBSRVRFUikseSkKPiAraWZuZXEgKCQoQlIyX1NUQVRJQ19M
SUJTKSx5KQo+ICtkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdFVF9DTURTCj4gKwkkKExJ
QkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfTElCU19DTURTKQo+ICsJJChMSUJDSElDS0VOX0lOU1RB
TExfVEFSR0VUX0lOVEVSUFJFVEVSX0NNRFMpCj4gK2VuZGVmCj4gK2Vsc2UKPiArZGVmaW5lIExJ
QkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICsJJChMSUJDSElDS0VOX0lOU1RBTExfVEFS
R0VUX0lOVEVSUFJFVEVSX0NNRFMpCj4gK2VuZGVmCj4gK2VuZGlmCj4gK2Vsc2UKPiAraWZuZXEg
KCQoQlIyX1NUQVRJQ19MSUJTKSx5KQo+ICtkZWZpbmUgTElCQ0hJQ0tFTl9JTlNUQUxMX1RBUkdF
VF9DTURTCj4gKwkkKExJQkNISUNLRU5fSU5TVEFMTF9UQVJHRVRfTElCU19DTURTKQo+ICtlbmRl
Zgo+ICtlbmRpZgo+ICtlbmRpZgo+ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
