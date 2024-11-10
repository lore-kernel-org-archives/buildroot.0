Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73587D12D4B
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C3580D1D;
	Sun, 10 Nov 2024 19:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqUzSRVx2Prc; Sun, 10 Nov 2024 19:37:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F99680D23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F99680D23;
	Sun, 10 Nov 2024 19:37:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 898E46C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 776D880D1D
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id br1g1dhNXLC8 for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 19:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7615F80D23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7615F80D23
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7615F80D23
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 19:37:45 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so14665105ab.2
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 11:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731267464; x=1731872264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZu2vP/gCsgwrvdMcSObZ+NEinU27O1Y7T6efjcgIEI=;
 b=JopsK67cDPpxgcztz5HPDZKL1psFR51mXYy+4rAU5FvHA8oK8R1nMRhUkWGCaFgMeP
 5RdB61CaVQ7G44JamiZXfsiJ7KdIhZDSoUfy/IJWg92dR1EpOjpRPmZc16/EEz4FZQh4
 oKvt/2Tylw23jttwOTBL0WJb0pnIOLvEvzC2TmjfiAXpW+Y+FjCOEJDqJpmgbZVf7x0b
 exDIcyutPNruLy/Tk50Bsqt1FLYGKhdOm9XoWSuzMs9jAZ4vO5wj9ro7ZGkaaL7mBynR
 Zxhzd/MB8MCuydOO0ZMu4LmJT0XhF9tzqET0pROr5Ya4b2BxDdXKMA3xz++Vfk1YjD1y
 fCSg==
X-Gm-Message-State: AOJu0YwI+0MrCC3vteYsQAbxlJGTaEPY6YvqIyCjdRZdHk+AJ/JGJLOh
 lbpmAbCMaBOnUEj7SCUzNZO2RWFG+74vVtwlJIESYGhK9iDPwVpjoAiHRt44
X-Google-Smtp-Source: AGHT+IEA57V0Ep2BOFnr+58jNE5a6ibCwHLEyER1B1Pq8SqwTLX2YHlbsCfC3+/04pWM4xxIz1iZtA==
X-Received: by 2002:a05:6e02:174b:b0:3a6:aea7:b188 with SMTP id
 e9e14a558f8ab-3a6f1a64398mr102611805ab.16.1731267463773; 
 Sun, 10 Nov 2024 11:37:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f987e094sm10352065ab.53.2024.11.10.11.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2024 11:37:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Nov 2024 12:37:33 -0700
Message-Id: <20241110193734.1463141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731267464; x=1731872264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wZu2vP/gCsgwrvdMcSObZ+NEinU27O1Y7T6efjcgIEI=;
 b=MhUVMXWkIbhgUf23TZmNYTXOHHpRZsRD2Xl8JxdEQdc7C0arrWtsCSX67xP8TMVX4A
 lNK/awmhtEkZFhVcqi8yrgcn7BC9YMn0d9SNhLsMkw0nrBdwwLF8VTN/bu5mF18nt0bQ
 YeAC2zIoe/R0FhHS2QUxJUObzid/0ilUUaDid+JhNNmV8lkSpdJfexPZawVTC86Yb77O
 V5sgkBlbKFhG5HgHKC32/AugUDQ7fMC1uCjv3FFSFNdWcbFgvsBMjvgFhu9CKFHUZrns
 vYhmpzFONOyAuS24zgMYFtXQT6Sja/oMKksQ+6LtTgeuM1WgTyU1F1ujN0sfERFhUH6M
 +2Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MhUVMXWk
