Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A13EB2711
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 21:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245C940A1C;
	Tue, 10 Feb 2026 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIH-nmz3gKgs; Tue, 10 Feb 2026 21:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 339C240A2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770757332;
	bh=Gs285XMdgqLZW58VXeng5KqMa+loCCaqzD7YhrWaEc0=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=g1P/1jz8WfSGFbETf1eMa+M4ojp7Q+e6uJydIOJTcjAo0+272jyX+dOY93APOFzUk
	 Tl0Usp458xJa+fvUPJeuRIefqmbjJCohchgdK+86PUa/wiDxHIShjp9GzZEcDMdcWp
	 /iDtkUiOXHwdP96Shvx7oiPfs3L6lhH1vUbxuMtXWxDcKIFyqrr/CEofeYrVdcQZfx
	 v9FVR9VCJ/wcH/Bgm9BqYfIwSw+/G1YJXMIJ5kMOywkBPuoawpYYkee77fIkdNbfj4
	 cswSAEXpAgmyjLYo6GS/DByPbWT3Gv2J2w9oOQifJrYvc4ov3hXFlW0LoNg87uwYTB
	 ++UU4uJ8bEYVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339C240A2B;
	Tue, 10 Feb 2026 21:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A853623D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C61F5826C8
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hvmNWbvDeKR for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95F2482735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F2482735
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F2482735
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 01C1A4E40BFB;
 Tue, 10 Feb 2026 21:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC395606BD;
 Tue, 10 Feb 2026 21:02:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC3E810B922B0; Tue, 10 Feb 2026 22:02:04 +0100 (CET)
Date: Tue, 10 Feb 2026 22:01:56 +0100
MIME-Version: 1.0
Message-Id: <20260210-python-packages-v1-2-6153f56421d4@bootlin.com>
References: <20260210-python-packages-v1-0-6153f56421d4@bootlin.com>
In-Reply-To: <20260210-python-packages-v1-0-6153f56421d4@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770757325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QEic8XMKtqhHGpCAqr93DCyrW6A8hJY5do1Iw7hv/r8=;
 b=ycjjpw0D9F5ugOR9PUhF47AwG7MBuUYKMlTiH863Nj4t3xoNZOJdforqmjpSm3Pzqsqv1B
 hSox2ebe5ZzdRcRubzclh1hEw9L8zajW+7TcsxZRemh4C907mLjZMtpHMukrInDtIMTIun
 lAV4wjqAZIuLu5VFERzqiM0HC/A3ns2+ifarRDSTKa9VspSTK32X8/1TSOsSeXpaH8lBVV
 N8l+m72iXu1VoJRxbNB7lkbdhfbrD00lZ2BD/LTGansUQA0H4v+zPXCgvob9oi0wausEOy
 hd/Xej3jMrc/bVIt5G8B87DGZE03qrl/CpbcNd4L1s1Wc17ZvEMDJ1lWpjm5Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ycjjpw0D
