Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC6CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 06:32:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3928B60EFD
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 06:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3928B60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8AB660710;
	Thu, 11 Nov 2021 06:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCeLBbcrIeIu; Thu, 11 Nov 2021 06:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25CBD60698;
	Thu, 11 Nov 2021 06:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9181BF285
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 06:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14E35819CC
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 06:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mEa196chSz0 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 06:32:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A9C181934
 for <buildroot@busybox.net>; Thu, 11 Nov 2021 06:32:30 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 59D09440A60;
 Thu, 11 Nov 2021 08:32:11 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636612331;
 bh=fRwrvpMy+Y7lbNPciH1CeYFsG57Auo61sN3McCKX62Y=;
 h=From:To:Cc:Subject:Date:From;
 b=EhOO18IeYujLPzSHKfodGjHmrzFC37wQu7wabr2pV0V+sCoRnm+czvFwU7X+1kY7R
 ndD4lt9uilO8PEkNCdhWgIUd57NMkIy9kh/BMR+4BqB4zDsYNuppMUuoWADM8kcy/k
 nKwj0hjxVUjQQbydPyyY2lgdoy5I2zPCMVk9Z3IIleK6h3esOH3pwP7TH0pkN29Oms
 Ogll7qBZ3krSF2jv5vo3zlC6oZI+9+OfL4O0zSXtaWNcUYl/5jKmqUiPkao4pVFnIh
 ViTg9qYMOQCmRx5zZ79Y5iXcbqNZqseWLd3E7nR0lYYQQoT3djUrRLC/I0HcK1IT76
 6gmV9LaS7FMiA==
