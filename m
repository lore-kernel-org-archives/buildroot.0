Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913F9CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EC9E409A6;
	Sun,  7 Apr 2024 19:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGn4ClsbPCla; Sun,  7 Apr 2024 19:47:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3860A40907
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3860A40907;
	Sun,  7 Apr 2024 19:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDE251BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B956081D73
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:47:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_DONa6ZcJs8 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:47:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 919EA81D72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 919EA81D72
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 919EA81D72
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:47:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so1977166f8f.2
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519247; x=1713124047;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o58cgXVrrffdNKR29bI3Gh0DCcqlGdhDwaXjFFkNyxw=;
 b=RHxkFsH+4jT+KAyuUooxFzfIJiDl5jWc8+iS4o5Bpcy6Rk/qczfJBm549TPQjnpCFd
 Wpjd4VK3lJ3eW4gMeP9oprEF78NGKiYGjyNm2v0VaLlW70LZxH2hLOgmkp7Ecsbexhxv
 l73VZqS00cuVqaCqzxWlrKBBcm1N4/d+QXRtECxNPBM1eu4/DGiXrAlZTtIdQV2oYeq8
 83RpkVrxB1DZ1Ujuhn1B0Ob//gVdWGFVOFIJivBn2o1Vm2vLfu7Z9Le6SJi9PcCD5hRN
 +SByQxSzJuWKcDoWU3dy5HM4XzWHlPObpG4pva5r1/Tk0ZFRlN2tY/hyBLEUtIzAA/SI
 cNow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB6w0y4OmOMnxI4cFNxXasoNyvNI7IpDeGRtOxwkYWRRDgB4x2utYpkKwT8zUgCDHoeeMooglcl9ikW3acWz+2yVj/lRUGXA==
X-Gm-Message-State: AOJu0YxirA1Nc02oXNhoUd1nDdh7VfCaopEI3TD2Bd1XHQbYHyXuK8uy
 Xuc7kI7JlxdT9UpMHXYki8Ai9flRe/zUKJH8dLJGn3DNZzjUaP8DLn9/24dOrWc=
X-Google-Smtp-Source: AGHT+IFZHmPkgZQkyFnIsCId6ue66oOCKOWs855nSYU/CR6wQRezTOQdvAHAWbwjf31vlbeIB9n+rw==
X-Received: by 2002:a5d:5151:0:b0:343:7597:6240 with SMTP id
 u17-20020a5d5151000000b0034375976240mr5691074wrt.22.1712519246584; 
 Sun, 07 Apr 2024 12:47:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4145000000b00343dc6a0019sm7264266wrq.68.2024.04.07.12.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:47:26 -0700 (PDT)
