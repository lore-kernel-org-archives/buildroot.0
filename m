Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6B7C001E0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 12:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EB4040C28;
	Mon, 24 Jul 2023 12:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EB4040C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YiHIlDeXNGcB; Mon, 24 Jul 2023 12:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3273040C1C;
	Mon, 24 Jul 2023 12:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3273040C1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E98A11BF255
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 12:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B998F4159D
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 12:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B998F4159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h96Sw-gX40Gt for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 12:04:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A1744099D
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 12:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A1744099D
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso3899004f8f.3
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 05:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690200292; x=1690805092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAnfSiaCY5v6aTMILtgJpoYMKaCztF+JLVy5p1/gupk=;
 b=CqaXzhcU6HQOzyZT6whqIoJV6l914/ShwWKvTwOJQ7XiRRXpaT1iaVtvqQ/kltzO/4
 EttPvvG2GtIM0tHWR5t/79KpwErCzBLCtBJaE3Ub/hvztGM58oHD7Qaav4xUooc6sLac
 aDd0ZIAp80MjLM4dUrmzVZIWQ1IsDtWQB68WY9tc9G0AYMlrdZQ8PXhUf0dCXII4vmjW
 QwRmrTpxfEttoiWjtHeihRcX/AuXLhxbYWSZ9AocJdyew44bpW0rdeXatx9cx/ykJhh2
 POsLnCMDQzi7zcIn+ohHgQ3ckRN/l6M8fuWCgrW37OzPkLLln5azEkWxTrye1CUuYeAF
 TqlA==
X-Gm-Message-State: ABy/qLZgEAvFG6yoLmjynQjlyOeaJQ2BfwLoCNIR3G7gqOgyvNHouY7W
 3CpRpszrWDDw9MxMMEYNJ77bBLvR+nDiV3PF
X-Google-Smtp-Source: APBJJlEEVn+l4mjKIw+04EEsKrEeZqqwpBRlx3n7hCXVjmj8MnvuTVim+IiPIsSXnitX/HAnwzCx6w==
X-Received: by 2002:a5d:484d:0:b0:315:8fc0:915e with SMTP id
 n13-20020a5d484d000000b003158fc0915emr7951306wrs.56.1690200291695; 
 Mon, 24 Jul 2023 05:04:51 -0700 (PDT)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb68:2f00:6774:c72b:9695:4a59])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adffe41000000b003113ed02080sm12670639wrs.95.2023.07.24.05.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:04:51 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 14:04:42 +0200
