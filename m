Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF4ACCD1BF
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 15:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7153240E9C;
	Tue, 28 Oct 2025 15:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwVuXkb330DJ; Tue, 28 Oct 2025 15:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C41640FEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C41640FEB;
	Tue, 28 Oct 2025 15:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0125270B
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 15:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1A540F90
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 15:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dGKgH4CzNBB for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 15:11:48 +0000 (UTC)
X-Greylist: delayed 309 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 28 Oct 2025 15:11:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C8AE340B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8AE340B55
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=130.75.2.113;
 helo=mailout2n.rrzn.uni-hannover.de;
 envelope-from=kaessens@sra.uni-hannover.de; receiver=<UNKNOWN> 
Received: from mailout2n.rrzn.uni-hannover.de (mailout2n.rrzn.uni-hannover.de
 [130.75.2.113])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8AE340B55
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 15:11:47 +0000 (UTC)
Received: from cleopatra.sra.uni-hannover.de (cleopatra.sra.uni-hannover.de
 [130.75.33.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailout2n.rrzn.uni-hannover.de (Postfix) with ESMTPSA id 29F9B1F93B;
 Tue, 28 Oct 2025 16:06:35 +0100 (CET)
From: =?UTF-8?q?Andreas=20K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andreas=20K=C3=A4ssens?= <kaessens@sra.uni-hannover.de>,
 Rudi Heitbaum <rudi@heitbaum.com>
Date: Tue, 28 Oct 2025 16:06:16 +0100
Message-ID: <20251028150616.338995-1-kaessens@sra.uni-hannover.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <51b5e540-d659-43a7-b45e-4d5b972cfc64@smile.fr>
References: <51b5e540-d659-43a7-b45e-4d5b972cfc64@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=uni-hannover.de; s=2024all; t=1761663996;
 bh=sEiG10aGsswtB5MHMVmJo8YyRZ2iRlsWvu/FXHggXdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GUGRHGq5up1tUeXR7fs4WjBeYqqc0Lx5CUA8OwRwIoFlnex9CvMILcz3cHxacf+jo
 MgI5JwYez4lwWNCzSmXZ8LBQAbOxn4EhlQKBTCyg9TduxGYYBxuFB9qfVKOQrNAof7
 iuxO98vfhWSSQtHSXrK8VMhTjNp7wzTTurUIbTFrzej/xQ5ngTmz7AWJXOykOgu57z
 NqJyUIqSptf4oD9dg4GXA+jfuzNL0j+v1vMcV7U0MqdSmsBe67RW8OEj5YAFIlkOZn
 sDGIZZlm7eKUfGcijbzeARztxtivYCKIYDYY6/k54w7I4AvdTYUhtpt8Za7pdY3M5L
 mvCOhGFyyqJnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sra.uni-hannover.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=uni-hannover.de header.i=@uni-hannover.de
 header.a=rsa-sha256 header.s=2024all header.b=GUGRHGq5
Subject: [Buildroot] [PATCH v2] package/yajl: fix cmake 4 compatibility
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
ZWl0YmF1bSwgcmViYXNlZCBhbmQgYXBwbGllcyB3aXRoIGZ1enogMC4KCkNDOiBSdWRpIEhlaXRi
YXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLw6Rzc2VucyA8
a2Flc3NlbnNAc3JhLnVuaS1oYW5ub3Zlci5kZT4KLS0tCiAuLi4vMDAwNS1BbGxvdy1idWlsZC13
aXRoLUNNYWtlLTQuMC4wLnBhdGNoICAgfCA2OCArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UveWFq
bC8wMDA1LUFsbG93LWJ1aWxkLXdpdGgtQ01ha2UtNC4wLjAucGF0Y2gKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3lhamwvMDAwNS1BbGxvdy1idWlsZC13aXRoLUNNYWtlLTQuMC4wLnBhdGNoIGIvcGFj
a2FnZS95YWpsLzAwMDUtQWxsb3ctYnVpbGQtd2l0aC1DTWFrZS00LjAuMC5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44ZjE2MmIyMjQ5Ci0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS95YWpsLzAwMDUtQWxsb3ctYnVpbGQtd2l0aC1DTWFrZS00LjAuMC5wYXRj
aApAQCAtMCwwICsxLDY4IEBACitGcm9tIGRkODhlMmVhMmZjM2YwNDU3MjJmNmZlZTM2MmFmMjY0
M2I1Mzk0ZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSdWRpIEhlaXRiYXVtIDxy
dWRpQGhlaXRiYXVtLmNvbT4KK0RhdGU6IEZyaSwgMjggTWFyIDIwMjUgMDk6MzE6NDAgKzAwMDAK
K1N1YmplY3Q6IFtQQVRDSF0gQWxsb3cgYnVpbGQgd2l0aCBDTWFrZSA0LjAuMAorCitmaXhlcyBk
ZXByZWNhdGVkIGNtYWtlIG9wdGlvbiBhbmQgdXNlcyBjbWFrZSAyLjguMCBUQVJHRVRfRklMRQor
dXBkYXRlIGNtYWtlIHN1cHBvcnRlZCBtaW5pbXVtIHZlcnNpb25zIHRvIDIuOC4wLi4uMy4xMAor
CityZWY6CistIGh0dHBzOi8vY21ha2Uub3JnL2NtYWtlL2hlbHAvbGF0ZXN0L3BvbGljeS9DTVAw
MDI2Lmh0bWwKKworQ01ha2UgRXJyb3IgYXQgLi4uL0NNYWtlTGlzdHMudHh0OiAoR0VUX1RBUkdF
VF9QUk9QRVJUWSk6CisgIFRoZSBMT0NBVElPTiBwcm9wZXJ0eSBtYXkgbm90IGJlIHJlYWQgZnJv
bSB0YXJnZXQgImpzb25fLi4uIi4gIFVzZSB0aGUKKyAgdGFyZ2V0IG5hbWUgZGlyZWN0bHkgd2l0
aCBhZGRfY3VzdG9tX2NvbW1hbmQsIG9yIHVzZSB0aGUgZ2VuZXJhdG9yCisgIGV4cHJlc3Npb24g
JDxUQVJHRVRfRklMRT4sIGFzIGFwcHJvcHJpYXRlLgorCitTaWduZWQtb2ZmLWJ5OiBSdWRpIEhl
aXRiYXVtIDxydWRpQGhlaXRiYXVtLmNvbT4KK0ZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvMGI2LzBiNmFkYTkzZjQ1YzE2Y2M4YzU1OGVjMjNhMGViNTZkYTJh
YTg2ZTkKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vbGxveWQveWFqbC9wdWxsLzI1Ngor
LS0tCisgQ01ha2VMaXN0cy50eHQgICAgICAgICAgICAgfCAyICstCisgcmVmb3JtYXR0ZXIvQ01h
a2VMaXN0cy50eHQgfCA0ICstLS0KKyB2ZXJpZnkvQ01ha2VMaXN0cy50eHQgICAgICB8IDQgKy0t
LQorIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQorCitk
aWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAoraW5kZXggNDcxZWVl
MTMuLmRlYmEzYTQwIDEwMDY0NAorLS0tIGEvQ01ha2VMaXN0cy50eHQKKysrKyBiL0NNYWtlTGlz
dHMudHh0CitAQCAtMTIsNyArMTIsNyBAQAorICMgQUNUSU9OIE9GIENPTlRSQUNULCBORUdMSUdF
TkNFIE9SIE9USEVSIFRPUlRJT1VTIEFDVElPTiwgQVJJU0lORyBPVVQgT0YKKyAjIE9SIElOIENP
Tk5FQ1RJT04gV0lUSCBUSEUgVVNFIE9SIFBFUkZPUk1BTkNFIE9GIFRISVMgU09GVFdBUkUuCisg
CistQ01BS0VfTUlOSU1VTV9SRVFVSVJFRChWRVJTSU9OIDIuNikKKytDTUFLRV9NSU5JTVVNX1JF
UVVJUkVEKFZFUlNJT04gMi44LjAuLi4zLjEwKQorIAorIFBST0pFQ1QoWWV0QW5vdGhlckpTT05Q
YXJzZXIgQykKKyAKK2RpZmYgLS1naXQgYS9yZWZvcm1hdHRlci9DTWFrZUxpc3RzLnR4dCBiL3Jl
Zm9ybWF0dGVyL0NNYWtlTGlzdHMudHh0CitpbmRleCA1MmE5YmVlOC4uMjY3ZDAyZTIgMTAwNjQ0
CistLS0gYS9yZWZvcm1hdHRlci9DTWFrZUxpc3RzLnR4dAorKysrIGIvcmVmb3JtYXR0ZXIvQ01h
a2VMaXN0cy50eHQKK0BAIC0zOSw5ICszOSw3IEBAIElGIChOT1QgV0lOMzIpCisgRU5ESUYgKE5P
VCBXSU4zMikKKyAKKyAjIGNvcHkgdGhlIGJpbmFyeSBpbnRvIHRoZSBvdXRwdXQgZGlyZWN0b3J5
CistR0VUX1RBUkdFVF9QUk9QRVJUWShiaW5QYXRoIGpzb25fcmVmb3JtYXQgTE9DQVRJT04pCist
CisgQUREX0NVU1RPTV9DT01NQU5EKFRBUkdFVCBqc29uX3JlZm9ybWF0IFBPU1RfQlVJTEQKKy0g
ICAgQ09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIGNvcHlfaWZfZGlmZmVyZW50ICR7YmluUGF0
aH0gJHtiaW5EaXJ9KQorKyAgICBDT01NQU5EICR7Q01BS0VfQ09NTUFORH0gLUUgY29weV9pZl9k
aWZmZXJlbnQgJDxUQVJHRVRfRklMRTpqc29uX3JlZm9ybWF0PiAke2JpbkRpcn0pCisgCisgSU5T
VEFMTChUQVJHRVRTIGpzb25fcmVmb3JtYXQgUlVOVElNRSBERVNUSU5BVElPTiBiaW4pCitkaWZm
IC0tZ2l0IGEvdmVyaWZ5L0NNYWtlTGlzdHMudHh0IGIvdmVyaWZ5L0NNYWtlTGlzdHMudHh0Citp
bmRleCA5NjdmY2ExNi4uMmYzOTAwODIgMTAwNjQ0CistLS0gYS92ZXJpZnkvQ01ha2VMaXN0cy50
eHQKKysrKyBiL3ZlcmlmeS9DTWFrZUxpc3RzLnR4dAorQEAgLTMzLDkgKzMzLDcgQEAgRUxTRSgp
CisgRU5ESUYoKQorIAorICMgY29weSBpbiB0aGUgYmluYXJ5CistR0VUX1RBUkdFVF9QUk9QRVJU
WShiaW5QYXRoIGpzb25fdmVyaWZ5IExPQ0FUSU9OKQorLQorIEFERF9DVVNUT01fQ09NTUFORChU
QVJHRVQganNvbl92ZXJpZnkgUE9TVF9CVUlMRAorLSAgICBDT01NQU5EICR7Q01BS0VfQ09NTUFO
RH0gLUUgY29weV9pZl9kaWZmZXJlbnQgJHtiaW5QYXRofSAke2JpbkRpcn0pCisrICAgIENPTU1B
TkQgJHtDTUFLRV9DT01NQU5EfSAtRSBjb3B5X2lmX2RpZmZlcmVudCAkPFRBUkdFVF9GSUxFOmpz
b25fdmVyaWZ5PiAke2JpbkRpcn0pCisgCisgSU5TVEFMTChUQVJHRVRTIGpzb25fdmVyaWZ5IFJV
TlRJTUUgREVTVElOQVRJT04gYmluKQotLSAKMi41MS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
