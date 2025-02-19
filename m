Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C67C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 09:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387534FC91;
	Wed, 19 Feb 2025 09:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJYftR7yuttX; Wed, 19 Feb 2025 09:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC27E4FC9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC27E4FC9A;
	Wed, 19 Feb 2025 09:26:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 579C0C8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 09:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4732E84F46
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 09:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqHlrG_VNFWK for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 09:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.106;
 helo=smtp-outgoing-1902.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 709D381F6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 709D381F6B
Received: from smtp-outgoing-1902.laposte.net (smtp-outgoing-1902.laposte.net
 [160.92.124.106])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 709D381F6B
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 09:26:43 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyWHN3yK4zqSH5","contextId":
 "58cf1a24-ce37-4996-9fa1-19985356ef46"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0108.laposte.net (SMTP Server) with ESMTP id 4YyWHN3yK4zqSH5;
 Wed, 19 Feb 2025 10:26:40 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyWHN10nHzqSGl","contextId":
 "fa1ed378-f2a8-4c6c-a849-fe430d9dc04e"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0108.laposte.net (SMTP Server) with ESMTPSA id 4YyWHN10nHzqSGl;
 Wed, 19 Feb 2025 10:26:40 +0100 (CET)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 5820A6404DB3;
 Wed, 19 Feb 2025 10:26:59 +0100 (CET)
Received: from vincent by radicelle with local (Exim 4.98)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1tkgML-000000008OP-22Qg; Wed, 19 Feb 2025 10:27:13 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Feb 2025 10:27:11 +0100
Message-ID: <20250219092711.32256-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219082442.30082-1-vincent.stehle@laposte.net>
References: <20250219082442.30082-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1739957201;
 bh=A5aVqfgx48C7xvADZtpJRk+B3vC4yDUfmF8HgRCgjgk=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=Fc4XHAeGtMNtq1KDInhJRbTd9KjKdsZBLPHsn3f+3jLyUY+NdYmoGAh1jCTXMdCdC+Dr9ki5ssbpIc24FQhyeXH9gs+J18tGDSwTnVED/Q7+HkMwtPfOD3r5b6q5Wl+9Y+aT/j+WSsMzKObOz7CHW0HPCgeiH2MzGwMuzup3Fj1E4XUxpDL/wOf8FXPn6mKsKByzhG/H7hf9y0CATaDKAyiGzVwF7vZcQhP79gOlWdvwNNSXBQ5Oe8Oj7biL0r9Krfh0ksMpWs4xH5n2lrOPU3IYtqgX8vzhgw6A/e6xan8zusBg4di0MXJ+KBWPDWjZFHwMgHyS8x0Sl0pIqScPlg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=Fc4XHAeG
