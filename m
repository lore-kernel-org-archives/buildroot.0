Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C0BCCFA05
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 11:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D0C846B3;
	Mon,  3 Nov 2025 11:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmvtavzqigAC; Mon,  3 Nov 2025 11:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7097846BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7097846BB;
	Mon,  3 Nov 2025 11:02:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 164641A6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F063B413AC
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfR-CpOkEptP for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 11:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA17841282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA17841282
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA17841282
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 11:02:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 971C41D13;
 Mon,  3 Nov 2025 03:02:06 -0800 (PST)
Received: from debian (MacBookPro.nice.arm.com [10.34.124.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B581D3F63F;
 Mon,  3 Nov 2025 03:02:13 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon,  3 Nov 2025 12:02:11 +0100
Message-ID: <20251103110211.1092844-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH] support/testing: test_xen: more robust network
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

VGhlIHRlc3QgdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVuQXJtdjcgaGFzIGJlY29tZSB1
bnN0YWJsZSBhZnRlcgpjb21taXQgMjRmZjI1ODkwNWRmICgic3VwcG9ydC90ZXN0aW5nOiB0ZXN0
X3hlbjogYWRkIG5ldHdvcmtpbmciKSwKbGVhZGluZyB0byBhIH41MCUgY2hhbmNlIG9mIGZhaWx1
cmUgb24gZ2l0bGFiIENJLgoKVGhpcyBzZWVtcyB0byBoYXBwZW4gb25seSB3aXRoIDMyYiAobm90
IHdpdGggdGhlIDY0YiBUZXN0WGVuQWFyY2g2NCksCm9ubHkgd2l0aCBRZW11IDwgOS4xLCBhbmQg
d2hlbiB0aGlzIGhhcHBlbnMgdGhlIHRlc3Qgd2lsbCBoYW5nIGR1cmluZyBhCnN0ZXAgaW52b2x2
aW5nIHRoZSBzaW11bGF0ZWQgbmV0d29yayBhbmQgdGhlIGRvbTEgKERIQ1Agb3IgcGluZykuCgpU
aGUgcm9vdCBjYXVzZSBpcyBzdXNwZWN0ZWQgdG8gYmUgYSBidWcgaW4gdGhlIHZpcnRpby1uZXQg
aGFyZHdhcmUKZW11bGF0aW9uIG9mIHRoZSBxZW11IHZlcnNpb24gNy4yLjE1IGluY2x1ZGVkIGlu
IHRoZSBCdWlsZHJvb3QgZG9ja2VyCmltYWdlLgoKQXMgYSB3b3JrYXJvdW5kLCByZW1vdmUgYWxs
IG5ldHdvcmsgaW50ZXJhY3Rpb25zIGJldHdlZW4gZG9tMSBhbmQgdGhlCnNpbXVsYXRlZCBuZXR3
b3JrOgotIEluc3RlYWQgb2YgdGhlIGdhdGV3YXksIHBpbmcgZG9tMCBmcm9tIGRvbTEuCi0gSW5z
dGVhZCBvZiB1c2luZyBESENQLCBjb25maWd1cmUgdGhlIG5ldHdvcmsgd2l0aCBmaXhlZCBJUCBh
ZGRyZXNzZXMsCiAgc28gdGhhdCB3ZSBrbm93IHRoZSBJUCBhZGRyZXNzIG9mIHRoZSBkb20wLgoK
QSBwb3NzaWJsZSBzb2x1dGlvbiBjb3VsZCBoYXZlIGJlZW4gdG8gY29tcGlsZSBhIGhvc3QtcWVt
dSB3aXRoaW4gdGhlCnRlc3QsIGJ5IGFkZGluZyBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eSBhbmQK
QlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkgaW4gdGhlIHRlc3QgY29uZmlndXJh
dGlvbi4KVGhpcyB3b3VsZCBoYXZlIHVzZWQgdGhlIGN1cnJlbnQgQnVpbGRyb290IHZlcnNpb24g
KDEwLjEuMCkgbm90IGFmZmVjdGVkCmJ5IHRoaXMgaXNzdWUsIGJ1dCB0aGlzIHdvdWxkIGFsc28g
aGF2ZSBzaWduaWZpY2FudGx5IGluY3JlYXNlZCB0aGUgdGVzdApjb21waWxhdGlvbiB0aW1lLgoK
U2luY2UgdGhlIERIQ1AgaXMgbm90IHJlYWxseSBuZWVkZWQgaGVyZSB0byB0ZXN0IHRoZSBYZW4g
bmV0d29ya2luZwpjYXBhYmlsaXR5LCB0aGlzIGlzIHdoeSB0aGUgbmV0d29yayBjb25maWd1cmF0
aW9uIHNpbXBsaWZpY2F0aW9uIHdhcwpwcmVmZXJyZWQgaGVyZS4KCkFmdGVyIHRob3NlIGNoYW5n
ZXMgYm90aCBYZW4gdGVzdHMgYXJlIHN0YWJsZSBvbiBDSSBhbmQgbG9jYWxseS4KCkZpeGVzOiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExODcxNDU0
NjQ4ClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNv
bT4KQ2M6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQogc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkgfCAzNCArKysrKysrKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5IGIvc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkKaW5kZXggNTExMzYzYmU0MC4uNmYy
ZGEwNWQzYSAxMDA2NDQKLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94
ZW4ucHkKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkKQEAg
LTUxLDE3ICs1MSwyMSBAQCBjbGFzcyBUZXN0WGVuQmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3Qp
OgogCiAgICAgICAgIEhlcmUgaXMgdGhlIG5ldHdvcmsgc2V0dXAgd2UgdXNlIGluIHRoZSB0ZXN0
OgogCi0gICAgICAgICAgICAgICAgICAgIDogICAgICAgICBkb20wICAgICAgICA6ICAgZG9tMSAg
IDoKLSAgICAgICAgICAgICAgICAgICAgOiAgICAgICAgICAgICAgICAgICAgIDogICAgICAgICAg
OgotICAgICAgICAgICAgICAgICAgICA6ICAgICAgICBicjAgICAgICAgICAgOiAgICAgICAgICA6
Ci0gICAgICAgICAgICAgICAgICAgIDogICAgICAxMC4wLjIueCAgICAgICA6ICAgICAgICAgIDoK
LSAgICAgICAgICAgICBndyAgICAgOiAgICAgICAgIHwgICAgICAgICAgIDogICAgICAgICAgOgot
ICAgICAgICAgIDEwLjAuMi4yIC06LSBldGgwIC0tKy0tIHZpZjEuMCAtOi0tIGV0aDAgICA6Ci0g
ICAgICAgICAgICAgICAgICAgIDogICAgICAgICAgICAgICAgICAgICA6IDEwLjAuMi55IDoKLQot
ICAgICAgICBUaGUgVk1zIGdldCB0aGVpciBJUCBhZGRyZXNzZXMgd2l0aCBESENQLgotICAgICAg
ICBXZSBjcmVhdGUgYSBicmlkZ2UgaW4gZG9tMCwgd2hpY2ggYWxsb3dzIGRvbTEgdG8gcmVhY2gg
dGhlIGdhdGV3YXkuCisgICAgICAgICAgICAgICAgICAgIDogICAgICAgZG9tMCAgICAgICAgICA6
ICAgZG9tMSAgICA6CisgICAgICAgICAgICAgICAgICAgIDogICAgICAgICAgICAgICAgICAgICA6
ICAgICAgICAgICA6CisgICAgICAgICAgICAgICAgICAgIDogICAgICAgIGJyMCAgICAgICAgICA6
ICAgICAgICAgICA6CisgICAgICAgICAgICAgICAgICAgIDogICAgIDEwLjAuMi40MiAgICAgICA6
ICAgICAgICAgICA6CisgICAgICAgICAgICAgZ3cgICAgIDogICAgICAgICB8ICAgICAgICAgICA6
ICAgICAgICAgICA6CisgICAgICAgICAgMTAuMC4yLjIgLTotIGV0aDAgLS0rLS0gdmlmMS4wIC06
LS0gZXRoMCAgICA6CisgICAgICAgICAgICAgICAgICAgIDogICAgICAgICAgICAgICAgICAgICA6
IDEwLjAuMi40MyA6CisKKyAgICAgICAgVGhlIFZNcyB1c2Ugc3RhdGljIElQIGFkZHJlc3Nlcy4K
KyAgICAgICAgV2UgY3JlYXRlIGEgYnJpZGdlIGluIGRvbTAsIHdoaWNoIGFsbG93cyBkb20wIHRv
IHJlYWNoIHRoZSBnYXRld2F5LgogICAgICAgICB2aWYxLjAgaXMgYWRkZWQgdG8gdGhlIGJyaWRn
ZSBhdXRvbWF0aWNhbGx5IHdoZW4gZG9tMSBpcyBjcmVhdGVkLgorCisgICAgICAgIFRoZXJlIGlz
IGEgc3RhYmlsaXR5IGlzc3VlIGZvciBBcm12NyB3aXRoIFFlbXUgPCA5LjEsIHdoaWNoIG1ha2Vz
IHRoZQorICAgICAgICBkb20xIC0+IGd3IGNvbm5lY3Rpb24gdW5yZWxpYWJsZS4gQXMgYSB3b3Jr
YXJvdW5kLCB3ZSBpbnRlcmFjdCBvbmx5IHdpdGgKKyAgICAgICAgZG9tMCBmcm9tIGRvbTEgKGhl
bmNlIHRoZSBmaXhlZCBJUCBhZGRyZXNzZXMpLgogICAgICAgICAiIiIKIAogICAgICAgICAjIEJv
b3QgdGhlIGVtdWxhdG9yLgpAQCAtODcsOCArOTEsNyBAQCBjbGFzcyBUZXN0WGVuQmFzZShpbmZy
YS5iYXNldGVzdC5CUlRlc3QpOgogCiAgICAgICAgICMgQnJpbmcgdXAgdGhlIG5ldHdvcmsgaW4g
dGhlIGRvbTAuCiAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImlmY29uZmlnIGV0aDAgdXAiKQot
ICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJpZmNvbmZpZyBicjAgdXAiKQotICAgICAgICBzZWxm
LmFzc2VydFJ1bk9rKCJ1ZGhjcGMgLWkgYnIwIikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygi
aWZjb25maWcgYnIwIDEwLjAuMi40MiIpCiAgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImlmY29u
ZmlnIC1hIikKIAogICAgICAgICAjIFZlcmlmeSB0aGF0IHdlIGNhbiBwaW5nIHRoZSBnYXRld2F5
LgpAQCAtMTAzLDEyICsxMDYsMTEgQEAgY2xhc3MgVGVzdFhlbkJhc2UoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKICAgICAgICAgc2VsZi5hc3NlcnROb3RFcXVhbCh1dWlkLCBkb20wX3V1aWQsICJV
bmV4cGVjdGVkIGRvbTAgVVVJRCIpCiAKICAgICAgICAgIyBCcmluZyB1cCB0aGUgbmV0d29yayBp
biB0aGUgZG9tMS4KLSAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiaWZjb25maWcgZXRoMCB1cCIp
Ci0gICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soInVkaGNwYyAtaSBldGgwIikKKyAgICAgICAgc2Vs
Zi5hc3NlcnRSdW5PaygiaWZjb25maWcgZXRoMCAxMC4wLjIuNDMiKQogICAgICAgICBzZWxmLmFz
c2VydFJ1bk9rKCJpZmNvbmZpZyAtYSIpCiAKLSAgICAgICAgIyBWZXJpZnkgdGhhdCB3ZSBjYW4g
cGluZyB0aGUgZ2F0ZXdheS4KLSAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygicGluZyAtYyAzIC1B
IDEwLjAuMi4yIikKKyAgICAgICAgIyBWZXJpZnkgdGhhdCB3ZSBjYW4gcGluZyB0aGUgZG9tMC4K
KyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygicGluZyAtYyAzIC1BIDEwLjAuMi40MiIpCiAKICAg
ICAgICAgIyBEZXRhY2ggZnJvbSBkb20xJ3MgY29uc29sZSB3aXRoIENUUkwtXS4KICAgICAgICAg
IyBkb20xIGlzIHN0aWxsIHJ1bm5pbmcgaW4gdGhlIGJhY2tncm91bmQgYWZ0ZXIgdGhhdC4KLS0g
CjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
