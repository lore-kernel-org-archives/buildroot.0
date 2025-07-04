Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A53C83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 14:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3648E60F3B;
	Fri,  4 Jul 2025 14:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMGtoFy4hwrN; Fri,  4 Jul 2025 14:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F46B60ED4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F46B60ED4;
	Fri,  4 Jul 2025 14:30:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9906F1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A874409AA
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SS5BZXcFHPaj for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 14:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76AF34098F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AF34098F
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76AF34098F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 14:30:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60cc11b34f6so3433306a12.0
 for <buildroot@buildroot.org>; Fri, 04 Jul 2025 07:30:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639443; x=1752244243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIGw8hwPBEtZwTnSaIxlGLV9J5CIDyltLKzYMmM6mnQ=;
 b=nhL5OH7DDCt7uKqY/0JnwAbD47do7mmPiPhyqksV5TMU1GjBUpoKrY87Kz5YMcDq2v
 jrV/e7fov5PTLDPehm0zH8O+wvYpjwOVPVuASKFoqOqa+jJcWFQq7BAXYIYhX8Psg/Q4
 KeTxyjY+FY38jx2yBHcuCwSRfTTQjgmAwMsCaXpwGcPfZaPCygAwVCYxD+2QrQ45EGzN
 I+eDp80KB0AxtGcRck1lEwiUiv706mxwHxR58j/j1WOixDTnZkvCL6iTqQbTpRChDzzq
 td/YD646cVmJVeVMHvxRgEtZ4R+fqscPMKv9jcpyEJqr+fF7Q9mzqbcVzLQz/8dB/f5C
 09tQ==
X-Gm-Message-State: AOJu0YxcKsLsxMzZ+oggLnfP3xwYFJ5Fs0NoVF5zHbV9PcAybD/OWAx9
 i4JPLvvab9cg5NA44gxH6LbkzflXOGLPsfseix3BF8PUkoVHcRrFMXoIM4OOAr2jSq4SN+E7/ZE
 ThJwCdi8=
X-Gm-Gg: ASbGncvfb51NOR9CNLOXA+vlo8qwarvAYjDa8ibM7mqjTO8k28fYO233sdMAmneRF8M
 pxEtFiMSB6aFUjFrDZqKVXTwSrsiTCsafEiCDMmynLefy7S+S7HeGQzB9IOJ5e1JiYnP+z0k8AO
 P7cq3O5EAEIfyb6FkDuNwASyWDhOKF7SOvHBtL+jNe1Ug6ZbWbQzmxEq2HWeyY8L5KJ8Fj33IyO
 drmp9xfSs2OjIXIQTMhp6Mjui4HEXFH/SMMVMmy7JsIM1Lx8/tkeazuGbQweYE6AYjlHBByqjtz
 oFqH0nlvvLFU4IdxlRtxcciIgi3Db7G0uHi2VcZl7BsnxBmpnHVYsolUbdH5svZJ8w==
X-Google-Smtp-Source: AGHT+IFLRoZVKBoc1QGhYDwiFj0KEPxxWK40qJlv8IGPm6KAh437ZeELNnvlSkSt+yrmPScLsIJM3g==
X-Received: by 2002:a17:907:fd89:b0:ae3:bd94:2a0d with SMTP id
 a640c23a62f3a-ae3f801e360mr379009166b.6.1751639442568; 
 Fri, 04 Jul 2025 07:30:42 -0700 (PDT)
