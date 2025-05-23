Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998FDC54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6142B61486;
	Fri, 23 May 2025 17:50:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IV-eFl1wkekd; Fri, 23 May 2025 17:50:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A076607E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A076607E9;
	Fri, 23 May 2025 17:50:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D84ACA
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F6F34031D
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzwxucRSZcAF for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.98;
 helo=smtp-outgoing-1603.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A8EB404C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A8EB404C7
Received: from smtp-outgoing-1603.laposte.net (smtp-outgoing-1603.laposte.net
 [160.92.124.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A8EB404C7
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:21 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t3Y5h6JzKm46","contextId":
 "9a3f089a-6772-478c-9713-2e16cd36af36"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3t3Y5h6JzKm46;
 Fri, 23 May 2025 19:50:17 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t3Y4VNlzKm44","contextId":
 "380f369a-7fc3-47b3-9c7a-c367b0875602"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3t3Y4VNlzKm44;
 Fri, 23 May 2025 19:50:17 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id DDE8B670D669;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022n-0t0c; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:13 +0200
Message-ID: <20250523174313.7056-6-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022618;
 bh=1NpICNoHq0Pg4fh/zCGGPlDxBzzuXl+l7OLoYNoxlHU=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=U7GDXF1R1bpAB6iMr5TKlXcpPCHLGJ0alaLICyLD6zyBds+htk2yLg/vjpcPRrZjBQz/cuZ0lhQJ2zjB027XShltdrdLPQsHAjHJXKCEoy7i/1D/cDDOBQMKg2ldjghh7WPtad2UJ5nz5T6ClBkD19eHEyzZMwMKSXVG8YYcv2g4C+7ZNF8GY1FMpNuEIxi9zmnvbrGTlWC5Sf82Yr2Z8L21KS5+t+hALEiXQrFgweGHWd5THLLp5ASrlnUXpNL4htrJul7/nCAG0Z4LkDkSYDL0EJ9TokgNTITtIiTiGiHHgYOIuFisNl35wIksUBVh9vZPSP6+t8/2rpM/PAnW+g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=U7GDXF1R
Subject: [Buildroot] [PATCH 5/5] configs/qemu_hppa_b160l: new defconfig
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

QWRkIGEgZGVmY29uZmlnIHRvIHJ1biBMaW51eCBvbiBhIEhQIFZpc3VhbGl6ZSBCMTYwTCBQQS1S
SVNDIFdvcmtzdGF0aW9uLAplbXVsYXRlZCB3aXRoIFFlbXUuCgpXaGlsZSBhdCBpdCwgYWRkIG15
c2VsZiBpbiBERVZFTE9QRVJTLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5j
ZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwog
Ym9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQgIHwgMzEgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogY29uZmlncy9xZW11X2hwcGFfYjE2MGxfZGVmY29uZmlnIHwgMTggKysr
KysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L2hwcGEtYjE2MGwvcmVhZG1lLnR4dAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCmluZGV4IDQ3ZjNlMDMwZTUuLmYxODUzMDdmNjAgMTAw
NjQ0Ci0tLSBhL0RFVkVMT1BFUlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMzM4NSw4ICszMzg1LDEw
IEBAIEY6CWFyY2gvQ29uZmlnLmluLmhwcGEKIEY6CWFyY2gvYXJjaC5tay5ocHBhCiBGOglib2Fy
ZC9hcm0vZm91bmRhdGlvbi12OC8KIEY6CWJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW0yLXplcm8v
CitGOglib2FyZC9xZW11L2hwcGEtYjE2MGwvCiBGOgljb25maWdzL2FybV9mb3VuZGF0aW9udjhf
ZGVmY29uZmlnCiBGOgljb25maWdzL2JhbmFuYXBpX20yX3plcm9fZGVmY29uZmlnCitGOgljb25m
aWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcKIEY6CWNvbmZpZ3MvdWV2bTU0MzJfZGVmY29u
ZmlnCiBGOglwYWNrYWdlL2k3ei8KIEY6CXBhY2thZ2UvbXNyLXRvb2xzLwpkaWZmIC0tZ2l0IGEv
Ym9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQgYi9ib2FyZC9xZW11L2hwcGEtYjE2MGwv
cmVhZG1lLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43NWU1MGU0
NTFiCi0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQK
QEAgLTAsMCArMSwzMSBAQAorSW50cm9kdWN0aW9uCis9PT09PT09PT09PT0KKworVGhlIHFlbXVf
aHBwYV9iMTYwbF9kZWZjb25maWcgaXMgbWVhbnQgdG8gcnVuIExpbnV4IG9uIGEgSFAgVmlzdWFs
aXplIEIxNjBMCitQQS1SSVNDIFdvcmtzdGF0aW9uLCBlbXVsYXRlZCB3aXRoIFFlbXUuCisKK0J1
aWxkaW5nCis9PT09PT09PQorCisgICQgbWFrZSBxZW11X2hwcGFfYjE2MGxfZGVmY29uZmlnCisg
ICQgbWFrZQorCitHZW5lcmF0ZWQgZmlsZXMgdW5kZXIgb3V0cHV0L2ltYWdlczoKKworKiByb290
ZnMuZXh0NDogdGhlIHJvb3QgZmlsZXN5c3RlbS4KKyogdm1saW51eDogdGhlIExpbnV4IGtlcm5l
bC4KKworUnVubmluZyB1bmRlciBRZW11Cis9PT09PT09PT09PT09PT09PT0KKworUnVuIHRoZSBl
bXVsYXRpb24gd2l0aDoKKworICBxZW11LXN5c3RlbS1ocHBhIFwKKyAgICAgIC1tYWNoaW5lIEIx
NjBMIFwKKyAgICAgIC1hcHBlbmQgInJvb3R3YWl0IHJvb3Q9L2Rldi9zZGEiIFwKKyAgICAgIC1o
ZGEgb3V0cHV0L2ltYWdlcy9yb290ZnMuZXh0NCBcCisgICAgICAta2VybmVsIG91dHB1dC9pbWFn
ZXMvdm1saW51eCBcCisgICAgICAtbm9ncmFwaGljIFwKKyAgICAgIC1zbXAgMiAjIHFlbXVfaHBw
YV9iMTYwbF9kZWZjb25maWcKKworVGhlIGxvZ2luIHByb21wdCB3aWxsIGFwcGVhciBpbiB0aGUg
dGVybWluYWwgdGhhdCBzdGFydGVkIFFlbXUuCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfaHBw
YV9iMTYwbF9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTg4ZjE5NWY3NgotLS0gL2Rldi9u
dWxsCisrKyBiL2NvbmZpZ3MvcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZwpAQCAtMCwwICsxLDE4
IEBACitCUjJfaHBwYT15CitCUjJfcGFyaXNjMTE9eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9I
RUFERVJTX0NVU1RPTV82XzEyPXkKK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9xZW11L3Bh
dGNoZXMiCitCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKK0JSMl9TWVNURU1fREhD
UD0iZXRoMCIKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9zdC1p
bWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSIK
K0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15CitC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjI3IgorQlIyX0xJTlVY
X0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CitCUjJfTElOVVhfS0VSTkVMX05FRURT
X0hPU1RfT1BFTlNTTD15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJHRVRfUk9P
VEZTX0VYVDJfND15CisjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CitCUjJfUEFD
S0FHRV9IT1NUX1FFTVU9eQorQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKLS0g
CjIuNDcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
