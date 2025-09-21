Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF6FCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF914840A8;
	Sun, 21 Sep 2025 14:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ck7Bqx_4DPQo; Sun, 21 Sep 2025 14:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B51B4840EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B51B4840EF;
	Sun, 21 Sep 2025 14:54:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF3D1D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C51054091D
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D9rBS7XgmRvX for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.96;
 helo=smtp-outgoing-1601.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E68F408DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E68F408DE
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net
 [160.92.124.96])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E68F408DE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:07 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lS6gFLzdZLZ","contextId":
 "fd2f11c6-3fe7-49f1-b7c5-4b4285f83897"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5lS6gFLzdZLZ;
 Sun, 21 Sep 2025 14:53:40 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lS5XCyzdZLM","contextId":
 "045776fc-1d4d-4ebe-a03e-7aa6bf4f6487"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5lS5XCyzdZLM;
 Sun, 21 Sep 2025 14:53:40 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 192876A1890F;
 Sun, 21 Sep 2025 14:53:46 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0Jad-000000002U8-2E6a; Sun, 21 Sep 2025 14:54:51 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:21 +0200
Message-ID: <20250921125422.7944-6-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921125422.7944-1-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466445;
 bh=3OwAtt2I2+deIjratFUIDObKByafIWngq52Gr4INYTQ=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=q0fPHLlEBx6kKV7cUPGutHXwfO1UhPyIel53APpHYu2ysJ/SjiEGYINyOXfEw+mUAXibZo4n8uygWt2bCC2kE0/IZwPxrpXe6g0GbgDGfafrHFeSmWRaAG89O7AVwQ1fZr43b7hzKqzUoLGHDGJDuiTMJgrw+52gl+tWvQZABHARuSVERwmOpg3EkPaeha7Nr11iPzWGbGpF+O/8M3810TK+A5e9j92VIyEbn1D+CraWYS/wAqzZELKrOjvYmg4TmFuGUxOqnGMzjdwUTCyv5/1E2dqbovePAE80ZGlK57xFMG3H/WINuSS+kwOKS7UUGU7ZhthrGZuGIHJLOVtvMQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=q0fPHLlE
Subject: [Buildroot] [PATCH 5/6] boot/palo: new boot package
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

