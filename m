Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3387C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 07:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4339C40A31;
	Tue,  8 Jul 2025 07:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4b00af4mbhy1; Tue,  8 Jul 2025 07:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440FB40A0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440FB40A0B;
	Tue,  8 Jul 2025 07:39:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BC512E
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 07:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC8FA60A61
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 07:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ySqbDdWbz-y for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 07:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5181E608CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5181E608CE
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5181E608CE
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 07:39:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ae0d7b32322so617029966b.2
 for <buildroot@buildroot.org>; Tue, 08 Jul 2025 00:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960376; x=1752565176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utrs5dK4O5bVD/AtFlRJ8PagNyqgB0qLVeEZcVgwbpA=;
 b=a8U2+05YJqDvoSGSszG4I11ZLjUeYmgVuZTFuIGlvp4HTbB/IqPYliZdHjJLG0yXNi
 av0i9sD8KGJ474KgurveLT5K06VnQxBGf5Covpgr7lWml5A9kxZN1rpPkuPcVYyRP/+F
 vJwi2ixhMgfBvVlp7vGaCy2g10wlVxhcwdLsCW+ES4o9Uk+VHlQQBLYbg3BkcOQguRz0
 7tr4vWfX6zn7jSwFd17iGcqPj22fYT9ZyJBRkjpKFDp2mJAS/NdTeoq6t6/9Edjv9mD0
 KTJw70VA2zGJh4VmDkFcwT4sIVE20JDBbS5JM1uq5coAndcYh9G0k1CBTYwaEYVgfiJn
 Iyyw==
X-Gm-Message-State: AOJu0YxJuRnyHgzVZNEXdL0OEHCO1hqhN76wPpddt3uYPQg1lV7//p38
 4Fl2GqnAgB2bUpLGP5ReMWrWDlr10yK2jQ3321IqrXL/gQWkAtyxBIrdgjAuwp3zkIvnwkAui73
 9tOHgd74=
X-Gm-Gg: ASbGncvJaEaYprhS59z+uZ0BNRWbgeaaL+5wZQlcS6frMtHl6gtTgM274jEYNk9fvoS
 lCToMeBLdUNrUM/RLguIHYyRWaFhODkGWu6av86KJiVyDTt+muulspCsnQiTcU7NynfZ4S58QnP
 DydnI6W8zDuo7rxV9kRI+XD8SClnHFPvj1E/eHBAOvqhyPc54k9xWwS2P2hTwMINCwvGSh+IEsi
 ouHzY1M0iUlrnYZnLizYG2eHzixCa6mVxe/Mcy6TYmLrW7IhmATWftVFOHskxOkJ1v1v9jH0fuz
 Onxj2jpwKFP8KdA+vh3JeEoars5Po6/6QTwSaJ5k2eVomR0f6fenPkjWIrovCZ6WLcRAXH0mx3v
 i
X-Google-Smtp-Source: AGHT+IG+/s655KR/bW7ECrnVBu8/4+AGPT8D9GI9fX0zmePPQRO1w8nl6sRicRg+Nx6hg4K837Mw8A==
X-Received: by 2002:a17:906:483:b0:ae3:cdc0:eeb8 with SMTP id
 a640c23a62f3a-ae3fe59ffbcmr1216360366b.28.1751960376403; 
 Tue, 08 Jul 2025 00:39:36 -0700 (PDT)
