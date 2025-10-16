Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C470CCCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 15:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6484780646;
	Thu, 16 Oct 2025 15:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUrBpPCcnO4s; Thu, 16 Oct 2025 15:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26BFA80642
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26BFA80642;
	Thu, 16 Oct 2025 15:27:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7FF5968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E571840029
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQ6QILx8lct3 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 15:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0613740026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0613740026
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0613740026
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 565551A142F
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 15:27:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2D7886062C;
 Thu, 16 Oct 2025 15:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BEBF102F2319; 
 Thu, 16 Oct 2025 17:27:07 +0200 (CEST)
Date: Thu, 16 Oct 2025 17:27:01 +0200
Message-Id: <20251016-libldns_drill-v1-0-21bfa8c53896@bootlin.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760628436; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=kDZMVh21L1ej+CGDnIrRUC4cEKOTG6Vv85oPqJwHlS4=;
 b=CgRGssg3k1dKTZAKRaQLrwQSm5Xndvrj5U7NkLgCmHddRadFakdmzezbrxEz9wqDmB/E4g
 T+kmGVKRWbMoWuR5rZaQrgEgQhvNQC0Typrb/K6NdyhiS4Vj24IZsJ5vBQxaMmki0iEBdI
 RHD3iLl+s38iPtwd9S6tMsHS640xUwctx1z2UwwY1aZTLJWPY0/VxyTUx+FYGo0krWpyQR
 m269SuSa0WHfRlawU3jGTfozWFYsTBnjfiFlJTLyxaD02x0VAN5HyTvrQQasDbGN6fOrzS
 0NdYecD8ZPx9CB+ekQuwdOUTrZoRHL8Q8ja+XHwfBcylaWo8NFUr27eDNJ3emw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CgRGssg3
Subject: [Buildroot] [PATCH RESEND 0/2] package/libldns: allow to build drill
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gYWxsb3cgYnVpbGRpbmcgdGhlIGRyaWxs
IGNvbW1hbmRsaW5lIHRvb2wsCnN1cHBvcnRlZCBieSBsaWJsZG5zIHBhY2thZ2UuIFRoaXMgaXMg
YSBzbWFsbCBDTEkgdG9vbCBhbGxvd2luZyB0bwpwZXJmb3JtIGFuZCBkZWJ1ZyBETlMgcmVxdWVz
dHMuIFdoaWxlIGF0IGl0LCB0aGUgc2VyaWVzIGJyaW5ncyBpbiBhCnNtYWxsIHJ1bnRpbWUgdGVz
dCB2YWxpZGF0aW5nIHRoYXQgdGhlIGJpbmFyeSAoYW5kIHNvLCB0aGUgbGlicmFyeSBpdApkZXBl
bmRzIG9uKSBpcyBjb3JyZWN0bHkgYnVpbHQsIGluc3RhbGxlZCwgYW5kIHRoYXQgaXQgaXMgYWJs
ZSB0byBydW4gb24KdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQWxleGlzIExvdGhv
csOpICgyKToKICAgICAgcGFja2FnZS9saWJsZG5zOiBhZGQgYW4gb3B0aW9uIHRvIGJ1aWxkIGFu
ZCBpbnN0YWxsIGRyaWxsCiAgICAgIHN1cHBvcnQvdGVzdGluZzogYWRkIGJhc2ljIHJ1bnRpbWUg
dGVzdCBmb3IgbGlibGRucy9kcmlsbAoKIHBhY2thZ2UvbGlibGRucy9Db25maWcuaW4gICAgICAg
ICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiBwYWNrYWdlL2xpYmxkbnMvbGlibGRu
cy5tayAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCiBzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkgfCAyMSArKysrKysrKysrKysrKysrKysrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDEzNzVhYWJm
NzRjMmY5NmE2NjIxZTM1ZmZmMTcxZTVhNDdhNzQyNWUKY2hhbmdlLWlkOiAyMDI1MDgwNi1saWJs
ZG5zX2RyaWxsLTA4MWYxNWY0NmU1YgoKQmVzdCByZWdhcmRzLAotLSAKQWxleGlzIExvdGhvcsOp
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
