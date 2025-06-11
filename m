Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6373EC677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 08:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0E840E4F;
	Wed, 11 Jun 2025 08:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rer1K5YN-dDS; Wed, 11 Jun 2025 08:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6513B40E61
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6513B40E61;
	Wed, 11 Jun 2025 08:46:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A66831F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 982A660760
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2PwpToIScTYP for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 08:46:28 +0000 (UTC)
X-Greylist: delayed 322 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Jun 2025 08:46:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C4166078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4166078E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.75.2.113;
 helo=mailout2n.rrzn.uni-hannover.de;
 envelope-from=kaessens@sra.uni-hannover.de; receiver=<UNKNOWN> 
Received: from mailout2n.rrzn.uni-hannover.de (mailout2n.rrzn.uni-hannover.de
 [130.75.2.113])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C4166078E
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 08:46:27 +0000 (UTC)
Received: from cleopatra.sra.uni-hannover.de (cvs.sra.uni-hannover.de
 [130.75.33.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailout2n.rrzn.uni-hannover.de (Postfix) with ESMTPSA id 43C101F43B;
 Wed, 11 Jun 2025 10:41:01 +0200 (CEST)
From: =?UTF-8?q?Andreas=20K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andreas=20K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>,
 Rudi Heitbaum <rudi@heitbaum.com>
Date: Wed, 11 Jun 2025 10:40:23 +0200
Message-ID: <20250611084023.22693-1-kaessens@sra.uni-hannover.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.9 at mailout2n
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=uni-hannover.de; s=2024all; t=1749631262;
 bh=mzTzvzIsS9YFs+Z3k1Yo+Bd0PAANCT5a4JwmXhK1EfE=;
 h=From:To:Cc:Subject:Date:From;
 b=TuhQ4TcgOoSQEIcF2dFE4Yzw9zzZQ5YE/Bj3NMJbRadKHWr85vMZH7Q+b3vzztFUF
 0pkBaYIsFEXJisy1x3dPhxR93EWPuEQ7i3cd6CJtNlxCnBntF4oJ5rsiu/f0H0Slu8
 RFEkAnTNSECNV2byIARLE4O2HUpVrayoP0Bm2Egv2N4YaN2w7JolMtmrC9TuV6aSFa
 DKCaZYLagk3AAprNtJCdgojBFdR7v5Hv/qvudIEu7Cn2xBxPb8P2w+IcZ0TdFxoqHi
 zk2C1DfHV9KTNRWN5IOfmfJqPvoZ1moIe4Oo3rHC+zQljSXhujeAK/BpQhYsS4koo1
 180nqF2Tp6Vyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sra.uni-hannover.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=uni-hannover.de header.i=@uni-hannover.de
 header.a=rsa-sha256 header.s=2024all header.b=TuhQ4Tcg
Subject: [Buildroot] [PATCH] package/yajl: fix cmake 4 compatibility
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

Rml4ZXMgZGVwcmVjYXRlZCBDTWFrZSBvcHRpb25zLgoKT3JpZ2luYWwgcGF0Y2ggYnkgUnVkaSBI
ZWl0YmF1bSwgcmViYXNlZCBhbmQgYXBwbGllcyB3aXRoIGZ1enogMC4KaHR0cHM6Ly9naXRodWIu
Y29tL3J0b2Jhci95YWpsL2NvbW1pdC9kZDg4ZTJlYTJmYzNmMDQ1NzIyZjZmZWUzNjJhZjI2NDNi
NTM5NGY1LnBhdGNoCgpDQzogUnVkaSBIZWl0YmF1bSA8cnVkaUBoZWl0YmF1bS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFuZHJlYXMgS8Okc3NlbnMgPGthZXNzZW5zQHNyYS51bmktaGFubm92ZXIuZGU+
Ci0tLQoKVGhlIG9yaWdpbmFsIHBhY2thZ2UgaGFzbid0IGJlZW4gdXBkYXRlZCBmb3IgMTAgeWVh
cnMgCmFuZCB0aGUgeWFqbCBmb3JrIGNvbnRhaW5zIENWRSBmaXhlcyBhcyB3ZWxsLApidXQgaSBk
b24ndCBrbm93IGhvdyB0byBoYW5kbGUgdGhhdC4KQWxzbyBwbGVhc2UgY29uc2lkZXIgdGhhdCB0
aGlzIGlzIG15IGZpcnN0IHN1Ym1pc3Npb24gdG8gYnVpbGRyb290LAppZiB0aGVyZSBhcmUgYW55
IGlzc3VlcyB3aXRoIHRoZSBwYXRjaCwgcGxlYXNlIGxldCBtZSBrbm93LgoKCiAuLi4vMDAwNS1B
bGxvdy1idWlsZC13aXRoLUNNYWtlLTQuMC4wLnBhdGNoICAgfCA2NiArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UveWFqbC8wMDA1LUFsbG93LWJ1aWxkLXdpdGgtQ01ha2UtNC4wLjAucGF0Y2gKCmRp
ZmYgLS1naXQgYS9wYWNrYWdlL3lhamwvMDAwNS1BbGxvdy1idWlsZC13aXRoLUNNYWtlLTQuMC4w
LnBhdGNoIGIvcGFja2FnZS95YWpsLzAwMDUtQWxsb3ctYnVpbGQtd2l0aC1DTWFrZS00LjAuMC5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jNzJlNGRlNmFjCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS95YWpsLzAwMDUtQWxsb3ctYnVpbGQtd2l0aC1DTWFr
ZS00LjAuMC5wYXRjaApAQCAtMCwwICsxLDY2IEBACitGcm9tIGRkODhlMmVhMmZjM2YwNDU3MjJm
NmZlZTM2MmFmMjY0M2I1Mzk0ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSdWRp
IEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KK0RhdGU6IEZyaSwgMjggTWFyIDIwMjUgMDk6
MzE6NDAgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gQWxsb3cgYnVpbGQgd2l0aCBDTWFrZSA0LjAu
MAorCitmaXhlcyBkZXByZWNhdGVkIGNtYWtlIG9wdGlvbiBhbmQgdXNlcyBjbWFrZSAyLjguMCBU
QVJHRVRfRklMRQordXBkYXRlIGNtYWtlIHN1cHBvcnRlZCBtaW5pbXVtIHZlcnNpb25zIHRvIDIu
OC4wLi4uMy4xMAorCityZWY6CistIGh0dHBzOi8vY21ha2Uub3JnL2NtYWtlL2hlbHAvbGF0ZXN0
L3BvbGljeS9DTVAwMDI2Lmh0bWwKKworQ01ha2UgRXJyb3IgYXQgLi4uL0NNYWtlTGlzdHMudHh0
OiAoR0VUX1RBUkdFVF9QUk9QRVJUWSk6CisgIFRoZSBMT0NBVElPTiBwcm9wZXJ0eSBtYXkgbm90
IGJlIHJlYWQgZnJvbSB0YXJnZXQgImpzb25fLi4uIi4gIFVzZSB0aGUKKyAgdGFyZ2V0IG5hbWUg
ZGlyZWN0bHkgd2l0aCBhZGRfY3VzdG9tX2NvbW1hbmQsIG9yIHVzZSB0aGUgZ2VuZXJhdG9yCisg
IGV4cHJlc3Npb24gJDxUQVJHRVRfRklMRT4sIGFzIGFwcHJvcHJpYXRlLgorCitTaWduZWQtb2Zm
LWJ5OiBSdWRpIEhlaXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KKy0tLQorIENNYWtlTGlzdHMu
dHh0ICAgICAgICAgICAgIHwgMiArLQorIHJlZm9ybWF0dGVyL0NNYWtlTGlzdHMudHh0IHwgNCAr
LS0tCisgdmVyaWZ5L0NNYWtlTGlzdHMudHh0ICAgICAgfCA0ICstLS0KKyAzIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL0NNYWtl
TGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKK2luZGV4IDQ3MWVlZTEzLi5kZWJhM2E0MCAxMDA2
NDQKKy0tLSBhL0NNYWtlTGlzdHMudHh0CisrKysgYi9DTWFrZUxpc3RzLnR4dAorQEAgLTEyLDcg
KzEyLDcgQEAKKyAjIEFDVElPTiBPRiBDT05UUkFDVCwgTkVHTElHRU5DRSBPUiBPVEhFUiBUT1JU
SU9VUyBBQ1RJT04sIEFSSVNJTkcgT1VUIE9GCisgIyBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhF
IFVTRSBPUiBQRVJGT1JNQU5DRSBPRiBUSElTIFNPRlRXQVJFLgorIAorLUNNQUtFX01JTklNVU1f
UkVRVUlSRUQoVkVSU0lPTiAyLjYpCisrQ01BS0VfTUlOSU1VTV9SRVFVSVJFRChWRVJTSU9OIDIu
OC4wLi4uMy4xMCkKKyAKKyBQUk9KRUNUKFlldEFub3RoZXJKU09OUGFyc2VyIEMpCisgCitkaWZm
IC0tZ2l0IGEvcmVmb3JtYXR0ZXIvQ01ha2VMaXN0cy50eHQgYi9yZWZvcm1hdHRlci9DTWFrZUxp
c3RzLnR4dAoraW5kZXggNTJhOWJlZTguLjI2N2QwMmUyIDEwMDY0NAorLS0tIGEvcmVmb3JtYXR0
ZXIvQ01ha2VMaXN0cy50eHQKKysrKyBiL3JlZm9ybWF0dGVyL0NNYWtlTGlzdHMudHh0CitAQCAt
MzksOSArMzksNyBAQCBJRiAoTk9UIFdJTjMyKQorIEVORElGIChOT1QgV0lOMzIpCisgCisgIyBj
b3B5IHRoZSBiaW5hcnkgaW50byB0aGUgb3V0cHV0IGRpcmVjdG9yeQorLUdFVF9UQVJHRVRfUFJP
UEVSVFkoYmluUGF0aCBqc29uX3JlZm9ybWF0IExPQ0FUSU9OKQorLQorIEFERF9DVVNUT01fQ09N
TUFORChUQVJHRVQganNvbl9yZWZvcm1hdCBQT1NUX0JVSUxECistICAgIENPTU1BTkQgJHtDTUFL
RV9DT01NQU5EfSAtRSBjb3B5X2lmX2RpZmZlcmVudCAke2JpblBhdGh9ICR7YmluRGlyfSkKKysg
ICAgQ09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIGNvcHlfaWZfZGlmZmVyZW50ICQ8VEFSR0VU
X0ZJTEU6anNvbl9yZWZvcm1hdD4gJHtiaW5EaXJ9KQorIAorIElOU1RBTEwoVEFSR0VUUyBqc29u
X3JlZm9ybWF0IFJVTlRJTUUgREVTVElOQVRJT04gYmluKQorZGlmZiAtLWdpdCBhL3ZlcmlmeS9D
TWFrZUxpc3RzLnR4dCBiL3ZlcmlmeS9DTWFrZUxpc3RzLnR4dAoraW5kZXggOTY3ZmNhMTYuLjJm
MzkwMDgyIDEwMDY0NAorLS0tIGEvdmVyaWZ5L0NNYWtlTGlzdHMudHh0CisrKysgYi92ZXJpZnkv
Q01ha2VMaXN0cy50eHQKK0BAIC0zMyw5ICszMyw3IEBAIEVMU0UoKQorIEVORElGKCkKKyAKKyAj
IGNvcHkgaW4gdGhlIGJpbmFyeQorLUdFVF9UQVJHRVRfUFJPUEVSVFkoYmluUGF0aCBqc29uX3Zl
cmlmeSBMT0NBVElPTikKKy0KKyBBRERfQ1VTVE9NX0NPTU1BTkQoVEFSR0VUIGpzb25fdmVyaWZ5
IFBPU1RfQlVJTEQKKy0gICAgQ09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIGNvcHlfaWZfZGlm
ZmVyZW50ICR7YmluUGF0aH0gJHtiaW5EaXJ9KQorKyAgICBDT01NQU5EICR7Q01BS0VfQ09NTUFO
RH0gLUUgY29weV9pZl9kaWZmZXJlbnQgJDxUQVJHRVRfRklMRTpqc29uX3ZlcmlmeT4gJHtiaW5E
aXJ9KQorIAorIElOU1RBTEwoVEFSR0VUUyBqc29uX3ZlcmlmeSBSVU5USU1FIERFU1RJTkFUSU9O
IGJpbikKLS0gCjIuNDkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
