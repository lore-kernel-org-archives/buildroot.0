Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583FACA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 17:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D408183DB6;
	Sat, 23 Aug 2025 17:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhzdwQPs1I1q; Sat, 23 Aug 2025 17:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13BE183C66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BE183C66;
	Sat, 23 Aug 2025 17:06:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F9119C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E07041382
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h80BWOgjsy3H for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 17:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6808341378
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6808341378
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6808341378
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E15D2C6B39F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7E5E606A7
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:05:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2D6F51C22D714; 
 Sat, 23 Aug 2025 19:05:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Aug 2025 19:05:44 +0200
Message-ID: <20250823170545.59420-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
References: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755968753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=q1VKURLneByCgjbHtdTdS/1/AU83O6IhCRha/yRwVpo=;
 b=XVoz9RW2qQIbI9Y1PQicO1blK1bkcnGIE7unztYJivifh728IiDDqbcNzjl7wOZ/aqPQVt
 O+J74d7ONMd6doqHDIESsmu+Tr/ogvG5AnIiG/h0deelT23WZjTneFirlEEEcqaorBVBGC
 6W7PB0W2ne9l0h/qqtqA46v7uZuFCz/5wo7T0D7m4u/MWagLTv6AJkUJxwRvZNnowDegD1
 y+3ncBnmKCHsa+1g4iOqHd5JRvsbYVPmcBqhw4Ky0xmlY0d2Pke8LYLx1wApGVoR40HxOZ
 WkWJ3Qz+9nGlQfAv4E7frGfg5/FT0KhZTdXDr0juXKBRwjhLaSRM8vXupiDN0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XVoz9RW2
Subject: [Buildroot] [PATCH 2/2] package/sdl: fix build with GCC 15.x with
 X.org support enabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBidWlsZGluZzoKCiBCUjJfYXJtPXkKIEJSMl9jb3J0ZXhfYTk9eQogQlIyX0FSTV9FTkFC
TEVfVkZQPXkKIEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQogQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOPXkKIEJSMl9JTklUX05PTkU9eQogQlIyX1NZU1RFTV9CSU5fU0hfTk9ORT15CiAj
IEJSMl9QQUNLQUdFX0JVU1lCT1ggaXMgbm90IHNldAogQlIyX1BBQ0tBR0VfU0RMPXkKIEJSMl9Q
QUNLQUdFX1NETF9YMTE9eQogQlIyX1BBQ0tBR0VfWE9SRzc9eQogIyBCUjJfVEFSR0VUX1JPT1RG
U19UQVIgaXMgbm90IHNldAoKdGhlIGJ1aWxkIGZhaWxzIHdpdGg6CgouL3NyYy92aWRlby9YZXh0
L1h2L1h2LmM6Nzg6NTogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGludCAoKikoRGlzcGxh
eSAqLCBYRXZlbnQgKiwgeEV2ZW50ICop4oCZIHtha2Eg4oCYaW50ICgqKShEaXNwbGF5ICosIFhF
dmVudCAqLCBzdHJ1Y3QgX3hFdmVudCAqKeKAmX0gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0
eXBlIOKAmGludCAoKikodm9pZCnigJkgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCgph
bmQgYSBudW1iZXIgb2Ygc2ltaWxhciBlcnJvcnMgaW4gdGhlIFgub3JnIGNvZGUuCgpXZSBmaXgg
dGhpcyBieSBiYWNrcG9ydGluZyBhbiB1cHN0cmVhbSBjb21taXQuCgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIC4uLmlv
bi1kZWNsYXJhdGlvbnMtd2l0aG91dC1hLXByb3RvdHlwZS5wYXRjaCB8IDY2ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9zZGwvMDAwMy1YZXh0LUZpeC1mdW5jdGlvbi1kZWNsYXJhdGlvbnMtd2l0
aG91dC1hLXByb3RvdHlwZS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2RsLzAwMDMtWGV4
dC1GaXgtZnVuY3Rpb24tZGVjbGFyYXRpb25zLXdpdGhvdXQtYS1wcm90b3R5cGUucGF0Y2ggYi9w
YWNrYWdlL3NkbC8wMDAzLVhleHQtRml4LWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy13aXRob3V0LWEt
cHJvdG90eXBlLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmNj
Y2MwNDY0YmIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3NkbC8wMDAzLVhleHQtRml4LWZ1
bmN0aW9uLWRlY2xhcmF0aW9ucy13aXRob3V0LWEtcHJvdG90eXBlLnBhdGNoCkBAIC0wLDAgKzEs
NjYgQEAKK0Zyb20gNmZiNWFhZGFmYzlkOTljMjVmYjRmMWEzN2QyMjVkNWI3OWJjOTJlOSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IG9yYmVhIDxvcmJlYUByaXNldXAubmV0PgorRGF0
ZTogU2F0LCAxNSBPY3QgMjAyMiAxNToxMDo0OCAtMDcwMAorU3ViamVjdDogW1BBVENIXSBYZXh0
OiBGaXggZnVuY3Rpb24gZGVjbGFyYXRpb25zIHdpdGhvdXQgYSBwcm90b3R5cGUKKworVGhpcyBp
cyBub3Qgc3VwcG9ydGVkIHdpdGggdGhlIHVwY29taW5nIGNsYW5nIDE2LgorCitlcnJvcjogYSBm
dW5jdGlvbiBkZWNsYXJhdGlvbiB3aXRob3V0IGEgcHJvdG90eXBlIGlzIGRlcHJlY2F0ZWQgaW4g
YWxsIHZlcnNpb25zIG9mIEMgYW5kIGlzIHRyZWF0ZWQgYXMgYSB6ZXJvLXBhcmFtZXRlciBwcm90
b3R5cGUgaW4gQzJ4LCBjb25mbGljdGluZyB3aXRoIGEgc3Vic2VxdWVudCBkZWZpbml0aW9uIFst
V2Vycm9yLC1XZGVwcmVjYXRlZC1ub24tcHJvdG90eXBlXQorCityZWZlcmVuY2U6IGh0dHBzOi8v
YXJjaGl2ZXMuZ2VudG9vLm9yZy9nZW50b28tZGV2L21lc3NhZ2UvZGQ5ZjJkMzA4MmI4YjZmOGRm
YmNjYjA2MzllNmUyNDAKKworVXBzdHJlYW06IGU3MzhjZmZmY2VkOGEwMDYwOTRkNTUzMzdkOTE3
Mzg2NTgyYWRhNDcKK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRh
enpvbmlAYm9vdGxpbi5jb20+CistLS0KKyBzcmMvdmlkZW8vWGV4dC9YTUUveG1lLmMgICAgICAg
ICAgIHwgMiArLQorIHNyYy92aWRlby9YZXh0L1hpbmVyYW1hL1hpbmVyYW1hLmMgfCAzICsrLQor
IHNyYy92aWRlby9YZXh0L1h2L1h2LmMgICAgICAgICAgICAgfCA2ICsrKy0tLQorIDMgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
c3JjL3ZpZGVvL1hleHQvWE1FL3htZS5jIGIvc3JjL3ZpZGVvL1hleHQvWE1FL3htZS5jCitpbmRl
eCAyY2VhZDM1YS4uYmI4ZDA0ZDQgMTAwNjQ0CistLS0gYS9zcmMvdmlkZW8vWGV4dC9YTUUveG1l
LmMKKysrKyBiL3NyYy92aWRlby9YZXh0L1hNRS94bWUuYworQEAgLTIwNiw3ICsyMDYsNyBAQCBz
dGF0aWMgY2hhciAqeGlnbWlzY19leHRlbnNpb25fbmFtZSA9IFhJR01JU0NfUFJPVE9DT0xfTkFN
RTsKKyAvKgorICAqIGZpbmRfZGlzcGxheSAtIGxvY2F0ZSB0aGUgZGlzcGxheSBpbmZvIGJsb2Nr
CisgICovCistc3RhdGljIGludCBYaUdNaXNjQ2xvc2VEaXNwbGF5KCk7Cisrc3RhdGljIGludCBY
aUdNaXNjQ2xvc2VEaXNwbGF5KERpc3BsYXkqLCBYRXh0Q29kZXMqKTsKKyAKKyBzdGF0aWMgWEV4
dGVuc2lvbkhvb2tzIHhpZ21pc2NfZXh0ZW5zaW9uX2hvb2tzID0geworICAgICBOVUxMLCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBjcmVhdGVfZ2MgKi8KK2RpZmYgLS1naXQgYS9z
cmMvdmlkZW8vWGV4dC9YaW5lcmFtYS9YaW5lcmFtYS5jIGIvc3JjL3ZpZGVvL1hleHQvWGluZXJh
bWEvWGluZXJhbWEuYworaW5kZXggNGZmNDJlYmYuLjU3ZjY0YjljIDEwMDY0NAorLS0tIGEvc3Jj
L3ZpZGVvL1hleHQvWGluZXJhbWEvWGluZXJhbWEuYworKysrIGIvc3JjL3ZpZGVvL1hleHQvWGlu
ZXJhbWEvWGluZXJhbWEuYworQEAgLTUwLDcgKzUwLDggQEAgc3RhdGljIC8qIGNvbnN0ICovIGNo
YXIgKnBhbm9yYW1pWF9leHRlbnNpb25fbmFtZSA9IFBBTk9SQU1JWF9QUk9UT0NPTF9OQU1FOwor
ICNkZWZpbmUgUGFub3JhbWlYU2ltcGxlQ2hlY2tFeHRlbnNpb24oZHB5LGkpIFwKKyAgIFhleHRT
aW1wbGVDaGVja0V4dGVuc2lvbiAoZHB5LCBpLCBwYW5vcmFtaVhfZXh0ZW5zaW9uX25hbWUpCisg
Cistc3RhdGljIGludCBjbG9zZV9kaXNwbGF5KCk7Cisrc3RhdGljIGludCBjbG9zZV9kaXNwbGF5
KERpc3BsYXkqLCBYRXh0Q29kZXMqKTsKKysKKyBzdGF0aWMgLyogY29uc3QgKi8gWEV4dGVuc2lv
bkhvb2tzIHBhbm9yYW1pWF9leHRlbnNpb25faG9va3MgPSB7CisgICAgIE5VTEwsCQkJCS8qIGNy
ZWF0ZV9nYyAqLworICAgICBOVUxMLAkJCQkvKiBjb3B5X2djICovCitkaWZmIC0tZ2l0IGEvc3Jj
L3ZpZGVvL1hleHQvWHYvWHYuYyBiL3NyYy92aWRlby9YZXh0L1h2L1h2LmMKK2luZGV4IDcxNDdi
OWU4Li5jMjU0YTFkYyAxMDA2NDQKKy0tLSBhL3NyYy92aWRlby9YZXh0L1h2L1h2LmMKKysrKyBi
L3NyYy92aWRlby9YZXh0L1h2L1h2LmMKK0BAIC02Myw5ICs2Myw5IEBAIHN0YXRpYyBjaGFyICp4
dl9leHRlbnNpb25fbmFtZSA9IFh2TmFtZTsKKyAjZGVmaW5lIFh2Q2hlY2tFeHRlbnNpb24oZHB5
LCBpLCB2YWwpIFwKKyAgIFhleHRDaGVja0V4dGVuc2lvbihkcHksIGksIHh2X2V4dGVuc2lvbl9u
YW1lLCB2YWwpCisgCistc3RhdGljIGNoYXIgKnh2X2Vycm9yX3N0cmluZygpOworLXN0YXRpYyBp
bnQgeHZfY2xvc2VfZGlzcGxheSgpOworLXN0YXRpYyBCb29sIHh2X3dpcmVfdG9fZXZlbnQoKTsK
KytzdGF0aWMgY2hhciAqeHZfZXJyb3Jfc3RyaW5nKERpc3BsYXkqLCBpbnQsIFhFeHRDb2Rlcyos
IGNoYXIqLCBpbnQpOworK3N0YXRpYyBpbnQgeHZfY2xvc2VfZGlzcGxheShEaXNwbGF5KiwgWEV4
dENvZGVzKik7Cisrc3RhdGljIEJvb2wgeHZfd2lyZV90b19ldmVudChEaXNwbGF5KiwgWEV2ZW50
KiwgeEV2ZW50Kik7CisgCisgc3RhdGljIFhFeHRlbnNpb25Ib29rcyB4dl9leHRlbnNpb25faG9v
a3MgPSB7CisgICAgIE5VTEwsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGNyZWF0
ZV9nYyAqLworLS0gCisyLjUwLjEKKwotLSAKMi41MC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