Message-Id: <20230724120442.191703-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723092314.129079-4-thomas@devoogdt.com>
References: <20230723092314.129079-4-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4] package/fluent-bit: rework wasm handling
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rmx1ZW50LWJpdCBpc24ndCB2ZXJ5IGdyZWF0IGF0IHN1cHBvcnRpbmcgdGhlIHZhcmlvdXMgYXJj
aGl0ZWN0dXJlcywKc28gaGVscCBhIGxpdHRsZSBiaXQgYnkgZGVmaW5pbmcgdGhlIFdBTVJfQlVJ
TERfVEFSR0VUIG91cnNlbHZlcy4KClR3byBmYWlsdXJlcyBmb3IgTUlQUyB3aGlsZSBleGVjdXRp
bmcgLi91dGlscy90ZXN0LXBrZzoKCi0gc291cmNlcnktbWlwczY0Ogpjb3JlL2l3YXNtL2NvbW1v
bi9hcmNoL2ludm9rZU5hdGl2ZV9taXBzLnM6IEFzc2VtYmxlciBtZXNzYWdlczoKY29yZS9pd2Fz
bS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zOjU4OiBFcnJvcjogb3Bjb2RlIG5vdCBz
dXBwb3J0ZWQgb24gdGhpcyBwcm9jZXNzb3I6IG1pcHM2NHIyIChtaXBzNjRyMikgYGxkYzEgJGYx
MiwwKCRzcCknCmNvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52b2tlTmF0aXZlX21pcHMuczo1OTog
RXJyb3I6IG9wY29kZSBub3Qgc3VwcG9ydGVkIG9uIHRoaXMgcHJvY2Vzc29yOiBtaXBzNjRyMiAo
bWlwczY0cjIpIGBsZGMxICRmMTQsOCgkc3ApJwptYWtlWzRdOiAqKiogW3NyYy93YXNtL0NNYWtl
RmlsZXMvdm1saWItc3RhdGljLmRpci9idWlsZC5tYWtlOjQ5NTogc3JjL3dhc20vQ01ha2VGaWxl
cy92bWxpYi1zdGF0aWMuZGlyL19fL19fL2xpYi93YXNtLW1pY3JvLXJ1bnRpbWUtV0FNUi0xLjEu
MS9jb3JlL2l3YXNtL2NvbW1vbi9hcmNoL2ludm9rZU5hdGl2ZV9taXBzLnMub10gRXJyb3IgMQpt
YWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgoKLSBzb3VyY2VyeS1t
aXBzOgpjb3JlL2l3YXNtL2NvbW1vbi9hcmNoL2ludm9rZU5hdGl2ZV9taXBzLnM6IEFzc2VtYmxl
ciBtZXNzYWdlczoKY29yZS9pd2FzbS9jb21tb24vYXJjaC9pbnZva2VOYXRpdmVfbWlwcy5zOjU4
OiBFcnJvcjogb3Bjb2RlIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwcm9jZXNzb3I6IG1pcHMzMnIy
IChtaXBzMzJyMikgYGxkYzEgJGYxMiwwKCRzcCknCmNvcmUvaXdhc20vY29tbW9uL2FyY2gvaW52
b2tlTmF0aXZlX21pcHMuczo1OTogRXJyb3I6IG9wY29kZSBub3Qgc3VwcG9ydGVkIG9uIHRoaXMg
cHJvY2Vzc29yOiBtaXBzMzJyMiAobWlwczMycjIpIGBsZGMxICRmMTQsOCgkc3ApJwptYWtlWzRd
OiAqKiogW3NyYy93YXNtL0NNYWtlRmlsZXMvdm1saWItc3RhdGljLmRpci9idWlsZC5tYWtlOjQ5
NTogc3JjL3dhc20vQ01ha2VGaWxlcy92bWxpYi1zdGF0aWMuZGlyL19fL19fL2xpYi93YXNtLW1p
Y3JvLXJ1bnRpbWUtV0FNUi0xLjEuMS9jb3JlL2l3YXNtL2NvbW1vbi9hcmNoL2ludm9rZU5hdGl2
ZV9taXBzLnMub10gRXJyb3IgMQptYWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgoKV2hpY2ggYXJlIGZpeGVkIGJ5IHNldHRpbmcgdGhlIG9ic2N1cmUgZmxhZyAiV0FN
Ul9CVUlMRF9JTlZPS0VfTkFUSVZFX0dFTkVSQUwiLgoKU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9i
eXRlY29kZWFsbGlhbmNlL3dhc20tbWljcm8tcnVudGltZS9pc3N1ZXMvNjI1IGZvciBtb3JlIGlu
Zm86CuKAnEhpLCBidWlsZGluZyB0aGUgaW52b2tlTmF0aXZlX2dlbmVyYWwuYyBleHBsaWNpdGx5
IGlzIHN1cHBvcnRlZCBub3csIHBsZWFzZSBwdWxsIHRoZSBsYXRlc3QgY29kZSBhbmQgdXNlCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+Ci0tLQp2
MjogTm8gY2hhbmdlLgp2MzogTm8gY2hhbmdlLgp2NDogUmVzdG9yZSB0aGUgQlIyX1BBQ0tBR0Vf
RkxVRU5UX0JJVF9XQVNNX0FSQ0hfU1VQUE9SVFMgS0NvbmZpZy4KLS0tCiBwYWNrYWdlL2ZsdWVu
dC1iaXQvQ29uZmlnLmluICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0tCiBwYWNrYWdlL2Zs
dWVudC1iaXQvZmx1ZW50LWJpdC5tayB8IDEyICsrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Zmx1ZW50LWJpdC9Db25maWcuaW4gYi9wYWNrYWdlL2ZsdWVudC1iaXQvQ29uZmlnLmluCmluZGV4
IGJmZGVhODk1YjAuLjlmZmRlNWIzMTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZmx1ZW50LWJpdC9D
b25maWcuaW4KKysrIGIvcGFja2FnZS9mbHVlbnQtYml0L0NvbmZpZy5pbgpAQCAtMTMsMTUgKzEz
LDIxIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9GTFVFTlRfQklUCiAKIGlmIEJSMl9QQUNLQUdFX0ZM
VUVOVF9CSVQKIAorY29uZmlnIEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9BUkNICisJc3Ry
aW5nCisJZGVmYXVsdCAiQUFSQ0g2NCIgICAgaWYgQlIyX2FhcmNoNjQgfHwgQlIyX2FhcmNoNjRi
ZQorCWRlZmF1bHQgIkFSQyIgICAgICAgIGlmIEJSMl9hcmNsZSB8fCBCUjJfYXJjZWIKKwlkZWZh
dWx0ICJBUk0iICAgICAgICBpZiBCUjJfYXJtIHx8IEJSMl9hcm1lYgorCWRlZmF1bHQgIk1JUFMi
ICAgICAgIGlmIEJSMl9taXBzIHx8IEJSMl9taXBzZWwgfHwgQlIyX21pcHM2NCB8fCBCUjJfbWlw
czY0ZWwKKwlkZWZhdWx0ICJSSVNDVjMyIiAgICBpZiBCUjJfcmlzY3YgJiYgQlIyX1JJU0NWXzMy
CisJZGVmYXVsdCAiUklTQ1Y2NCIgICAgaWYgQlIyX3Jpc2N2ICYmIEJSMl9SSVNDVl82NAorCWRl
ZmF1bHQgIlg4Nl8zMiIgICAgIGlmIEJSMl9pMzg2CisJZGVmYXVsdCAiWDg2XzY0IiAgICAgaWYg
QlIyX3g4Nl82NAorCWRlZmF1bHQgIlhURU5TQSIgICAgIGlmIEJSMl94dGVuc2EKKwogY29uZmln
IEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTV9BUkNIX1NVUFBPUlRTCiAJYm9vbAotCSMgc2Vl
IGxpYi93YXNtLW1pY3JvLXJ1bnRpbWUtV0FNUi0xLjEuMS9SRUFETUUubWQjc3VwcG9ydGVkLWFy
Y2hpdGVjdHVyZXMtYW5kLXBsYXRmb3JtcwotCWRlZmF1bHQgeSBpZiBCUjJfYXJjCi0JZGVmYXVs
dCB5IGlmIEJSMl9hcm0gfHwgQlIyX2FybWViCi0JZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0IHx8
IEJSMl9hYXJjaDY0X2JlCi0JZGVmYXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKLQlk
ZWZhdWx0IHkgaWYgQlIyX1JJU0NWXzY0Ci0JZGVmYXVsdCB5IGlmIEJSMl94dGVuc2EKKwlkZWZh
dWx0IHkgaWYgQlIyX1BBQ0tBR0VfRkxVRU5UX0JJVF9XQVNNX0FSQ0ggIT0gIiIKIAogY29uZmln
IEJSMl9QQUNLQUdFX0ZMVUVOVF9CSVRfV0FTTQogCWJvb2wgIndhc20gcnVudGltZSBzdXBwb3J0
IgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbHVlbnQtYml0L2ZsdWVudC1iaXQubWsgYi9wYWNrYWdl
L2ZsdWVudC1iaXQvZmx1ZW50LWJpdC5tawppbmRleCBjZDhmMzQ3NzY4Li4xMTg1ODYwNjYxIDEw
MDY0NAotLS0gYS9wYWNrYWdlL2ZsdWVudC1iaXQvZmx1ZW50LWJpdC5taworKysgYi9wYWNrYWdl
L2ZsdWVudC1iaXQvZmx1ZW50LWJpdC5tawpAQCAtMjMsNyArMjMsMTcgQEAgRkxVRU5UX0JJVF9D
T05GX09QVFMgKz0gXAogCS1ERkxCX0JBQ0tUUkFDRT1ObwogCiBpZmVxICgkKEJSMl9QQUNLQUdF
X0ZMVUVOVF9CSVRfV0FTTSkseSkKLUZMVUVOVF9CSVRfQ09ORl9PUFRTICs9IC1ERkxCX1dBU009
WWVzCitGTFVFTlRfQklUX1dBTVJfQVJDSCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9G
TFVFTlRfQklUX1dBU01fQVJDSCkpCisKKyMgaHR0cHM6Ly9naXRodWIuY29tL2J5dGVjb2RlYWxs
aWFuY2Uvd2FzbS1taWNyby1ydW50aW1lL2lzc3Vlcy82MjUKKyMgRml4IHVua25vd24gb3Bjb2Rl
ICdsZGMxJywgc2VlbiBvbiBtaXBzMzJyMiBhbmQgbWlwczY0cjIuCitpZmVxICgkKEZMVUVOVF9C
SVRfV0FNUl9BUkNIKSxNSVBTKQorRkxVRU5UX0JJVF9DT05GX09QVFMgKz0gXAorCS1EV0FNUl9C
VUlMRF9JTlZPS0VfTkFUSVZFX0dFTkVSQUw9MQorZW5kaWYKKworRkxVRU5UX0JJVF9DT05GX09Q
VFMgKz0gLURGTEJfV0FTTT1ZZXMgXAorCS1EV0FNUl9CVUlMRF9UQVJHRVQ9JChGTFVFTlRfQklU
X1dBTVJfQVJDSCkKIGVsc2UKIEZMVUVOVF9CSVRfQ09ORl9PUFRTICs9IC1ERkxCX1dBU009Tm8K
IGVuZGlmCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
