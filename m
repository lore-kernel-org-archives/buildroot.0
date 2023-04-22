Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAD5C7618E
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 10:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE11741ED5;
	Sat, 22 Apr 2023 10:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE11741ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNUcp3lVR-ea; Sat, 22 Apr 2023 10:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B04941EEC;
	Sat, 22 Apr 2023 10:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B04941EEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51C601BF3A3
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 10:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36A4760C07
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 10:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A4760C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTVpMfIGQlpf for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 10:21:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3C2D60A74
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3C2D60A74
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 10:21:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so2526792f8f.1
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 03:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682158898; x=1684750898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6w1IDFsn5kPpgGhQfWWDM4cuYV2i/rNIjSbNDqFMwKk=;
 b=h3EUCS+JSddnpzU9grftmWMRG0zD6tNxx/EHfcf4azKSB0VBDcBJSTI9Go19Gh5Ssi
 HD8MBkgWsfCRfkdUHsWG6ij+htO8kBDKeGsjW6JG1x17lKZeP+NM1p57fHrm5uL0IODi
 4TO0BzNiID783TLY3CDo4Fb/lUxSI9FRlROmzs9/QCwmmKIFXXcFUBx98t58dRnpU2k8
 qt8LyEhj3rjmgIfDK7km58LTe51l4yj/lVEPvbTSY/Xwa3Ud1YG3tT5/WvjIUBmcjRy+
 2/VgiAMREnq5P6erH5nbvIJ1jmDUYuKG+EB0Mn4ME+lW7RWeKg574RNQjWEwQlvozq2h
 4ZrA==
X-Gm-Message-State: AAQBX9dccTWB+Y+HZ0hYHbXKIavPDClHdRbywUZw8xVBmq7p/dOZtdde
 tuy0e/PSrqrA1/InezU24GunavcdwDOsyMlER24=
X-Google-Smtp-Source: AKy350bTYiYApDsrXWz+EVvMVOPG2R7OYjIvyyDBtLFNjM1YXV3YSOmuA/X2gCjNmx+oFMM50Gp+Vg==
X-Received: by 2002:adf:f88a:0:b0:2f2:79ce:4836 with SMTP id
 u10-20020adff88a000000b002f279ce4836mr6250266wrp.60.1682158897781; 
 Sat, 22 Apr 2023 03:21:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003f1978bbcd6sm2712615wmo.3.2023.04.22.03.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 03:21:37 -0700 (PDT)
Message-ID: <b87b154d-65ad-0aa7-3442-d594dd6c3406@smile.fr>
Date: Sat, 22 Apr 2023 12:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20230422090625.25006-1-ps.report@gmx.net>
 <20230422090625.25006-2-ps.report@gmx.net>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230422090625.25006-2-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1682158898; x=1684750898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6w1IDFsn5kPpgGhQfWWDM4cuYV2i/rNIjSbNDqFMwKk=;
 b=XyizybS+f5E5U96pwK2NfUHN+U+KPe8EqIAvOMeRaEJCwAXTsfGcRKYtJiHggTomOB
 W9aOZ7maP87PWLfWfCBFb9ltgzv//mWpyHJdnR+seMOZ8TiI7Ko/vkwyulhVOr6Km0QS
 uU49NsPsaYbjuzoYqlBycCMe8qumkPMzFSDNlnXSE7XD8+qKCgZPZHW4FROAYaONviNc
 2tEehNejiNjWTVXFg0iLKLzw47Rl1pPuDg4avERXSQgIkV0/6QDLbrJsIzGrJwDJ+iN6
 IOGsqFsKYTCrU80ad3UMz04qMMf/ORqC1SIExAGdHKAU5LKU8IIKOABadEDHMvMQDx7c
 9ieA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=XyizybS+
