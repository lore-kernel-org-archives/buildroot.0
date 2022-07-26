Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9C1C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D0060E44;
	Tue, 26 Jul 2022 16:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D0060E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13wQzH5u4SNE; Tue, 26 Jul 2022 16:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF79960AEA;
	Tue, 26 Jul 2022 16:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF79960AEA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E02001BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA5B48474F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA5B48474F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-ESQhUy-PJN for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:44:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B28484742
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B28484742
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:44:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q18so10536027wrx.8
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 09:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QUjaQoO8LdTjGHL7TkYTXrEmXtv64oGJ0ZPNVtiD+Xs=;
 b=6hLIqTGStotN4qQSM3c9HgsfBgIJD7fanrCFf98P3AJphnQnEWcHYLSSOY8EZsC0/a
 aRNnyxTZVrQ7vbAmT5SJa1Mhend2jR2hCApFg/qlvoLVpsBUHIAS7hm2cZQgrrv1l86N
 ZYrJSNZrIek/xnjq020HZcLviGpLQNZZiHCOj2A9nKmAPcDdcxJqfFpqjwz0VqScdpcE
 orHAENXMcOYvcpw7jZI1kOkd1Rc+aZWldtVXmrAcKOHgHAkPOcJyMBbBtAjYCFCiWyIr
 AvB7BMM+Zpoy7zBDhi4Ll4dRDYSzg8BfTsv/OmAOcYwN7h2zlXWkz0KleilAyukwxV6I
 DUkA==
X-Gm-Message-State: AJIora9ldkYrFI6vJWKel2sZxdaol/50zJLeJhTfJl+OLCiSJwioDYNV
 i2XVNn+h+hHxehqsKqSUL6dwxA==
X-Google-Smtp-Source: AGRyM1v00fnc8LmxTGoI5mIn6pMrwJyuAAeNTvqR1low/OH/T3mmA8yESL9IxKX0oQ7HGLyDfFgZQQ==
X-Received: by 2002:a05:6000:70d:b0:21e:6113:d6d1 with SMTP id
 bs13-20020a056000070d00b0021e6113d6d1mr10970760wrb.709.1658853849414; 
 Tue, 26 Jul 2022 09:44:09 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b003a342933727sm17090412wmq.3.2022.07.26.09.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 09:44:09 -0700 (PDT)
Message-ID: <df5bb3d2-2822-4cd2-ff97-478ac5284279@smile.fr>
Date: Tue, 26 Jul 2022 18:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220726140245.692606-1-romain.naour@smile.fr>
 <20220726143612.GK3168@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220726143612.GK3168@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QUjaQoO8LdTjGHL7TkYTXrEmXtv64oGJ0ZPNVtiD+Xs=;
 b=0v6GP07C25l4Zvjty6YjmUskg3DAyCz5x8k+ChNYtG3X13wzYdQTEeeeZRtuteFbll
 rQVoSJVQEl7R5EtCad0Gml/XxkzCYpSu2ie16dWGCi3f55bDEgshIAFVsVlPBZGszwia
 F4GWCLRLoDWtfhjjCVqSUBgpJMRV45gPpUtc6EMpaVoYdZY0jBhX78KstFWWv5BU/k6R
 Bx8NHVKTOXjcO6CzsmRjXwvRNXpFC1I2Ut326Mwo6tsd+oZE46DeLUpeqO2/zddCp7kv
 xwTSPb59OqbmCcUcriLKxWtft0TlvxzfCx2oOY9XvPDo3bhpfDQdkahad0EoYEUDCJbG
 60/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0v6GP07C
Subject: Re: [Buildroot] [PATCHv2] package/rustc: needs C++ compiler with
 musl based toolchain
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