Subject: [Buildroot] [PATCH 2/2] package/python-flask-socketio: new package
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvcHl0aG9uLWZsYXNrLXNvY2tldGlv
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwogcGFja2Fn
ZS9weXRob24tZmxhc2stc29ja2V0aW8vcHl0aG9uLWZsYXNrLXNvY2tldGlvLmhhc2ggICB8ICA1
ICsrKysrCiBwYWNrYWdlL3B5dGhvbi1mbGFzay1zb2NrZXRpby9weXRob24tZmxhc2stc29ja2V0
aW8ubWsgICAgIHwgMTQgKysrKysrKysrKysrKysKIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
c2FtcGxlX3B5dGhvbl9mbGFza19zb2NrZXRpby5weSAgfCAgNSArKysrKwogLi4uL3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9mbGFza19zb2NrZXRpby5weSAgICB8IDEyICsrKysr
KysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggY2M3YzM4YzMxODczLi40ZmY5YjNiNTkzZGUg
MTAwNjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTU1LDYgKzE1NSw3
IEBAIE46CUFsZXhleSBMdWt5YW5jaHVrIDxza2lmQHNraWYtd2ViLnJ1PgogRjoJcGFja2FnZS96
YWJiaXgvCiAKIE46IAlBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29t
PgorRjogCXBhY2thZ2UvcHl0aG9uLWZsYXNrLXNvY2tldGlvCiBGOiAJcGFja2FnZS9weXRob24t
Z2V2ZW50CiBGOiAJcGFja2FnZS9weXRob24tc2NwCiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29u
ZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggNzZjMmE0MzY1NTEzLi5iYmI3Mjk3ZGQy
YWEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmlu
CkBAIC0xMTIwLDYgKzExMjAsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKIAlz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLWZsYXNrLWxvZ2luL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLWZsYXNrLXJlc3R4L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLWZsYXNrLXNtb3Jlc3QvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tZmxh
c2stc29ja2V0aW8vQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tZmxhc2stc3Fs
YWxjaGVteS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1mbGFzay13dGYvQ29u
ZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24tZmxhdGJ1ZmZlcnMvQ29uZmlnLmluIgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stc29ja2V0aW8vQ29uZmlnLmluIGIvcGFj
a2FnZS9weXRob24tZmxhc2stc29ja2V0aW8vQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAwMC4uZWM3ZjM4MzNmOGNiCi0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS9weXRob24tZmxhc2stc29ja2V0aW8vQ29uZmlnLmluCkBAIC0wLDAgKzEsMTQgQEAKK2Nv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fRkxBU0tfU09DS0VUSU8KKwlib29sICJweXRob24tZmxh
c2stc29ja2V0aW8iCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84ICMg
QysrMjAKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0ZMQVNLICMgcnVudGltZQorCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fR0VWRU5UICMgcnVudGltZQorCXNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fU09DS0VUSU8gIyBydW50aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTjNf
U1NMICMgcnVudGltZQorCWhlbHAKKwkgIFNvY2tldC5JTyBpbnRlZ3JhdGlvbiBmb3IgRmxhc2sg
YXBwbGljYXRpb25zLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vbWlndWVsZ3JpbmJlcmcvZmxh
c2stc29ja2V0aW8KKworY29tbWVudCAicHl0aG9uLWZsYXNrLXNvY2tldGlvIG5lZWRzIGEgdG9v
bGNoYWluIHcvIEMrKywgZ2NjID49IDgiCisJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfOApkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxhc2stc29ja2V0aW8vcHl0
aG9uLWZsYXNrLXNvY2tldGlvLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1zb2NrZXRpby9w
eXRob24tZmxhc2stc29ja2V0aW8uaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwMDAuLjBkNTE3MTM0ZTZjNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9u
LWZsYXNrLXNvY2tldGlvL3B5dGhvbi1mbGFzay1zb2NrZXRpby5oYXNoCkBAIC0wLDAgKzEsNSBA
QAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9mbGFzay1zb2NrZXRp
by9qc29uCittZDUgIDUwODcyYzdlMWQ1NThmY2JlNjBhOTQyYzU1MTk3MDNkICBmbGFza19zb2Nr
ZXRpby01LjYuMC50YXIuZ3oKK3NoYTI1NiAgNDJhN2JjNTUyMDEzNjMzODc1YWQzMjBlMzk0NjIz
MjNiNGY3MzM0NTk0ZjE2NThkNzJiNmZmZWQ5OTk0MGQ0YyAgZmxhc2tfc29ja2V0aW8tNS42LjAu
dGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcworc2hhMjU2ICA2OGQw
OTY2ZTQ4MGE4ZDJmZDNkNWMyNmQwMDJjOTk2ZWYwOGNkZmEyYjE1YTc3ZDBkMGI1OTNiOWFiZWU2
MGE0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mbGFzay1zb2NrZXRpby9w
eXRob24tZmxhc2stc29ja2V0aW8ubWsgYi9wYWNrYWdlL3B5dGhvbi1mbGFzay1zb2NrZXRpby9w
eXRob24tZmxhc2stc29ja2V0aW8ubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMDAwLi5iZGM2MGJkYWMyNGYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi1m
bGFzay1zb2NrZXRpby9weXRob24tZmxhc2stc29ja2V0aW8ubWsKQEAgLTAsMCArMSwxNCBAQAor
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgcHl0aG9uLWZsYXNrLXNvY2tldGlvCisjCisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05fRkxBU0tfU09DS0VUSU9fVkVSU0lPTiA9
IDUuNi4wCitQWVRIT05fRkxBU0tfU09DS0VUSU9fU09VUkNFID0gZmxhc2tfc29ja2V0aW8tJChQ
WVRIT05fRkxBU0tfU09DS0VUSU9fVkVSU0lPTikudGFyLmd6CitQWVRIT05fRkxBU0tfU09DS0VU
SU9fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy81My8yOC9k
ZWFjNjBmNWM2ZmFmOWMzZTBhZWQwN2FhM2E5MmIwNzQxYzY3MDk4NDFhYTNlYmExMjQxN2JiYzgz
MDMKK1BZVEhPTl9GTEFTS19TT0NLRVRJT19TRVRVUF9UWVBFID0gc2V0dXB0b29scworUFlUSE9O
X0ZMQVNLX1NPQ0tFVElPX0xJQ0VOU0UgPSBNSVQKK1BZVEhPTl9GTEFTS19TT0NLRVRJT19MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQorCiskKGV2YWwgJChweXRob24tcGFja2FnZSkpCmRpZmYgLS1n
aXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ZsYXNrX3Nv
Y2tldGlvLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9m
bGFza19zb2NrZXRpby5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAu
LjExZjgwNTBjNzA4NQotLS0gL2Rldi9udWxsCisrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fZmxhc2tfc29ja2V0aW8ucHkKQEAgLTAsMCArMSw1IEBACitm
cm9tIGZsYXNrIGltcG9ydCBGbGFzaworZnJvbSBmbGFza19zb2NrZXRpbyBpbXBvcnQgU29ja2V0
SU8KKworYXBwID0gRmxhc2soJ3Rlc3QnKQorc29ja2V0aW8gPSBTb2NrZXRJTyhhcHApCmRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9mbGFza19z
b2NrZXRpby5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2Zs
YXNrX3NvY2tldGlvLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
ZTk3N2RiMGI0NDFlCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9weXRob25fZmxhc2tfc29ja2V0aW8ucHkKQEAgLTAsMCArMSwxMiBAQAorZnJv
bSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJhc2UK
KworCitjbGFzcyBUZXN0UHl0aG9uRmxhc2tTb2NrZXRJTyhUZXN0UHl0aG9uUGFja2FnZUJhc2Up
OgorICAgIF9fdGVzdF9fID0gVHJ1ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFz
ZS5jb25maWcgKyBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkK
KyAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OX0ZMQVNLX1NPQ0tFVElPPXkKKyAgICAgICAgIiIi
CisgICAgc2FtcGxlX3NjcmlwdHMgPSBbInRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9mbGFz
a19zb2NrZXRpby5weSJdCisgICAgdGltZW91dCA9IDMwCgotLSAKMi41Mi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