Subject: Re: [Buildroot] [PATCH v1 2/3] package/qemu: bump version to 7.2.1
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyMi8wNC8yMDIzIMOgIDExOjA2LCBQZXRlciBTZWlkZXJlciBhIMOp
Y3JpdMKgOgo+IC0gcmVtb3ZlIDAwMDMtdGFyZ2V0LXNoNC1NYXNrLXJlc3RvcmUtb2YtZW52LWZs
YWdzLWZyb20tdGItZmxhZ3MucGF0Y2gKPiAgIChmcm9tIHVwc3RyZWFtLCBzZWUgWzFdKQo+IAo+
IFsxXSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvZTM0Zjg2
YTJmOTFjMzlkNjEwZDU4YmFhNmY0YzllZDlhNWE1ZDc5MQoKUWVtdSA4LjAuMCBoYXMgYmVlbiBy
ZWxlYXNlZCB0aGlzIHdlZWsgaW5jbHVkaW5nIHRoZSBwYXRjaAowMDAzLVJldmVydC1saW51eC11
c2VyLWFkZC1tb3JlLWNvbXBhdC1pb2N0bC1kZWZpbml0aW9ucy5wYXRjaAoKU2VlOiBodHRwczov
L2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy84NDUwNzYxNDkKCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMu
cmVwb3J0QGdteC5uZXQ+Cj4gLS0tCj4gIC4uLmstcmVzdG9yZS1vZi1lbnYtZmxhZ3MtZnJvbS10
Yi1mbGFncy5wYXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9xZW11L3Fl
bXUuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS9xZW11L3Fl
bXUubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9xZW11LzAwMDMtdGFyZ2V0LXNoNC1NYXNrLXJlc3RvcmUtb2YtZW52LWZsYWdzLWZy
b20tdGItZmxhZ3MucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11LzAwMDMtdGFy
Z2V0LXNoNC1NYXNrLXJlc3RvcmUtb2YtZW52LWZsYWdzLWZyb20tdGItZmxhZ3MucGF0Y2ggYi9w
YWNrYWdlL3FlbXUvMDAwMy10YXJnZXQtc2g0LU1hc2stcmVzdG9yZS1vZi1lbnYtZmxhZ3MtZnJv
bS10Yi1mbGFncy5wYXRjaAo+IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDhkYzJk
ZDg4MjMuLjAwMDAwMDAwMDAKPiAtLS0gYS9wYWNrYWdlL3FlbXUvMDAwMy10YXJnZXQtc2g0LU1h
c2stcmVzdG9yZS1vZi1lbnYtZmxhZ3MtZnJvbS10Yi1mbGFncy5wYXRjaAo+ICsrKyAvZGV2L251
bGwKPiBAQCAtMSwzNiArMCwwIEBACj4gLUZyb20gYmMyMzMxNjM1Y2UxOGZmMDY4ZDJiYjFlNDkz
YmM1NDZlMWY3ODZlMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAtRnJvbTogR3VlbnRlciBS
b2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+IC1EYXRlOiBNb24sIDEyIERlYyAyMDIyIDA5OjAz
OjE3IC0wNjAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L3NoNDogTWFzayByZXN0b3JlIG9m
IGVudi0+ZmxhZ3MgZnJvbSB0Yi0+ZmxhZ3MKPiAtCj4gLVRoZSB2YWx1ZXMgaW4gZW52LT5mbGFn
cyBhcmUgYSBzdWJzZXQgb2YgdGItPmZsYWdzLgo+IC1SZXN0b3JlIG9ubHkgdGhlIGJpdHMgdGhh
dCBiZWxvbmcuCj4gLQo+IC1DYzogcWVtdS1zdGFibGVAbm9uZ251Lm9yZwo+IC1GaXhlczogYWI0
MTlmZDhhMDM1ICgidGFyZ2V0L3NoNDogRml4IFRCX0ZMQUdfVU5BTElHTiIpCj4gLVNpZ25lZC1v
ZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiAtTWVzc2FnZS1JRDog
PDIwMjIxMjEyMDExMzQ1LkdBMjIzNTIzOEByb2Vjay11cy5uZXQ+Cj4gLVtydGg6IFJlZHVjZSB0
byBvbmx5IHRoZSB0aGUgc3VwZXJoX2NwdV9zeW5jaHJvbml6ZV9mcm9tX3RiIGNoYW5nZV0KPiAt
U2lnbmVkLW9mZi1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmc+Cj4gLVt5YW5uLm1vcmluLjE5OThAZnJlZS5mcjogYmFja3BvcnQgZnJvbSB1cHN0cmVh
bV0KPiAtU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUu
ZnI+Cj4gLS0tLQo+IC0gdGFyZ2V0L3NoNC9jcHUuYyB8IDIgKy0KPiAtIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IC0KPiAtZGlmZiAtLWdpdCBhL3Rhcmdl
dC9zaDQvY3B1LmMgYi90YXJnZXQvc2g0L2NwdS5jCj4gLWluZGV4IDk1MWViNmI5YzguLmYwOTM0
YjIwZmEgMTAwNjQ0Cj4gLS0tLSBhL3RhcmdldC9zaDQvY3B1LmMKPiAtKysrIGIvdGFyZ2V0L3No
NC9jcHUuYwo+IC1AQCAtNDcsNyArNDcsNyBAQCBzdGF0aWMgdm9pZCBzdXBlcmhfY3B1X3N5bmNo
cm9uaXplX2Zyb21fdGIoQ1BVU3RhdGUgKmNzLAo+IC0gICAgIFN1cGVySENQVSAqY3B1ID0gU1VQ
RVJIX0NQVShjcyk7Cj4gLSAKPiAtICAgICBjcHUtPmVudi5wYyA9IHRiX3BjKHRiKTsKPiAtLSAg
ICBjcHUtPmVudi5mbGFncyA9IHRiLT5mbGFnczsKPiAtKyAgICBjcHUtPmVudi5mbGFncyA9IHRi
LT5mbGFncyAmIFRCX0ZMQUdfRU5WRkxBR1NfTUFTSzsKPiAtIH0KPiAtIAo+IC0gc3RhdGljIHZv
aWQgc3VwZXJoX3Jlc3RvcmVfc3RhdGVfdG9fb3BjKENQVVN0YXRlICpjcywKPiAtLS0gCj4gLTIu
MjUuMQo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUuaGFzaCBiL3BhY2thZ2Uv
cWVtdS9xZW11Lmhhc2gKPiBpbmRleCBlNjcxZTFkMTg0Li45M2Y3Yzk4ZjFjIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcWVtdS9xZW11Lmhhc2gKPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5oYXNo
Cj4gQEAgLTEsNCArMSw0IEBACj4gICMgTG9jYWxseSBjb21wdXRlZCwgdGFyYmFsbCB2ZXJpZmll
ZCB3aXRoIEdQRyBzaWduYXR1cmUKPiAtc2hhMjU2ICA1YjQ5Y2UyNjg3NzQ0ZGFkNDk0YWU5MGE4
OThjNTIyMDRhMzQwNmU4NGQwNzI0ODJhMWUxYmU4NTRlZWIyMTU3ICBxZW11LTcuMi4wLnRhci54
ego+ICtzaGEyNTYgIDhjODU2OTlhY2Y5ZDdhNDNhNWZlMjlhNjRjZGQ1NjM3MGIwYzJkMWFkMDc0
YmFmNzA5OGE4MjRkMTdhYWQ3M2IgIHFlbXUtNy4yLjEudGFyLnh6Cj4gIHNoYTI1NiAgNmYwNGFl
ODM2NGQwMDc5YTE5MmIxNDYzNWY0YjFkYTI5NGNlMTg3MjRjMDM0YzM5YTZhNDFkMWIwOWRmNjEw
MCAgQ09QWUlORwo+ICBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZj
OTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcuTElCCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBpbmRleCAzZjUx
Y2I1NzJiLi4xMmQ1MmY2MWJmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4g
KysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiBAQCAtNiw3ICs2LDcgQEAKPiAgCj4gICMgV2hl
biB1cGRhdGluZyB0aGUgdmVyc2lvbiwgY2hlY2sgd2hldGhlciB0aGUgbGlzdCBvZiBzdXBwb3J0
ZWQgdGFyZ2V0cwo+ICAjIG5lZWRzIHRvIGJlIHVwZGF0ZWQuCj4gLVFFTVVfVkVSU0lPTiA9IDcu
Mi4wCj4gK1FFTVVfVkVSU0lPTiA9IDcuMi4xCj4gIFFFTVVfU09VUkNFID0gcWVtdS0kKFFFTVVf
VkVSU0lPTikudGFyLnh6Cj4gIFFFTVVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcK
PiAgUUVNVV9MSUNFTlNFID0gR1BMLTIuMCwgTEdQTC0yLjEsIE1JVCwgQlNELTMtQ2xhdXNlLCBC
U0QtMi1DbGF1c2UsIE90aGVycy9CU0QtMWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
