Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F00EB2718
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA0682735;
	Tue, 10 Feb 2026 21:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_KgrU-qWsFb; Tue, 10 Feb 2026 21:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF8582771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770757329;
	bh=RlzhN1tX9D4VoYEZln0Nv/jof/kpb6XBXr0BsIVJtfM=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Wc6tKlrWUEAPM8XKBN2X2lFHPFZjekGtV+EUMOi39bWCL93jhu9Yh2/54pmiJqU+U
	 Hj7JgfblpknBxhAaihBINLcc3BnqtorfkyKp5MSG64SypbxgYqZCJv5ZMs3KCPIQZs
	 hwBydroIM4fOFFsBKHWfDCxwFHXEtreZHfFDHnpZcTcfdU69vyMs7EyNfQZpPVJoym
	 F7hn1KQOd0gY4bP76NbZfdEn+a/NgcSHn7CxW/qCaZeFS+xuR0aklRY9Pu83uVYDrV
	 ovbq5dE7sTNSUhRLbiSTrrSRyeYCMn5kP4C+NqDEr1kJoiT41IvKLG2XN07QRsnrrj
	 Ug9jvi60n28Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF8582771;
	Tue, 10 Feb 2026 21:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F2BDF2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC5140E1E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNdxABOqWaQN for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37E7640042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37E7640042
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37E7640042
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 21:02:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0E4AA1A0D2E;
 Tue, 10 Feb 2026 21:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D68BA606BD;
 Tue, 10 Feb 2026 21:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9421F10B91987; Tue, 10 Feb 2026 22:02:00 +0100 (CET)
Date: Tue, 10 Feb 2026 22:01:54 +0100
Message-Id: <20260210-python-packages-v1-0-6153f56421d4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avIrBNUjH6uEi0Gm2oIVDSiCO+et
 PwW772QKTFlGMULiS7OHHyFbgS4Hf1GkpdqMMq0qldWxufcg5cR3YEbZdmSxaFH2zm9QK1iopX
 v/zjNpXw/YkFDYQAAAA==
X-Change-ID: 20250804-python-packages-5e4a98a47c1d
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770757323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Q2VQlLN/6x+sRZCra49XjoelUbMHQZgdPbZZoslCEOk=;
 b=N5WxWeHalhsW4vpLIVY+eVzSsrErI6s5OAxJKk9EVopM2ZIR7ZFr2uK1Gr9u1vOkQDBQQN
 Xd1g0chVIAcAxD4ICiVkLk4X4SGcPajebiQ7J3HeTtb1C8F2tYpk06oANd8nf5cdAo/oKk
 OsC+tb6rkT1UYkQ+JrOnbCeCpLkxSGQLUwdMuiMNSJDGA+Ao+YeYykt5GnGYcTZSJX/Rwk
 bmY4CGNykn41JLI+89KaQ6HGC3xQjjHtl3ZQpHPoFjHDxiB3Qo1bPUnAO6gU0Ie9kwH1oY
 2oLBFAUF8P74flPErsCe+Jjl2Oq3N1fqb5wmwwHdqZPXizhFAdpvS7Z+rGSnrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=N5WxWeHa
Subject: [Buildroot] [PATCH 0/2] package: add new python packages
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