Subject: [Buildroot] [PATCH v2] configs/arm_foundationv8: bump to Linux 6.12
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

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni4xMi4xNSwgdXBkYXRlIHRoZSBoYXNoIGZpbGUgYW5k
IGFkZCB0aGUKICBkZXBlbmRlbmN5IG9uIGhvc3QtcHl0aG9uMy4KLSBCdW1wIHRoZSBGVlAgaW4g
dGhlIHJlYWRtZSB0byB2ZXJzaW9uIDExLjI3IGJ1aWxkIDE5LgoKV2hpbGUgYXQgaXQ6Ci0gUmV3
b3JrIHRoZSByZWFkbWUgYSBiaXQgd2l0aCBleHBsaWNpdCBidWlsZCBpbnN0cnVjdGlvbnMsIGFk
ZCBhIGxpbmsKICB0byB0aGUgbW9kZWwgYmluYXJpZXMgcnVubmluZyBvbiBBQXJjaDY0IGhvc3Qg
YW5kIHVwZGF0ZSB0aGUgbW9kZWwKICBjb21tYW5kIGxpbmUgdG8gc3BlY2lmeSBBcm0gdjguMCAo
YXMgd2UgYXJlIGJ1aWxkaW5nIGZvciBDb3J0ZXgtQTUzKS4KLSBUdXJuIG9uIGhhc2hlcyB2ZXJp
ZmljYXRpb24gYW5kIHVwZGF0ZSAuY2hlY2twYWNrYWdlaWdub3JlCiAgYWNjb3JkaW5nbHkuCi0g
QWRkIG15c2VsZiBhcyBjby1kZXZlbG9wZXIgZm9yIHRoaXMgZGVmY29uZmlnLgoKU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IE1h
c2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQoKCkhpLAoK
SSBtaXNzZWQgdGhlIG5ldyBrZXJuZWwncyBkZXBlbmRlbmN5IG9uIGhvc3QtcHl0aG9uMyBpbiB0
aGUgb3JpZ2luYWwKcGF0Y2g7IHNvcnJ5IGFib3V0IHRoYXQuIEhlcmUgaXMgYSB2MiB0byBmaXgg
dGhpcy4KCkJlc3QgcmVnYXJkcywKVmluY2VudC4KCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBBZGQg
TGludXggZGVwZW5kZW5jeSBvbiBob3N0IHB5dGhvbjMuCiAgLSBXcmFwIGNvbW1pdCBtZXNzYWdl
IGxpbmVzIGF0IDcyIGNoYXJhY3RlcnMuCgoKIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxIC0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICsrCiAuLi4vZm91bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4L2xp
bnV4Lmhhc2ggICAgfCAgMyArKy0KIGJvYXJkL2FybS9mb3VuZGF0aW9uLXY4L3JlYWRtZS50eHQg
ICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKystLS0KIGNvbmZpZ3MvYXJtX2ZvdW5kYXRp
b252OF9kZWZjb25maWcgICAgICAgICAgICB8ICA2ICsrKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDMw
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvLmNoZWNrcGFja2Fn
ZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUKaW5kZXggZDU0YmQzNTNiMi4uYjEwZjY5ZWMz
NiAxMDA2NDQKLS0tIGEvLmNoZWNrcGFja2FnZWlnbm9yZQorKysgYi8uY2hlY2twYWNrYWdlaWdu
b3JlCkBAIC0xMDUsNyArMTA1LDYgQEAgY29uZmlncy9hbTU3NHhfaWRrX2RlZmNvbmZpZyBsaWJf
ZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FuZGVzX2FlMzUwXzQ1X2RlZmNvbmZp
ZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCiBjb25maWdzL2FyY3R1cnVzX3VjbHMxMDEy
YV9kZWZjb25maWcgbGliX2RlZmNvbmZpZy5Gb3JjZUNoZWNrSGFzaAogY29uZmlncy9hcmN0dXJ1
c191Y3AxMDIwX2RlZmNvbmZpZyBsaWJfZGVmY29uZmlnLkZvcmNlQ2hlY2tIYXNoCi1jb25maWdz
L2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gK
IGNvbmZpZ3MvYXNwZWVkX2FzdDI1MDBldmJfZGVmY29uZmlnIGxpYl9kZWZjb25maWcuRm9yY2VD
aGVja0hhc2gKIGNvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnIGxpYl9kZWZjb25m
aWcuRm9yY2VDaGVja0hhc2gKIGNvbmZpZ3MvYXN1c190aW5rZXItc19yazMyODhfZGVmY29uZmln
IGxpYl9kZWZjb25maWcuRm9yY2VDaGVja0hhc2gKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9E
RVZFTE9QRVJTCmluZGV4IDY4Mjc4NjZkYjEuLjczZDQyODFkMTIgMTAwNjQ0Ci0tLSBhL0RFVkVM
T1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMzMzMiw3ICszMzMyLDkgQEAgRjoJY29uZmlncy9x
ZW11X2FybV9lYmJyX2RlZmNvbmZpZwogRjoJcGFja2FnZS9lZGsyLW5vbi1vc2kvCiAKIE46CVZp
bmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+CitGOglib2FyZC9hcm0v
Zm91bmRhdGlvbi12OC8KIEY6CWJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vCitGOglj
b25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnCiBGOgljb25maWdzL2JhbmFuYXBpX20y
X3plcm9fZGVmY29uZmlnCiBGOgljb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFja2Fn
ZS9pN3ovCmRpZmYgLS1naXQgYS9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4
L2xpbnV4Lmhhc2ggYi9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9wYXRjaGVzL2xpbnV4L2xpbnV4
Lmhhc2gKaW5kZXggNTU5YjUzYmUyZC4uMDI3MTg3YzVhNyAxMDA2NDQKLS0tIGEvYm9hcmQvYXJt
L2ZvdW5kYXRpb24tdjgvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCisrKyBiL2JvYXJkL2FybS9m
b3VuZGF0aW9uLXY4L3BhdGNoZXMvbGludXgvbGludXguaGFzaApAQCAtMSwyICsxLDMgQEAKICMg
TG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIGIwYmI5MmQ5ODJmODgzODBlNWIyMDU5MzQ5YzNh
ODYyZTBhZmE3MTJlMDY0NmViMGUwODJiOWMyYzVjYjUxNzYgIGxpbnV4LTYuOC4xMC50YXIueHoK
KyMgRnJvbSBodHRwczovL2Nkbi5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEy
NTZzdW1zLmFzYworc2hhMjU2ICA1ZmY1YmQ4NGVhMGUyMmM1MzQzNzMwMmRiNWQzOTRkMGE5MmQ4
YjhiMWE4OGNlMjBkMTA5ODI5OGU5Zjc2MzBhICBsaW51eC02LjEyLjE1LnRhci54egpkaWZmIC0t
Z2l0IGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dCBiL2JvYXJkL2FybS9mb3Vu
ZGF0aW9uLXY4L3JlYWRtZS50eHQKaW5kZXggNzAxY2YzY2ViMC4uYzY0MDQ5MTIxNSAxMDA2NDQK
LS0tIGEvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dAorKysgYi9ib2FyZC9hcm0v
Zm91bmRhdGlvbi12OC9yZWFkbWUudHh0CkBAIC0xLDE2ICsxLDM0IEBACitJbnRyb2R1Y3Rpb24K
Kz09PT09PT09PT09PQorCiBUaGlzIGlzIHRoZSBzdXBwb3J0IGZvciB0aGUgQVJNIEZvdW5kYXRp
b24gdjggbWFjaGluZSBlbXVsYXRlZCBieSB0aGUKIEFSTSBzb2Z0d2FyZSBzaW11bGF0b3Igb2Yg
dGhlIEFBcmNoNjQgYXJjaGl0ZWN0dXJlLgogCi1GaXJzdCwgb25lIGhhcyB0byBkb3dubG9hZCB0
aGUgQUFyY2g2NCBzb2Z0d2FyZSBzaW11bGF0b3IgZnJvbToKK0J1aWxkaW5nCis9PT09PT09PQor
CisgICQgbWFrZSBhcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZworICAkIG1ha2UKKworR2VuZXJh
dGVkIGZpbGVzIHVuZGVyIG91dHB1dC9pbWFnZXM6CisKKyogbGludXgtc3lzdGVtLmF4ZjogQW4g
aW1hZ2UgY29tcHJpc2luZyB0aGUgYm9vdC13cmFwcGVyLWFhcmNoNjQgbWluaW1hbAorICAgICAg
ICAgICAgICAgICAgICBmaXJtd2FyZSBhbmQgYm9vdGxvYWRlciwgYSBEZXZpY2V0cmVlIGFuZCB0
aGUgTGludXgga2VybmVsLgorKiByb290ZnMuZXh0MjogICAgICBUaGUgT1Mgcm9vdCBmaWxlc3lz
dGVtLgorCitSdW5uaW5nIG9uIHRoZSBzaW11bGF0b3IKKz09PT09PT09PT09PT09PT09PT09PT09
PQogCi0gIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20vLS9tZWRpYS9GaWxlcy9kb3dubG9hZHMv
ZWNvc3lzdGVtLW1vZGVscy9GTV8xMV8yNS9Gb3VuZGF0aW9uX1BsYXRmb3JtXzExLjI1XzE1X0xp
bnV4NjQudGd6CitEb3dubG9hZCB0aGUgQUFyY2g2NCBzb2Z0d2FyZSBzaW11bGF0b3IgZnJvbSBv
bmUgb2YgdGhlIGZvbGxvd2luZyBzb3VyY2VzLAorY29ycmVzcG9uZGluZyB0byB5b3VyIGhvc3Qg
Y29tcHV0ZXI6CiAKLVRoZW4sIHVzZSB0aGUgYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcgY29u
ZmlndXJhdGlvbiB0byBidWlsZCB5b3VyCi1CdWlsZHJvb3Qgc3lzdGVtLgorLSBodHRwczovL2Rl
dmVsb3Blci5hcm0uY29tLy0vY2RuLWRvd25sb2Fkcy9wZXJtYWxpbmsvRlZQcy1BcmNoaXRlY3R1
cmUvRk0tMTEuMjcvRm91bmRhdGlvbl9QbGF0Zm9ybV8xMS4yN18xOV9MaW51eDY0LnRnegorLSBo
dHRwczovL2RldmVsb3Blci5hcm0uY29tLy0vY2RuLWRvd25sb2Fkcy9wZXJtYWxpbmsvRlZQcy1B
cmNoaXRlY3R1cmUvRk0tMTEuMjcvRm91bmRhdGlvbl9QbGF0Zm9ybV8xMS4yN18xOV9MaW51eDY0
X2FybXY4bC50Z3oKIAogRmluYWxseSwgYm9vdCB5b3VyIHN5c3RlbSB3aXRoOgogCiAgJHtMT0NB
VElPTl9PRl9GT1VOREFUSU9OVjhfU0lNVUxBVE9SfS9tb2RlbHMvTGludXg2NF9HQ0MtOS4zL0Zv
dW5kYXRpb25fUGxhdGZvcm0gXAorICAgIC0tYXJtLXY4LjAgXAogICAgIC0taW1hZ2Ugb3V0cHV0
L2ltYWdlcy9saW51eC1zeXN0ZW0uYXhmIFwKICAgICAtLWJsb2NrLWRldmljZSBvdXRwdXQvaW1h
Z2VzL3Jvb3Rmcy5leHQyIFwKICAgICAtLW5ldHdvcms9bmF0IFwKZGlmZiAtLWdpdCBhL2NvbmZp
Z3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcgYi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhf
ZGVmY29uZmlnCmluZGV4IGQ0ZTdjYTBkZDQuLjkzNjEzZjVhMzQgMTAwNjQ0Ci0tLSBhL2NvbmZp
Z3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcKKysrIGIvY29uZmlncy9hcm1fZm91bmRhdGlv
bnY4X2RlZmNvbmZpZwpAQCAtMSwxNCArMSwxNiBAQAogQlIyX2FhcmNoNjQ9eQotQlIyX1BBQ0tB
R0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82Xzg9eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5V
WF9IRUFERVJTX0NVU1RPTV82XzEyPXkKIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hcm0v
Zm91bmRhdGlvbi12OC9wYXRjaGVzIgorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15
CiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5QU1BMCIKIEJSMl9MSU5VWF9LRVJO
RUw9eQogQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjguMTAiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSI2LjEyLjE1IgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxU
X0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJhcm0vZm91bmRhdGlvbi12OC1naWN2My1wc2NpIgogQlIyX0xJ
TlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQorQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19I
T1NUX1BZVEhPTjM9eQogQlIyX1RBUkdFVF9ST09URlNfRVhUMj15CiBCUjJfVEFSR0VUX1JPT1RG
U19FWFQyX1NJWkU9IjEyOE0iCiAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Ci0t
IAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
