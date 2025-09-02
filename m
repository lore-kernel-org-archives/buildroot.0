Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678DECA0FFE
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 04:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E784784423;
	Tue,  2 Sep 2025 04:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvzfwiUhYzQ8; Tue,  2 Sep 2025 04:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E09A58441B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E09A58441B;
	Tue,  2 Sep 2025 04:38:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A7AD439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 04:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27AA241320
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 04:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8ihbzKJAyaI for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 04:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F13B44130B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F13B44130B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F13B44130B
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 04:38:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b84c9775cso15051855e9.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 21:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756787929; x=1757392729;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zdll7HB4Bo7mNZyiFCdlwiS6sqeyy24PeMQcg7Z6FL8=;
 b=MHkAE4UPZnhvVaF1aVexh6E9LqkUlR2aer45EoZ0gvxV94QsBPY1HwsWItBnbiu3Ng
 p9Gv0eEir1RzQMXwTqZvDUe+qGo2WvXCfhF4tet/me5j+uQ6NGoSoVkmfolyYCBlXSNL
 HXrKr0c1w9zqI+9UaOtBUHVR0glYcRdsQYgIMIK1Dnwk6kF3Apt7zenT8qBmC89UWcPU
 9O0YppuxzPKkILKd42b6FDTndvpK4Db6qdgRZE1PeftTIU4eXAN8nYoj0Z02QZdOcKif
 XNxcgbcY18+6wkg+XTqkLnTSXOWkaHQYJURyyXlZ++HmoQHnnO2VFeCmQZKVTiZTPZBs
 oa3Q==
X-Gm-Message-State: AOJu0YxWaRQ+JX2cqyUXCXMrbP8vZi1hFWrjA8+K+uOuWcRXa4xeXvMx
 aNwk7iPyJIezDMVUHnKt0Fi7DugmissNq9V6HGNCfKGI5IFZExyhfERXnlAkJg==
X-Gm-Gg: ASbGncs2jiFhUs8tdxTZlVVKZXCTr/Mtp4z1VIXlv8oJA+OLnJ7z0hMS/J/+oRJxt7G
 9SyuDUzLVXAO+WeLjPPkzF1qePnxBk/+P0cBrrg31QNPkz+md1CIfu7lSn/blkBtacOTR6VE4px
 41zIgZ6FZazC4Kl6KkGcg8VFiyzIhQp+2eXt19tgPeUCYUg4zVMTrOt47WZsImddILU4QhJq974
 urezsTM54UXfBMS5LYJIbBRag6qKl6T0Blplj9N5ch2sswttV+foqXIrfwrxSC7S7zQcF2FqOA4
 LLbYrGhfKGjuGB9qCwF8RuVUzg0b5BIJ+4v+5MqDp+wU2FB9//J/d3Z+O2Gkc9wdRIWf/eE0s7D
 nb2UjNGQP+U387qUXVnQ0/w65cz2dANLjEEpvgPIcwQP1qgPeoLRQkQrQIfHC3wMW7EM84t3j58
 rv5jbK22YbCf0OmI2iLSpPtrKmIoqAB17WfIY=
X-Google-Smtp-Source: AGHT+IGOW3HIjXPyfY9Q1VVivKBry14+6q6i9QeU+/5WspWNxR1SKEZMGDyK9ekyQWqyf1hxvbMhVQ==
X-Received: by 2002:a05:600c:4683:b0:45b:6334:3526 with SMTP id
 5b1f17b1804b1-45b8557c915mr91671495e9.31.1756787928435; 
 Mon, 01 Sep 2025 21:38:48 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online
 (223.85-87-142.dynamic.clientes.euskaltel.es. [85.87.142.223])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d540843a2csm9239324f8f.22.2025.09.01.21.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:38:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Date: Tue,  2 Sep 2025 06:38:20 +0200