UGFsbyBpcyBhIFBBLVJJU0MvTGludXggYm9vdCBsb2FkZXIuCkl0IGNhbiBiZSB1c2VkIHRvIG1h
a2UgYm9vdGFibGUgZGlzayBpbWFnZXMgb3IgbmV0d29yayBib290YWJsZSBpbWFnZXMuCgpXaGls
ZSBhdCBpdCwgYWRkIHRoaXMgYm9vdCBwYWNrYWdlIHRvIG15c2VsZiBpbiBERVZFTE9QRVJTLgoK
U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5l
dD4KQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0t
LQogREVWRUxPUEVSUyAgICAgICAgICB8ICAxICsKIGJvb3QvQ29uZmlnLmluICAgICAgfCAgMSAr
CiBib290L3BhbG8vQ29uZmlnLmluIHwgMTMgKysrKysrKysrKysrKwogYm9vdC9wYWxvL3BhbG8u
aGFzaCB8ICAzICsrKwogYm9vdC9wYWxvL3BhbG8ubWsgICB8IDI1ICsrKysrKysrKysrKysrKysr
KysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGJvb3QvcGFsby9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3BhbG8v
cGFsby5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9wYWxvL3BhbG8ubWsKCmRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAwZDhhMjUzMDhhLi44OGU1M2JkZmVl
IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTMzNjUsNiArMzM2
NSw3IEBAIEY6CWFyY2gvYXJjaC5tay5ocHBhCiBGOglib2FyZC9hcm0vZm91bmRhdGlvbi12OC8K
IEY6CWJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8vCiBGOglib2FyZC9xZW11L2hwcGEt
YjE2MGwvCitGOglib290L3BhbG8vCiBGOgljb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVmY29u
ZmlnCiBGOgljb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnCiBGOgljb25maWdzL3Fl
bXVfaHBwYV9iMTYwbF9kZWZjb25maWcKZGlmZiAtLWdpdCBhL2Jvb3QvQ29uZmlnLmluIGIvYm9v
dC9Db25maWcuaW4KaW5kZXggZjE2NzM0NmNkZi4uZTRkZDMxMjYyNiAxMDA2NDQKLS0tIGEvYm9v
dC9Db25maWcuaW4KKysrIGIvYm9vdC9Db25maWcuaW4KQEAgLTEyLDYgKzEyLDcgQEAgc291cmNl
ICJib290L212LWRkci1tYXJ2ZWxsL0NvbmZpZy5pbiIKIHNvdXJjZSAiYm9vdC9teHMtYm9vdGxl
dHMvQ29uZmlnLmluIgogc291cmNlICJib290L29wdGVlLW9zL0NvbmZpZy5pbiIKIHNvdXJjZSAi
Ym9vdC9vcGVuc2JpL0NvbmZpZy5pbiIKK3NvdXJjZSAiYm9vdC9wYWxvL0NvbmZpZy5pbiIKIHNv
dXJjZSAiYm9vdC9zNTAwLWJvb3Rsb2FkZXIvQ29uZmlnLmluIgogc291cmNlICJib290L3NoaW0v
Q29uZmlnLmluIgogc291cmNlICJib290L3N5c2xpbnV4L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBh
L2Jvb3QvcGFsby9Db25maWcuaW4gYi9ib290L3BhbG8vQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjM0ZTJkNWJmMDAKLS0tIC9kZXYvbnVsbAorKysgYi9i
b290L3BhbG8vQ29uZmlnLmluCkBAIC0wLDAgKzEsMTMgQEAKK2NvbmZpZyBCUjJfVEFSR0VUX1BB
TE8KKwlib29sICJwYWxvIgorCWRlcGVuZHMgb24gQlIyX2hwcGEKKwloZWxwCisJICBQYWxvIGlz
IGEgUEEtUklTQy9MaW51eCBib290IGxvYWRlci4KKworCSAgSXQgY29tcHJpc2VzIGlwbGJvb3Qs
IGEgYm9vdGxvYWRlciBsb2FkZWQgYnkgdGhlIEhQIGZpcm13YXJlLAorCSAgYW5kIHBhbG8sIGEg
Ym9vdCBtZWRpYSBtYW5hZ2VtZW50IHRvb2wuCisKKwkgIFBhbG8gYWxsb3dzIHRvIHVwZGF0ZSBk
aXNrIGltYWdlcyB3aXRoIGEgYm9vdGxvYWRlciB0byBtYWtlCisJICB0aGVtIGJvb3RhYmxlLCBv
ciB0byBjcmVhdGUgbmV0d29yayBib290YWJsZSBpbWFnZXMuCisKKwkgIGh0dHBzOi8vcGFyaXNj
LmRvY3Mua2VybmVsLm9yZwpkaWZmIC0tZ2l0IGEvYm9vdC9wYWxvL3BhbG8uaGFzaCBiL2Jvb3Qv
cGFsby9wYWxvLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMmE3
ZTJlZjg5YQotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvcGFsby9wYWxvLmhhc2gKQEAgLTAsMCAr
MSwzIEBACisjIExvY2FsbHkgY2FsY3VsYXRlZAorc2hhMjU2ICA3M2RiOWY2MGQ0MzljNGFlOWQz
MWIwNDk2NzEyODNlMDFkOTVhZTM2NGZjNzhiNGRiMzdlZWQ1NTIzMjE4ZDZjICBwYWxvLTIuMjgu
dGFyLmd6CitzaGEyNTYgIGZhNWZjMWQxZWVjMzk1MzJlYTUxNzUxOGVlZWZkN2I2ZTNjMTQzNDFh
NTVlNTg4MGEwZTJhNDllZWU0N2E1YjcgIENPUFlJTkcKZGlmZiAtLWdpdCBhL2Jvb3QvcGFsby9w
YWxvLm1rIGIvYm9vdC9wYWxvL3BhbG8ubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uZGFkYjBjZGU5MgotLS0gL2Rldi9udWxsCisrKyBiL2Jvb3QvcGFsby9wYWxvLm1r
CkBAIC0wLDAgKzEsMjUgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHBhbG8KKyMK
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1BBTE9fVkVSU0lPTiA9IDIuMjgKK1BBTE9fU0lU
RSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RlbGxl
ci9wYWxvLmdpdC9zbmFwc2hvdAorUEFMT19MSUNFTlNFID0gR1BMLTIuMAorUEFMT19MSUNFTlNF
X0ZJTEVTID0gQ09QWUlORworUEFMT19JTlNUQUxMX0lNQUdFUyAgPSBZRVMKKworZGVmaW5lIFBB
TE9fQlVJTERfQ01EUworCSMgRHVtbXkgUkVBRE1FIHRvIHJlbW92ZSB0aGUgZGVwZW5kZW5jeSBv
biBseW54LgorCXRvdWNoICQoQEQpL1JFQURNRQorCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0Up
IC1DICQoQEQpIFwKKwkJQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgYWxsIG1ha2VpcGwK
K2VuZGVmCisKK2RlZmluZSBQQUxPX0lOU1RBTExfSU1BR0VTX0NNRFMKKwkkKElOU1RBTEwpIC1E
IC1tIDA2NDQgJChARCkvaXBsYm9vdCAkKEJJTkFSSUVTX0RJUikvaXBsYm9vdAorCSQoSU5TVEFM
TCkgLUQgLW0gMDc1NSAkKEBEKS9wYWxvL3BhbG8gJChIT1NUX0RJUikvYmluL3BhbG8KK2VuZGVm
CisKKyQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCi0tIAoyLjUxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