Message-ID: <c52e14db-86a8-4bba-bde4-13b21b3cea55@mind.be>
Date: Sun, 7 Apr 2024 21:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407184152.3241588-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407184152.3241588-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519247; x=1713124047; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o58cgXVrrffdNKR29bI3Gh0DCcqlGdhDwaXjFFkNyxw=;
 b=R5ADn3Er93Kp8jvB2wS69vNXPVgqd1D/mj1eDRX9JlF3IqNhJXlQ3Mh5CKd2f5vhx8
 YPkBqHRIdLZTkOQhDUfzG4QW6SfrmHnlNlYY098xhAtt/IJncaxaL8pNuQMjZRfdSJOJ
 E31bogiXf/mP7X9VCiYwOhHlAo0MVwGHSpL9B2RV1g1Em0MOVAUX5x6y9rvWxrLflZ0+
 zxj+e5oTk6Gd7Ot2wXD4XaMQNB0DHi67yeygfGcWtbwWaA8EHiSeW1IJU0OQyORnzM1m
 FSpTMQR/CMeORZ51mSExuZuJMkDvJk71JR+WKxzd0RUYHeLS4XrViV+utLfgCtZfOEhm
 wHFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R5ADn3Er
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: fix build with gcc >=
 13
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNC8yMDI0IDIwOjQxLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBnY2MgPj0gMTM6Cj4gCj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC4uL3NyYy9iYXNpYy9tYWNyby5oOjQ0NiwKPiAgICAgICAgICAgICAgICAgICBm
cm9tIC4uL3NyYy9iYXNpYy9hbGxvYy11dGlsLmg6MTAsCj4gICAgICAgICAgICAgICAgICAgZnJv
bSAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzoxMjoKPiAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzog
SW4gZnVuY3Rpb24g4oCYaW5zdGFsbF9jaGFuZ2VzX2R1bXDigJk6Cj4gLi4vc3JjL3NoYXJlZC9p
bnN0YWxsLmM6NDQ0OjY0OiBlcnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51
bGwgWy1XZXJyb3I9Zm9ybWF0LW92ZXJmbG93PV0KPiAgICA0NDQgfCAgICAgICAgICAgICAgICAg
ICAgICAgICBlcnIgPSBsb2dfZXJyb3JfZXJybm8oY2hhbmdlc1tpXS50eXBlLCAiRmFpbGVkIHRv
ICVzIHVuaXQsIHVuaXQgJXMgZG9lcyBub3QgZXhpc3QuIiwKPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IEZpeGVzOgo+ICAg
LSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lMGQ2YjdkNDFmZWZlYzUz
OWExN2EzZWY1Yzg5YzE5MmNlMjlmZDA0Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgLi4ucm5pbmctYWJvdXQtZW1w
dHktZGlyZWN0aXZlLWFyZ3VtZW50LnBhdGNoIHwgNDUgKysrKysrKysrKysrKysrKysrKwo+ICAg
MSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3N5c3RlbWQvMDAwMS1pbnN0YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0LWVt
cHR5LWRpcmVjdGl2ZS1hcmd1bWVudC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5
c3RlbWQvMDAwMS1pbnN0YWxsLWZpeC1jb21waWxlci13YXJuaW5nLWFib3V0LWVtcHR5LWRpcmVj
dGl2ZS1hcmd1bWVudC5wYXRjaCBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAxLWluc3RhbGwtZml4LWNv
bXBpbGVyLXdhcm5pbmctYWJvdXQtZW1wdHktZGlyZWN0aXZlLWFyZ3VtZW50LnBhdGNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45NDA4YTZkYTBlCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAxLWluc3RhbGwtZml4LWNvbXBpbGVy
LXdhcm5pbmctYWJvdXQtZW1wdHktZGlyZWN0aXZlLWFyZ3VtZW50LnBhdGNoCj4gQEAgLTAsMCAr
MSw0NSBAQAo+ICtGcm9tIDgwNDBmYTU1YTFjYmMzNGRlZGUzMjA1YTkwMjA5NWVjZDI2YzIxZTMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEx1Y2EgQm9jY2Fzc2kgPGJsdWNhQGRl
Ymlhbi5vcmc+Cj4gK0RhdGU6IFNhdCwgMjQgRmViIDIwMjQgMTI6MDU6NDQgKzAwMDAKPiArU3Vi
amVjdDogW1BBVENIXSBpbnN0YWxsOiBmaXggY29tcGlsZXIgd2FybmluZyBhYm91dCBlbXB0eSBk
aXJlY3RpdmUgYXJndW1lbnQKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0
ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKPiArCj4gK09uIHBwYzY0ZWwgd2l0aCBnY2MgMTMuMiBvbiBVYnVudHUgMjQuMDQ6Cj4gKwo+
ICszcyBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vc3JjL2Jhc2ljL21hY3JvLmg6Mzg2LAo+ICs0
ODNzICAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvYmFzaWMvYWxsb2MtdXRpbC5oOjEwLAo+
ICs0ODNzICAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzoxMjoK
PiArNDgzcyAuLi9zcmMvc2hhcmVkL2luc3RhbGwuYzogSW4gZnVuY3Rpb24g4oCYaW5zdGFsbF9j
aGFuZ2VzX2R1bXDigJk6Cj4gKzQ4M3MgLi4vc3JjL3NoYXJlZC9pbnN0YWxsLmM6NDMyOjY0OiBl
cnJvcjog4oCYJXPigJkgZGlyZWN0aXZlIGFyZ3VtZW50IGlzIG51bGwgWy1XZXJyb3I9Zm9ybWF0
LW92ZXJmbG93PV0KPiArNDgzcyAgIDQzMiB8ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9
IGxvZ19lcnJvcl9lcnJubyhjaGFuZ2VzW2ldLnR5cGUsICJGYWlsZWQgdG8gJXMgdW5pdCwgdW5p
dCAlcyBkb2VzIG5vdCBleGlzdC4iLAo+ICs0ODNzICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiArNDgzcyAuLi9zcmMvc2hhcmVkL2lu
c3RhbGwuYzo0MzI6NzU6IG5vdGU6IGZvcm1hdCBzdHJpbmcgaXMgZGVmaW5lZCBoZXJlCj4gKzQ4
M3MgICA0MzIgfCAgICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSBsb2dfZXJyb3JfZXJybm8o
Y2hhbmdlc1tpXS50eXBlLCAiRmFpbGVkIHRvICVzIHVuaXQsIHVuaXQgJXMgZG9lcyBub3QgZXhp
c3QuIiwKPiArCj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1k
L2NvbW1pdC84MDQwZmE1NWExY2JjMzRkZWRlMzIwNWE5MDIwOTVlY2QyNmMyMWUzCj4gK1NpZ25l
ZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+
ICstLS0KPiArIHNyYy9zaGFyZWQvaW5zdGFsbC5jIHwgNyArKysrKy0tCj4gKyAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBh
L3NyYy9zaGFyZWQvaW5zdGFsbC5jIGIvc3JjL3NoYXJlZC9pbnN0YWxsLmMKPiAraW5kZXggZmFi
ZjVkYjdlZDJlMS4uYzNhOTRkMTkxMjE2NSAxMDA2NDQKPiArLS0tIGEvc3JjL3NoYXJlZC9pbnN0
YWxsLmMKPiArKysrIGIvc3JjL3NoYXJlZC9pbnN0YWxsLmMKPiArQEAgLTM0MCw5ICszNDAsMTIg
QEAgdm9pZCBpbnN0YWxsX2NoYW5nZXNfZHVtcChpbnQgciwgY29uc3QgY2hhciAqdmVyYiwgY29u
c3QgSW5zdGFsbENoYW5nZSAqY2hhbmdlcywKPiArICAgICAgICAgYXNzZXJ0KHZlcmIgfHwgciA+
PSAwKTsKPiArCj4gKyAgICAgICAgIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgbl9jaGFuZ2VzOyBp
KyspIHsKPiArLSAgICAgICAgICAgICAgICBpZiAoY2hhbmdlc1tpXS50eXBlIDwgMCkKPiArLSAg
ICAgICAgICAgICAgICAgICAgICAgIGFzc2VydCh2ZXJiKTsKPiArICAgICAgICAgICAgICAgICBh
c3NlcnQoY2hhbmdlc1tpXS5wYXRoKTsKPiArKyAgICAgICAgICAgICAgICAvKiBUaGlzIHRyaWVz
IHRvIHRlbGwgdGhlIGNvbXBpbGVyIHRoYXQgaXQncyBzYWZlIHRvIHVzZSAndmVyYicgaW4gYSBz
dHJpbmcgZm9ybWF0IGlmIHRoZXJlCj4gKysgICAgICAgICAgICAgICAgICogd2FzIGFuIGVycm9y
LCBidXQgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgY2FyZSBhbmQgZmFpbHMgYW55d2F5LCBzbyBzdHJu
YSh2ZXJiKSBpcyB1c2VkCj4gKysgICAgICAgICAgICAgICAgICogdG9vLiAqLwo+ICsrICAgICAg
ICAgICAgICAgIGFzc2VydCh2ZXJiIHx8IGNoYW5nZXNbaV0udHlwZSA+PSAwKTsKPiArKyAgICAg
ICAgICAgICAgICB2ZXJiID0gc3RybmEodmVyYik7Cj4gKwo+ICsgICAgICAgICAgICAgICAgIC8q
IFdoZW4gbWFraW5nIGNoYW5nZXMgaGVyZSwgbWFrZSBzdXJlIHRvIGFsc28gY2hhbmdlIGluc3Rh
bGxfZXJyb3IoKSBpbiBkYnVzLW1hbmFnZXIuYy4gKi8KPiArCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
