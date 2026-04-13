Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BEAF34C51
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 13:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B5C846B7;
	Mon, 13 Apr 2026 13:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmeUnOdT-aT2; Mon, 13 Apr 2026 13:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BBA1845B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776085233;
	bh=oHXq8/T9H7t6FG8ScbhKgNwPCiuRANhvk8bUal0s/pk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=H0ZXl8xTHoOvAGxMkNBbMYE49ubCD9rxSkD5iMeqUN+YEMIZHfCCNX1Q8vxHl/T9J
	 33bGgW9Q1s7iAcXQNgMwSSzIXNlzFr699u7FtzUnv4jsGJCD8B0n+Kf915OsVdmWGs
	 iVZp7p/zFeIBBowVu5cHfz+YxO3yalTePMjo9RT2W5FSZlXDG2xeR2+VXcbPXCGfE4
	 oSktyiylki4dEf+6Qc3qaTK+DzQ+Tpea9XszRFpGS/1PFh073USr1nsazd/TvIm8Yo
	 lcsMd/8nVa2O+uClZnYj1HorLJGzsz+o9W47XSXkP9ZyEo6JwzUB3v/Obyi3nk64od
	 gJyst0dMzwSpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBA1845B5;
	Mon, 13 Apr 2026 13:00:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D4E194
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF871843F8
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUjKXqgs2xPM for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 13:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=mateo.pourrier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8A02844FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8A02844FF
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8A02844FF
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 13:00:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so2825439f8f.3
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 06:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776085227; x=1776690027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1JIHG18Ouju/zdib0FHLy10WIsVtWE9dmOplX5x/GY=;
 b=frs7UbK8don0rjQt2KeQEesqnyZgIOKXsYy1wQj21xDmIv8osDR9Gx2mGoZ6ZHCsMG
 JyvIvnhbQO6Lyt5DqUp8YKKYxROrQM6I26TKKg7wJC9wwDXp/Ra43JrZzvmrteH5aPWC
 CwyQXUqp+wxVQDvdw5McGMJKrmvgv/fvJK5FrUySyJh5vZUIm1szkyo/MZtxw9cthPO2
 777K1xMKswOCWj/sklACa01p4L2wi9YzWrNPQdHd0FQT24KFlLKKaVSl8/YYGmPBeb8O
 rsIjoNEdWHJEB1jPI9g+CrxiWNevv4VwuEY+UrZGrUZltmZ5KSfXjqqKyZGY4AXZwJPU
 1sZg==
X-Gm-Message-State: AOJu0YwDAWSXEF7ITepR02qn+WPctmmgbbJNFL6xNtnfWx833cyh7UZF
 B6EY8TiHV+wNYqU4W0YhffHBx1vi6+3DWwYVdSZHWAmZHP5My27PevnssNsm4uuOLSaXGtNxm+A
 N4BAmi03/GQ==
X-Gm-Gg: AeBDiev7qGEy7ceJMoIhsx/tah3J1kS7cDurIpv9BNN2g4DQ+bB49u0H9X/iviZWemu
 xSmtGg24RjR4EO2bsPwLyG7+A/Cu6h6xBcYSC9dWUmQ4YxBud3TW5US8H0BJpX5867RDYuqkqQJ
 VQxfbDDoAJRZUSO18ZMFluZPOI9ViJo24D8Y8CTM3zTYZh1YcY2FkJs2SlZZN4mjYKwWvdZ3+cQ
 HNSk3lDiyg3x5mS9srAxpX8HlH1oCW0Tsu3DbvCD1wWKeGzrB+uwvtq5701X285CbKf71J/Q8Of
 bHL2rNEytpDqU2jr3ToVKEDk6PPG/6BVQ1R8GFQmhppZp8lsI63gdSltxPwaP637tQG1A/t6FY0
 SbzW3Pz80fUg00g0yqetk5dujx3cRp7nBK53uUpy908o7dMITQZmKmXaBrk9KQtVUdvBnwvwC3k
 dihOokKpLpH93ZA3QxOOnfb4DyNCTymfsr
