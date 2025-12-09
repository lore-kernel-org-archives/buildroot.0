Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE667D3B7EA
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 08:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 857B44051D;
	Tue,  9 Dec 2025 08:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1MYGxvErWXbC; Tue,  9 Dec 2025 08:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B523340D08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765270464;
	bh=EyLxbEqsySLDk7WZn0T+MURCQYHhe0plkLGh89IF2fE=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mvAMuOplm4JmQPIeX6kZaFwXCRmvLd4ml5K7z5lNcM8Yj6e9lTZ7rLgrPxRHsxvbF
	 DmTAgt3nJ7KMWabuOl08DzWcS4kZC+H1N070h/YpLEdOQLcJE+s3Kw+Pjxi1w6cuBC
	 6m5AMbcmifcY8DgIFts0AIlfQ3JGqrZ3jvEcI4giTzSb2fuNgu2UTSpHTQVtM2nJRS
	 ZNccPGOXtE45N8EACymY7VuuSQZBTMqpl1Dfb8Vb0ZFiLDM8cAgJcRENOPNur6PlnZ
	 fGB0cdoM+N5IfkTo9Am2my9KM9vvDseyCHFJiNlslB3PbXHtScfIEsgu0cXwwQQcOj
	 CzwCwTZHY7svg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B523340D08;
	Tue,  9 Dec 2025 08:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABCF3197
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5C284010C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTltOsuE0g_Q for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D989840029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D989840029
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D989840029
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E164B4E41B19;
 Tue,  9 Dec 2025 08:54:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB979606E2;
 Tue,  9 Dec 2025 08:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58D9D11930301; Tue,  9 Dec 2025 09:54:17 +0100 (CET)
Date: Tue, 09 Dec 2025 09:54:10 +0100
Message-Id: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALLjN2kC/2XM0QrCIBiG4VsZHmf8ujmto+4jInLT9oNp6JBi7
 N5zg4Lq8PvgfSaSTESTyL6aSDQZEwZfRr2pSDdc/NVQ7MsmHLgABS11qF3v07mP6BwFxSwTtmm
 N0KQ092gsPlbveCp7wDSG+Fz5zJb3LckfKTMKVPRKstpqUC0cdAijQ7/two0sVuafngH763npr
 WjkTkqlGmW/+3meX3oXrs7sAAAA
X-Change-ID: 20250806-libldns_drill-081f15f46e5b
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765270458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=zKITK/UITFRT1BQi0Qz3u/TgAJLZBiBfbRkT8Uur58M=;
 b=EmV82k3s+z/PAmBxeICrl/vF3jVbYXKu9axU0VBCUfx5+i9OM0VPjQmr/p5mB31iSVFT7r
 Yw3HqRnBPcmDC1SLlWjMh/sAnzmGGHztjbaco67rMgOP2I+zUcYWjkbq78xQ70E/P/ngRi
 3yDVAVnBLU4OLHzpUGpTwAmCEpOihO9CI42My/iICvfr0zg47o5WSgJcjYQUfDXDzYzSEW
 WXCQ6v5FWqOqY5nQvD0zUHPngpgDWcuzZ/nDMkXt0PZNllrn4ZACFVH9WRHSwJkHWwQfVs
 mnrgeNQzpJct/KoLsUX3fHfzVAJly1LGu79bAZl3e6WywCxVVVTREOeo/LNQvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EmV82k3s
Subject: [Buildroot] [PATCH v3 0/2] package/libldns: allow to build drill
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

SGVsbG8sCnRoaXMgaXMgdGhlIHYzIG9mIGEgc21hbGwgc2VyaWVzIGFpbWluZyB0byBhbGxvdyBi
dWlsZGluZyB0aGUgZHJpbGwKY29tbWFuZGxpbmUgdG9vbCwgc3VwcG9ydGVkIGJ5IGxpYmxkbnMg
cGFja2FnZS4gSSByZWFsaXplIHRoYXQgSSBoYXZlCm1lc3NlZC11cCB0aGUgdmVyc2lvbmluZyBv
biB0aGUgcHJldmlvdXMgcmV2aXNpb24sIHdoaWNoIF9zaG91bGRfIGhhdmUKYmVlbiB2Mywgc28g
aGVyZSBpcyB0aGUgYWN0dWFsIHYzLiBJdCBkb2VzIG5vdCBicmluZyBhbnkgY2hhbmdlLCBhc2lk
ZQpmcm9tIHByb3Blcmx5IGNvbGxlY3Rpbmcgc29tZSBSQiBmcm9tIFRob21hcy4KCmRyaWxsIGlz
IGEgc21hbGwgQ0xJIHRvb2wgYWxsb3dpbmcgdG8gcGVyZm9ybSBhbmQgZGVidWcgRE5TIHJlcXVl
c3RzLgpXaGlsZSBhdCBpdCwgdGhlIHNlcmllcyBicmluZ3MgaW4gYSBzbWFsbCBydW50aW1lIHRl
c3QgdmFsaWRhdGluZyB0aGF0CnRoZSBiaW5hcnkgKGFuZCBzbywgdGhlIGxpYnJhcnkgaXQgZGVw
ZW5kcyBvbikgaXMgY29ycmVjdGx5IGJ1aWx0LAppbnN0YWxsZWQsIGFuZCB0aGF0IGl0IGlzIGFi
bGUgdG8gcnVuIG9uIHRoZSB0YXJnZXQgYXJjaGl0ZWN0dXJlLgoKWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI1MDgwNy1saWJsZG5zX2RyaWxsLXYxLTAtNWQ4NzEzZmIw
ODYwQGJvb3RsaW4uY29tLwoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gY29sbGVjdCBUaG9tYXMn
IFJCCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MTAxNy1saWJs
ZG5zX2RyaWxsLXYyLTAtZjU0Nzk3Nzg4NDhmQGJvb3RsaW4uY29tCgpDaGFuZ2VzIGluIHYyOgot
IEFkZGVkIG1pc3NpbmcgU29CIGluIGZpcnN0IHBhdGNoCi0gcmVtb3ZlIHVuZWNlc3NhcnkgImRl
ZmF1bHQgbiIgaW4gQ29uZmlnLmluCi0gZml4ZWQgY29tbWVudCBhYm91dCB0b29sY2hhaW4gZmVh
dHVyZXMgcmVxdWlyZW1lbnQKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjUwODA3LWxpYmxkbnNfZHJpbGwtdjEtMC01ZDg3MTNmYjA4NjBAYm9vdGxpbi5jb20KCi0t
LQpBbGV4aXMgTG90aG9yw6kgKDIpOgogICAgICBwYWNrYWdlL2xpYmxkbnM6IGFkZCBhbiBvcHRp
b24gdG8gYnVpbGQgYW5kIGluc3RhbGwgZHJpbGwKICAgICAgc3VwcG9ydC90ZXN0aW5nOiBhZGQg
YmFzaWMgcnVudGltZSB0ZXN0IGZvciBsaWJsZG5zL2RyaWxsCgogcGFja2FnZS9saWJsZG5zL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwogcGFja2FnZS9s
aWJsZG5zL2xpYmxkbnMubWsgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwogc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJsZG5zLnB5IHwgMjEgKysrKysrKysrKysr
KysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29t
bWl0OiAzZjNkNmU0M2RlOWI0YWFjN2RmODU0NWZkODExMTcxMjU2Zjg3OGQzCmNoYW5nZS1pZDog
MjAyNTA4MDYtbGlibGRuc19kcmlsbC0wODFmMTVmNDZlNWIKCkJlc3QgcmVnYXJkcywKLS0gCkFs
ZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVy
aW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
