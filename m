Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09A9C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 397A242CFA;
	Wed, 19 Feb 2025 08:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BPZc7Roe3Qi; Wed, 19 Feb 2025 08:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF7D04FD5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF7D04FD5B;
	Wed, 19 Feb 2025 08:24:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F88DC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62AE3848C5
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVxaKDavQT5n for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.103;
 helo=smtp-outgoing-1802.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4334A848BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4334A848BF
Received: from smtp-outgoing-1802.laposte.net (smtp-outgoing-1802.laposte.net
 [160.92.124.103])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4334A848BF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:24:15 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyTvJ2CZ1zWf0T","contextId":
 "443c27cd-769c-4a10-b062-17474701f073"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4YyTvJ2CZ1zWf0T;
 Wed, 19 Feb 2025 09:24:12 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyTvH6JtxzWf0M","contextId":
 "881d7b3a-686a-4458-a135-7e7bb64202c7"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4YyTvH6JtxzWf0M;
 Wed, 19 Feb 2025 09:24:11 +0100 (CET)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 25DB16404995;
 Wed, 19 Feb 2025 09:24:31 +0100 (CET)
Received: from vincent by radicelle with local (Exim 4.98)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1tkfNt-000000007pL-1WLz; Wed, 19 Feb 2025 09:24:45 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Feb 2025 09:24:42 +0100
Message-ID: <20250219082442.30082-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1739953453;
 bh=l4mw7BslDXHyonNtC2N4pZR4SEntklW5N3iEcMFFi6w=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=lZSWAN0cgX8fH7qlIJO4Crn0eGI/qhmTn9/WLo9+ccU8qT55xoRNjbaNTR3rUpqiRus2OZsEZUKQgpyO837qO90zWJ9zRhlb7DRwbIpKwx0bgba9N5bHWYDdiJwiqsxYkg1VSDnfiphH6CVsEHteqFYnlNZh7KaYdpJlebm1zDWEWQOH4G/ZaGyDSUNIywgGC1sFRSFNSbQIHfZrjvKcGECawmdbmiG8eSTAWRGxEQFv9tSV6bARyuhtFlT9rtdMuz36Ljm1YtgYFeqUh3Qzws3EUHMSQ1PEa/N84csKzoxUUpwLMq34gZWxc9qlQcwMDwkbjVK/CxkLAe/O6Xo8NQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=lZSWAN0c
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux 6.12
 and model 11.27
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni4xMi4xNSBhbmQgdXBkYXRlIHRoZSBoYXNoIGZpbGUu
Ci0gQnVtcCB0aGUgRlZQIGluIHRoZSByZWFkbWUgdG8gdmVyc2lvbiAxMS4yNyBidWlsZCAxOS4K
CldoaWxlIGF0IGl0OgotIFJld29yayB0aGUgcmVhZG1lIGEgYml0IHdpdGggZXhwbGljaXQgYnVp
bGQgaW5zdHJ1Y3Rpb25zLCBhZGQgYSBsaW5rCiAgdG8gdGhlIG1vZGVsIGJpbmFyaWVzIHJ1bm5p
bmcgb24gQUFyY2g2NCBob3N0IGFuZCB1cGRhdGUgdGhlIG1vZGVsCiAgY29tbWFuZCBsaW5lIHRv
IHNwZWNpZnkgQXJtIHY4LjAgKGFzIHdlIGFyZSBidWlsZGluZyBmb3IgQ29ydGV4LUE1MykuCi0g
VHVybiBvbiBoYXNoZXMgdmVyaWZpY2F0aW9uIGFuZCB1cGRhdGUgLmNoZWNrcGFja2FnZWlnbm9y
ZQogIGFjY29yZGluZ2x5LgotIEFkZCBteXNlbGYgYXMgY28tZGV2ZWxvcGVyIGZvciB0aGlzIGRl
ZmNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVA
bGFwb3N0ZS5uZXQ+CkNjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25l
eHQuY29tPgotLS0KCgpIaSwKClRoaXMgd2FzIHRlc3RlZCBvaywgYm90aCB3aXRoIHRoZSBhY3R1
YWwgYm9vdC13cmFwcGVyLWFhcmNoNjQgdmVyc2lvbgphbmQgbmV3IG9uZSBpbi1mbGlnaHQgYXQg
WzFdLgoKRGVhciBNYXNhaGlyby1zYW4sIGRlYXIgbWFpbnRhaW5lcnMsIEkgYW0gYWRkaW5nIG15
c2VsZiBpbiBERVZFTE9QRVJTIHRvCnJlY2VpdmUgZnV0dXJlIG5vdGlmaWNhdGlvbnMgYnkgZS1t
YWlsLiBEbyBub3QgaGVzaXRhdGUgdG8gZHJvcCB0aGlzCnBhcnQgaWYgdGhhdCBpcyBub3QgYXBw
cm9wcmlhdGUuCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgpbMV0gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNS1GZWJydWFyeS83NzMzNTUuaHRtbAoK
CiAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBE
RVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogLi4u
L2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoICAgIHwgIDMgKystCiBib2Fy
ZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0ICAgICAgICAgICAgfCAyNiArKysrKysrKysr
KysrKysrLS0tCiBjb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnICAgICAgICAgICAg
fCAgNSArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25v
cmUKaW5kZXggZDU0YmQzNTNiMi4uYjEwZjY5ZWMzNiAxMDA2NDQKLS0tIGEvLmNoZWNrcGFja2Fn
ZWlnbm9yZQorKysgYi8uY2hlY2twYWNrYWdlaWdub3JlCkBAIC0xMDUsNyArMTA1LDYgQEAgY29u
Zmlncy9hbTU3NHhfaWRrX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBj
b25maWdzL2FuZGVzX2FlMzUwXzQ1X2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tI
YXNoCiBjb25maWdzL2FyY3R1cnVzX3VjbHMxMDEyYV9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5G
b3JjZUNoZWNrSGFzaAogY29uZmlncy9hcmN0dXJ1c191Y3AxMDIwX2RlZmNvbmZpZyBsaWJfZGVm
Y29uZmlnLkZvcmNlQ2hlY2tIYXNoCi1jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmln
IGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKIGNvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJf
ZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKIGNvbmZpZ3MvYXNwZWVkX2Fz
dDI2MDBldmJfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKIGNvbmZpZ3Mv
YXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hh
c2gKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDY4Mjc4NjZkYjEu
LjczZDQyODFkMTIgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAt
MzMzMiw3ICszMzMyLDkgQEAgRjoJY29uZmlncy9xZW11X2FybV9lYmJyX2RlZmNvbmZpZwogRjoJ
cGFja2FnZS9lZGsyLW5vbi1vc2kvCiAKIE46CVZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVo
bGVAbGFwb3N0ZS5uZXQ+CitGOglib2FyZC9hcm0vZm91bmRhdGlvbi12OC8KIEY6CWJvYXJkL2Jh
bmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vCitGOgljb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVm
Y29uZmlnCiBGOgljb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnCiBGOgljb25maWdz
L3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFja2FnZS9pN3ovCmRpZmYgLS1naXQgYS9ib2FyZC9h
cm0vZm91bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2ggYi9ib2FyZC9hcm0vZm91
bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKaW5kZXggNTU5YjUzYmUyZC4uMDI3
MTg3YzVhNyAxMDA2NDQKLS0tIGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51
eC9saW51eC5oYXNoCisrKyBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgv
bGludXguaGFzaApAQCAtMSwyICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYg
IGIwYmI5MmQ5ODJmODgzODBlNWIyMDU5MzQ5YzNhODYyZTBhZmE3MTJlMDY0NmViMGUwODJiOWMy
YzVjYjUxNzYgIGxpbnV4LTYuOC4xMC50YXIueHoKKyMgRnJvbSBodHRwczovL2Nkbi5rZXJuZWwu
b3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYworc2hhMjU2ICA1ZmY1YmQ4
NGVhMGUyMmM1MzQzNzMwMmRiNWQzOTRkMGE5MmQ4YjhiMWE4OGNlMjBkMTA5ODI5OGU5Zjc2MzBh
ICBsaW51eC02LjEyLjE1LnRhci54egpkaWZmIC0tZ2l0IGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24t
djgvcmVhZG1lLnR4dCBiL2JvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQKaW5kZXgg
NzAxY2YzY2ViMC4uYzY0MDQ5MTIxNSAxMDA2NDQKLS0tIGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24t
djgvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0CkBA
IC0xLDE2ICsxLDM0IEBACitJbnRyb2R1Y3Rpb24KKz09PT09PT09PT09PQorCiBUaGlzIGlzIHRo
ZSBzdXBwb3J0IGZvciB0aGUgQVJNIEZvdW5kYXRpb24gdjggbWFjaGluZSBlbXVsYXRlZCBieSB0
aGUKIEFSTSBzb2Z0d2FyZSBzaW11bGF0b3Igb2YgdGhlIEFBcmNoNjQgYXJjaGl0ZWN0dXJlLgog
Ci1GaXJzdCwgb25lIGhhcyB0byBkb3dubG9hZCB0aGUgQUFyY2g2NCBzb2Z0d2FyZSBzaW11bGF0
b3IgZnJvbToKK0J1aWxkaW5nCis9PT09PT09PQorCisgICQgbWFrZSBhcm1fZm91bmRhdGlvbnY4
X2RlZmNvbmZpZworICAkIG1ha2UKKworR2VuZXJhdGVkIGZpbGVzIHVuZGVyIG91dHB1dC9pbWFn
ZXM6CisKKyogbGludXgtc3lzdGVtLmF4ZjogQW4gaW1hZ2UgY29tcHJpc2luZyB0aGUgYm9vdC13
cmFwcGVyLWFhcmNoNjQgbWluaW1hbAorICAgICAgICAgICAgICAgICAgICBmaXJtd2FyZSBhbmQg
Ym9vdGxvYWRlciwgYSBEZXZpY2V0cmVlIGFuZCB0aGUgTGludXgga2VybmVsLgorKiByb290ZnMu
ZXh0MjogICAgICBUaGUgT1Mgcm9vdCBmaWxlc3lzdGVtLgorCitSdW5uaW5nIG9uIHRoZSBzaW11
bGF0b3IKKz09PT09PT09PT09PT09PT09PT09PT09PQogCi0gIGh0dHBzOi8vZGV2ZWxvcGVyLmFy
bS5jb20vLS9tZWRpYS9GaWxlcy9kb3dubG9hZHMvZWNvc3lzdGVtLW1vZGVscy9GTV8xMV8yNS9G
b3VuZGF0aW9uX1BsYXRmb3JtXzExLjI1XzE1X0xpbnV4NjQudGd6CitEb3dubG9hZCB0aGUgQUFy
Y2g2NCBzb2Z0d2FyZSBzaW11bGF0b3IgZnJvbSBvbmUgb2YgdGhlIGZvbGxvd2luZyBzb3VyY2Vz
LAorY29ycmVzcG9uZGluZyB0byB5b3VyIGhvc3QgY29tcHV0ZXI6CiAKLVRoZW4sIHVzZSB0aGUg
YXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcgY29uZmlndXJhdGlvbiB0byBidWlsZCB5b3VyCi1C
dWlsZHJvb3Qgc3lzdGVtLgorLSBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vY2RuLWRvd25s
b2Fkcy9wZXJtYWxpbmsvRlZQcy1BcmNoaXRlY3R1cmUvRk0tMTEuMjcvRm91bmRhdGlvbl9QbGF0
Zm9ybV8xMS4yN18xOV9MaW51eDY0LnRnegorLSBodHRwczovL2RldmVsb3Blci5hcm0uY29tLy0v
Y2RuLWRvd25sb2Fkcy9wZXJtYWxpbmsvRlZQcy1BcmNoaXRlY3R1cmUvRk0tMTEuMjcvRm91bmRh
dGlvbl9QbGF0Zm9ybV8xMS4yN18xOV9MaW51eDY0X2FybXY4bC50Z3oKIAogRmluYWxseSwgYm9v
dCB5b3VyIHN5c3RlbSB3aXRoOgogCiAgJHtMT0NBVElPTl9PRl9GT1VOREFUSU9OVjhfU0lNVUxB
VE9SfS9tb2RlbHMvTGludXg2NF9HQ0MtOS4zL0ZvdW5kYXRpb25fUGxhdGZvcm0gXAorICAgIC0t
YXJtLXY4LjAgXAogICAgIC0taW1hZ2Ugb3V0cHV0L2ltYWdlcy9saW51eC1zeXN0ZW0uYXhmIFwK
ICAgICAtLWJsb2NrLWRldmljZSBvdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyIFwKICAgICAtLW5l
dHdvcms9bmF0IFwKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25m
aWcgYi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCmluZGV4IGQ0ZTdjYTBkZDQu
LjdmYTNiOTdkZWYgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25m
aWcKKysrIGIvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZwpAQCAtMSwxMCArMSwx
MSBAQAogQlIyX2FhcmNoNjQ9eQotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV82Xzg9eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzEyPXkKIEJS
Ml9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hcm0vZm91bmRhdGlvbi12OC9wYXRjaGVzIgorQlIy
X0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlf
UE9SVD0idHR5QU1BMCIKIEJSMl9MSU5VWF9LRVJORUw9eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNU
T01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2Ljgu
MTAiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjE1IgogQlIy
X0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVM
X0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91
bmRhdGlvbi12OC1naWN2My1wc2NpIgotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
