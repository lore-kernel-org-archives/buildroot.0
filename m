Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41686E6BF11
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 018528138E;
	Fri, 30 Jan 2026 14:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xifMHhPKArIi; Fri, 30 Jan 2026 14:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D153881346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769784059;
	bh=k/qxOj1Txv+e4UlzWssKBhtWckievgWPbHy9Zjws0nc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ESmW6XrJ/LETbl2aH9Y9343pGAHK1L/+ghTGrDUL47RCqvSySM5KbU457bH6VeETX
	 ZBJ0+yU8uSqYDXvoK+qUrAiVDAKxVC2V1ssVoZK31/VKyLccFqLCp7ALYUynjq3ijv
	 /pmdng59AQPGDPcLygFVqdRHz+vd7WArBwiv8SihKV1BJkwF16hjy/rndD3rrhfHC6
	 4aQHqAh+tANkRWT3Rk7mUtSbcYS/THEKfNXWtVBS0gwcB8vTLivNUm8NzotBsl+o4l
	 f2fYj7EmXw/5MixWJCCH+OCdGGQ4q+ddPkshP1aCGokhfqEt4tbXdDGlEcu5hjNojL
	 eLSdyvaKDyEIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D153881346;
	Fri, 30 Jan 2026 14:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 432A71A6
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DE04016A
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_L2mwpj2XRq for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 14:40:57 +0000 (UTC)
X-Greylist: delayed 493 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Jan 2026 14:40:56 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FDEE400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDEE400F8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.156;
 helo=forward201b.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward201b.mail.yandex.net (forward201b.mail.yandex.net
 [178.154.239.156])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FDEE400F8
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 14:40:56 +0000 (UTC)
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d103])
 by forward201b.mail.yandex.net (Yandex) with ESMTPS id F1701C59F7
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 17:32:47 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c1e:3990:0:640:454b:0])
 by forward103b.mail.yandex.net (Yandex) with ESMTPS id 3B0B5C0061
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 17:32:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id aWlg8n7G9eA0-FWDn2PlN; 
 Fri, 30 Jan 2026 17:32:37 +0300
X-Yandex-Fwd: 1
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Fri, 30 Jan 2026 17:32:28 +0300
Message-ID: <20260130143230.114019-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1769783557; bh=HAS4+Q1uv/BvOCuDuiuTFZpjcO4GFzsOl71KZQlZXGQ=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=P+40vep+mhA2sgpQ08LCe2usMMhm/7NNps0PVD/f3bp3b1iAWfzPgRp783UBcc9ib
 OeiszGUJh5YZKEXkIZAM18N4f1I/yk8h8pgggi5YKUthb8oERhe6D6or2wClTddshI
 evBSWK39ZW8kjg274I3v3UtnOL2QtUertRl5v/nM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yuriev.ru header.i=@yuriev.ru header.a=rsa-sha256
 header.s=mail header.b=P+40vep+
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.11
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
From: =?utf-8?b?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIHZpYSBi?=
 =?utf-8?q?uildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN1cHBvcnRpbmcgcmVsZWFzZSBvZiBhIHN0YWJsZSBicmFuY2ggd2l0aCBidWcgZml4ZXMu