To: buildroot@busybox.net
Date: Thu, 11 Nov 2021 08:32:18 +0200
Message-Id: <67639c1e1d0f8d008160744cf8a056fe9eedfd06.1636612338.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] iperf: fix build with musl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGF0Y2ggY2hhbmdpbmcgaGVhZGVycyBpbmNsdWRlIG9yZGVyIHRvIGZpeCAnc3RydWN0
IGV0aGhkcicKY29uZmxpY3QgYmV0d2VlbiBrZXJuZWwgaGVhZGVycyBhbmQgbXVzbCBsaWJjLgoK
Rml4ZXM6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzIzYWRhNjlmOWI3
ZGM0NDYwMzE1ZDkxNzVkMzA2NGQ4ZGIxODJmOGUvCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzNkOWM5ODUwZGU4ZGE1YjEwYmVjNGYyNWJlMDdkOWVjYmM4ZTA5MzEvCmh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzI1MTE2YWY3NzBjZjk0MjI3MzAy
Y2ZjMWNmZjRkZWQwN2U4NWZlNDkvCgpDYzogTWF0dCBXZWJlciA8bWF0dGhldy53ZWJlckBjb2xs
aW5zLmNvbT4KQ2M6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBCYXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPgotLS0KIC4u
Li9pcGVyZi8wMDAxLUZpeC1idWlsZC13aXRoLW11c2wtbGliYy5wYXRjaCB8IDY3ICsrKysrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9pcGVyZi8wMDAxLUZpeC1idWlsZC13aXRoLW11c2wtbGliYy5wYXRj
aAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXBlcmYvMDAwMS1GaXgtYnVpbGQtd2l0aC1tdXNsLWxp
YmMucGF0Y2ggYi9wYWNrYWdlL2lwZXJmLzAwMDEtRml4LWJ1aWxkLXdpdGgtbXVzbC1saWJjLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMjY5MDc5ZWUxZTc3
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9pcGVyZi8wMDAxLUZpeC1idWlsZC13aXRoLW11
c2wtbGliYy5wYXRjaApAQCAtMCwwICsxLDY3IEBACitGcm9tIDY3NjZhYjMyMmE5ZWI4YzczZjgy
NzZiZTljZGVhMzU2ZWIxMjRkZTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCYXJ1
Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPgorRGF0ZTogVGh1LCAxMSBOb3YgMjAyMSAwNzo1
ODoxMCArMDIwMAorU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgd2l0aCBtdXNsIGxpYmMKK01J
TUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
K0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworbXVzbCBsaWJjIGRlZmluZXMgaXRz
IG93biBzdHJ1Y3QgZXRoaGRyIHRoYXQgY29uZmxpY3RzIHdpdGggdGhlIGtlcm5lbAorZGVmaW5l
IG9uZS4gVGhlIGtlcm5lbCBoZWFkZXJzIHByb3ZpZGUgYSB3YXkgdG8gc3VwcHJlc3MgaXRzIHN0
cnVjdAorZXRoaGRyLiBGb3IgdGhhdCB0byB3b3JrIHRoZSBsaWJjIGhlYWRlcnMgbXVzdCBwcmVj
ZWRlIHRoZSBrZXJuZWwuIE1vdmUKK3RoZSBrZXJuZWwgbGludXgvaWZfdHVuLmggaW5jbHVkZSBi
ZWxvdyBsaWJjIG5ldC9ldGhlcm5ldC5oLiBUaGF0IGZpeGVzCit0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmU6CisKK0luIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi4vYXJtLWJ1aWxkcm9vdC1saW51
eC1tdXNsZWFiaWhmL3N5c3Jvb3QvdXNyL2luY2x1ZGUvbmV0L2V0aGVybmV0Lmg6MTAsCisgICAg
ICAgICAgICAgICAgIGZyb20gLi4vaW5jbHVkZS9oZWFkZXJzLmg6MTE3LAorICAgICAgICAgICAg
ICAgICBmcm9tIFRocmVhZC5jOjcyOgorLi4uL2FybS1idWlsZHJvb3QtbGludXgtbXVzbGVhYmlo
Zi9zeXNyb290L3Vzci9pbmNsdWRlL25ldGluZXQvaWZfZXRoZXIuaDoxMTY6ODogZXJyb3I6IHJl
ZGVmaW5pdGlvbiBvZiDigJhzdHJ1Y3QgZXRoaGRy4oCZCisgIDExNiB8IHN0cnVjdCBldGhoZHIg
eworICAgICAgfCAgICAgICAgXn5+fn5+CitJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4uL2FybS1i
dWlsZHJvb3QtbGludXgtbXVzbGVhYmloZi9zeXNyb290L3Vzci9pbmNsdWRlL2xpbnV4L2lmX3R1
bi5oOjIwLAorICAgICAgICAgICAgICAgICBmcm9tIC4uL2luY2x1ZGUvaGVhZGVycy5oOjExMCwK
KyAgICAgICAgICAgICAgICAgZnJvbSBUaHJlYWQuYzo3MjoKKy4uLi9hcm0tYnVpbGRyb290LWxp
bnV4LW11c2xlYWJpaGYvc3lzcm9vdC91c3IvaW5jbHVkZS9saW51eC9pZl9ldGhlci5oOjE0ODo4
OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQorICAxNDggfCBzdHJ1Y3QgZXRoaGRyIHsK
KyAgICAgIHwgICAgICAgIF5+fn5+fgorCitGaXhlcyBidWcgIzE1Ny4KKworU2lnbmVkLW9mZi1i
eTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KKy0tLQorVXBzdHJlYW0gc3RhdHVz
OiBzZW50IHRvIFJvYmVydCBNY01haG9uIDxyam1jbWFob25AcmptY21haG9uLmNvbT4KKworIGlu
Y2x1ZGUvaGVhZGVycy5oIHwgMTAgKysrKystLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9pbmNsdWRlL2hlYWRlcnMu
aCBiL2luY2x1ZGUvaGVhZGVycy5oCitpbmRleCAwMGUwZWEwZGJhNDIuLjg4NzQ5MDQ3NTM4MSAx
MDA2NDQKKy0tLSBhL2luY2x1ZGUvaGVhZGVycy5oCisrKysgYi9pbmNsdWRlL2hlYWRlcnMuaAor
QEAgLTEwNiwxMSArMTA2LDYgQEAgdHlwZWRlZiBib29sIF9Cb29sOworICNpbmNsdWRlIDxuZXQv
aWYuaD4KKyAjZW5kaWYKKyAKKy0jaWYgKChIQVZFX1RVTlRBUF9UQVApIHx8IChIQVZFX1RVTlRB
UF9UVU4pKQorLSNpbmNsdWRlIDxsaW51eC9pZl90dW4uaD4KKy0jaW5jbHVkZSA8c3lzL2lvY3Rs
Lmg+CistI2VuZGlmCistCisgCisgLy8gQUZfUEFDS0VUIEhFQURFUlMKKyAjaWYgZGVmaW5lZChI
QVZFX0xJTlVYX0ZJTFRFUl9IKSAmJiBkZWZpbmVkKEhBVkVfQUZfUEFDS0VUKQorQEAgLTE0Niw2
ICsxNDEsMTEgQEAgdHlwZWRlZiBib29sIF9Cb29sOworICNkZWZpbmUgIElQVjZIRFJMRU4gNDAK
KyAjZW5kaWYgLy8gSEFWRV9BRl9QQUNLRVQKKyAKKysjaWYgKChIQVZFX1RVTlRBUF9UQVApIHx8
IChIQVZFX1RVTlRBUF9UVU4pKQorKyNpbmNsdWRlIDxsaW51eC9pZl90dW4uaD4KKysjaW5jbHVk
ZSA8c3lzL2lvY3RsLmg+CisrI2VuZGlmCisrCisgI2lmZGVmIFdJTjMyCisgCisgLyogV2luZG93
cyBjb25maWcgZmlsZSAqLworLS0gCisyLjMzLjAKKwotLSAKMi4zMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