Subject: [Buildroot] [PATCH v2 1/2] package/libselinux: fix swig 4.3.0
 compatibility
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmFja3BvcnQgYSBwYXRjaCBmaXhpbmcgbGlic2VsaW51eCBzd2lnIDQuMy4wIGNvbXBhdGliaWxp
dHkgZm9yIHRoZQp1cGNvbWluZyBzd2lnIDQuMy4wIHVwZGF0ZS4KClNpZ25lZC1vZmYtYnk6IEph
bWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgotLS0KIC4uLmJzZWxpbnV4
LWZpeC1zd2lnLWJpbmRpbmdzLWZvci00LjMuMC5wYXRjaCB8IDg4ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9saWJzZWxpbnV4LzAwMDMtbGlic2VsaW51eC1maXgtc3dpZy1iaW5kaW5ncy1mb3It
NC4zLjAucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNlbGludXgvMDAwMy1saWJzZWxp
bnV4LWZpeC1zd2lnLWJpbmRpbmdzLWZvci00LjMuMC5wYXRjaCBiL3BhY2thZ2UvbGlic2VsaW51
eC8wMDAzLWxpYnNlbGludXgtZml4LXN3aWctYmluZGluZ3MtZm9yLTQuMy4wLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjU5MjBjMDUxOTYKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL2xpYnNlbGludXgvMDAwMy1saWJzZWxpbnV4LWZpeC1zd2lnLWJpbmRp
bmdzLWZvci00LjMuMC5wYXRjaApAQCAtMCwwICsxLDg4IEBACitGcm9tIDhlMGU3MThiYWU1M2Zm
ZjMwODMxYjkyY2Q3ODQxNTFkNDc1YTIwZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
OiBQZXRyIExhdXRyYmFjaCA8bGF1dHJiYWNoQHJlZGhhdC5jb20+CitEYXRlOiBXZWQsIDE2IE9j
dCAyMDI0IDIwOjQ4OjExICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGxpYnNlbGludXg6IGZpeCBz
d2lnIGJpbmRpbmdzIGZvciA0LjMuMAorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTog
dGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJp
dAorCitodHRwczovL2dpdGh1Yi5jb20vc3dpZy9zd2lnL2Jsb2IvbWFzdGVyL0NIQU5HRVMuY3Vy
cmVudAorCisiW1B5dGhvbl0gIzI5MDcgRml4IHJldHVybmluZyBudWxsIGZyb20gZnVuY3Rpb25z
IHdpdGggb3V0cHV0CitwYXJhbWV0ZXJzLiAgRW5zdXJlcyBPVVRQVVQgYW5kIElOT1VUIHR5cGVt
YXBzIGFyZSBoYW5kbGVkCitjb25zaXN0ZW50bHkgd3J0IHJldHVybiB0eXBlLgorCitOZXcgZGVj
bGFyYXRpb24gb2YgU1dJR19QeXRob25fQXBwZW5kT3V0cHV0IGlzIG5vdzoKKworICBTV0lHX1B5
dGhvbl9BcHBlbmRPdXRwdXQoUHlPYmplY3QqIHJlc3VsdCwgUHlPYmplY3QqIG9iaiwgaW50IGlz
X3ZvaWQpOworCitUaGUgM3JkIHBhcmFtZXRlciBpcyBuZXcgYW5kIHRoZSBuZXcgJGlzdm9pZCBz
cGVjaWFsIHZhcmlhYmxlCitzaG91bGQgYmUgcGFzc2VkIHRvIGl0LCBpbmRpY2F0aW5nIHdoZXRo
ZXIgb3Igbm90IHRoZSB3cmFwcGVkCitmdW5jdGlvbiByZXR1cm5zIHZvaWQuCisKK0Fsc28gY29u
c2lkZXIgcmVwbGFjaW5nIHdpdGg6CisKKyAgU1dJR19BcHBlbmRPdXRwdXQoUHlPYmplY3QqIHJl
c3VsdCwgUHlPYmplY3QqIG9iaik7CisKK3doaWNoIGNhbGxzIFNXSUdfUHl0aG9uX0FwcGVuZE91
dHB1dCB3aXRoIHNhbWUgcGFyYW1ldGVycyBidXQgYWRkaW5nICRpc3ZvaWQKK2ZvciBmaW5hbCBw
YXJhbWV0ZXIuIgorCitGaXhlczogaHR0cHM6Ly9naXRodWIuY29tL1NFTGludXhQcm9qZWN0L3Nl
bGludXgvaXNzdWVzLzQ0NworCisgICAgc2VsaW51eHN3aWdfcHl0aG9uX3dyYXAuYzogSW4gZnVu
Y3Rpb24g4oCYX3dyYXBfc2VjdXJpdHlfY29tcHV0ZV91c2Vy4oCZOgorICAgIHNlbGludXhzd2ln
X3B5dGhvbl93cmFwLmM6MTE0OTk6MTc6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5j
dGlvbiDigJhTV0lHX1B5dGhvbl9BcHBlbmRPdXRwdXTigJkKKyAgICAxMTQ5OSB8ICAgICByZXN1
bHRvYmogPSBTV0lHX1B5dGhvbl9BcHBlbmRPdXRwdXQocmVzdWx0b2JqLCBwbGlzdCk7CisgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CisgICAgc2Vs
aW51eHN3aWdfcHl0aG9uX3dyYXAuYzoxMjQ4OjE6IG5vdGU6IGRlY2xhcmVkIGhlcmUKKyAgICAg
MTI0OCB8IFNXSUdfUHl0aG9uX0FwcGVuZE91dHB1dChQeU9iamVjdCogcmVzdWx0LCBQeU9iamVj
dCogb2JqLCBpbnQgaXNfdm9pZCkgeworICAgICAgICAgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+CisgICAgc2VsaW51eHN3aWdfcHl0aG9uX3dyYXAuYzogSW4gZnVuY3Rpb24g4oCYX3dyYXBf
c2VjdXJpdHlfY29tcHV0ZV91c2VyX3Jhd+KAmToKKyAgICBzZWxpbnV4c3dpZ19weXRob25fd3Jh
cC5jOjExNTcwOjE3OiBlcnJvcjogdG9vIGZldyBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYU1dJ
R19QeXRob25fQXBwZW5kT3V0cHV04oCZCisgICAgMTE1NzAgfCAgICAgcmVzdWx0b2JqID0gU1dJ
R19QeXRob25fQXBwZW5kT3V0cHV0KHJlc3VsdG9iaiwgcGxpc3QpOworICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorICAgIHNlbGludXhzd2lnX3B5
dGhvbl93cmFwLmM6MTI0ODoxOiBub3RlOiBkZWNsYXJlZCBoZXJlCisgICAgIDEyNDggfCBTV0lH
X1B5dGhvbl9BcHBlbmRPdXRwdXQoUHlPYmplY3QqIHJlc3VsdCwgUHlPYmplY3QqIG9iaiwgaW50
IGlzX3ZvaWQpIHsKKyAgICAgICAgICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorICAgIHNl
bGludXhzd2lnX3B5dGhvbl93cmFwLmM6IEluIGZ1bmN0aW9uIOKAmF93cmFwX3NlY3VyaXR5X2dl
dF9ib29sZWFuX25hbWVz4oCZOgorICAgIHNlbGludXhzd2lnX3B5dGhvbl93cmFwLmM6MTI0NzA6
MTc6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhTV0lHX1B5dGhvbl9B
cHBlbmRPdXRwdXTigJkKKyAgICAxMjQ3MCB8ICAgICByZXN1bHRvYmogPSBTV0lHX1B5dGhvbl9B
cHBlbmRPdXRwdXQocmVzdWx0b2JqLCBsaXN0KTsKKyAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KKyAgICBzZWxpbnV4c3dpZ19weXRob25fd3JhcC5j
OjEyNDg6MTogbm90ZTogZGVjbGFyZWQgaGVyZQorICAgICAxMjQ4IHwgU1dJR19QeXRob25fQXBw
ZW5kT3V0cHV0KFB5T2JqZWN0KiByZXN1bHQsIFB5T2JqZWN0KiBvYmosIGludCBpc192b2lkKSB7
CisgICAgICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KKyAgICBlcnJvcjogY29tbWFu
ZCAnL3Vzci9iaW4vZ2NjJyBmYWlsZWQgd2l0aCBleGl0IGNvZGUgMQorCitTdWdnZXN0ZWQtYnk6
IEppdGthIFBsZXNuaWtvdmEgPGpwbGVzbmlrQHJlZGhhdC5jb20+CitTaWduZWQtb2ZmLWJ5OiBQ
ZXRyIExhdXRyYmFjaCA8bGF1dHJiYWNoQHJlZGhhdC5jb20+CitBY2tlZC1ieTogSmFtZXMgQ2Fy
dGVyIDxqd2NhcnQyQGdtYWlsLmNvbT4KK1NpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9T
RUxpbnV4UHJvamVjdC9zZWxpbnV4L2NvbW1pdC84ZTBlNzE4YmFlNTNmZmYzMDgzMWI5MmNkNzg0
MTUxZDQ3NWEyMGRhCistLS0KKyBzcmMvc2VsaW51eHN3aWdfcHl0aG9uLmkgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NlbGludXhzd2lnX3B5dGhvbi5pIGIvc3JjL3NlbGludXhzd2lnX3B5dGhvbi5p
CitpbmRleCAxN2UwM2I5ZS4uMDNlZDI5NmQgMTAwNjQ0CistLS0gYS9zcmMvc2VsaW51eHN3aWdf
cHl0aG9uLmkKKysrKyBiL3NyYy9zZWxpbnV4c3dpZ19weXRob24uaQorQEAgLTcxLDcgKzcxLDcg
QEAgZGVmIGluc3RhbGwoc3JjLCBkZXN0KToKKyAJZm9yIChpID0gMDsgaSA8ICokMjsgaSsrKSB7
CisgCQlQeUxpc3RfU2V0SXRlbShsaXN0LCBpLCBQeVN0cmluZ19Gcm9tU3RyaW5nKCgqJDEpW2ld
KSk7CisgCX0KKy0JJHJlc3VsdCA9IFNXSUdfUHl0aG9uX0FwcGVuZE91dHB1dCgkcmVzdWx0LCBs
aXN0KTsKKysJJHJlc3VsdCA9IFNXSUdfQXBwZW5kT3V0cHV0KCRyZXN1bHQsIGxpc3QpOworIH0K
KyAKKyAvKiByZXR1cm4gYSBzaWQgYWxvbmcgd2l0aCB0aGUgcmVzdWx0ICovCitAQCAtMTA4LDcg
KzEwOCw3IEBAIGRlZiBpbnN0YWxsKHNyYywgZGVzdCk6CisgCQlwbGlzdCA9IFB5TGlzdF9OZXco
MCk7CisgCX0KKyAKKy0JJHJlc3VsdCA9IFNXSUdfUHl0aG9uX0FwcGVuZE91dHB1dCgkcmVzdWx0
LCBwbGlzdCk7CisrCSRyZXN1bHQgPSBTV0lHX0FwcGVuZE91dHB1dCgkcmVzdWx0LCBwbGlzdCk7
CisgfQorIAorIC8qIE1ha2VzIGZ1bmN0aW9ucyBpbiBnZXRfY29udGV4dF9saXN0LmggcmV0dXJu
IGEgUHl0aG9uIGxpc3Qgb2YgY29udGV4dHMgKi8KKy0tIAorMi4zNC4xCisKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
