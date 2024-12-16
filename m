Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAF5E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 17:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF044080E;
	Mon, 16 Dec 2024 17:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TALnDuNnWa3F; Mon, 16 Dec 2024 17:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9A1E40804
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9A1E40804;
	Mon, 16 Dec 2024 17:48:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B46AC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 17:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3912140116
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 17:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObmK3NmNZWWR for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 17:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9402840183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9402840183
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9402840183
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 17:48:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A69E240004;
 Mon, 16 Dec 2024 17:48:50 +0000 (UTC)
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 16 Dec 2024 18:48:29 +0100
MIME-Version: 1.0
Message-Id: <20241216-fix_gcc14_libsha1-v2-1-ceb3588e6866@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOxnYGcC/32NUQ6CMBBEr0L22xq2Fqt8eQ9DSLsWuglS0xKiI
 b27lQP4+SYzbzZILrJL0FYbRLdy4jAXkIcKyJt5dIIfhUHWUqFEFAO/+5EIVT+xTd6gUPpkmqF
 RtTMWyu4VXSntzntX2HNaQvzsFyv+0n+2FQUKup6V1nghInmzISwTz0cKT+hyzl9VKmCftAAAA
 A==
X-Change-ID: 20241211-fix_gcc14_libsha1-473a5f540eab
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734371330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qW6kpXSo+fLPmH+zLkX8EiJBqt0PRrWlvqWejWVkxGw=;
 b=JVLMpFeojafHwTKw9BkxdKJc37gsLQWP3LDiPxlhmaESYdF1ulE3NYXykuTWTjZdo6fbPz
 dM9O7HVuZpyObS/O4jQN/Nva8o4YK4P4XzzQGF070V5p42Wxlgn/XFYGD93yGTCdAOl4m2
 IGwZ5Sek5BdIAyCoq6jWIvToU8+9U/6UyEq8VOxb/UPSQPCF+s0n8egyz2kgVvUFVBg7iF
 T221Fmd6YKymLCYjCf4sPYRCAMsDEC+EQnwofTaIoCn0S8oQOUpeqd0lBAw/Tvn2OOYxMy
 G77a0cZegs5aRS26nXKzq6iI5BnFw+X/h0HmNrDJBUkulVmMDfVJHvPK5Y/yag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVLMpFeo
Subject: [Buildroot] [PATCH v2] package/libsha1: Fix gcc14 compilation in
 libsha1
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

R0NDMTQgcmVtb3ZlZCB0aGUgaW1wbGljaXQgaW50IHN1cHBvcnQuClRoaXMgY29tbWl0IGFkZHMg
YSBwYXRjaCB0byBsaWJzaGExIHRvIGZpeCBhbiBpbXBsaWNpdCBpbnQgZGVjbGFyYXRpb24KYXMg
cmVjb21tZW5kZWQuCgpMaW5rOiBodHRwczovL2djYy5nbnUub3JnL2djYy0xNC9wb3J0aW5nX3Rv
Lmh0bWwKCkZpeGVzOgogICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
ODdkYzliYTk2OTBjYmI2YTgyODc1NzM0Y2U5Y2I4ZGJhZjg3OGU0Ni8KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBib290bGluLmNvbT4KLS0tCkNo
YW5nZXMgaW4gdjI6Ci0gUmVnZW5lcmF0ZSB0aGUgcGF0Y2guCi0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIxMS1maXhfZ2NjMTRfbGlic2hhMS12MS0xLWM5NjQ3
NzE4Y2NjMkBib290bGluLmNvbQotLS0KIC4uLjAxLXRlc3QtZml4LWdjYy0xNC54LWNvbXBpbGUt
aW1wbGljaXQtaW50LnBhdGNoIHwgMzggKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNoYTEvMDAw
MS10ZXN0LWZpeC1nY2MtMTQueC1jb21waWxlLWltcGxpY2l0LWludC5wYXRjaCBiL3BhY2thZ2Uv
bGlic2hhMS8wMDAxLXRlc3QtZml4LWdjYy0xNC54LWNvbXBpbGUtaW1wbGljaXQtaW50LnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAuLjQ1NTA5NDVlMDBlZTFiYzkwOWNmNjcwMjAyYTk5ZWEzNGJjNDFkOTAKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYnNoYTEvMDAwMS10ZXN0LWZpeC1nY2MtMTQueC1j
b21waWxlLWltcGxpY2l0LWludC5wYXRjaApAQCAtMCwwICsxLDM4IEBACitGcm9tIGQ0NDlmMjZm
NzgyYmU5MWIzODQ3Zjg4ZWQyYmQ5Mzc1ODJhNTc1YjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CitEYXRlOiBTdW4sIDI1
IEF1ZyAyMDI0IDExOjMzOjU5ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIHRlc3Q6IGZpeCBnY2Mt
MTQueCBjb21waWxlIChpbXBsaWNpdCBpbnQpCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5n
OiA4Yml0CisKK0ZpeGVzOgorCisgIHRlc3QuYzoxNDo4OiBlcnJvcjogdHlwZSBkZWZhdWx0cyB0
byDigJhpbnTigJkgaW4gZGVjbGFyYXRpb24gb2Yg4oCYbnVtX3Rlc3TigJkgWy1XaW1wbGljaXQt
aW50XQorICAgICAxNCB8IHN0YXRpYyBudW1fdGVzdDsKKyAgICAgICAgfCAgICAgICAgXn5+fn5+
fn4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9wc2VpZGVyZXIvbGlic2hhMS9jb21t
aXQvZDQ0OWYyNmY3ODJiZTkxYjM4NDdmODhlZDJiZDkzNzU4MmE1NzViNgorCitTaWduZWQtb2Zm
LWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CitTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9vdGxpbi5jb20+CistLS0KKyB0
ZXN0LmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCisKK2RpZmYgLS1naXQgYS90ZXN0LmMgYi90ZXN0LmMKK2luZGV4IDIxYTY1MjUuLjFlYzg5
ZDMgMTAwNjQ0CistLS0gYS90ZXN0LmMKKysrKyBiL3Rlc3QuYworQEAgLTExLDcgKzExLDcgQEAg
c3RhdGljIHZvaWQgcHJpbnRfaGV4KGNvbnN0IGNoYXIqIGRhdGEsIHNpemVfdCBzaXplKQorICAg
ICAgICAgcHJpbnRmKCIleCV4IiwgKCh1bnNpZ25lZCBjaGFyKWRhdGFbaV0pLzE2LCAoKHVuc2ln
bmVkIGNoYXIpZGF0YVtpXSklMTYpOworIH0KKyAKKy1zdGF0aWMgbnVtX3Rlc3Q7Cisrc3RhdGlj
IGludCBudW1fdGVzdDsKKyAKKyBzdGF0aWMgaW50IGRvX3Rlc3QoY29uc3QgY2hhciogZGF0YSwg
c2l6ZV90IHNpemUsIGNvbnN0IGNoYXIqIGV4cGVjdGVkX2Rnc3QpCisgeworLS0gCisyLjQ3LjEK
KwoKLS0tCmJhc2UtY29tbWl0OiBlZmM3YTIwZDVlZjEwOWEzMmM0MjM3ZWFmOTA3ZjY4NTk2OGQz
YzQ0CmNoYW5nZS1pZDogMjAyNDEyMTEtZml4X2djYzE0X2xpYnNoYTEtNDczYTVmNTQwZWFiCgpC
ZXN0IHJlZ2FyZHMsCi0tIApUaG9tYXMgQm9ubmVmaWxsZSA8dGhvbWFzLmJvbm5lZmlsbGVAYm9v
dGxpbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
