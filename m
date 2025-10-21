Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F2ECCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 16:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16AF406CE;
	Tue, 21 Oct 2025 16:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKyMt87yyXw1; Tue, 21 Oct 2025 16:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D712B40584
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D712B40584;
	Tue, 21 Oct 2025 16:51:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB3CA277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A220981D72
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWed_PWjfrHK for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 16:51:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C50F281AD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50F281AD7
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id C50F281AD7
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 16:51:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AB981063;
 Tue, 21 Oct 2025 09:51:26 -0700 (PDT)
Received: from debian (MacBookPro.nice.Arm.com [10.34.111.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B72EF3F66E;
 Tue, 21 Oct 2025 09:51:33 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2025 18:51:26 +0200
Message-ID: <20251021165126.168606-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH v2] utils/brmake: filter output for parallel
 build
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

V2hlbiBidWlsZGluZyBpbiBwYXJhbGxlbCB3aXRoIHBlci1wYWNrYWdlIGRpcmVjdG9yaWVzCihC
UjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eSksIGJybWFrZSBvdXRwdXQgaXMgb2Z0ZW4gZ2Fy
YmxlZDoKCiAgMjAyNS0xMC0wOFQxODozOToxMCA+Pj4gaG9zdC1kdGMgMS43LjIgQnVpbGRpbmcK
ICAyMDI1LTEwLTA4VDE4OjM5OjExIGNoZWNraW5nIGZvciBzdGRpbnQuaC4uLiA+Pj4gaG9zdC1k
dGMgMS43LjIgSW5zdGFsbGluZyB0byBob3N0IGRpcmVjdG9yeQogIDIwMjUtMTAtMDhUMTg6Mzk6
MTIgY2hlY2tpbmcgZm9yIGxpbWl0cy5oLi4uID4+PiBob3N0LWdtcCA2LjMuMCBJbnN0YWxsaW5n
IHRvIGhvc3QgZGlyZWN0b3J5CgpSZW1vdmUgdGhlIHNwdXJpb3VzIHN0cmluZyBiZXR3ZWVuIHRo
ZSB0aW1lc3RhbXAgYW5kIHRoZSAiPj4+IiBtYXJrZXIgdG8KZml4IHRoaXMuCldlIG5lZWQgc29t
ZSBleHRyYSBjYXJlIHRvIHByZXNlcnZlIHRoZSBwcmVjZWRpbmcgInRlcm0gYm9sZCIgc3BlY2lh
bApjaGFyYWN0ZXJzIHNlcXVlbmNlLgoKV2UgYWxzbyBwcmV2ZW50IGdyZXAgYW5kIHNlZCB0byBi
dWZmZXIgdGhlaXIgb3V0cHV0IHRvbyBtdWNoLiBUaGlzIGxlYWRzIHRvCm1vcmUgZnJlcXVlbnQg
b3V0cHV0IGV2ZW4gd2hlbiB3ZSBtaWdodCBub3QgYmUgY29ubmVjdGVkIHRvIGEgdGVybWluYWw7
IGZvcgpleGFtcGxlOiB3aGVuIGJybWFrZSdzIG91dHB1dCBpcyBwaXBlZCB0byBhbm90aGVyIHBy
b2dyYW0gb3Igd2hlbiBydW5uaW5nCmluIENJLgoKUmV2aWV3ZWQtYnk6IE1hcmN1cyBIb2ZmbWFu
biA8YnVpbGRyb290QGJ1YnUxLmV1PgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZp
bmNlbnQuc3RlaGxlQGFybS5jb20+CkNjOiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5OThA
ZnJlZS5mcj4KLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gQWRkIHRoZSBgLS11bmJ1ZmZlcmVk
JyBvcHRpb24gdG8gc2VkICAoc3VnZ2VzdGVkIGJ5IE1hcmN1cykKICAtIEV4cGxhaW4gYnVmZmVy
aW5nIGEgYml0IG1vcmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlICAoc3VnZ2VzdGVkIGJ5IE1hcmN1
cykKCkhpIE1hcmN1cywKClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBpbnRlcmVzdCBpbiB0aGlzIHBh
dGNoLgpJIGhhdmUgYWRkZWQgeW91ciByZXZpZXdlZC1ieTsgcGxlYXNlIGxldCB1cyBrbm93IGlm
IHlvdXIgdGVzdGVkLWJ5IGNvdWxkCmJlIGFkZGVkIHRvIHRoaXMgdjIgYXMgd2VsbC4KCkRlYXIg
WWFubiwKClRoYW5rIHlvdSBmb3IgeW91ciBpbnRlcmVzdCBhbmQgZm9yIHNoYXJpbmcgeW91ciBi
cm1ha2UgcmV3cml0ZS4KVG8gYmUgaG9uZXN0LCBJIGZlZWwgbW9yZSBjb21mb3J0YWJsZSB3aXRo
IGp1c3QgdGhpcyBjb3VwbGUgb2YgbW9kaWZpZWQKbGluZXMsIHdoaWNoIEkgdGhpbmsgYXJlIHdl
bGwgdW5kZXJzdG9vZCBub3cgYWZ0ZXIgdGhlIGRpc2N1c3Npb24gd2l0aApNYXJjdXMsIHRoYW4g
d2l0aCB0aGUgbG9uZ2VyIGJhc2ggdmVyc2lvbiB1c2luZyBtb3JlICJhZHZhbmNlZCIgbWVjaGFu
aXNtcywKbGlrZSBzaWduYWxzIGFuZCBjb3Byb2Nlc3Nlcy4gSSB0aGluayBJIHdpbGwgbm90IGRh
cmUgdG8gc3VibWl0IHRoaXMgbW9yZQpjb21wbGV4IHZlcnNpb24uLi4KCkJlc3QgcmVnYXJkcywK
ClZpbmNlbnQuCgoKIHV0aWxzL2JybWFrZSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdXRpbHMvYnJtYWtlIGIvdXRp
bHMvYnJtYWtlCmluZGV4IGE0YjllN2ZhNzEuLmMyOWU1NmE5YmMgMTAwNzU1Ci0tLSBhL3V0aWxz
L2JybWFrZQorKysgYi91dGlscy9icm1ha2UKQEAgLTEyLDcgKzEyLDggQEAgbWFpbigpIHsKICAg
ICAgICAgICAgICBwcmludGYgIiUoJVktJW0tJWRUJUg6JU06JVMpVCAlc1xuIiAtMSAiJHtsaW5l
fSIKICAgICAgICAgIGRvbmUgXAogICAgICAgICAgfHRlZSAtYSBici5sb2cgXAotICAgICAgICAg
fGdyZXAgLS1jb2xvdXI9bmV2ZXIgLUUgJz4+PicKKyAgICAgICAgIHxncmVwIC0tbGluZS1idWZm
ZXJlZCAtLWNvbG91cj1uZXZlciAtRSAnPj4+JyBcCisgICAgICAgICB8c2VkIC0tdW5idWZmZXJl
ZCAtRSAncy9eKFswLTlUOi1dezE5fSkgW1s6cHJpbnQ6XV0qKC4qPj4+ICkvXDEgXDIvJwogICAg
ICAgICkKICAgICByZXQ9JHs/fQogCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