Received: from TimMind.home ([2a02:a03f:65ae:b800:1718:12a8:2587:721f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6ac5fb9sm845193966b.94.2025.07.08.00.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:39:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Jul 2025 09:39:34 +0200
Message-Id: <20250708073934.1926413-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751960376; x=1752565176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=utrs5dK4O5bVD/AtFlRJ8PagNyqgB0qLVeEZcVgwbpA=;
 b=enozL/5vuLfE2z7tZ4mnvdOGRwrBembooVkMmh4LXhPzbln18NCZjdw+9PXbZCzh8b
 Lu2c3kSa4hBc4r4Bzlrqty1OPtqOXOzxPLcVt9M287yiT2yX1s5IASXvNssVYiFWOGpy
 4VXFeA04QjqN0k431FkxVQWXhK0c9KoTYfV5IP77o8nc2BfnCYV/cTSlLaFL1YuGslQD
 CAGg+LVoAJ6ShCbY5Frn8xaa/A/Ju4Xu2pPt/C4OUSKTyb7ZTzhinh2l3BJJLMKqtVzi
 AdeKQOAT18vLLlsiLObl52Sji/Qesapx5ybNSBblZUZ1RiZ/dVMpICilaF+fRh+u31Jv
 b8nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=enozL/5v
Subject: [Buildroot] [2025.02.x PATCH v2] package/libglib2: fix CVE-2025-6052
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
dGhlIHBhdGNoIGlzbid0IGFwcGxpZWQgdG8KbGliZ2xpYjItYm9vdHN0cmFwLgpXaGVuIGJ1aWxk
aW5nIGxpYmdsaWIyLCB0aGUgcGF0Y2ggd2FzIGNvcnJlY3RseSBhcHBsaWVkIGluCm91dHB1dC9i
dWlsZC9ob3N0LWxpYmdsaWIyLTIuODIuNS9nbGliL2dzdHJpbmcuYyAuICBXaGVuIGJ1aWxkaW5n
CmxpYmdsaWIyLWJvb3RzdHJhcCBpdCB3YXMgdmVyaWZpZWQgdGhhdCB0aGUgcGF0Y2ggd2FzIG5v
dCBhcHBsaWVkIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBUaW0gU291YnJ5IDx0aW0uc291YnJ5QG1p
bmQuYmU+Ci0tLQogLi4uZmxvdy1jaGVjay13aGVuLWV4cGFuZGluZy10aGUtc3RyaW5nLnBhdGNo
IHwgNzEgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9saWJnbGliMi9saWJnbGliMi5tayAg
ICAgICAgICAgICAgICAgIHwgIDMgKwogMiBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJnbGliMi8wMDAxLWdzdHJpbmctRml4LW92
ZXJmbG93LWNoZWNrLXdoZW4tZXhwYW5kaW5nLXRoZS1zdHJpbmcucGF0Y2gKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmdsaWIyLzAwMDEtZ3N0cmluZy1GaXgtb3ZlcmZsb3ctY2hlY2std2hlbi1l
eHBhbmRpbmctdGhlLXN0cmluZy5wYXRjaCBiL3BhY2thZ2UvbGliZ2xpYjIvMDAwMS1nc3RyaW5n
LUZpeC1vdmVyZmxvdy1jaGVjay13aGVuLWV4cGFuZGluZy10aGUtc3RyaW5nLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjQ0N2I2NTQ3ODAKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL2xpYmdsaWIyLzAwMDEtZ3N0cmluZy1GaXgtb3ZlcmZsb3ctY2hlY2st
d2hlbi1leHBhbmRpbmctdGhlLXN0cmluZy5wYXRjaApAQCAtMCwwICsxLDcxIEBACitGcm9tIDlj
NDAzZjc4N2VlZTY5YmU4NTBiYTVmOTIzNDhlY2VhNjVmOWJhZGMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBQaGlsaXAgV2l0aG5hbGwgPHB3aXRobmFsbEBnbm9tZS5vcmc+CitEYXRl
OiBUdWUsIDMgSnVuIDIwMjUgMTE6MzE6MDQgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSCAxLzFdIGdz
dHJpbmc6IEZpeCBvdmVyZmxvdyBjaGVjayB3aGVuIGV4cGFuZGluZyB0aGUgc3RyaW5nCitNSU1F
LVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0FmdGVyIGNvbW1pdCAzNGI3OTkyZmQ2
ZTM4OTRiZjZkMjIyOWI4YWE1OWNhYzM0YmNiMWI1IHRoZSBvdmVyZmxvdyBjaGVjaword2FzIG9u
bHkgZG9uZSB3aGVuIGV4cGFuZGluZyB0aGUgc3RyaW5nLCBidXQgd2UgbmVlZCB0byBkbyBpdCBi
ZWZvcmUKK2NoZWNraW5nIHdoZXRoZXIgdG8gZXhwYW5kIHRoZSBzdHJpbmcsIG90aGVyd2lzZSB0
aGF0IGNhbGN1bGF0aW9uIGNvdWxkCitvdmVyZmxvdyBhbmQgZmFsc2VseSBkZWNpZGUgdGhhdCB0
aGUgc3RyaW5nIGlzIGJpZyBlbm91Z2ggYWxyZWFkeS4KKworQXMgYSBjb25jcmV0ZSBleGFtcGxl
LCBjb25zaWRlciBhIGBHU3RyaW5nYCB3aGljaCBoYXM6CisgKiBgLmxlbiA9IEdfTUFYU0laRSAv
IDIgKyAxYAorICogYC5hbGxvY2F0ZWRfbGVuID0gR19NQVhTSVpFIC8gMiArIDFgCithbmQgYGdf
c3RyaW5nX2FwcGVuZCgpYCBpcyBjYWxsZWQgb24gaXQgd2l0aCBhbiBpbnB1dCBzdHJpbmcgb2Yg
bGVuZ3RoCitgR19NQVhTSVpFIC8gMmAuCisKK1RoaXMgcmVzdWx0cyBpbiBhIGNhbGwgYGdfc3Ry
aW5nX21heWJlX2V4cGFuZCAoc3RyaW5nLCBHX01BWFNJWkUgLyAyKWAsCit3aGljaCBjYWxjdWxh
dGVzIGBzdHJpbmctPmxlbiArIGxlbmAgYXMgYChHX01BWFNJWkUgLyAyICsgMSkgKworKEdfTUFY
U0laRSAvIDIpYCB3aGljaCBldmFsdWF0ZXMgdG8gYDFgIGFzIGl0IG92ZXJmbG93cy4gVGhpcyBp
cyBub3QKK2dyZWF0ZXIgdGhhbiBgc3RyaW5nLT5hbGxvY2F0ZWRfbGVuYCAod2hpY2ggaXMgYEdf
TUFYU0laRSAvIDIgKyAxYCksIHNvCitgZ19zdHJpbmdfZXhwYW5kKClgIGlzICpub3QqIGNhbGxl
ZCwgYW5kIGBnX3N0cmluZ19tYXliZV9leHBhbmQoKWAKK3JldHVybnMgc3VjY2Vzc2Z1bGx5LiBU
aGUgY2FsbGVyIHRoZW4gYXNzdW1lcyB0aGF0IHRoZXJl4oCZcyBlbm91Z2ggc3BhY2UKK2luIHRo
ZSBidWZmZXIsIGFuZCBoYXBwaWx5IGNvbnRpbnVlcyB0byBjYXVzZSBhIGJ1ZmZlciBvdmVyZmxv
dy4KKworSXTigJlzIHVubGlrZWx5IGFueW9uZSBjb3VsZCBoaXQgdGhpcyBpbiBwcmFjdGljZSBi
ZWNhdXNlIGl0IHJlcXVpcmVzCitsdWRpY3JvdXNseSBiaWcgc3RyaW5ncyBhbmQgYEdTdHJpbmdg
IGFsbG9jYXRpb25zLCB3aGljaCBsaWtlbHkgd291bGQKK2hhdmUgYmVlbiBibG9ja2VkIGJ5IG90
aGVyIGNvZGUsIGJ1dCBpZiB3ZeKAmXJlIGdvaW5nIHRvIGhhdmUgdGhlIG92ZXJmbG93CitjaGVj
a3MgaW4gYEdTdHJpbmdgIHRoZW4gdGhleSBzaG91bGQgYmUgZWZmZWN0aXZlLgorCitTcG90dGVk
IGJ5IGNvZGUgaW5zcGVjdGlvbi4KKworU2lnbmVkLW9mZi1ieTogUGhpbGlwIFdpdGhuYWxsIDxw
d2l0aG5hbGxAZ25vbWUub3JnPgorVXBzdHJlYW06IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9nbGliLy0vbWVyZ2VfcmVxdWVzdHMvNDY1NS9kaWZmcworQ1ZFOiBDVkUtMjAyNS02MDUy
CitTaWduZWQtb2ZmLWJ5OiBUaW0gU291YnJ5IDx0aW0uc291YnJ5QG1pbmQuYmU+CistLS0KKyBn
bGliL2dzdHJpbmcuYyB8IDggKysrKy0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvZ2xpYi9nc3RyaW5nLmMgYi9nbGli
L2dzdHJpbmcuYworaW5kZXggYmRkMDY4MzQ0Li40NWE2ZjY4YjEgMTAwNjQ0CistLS0gYS9nbGli
L2dzdHJpbmcuYworKysrIGIvZ2xpYi9nc3RyaW5nLmMKK0BAIC02OCwxMCArNjgsNiBAQCBzdGF0
aWMgdm9pZAorIGdfc3RyaW5nX2V4cGFuZCAoR1N0cmluZyAqc3RyaW5nLAorICAgICAgICAgICAg
ICAgICAgZ3NpemUgICAgbGVuKQorIHsKKy0gIC8qIERldGVjdCBwb3RlbnRpYWwgb3ZlcmZsb3cg
Ki8KKy0gIGlmIEdfVU5MSUtFTFkgKChHX01BWFNJWkUgLSBzdHJpbmctPmxlbiAtIDEpIDwgbGVu
KQorLSAgICBnX2Vycm9yICgiYWRkaW5nICUiIEdfR1NJWkVfRk9STUFUICIgdG8gc3RyaW5nIHdv
dWxkIG92ZXJmbG93IiwgbGVuKTsKKy0KKyAgIHN0cmluZy0+YWxsb2NhdGVkX2xlbiA9IGdfbmVh
cmVzdF9wb3cgKHN0cmluZy0+bGVuICsgbGVuICsgMSk7CisgICAvKiBJZiB0aGUgbmV3IHNpemUg
aXMgYmlnZ2VyIHRoYW4gR19NQVhTSVpFIC8gMiwgb25seSBhbGxvY2F0ZSBlbm91Z2gKKyAgICAq
IG1lbW9yeSBmb3IgdGhpcyBzdHJpbmcgYW5kIGRvbid0IG92ZXItYWxsb2NhdGUuCitAQCAtODYs
NiArODIsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkCisgZ19zdHJpbmdfbWF5YmVfZXhwYW5kIChH
U3RyaW5nICpzdHJpbmcsCisgICAgICAgICAgICAgICAgICAgICAgICBnc2l6ZSAgICBsZW4pCisg
eworKyAgLyogRGV0ZWN0IHBvdGVudGlhbCBvdmVyZmxvdyAqLworKyAgaWYgR19VTkxJS0VMWSAo
KEdfTUFYU0laRSAtIHN0cmluZy0+bGVuIC0gMSkgPCBsZW4pCisrICAgIGdfZXJyb3IgKCJhZGRp
bmcgJSIgR19HU0laRV9GT1JNQVQgIiB0byBzdHJpbmcgd291bGQgb3ZlcmZsb3ciLCBsZW4pOwor
KworICAgaWYgKEdfVU5MSUtFTFkgKHN0cmluZy0+bGVuICsgbGVuID49IHN0cmluZy0+YWxsb2Nh
dGVkX2xlbikpCisgICAgIGdfc3RyaW5nX2V4cGFuZCAoc3RyaW5nLCBsZW4pOworIH0KKy0tIAor
Mi4zOS41CisKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsgYi9wYWNr
YWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rCmluZGV4IDZjMDEyYzc5YzcuLmI4Yzg1M2I3NTIgMTAw
NjQ0Ci0tLSBhL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIubWsKKysrIGIvcGFja2FnZS9saWJn
bGliMi9saWJnbGliMi5tawpAQCAtMjIsNiArMjIsOSBAQCBpZmVxICgkKEJSMl9BUk1fSU5TVFJV
Q1RJT05TX1RIVU1CKSx5KQogTElCR0xJQjJfQ0ZMQUdTICs9IC1tYXJtCiBlbmRpZgogCisjIDAw
MDEtZ3N0cmluZy1GaXgtb3ZlcmZsb3ctY2hlY2std2hlbi1leHBhbmRpbmctdGhlLXN0cmluZy5w
YXRjaAorTElCR0xJQjJfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjUtNjA1MgorCiBIT1NUX0xJQkdM
SUIyX0NPTkZfT1BUUyA9IFwKIAktRGR0cmFjZT1mYWxzZSBcCiAJLURnbGliX2RlYnVnPWRpc2Fi
bGVkIFwKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