Message-ID: <20250902043820.1826082-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756787929; x=1757392729; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zdll7HB4Bo7mNZyiFCdlwiS6sqeyy24PeMQcg7Z6FL8=;
 b=m5NJwUgl9d7z2kIdgFmvhq1Z6T76Rs3+URAtHcCsqK2VbpW1ACftVJZV4ojeH9rR1X
 1K0Aa9MnJSFMCyDlEKSNGsgOT/SjwDz/p4xO15KqlXHoowHeJmf/qJk6xpnE+EJJfBgk
 IRUWWuiP+uNj+Hjm+h595znkTDmymrMyqhjhrsijdte8CDvFewD6GJppDTPoB8ZCXekJ
 Eg6s4+6TYF0SWhzDZzNEr6maeg7ahsT8W6b0MbaYPhNlqosVuHw6EOvxGk88JNyO/nMu
 Sg1uX5hL6Ya1hnZ/sTpmWU6LYbXzBhPnz0yFAeIR8R2LY8ACcb5/ACe95H1p3z7cda0B
 1/Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m5NJwUgl
Subject: [Buildroot] [PATCH 1/1] package/zfs: bump version to 2.3.4
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

QWRkZWQgYmFja3BvcnRlZCBwYXRjaDoKLSAwMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1vZi1s
aW51eF9zdGF0aC5wYXRjaAogIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9jb21taXQv
Y2NmNWE4YTZmY2ZkZmJkYWEyZjBmZGNhNWQ3ODc5NTgyMjRiZjA2ZAoKRm9yIHJlbGVhc2Ugbm90
ZSwgc2VlOgpodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvdGFnL3pmcy0y
LjMuNAoKU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5q
b3NlbHVpc0BnbWFpbC5jb20+Ci0tLQogLi4udXNlLXN5c19zdGF0aC1pbnN0ZWFkLW9mLWxpbnV4
X3N0YXRoLnBhdGNoIHwgODIgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS96ZnMvemZzLmhh
c2ggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvemZzL3pmcy5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDg1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS96
ZnMvMDAwMS11c2Utc3lzX3N0YXRoLWluc3RlYWQtb2YtbGludXhfc3RhdGgucGF0Y2gKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL3pmcy8wMDAxLXVzZS1zeXNfc3RhdGgtaW5zdGVhZC1vZi1saW51eF9z
dGF0aC5wYXRjaCBiL3BhY2thZ2UvemZzLzAwMDEtdXNlLXN5c19zdGF0aC1pbnN0ZWFkLW9mLWxp
bnV4X3N0YXRoLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjVl
NWQyMWVjNTIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3pmcy8wMDAxLXVzZS1zeXNfc3Rh
dGgtaW5zdGVhZC1vZi1saW51eF9zdGF0aC5wYXRjaApAQCAtMCwwICsxLDgyIEBACitGcm9tIGNj
ZjVhOGE2ZmNmZGZiZGFhMmYwZmRjYTVkNzg3OTU4MjI0YmYwNmQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBjbGFzc2FiYnlhbXAgPDUzNjY4MjgrY2xhc3NhYmJ5YW1wQHVzZXJzLm5v
cmVwbHkuZ2l0aHViLmNvbT4KK0RhdGU6IFdlZCwgMjcgQXVnIDIwMjUgMTc6NDI6MzIgLTA0MDAK
K1N1YmplY3Q6IFtQQVRDSF0gbGludXg6IHVzZSBzeXMvc3RhdC5oIGluc3RlYWQgb2YgbGludXgv
c3RhdC5oCisKK2dsaWJjIGluY2x1ZGVzIGxpbnV4L3N0YXQuaCBmb3Igc3RhdHgsIGJ1dCBtdXNs
IGRlZmluZXMgaXRzIG93biBzdGF0eAorc3RydWN0IGFuZCBhc3NvY2lhdGVkIGNvbnN0YW50cywg
d2hpY2ggZG9lcyBub3QgaW5jbHVkZSBTVEFUWF9NTlRfSUQKK3lldC4gVGh1cywgaW5jbHVkaW5n
IGxpbnV4L3N0YXQuaCBkaXJlY3RseSBzaG91bGQgYmUgYXZvaWRlZCBmb3IKK21heGltdW0gbGli
YyBjb21wYXRpYmlsaXR5LgorCitUZXN0ZWQgb246CisgIC0gZ2xpYmM6IHg4Nl82NCwgaTY4Niwg
YWFyY2g2NCwgYXJtdjdsLCBhcm12NmwKKyAgLSBtdXNsOiB4ODZfNjQsIGFhcmNoNjQsIGFybXY3
bCwgYXJtdjZsCisKK1Jldmlld2VkLWJ5OiBCcmlhbiBCZWhsZW5kb3JmIDxiZWhsZW5kb3JmMUBs
bG5sLmdvdj4KK1Rlc3RlZC1CeTogQWNoaWxsIEdpbGdlbmFzdCA8YWNoaWxsQGFjaGlsbC5vcmc+
CitTaWduZWQtb2ZmLWJ5OiBjbGFzc2FiYnlhbXAgPGRldkBwbGFjZXZpb2xldHRlLm5ldD4KK0Ns
b3NlcyAjMTc2NzUKKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9j
b21taXQvY2NmNWE4YTZmY2ZkZmJkYWEyZjBmZGNhNWQ3ODc5NTgyMjRiZjA2ZAorU2lnbmVkLW9m
Zi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5j
b20+CistLS0KKyBjb25maWcvdXNlci1zdGF0eC5tNCAgICAgICAgICAgICAgICAgICB8IDYgKysr
LS0tCisgaW5jbHVkZS9vcy9saW51eC9zcGwvc3lzL3N0YXQuaCAgICAgICAgfCAyICstCisgbGli
L2xpYnNwbC9pbmNsdWRlL29zL2xpbnV4L3N5cy9zdGF0LmggfCAyICstCisgMyBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9jb25m
aWcvdXNlci1zdGF0eC5tNCBiL2NvbmZpZy91c2VyLXN0YXR4Lm00CitpbmRleCAwMzE1ZjkzZTBj
MjAuLjFiYTc0YTQwZTliOCAxMDA2NDQKKy0tLSBhL2NvbmZpZy91c2VyLXN0YXR4Lm00CisrKysg
Yi9jb25maWcvdXNlci1zdGF0eC5tNAorQEAgLTIsNyArMiw3IEBAIGRubCAjCisgZG5sICMgQ2hl
Y2sgZm9yIHN0YXR4KCkgZnVuY3Rpb24gYW5kIFNUQVRYX01OVF9JRCBhdmFpbGFiaWxpdHkKKyBk
bmwgIworIEFDX0RFRlVOKFtaRlNfQUNfQ09ORklHX1VTRVJfU1RBVFhdLCBbCistCUFDX0NIRUNL
X0hFQURFUlMoW2xpbnV4L3N0YXQuaF0sCisrCUFDX0NIRUNLX0hFQURFUlMoW3N5cy9zdGF0Lmhd
LAorIAkJW2hhdmVfc3RhdF9oZWFkZXJzPXllc10sCisgCQlbaGF2ZV9zdGF0X2hlYWRlcnM9bm9d
KQorIAorQEAgLTE0LDcgKzE0LDcgQEAgQUNfREVGVU4oW1pGU19BQ19DT05GSUdfVVNFUl9TVEFU
WF0sIFsKKyAJCQlBQ19NU0dfQ0hFQ0tJTkcoW2ZvciBTVEFUWF9NTlRfSURdKQorIAkJCUFDX0NP
TVBJTEVfSUZFTFNFKFsKKyAJCQkJQUNfTEFOR19QUk9HUkFNKFtbCistCQkJCQkjaW5jbHVkZSA8
bGludXgvc3RhdC5oPgorKwkJCQkJI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CisgCQkJCV1dLCBbWwor
IAkJCQkJc3RydWN0IHN0YXR4IHN0eDsKKyAJCQkJCWludCBtYXNrID0gU1RBVFhfTU5UX0lEOwor
QEAgLTI5LDYgKzI5LDYgQEAgQUNfREVGVU4oW1pGU19BQ19DT05GSUdfVVNFUl9TVEFUWF0sIFsK
KyAJCQldKQorIAkJXSkKKyAJXSwgWworLQkJQUNfTVNHX1dBUk4oW2xpbnV4L3N0YXQuaCBub3Qg
Zm91bmQ7IHNraXBwaW5nIHN0YXR4IHN1cHBvcnRdKQorKwkJQUNfTVNHX1dBUk4oW3N5cy9zdGF0
Lmggbm90IGZvdW5kOyBza2lwcGluZyBzdGF0eCBzdXBwb3J0XSkKKyAJXSkKKyBdKSAgZG5sIGVu
ZCBBQ19ERUZVTgorZGlmZiAtLWdpdCBhL2luY2x1ZGUvb3MvbGludXgvc3BsL3N5cy9zdGF0Lmgg
Yi9pbmNsdWRlL29zL2xpbnV4L3NwbC9zeXMvc3RhdC5oCitpbmRleCAwODczODliNTdiMzQuLmFk
MjgxNWU0NjM5NCAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvb3MvbGludXgvc3BsL3N5cy9zdGF0LmgK
KysrKyBiL2luY2x1ZGUvb3MvbGludXgvc3BsL3N5cy9zdGF0LmgKK0BAIC0yNSw2ICsyNSw2IEBA
CisgI2lmbmRlZiBfU1BMX1NUQVRfSAorICNkZWZpbmUJX1NQTF9TVEFUX0gKKyAKKy0jaW5jbHVk
ZSA8bGludXgvc3RhdC5oPgorKyNpbmNsdWRlIDxzeXMvc3RhdC5oPgorIAorICNlbmRpZiAvKiBT
UExfU1RBVF9IICovCitkaWZmIC0tZ2l0IGEvbGliL2xpYnNwbC9pbmNsdWRlL29zL2xpbnV4L3N5
cy9zdGF0LmggYi9saWIvbGlic3BsL2luY2x1ZGUvb3MvbGludXgvc3lzL3N0YXQuaAoraW5kZXgg
YTYwNWFmOTYyYTZkLi4xM2NjMGI0NmFjOTMgMTAwNjQ0CistLS0gYS9saWIvbGlic3BsL2luY2x1
ZGUvb3MvbGludXgvc3lzL3N0YXQuaAorKysrIGIvbGliL2xpYnNwbC9pbmNsdWRlL29zL2xpbnV4
L3N5cy9zdGF0LmgKK0BAIC0zMyw3ICszMyw3IEBACisgCisgI2lmZGVmIEhBVkVfU1RBVFgKKyAj
aW5jbHVkZSA8ZmNudGwuaD4KKy0jaW5jbHVkZSA8bGludXgvc3RhdC5oPgorKyNpbmNsdWRlIDxz
eXMvc3RhdC5oPgorICNlbmRpZgorIAorIC8qCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMu
aGFzaCBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCmluZGV4IDg3ZWU1MTNhZWQuLjBmMzA5MTU1YWUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5oYXNoCisrKyBiL3BhY2thZ2UvemZzL3pmcy5o
YXNoCkBAIC0xLDUgKzEsNSBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pm
cy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4zLjMvemZzLTIuMy4zLnNoYTI1Ni5hc2MKLXNoYTI1
NiAgODQ0MTIyMTE4ZjBlYTgxMjA1YTAxNzUzYmJjYjEzMTUzMzBmODk2N2MxZjg2NmRjZDEwMTU1
MjczMTMxZjA3MSAgemZzLTIuMy4zLnRhci5negorIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4zLjQvemZzLTIuMy40LnNoYTI1Ni5h
c2MKK3NoYTI1NiAgOWVjMzk3Y2YzNjAxMzMxNjFhMTE4MDAzNWYzZTdkNjk2MjE4NmVkMmIzNDU3
OTUzYTI4ZDQ1YWE4ODNmYTQ5NSAgemZzLTIuMy40LnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vu
c2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5ZjA0ZTk0N2ZhY2M1Yzc4NTFmMjg5NjA5
MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
emZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCBhZDRmM2YyMzJkLi5hNDhmODk5
MjJiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFja2FnZS96ZnMvemZz
Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotWkZTX1ZF
UlNJT04gPSAyLjMuMworWkZTX1ZFUlNJT04gPSAyLjMuNAogWkZTX1NJVEUgPSBodHRwczovL2dp
dGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZzLSQoWkZTX1ZFUlNJT04p
CiBaRlNfU0VMSU5VWF9NT0RVTEVTID0gemZzCiBaRlNfTElDRU5TRSA9IENEREwKLS0gCjIuNTEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