SGVsbG8sCgp0aGlzIHNtYWxsIHNlcmllcyBhaW1zIHRvIGludHJvZHVjZSB0d28gbmV3IHB5dGhv
biBwYWNrYWdlczoKLSBweXRob24tZmxhc2stc29ja2V0aW86IGFsbG93cyBldmVudC1iYXNlZCBi
aS1kaXJlY3Rpb25hbAogIGNvbW11bmljYXRpb24gYmV0d2VlbiBGbGFzayBhcHBsaWNhdGlvbnMg
YW5kIHNlcnZlcgotIHB5dGhvbi1nZXZlbnQ6IGEgY29yb3V0aW5lLWJhc2VkIG5ldHdvcmsgbGli
cmFyeSwgYXMgYSBkZXBlbmRlbmN5IG9mCiAgcHl0aG9uLWZsYXNrLXNvY2tldGlvCgpweXRob24t
Zmxhc2stc29ja2V0aW8gbmVlZHMgYXQgbGVhc3Qgb25lIG9mIHRob3NlIGRlcGVuZGVuY2llczoK
LSBldmVudGxldAotIGdldmVudAotIGZsYXNrIGRldiBzZXJ2ZXIKClswXSBtZW50aW9ucyB0aGF0
IGV2ZW50bGV0IGlzIGRpc2NvdXJhZ2VkIGZvciBuZXcgcHJvamVjdHMsIGFuZCBbMV0Kc3RhdGVz
IHRoYXQgRmxhc2sgd2Vic2VydmVyIHNob3VsZCBub3QgYmUgdXNlZCBmb3IgcHJvZHVjdGlvbiwg
aGVuY2UKdGhpcyBzZXJpZXMgc2VsZWN0cyBnZXZlbnQgYXMgdGhlIGRlZmF1bHQgZGVwZW5kZW5j
eSBmb3IKcHl0aG9uLWZsYXNrLXNvY2tldGlvLgoKLSBUaGUgdHdvIHBhY2thZ2VzIGhhdmUgYmVl
biBnZW5lcmF0ZWQgd2l0aCAuL3V0aWxzL3NjYW5weXBpLCBhbmQgYWRqdXN0ZWQKYWNjb3JkaW5n
bHkgKGxpY2Vuc2UsIGFuZCBidWlsZC9ydW50aW1lIGRlcGVuZGVuY2llcykuCi0gQm90aCBwYWNr
YWdlcyBicmluZyBhIG1pbmltYWwgdGVzdCBlbnN1cmluZyBhdCBsZWFzdCB0aGF0IHRoZQogIGNv
cnJlc3BvbmRpbmcgaW1wb3J0IGNhbiBiZSBwZXJmb3JtZWQgYXMgd2VsbCBhcyBiYXNpYwogIGlu
c3RhbnRhdGlvbi9tYW5pcHVsYXRpb24KLSBCb3RoIHBhY2thZ2VzIGhhdmUgYmVlbiB0ZXN0ZWQg
bG9jYWxseSB3aXRoIC4vdXRpbHMvdGVzdC1wa2csIGFuZAogIC4vc3VwcG9ydC90ZXN0aW5nL3J1
bi10ZXN0cyAodGhyb3VnaCAuL3V0aWxzL2RvY2tlci1ydW4pCgpbMF0gaHR0cHM6Ly9ldmVudGxl
dC5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3QvClsxXSBodHRwczovL2ZsYXNrLXNvY2tldGlvLnJl
YWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9pbnRyby5odG1sI3JlcXVpcmVtZW50cwoKU2lnbmVkLW9m
Zi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkFs
ZXhpcyBMb3Rob3LDqSAoMik6CiAgICAgIHBhY2thZ2UvcHl0aG9uLWdldmVudDogbmV3IHBhY2th
Z2UKICAgICAgcGFja2FnZS9weXRob24tZmxhc2stc29ja2V0aW86IG5ldyBwYWNrYWdlCgogREVW
RUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
KwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArKwogcGFja2FnZS9weXRob24tZmxhc2stc29ja2V0aW8vQ29uZmlnLmluICAgICAgICAg
ICAgICAgfCAxNCArKysrKysrKysrKysrKwogLi4uL3B5dGhvbi1mbGFzay1zb2NrZXRpby9weXRo
b24tZmxhc2stc29ja2V0aW8uaGFzaCAgfCAgNSArKysrKwogLi4uL3B5dGhvbi1mbGFzay1zb2Nr
ZXRpby9weXRob24tZmxhc2stc29ja2V0aW8ubWsgICAgfCAxNCArKysrKysrKysrKysrKwogcGFj
a2FnZS9weXRob24tZ2V2ZW50L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3B5dGhvbi1nZXZlbnQvcHl0aG9uLWdldmVudC5o
YXNoICAgICAgICAgICAgICB8ICA1ICsrKysrCiBwYWNrYWdlL3B5dGhvbi1nZXZlbnQvcHl0aG9u
LWdldmVudC5tayAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKIC4uLi90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZmxhc2tfc29ja2V0aW8ucHkgICAgIHwgIDUgKysrKysK
IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3NhbXBsZV9weXRob25fZ2V2ZW50LnB5IHwg
IDcgKysrKysrKwogLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fZmxhc2tfc29ja2V0aW8u
cHkgICAgICAgfCAxMiArKysrKysrKysrKysKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX2dldmVudC5weSAgIHwgMTIgKysrKysrKysrKysrCiAxMiBmaWxlcyBjaGFu
Z2VkLCAxMTMgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDk0YTgxN2E1ODkwOWUxY2Zl
MGMxZjYzYjYzNzU0MDc5ZjE4NjY1MjMKY2hhbmdlLWlkOiAyMDI1MDgwNC1weXRob24tcGFja2Fn
ZXMtNWU0YTk4YTQ3YzFkCgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
