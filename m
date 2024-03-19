Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B21C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 08:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9CC1608EB;
	Tue, 19 Mar 2024 08:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8r0eRNGMQhV; Tue, 19 Mar 2024 08:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1C53608F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1C53608F0;
	Tue, 19 Mar 2024 08:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D5F4B1BF31D
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 08:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF8744066B
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 08:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSS0juOLx3AK for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 08:47:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 157304066A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 157304066A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 157304066A
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 08:47:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3417a3151c5so871526f8f.1
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 01:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710838069; x=1711442869;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GrQtLfYBxJw3kx97U+Cb6fxi1uMHz3BOyCfN3TVj968=;
 b=jx9q+X98bT8b20iJU6b0YxzCwf2B8SSpgQ4cRWQlIIsA/qXLZhGFxqfMOVjRcBl0mR
 lQMlTBNCB6FxrzeAT6CqYJcgSclH9aLiH7RoRb1M9r1Zs+c2U6HlGdKm470opjjSHH/6
 toPhajHQhpz4yaSdqjfvxrc7GCu5VxEaEGI64i2zBdUDCK69xlMUxY3oz7Z5QtbMm/Y4
 AnlIWOdCu1z4/zicHG78TTCeacxePNZmWhu1mLgA4izACCLo/wu+Hm167GZn1vT+TNbr
 3r+jEL+Xooxjx1npMhOk5CBBWgkZgaSiM9M+rzp2sPq9YyOakbmgAEy5LyNIYYVqjhUy
 m7vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeULwvzsrx+Mq7z7GpQclLYb5vE3ijtj9SX4RTQXiQL1ahffUdGhRyTq+VqTnGFW91qyMAmbEt8MM3wkWEOyAfPfAsIbIzdg==
X-Gm-Message-State: AOJu0YxeVYfdFXS4wOYcJ3MUJnSfNIOrNiePXL0JFqCx6UUNmYL+BWUK
 dz2CbbzA5IjYCz3LDumpgVFIRhrjl4dlRXr9wcU5gPOhms/FKAjZFNUDGHSRewE=
X-Google-Smtp-Source: AGHT+IFhgQggloCU1Koiai+efCbqUXMFbhRp9QfXKoqJQM8SWHScGZ+xeoTr3mOh07fpwt3T9Ueo7w==
X-Received: by 2002:adf:e5c6:0:b0:33e:d229:35a1 with SMTP id
 a6-20020adfe5c6000000b0033ed22935a1mr1278849wrn.65.1710838069235; 
 Tue, 19 Mar 2024 01:47:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adff206000000b0033cf5094fcesm11802267wro.36.2024.03.19.01.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 01:47:48 -0700 (PDT)
Message-ID: <0f200aec-5ba4-4338-a8bd-f5b8a8429a32@mind.be>
Date: Tue, 19 Mar 2024 09:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 buildroot@buildroot.org
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
 <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
In-Reply-To: <20240319070554.1323606-3-javad.rahimipetroudi@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710838069; x=1711442869; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GrQtLfYBxJw3kx97U+Cb6fxi1uMHz3BOyCfN3TVj968=;
 b=YVM5/u65EwwYzJ3jnRf4MquBtosqjzvwphaCJp9JkGO2rshDT5KQJLwKy3NVyLL7hi
 90Si7SATzUZfCMUXqkoBA/YVGF38sXlpzowc6K86WOsbxuvMN/KtE3mXf7LR837koGbH
 G/doualsR98HMHh4UuQrXhFPApWAg78kYp8BhH3TeELyX3EImWbpRANlUHrRjnOzLpuH
 VWnbSZkznA+SsILxawWOsHbRMbUFu4UtWISIezLH4Kiu26B9Io/BQ/xTu+qUjgrLBY1M
 +iwZ2wllA42zlGzFHPAIsefrk6oerGT9k7QMVI0ANOBNtQvLT4Mlq4ui4g1+OLapFASu
 S4Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YVM5/u65
