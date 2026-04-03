Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAEEE85360
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 12:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D2E40DF5;
	Fri,  3 Apr 2026 12:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PepkvHrdeMG; Fri,  3 Apr 2026 12:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69B1240DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775219904;
	bh=EomUEAEiu+USWPK0piCqA/aFLCKB3LTRYjpzefaVKl4=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kHeZnvncKdsXiQRaj9A+h1vTAMvVJ6HBKJHcfvmpDUQEsH8w6dKServ7ZCRb/Mp7/
	 4IuWgf84jS2QNp0roQQqAxKY57NgeYcK8eMOJzQJ45/u8rhlRALNxVsdLFBGUNOV4/
	 +tn3oEqL64FlhCWobimIlIqKMlu7Gti42x6oODHjoQD9vnYENqe65WcgAVGpmrr411
	 Ztlimw4t4WaMnLP3Db5Mlq0C5n/Z4iq4dmbpEqO1XhJZnYigKDeExWFmnronpPZv/J
	 9YgKY5Tde6Klm294X/2xLducZO5JvHn4IcjQTCOufOSEV6MMRMLXYjdPnQV+wQeQGE
	 e2vi+JZjvhP6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B1240DF9;
	Fri,  3 Apr 2026 12:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F25491A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E432B40E08
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_biPAobPDU4 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 12:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD5CE40DF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD5CE40DF5
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD5CE40DF5
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:38:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 644004E42841
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3B896603C1
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 661C2104500C5; 
 Fri,  3 Apr 2026 14:38:18 +0200 (CEST)
Date: Fri, 03 Apr 2026 14:38:16 +0200
MIME-Version: 1.0
Message-Id: <20260403-openscap_bump-v2-1-dd4242ff402e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBAFf4Xs2ZpSCrGe/A9DDK2LrJG2aUujI
 fy7gGePk8ybN0PEQBjhXMwQMFMkZ1cQhwLM0NkHMrqvDIKLhkteMefRRtP5m55Gz/CkpWpq2dS
 8gnXjA/b03nvX9sdx0k80aYtsxkAxufDZD3O5ef/auWQlE7xXylRGSaEu2rn0Ins0boR2WZYvj
 eJNJL4AAAA=
X-Change-ID: 20260403-openscap_bump-e8b496546503
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1775219898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=yQw3A+v6A4/hx1iNxGWLM5NMsUCJ9jWzHJJQqScY5cE=;
 b=seqiJj2io9YFaoK/zcjDL0kBXYW3mAMGF3n8tupuqP8XSC2mYVbuLGTbK2hSkEVLrN9BDf
 +pPDXfnScDs9kCg9/4FFFXXbgYe1eHBsijwNbfAyDsiRrnQLGvfFSwlx/Fe6G30Yoz7YAG
 FdLabC2zM+RLZ0WTLTDd+dP9jf3uqXasR/rQeTbDeMvXFZgkk9RwX/HRJgEy0a1zvqLh4I
 RE8GxXzvNgDdv+ZGI7AzUJHC650JgfHtDLxfm30j/z209260/d9mfMmQfJ2Ist4kK3Mzvv
 H+LN4ZdF6qWciNX8uS+gMYgbSv++hHKNlg9p7iBvelzKQqmmn1cHd3NO6PHpFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=seqiJj2i
Subject: [Buildroot] [PATCH v2] package/openscap: bump to version 1.4.3
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

