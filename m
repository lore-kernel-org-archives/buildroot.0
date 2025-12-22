Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DB7E674BD
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3F9406F4;
	Mon, 22 Dec 2025 14:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdXPGCpwaw_w; Mon, 22 Dec 2025 14:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CEBF40708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766415270;
	bh=JWpV7QD+H+NFquWTLQqcgmOn46d7xxj+48fh+L7tMC8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=oU464yR5blfPsZqmGfASNjjHQH0ENhv3Me+iz0v/STMfC1rjp8w9LBo1FW17obljm
	 cE5IYvHeVdDL95rWTA0m6QwGLqoBgGtqviMi8AfST3ErCq4DhhPN49jRTjECpSWz4p
	 1P0LszNS94o09q/SqsUFJTtmJ7fN8JQ/CpTy84dfQ089nk5FlQ3T57aqn7pJh/3ZFM
	 TARvrsGEWaNTVYKWD7v4lbZAOj5mDo7fjdcIpTyYWdUNsQruqZf8hg0BXPcnB/z69v
	 mYXbin9AiXyaxbAx6L18W51X3E3s9EyddDW5QxAxdKLkOM6oYqpW/20fviSBhYBLbR
	 KnByWo+SaFgtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CEBF40708;
	Mon, 22 Dec 2025 14:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72B70BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6595040709
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6lEjCWbmLBI for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 14:54:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B21A406F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B21A406F4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B21A406F4
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 14:54:28 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A62EE2C80CD5;
 Mon, 22 Dec 2025 15:54:25 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 15:54:26 +0100
Message-ID: <20251222145428.440712-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1766415265; bh=Y6kjOqdOSb3S9zpHmZxmViANfincloIdcaytmOAfNHo=;
 h=From:To:Cc:Subject:Date;
 b=fzXjN9FTv9G8/Tp+JijLtPcMuzRcDMWrsdobid4SsSz/P0dA584c15wzbR3uMX1ir
 s/De4c1D5AUFsJwDlaDrfUW1K6PGH5rkM7cuA7Dj4X180rWeb13gjfLAexZ2AOZDgi
 SG0sRD9ftX66hExBAMRANOi8g8rr7164lOZkt+9yDgUUuoIsngT3NcK9qzz99/ZlGJ
 /zhW2vr/Ay5wXB7ER/YQtSnsLw1+PT20rHf3BNfoyY3V1vah1nivsfj9exWJXKjdv3
 5zgAnKHhtFC9RepDA4RwRT/x3r4Qx580z6nYuJmIUHsNptrCXqadimjaXuky2rlzaG
 CqGP2cDy9xigA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=fzXjN9FT
Subject: [Buildroot] [PATCH 1/2] package/python-django: security bump to
 5.2.9
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CiogQ1ZFLTIwMjUtMTMzNzI6IFBvdGVudGlhbCBTUUwgaW5qZWN0aW9uIGluIEZpbHRl
cmVkUmVsYXRpb24gY29sdW1uIGFsaWFzZXMgb24gUG9zdGdyZVNRTMK2CiogQ1ZFLTIwMjUtNjQ0
NjA6IFBvdGVudGlhbCBkZW5pYWwtb2Ytc2VydmljZSB2dWxuZXJhYmlsaXR5IGluIFhNTCBEZXNl
cmlhbGl6ZXIKCkZ1bGwgcmVsZWFzZSBub3RlczogaHR0cHM6Ly9kb2NzLmRqYW5nb3Byb2plY3Qu
Y29tL2VuLzYuMC9yZWxlYXNlcy81LjIuOS8KClNpZ25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFu
biA8YnVpbGRyb290QGJ1YnUxLmV1PgotLS0KIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24t
ZGphbmdvLmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdv
Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdv
Lmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5oYXNoCmluZGV4IDQ0
OGU5ODYxM2IuLmI1YjI0NjBkMmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9w
eXRob24tZGphbmdvLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFu
Z28uaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvZGphbmdvL2pzb24KLW1kNSAgMDI2OGM1MmNiOTliYjc2NDQ5MGZkZDkwNTAyZGVm
MzIgIGRqYW5nby01LjIuOC50YXIuZ3oKLXNoYTI1NiAgMjMyNTQ4NjZhNWJiOWEyY2ZhNjAwNGU4
YjgwOWVjNjI0NmViYTRiNThhNzU4OWJjMjc3MmYxYmNjODQ1NmM3ZiAgZGphbmdvLTUuMi44LnRh
ci5negorbWQ1ICBlN2Q4OWRkZmRjYTc5NTQyMDM5ZGJhYjMxZTRiZWRlOCAgZGphbmdvLTUuMi45
LnRhci5negorc2hhMjU2ICAxNmI1Y2NmYzVlOGMyN2U2YzA1NjFhZjU1MWQyZWEzMjg1MmQ3MzUy
YzY3ZDQ1MmFlM2U3NmI0ZjZiMmNhNDk1ICBkamFuZ28tNS4yLjkudGFyLmd6CiAjIExvY2FsbHkg
Y29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBiODQ2NDE1ZDFiNTE0ZTljMWRmZjE0
YTIyZGViOTA2ZDc5NGJjNTQ2Y2E2MTI5Zjk1MGExOGNkMDkxZTJhNjY5ICBMSUNFTlNFCiBzaGEy
NTYgIGRjYWMxYzg2Y2I3YWI0OTE3MDJiZGI0YzQxYmU2ODBmYWZkZTUxNTM2NzQ4Y2M4YWFlZTM4
NDBlZWM1M2VkMTcgIGRqYW5nby9jb250cmliL2dpcy9tZWFzdXJlLnB5CmRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tayBiL3BhY2thZ2UvcHl0aG9uLWRq
YW5nby9weXRob24tZGphbmdvLm1rCmluZGV4IDkyMGZkOGE1NzcuLjdhYWJjZTY4ZWYgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rCisrKyBiL3BhY2th
Z2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdvLm1rCkBAIC00LDEwICs0LDEwIEBACiAjCiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QWVRIT05fREpBTkdPX1ZFUlNJT04gPSA1LjIuOAor
UFlUSE9OX0RKQU5HT19WRVJTSU9OID0gNS4yLjkKIFBZVEhPTl9ESkFOR09fU09VUkNFID0gZGph
bmdvLSQoUFlUSE9OX0RKQU5HT19WRVJTSU9OKS50YXIuZ3oKICMgVGhlIG9mZmljaWFsIERqYW5n
byBzaXRlIGhhcyBhbiB1bnByYWN0aWNhbCBVUkwKLVBZVEhPTl9ESkFOR09fU0lURSA9IGh0dHBz
Oi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8wNS9hMi85MzNkYmJiM2RkOTk5MDQ5
NDk2MGY2ZTY0YWNhMmFmNGMwNzQ1YjYzYjcxMTNmNTlhODIyZGY5MjMyOWUKK1BZVEhPTl9ESkFO
R09fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9lYi8xYy8x
ODhjZTg1ZWUzODBmNzE0YjcwNDI4MzAxMzQzNDk3NmRmOGQzYTJkZjhlNzM1MjIxYTAyNjA1YjY3
OTQKIFBZVEhPTl9ESkFOR09fTElDRU5TRSA9IEJTRC0zLUNsYXVzZSwgTUlUIChqcXVlcnksIHV0
aWxzL2FyY2hpdmUucHkpLCBCU0QtMi1DbGF1c2UgKGlubGluZXMuanMpCiBQWVRIT05fREpBTkdP
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFIFwKIAlkamFuZ28vY29udHJpYi9naXMvbWVhc3VyZS5w
eSBcCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
