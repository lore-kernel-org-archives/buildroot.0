Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA74C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A2641971;
	Wed,  1 May 2024 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Fq0mGlkg_Vx; Wed,  1 May 2024 20:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B1C41968
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B1C41968;
	Wed,  1 May 2024 20:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4241BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05A1281EE2
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q17Trw0b4prF for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E2008193E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E2008193E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E2008193E
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F303FF806;
 Wed,  1 May 2024 20:46:27 +0000 (UTC)
Date: Wed, 1 May 2024 22:46:26 +0200
To: Jan =?UTF-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Message-ID: <20240501224626.1ae78fa5@windsurf>
In-Reply-To: <20240426071443.2565112-1-sairon@sairon.cz>
References: <20240426071443.2565112-1-sairon@sairon.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714596387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJO+sjvUs//oD9UCVmm5FkIe7XL7nx/jdHXP5Ar286A=;
 b=W42GayEPAuLUbyEoUgUGTf/o+g4fkmqx9HP1hHXZ82f9+sYz900bH/PL3E3kFrshKfJYEe
 lIf9QQM1K1hh0xBjN7Qqz0BnZ9jtZH0cLIxnfzHUR8oWLMgs2fZ2ZBHgCHDhN4m6+BpC3+
 5+Ci+yweTCiswE3nURs8QetZ9lzMMvoYSJtwMkigPATkKdKxz28JoeatdYlB5Al9oC40/W
 V/R1xZ3s9LWCDJegbUgz5kkO8qZjeON3ctZIoZ1IuOFtJcOdkqM8XUaFlq88tN2RP8TJKw
 xv/Enq9+mFH2p8fHRwge5CBANeP0Z66xRiKWEl0D3MOS4vv1qZt/4kt18MZoQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W42GayEP
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.75
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAyNiBBcHIgMjAyNCAwOToxNDo0MyArMDIwMApKYW4gxIxlcm3DoWsgPHNhaXJvbkBz
YWlyb24uY3o+IHdyb3RlOgoKPiBCdW1wIHRvIHZlcnNpb24gNS43NSBjb250YWluaW5nIHZhcmlv
dXMgZml4ZXMuIEFkZGVkIGEgcGF0Y2ggdG8gZml4Cj4gYnVpbGQgd2l0aCBkaXNhYmxlZCBDVVBT
IChmYWlsaW5nIHNpbmNlIDUuNzMsIHdhaXRpbmcgdG8gYmUgcmV2aWV3ZWQgYW5kCj4gbWVyZ2Vk
KSBhbmQgZW5hYmxlZCBhdXRvcmVjb25mIHdoaWNoIGlzIG5lZWRlZCBmb3IgdGhhdCBwYXRjaC4K
PiAKPiBDaGFuZ2Vsb2c6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2JsdWV0b290
aC9ibHVlei5naXQvdHJlZS9DaGFuZ2VMb2cKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3D
oWsgPHNhaXJvbkBzYWlyb24uY3o+Cj4gLS0tCj4gIC4uLi9ibHVlejVfdXRpbHMtaGVhZGVycy5t
ayAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIC4uLi8wMDAxLWNvbmZpZ3VyZS5hYy1GaXgt
ZGlzYWJsZS1jdXBzLnBhdGNoICB8IDQxICsrKysrKysrKysrKysrKysrKysKPiAgcGFja2FnZS9i
bHVlejVfdXRpbHMvYmx1ZXo1X3V0aWxzLmhhc2ggICAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS9i
bHVlejVfdXRpbHMvYmx1ZXo1X3V0aWxzLm1rICAgICAgICAgIHwgIDQgKy0KPiAgNCBmaWxlcyBj
aGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9ibHVlejVfdXRpbHMvMDAwMS1jb25maWd1cmUuYWMtRml4LWRpc2FibGUt
Y3Vwcy5wYXRjaAoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFz
IFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