SGVsbG8gWWFubiwKCkxlIDI2LzA3LzIwMjIgw6AgMTY6MzYsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDIyLTA3LTI2IDE2OjAyICswMjAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBXaGlsZSBidWlsZGluZyBob3N0LXJ1c3Qgd2l0aCBh
IG11c2wgYmFzZWQgdG9vbGNoYWluIHdpdGhvdXQgQysrIGNvbXBpbGVyLAo+PiB0aGUgYnVpbGQg
ZmFpbCBzaW5jZSBsaWJ1bndpbmQgYnVuZGxlZCBpbiBydXN0IHNvdXJjZXMgbmVlZHMgYSBDKysg
Y29tcGlsZXIuCj4+Cj4+IGNhcmdvOndhcm5pbmc9aTY4Ni1idWlsZHJvb3QtbGludXgtbXVzbC1n
Y2MuYnJfcmVhbDogZXJyb3I6IFsuLi5dL2hvc3QtcnVzdC0xLjYyLjAvc3JjL2xsdm0tcHJvamVj
dC9saWJ1bndpbmQvc3JjL1Vud2luZC1FSEFCSS5jcHA6IEMrKyBjb21waWxlciBub3QgaW5zdGFs
bGVkIG9uIHRoaXMgc3lzdGVtCj4+Cj4+IE5vdGU6IHRoZSBpc3N1ZXMgY2FuJ3QgYmUgcmVwcm9k
dWNlZCB3aXRoIGEgZ2xpYmMgYmFzZWQgdG9vbGNoYWluCj4+IHdpdGhvdXQgQysrIHByb2JhbHkg
ZHVlIHRvIGV4dHJhIHN0ZXBzIHJlcXVpcmVkIHRvIHN1cHBvcnQgbXVzbCBsaWJjLgo+Pgo+PiBX
ZSBjb3VsZCBhZGQgdGhlIEMrKyBkZXBlbmRlbmN5IGRpcmVjbHR5IHRvIGhvc3QtcnVzdGMgYnV0
IGl0IHdvdWxkCj4+IHJlcXVpcmVzIGFkZGluZyB0aGUgQysrIHJldmVyc2UgZGVwZW5kZW5jaWVz
IHRvIGFsbCBydXN0IHBhY2thZ2VzLgo+Pgo+PiBJbnN0cmVhZCwgd2UgYWRkIHRoZSBDKysgZGVw
ZW5kZW5jeSB0byBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4+
IG9ubHkgd2hlbiBhIG11c2wgdG9vbGNoYWluIGlzIHVzZWQuIFNvIHdlIGNhbiBzdGlsbCBpbnN0
YWxsIGEgcHJlYnVpbHQKPj4gcnVzdCBjb21waWxlciBidXQgd2l0aG91dCB0aGUgcnVzdCBzdGFu
ZGFyZCBsaWJyYXJ5IChydXN0LXN0ZCkuCj4+Cj4+IFVzdWFsbHkgd2Ugc2hvdWxkIG5vdCBhZGQg
dG9vbGNoYWluIGRlcGVuZGVuY2llcyBpbiBhIF9BUkNIX1NVUFBPUlRTIG9wdGlvbiBidXQKPj4g
QlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfVElFUi4uLiBvcHRpb25zIGNvbnRhaW5zIGFs
cmVhZHkgc29tZQo+PiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgb3IgQlIyX1RPT0xDSEFJTl9V
U0VTX01VU0wuCj4+Cj4+IEZpeGVzOgo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
cmVzdWx0cy82MzYvNjM2ZmIzOWM4ZjFiOGMwNWU0Y2E0NTFhYzUwNmNkNjNjNzE2NmQ4Mgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4g
LS0tCj4+IHYyOiBtb3ZlIHRoZSBDKysgZGVwZW5kZW5jeSB0byBCUjJfUEFDS0FHRV9IT1NUX1JV
U1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4+ICAgICBhZnRlciBKYW1lcydzIHJldmlldyBhbmQg
ZGlzY3Vzc2lvbiB3aXRoIFRob21hcyBhbmQgQXJub3V0Cj4+IC0tLQo+PiAgcGFja2FnZS9ydXN0
Yy9Db25maWcuaW4uaG9zdCB8IDEyICsrKysrKysrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cnVzdGMvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Cj4+IGlu
ZGV4IGZlYzg3MjZhZWUuLjMyZGVjYmE3YzEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcnVzdGMv
Q29uZmlnLmluLmhvc3QKPj4gKysrIGIvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9zdAo+PiBA
QCAtMTEwLDExICsxMTAsMTcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VU
X1RJRVIyX1BMQVRGT1JNUwo+PiAgCWRlZmF1bHQgeSBpZiBCUjJfc3BhcmM2NCAmJiBCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMKPj4gIAo+PiAgIyBBbGwgdGFyZ2V0IHJ1c3QgcGFja2FnZXMgc2hv
dWxkIGRlcGVuZCBvbiB0aGlzIG9wdGlvbgo+PiArIyBOb3RlOiBXaXRoIG11c2wgYmFzZWQgdG9v
bGNoYWluLCB3ZSBuZWVkIGEgQysrIGNvbXBpbGVyIG9uIHRoZSBob3N0IHRvCj4+ICsjIGJ1aWxk
IGhvc3QtcnVzdCBzb21lIHRhcmdldCBsaWJyYXJpZXMgKGxpYnVud2luZCkgZnJvbSBsbHZtIHNv
dXJjZSBjb2RlCj4+ICsjIGJ1bmRsZWQgaW4gcnVzdCBzb3VyY2VzLgo+PiAgY29uZmlnIEJSMl9Q
QUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPj4gIAlib29sCj4+IC0JZGVm
YXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIxX1BMQVRGT1JNUwo+
PiAtCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9USUVSMl9IT1NU
X1RPT0xTX1BMQVRGT1JNUwo+PiAtCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RD
X1RBUkdFVF9USUVSMl9QTEFURk9STVMKPj4gKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfSE9T
VF9SVVNUQ19UQVJHRVRfVElFUjFfUExBVEZPUk1TICYmIFwKPj4gKwkJKEJSMl9JTlNUQUxMX0xJ
QlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpCj4+ICsJZGVmYXVsdCB5IGlmIEJS
Ml9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIyX0hPU1RfVE9PTFNfUExBVEZPUk1TICYm
IFwKPj4gKwkJKEJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCAhQlIyX1RPT0xDSEFJTl9VU0VTX01V
U0wpCj4+ICsJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIy
X1BMQVRGT1JNUyAmJiBcCj4+ICsJCShCUjJfSU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09M
Q0hBSU5fVVNFU19NVVNMKQo+PiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19B
UkNIX1NVUFBPUlRTCj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBtdWNoIG5pY2VyIHRvIGFkZCBh
IGdsb2JhbCBkZXBlbmRlbmN5Ogo+IAo+ICAgICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNU
Q19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICAgICAgICAgYm9vbAo+ICAgICAgICAgZGVmYXVsdCB5
IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIxX1BMQVRGT1JNUwo+ICAgICAg
ICAgZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIyX0hPU1Rf
VE9PTFNfUExBVEZPUk1TCj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfSE9TVF9S
VVNUQ19UQVJHRVRfVElFUjJfUExBVEZPUk1TCj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0hPU1RfUlVTVENfQVJDSF9TVVBQT1JUUwo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfSU5T
VEFMTF9MSUJTVERDUFAgfHwgIUJSMl9UT09MQ0hBSU5fVVNFU19NVVNMCj4gCj4gQW5kIHRoYXQn
cyBhbGwuLi4KCk9rCgo+IAo+IEFsc28sIGFzIHJlcG9ydGVkIG9uIElSQywgcnVzdGMgZmFpbHMg
dG8gbGluayB3aXRoIG91ciBsaWJ6Ogo+IAo+ICAgICBlcnJvcjogbGlua2luZyB3aXRoIGBjY2Ag
ZmFpbGVkOiBleGl0IHN0YXR1czogMQo+ICAgICAgIHwKPiAgICAgICA9IG5vdGU6ICJjYyIgWy4u
Ll0KPiAgICAgICA9IG5vdGU6IC91c3IvYmluL2xkOiBjYW5ub3QgZmluZCAtbHoKPiAgICAgICAg
ICAgICAgIGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+ICAgICAg
IGVycm9yOiBjb3VsZCBub3QgY29tcGlsZSBgcnVzdGNfZHJpdmVyYCBkdWUgdG8gcHJldmlvdXMg
ZXJyb3IKPiAKPiBCdXQgZWFybGllciBkdWluZyB0aGUgYnVpbGQ6Cj4gCj4gICAgIC0tIEZvdW5k
IFpMSUI6IC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL2hvc3QvbGliL2xpYnou
c28gKGZvdW5kIHZlcnNpb24gIjEuMi4xMiIpCgpJIGNhbid0IHJlcHJvZHVjZSBsb2NhbGx5LCBi
dXQgaXQncyByZXByb2R1Y2VkIG9uIGF1dG9idWlsZGVyczoKCmh0dHA6Ly9hdXRvYnVpbGQuYnVp
bGRyb290Lm9yZy9yZXN1bHRzLzcyNC83MjQ4YzI2NGM5ZjRmY2JiOTVmMTExNzM2ZDIwZjhhZjMx
Njc4NTAyL2J1aWxkLWVuZC5sb2cKClNpbmNlIGhvc3QtemxpYiBpcyBhbHJlYWR5IGJ1aWxkLCBt
YXliZSBydXN0IHRyeSB0byBsaW5rIHdpdGggbGlieiBpbnN0YWxsZWQgb24KdGhlIGJ1aWxkIG1h
Y2hpbmU/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBJJ3ZlIHJ1biBvdXQgb2YgdGltZSB0
b2RheSB0byBsb29rIGludG8gdGhhdC4uLgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4K
PiAKPj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0gKPj4gLS0gCj4+IDIuMzQu
Mwo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