VGhlIGN1c3RvbSBwYXRjaCB0byBlbmZvcmNlIHByb2plY3QgYXMgQyBwcm9qZWN0IGhhcyBiZWVu
IG1lcmdlZCB1cHN0cmVhbQpzaW5jZSB0aGVuLCBidXQgaXQgaXMgbm90IHJlbGVhc2VkIHlldC4g
VGhpcyBjb21taXQgdXBkYXRlcyB0aGUgcGF0Y2ggdG8KYXBwbHkgaXQgb24gdG9wIG9mIDEuNC4z
LCBhbmQgdXNlIHRoZSBvcHBvcnR1bml0eSB0byBmaXggdGhlIHBhdGNoIGZpbGUKbmFtZSB0byBt
YXRjaCB0aGUgY29tbWl0IHRpdGxlLgoKU2luY2UgdmVyc2lvbiAxLjQuMCwgb3BlbnNjYXAgZGVw
ZW5kcyBvbiBQQ1JFMiByYXRoZXIgdGhhbiBQQ1JFCgpodHRwczovL2dpdGh1Yi5jb20vT3BlblND
QVAvb3BlbnNjYXAvY29tcGFyZS8xLjMuMTIuLi4xLjQuMwoKU2lnbmVkLW9mZi1ieTogQWxleGlz
IExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6
Ci0gZml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UKLSByZW1vdmUgZGVwZW5kZW5jeSBvbiBQQ1JF
X1VURiBjb25maWcgb3B0aW9uCi0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5r
LzIwMjYwNDAzLW9wZW5zY2FwX2J1bXAtdjEtMS0yMGY5OWMzYzk0MjlAYm9vdGxpbi5jb20KLS0t
CiAuLi49PiAwMDAxLVNldC1wcm9qZWN0LWFzLUMtcHJvamVjdC1pbi1DTWFrZUxpc3RzLnR4dC5w
YXRjaH0gfCAxMiArKysrKystLS0tLS0KIHBhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICstLQogcGFja2FnZS9vcGVuc2NhcC9v
cGVuc2NhcC5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2th
Z2Uvb3BlbnNjYXAvb3BlbnNjYXAubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwLzAwMDEtc2V0LXByb2plY3QtYXMt
Yy1wcm9qZWN0LnBhdGNoIGIvcGFja2FnZS9vcGVuc2NhcC8wMDAxLVNldC1wcm9qZWN0LWFzLUMt
cHJvamVjdC1pbi1DTWFrZUxpc3RzLnR4dC5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5h
bWUgZnJvbSBwYWNrYWdlL29wZW5zY2FwLzAwMDEtc2V0LXByb2plY3QtYXMtYy1wcm9qZWN0LnBh
dGNoCnJlbmFtZSB0byBwYWNrYWdlL29wZW5zY2FwLzAwMDEtU2V0LXByb2plY3QtYXMtQy1wcm9q
ZWN0LWluLUNNYWtlTGlzdHMudHh0LnBhdGNoCmluZGV4IGM3OTRmYmFmNDRkYy4uMmNjYmZkMTM4
ZDJiIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW5zY2FwLzAwMDEtc2V0LXByb2plY3QtYXMtYy1w
cm9qZWN0LnBhdGNoCisrKyBiL3BhY2thZ2Uvb3BlbnNjYXAvMDAwMS1TZXQtcHJvamVjdC1hcy1D
LXByb2plY3QtaW4tQ01ha2VMaXN0cy50eHQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE3
NDI2NDdlZmQyMTViNjgyZTRjZDI2YjE1YWMzZTU4MGMxMGVmOWYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGQyZmE4ZGYxMjZiNTMzMzE3YjRiODYzNzU4Y2Y1NzlmZmYzYTJiNDUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/QWxleGlzPTIwTG90aG9yPUMz
PUE5Pz0gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgogRGF0ZTogTW9uLCAxNiBGZWIgMjAy
NiAxMzo1MDo0OCArMDEwMAogU3ViamVjdDogW1BBVENIXSBTZXQgcHJvamVjdCBhcyBDIHByb2pl
Y3QgaW4gQ01ha2VMaXN0cy50eHQKQEAgLTUzLDE1ICs1MywxNSBAQCB0ZXN0IEMrKyBmZWF0dXJl
cyBvbiB0aGUgdXNlZCB0b29sY2hhaW4uCiBbMV0gaHR0cHM6Ly9idWlsZHJvb3Qub3JnLwogWzJd
IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8xZmU1NTBmZmE3OWYwYTA4
M2E0NTBhZTAzZmUwNjdhOGFiNzMzNmJlL2J1aWxkLWVuZC5sb2cKIAotVXBzdHJlYW06IGh0dHBz
Oi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2NhcC9wdWxsLzIzMTIKLVtwYXRjaCBzbGlnaHRs
eSBhZGFwdGVkIHRvIGJlIGFwcGxpY2FibGUgb24gdjEuMy4xMl0KK1Vwc3RyZWFtOiBodHRwczov
L2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNjYXAvY29tbWl0L2JiZmIyZDdiMDBjYmI4ZTA4ZDk5
OTU0NjczNGQzYmE2YWUxNTA3MzYKK1twYXRjaCBzbGlnaHRseSBhZGFwdGVkIHRvIGJlIGFwcGxp
Y2FibGUgb24gdjEuNC4zXQogU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KIC0tLQogIENNYWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Q01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggY2IxM2RlYmI0N2NmLi4wNWIw
NTQzMjc5NTEgMTAwNjQ0CitpbmRleCBjNTYxMTE2ZDgyNmMuLjU3MDgxMjY2NzAzNiAxMDA2NDQK
IC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAogQEAgLTgsNyArOCw3
IEBAIGlmKE5PVCBDTUFLRV9CVUlMRF9UWVBFIEFORCBOT1QgQ01BS0VfQ09ORklHVVJBVElPTl9U
WVBFUykKQEAgLTcxLDggKzcxLDggQEAgaW5kZXggY2IxM2RlYmI0N2NmLi4wNWIwNTQzMjc5NTEg
MTAwNjQ0CiAtcHJvamVjdCgib3BlbnNjYXAiKQogK3Byb2plY3QoIm9wZW5zY2FwIiBDKQogIHNl
dChPUEVOU0NBUF9WRVJTSU9OX01BSk9SICIxIikKLSBzZXQoT1BFTlNDQVBfVkVSU0lPTl9NSU5P
UiAiMyIpCi0gc2V0KE9QRU5TQ0FQX1ZFUlNJT05fUEFUQ0ggIjEyIikKKyBzZXQoT1BFTlNDQVBf
VkVSU0lPTl9NSU5PUiAiNCIpCisgc2V0KE9QRU5TQ0FQX1ZFUlNJT05fUEFUQ0ggIjMiKQogLS0g
CiAyLjUzLjAKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4gYi9wYWNr
YWdlL29wZW5zY2FwL0NvbmZpZy5pbgppbmRleCAzMTcwNTVjNzUzMjcuLjk0MmQyYjdjNDZkZiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9vcGVu
c2NhcC9Db25maWcuaW4KQEAgLTEwLDggKzEwLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09QRU5T
Q0FQCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhTTFQKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTElC
WE1MU0VDMQogCXNlbGVjdCBCUjJfUEFDS0FHRV9NVVNMX0ZUUyBpZiAhQlIyX1RPT0xDSEFJTl9V
U0VTX0dMSUJDCi0Jc2VsZWN0IEJSMl9QQUNLQUdFX1BDUkUKLQlzZWxlY3QgQlIyX1BBQ0tBR0Vf
UENSRV9VVEYKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUENSRTIKIAloZWxwCiAJICBUaGUgcHVycG9z
ZSBvZiB0aGlzIHByb2plY3QgaXMgdG8gY3JlYXRlIHNlY3VyaXR5IHBvbGljeQogCSAgY29udGVu
dCBmb3IgdmFyaW91cyBwbGF0Zm9ybXMKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNjYXAvb3Bl
bnNjYXAuaGFzaCBiL3BhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaAppbmRleCBlOTg2MzEz
NzJkNTEuLjdhMjU3ODliNWJjYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2Nh
cC5oYXNoCisrKyBiL3BhY2thZ2Uvb3BlbnNjYXAvb3BlbnNjYXAuaGFzaApAQCAtMSwzICsxLDMg
QEAKICMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICA2ZTYxOTEzZmNhM2E3NGQzMTBkN2NmOTM1
NDk3M2VlYWVmYTQyYmU5MDlhZTY0OWFmMWRmNDhjM2MwOGJjNmZmICBvcGVuc2NhcC0xLjMuMTIu
dGFyLmd6CitzaGEyNTYgIDk2ZWJlNjk3YWFmYzgzZWIyOTdhOGYyOTU5NmQ1NzMxOTI3ODExMjQ2
N2M0NmU2YWFmMzY0OWIzMTFjZjhmYmEgIG9wZW5zY2FwLTEuNC4zLnRhci5negogc2hhMjU2ICA1
ZGYwNzAwNzE5ODk4OWM2MjJmNWQ0MWRlOGQ3MDNlN2JlZjNkMGU3OWQ2MmUyNDMzMmVlNzM5YTQ1
MmFmNjJhICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLm1r
IGIvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5tawppbmRleCAyMDQyNzUyNGQ3OWEuLjQyZjY0
NGRiNTVlOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9vcGVuc2NhcC9vcGVuc2NhcC5taworKysgYi9w
YWNrYWdlL29wZW5zY2FwL29wZW5zY2FwLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotT1BFTlNDQVBfVkVSU0lPTiA9IDEuMy4xMgorT1BFTlNDQVBfVkVS
U0lPTiA9IDEuNC4zCiBPUEVOU0NBUF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL09wZW5TQ0FQ
L29wZW5zY2FwL3JlbGVhc2VzL2Rvd25sb2FkLyQoT1BFTlNDQVBfVkVSU0lPTikKIE9QRU5TQ0FQ
X0xJQ0VOU0UgPSBMR1BMLTIuMSsKIE9QRU5TQ0FQX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCkBA
IC0xNyw3ICsxNyw3IEBAIE9QRU5TQ0FQX0RFUEVOREVOQ0lFUyA9IFwKIAlsaWJ4bWwyIFwKIAls
aWJ4bWxzZWMxIFwKIAlsaWJ4c2x0IFwKLQlwY3JlCisJcGNyZTIKIAogSE9TVF9PUEVOU0NBUF9E
RVBFTkRFTkNJRVMgPSBcCiAJaG9zdC1wa2djb25mIFwKQEAgLTI2LDcgKzI2LDcgQEAgSE9TVF9P
UEVOU0NBUF9ERVBFTkRFTkNJRVMgPSBcCiAJaG9zdC1saWJ4bWwyIFwKIAlob3N0LWxpYnhtbHNl
YzEgXAogCWhvc3QtbGlieHNsdCBcCi0JaG9zdC1wY3JlCisJaG9zdC1wY3JlMgogCiBPUEVOU0NB
UF9DT05GX09QVFMgPSBcCiAJLURFTkFCTEVfT1NDQVBfVVRJTD1PTiBcCgotLS0KYmFzZS1jb21t
aXQ6IDAxMWJjNGI3NDcyYmY3NzgyYWY0ZWI4MTg3ZjVjOTk5MmE5ZjljZWYKY2hhbmdlLWlkOiAy
MDI2MDQwMy1vcGVuc2NhcF9idW1wLWU4YjQ5NjU0NjUwMwoKQmVzdCByZWdhcmRzLAotLSAgCkFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