X-Received: by 2002:a05:6000:e08:b0:43d:7b7b:ab77 with SMTP id
 ffacd0b85a97d-43d7b7badbemr2422450f8f.11.1776085227272; 
 Mon, 13 Apr 2026 06:00:27 -0700 (PDT)
Received: from P-LIL-CIELS.. ([2a0d:e487:138f:c436:5425:d184:b6f7:1a2a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec27fsm31934824f8f.11.2026.04.13.06.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 06:00:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 15:00:10 +0200
Message-Id: <20260413130010.415908-1-mateo.pourrier@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776085227; x=1776690027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e1JIHG18Ouju/zdib0FHLy10WIsVtWE9dmOplX5x/GY=;
 b=ozPGIsAo2VP4KK51k1fBBVeq4Y9zCj7IIWaR+Hq2faosRImkMMpaEYJmQ8Wbds6/SY
 8o6ggzNLMNtJ1Vq7p2N7ol2dcKQCtrUv1mRScPOfCXFin62gguu1AjecnUxhtQz+8yQc
 PKWmNl6yQ5s1UuB9cWYnXsQMcb78tE9sfrJQI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ozPGIsAo
Subject: [Buildroot] [PATCH 1/1] package/dracut: bump to dracut-ng-110
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
From: =?utf-8?q?Mat=C3=A9o_Pourrier_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Mat=C3=A9o=20Pourrier?= <mateo.pourrier@smile.fr>
Cc: =?UTF-8?q?Mat=C3=A9o=20Pourrier?= <mateo.pourrier@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Thierry Bultel <tbultel@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBkcmFjdXQgcGFja2FnZSBzb3VyY2UgdG8gdGhlIG5ld2VzdCB2ZXJzaW9uIG9mIHRoZSBw
cm9qZWN0LCBkcmFjdXQtbmcsIHJlbGVhc2UgMTEwLgoKVGhlIG9yaWdpbmFsIGRyYWN1dCBwcm9q
ZWN0IGlzIG5vdyBpbmFjdGl2ZSBmb3IgYSBsb25nIHBlcmlvZCBvZiB0aW1lLgpEcmFjdXQgY29t
bXVuaXR5IGhhcyB0cmFuc2l0aW9uZWQgdG8gdGhlIGRyYWN1dC1uZyBmb3JrIHRvIGNvbnRpbnVl
IGRldmVsb3BtZW50LgpUaGUgbWlncmF0aW9uIGVuc3VyZXMgcmVndWxhciB1cGRhdGVzIGZvciBz
ZWN1cml0eSBhbmQgYnVnIGZpeGluZywKYSBiZXR0ZXIgc3VwcG9ydCBvZiBtb2Rlcm4gc3lzdGVt
ZCBmZWF0dXJlcyBhbmQga2VybmVsIHJlcXVpcmVtZW50cy4KSXQgYWxzbyBhbGxvd3MgYWxpZ25t
ZW50IHdpdGggbWFqb3IgTGludXggZGlzdHJpYnV0aW9ucyAoRmVkb3JhLCBBcmNoIExpbnV4LCBH
ZW50b28pLAphbmQgb3RoZXIgb3BlbiBzb3VyY2UgcHJvamVjdHMgKFlvY3RvKS4KCkNoYW5nZXMg
bWFkZSA6Ci0gZHJhY3V0Lm1rOiBjaGFuZ2Ugc291cmNlIHRvIGRyYWN1dC1uZyAxMTAKLSBkcmFj
dXQuaGFzaDogYWRhcHQgaGFzaCB0byBkcmFjdXQtbmcgMTEwCi0gcmVtb3ZlIHVudXNlZCBwYXRj
aCAwMDEtZHJhY3V0LnNoLWRvbi10LXVuc2V0LUxEX1BSRUxPQUQucGF0Y2gKLSBkcmFjdXQubWs6
IGZpeCB1bnVzZWQgc3lzdGVtZCBzeW1ib2xpYyBsaW5rcyBidWlsZCBlcnJvcgotIENvbmZpZy5p
bjogYWRhcHQgZnMvY3Bpby9Db25maWcuaW4gdG8gbWVudGlvbiBkcmFjdXQtbmcgdXBncmFkZQot
IENvbmZpZy5pbi5ob3N0OiBhZGFwdCBkcmFjdXQgQ29uZmlnLmluLmhvc3QgdG8gbWVudGlvbiBk
cmFjdXQtbmcgdXBncmFkZQoKVGVzdGVkIHdpdGggYnVpbGRyb290IHRlc3Qgc3VpdGUsIGFuZCBz
dWNjZXNzZnVsbHkgcGFzc2VkIHRoZSA2IGRyYWN1dCB0ZXN0cyA6Ci0gVGVzdENwaW9EcmFjdXRH
bGliYwotIFRlc3RDcGlvRHJhY3V0R2xpYmNNZXJnZWRVc3IKLSBUZXN0Q3Bpb0RyYWN1dE11c2wK
LSBUZXN0Q3Bpb0RyYWN1dE11c2xNZXJnZWRVc3IKLSBUZXN0Q3Bpb0RyYWN1dFVjbGliYwotIFRl
c3RDcGlvRHJhY3V0VWNsaWJjTWVyZ2VkVXNyCgpTaWduZWQtb2ZmLWJ5OiBNYXTDqW8gUG91cnJp
ZXIgPG1hdGVvLnBvdXJyaWVyQHNtaWxlLmZyPgotLS0KIGZzL2NwaW8vQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4wMDEtZHJhY3V0LnNoLWRvbi10LXVu
c2V0LUxEX1BSRUxPQUQucGF0Y2ggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2Ry
YWN1dC9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAgfCAgNiArKy0tCiBwYWNrYWdlL2Ry
YWN1dC9kcmFjdXQuaGFzaCAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9kcmFj
dXQvZHJhY3V0Lm1rICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKy0tCiA1IGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9kcmFjdXQvMDAwMS1kcmFjdXQuc2gtZG9uLXQtdW5zZXQtTERfUFJFTE9BRC5wYXRj
aAoKZGlmZiAtLWdpdCBhL2ZzL2NwaW8vQ29uZmlnLmluIGIvZnMvY3Bpby9Db25maWcuaW4KaW5k
ZXggNGQzODI3NmM4OC4uMmI4NTA1YWZiMyAxMDA2NDQKLS0tIGEvZnMvY3Bpby9Db25maWcuaW4K
KysrIGIvZnMvY3Bpby9Db25maWcuaW4KQEAgLTIwLDcgKzIwLDcgQEAgY29uZmlnIEJSMl9UQVJH
RVRfUk9PVEZTX0NQSU9fRFJBQ1VUCiAJYm9vbCAiSW52b2tlIGRyYWN1dCB0byBtYWtlIGEgcGFy
dGlhbCBpbml0cmFtZnMiCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfRFJBQ1VUCiAJaGVscAot
CSAgQnVpbGQgYW4gYWRkaXRpb25hbCBpbml0cmFtZnMgdXNpbmcgZHJhY3V0LiBUaGlzIG9ubHkg
Y29udGFpbnMKKwkgIEJ1aWxkIGFuIGFkZGl0aW9uYWwgaW5pdHJhbWZzIHVzaW5nIGRyYWN1dC1u
Zy4gVGhpcyBvbmx5IGNvbnRhaW5zCiAJICBhIHN1YnNldCBvZiB0aGUgcm9vdGZzLCBhcyBkZXRl
cm1pbmVkIGJ5IHRoZSBjb25maWd1cmF0aW9uCiAJICBmaWxlLgogCSAgVGhpcyBjYW4gYmUgdXNl
ZnVsIHRvIGNyZWF0ZSBhIHJlY292ZXJ5IHN5c3RlbSwgZm9yIGluc3RhbmNlLgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9kcmFjdXQvMDAwMS1kcmFjdXQuc2gtZG9uLXQtdW5zZXQtTERfUFJFTE9BRC5w
YXRjaCBiL3BhY2thZ2UvZHJhY3V0LzAwMDEtZHJhY3V0LnNoLWRvbi10LXVuc2V0LUxEX1BSRUxP
QUQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDM5NDkxN2VlYjAuLjAwMDAw
MDAwMDAKLS0tIGEvcGFja2FnZS9kcmFjdXQvMDAwMS1kcmFjdXQuc2gtZG9uLXQtdW5zZXQtTERf
UFJFTE9BRC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMxICswLDAgQEAKLUZyb20gYmIxMmYx
NTg1NjkxMWQ4NTMyYjU2OTExNmRhN2RhYjRjYmYxMDdiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IFRoaWVycnkgQnVsdGVsIDx0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcj4KLURh
dGU6IE1vbiwgMTAgSmFuIDIwMjIgMDk6MDk6NDMgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gZHJh
Y3V0LnNoOiBkb24ndCB1bnNldCBMRF9QUkVMT0FECi0KLUxEX1BSRUxPQUQgYW5kIExEX0xJQlJB
UllfUEFUSCBhcmUgbmVlZGVkIHRvIHJ1biB1bmRlciBmYWtlcm9vdC4KLQotU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBCdWx0ZWwgPHRoaWVycnkuYnVsdGVsQGxpbmF0c2VhLmZyPgotU2lnbmVkLW9m
Zi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1pbmQu
YmU+Ci1beWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI6IGNvbW1pdCBsb2cgYWxzbyBtZW50aW9ucyBM
RF9MSUJSQVJZX1BBVEhdCi1TaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4KLS0tLQotIGRyYWN1dC5zaCB8IDIgLS0KLSAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2RyYWN1dC5zaCBiL2RyYWN1dC5zaAotaW5k
ZXggNjBhYzQ2ZjQuLjM3ZjI1YjM4IDEwMDc1NQotLS0tIGEvZHJhY3V0LnNoCi0rKysgYi9kcmFj
dXQuc2gKLUBAIC04NjgsOCArODY4LDYgQEAgZXhwb3J0IExDX0FMTD1DCi0gZXhwb3J0IExBTkc9
QwotIHVuc2V0IExDX01FU1NBR0VTCi0gdW5zZXQgTENfQ1RZUEUKLS11bnNldCBMRF9MSUJSQVJZ
X1BBVEgKLS11bnNldCBMRF9QUkVMT0FECi0gdW5zZXQgR1JFUF9PUFRJT05TCi0gCi0gZXhwb3J0
IERSQUNVVF9MT0dfTEVWRUw9d2FybmluZwotLS0gCi0yLjM3LjEKLQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9kcmFjdXQvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2RyYWN1dC9Db25maWcuaW4uaG9z
dAppbmRleCAxOGY1NjJiMzEwLi44OGRlYzk2OWMzIDEwMDY0NAotLS0gYS9wYWNrYWdlL2RyYWN1
dC9Db25maWcuaW4uaG9zdAorKysgYi9wYWNrYWdlL2RyYWN1dC9Db25maWcuaW4uaG9zdApAQCAt
Miw4ICsyLDEwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0RSQUNVVAogCWJvb2wKIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfSE9TVF9LTU9ECiAJaGVscAotCSAgZHJhY3V0IGlzIHVzZWQgdG8gY3Jl
YXRlIGFuIGluaXRyYW1mcyBpbWFnZSBieQorCSAgZHJhY3V0LW5nIGlzIHVzZWQgdG8gY3JlYXRl
IGFuIGluaXRyYW1mcyBpbWFnZSBieQogCSAgY29weWluZyB0b29scyBhbmQgZmlsZXMgZnJvbSBh
biBpbnN0YWxsZWQgc3lzdGVtCiAJICBhbmQgY29tYmluaW5nIGl0IHdpdGggdGhlIGRyYWN1dCBm
cmFtZXdvcmsuCisJICBkcmFjdXQtbmcgaXMgYSBkcm9wLWluIHJlcGxhY2VtZW50IGZvciB0aGUg
bGVnYWN5CisJICBkcmFjdXQgcHJvamVjdC4KIAotCSAgaHR0cHM6Ly9kcmFjdXQud2lraS5rZXJu
ZWwub3JnCisJICBodHRwczovL2dpdGh1Yi5jb20vZHJhY3V0LW5nL2RyYWN1dC1uZy93aWtpCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2RyYWN1dC9kcmFjdXQuaGFzaCBiL3BhY2thZ2UvZHJhY3V0L2Ry
YWN1dC5oYXNoCmluZGV4IDZjYTM1MmM1NDIuLjMyODhlZDZhZDQgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvZHJhY3V0L2RyYWN1dC5oYXNoCisrKyBiL3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5oYXNoCkBA
IC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGVhYmYwYmI2ODU0MjBj
MWUxZDU0NzViNjg1NWVmNzg3MTA0NTA4ZjAxMzVmZjU3MDMxMjg0NTI1NmUwZmNlY2YgIGRyYWN1
dC0wNTkudGFyLmd6CitzaGEyNTYgIDBkMzU3ODUzZjhjZjIzNzFkODlhOGViY2JiYjFmZDJjMWM4
NWE3OWQ4ODY2OTI1ZmQ3Mzg1ZWFlYjIwYTI3ZGMgIGRyYWN1dC0xMTAudGFyLmd6CiBzaGEyNTYg
IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUy
MWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5tayBi
L3BhY2thZ2UvZHJhY3V0L2RyYWN1dC5tawppbmRleCBjYjYwNDQ0MTVlLi5iNDBmNjE4ZmU4IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2RyYWN1dC9kcmFjdXQubWsKKysrIGIvcGFja2FnZS9kcmFjdXQv
ZHJhY3V0Lm1rCkBAIC00LDEzICs0LDE0IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1EUkFDVVRfVkVSU0lPTiA9IDA1OQotRFJBQ1VUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGRyYWN1
dGRldnMsZHJhY3V0LCQoRFJBQ1VUX1ZFUlNJT04pKQorRFJBQ1VUX1ZFUlNJT04gPSAxMTAKK0RS
QUNVVF9TSVRFID0gJChjYWxsIGdpdGh1YixkcmFjdXQtbmcsZHJhY3V0LW5nLCQoRFJBQ1VUX1ZF
UlNJT04pKQogRFJBQ1VUX0xJQ0VOU0UgPSBHUEwtMi4wCiBEUkFDVVRfTElDRU5TRV9GSUxFUyA9
IENPUFlJTkcKIERSQUNVVF9DUEVfSURfVkFMSUQgPSBZRVMKIAogSE9TVF9EUkFDVVRfREVQRU5E
RU5DSUVTID0gaG9zdC1wa2djb25mIGhvc3Qta21vZCBob3N0LWNyb3NzLWxkZAorSE9TVF9EUkFD
VVRfSU5TVEFMTF9PUFRTID0gc3lzdGVtZHN5c3RlbXVuaXRkaXI9IiIgaW5zdGFsbAogCiBkZWZp
bmUgSE9TVF9EUkFDVVRfUE9TVF9JTlNUQUxMX1dSQVBQRVJfU0NSSVBUCiAJbXYgJChIT1NUX0RJ
UikvYmluL2RyYWN1dCAkKEhPU1RfRElSKS9iaW4vZHJhY3V0LnJlYWwKLS0gCjIuMzQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