Received: from TimMind.home ([2a02:a03f:65ae:b800:1718:12a8:2587:721f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f66d93c8sm184954066b.11.2025.07.04.07.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:30:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Jul 2025 16:30:41 +0200
Message-Id: <20250704143041.921541-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751639443; x=1752244243; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kIGw8hwPBEtZwTnSaIxlGLV9J5CIDyltLKzYMmM6mnQ=;
 b=cPiDHoK1Zf5zLrOaU3FkMtEZhR26D/K1lZFhivMo0/qctK4JsL4Otey9mBMNePzSWh
 hkUrmG3klaaG42xke7Us/yH3MFdMRMz1vTmi4GWRoJidcHiGHP91ZI4sc3iWbL9nrXPW
 SqSqy0LKIHE/ReZKVkf/gJg4yR8KxeqwQt3Jej6uib52++/R7LnSo+Cp6shIdR0VxEF8
 OetdtjgD/OpMI1ap90eCrEMydsk2wfSD5D1FcjMLbtp3dKWuJuxmnzvzwIjr+WmszmEe
 Y5YF7jiulRGQOIV6yD8450DFMCqBmy6uebg1fep3sA80DEOxg5sBKo/0Cb6Rq31KCKyY
 r4/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cPiDHoK1
Subject: [Buildroot] [2025.02.x PATCH 1/1] package/libglib2: fix
 CVE-2025-6052
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVpbGRyb290IExUUyAyMDI1LjAyLnggdXRpbGlzZXMgbGliZ2xpYjIgdmVyc2lvbiAyLjgyLjUg
d2hpY2ggaXMgcHJvbmUKdG8gQ1ZFLTIwMjUtNjA1MiBbMV0uCjAwMDEtZ3N0cmluZy1GaXgtb3Zl
cmZsb3ctY2hlY2std2hlbi1leHBhbmRpbmctdGhlLXN0cmluZy5wYXRjaCBpcwppbmNsdWRlZCBp
biB0aGUgcGFja2FnZS9saWJnbGliMiBkaXJlY3RvcnkuIFRoaXMgcGF0Y2ggbWl0aWdhdGVzCkNW
RS0yMDI1LTYwNTIgYXMgc2VlbiBpbiBbMV0sIGJ5IGJhY2twb3J0aW5nIHRvIGxpYmdsaWIyIDIu
ODIuNS4KbGliZ2xpYjIgc2hhcmVzIHBhcnQgb2YgaXRzIGluZnJhc3RydWN0dXJlIHdpdGggbGli
Z2xpYjItYm9vdHN0cmFwLApieSBhZGRpbmcgdGhlIHBhdGNoIGluIHBhY2thZ2UvbGliZ2xpYjIg
dGhlIHBhdGNoIGlzbid0IGFwcGxpZWQgdG8KbGliZ2xpYjItYm9vdHN0cmFwLgoKWzFdIGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvNDY1NS9kaWZm
cwpbMl0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUtNjA1MgoKU2ln
bmVkLW9mZi1ieTogVGltIFNvdWJyeSA8dGltLnNvdWJyeUBtaW5kLmJlPgotLS0KIC4uLmZsb3ct
Y2hlY2std2hlbi1leHBhbmRpbmctdGhlLXN0cmluZy5wYXRjaCB8IDcxICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9saWJnbGliMi8wMDAxLWdzdHJpbmctRml4LW92ZXJmbG93LWNoZWNrLXdoZW4t
ZXhwYW5kaW5nLXRoZS1zdHJpbmcucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdsaWIy
LzAwMDEtZ3N0cmluZy1GaXgtb3ZlcmZsb3ctY2hlY2std2hlbi1leHBhbmRpbmctdGhlLXN0cmlu
Zy5wYXRjaCBiL3BhY2thZ2UvbGliZ2xpYjIvMDAwMS1nc3RyaW5nLUZpeC1vdmVyZmxvdy1jaGVj
ay13aGVuLWV4cGFuZGluZy10aGUtc3RyaW5nLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjQ0N2I2NTQ3ODAKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xp
YmdsaWIyLzAwMDEtZ3N0cmluZy1GaXgtb3ZlcmZsb3ctY2hlY2std2hlbi1leHBhbmRpbmctdGhl
LXN0cmluZy5wYXRjaApAQCAtMCwwICsxLDcxIEBACitGcm9tIDljNDAzZjc4N2VlZTY5YmU4NTBi
YTVmOTIzNDhlY2VhNjVmOWJhZGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQaGls
aXAgV2l0aG5hbGwgPHB3aXRobmFsbEBnbm9tZS5vcmc+CitEYXRlOiBUdWUsIDMgSnVuIDIwMjUg
MTE6MzE6MDQgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSCAxLzFdIGdzdHJpbmc6IEZpeCBvdmVyZmxv
dyBjaGVjayB3aGVuIGV4cGFuZGluZyB0aGUgc3RyaW5nCitNSU1FLVZlcnNpb246IDEuMAorQ29u
dGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVu
Y29kaW5nOiA4Yml0CisKK0FmdGVyIGNvbW1pdCAzNGI3OTkyZmQ2ZTM4OTRiZjZkMjIyOWI4YWE1
OWNhYzM0YmNiMWI1IHRoZSBvdmVyZmxvdyBjaGVjaword2FzIG9ubHkgZG9uZSB3aGVuIGV4cGFu
ZGluZyB0aGUgc3RyaW5nLCBidXQgd2UgbmVlZCB0byBkbyBpdCBiZWZvcmUKK2NoZWNraW5nIHdo
ZXRoZXIgdG8gZXhwYW5kIHRoZSBzdHJpbmcsIG90aGVyd2lzZSB0aGF0IGNhbGN1bGF0aW9uIGNv
dWxkCitvdmVyZmxvdyBhbmQgZmFsc2VseSBkZWNpZGUgdGhhdCB0aGUgc3RyaW5nIGlzIGJpZyBl
bm91Z2ggYWxyZWFkeS4KKworQXMgYSBjb25jcmV0ZSBleGFtcGxlLCBjb25zaWRlciBhIGBHU3Ry
aW5nYCB3aGljaCBoYXM6CisgKiBgLmxlbiA9IEdfTUFYU0laRSAvIDIgKyAxYAorICogYC5hbGxv
Y2F0ZWRfbGVuID0gR19NQVhTSVpFIC8gMiArIDFgCithbmQgYGdfc3RyaW5nX2FwcGVuZCgpYCBp
cyBjYWxsZWQgb24gaXQgd2l0aCBhbiBpbnB1dCBzdHJpbmcgb2YgbGVuZ3RoCitgR19NQVhTSVpF
IC8gMmAuCisKK1RoaXMgcmVzdWx0cyBpbiBhIGNhbGwgYGdfc3RyaW5nX21heWJlX2V4cGFuZCAo
c3RyaW5nLCBHX01BWFNJWkUgLyAyKWAsCit3aGljaCBjYWxjdWxhdGVzIGBzdHJpbmctPmxlbiAr
IGxlbmAgYXMgYChHX01BWFNJWkUgLyAyICsgMSkgKworKEdfTUFYU0laRSAvIDIpYCB3aGljaCBl
dmFsdWF0ZXMgdG8gYDFgIGFzIGl0IG92ZXJmbG93cy4gVGhpcyBpcyBub3QKK2dyZWF0ZXIgdGhh
biBgc3RyaW5nLT5hbGxvY2F0ZWRfbGVuYCAod2hpY2ggaXMgYEdfTUFYU0laRSAvIDIgKyAxYCks
IHNvCitgZ19zdHJpbmdfZXhwYW5kKClgIGlzICpub3QqIGNhbGxlZCwgYW5kIGBnX3N0cmluZ19t
YXliZV9leHBhbmQoKWAKK3JldHVybnMgc3VjY2Vzc2Z1bGx5LiBUaGUgY2FsbGVyIHRoZW4gYXNz
dW1lcyB0aGF0IHRoZXJl4oCZcyBlbm91Z2ggc3BhY2UKK2luIHRoZSBidWZmZXIsIGFuZCBoYXBw
aWx5IGNvbnRpbnVlcyB0byBjYXVzZSBhIGJ1ZmZlciBvdmVyZmxvdy4KKworSXTigJlzIHVubGlr
ZWx5IGFueW9uZSBjb3VsZCBoaXQgdGhpcyBpbiBwcmFjdGljZSBiZWNhdXNlIGl0IHJlcXVpcmVz
CitsdWRpY3JvdXNseSBiaWcgc3RyaW5ncyBhbmQgYEdTdHJpbmdgIGFsbG9jYXRpb25zLCB3aGlj
aCBsaWtlbHkgd291bGQKK2hhdmUgYmVlbiBibG9ja2VkIGJ5IG90aGVyIGNvZGUsIGJ1dCBpZiB3
ZeKAmXJlIGdvaW5nIHRvIGhhdmUgdGhlIG92ZXJmbG93CitjaGVja3MgaW4gYEdTdHJpbmdgIHRo
ZW4gdGhleSBzaG91bGQgYmUgZWZmZWN0aXZlLgorCitTcG90dGVkIGJ5IGNvZGUgaW5zcGVjdGlv
bi4KKworU2lnbmVkLW9mZi1ieTogUGhpbGlwIFdpdGhuYWxsIDxwd2l0aG5hbGxAZ25vbWUub3Jn
PgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vbWVyZ2Vf
cmVxdWVzdHMvNDY1NS9kaWZmcworQ1ZFOiBDVkUtMjAyNS02MDUyCitTaWduZWQtb2ZmLWJ5OiBU
aW0gU291YnJ5IDx0aW0uc291YnJ5QG1pbmQuYmU+CistLS0KKyBnbGliL2dzdHJpbmcuYyB8IDgg
KysrKy0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvZ2xpYi9nc3RyaW5nLmMgYi9nbGliL2dzdHJpbmcuYworaW5kZXgg
YmRkMDY4MzQ0Li40NWE2ZjY4YjEgMTAwNjQ0CistLS0gYS9nbGliL2dzdHJpbmcuYworKysrIGIv
Z2xpYi9nc3RyaW5nLmMKK0BAIC02OCwxMCArNjgsNiBAQCBzdGF0aWMgdm9pZAorIGdfc3RyaW5n
X2V4cGFuZCAoR1N0cmluZyAqc3RyaW5nLAorICAgICAgICAgICAgICAgICAgZ3NpemUgICAgbGVu
KQorIHsKKy0gIC8qIERldGVjdCBwb3RlbnRpYWwgb3ZlcmZsb3cgKi8KKy0gIGlmIEdfVU5MSUtF
TFkgKChHX01BWFNJWkUgLSBzdHJpbmctPmxlbiAtIDEpIDwgbGVuKQorLSAgICBnX2Vycm9yICgi
YWRkaW5nICUiIEdfR1NJWkVfRk9STUFUICIgdG8gc3RyaW5nIHdvdWxkIG92ZXJmbG93IiwgbGVu
KTsKKy0KKyAgIHN0cmluZy0+YWxsb2NhdGVkX2xlbiA9IGdfbmVhcmVzdF9wb3cgKHN0cmluZy0+
bGVuICsgbGVuICsgMSk7CisgICAvKiBJZiB0aGUgbmV3IHNpemUgaXMgYmlnZ2VyIHRoYW4gR19N
QVhTSVpFIC8gMiwgb25seSBhbGxvY2F0ZSBlbm91Z2gKKyAgICAqIG1lbW9yeSBmb3IgdGhpcyBz
dHJpbmcgYW5kIGRvbid0IG92ZXItYWxsb2NhdGUuCitAQCAtODYsNiArODIsMTAgQEAgc3RhdGlj
IGlubGluZSB2b2lkCisgZ19zdHJpbmdfbWF5YmVfZXhwYW5kIChHU3RyaW5nICpzdHJpbmcsCisg
ICAgICAgICAgICAgICAgICAgICAgICBnc2l6ZSAgICBsZW4pCisgeworKyAgLyogRGV0ZWN0IHBv
dGVudGlhbCBvdmVyZmxvdyAqLworKyAgaWYgR19VTkxJS0VMWSAoKEdfTUFYU0laRSAtIHN0cmlu
Zy0+bGVuIC0gMSkgPCBsZW4pCisrICAgIGdfZXJyb3IgKCJhZGRpbmcgJSIgR19HU0laRV9GT1JN
QVQgIiB0byBzdHJpbmcgd291bGQgb3ZlcmZsb3ciLCBsZW4pOworKworICAgaWYgKEdfVU5MSUtF
TFkgKHN0cmluZy0+bGVuICsgbGVuID49IHN0cmluZy0+YWxsb2NhdGVkX2xlbikpCisgICAgIGdf
c3RyaW5nX2V4cGFuZCAoc3RyaW5nLCBsZW4pOworIH0KKy0tIAorMi4zOS41CisKLS0gCjIuMzku
NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