Subject: Re: [Buildroot] [PATCH v3 3/3] configs/avenger96: bump ATF version
 to v2.8
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wMy8yMDI0IDA4OjA1LCBKYXZhZCBSYWhpbWlwZXRyb3VkaSB3cm90ZToKPiBUaGlz
IHBhdGNoIHVwZ3JhZGVzIHRoZSBBVEYgdmVyc2lvbiB0byB2Mi44LiBQbGVhc2Ugbm90ZSB0aGF0
Cj4gZHVlIHRvIERUUyBjaGFnZXMgZnJvbSBjb21taXQgNTFlMjIzMDU4ZmU3MGIzMTE1NDIxNzhm
MTg2NTUxNDc0NWZhNzg3NAo+ICgiZmVhdChzdG0zMm1wMTUtZmR0cyk6IGFkZCBBdmVuZ2VyOTYg
Ym9hcmQgd2l0aCBTVE0zMk1QMTU3QSBESENPUiBTb00iKQo+IFRoZSBBVEYgYWRkaXRpb25hbCBi
dWlsZCB2YXJpYWJsZSBhbHNvIG1vZGlmaWVkIHRvIHVzZSB0aGUgbmV3IERUUyBmaWxlLgoKICBJ
IG5vdGljZWQgdGhhdCB0aGUgb2xkIERUUyBmaWxlIGZkdHMvc3RtMzJtcDE1N2EtYXZlbmdlcjk2
LmR0cyBzdGlsbCBleGlzdHMsIApidXQgSSBzdXBwb3NlIGl0IGRvZXNuJ3QgYWN0dWFsbHkgd29y
ayBhbnkgbW9yZSB0aGVuPwoKPiBTaWduZWQtb2ZmLWJ5OiBKYXZhZCBSYWhpbWlwZXRyb3VkaSA8
amF2YWQucmFoaW1pcGV0cm91ZGlAbWluZC5iZT4KPiAtLS0KPiAgIGNvbmZpZ3MvYXZlbmdlcjk2
X2RlZmNvbmZpZyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hdmVuZ2VyOTZfZGVmY29u
ZmlnIGIvY29uZmlncy9hdmVuZ2VyOTZfZGVmY29uZmlnCj4gaW5kZXggOThhNzFhMGYyNS4uNjdi
NmQxNjc0OSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2F2ZW5nZXI5Nl9kZWZjb25maWcKPiArKysg
Yi9jb25maWdzL2F2ZW5nZXI5Nl9kZWZjb25maWcKPiBAQCAtMjksMTMgKzI5LDEzIEBAIEJSMl9U
QVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPiAgICMgQm9vdGxvYWRlcnMKPiAgIEJSMl9U
QVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRV9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdB
UkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjYiCj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURf
RklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjgiCgogIFRoZSBpbnRlbnRpb24gd2Fz
IHRvIGJlIGFibGUgdG8gdXNlIApCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0xBVEVT
VF9MVFNfMl84X1ZFUlNJT04gaGVyZSwgc28gdGhhdCBpdCBnZXRzIAp1cGRhdGVkIGF1dG9tYXRp
Y2FsbHkgd2hlbiB0aGUgQVRGIExUUyB2ZXJzaW9uIGlzIHVwZGF0ZWQuCgogIEZvciBzdXJlLCB2
Mi44IGlzIG5vdCBhIGdvb2QgY2hvaWNlLCBiZWNhdXNlIHRoZXJlJ3MgYWxyZWFkeSBhIHYyLjgu
MTYhCgo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STT0ic3RtMzJt
cDEiCj4gICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0ZJUD15Cj4gICBCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzE9eQo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9VQk9PVF9BU19CTDMzPXkKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfVUJPT1RfQkwzM19JTUFHRT0idS1ib290LW5vZHRiLmJpbiIKPiAtQlIyX1RBUkdFVF9B
Uk1fVFJVU1RFRF9GSVJNV0FSRV9BRERJVElPTkFMX1ZBUklBQkxFUz0iU1RNMzJNUF9TRE1NQz0x
IEFBUkNIMzJfU1A9c3BfbWluIERUQl9GSUxFX05BTUU9c3RtMzJtcDE1N2EtYXZlbmdlcjk2LmR0
YiBFPTAgQkwzM19DRkc9JChCSU5BUklFU19ESVIpL3UtYm9vdC5kdGIiCgogIFBsZWFzZSBjb21t
ZW50IGluIHRoZSBjb21taXQgbWVzc2FnZSBvbiB3aHkgRT0wIGlzIHJlbW92ZWQuIEl0IHdhcyBh
ZGRlZCBieSAKUGV0ZXIgaW4gZGViOGQ3MWM5Mjg1ZWI2MGJjM2QyOGU4YWJjZjcyMDhmNzg5ODBh
NyAgd2l0aCB0aGlzIGNvbW1lbnQ6CgogICAgIEluc3RlYWQgdXNlIHYyLjUgdG8gbWF0Y2ggdGhl
IG90aGVyIHN0bTMybXAxIGJvYXJkcyBhbmQgdXNlIHRoZSBzYW1lIEU9MAogICAgIC1XZXJyb3Ig
d29ya2Fyb3VuZC4KClRoZSAidGhlIHNhbWUiIHJlZmVycyB0byBjb21taXQgMWMwYzY3ZmMxYWUx
NDZiMzQ0NzUyMzFmYjcwMmU3ZjJlNmJmOWY4ZiB3aGljaCAKaGFzIHRoaXMgY29tbWVudDoKCiAg
ICAgV2l0aCB0aGUgbW92ZSB0byBkZWZhdWx0IHRvIEdDQyAxMiBpbiBjb21taXQgZTAwOTFlNDJl
ZWY5IChwYWNrYWdlL2djYzoKICAgICBzd2l0Y2ggdG8gZ2NjIDEyLnggYXMgdGhlIGRlZmF1bHQp
LCBURi1BIG5vdyBmYWlscyB0byBidWlsZCBhcyBhIHdhcm5pbmcgaXMKICAgICBnZW5lcmF0ZWQg
YW5kIGl0IGJ1aWxkcyB3aXRoIC1XZXJyb3I6CgogICAgICAgQ0MgICAgICBwbGF0L3N0L3N0bTMy
bXAxL2JsMl9wbGF0X3NldHVwLmMKICAgICBkcml2ZXJzL3N0L2lvL2lvX3N0bTMyaW1hZ2UuYzog
SW4gZnVuY3Rpb24g4oCYc3RtMzJpbWFnZV9wYXJ0aXRpb25fcmVhZOKAmToKICAgICBkcml2ZXJz
L3N0L2lvL2lvX3N0bTMyaW1hZ2UuYzoyNDk6MTM6IGVycm9yOiDigJhyZXN1bHTigJkgbWF5IGJl
IHVzZWQgCnVuaW5pdGlhbGl6ZWQgWy1XZXJyb3I9bWF5YmUtdW5pbml0aWFsaXplZF0KICAgICAg
IDI0OSB8ICAgICAgICAgaW50IHJlc3VsdDsKICAgICAgICAgICB8ICAgICAgICAgICAgIF5+fn5+
fgogICAgIGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgogICAgIFRo
aXMgaXMgZml4ZWQgaW4gVEYtQSB2Mi42IHdpdGggY29tbWl0IGMxZDczMmQwZGIyNCAoZml4KGlv
X3N0bTMyaW1hZ2UpOgogICAgIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUgd2FybmluZyksIGJ1dCBJ
IGRvIG5vdCBoYXZlIHRoZSBib2FyZCB0byB2ZXJpZnkgaWYKICAgICB2Mi42IHdvcmtzLCBzbyBp
bnN0ZWFkIGRpc2FibGUgLVdlcnJvciBieSBwYXNzc2luZyBFPTAuCgogIFNvIGluZGVlZCwgdGhl
IEU9MCBpcyBubyBsb25nZXIgbmVjZXNzYXJ5IHdoZW4gd2UgbW92ZSB0byB2Mi42IG9yIGxhdGVy
LCBidXQgCnRoaXMgc2hvdWxkIGJlIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0FE
RElUSU9OQUxfVkFSSUFCTEVTPSJTVE0zMk1QX1NETU1DPTEgQUFSQ0gzMl9TUD1zcF9taW4gRFRC
X0ZJTEVfTkFNRT1zdG0zMm1wMTU3YS1kaGNvci1hdmVuZ2VyOTYuZHRiIEJMMzNfQ0ZHPSQoQklO
QVJJRVNfRElSKS91LWJvb3QuZHRiIgo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FS
RV9JTUFHRVM9ImZpcC5iaW4gKi5zdG0zMiIKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklS
TVdBUkVfTkVFRFNfRFRDPXkKPiAgIEJSMl9UQVJHRVRfVUJPT1Q9eQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