CgpTaW5jZSAyMDI2IGxpYm1kYnggcHJvamVjdCBoYXMgY2hhbmdlZCBpdHMgY29kZSBkZXZlbG9w
bWVudCBhbmQgZGlzdHJpYnV0aW9uIG1vZGVsLgpQbGVhc2Ugc2VlIGh0dHBzOi8vbGlibWRieC5k
cWRrZmEucnUvcmVsZWFzZS9saWJtZGJ4LXJvYWRtYXAtSE5ZMjAyNi1lbmdsaXNoLnBkZgoKQnJp
ZWZseSwgc2luY2UgMC4xMy4xMDoKIC0gRml4ZWQgdXNpbmcgb2YgdGhlIGlkZW50aWZpZXIgYEVS
Uk9SX1VOSEFORExFRF9FUlJPUmAsIHdoaWNoIGlzIG5vdCBkZWZpbmVkIGluIG5ldyB2ZXJzaW9u
cyBvZiBXaW5kb3dzIFNESzsKIC0gRml4ZWQgbm9uLWNsb3Npbmcgb2YgREJJIGRlc2NyaXB0b3Jz
IGZvciB0YWJsZXMgY3JlYXRlZCBpbiBuZXN0ZWQgdHJhbnNhY3Rpb25zIHdoZW4gc3VjaCB0cmFu
c2FjdGlvbnMgYXJlIGFib3J0ZWQ7CiAtIEZpeGVkIGV4dHJhIG1zeW5jL2ZzeW5jIG9wZXJhdGlv
bnMgZHVyaW5nIEdDIHJlY2xhaW1pbmcgaW4gYSBmdWxsIGRhdGFiYXNlOwogLSBGaXhlZCBzdWJv
cHRpbWFsIHJlZHVjaW5nL21lcmdpbmcgb2YgaGlzdG9ncmFtIGl0ZW1zIGluIGFuIG91dHB1dCBv
ZiB0aGUgYG1kYnhfY2hrYCB0b29sOwogLSBGaXhlZCBjdXJzb3IocykgZmluYWxpemF0aW9uIGFm
dGVyIG9uZXMgZXhwbGljaXRseSBjbG9zZWQgaW4gYSBuZXN0ZWQgdHJhbnNhY3Rpb25zOwogLSAx
NTkgZmlsZXMgY2hhbmdlZCwgMTkxMSBpbnNlcnRpb25zKCspLCA2NDIgZGVsZXRpb25zKC0pCgpC
cmllZmx5LCBzaW5jZSAwLjEzLjk6CiAtIFRoZSBvcmlnaW4gcmVwb3NpdG9yeSBoYXMgYmVlbiBt
b3ZlZCB0byBodHRwczovL3NvdXJjZWNyYWZ0LmRldi9kcWRrZmEvbGlibWRieCwgaXQgaXMgc3Rp
bGwgb3BlbiBhbmQgcHJvdmlkZWQgd2l0aCBmaXJzdC1jbGFzcyBmcmVlIHN1cHBvcnQ7CiAtIFRo
ZSBidWZmZXIgaW1wbGVtZW50YXRpb24gaGFzIGJlZW4gcmVmYWN0b3JlZCBhbmQgb3RoZXIgaW1w
cm92ZW1lbnRzIGhhdmUgYmVlbiBtYWRlIHRvIHRoZSBDKysgQVBJOwogLSBTZXZlcmFsIG1pbm9y
IHdhcm5pbmdzIGFuZCBidWdzIGhhdmUgYmVlbiBmaXhlZDsKIC0gRXhwYW5kZWQgdGhlIHNldCBv
ZiB0ZXN0czsKIC0gMjYgZmlsZXMgY2hhbmdlZCwgMTAzNyBpbnNlcnRpb25zKCspLCA5OTggZGVs
ZXRpb25zKC0pCgpCcmllZmx5LCBzaW5jZSAwLjEzLjg6CiAtIFN1cHBvcnQgb2YgSGFybW9ueSBP
UzsKIC0gZml4ZWQgYXNzZXJ0aW9uIChCTUkgPiAwKSBpbiBkZWJ1Z2dpbmcgYnVpbGRzIGZvciAz
Mi1iaXQgcGxhdGZvcm1zOwogLSBmaXhlZCByZWdyZXNzaW9uIG9mIERCIGdyb3d0aCAobm8gc2hy
aW5raW5nKSBhZnRlciB1c2luZyBmYWxsb2NhdGUoKSBmb3IgYFNJR0JVU2AgcHJldmVudGlvbjsK
IC0gd29ya2Fyb3VuZCB0byBhdm9pZCBgRUFHQUlOYCBvbiBBbmRyb2lkIGFmdGVyIGFuIGFwcGxp
Y2F0aW9uIHJlc3RhcnQ7CiAtIDI0IGZpbGVzIGNoYW5nZWQsIDI2MiBpbnNlcnRpb25zKCspLCAy
MjYgZGVsZXRpb25zKC0pCgpCcmllZmx5LCBzaW5jZSAwLjEzLjc6CiAtIGVuYWJsZWQgb2xkIExp
bnV4IGtlcm5lbHMgc3RhcnRpbmcgZnJvbSAzLjE2OwogLSBmaXhlZCB1bmV4cGVjdGVkIGBTSUdC
VVNgIGlzIG5vdCBlbm91Z2ggc3BhY2UgaW4gYSBmaWxlc3lzdGVtOwogLSBmaXhlZCBpbmFwcHJv
cHJpYXRlL2lycmVsZXZhbnQgYE1EQlhfV0FOTkFfUkVDT1ZFUllgIHdoZW4gdGhlIERCIHNpemUg
aXMgbm90IHJvdW5kZWQgdG8gc3lzLWFsbG9jYXRpb24tZ3JhbnVsYXJpdHkuCiAtIDkgZmlsZXMg
Y2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKRm9yIG1vcmUgaW5m
b3JtYXRpb24gcGxlYXNlIHNlZSBbQ2hhbmdlTG9nXShodHRwczovL3NvdXJjZWNyYWZ0LmRldi9k
cWRrZmEvbGlibWRieC9icm93c2UvQ2hhbmdlTG9nLm1kP3Jldj1zdGFibGUpIGluIHRoZSBgc3Rh
YmxlYCBicmFuY2guCgpTaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVv
bmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+Ci0tLQogcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5p
biAgICB8IDQgKysrLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDQgKystLQogcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9D
b25maWcuaW4gYi9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCmluZGV4IGE5YTRhYzQ1YzUuLjFj
NGJjMTllNTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4KKysrIGIvcGFj
a2FnZS9saWJtZGJ4L0NvbmZpZy5pbgpAQCAtMTEsNyArMTEsOSBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfTElCTURCWAogCSAgc29sdXRpb25zLgogCiAJICBsaWJtZGJ4IHN1cnBhc3NlcyB0aGUgbGVn
ZW5kYXJ5IExNREIgaW4gdGVybXMgb2YKLQkgIHJlbGlhYmlsaXR5LCBmZWF0dXJlcyBhbmQgcGVy
Zm9ybWFuY2UuCisJICByZWxpYWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlLiBBdCB0
aGUgZW5kIG9mIDIwMjQKKwkgIGxpYm1kYnggd2FzIGNob3NlbiBieSBhbGwgbW9kZXJuIEV0aGVy
ZXVtIG5vZGVzCisJICBhcyBhIHN0b3JhZ2UgZW5naW5lLgogCiAJICBodHRwczovL2xpYm1kYngu
ZHFka2ZhLnJ1CiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggYi9w
YWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCmluZGV4IGFlNTI2NjcxNmIuLmI1ODRhNDcyZTUg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKKysrIGIvcGFja2FnZS9s
aWJtZGJ4L2xpYm1kYnguaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgSGFzaGVzIGZyb206IGh0dHBz
Oi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1zaGEyNTYgIDU3ZGI5ODdk
ZTZmN2NjYzY2YTY2YWUyOGE3YmRhOWY5ZmJiNDhhYzVmYjkyNzliY2NhOTJmZDVkZTEzMDc1ZDEg
IGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMy42LnRhci54egorc2hhMjU2ICAwYjNjODYxMzExNDdj
NGUyMzE2NGZiYmRhMDNjMTIwZmRlMzZlYjRmMzg4OTZkZmE5ZWY2YWJjODhmNzVmOWMzICBsaWJt
ZGJ4LWFtYWxnYW1hdGVkLTAuMTMuMTEudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBz
aGEyNTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4
N2UxMWI5MzhlOTQ1OTQgIExJQ0VOU0UKLXNoYTI1NiAgNjUxZjcxYjQ2YzZiYjAwNDZkMjEyMmRm
N2Y5ZGVmOWNiMjRmNGRjMjhjNWIxMWNlZjA1OWY2NjU2NWNkYTMwZiAgTk9USUNFCitzaGEyNTYg
IDE1OTZlMmRiNDEyNDgyOGZlNDZhOGFkMzU2ZDVlYjAzZDgwZmYxNWZmZTkzYmM0ODkxYTM4M2Y4
MDJlZjBjNDggIE5PVElDRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsg
Yi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCBmNDYxZDk4Mzk3Li4yZWM5N2NlM2Fi
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5taworKysgYi9wYWNrYWdlL2xp
Ym1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTMuNgorTElCTURCWF9WRVJTSU9OID0gMC4xMy4x
MQogTElCTURCWF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJTSU9O
KS50YXIueHoKIExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFz
ZQogTElCTURCWF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwotLSAKMi41Mi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
